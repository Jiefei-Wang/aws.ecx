#' @importFrom rjson fromJSON toJSON
#' @importFrom aws.signature locate_credentials signature_v4_auth
#' @importFrom httr POST GET http_error add_headers content timeout
#' @import xml2
NULL


.onLoad <- function(libname, pkgname){
    aws_set_credentials()
}
