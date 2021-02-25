#' @rdname AWS_APIs
#' @export
ecs_create_capacity_provider<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "CreateCapacityProvider", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_create_cluster<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "CreateCluster", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_create_service<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "CreateService", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_create_task_set<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "CreateTaskSet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_account_setting<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteAccountSetting", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_attributes<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteAttributes", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_capacity_provider<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteCapacityProvider", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_cluster<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteCluster", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_service<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteService", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_delete_task_set<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeleteTaskSet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_deregister_container_instance<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeregisterContainerInstance", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_deregister_task_definition<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DeregisterTaskDefinition", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_clusters<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeClusters", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_container_instances<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeContainerInstances", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_services<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeServices", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_task_definition<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeTaskDefinition", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_tasks<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeTasks", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_task_sets<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeTaskSets", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_discover_poll_endpoint<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "DiscoverPollEndpoint", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_list_tags_for_resource<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListTagsForResource", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_put_account_setting<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "PutAccountSetting", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_put_account_setting_default<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "PutAccountSettingDefault", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_put_attributes<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "PutAttributes", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_put_cluster_capacity_providers<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "PutClusterCapacityProviders", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_register_container_instance<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "RegisterContainerInstance", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_register_task_definition<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "RegisterTaskDefinition", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_run_task<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "RunTask", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_start_task<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "StartTask", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_stop_task<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "StopTask", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_submit_attachment_state_changes<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "SubmitAttachmentStateChanges", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_submit_container_state_change<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "SubmitContainerStateChange", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_submit_task_state_change<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "SubmitTaskStateChange", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_tag_resource<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "TagResource", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_untag_resource<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UntagResource", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_capacity_provider<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateCapacityProvider", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_cluster_settings<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateClusterSettings", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_container_agent<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateContainerAgent", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_container_instances_state<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateContainerInstancesState", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_service<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateService", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_service_primary_task_set<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateServicePrimaryTaskSet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_update_task_set<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ecs_post(action = "UpdateTaskSet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ecs_describe_capacity_providers<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "DescribeCapacityProviders", query = json)
    if(simplify){
        result <- unlist(response[["capacityProviders"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["capacityProviders"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_account_settings<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListAccountSettings", query = json)
    if(simplify){
        result <- unlist(response[["settings"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["settings"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_attributes<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListAttributes", query = json)
    if(simplify){
        result <- unlist(response[["attributes"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["attributes"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_clusters<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListClusters", query = json)
    if(simplify){
        result <- unlist(response[["clusterArns"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["clusterArns"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_container_instances<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListContainerInstances", query = json)
    if(simplify){
        result <- unlist(response[["containerInstanceArns"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["containerInstanceArns"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_services<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListServices", query = json)
    if(simplify){
        result <- unlist(response[["serviceArns"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["serviceArns"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_task_definition_families<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListTaskDefinitionFamilies", query = json)
    if(simplify){
        result <- unlist(response[["families"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["families"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_task_definitions<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListTaskDefinitions", query = json)
    if(simplify){
        result <- unlist(response[["taskDefinitionArns"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["taskDefinitionArns"]])
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ecs_list_tasks<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ecs_post(action = "ListTasks", query = json)
    if(simplify){
        result <- unlist(response[["taskArns"]])
        while(!is.null(response$nextToken)){
            query$nextToken <- response$nextToken
            response <- ecs_post(action = action, query = query)
            result <- c(
                result,
                unlist(response[["taskArns"]])
            )
        }
    }else{
        result <- response
    }
    result
}

