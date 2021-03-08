ec2_api_version <- "2016-11-15"
ecs_service_id <- "AmazonEC2ContainerServiceV20141113"

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
    user_interrupt_msg <- "Operation was aborted by an application callback"
    if(is(response, "interrupt")||identical(response$message, user_interrupt_msg)){
      stop(user_interrupt_msg)
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

# ec2_request("DescribeVpcs",list(`Filter.1.tag`="vpc-0519332012da051c3"))
# action <- "DescribeVpcs"
# parameters <- list(`Filter.1.Name`="vpc-id",`Filter.1.Value`="vpc-aaa")
ec2_request <- function(action, parameters = list()){
  if(is.null(parameters) || length(parameters)==0){
    query <- list()
  }else{
    if(is.character(parameters)){
      query <- fromJSON(parameters, simplify = FALSE)
    }else{
      query <- parameters
    }
  }
  query$Action = action
  query$Version <- ec2_api_version
  response <- aws_request(method = "GET",
                          service = "ec2",
                          query = query)
  text_response <- gsub("\n\\s*", "", httr::content(response, "text", encoding = "UTF-8"))
  if (httr::http_error(response)) {
    x <- try(xml2::as_list(xml2::read_xml(text_response)), silent = TRUE)
    if(!is.null(x$Response$Errors$Error)){
      msg <- paste0(x$Response$Errors$Error$Code,"\nMessage: ",x$Response$Errors$Error$Message)
    }else{
      msg <- paste0(x, collapse = "\n")
    }
    stop(msg, call. = FALSE)
  } else {
    x <- try(xml2::as_list(xml2::read_xml(text_response)), silent = TRUE)
    if (inherits(x, "try-error")) {
      stop("Fail to convert the response to a list object")
    }
  }
  x[[1]]
}

# action <- "ListClusters"
# parameters <- NULL
ecs_request <- function(action, parameters = list()){
  if(is.null(parameters)||length(parameters)==0){
    body = "{}"
  }else{
    if(!is.character(parameters)){
      body <- toJSON(parameters)
    }else{
      body <- parameters
    }
  }
  amz_target <- paste0(ecs_service_id, ".", action)
  headers <- list(
    `Content-Type` = "application/x-amz-json-1.1",
    `X-Amz-Target` = amz_target
  )
  response <- aws_request(method = "POST",
                       service = "ecs",
                       headers=headers,
                       body=body)
  if(httr::http_error(response)){
    msg <-  content(response, type = "application/json", encoding  = "UTF-8")
    if(!is.null(msg$`__type`)&&!is.null(msg$message))
      msg <- paste0(msg$`__type`,"\nMessage: ",msg$message)
    stop(msg)
  }
  content(response, type = "application/json", encoding  = "UTF-8")
}

# query$Action = "DescribeVpcs"
# query$Version <- ec2_api_version

aws_request <- function(method = c("POST","GET"),
                     service = "ecs",
                     query = list(),
                     headers = c(),
                     body = ""){
  method <- match.arg(method)
  region <- aws_get_region()
  host <- paste0(service, ".", region,".amazonaws.com")
  url <- paste0("https://",host)
  datetime <- format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC")
  sig <- aws.signature::signature_v4_auth(
    datetime = datetime,
    region = region,
    verb = method, service = service, action = "/",
    request_body = body,
    key = aws_get_access_key_id(),
    secret = aws_get_secret_access_key(),
    query_args = query,
    canonical_headers = c(
      Host = host,
      `X-Amz-Date` = datetime,
      headers
    )
  )
  ## get the function that can send the rest request
  rest_func <- get(paste0(method,"_EX"))

  # browser()
  response <- rest_func(
    url,
    add_headers(
      `X-Amz-Date` = datetime,
      Authorization= sig$SignatureHeader,
      .headers = unlist(headers)
    ),
    body = sig$Body,
    query = query
  )
  if(is.null(response)){
    stop("Fail to connect to the server")
  }
  response
}

