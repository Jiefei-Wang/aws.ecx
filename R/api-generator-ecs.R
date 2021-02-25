ecs_apis <- c(
    "CreateCapacityProvider",
    "CreateCluster",
    "CreateService",
    "CreateTaskSet",
    "DeleteAccountSetting",
    "DeleteAttributes",
    "DeleteCapacityProvider",
    "DeleteCluster",
    "DeleteService",
    "DeleteTaskSet",
    "DeregisterContainerInstance",
    "DeregisterTaskDefinition",
    "DescribeClusters",
    "DescribeContainerInstances",
    "DescribeServices",
    "DescribeTaskDefinition",
    "DescribeTasks",
    "DescribeTaskSets",
    "DiscoverPollEndpoint",
    "ListTagsForResource",
    "PutAccountSetting",
    "PutAccountSettingDefault",
    "PutAttributes",
    "PutClusterCapacityProviders",
    "RegisterContainerInstance",
    "RegisterTaskDefinition",
    "RunTask",
    "StartTask",
    "StopTask",
    "SubmitAttachmentStateChanges",
    "SubmitContainerStateChange",
    "SubmitTaskStateChange",
    "TagResource",
    "UntagResource",
    "UpdateCapacityProvider",
    "UpdateClusterSettings",
    "UpdateContainerAgent",
    "UpdateContainerInstancesState",
    "UpdateService",
    "UpdateServicePrimaryTaskSet",
    "UpdateTaskSet"
    )

ecs_apis_with_simplify <- list(
    DescribeCapacityProviders = "response[[\"capacityProviders\"]]",
    ListAccountSettings = "response[[\"settings\"]]",
    ListAttributes = "response[[\"attributes\"]]",
    ListClusters = "unlist(response[[\"clusterArns\"]])",
    ListContainerInstances = "unlist(response[[\"containerInstanceArns\"]])",
    ListServices = "unlist(response[[\"serviceArns\"]])",
    ListTaskDefinitionFamilies = "unlist(response[[\"families\"]])",
    ListTaskDefinitions = "unlist(response[[\"taskDefinitionArns\"]])",
    ListTasks = "unlist(response[[\"taskArns\"]])"
)

generate_ecs_apis <- function(){
    file_name <- "R/ecs-actions.R"
    rd_name <- "AWS_APIs"
    if(file.exists(file_name)){
        file.remove(file_name)
    }
    code <- c()
    for(i in ecs_apis){
        code <- c(code,
                  generate_ecs_simple_api(i, rd_name))
    }
    for(i in names(ecs_apis_with_simplify)){
        code <- c(code,
                  generate_ecs_list_api(i,
                                        ecs_apis_with_simplify[[i]],
                                        rd_name))
    }
    code <- paste0(code, collapse = "\n\n")
    output_to_file(code, file_name)

}


generate_ecs_simple_api <- function(target, rd_name){
    template <- get_api_template("ecx_template.R")
    replace_ecs_template(template, target, rd_name)
}

generate_ecs_list_api <- function(target, result_getter, rd_name){
    template <- get_api_template("ecx_template_with_simplify.R")
    template <- replace_ecs_template(template, target, rd_name)
    template <- gsub("`result_getter`", result_getter, template, fixed = TRUE)
    template
}
