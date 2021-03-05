get_yaml_path <- function(service){
    filePath <- paste0("R/api-generator/openapi/",service,".yaml")
    filePath
}

get_aws_api <- function(service){
    filePath <- get_yaml_path(service)
    api <- suppressWarnings(rapiclient::get_api(filePath))
    api
}

get_template <- function(){
    path <- "R/api-generator/template/template.R"
    readChar(path, file.info(path)$size)
}
