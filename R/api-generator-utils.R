get_api_template <- function(file_name){
    file_path <- file.path("R","template",file_name)
    readChar(file_path, file.info(file_path)$size)
}

generate_apis <- function(){
    devtools::load_all(".")
    generate_ec2_apis()
    generate_ecs_apis()
    devtools::document()
    devtools::load_all(".")
}


replace_template <- function(template, func_prefix ,ecx_func, token, target, rd_name){
    function_name <- paste0(func_prefix, pascal_to_camel(target))
    template <- gsub("`ecx_func`", ecx_func, template, fixed = TRUE)
    template <- gsub("`rd_name`", rd_name, template, fixed = TRUE)
    template <- gsub("`function_name`", function_name, template, fixed = TRUE)
    template <- gsub("`target`", target, template, fixed = TRUE)
    template <- gsub("`NextToken`", token, template, fixed = TRUE)
    template
}
replace_ecs_template<-function(template, target, rd_name){
    replace_template(template, "ecs_" ,"ecs_post", "nextToken", target, rd_name)
}
replace_ec2_template<-function(template, target, rd_name){
    replace_template(template, "ec2_" , "ec2_get", "NextToken", target, rd_name)
}


output_to_file <- function(content, file_path){
    write(content,file=file_path,append=TRUE)
}

pascal_to_camel <- function(x) {
    tolower(
        gsub("([a-z0-9])([A-Z])",
             "\\1_\\2",
             gsub("(.)([A-Z][a-z]+)", "\\1_\\2", x))
    )
}

get_yaml_path <- function(service){
    filePath <- paste0("R/openapi/",service,".yaml")
    filePath
}

get_aws_api <- function(service){
    filePath <- get_yaml_path(service)
    api <- suppressWarnings(get_api(filePath))
    api
}



