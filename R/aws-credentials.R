aws_credentials <- new.env()
aws_credentials$access_key_id <- NULL
aws_credentials$secret_access_key <- NULL
aws_credentials$region <- NULL

#' Set or get AWS credentials
#'
#' Set or get AWS credentials. This function will be called by the package
#' when loaded.
#'
#' @param key_file The csv credential file that is downloaded from AWS
#' @param access_key_id An AWS Access Key ID
#' @param secret_access_key An AWS Secret Access Key
#' @param region A character string containing the AWS region for the request.
#' If missing, "us-east-1" is assumed.
#' @param profile A character string specifying which profile to use from the
#' file. By default, the profile named in `AWS_PROFILE` is used, otherwise the
#' "default" profile is used.
#'
#' @details
#' The function `aws_set_credentials` uses `aws.signature::locate_credentials`
#' internally to determine your credentials. There are a variety of ways to find
#' the credentials, the most common methods are(sorted by the search order)
#'
#' 1. user-supplied values passed to the function
#'
#' 2. environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`,
#' `AWS_DEFAULT_REGION`, and `AWS_SESSION_TOKEN`)
#'
#' 3. a profile in a local credentials dot file in the current working directory,
#' using the profile specified by `AWS_PROFILE`
#'
#' 4. a profile in a global credentials dot file in a location set by
#' `AWS_SHARED_CREDENTIALS_FILE` or defaulting typically to "`~/.aws/credentials`"
#'  (or another OS-specific location), using the profile specified by `AWS_PROFILE`
#'
#' @return
#' `aws_set_credentials` : A list containing credentials(with asterisk) and region.
#'
#' `aws_get_credentials` : A list containing credentials(with asterisk) and region.
#'
#' `aws_get_access_key_id` : The access key id
#'
#' `aws_get_secret_access_key` : The secret access key
#'
#' `aws_get_region` : The region
#'
#' `aws_set_access_key_id` : NULL
#'
#' `aws_set_secret_access_key` : NULL
#'
#' `aws_set_region` : The old region
#'
#' `aws_list_regions`: A vector of available regions
#' @examples
#' ## Get your credentials from the environment variables or AWS cli
#' aws_set_credentials()
#'
#' ## show your current credentials
#' aws_get_credentials()
#' @rdname credentials
#' @export
aws_set_credentials<-function(key_file=NULL,
                              access_key_id=NULL, secret_access_key=NULL, region = NULL,
                              profile = NULL){
  if(!is.null(key_file)){
    key_file_content<- read.csv(key_file)
    if(!is.null(key_file_content$Access.key.ID)&&
       is.null(access_key_id)){
      access_key_id <- key_file_content$Access.key.ID
    }
    if(!is.null(key_file_content$Secret.access.key)&&
       is.null(secret_access_key)){
      secret_access_key <- key_file_content$Secret.access.key
    }
  }
  credentials <- aws.signature::locate_credentials(key = access_key_id,
                                                   secret = secret_access_key,
                                                   region=region,
                                                   profile=profile)
  if(!is.null(credentials$key)&&!is.null(credentials$secret)){
    aws_credentials$access_key_id <- credentials$key
    aws_credentials$secret_access_key <- credentials$secret
  }
  if(!is.null(credentials$region)){
    aws_credentials$region <- credentials$region
  }
  aws_get_credentials()
}
#' @rdname credentials
#' @export
aws_get_credentials <- function(){
  out_access_key_id <- aws_credentials$access_key_id
  out_secret_access_key <- aws_credentials$secret_access_key
  out_access_key_id <- add_asterisk_in_middle(out_access_key_id,2,4)
  out_secret_access_key <- add_asterisk_in_middle(out_secret_access_key,2,4)

  list(
    access_key_id = out_access_key_id,
    secret_access_key = out_secret_access_key,
    region = aws_credentials$region
  )
}
#' @rdname credentials
#' @export
aws_get_access_key_id <- function(){
  aws_credentials$access_key_id
}
#' @rdname credentials
#' @export
aws_get_secret_access_key <- function(){
  aws_credentials$secret_access_key
}
#' @rdname credentials
#' @export
aws_get_region<-function(){
  aws_credentials$region
}
#' @rdname credentials
#' @export
aws_set_access_key_id <- function(access_key_id){
  aws_credentials$access_key_id <- access_key_id
  invisible(NULL)
}
#' @rdname credentials
#' @export
aws_set_secret_access_key <- function(secret_access_key){
  aws_credentials$secret_access_key <- secret_access_key
  invisible(NULL)
}
#' @rdname credentials
#' @export
aws_set_region<-function(region){
  old_value <- aws_credentials$region
  aws_credentials$region <- region
  old_value
}
#' @rdname credentials
#' @export
aws_list_regions <- function(){
c("us-east-1",
  "us-east-2",
  "us-west-1",
  "us-west-2",
  "us-gov-west-1",
  "us-gov-east-1",
  "ca-central-1",
  "eu-north-1",
  "eu-west-1",
  "eu-west-2",
  "eu-west-3",
  "eu-central-1",
  "eu-south-1",
  "af-south-1",
  "ap-northeast-1",
  "ap-northeast-2",
  "ap-northeast-3",
  "ap-southeast-1",
  "ap-southeast-2",
  "ap-east-1",
  "ap-south-1",
  "sa-east-1",
  "me-south-1"
  )
}
aws_has_credentials <- function(){
  !is.null(aws_get_access_key_id()) && !is.null(aws_get_secret_access_key())
}
