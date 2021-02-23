ecs_post_simple_apis <- c(
    "RegisterTaskDefinition",
    "DeregisterTaskDefinition",
    "DescribeTaskDefinition",
    "CreateCluster",
    "DeleteCluster",
    "RunTask",
    "StopTask",
    "DescribeTasks"
)

ecs_post_list_apis <- list(
    ListTaskDefinitions = "unlist(response[[\"taskDefinitionArns\"]])",
    ListClusters = "unlist(response[[\"clusterArns\"]])",
    ListTasks = "unlist(response[[\"taskArns\"]])"
)

generate_ecs_apis <- function(){
    file_name <- "R/ecs-actions.R"
    rd_name <- "AWS_APIs"
    if(file.exists(file_name)){
        file.remove(file_name)
    }
    code <- c()
    for(i in ecs_post_simple_apis){
        code <- c(code,
                  generate_ecs_simple_api(i, rd_name))
    }
    for(i in names(ecs_post_list_apis)){
        code <- c(code,
                  generate_ecs_list_api(i,
                                        ecs_post_list_apis[[i]],
                                        rd_name))
    }
    code <- paste0(code, collapse = "\n\n")
    output_to_file(code, file_name)

}

generate_ecs_simple_api <- function(target, rd_name){
    template <- get_api_template("ecs_simple_template.R")
    replace_ecs_template(template, target, rd_name)
}

generate_ecs_list_api <- function(target, result_getter, rd_name){
    template <- get_api_template("ecs_list_template.R")
    template <- replace_ecs_template(template, target, rd_name)
    template <- gsub("%result_getter%", result_getter, template, fixed = TRUE)
    template
}
