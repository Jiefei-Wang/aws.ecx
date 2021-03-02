source("R/api-generator/generator-utils.R")
excluded_params <- c("Action", "Version", "X-Amz-Target")
token_params <- c("nextToken", "NextToken")

ec2_api <- get_aws_api("ec2")
operation_def <- rapiclient::get_operation_definitions(ec2_api)
# operation_def$GET_DescribeVpcs

ec2_names <-  names(operation_def)
ec2_names <- ec2_names[startsWith(ec2_names,"GET_")]
ec2_names <- substring(ec2_names, 5)

# i <- "DescribeVpcs"
# func_prefix <- "ec2_"
code <- c()
for(i in ec2_names){
    message(which(ec2_names==i))
    idx <- paste0("GET_", i)
    action_def <- operation_def[[idx]]
    param_table <- get_parameter_table(action_def$parameters)
    document <- generate_document(action_def, param_table)
    action_name <- action_def$`x-aws-operation-name`
    function_code <- generate_function("ec2",action = action_name, param_table = param_table)
    code[i] <- paste0(document,"\n",function_code)
}
code <- paste0(code, collapse = "\n\n")
file_name <- "R/ec2-actions.R"
output_to_file(code, file_name)
formatR::tidy_file(file_name)
devtools::document()


ecs_api <- get_aws_api("ecs")
operation_def <- get_operation_definitions(ecs_api)
