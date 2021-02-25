retry_on_error <- function(func, ..., n_try){
  for(i in seq_len(n_try)){
    response <- NULL
    response <- tryCatch(
      func(...),
      error = function(e) e
    )
    ## If the response is NULL, it means
    ## the user sends a stop signal
    if(is.null(response)){
      break
    }
    if(!is(response, "error")){
      return(response)
    }
    if(package_setting$print_on_error)
      cat("REST request failed with the message:\n",
          response$message,"\n")
  }
  NULL
}

GET_EX <- function(..., n_try = 3){
  retry_on_error(func = httr::GET, ..., n_try=package_setting$retry_time,
                 timeout(package_setting$network_timeout))
}
POST_EX <- function(..., n_try = 3){
  retry_on_error(func = httr::POST, ..., n_try=package_setting$retry_time,
                 timeout(package_setting$network_timeout))
}



ecs_post<-function(action, query = list(), headers=c()){
  if(is.null(query)||length(query)==0){
    body = "{}"
  }else{
    if(!is.character(query)){
      body <- toJSON(query)
    }else{
      body <- query
    }
  }
  ecs_REST_request(method= "POST", target=action,
                   headers=headers,
                   body=body)
}

ec2_get <- function(action, query = list(), headers = list()) {
  if(is.null(query) || length(query)==0){
    query <- list()
  }else{
    if(is.character(query)){
      query <- fromJSON(query, simplify = FALSE)
    }
  }
  ec2_get_request(action = action,
                  query = query,
                  headers = headers)
}


SERVICE_ID <- "AmazonEC2ContainerServiceV20141113"

ecs_REST_request <-function(method, target, headers, body){
  service= "ecs"
  region <- aws_get_region()
  host <- paste0(service, ".", region,".amazonaws.com")
  url <- paste0("https://", host)
  amz_target <- paste0(SERVICE_ID, ".", target)
  datetime <- format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC")
  sig <- aws.signature::signature_v4_auth(
    datetime = datetime,
    region = region,
    verb = method, service = service, action = "/",
    request_body = body,
    key = aws_get_access_key_id(),
    secret = aws_get_secret_access_key(),
    canonical_headers = c(
      Host = host,
      `Content-Type` = "application/x-amz-json-1.1",
      `X-Amz-Target` = amz_target,
      `X-Amz-Date` = datetime,
      headers
    )
  )
  response <- POST_EX(
    url,
    add_headers(
      `Content-Type` = "application/x-amz-json-1.1",
      `X-Amz-Date` = datetime,
      `X-Amz-Target` = amz_target,
      Authorization= sig$SignatureHeader,
      .headers = as.character(headers)
    ),
    body = sig$Body
  )
  if(is.null(response)){
    Stop("Fail to connect to the server")
  }
  if(httr::http_error(response)){
    stop(content(response, type = "text"))
  }
  #stop_for_status(response)
  content(response, type = "application/json")
}




ec2_api_version = "2016-11-15"
## Code from: https://github.com/cloudyr/aws.ec2/blob/master/R/ec2HTTP.R
ec2_get_request <-
  function(
    action,
    query = list(),
    headers = list()
  ) {
    region <- aws_get_region()
    query$Action = action
    query$Version <- ec2_api_version
    url <- paste0("https://ec2.", region, ".amazonaws.com")
    datetime <- format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC")
    Sig <- aws.signature::signature_v4_auth(
      datetime = datetime,
      region = region,
      service = "ec2",
      verb = "GET",
      action = "/",
      query_args = query,
      canonical_headers = list(
        host = paste0("ec2.", region, ".amazonaws.com"),
        `X-Amz-Date` = datetime
      ),
      request_body = "",
      key = aws_get_access_key_id(),
      secret = aws_get_secret_access_key())
    headers[["x-amz-date"]] <- datetime
    headers[["Authorization"]] <- Sig$SignatureHeader
    H <- do.call(httr::add_headers, headers)

    # execute request
    if (length(query)) {
      r <- GET_EX(url, H, query = query)
    } else {
      r <- GET_EX(url, H)
    }
    if(is.null(r)){
      Stop("Fail to connect to the server")
    }
    if (httr::http_error(r)) {
      tmp <- gsub("\n\\s*", "", httr::content(r, "text", encoding = "UTF-8"))
      x <- try(xml2::as_list(xml2::read_xml(tmp)), silent = TRUE)
      if(!is.null(x$Response$Errors$Error)){
        msg <- paste0(x$Response$Errors$Error$Code,"\nMessage: ",x$Response$Errors$Error$Message)
      }else{
        msg <- paste0(x, collapse = "\n")
      }
      stop(msg, call. = FALSE)
    } else {
      tmp <- gsub("\n\\s*", "", httr::content(r, "text", encoding = "UTF-8"))
      out <- try(xml2::as_list(xml2::read_xml(tmp)), silent = TRUE)
      if (inherits(out, "try-error")) {
        out <- structure(httr::content(r, "text", encoding = "UTF-8"))
      }
    }
    out <- out[[1]]
    return(out)
  }
