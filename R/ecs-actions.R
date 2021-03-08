#' Create Capacity Provider
#' 
#' Creates a new capacity provider. Capacity providers are associated with
#' an Amazon ECS cluster and are used in capacity provider strategies to
#' facilitate cluster auto scaling.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_create_capacity_provider <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "CreateCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Create Cluster
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_create_cluster <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "CreateCluster", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Create Service
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_create_service <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "CreateService", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Create Task Set
#' 
#' Create a task set in the specified cluster and
#' service. This is used when a service uses the `EXTERNAL` deployment
#' controller type. For more information, see [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_create_task_set <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "CreateTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Account Setting
#' 
#' Disables an account setting for a specified
#' IAM user, IAM role, or the root user for an
#' account.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_account_setting <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteAccountSetting", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Attributes
#' 
#' Deletes one or more custom attributes from
#' an Amazon ECS resource.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_attributes <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteAttributes", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Capacity Provider
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_capacity_provider <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Cluster
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_cluster <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteCluster", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Service
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_service <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteService", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Delete Task Set
#' 
#' Deletes a specified task set within a service. This
#' is used when a service uses the `EXTERNAL` deployment controller type.
#' For more information, see [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_delete_task_set <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Deregister Container Instance
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_deregister_container_instance <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeregisterContainerInstance", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Deregister Task Definition
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_deregister_task_definition <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DeregisterTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Capacity Providers
#' 
#' Describes one or more of your capacity
#' providers.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_capacity_providers <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeCapacityProviders", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Clusters
#' 
#' Describes one or more of your
#' clusters.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_clusters <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeClusters", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Container Instances
#' 
#' Describes Amazon Elastic Container Service
#' container instances. Returns metadata about registered and remaining
#' resources on each container instance
#' requested.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_container_instances <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeContainerInstances", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Services
#' 
#' Describes the specified services running
#' in your cluster.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_services <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeServices", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Task Definition
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_task_definition <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Task Sets
#' 
#' Describes the task sets in the specified cluster
#' and service. This is used when a service uses the `EXTERNAL` deployment
#' controller type. For more information, see [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_task_sets <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTaskSets", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Describe Tasks
#' 
#' Describes a specified task or
#' tasks.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_tasks <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTasks", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Discover Poll Endpoint
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_discover_poll_endpoint <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "DiscoverPollEndpoint", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' List Account Settings
#' 
#' Lists the account settings for a specified
#' principal.
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination limit
#' @return A list object or a character vector
#' @export
ecs_list_account_settings <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListAccountSettings", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Attributes
#' 
#' Lists the attributes for Amazon ECS
#' resources within a specified target type and cluster. When you specify a
#' target type and cluster, `ListAttributes` returns a list of attribute
#' objects, one for each attribute on each resource. You can filter the
#' list of results to a single attribute name to only return results that
#' have that name. You can also filter the results by attribute name and
#' value, for example, to see which container instances in a cluster are
#' running a Linux AMI (`ecs.os-type=linux`). 
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_attributes <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListAttributes", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Clusters
#' 
#' Returns
#' a list of existing clusters.
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_clusters <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListClusters", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Container Instances
#' 
#' Returns a list of
#' container instances in a specified cluster. You can filter the results
#' of a `ListContainerInstances` operation with cluster query language
#' statements inside the `filter` parameter. For more information, see
#' [Cluster Query
#' Language](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_container_instances <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, 
    others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListContainerInstances", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Services
#' 
#' Lists the services that are running in a
#' specified cluster.
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_services <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListServices", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Tags For Resource
#' 
#' List the tags for an Amazon ECS
#' resource.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_list_tags_for_resource <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListTagsForResource", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' List Task Definition Families
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_task_definition_families <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, 
    others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListTaskDefinitionFamilies", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Task Definitions
#' 
#' Returns a list of task definitions that are
#' registered to your account. You can filter the results by family name
#' with the `familyPrefix` parameter or by status with the `status`
#' parameter.
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_task_definitions <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListTaskDefinitions", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' List Tasks
#' 
#' @param maxResults String. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_tasks <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list()) {
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "ListTasks", parameters = parameters, 
        simplify = simplify, token_name = "nextToken")
}


#' Put Account Setting
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_put_account_setting <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "PutAccountSetting", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Put Account Setting Default
#' 
#' Modifies an account setting for all IAM users on an
#' account for whom no individual account setting has been specified.
#' Account settings are set on a per-Region
#' basis.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_put_account_setting_default <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "PutAccountSettingDefault", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Put Attributes
#' 
#' Create or update an attribute on an Amazon
#' ECS resource. If the attribute does not exist, it is created. If the
#' attribute exists, its value is replaced with the specified value. To
#' delete an attribute, use DeleteAttributes. For more information, see
#' [Attributes](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_put_attributes <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "PutAttributes", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Put Cluster Capacity Providers
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_put_cluster_capacity_providers <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "PutClusterCapacityProviders", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Register Container Instance
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_register_container_instance <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "RegisterContainerInstance", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Register Task Definition
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_register_task_definition <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "RegisterTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Run Task
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_run_task <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "RunTask", parameters = parameters, simplify = simplify, 
        token_name = NULL)
}


#' Start Task
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_start_task <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "StartTask", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Stop Task
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_stop_task <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "StopTask", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Submit Attachment State Changes
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_submit_attachment_state_changes <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitAttachmentStateChanges", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Submit Container State Change
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_submit_container_state_change <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitContainerStateChange", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Submit Task State Change
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_submit_task_state_change <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitTaskStateChange", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Tag Resource
#' 
#' Associates the specified tags to a resource with
#' the specified `resourceArn`. If existing tags on a resource are not
#' specified in the request parameters, they are not changed. When a
#' resource is deleted, the tags associated with that resource are deleted
#' as well.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_tag_resource <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "TagResource", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Untag Resource
#' 
#' Deletes specified tags from a
#' resource.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_untag_resource <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UntagResource", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Capacity Provider
#' 
#' Modifies the parameters for a capacity
#' provider.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_capacity_provider <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Cluster Settings
#' 
#' Modifies the settings to use for a
#' cluster.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_cluster_settings <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateClusterSettings", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Container Agent
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_container_agent <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateContainerAgent", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Container Instances State
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_container_instances_state <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateContainerInstancesState", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Service
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_service <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateService", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Service Primary Task Set
#' 
#' Modifies which task set in a service is the primary
#' task set. Any parameters that are updated on the primary task set in a
#' service will transition to the service. This is used when a service uses
#' the `EXTERNAL` deployment controller type. For more information, see
#' [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_service_primary_task_set <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateServicePrimaryTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}


#' Update Task Set
#' 
#' Modifies a task set. This is used when a
#' service uses the `EXTERNAL` deployment controller type. For more
#' information, see [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' @inheritParams CommonDoc
#' 
#' @return A list object or a character vector
#' @export
ecs_update_task_set <- function(simplify = TRUE, others = list()) {
    parameters <- c(others, list())
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL)
}

