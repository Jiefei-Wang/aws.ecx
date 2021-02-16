generate_apis <- function(){
    generate_ec2_apis()
    generate_ecs_apis()
}


replace_template <- function(template, func_prefix, target, rd_name){
    function_name <- paste0(func_prefix, pascal_to_camel(target))
    template <- gsub("%rd_name%", rd_name, template, fixed = TRUE)
    template <- gsub("%function_name%", function_name, template, fixed = TRUE)
    template <- gsub("%target%", target, template, fixed = TRUE)
    template
}
replace_ecs_template<-function(template, target, rd_name){
    replace_template(template, "ecs_", target, rd_name)
}
replace_ec2_template<-function(template, target, rd_name){
    replace_template(template, "ec2_", target, rd_name)
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
