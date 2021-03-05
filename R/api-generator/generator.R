library(rapiclient)
library(whisker)
library(rmarkdown)
source("R/api-generator/generator-utils.R")
source("R/api-generator/file-readers.R")
source("R/api-generator/type-definitions.R")
######################################################
## EC2
######################################################
ec2_api <- get_aws_api("ec2")
ec2_definitions <- rapiclient::get_operation_definitions(ec2_api)

ec2_names <-  names(ec2_definitions)
ec2_names <- ec2_names[startsWith(ec2_names,"GET_")]
ec2_definitions <- ec2_definitions[ec2_names]
ec2_names <- substring(ec2_names, 5)


# ec2_definitions$GET_DescribeVpcs
# i <- "DescribeVpcs"
# func_prefix <- "ec2_"
api_info_list <- list()
## get the api info
for(i in seq_along(ec2_definitions)){
    message(i)
    api_definition <- ec2_definitions[[i]]
    api_info <- api_template
    ## Gather the api info from its defintion
    api_info$name <- api_definition$`x-aws-operation-name`
    api_info$parameters <- generate_parameter_table(api_definition$parameters)
    api_info$description <- api_definition$description
    api_info_list[[i]] <- api_info
}
api_info_list1 <- to_markdown(api_info_list)
## Generate function and document
for(i in seq_along(api_info_list1)){
    message(i)
    api_info <- api_info_list1[[i]]
    api_info$document <- generate_document(api_info)
    api_info$definition <-
        generate_function("ec2", api_info)
    api_info_list1[[i]] <- api_info
}

file_name <- "R/ec2-actions.R"
write_apis_to_file(api_info_list1, file_name)
formatR::tidy_file(file_name)
# devtools::document()

######################################################
## ECS
######################################################
ecs_api <- get_aws_api("ecs")
ecs_defintions <- get_operation_definitions(ecs_api)

ecs_names <-  names(ecs_defintions)

# ec2_definitions$GET_DescribeVpcs
# i <- "ListTaskDefinitions"
# func_prefix <- "ec2_"
api_info_list <- list()
## get the api info
for(i in seq_along(ecs_defintions)){
    message(i)
    api_definition <- ecs_defintions[[i]]
    api_info <- api_template
    ## Gather the api info from its defintion
    api_info$name <- api_definition$operationId
    api_info$parameters <- generate_parameter_table(api_definition$parameters)
    api_info$description <- api_definition$description
    api_info_list[[i]] <- api_info
}
api_info_list1 <- to_markdown(api_info_list)
## Generate function and document
for(i in seq_along(api_info_list1)){
    message(i)
    api_info <- api_info_list1[[i]]
    api_info$document <- generate_document(api_info)
    api_info$definition <-
        generate_function("ecs", api_info)
    api_info_list1[[i]] <- api_info
}

file_name <- "R/ecs-actions.R"
write_apis_to_file(api_info_list1, file_name)
formatR::tidy_file(file_name)
devtools::document()
