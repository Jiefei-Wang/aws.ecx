get_yaml_path <- function(service){
    filePath <- paste0("R/api-generator/openapi/",service,".yaml")
    filePath
}

get_aws_api <- function(service){
    filePath <- get_yaml_path(service)
    api <- suppressWarnings(rapiclient::get_api(filePath))
    api
}

get_template <- function(has_token = FALSE){
    base_path <- "R/api-generator/template/"
    if(has_token){
        path <- paste0(base_path,"template_with_token.R")
    }else{
        path <- paste0(base_path,"template_without_token.R")
    }
    readChar(path, file.info(path)$size)
}
