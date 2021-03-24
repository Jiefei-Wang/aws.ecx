#' Create Capacity Provider
#' 
#' Creates a new capacity provider. Capacity providers are associated with
#' an Amazon ECS cluster and are used in capacity provider strategies to
#' facilitate cluster auto scaling.
#' 
#' @param name Character. The name of the capacity provider.
#' @param autoScalingGroupProvider Object. The details of the Auto Scaling group for the capacity provider.
#' @param tags List.   The metadata that you apply to the capacity provider to help you categorize and organize them.
#' @inheritParams CommonDoc
#' 
#' @section name:
#' The name of the capacity provider. Up to 255 characters are allowed,
#' including letters (upper and lowercase), numbers, underscores, and
#' hyphens. The name cannot be prefixed with \'`aws`\', \'`ecs`\', or
#' \'`fargate`\'.
#' @section autoScalingGroupProvider:
#' The details of the Auto Scaling group
#' for the capacity provider.
#' @section tags:
#' 
#' The metadata that you apply to the capacity provider to help you
#' categorize and organize them. Each tag consists of a key and an optional
#' value, both of which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @return A list object or a character vector
#' @export
ecs_create_capacity_provider <- function(name = NULL, autoScalingGroupProvider = NULL, tags = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    name <- as.character(name)
    autoScalingGroupProvider <- as.list(autoScalingGroupProvider)
    tags <- as.list(tags)
    parameters <- c(others, list(name = name, autoScalingGroupProvider = autoScalingGroupProvider, 
        tags = tags))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "CreateCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Create Cluster
#' 
#' @param clusterName Character. The name of your cluster.
#' @param tags List.   The metadata that you apply to the cluster to help you categorize and organize them.
#' @param settings List. The setting to use when creating a cluster.
#' @param capacityProviders List.   The short name of one or more capacity providers to associate with the cluster.
#' @param defaultCapacityProviderStrategy List.   The capacity provider strategy to use by default for the cluster.
#' @inheritParams CommonDoc
#' 
#' @section clusterName:
#' The name of your cluster. If you do not specify a
#' name for your cluster, you create a cluster named `default`. Up to 255
#' letters (uppercase and lowercase), numbers, and hyphens are allowed.
#' 
#' @section tags:
#' 
#' The metadata that you apply to the cluster to help you categorize and
#' organize them. Each tag consists of a key and an optional value, both of
#' which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @section settings:
#' The setting to use when creating a cluster. This
#' parameter is used to enable CloudWatch Container Insights for a cluster.
#' If this value is specified, it will override the `containerInsights`
#' value set with PutAccountSetting or
#' PutAccountSettingDefault.
#' @section capacityProviders:
#' 
#' The short name of one or more capacity providers to associate with the
#' cluster.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created and not already associated
#' with another cluster. New capacity providers can be created with the
#' CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' The PutClusterCapacityProviders API operation is used to update the list
#' of available capacity providers for a cluster after the cluster is
#' created.
#' 
#' @section defaultCapacityProviderStrategy:
#' 
#' The capacity provider strategy to use by default for the cluster.
#' 
#' When creating a service or running a task on a cluster, if no capacity
#' provider or launch type is specified then the default capacity provider
#' strategy for the cluster is used.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' If a default capacity provider strategy is not defined for a cluster
#' during creation, it can be defined later with the
#' PutClusterCapacityProviders API operation.
#' 
#' @return A list object or a character vector
#' @export
ecs_create_cluster <- function(clusterName = NULL, tags = NULL, settings = NULL, capacityProviders = NULL, 
    defaultCapacityProviderStrategy = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    clusterName <- as.character(clusterName)
    tags <- as.list(tags)
    settings <- as.list(settings)
    capacityProviders <- as.list(capacityProviders)
    defaultCapacityProviderStrategy <- as.list(defaultCapacityProviderStrategy)
    parameters <- c(others, list(clusterName = clusterName, tags = tags, settings = settings, capacityProviders = capacityProviders, 
        defaultCapacityProviderStrategy = defaultCapacityProviderStrategy))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "CreateCluster", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Create Service
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster on which to run your service.
#' @param serviceName Character. The name of your service.
#' @param taskDefinition Character.   The `family` and `revision` (`family:revision`) or full ARN of the task definition to run in your...
#' @param loadBalancers List.   A load balancer object representing the load balancers to use with your service.
#' @param serviceRegistries List.   The details of the service discovery registries to assign to this service.
#' @param desiredCount Integer.   The number of instantiations of the specified task definition to place and keep running on your...
#' @param clientToken Character. Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
#' @param launchType Character.   The launch type on which to run your service.
#' @param capacityProviderStrategy List.   The capacity provider strategy to use for the service.
#' @param platformVersion Character. The platform version that your tasks in the service are running on.
#' @param role Character.   The name or full Amazon Resource Name (ARN) of the IAM role that allows Amazon ECS to make calls...
#' @param deploymentConfiguration Object. Optional deployment parameters that control how many tasks run during the deployment and the ordering...
#' @param placementConstraints List. An array of placement constraint objects to use for tasks in your service.
#' @param placementStrategy List. The placement strategy objects to use for tasks in your service.
#' @param networkConfiguration Object. The network configuration for the service.
#' @param healthCheckGracePeriodSeconds Integer.   The period of time, in seconds, that the Amazon ECS service scheduler should ignore unhealthy Elastic...
#' @param schedulingStrategy Character.   The scheduling strategy to use for the service.
#' @param deploymentController Object. The deployment controller to use for the service.
#' @param tags List.   The metadata that you apply to the service to help you categorize and organize them.
#' @param enableECSManagedTags Logical. Specifies whether to enable Amazon ECS managed tags for the tasks within the service.
#' @param propagateTags Character. Specifies whether to propagate the tags from the task definition or the service to the tasks in the...
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name (ARN)
#' of the cluster on which to run your service. If you do not specify a
#' cluster, the default cluster is assumed.
#' @section serviceName:
#' The name of
#' your service. Up to 255 letters (uppercase and lowercase), numbers, and
#' hyphens are allowed. Service names must be unique within a cluster, but
#' you can have similarly named services in multiple clusters within a
#' Region or across multiple Regions.
#' @section taskDefinition:
#' 
#' The `family` and `revision` (`family:revision`) or full ARN of the task
#' definition to run in your service. If a `revision` is not specified, the
#' latest `ACTIVE` revision is used.
#' 
#' A task definition must be specified if the service is using either the
#' `ECS` or `CODE_DEPLOY` deployment controllers.
#' 
#' @section loadBalancers:
#' 
#' A load balancer object representing the load balancers to use with your
#' service. For more information, see [Service Load
#' Balancing](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If the service is using the rolling update (`ECS`) deployment controller
#' and using either an Application Load Balancer or Network Load Balancer,
#' you must specify one or more target group ARNs to attach to the service.
#' The service-linked role is required for services that make use of
#' multiple target groups. For more information, see [Using Service-Linked
#' Roles for Amazon
#' ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If the service is using the `CODE_DEPLOY` deployment controller, the
#' service is required to use either an Application Load Balancer or
#' Network Load Balancer. When creating an AWS CodeDeploy deployment group,
#' you specify two target groups (referred to as a `targetGroupPair`).
#' During a deployment, AWS CodeDeploy determines which task set in your
#' service has the status `PRIMARY` and associates one target group with
#' it, and then associates the other target group with the replacement task
#' set. The load balancer can also have up to two listeners: a required
#' listener for production traffic and an optional listener that allows you
#' perform validation tests with Lambda functions before routing production
#' traffic to it.
#' 
#' After you create a service using the `ECS` deployment controller, the
#' load balancer name or target group ARN, container name, and container
#' port specified in the service definition are immutable. If you are using
#' the `CODE_DEPLOY` deployment controller, these values can be changed
#' when updating the service.
#' 
#' For Application Load Balancers and Network Load Balancers, this object
#' must contain the load balancer target group ARN, the container name (as
#' it appears in a container definition), and the container port to access
#' from the load balancer. The load balancer name parameter must be
#' omitted. When a task from this service is placed on a container
#' instance, the container instance and port combination is registered as a
#' target in the target group specified here.
#' 
#' For Classic Load Balancers, this object must contain the load balancer
#' name, the container name (as it appears in a container definition), and
#' the container port to access from the load balancer. The target group
#' ARN parameter must be omitted. When a task from this service is placed
#' on a container instance, the container instance is registered with the
#' load balancer specified here.
#' 
#' Services with tasks that use the `awsvpc` network mode (for example,
#' those with the Fargate launch type) only support Application Load
#' Balancers and Network Load Balancers. Classic Load Balancers are not
#' supported. Also, when you create any target groups for these services,
#' you must choose `ip` as the target type, not `instance`, because tasks
#' that use the `awsvpc` network mode are associated with an elastic
#' network interface, not an Amazon EC2 instance.
#' 
#' @section serviceRegistries:
#' 
#' The details of the service discovery registries to assign to this
#' service. For more information, see [Service
#' Discovery](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html).
#' 
#' Service discovery is supported for Fargate tasks if you are using
#' platform version v1.1.0 or later. For more information, see [AWS Fargate
#' Platform
#' Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html).
#' 
#' @section desiredCount:
#' 
#' The number of instantiations of the specified task definition to place
#' and keep running on your cluster.
#' 
#' This is required if `schedulingStrategy` is `REPLICA` or is not
#' specified. If `schedulingStrategy` is `DAEMON` then this is not
#' required.
#' 
#' @section clientToken:
#' Unique, case-sensitive identifier that you provide
#' to ensure the idempotency of the request. Up to 32 ASCII characters are
#' allowed.
#' @section launchType:
#' 
#' The launch type on which to run your service. For more information, see
#' [Amazon ECS Launch
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If a `launchType` is specified, the `capacityProviderStrategy` parameter
#' must be omitted.
#' 
#' @section capacityProviderStrategy:
#' 
#' The capacity provider strategy to use for the service.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If a `capacityProviderStrategy` is specified, the `launchType` parameter
#' must be omitted. If no `capacityProviderStrategy` or `launchType` is
#' specified, the `defaultCapacityProviderStrategy` for the cluster is
#' used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' The PutClusterCapacityProviders API operation is used to update the list
#' of available capacity providers for a cluster after the cluster is
#' created.
#' 
#' @section platformVersion:
#' The platform version that your tasks in the service
#' are running on. A platform version is specified only for tasks using the
#' Fargate launch type. If one isn\'t specified, the `LATEST` platform
#' version is used by default. For more information, see [AWS Fargate
#' Platform
#' Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section role:
#' 
#' The name or full Amazon Resource Name (ARN) of the IAM role that allows
#' Amazon ECS to make calls to your load balancer on your behalf. This
#' parameter is only permitted if you are using a load balancer with your
#' service and your task definition does not use the `awsvpc` network mode.
#' If you specify the `role` parameter, you must also specify a load
#' balancer object with the `loadBalancers` parameter.
#' 
#' If your account has already created the Amazon ECS service-linked role,
#' that role is used by default for your service unless you specify a role
#' here. The service-linked role is required if your task definition uses
#' the `awsvpc` network mode or if the service is configured to use service
#' discovery, an external deployment controller, multiple target groups, or
#' Elastic Inference accelerators in which case you should not specify a
#' role here. For more information, see [Using Service-Linked Roles for
#' Amazon
#' ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If your specified role has a path other than `/`, then you must either
#' specify the full role ARN (this is recommended) or prefix the role name
#' with the path. For example, if a role with the name `bar` has a path of
#' `/foo/` then you would specify `/foo/bar` as the role name. For more
#' information, see [Friendly Names and
#' Paths](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names)
#' in the *IAM User Guide*.
#' 
#' @section deploymentConfiguration:
#' Optional deployment parameters that control how
#' many tasks run during the deployment and the ordering of stopping and
#' starting tasks.
#' @section placementConstraints:
#' An array of placement constraint
#' objects to use for tasks in your service. You can specify a maximum of
#' 10 constraints per task (this limit includes constraints in the task
#' definition and those specified at runtime). 
#' @section placementStrategy:
#' The
#' placement strategy objects to use for tasks in your service. You can
#' specify a maximum of five strategy rules per
#' service.
#' @section networkConfiguration:
#' The network configuration for the service.
#' This parameter is required for task definitions that use the `awsvpc`
#' network mode to receive their own elastic network interface, and it is
#' not supported for other network modes. For more information, see [Task
#' Networking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section healthCheckGracePeriodSeconds:
#' 
#' The period of time, in seconds, that the Amazon ECS service scheduler
#' should ignore unhealthy Elastic Load Balancing target health checks
#' after a task has first started. This is only used when your service is
#' configured to use a load balancer. If your service has a load balancer
#' defined and you don\'t specify a health check grace period value, the
#' default value of `0` is used.
#' 
#' If your service\'s tasks take a while to start and respond to Elastic
#' Load Balancing health checks, you can specify a health check grace
#' period of up to 2,147,483,647 seconds. During that time, the Amazon ECS
#' service scheduler ignores health check status. This grace period can
#' prevent the service scheduler from marking tasks as unhealthy and
#' stopping them before they have time to come up.
#' 
#' @section schedulingStrategy:
#' 
#' The scheduling strategy to use for the service. For more information,
#' see
#' [Services](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html).
#' 
#' There are two service scheduler strategies available:
#' 
#' -   `REPLICA`-The replica scheduling strategy places and maintains the
#'     desired number of tasks across your cluster. By default, the service
#'     scheduler spreads tasks across Availability Zones. You can use task
#'     placement strategies and constraints to customize task placement
#'     decisions. This scheduler strategy is required if the service is
#'     using the `CODE_DEPLOY` or `EXTERNAL` deployment controller types.
#' 
#' -   `DAEMON`-The daemon scheduling strategy deploys exactly one task on
#'     each active container instance that meets all of the task placement
#'     constraints that you specify in your cluster. The service scheduler
#'     also evaluates the task placement constraints for running tasks and
#'     will stop tasks that do not meet the placement constraints. When
#'     you\'re using this strategy, you don\'t need to specify a desired
#'     number of tasks, a task placement strategy, or use Service Auto
#'     Scaling policies.
#' 
#'     Tasks using the Fargate launch type or the `CODE_DEPLOY` or
#'     `EXTERNAL` deployment controller types don\'t support the `DAEMON`
#'     scheduling strategy.
#' 
#' @section deploymentController:
#' The deployment controller to use for the
#' service.
#' @section tags:
#' 
#' The metadata that you apply to the service to help you categorize and
#' organize them. Each tag consists of a key and an optional value, both of
#' which you define. When a service is deleted, the tags are deleted as
#' well.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @section enableECSManagedTags:
#' Specifies whether to enable Amazon ECS managed tags
#' for the tasks within the service. For more information, see [Tagging
#' Your Amazon ECS
#' Resources](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section propagateTags:
#' Specifies whether to propagate the tags from
#' the task definition or the service to the tasks in the service. If no
#' value is specified, the tags are not propagated. Tags can only be
#' propagated to the tasks within the service during service creation. To
#' add tags to a task after service creation, use the TagResource API
#' action.
#' @return A list object or a character vector
#' @export
ecs_create_service <- function(cluster = NULL, serviceName = NULL, taskDefinition = NULL, loadBalancers = NULL, 
    serviceRegistries = NULL, desiredCount = NULL, clientToken = NULL, launchType = NULL, capacityProviderStrategy = NULL, 
    platformVersion = NULL, role = NULL, deploymentConfiguration = NULL, placementConstraints = NULL, 
    placementStrategy = NULL, networkConfiguration = NULL, healthCheckGracePeriodSeconds = NULL, schedulingStrategy = NULL, 
    deploymentController = NULL, tags = NULL, enableECSManagedTags = NULL, propagateTags = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    serviceName <- as.character(serviceName)
    taskDefinition <- as.character(taskDefinition)
    clientToken <- as.character(clientToken)
    launchType <- as.character(launchType)
    platformVersion <- as.character(platformVersion)
    role <- as.character(role)
    schedulingStrategy <- as.character(schedulingStrategy)
    propagateTags <- as.character(propagateTags)
    deploymentConfiguration <- as.list(deploymentConfiguration)
    networkConfiguration <- as.list(networkConfiguration)
    deploymentController <- as.list(deploymentController)
    loadBalancers <- as.list(loadBalancers)
    serviceRegistries <- as.list(serviceRegistries)
    capacityProviderStrategy <- as.list(capacityProviderStrategy)
    placementConstraints <- as.list(placementConstraints)
    placementStrategy <- as.list(placementStrategy)
    tags <- as.list(tags)
    desiredCount <- as.integer(desiredCount)
    healthCheckGracePeriodSeconds <- as.integer(healthCheckGracePeriodSeconds)
    enableECSManagedTags <- as.logical(enableECSManagedTags)
    parameters <- c(others, list(cluster = cluster, serviceName = serviceName, taskDefinition = taskDefinition, 
        loadBalancers = loadBalancers, serviceRegistries = serviceRegistries, desiredCount = desiredCount, 
        clientToken = clientToken, launchType = launchType, capacityProviderStrategy = capacityProviderStrategy, 
        platformVersion = platformVersion, role = role, deploymentConfiguration = deploymentConfiguration, 
        placementConstraints = placementConstraints, placementStrategy = placementStrategy, networkConfiguration = networkConfiguration, 
        healthCheckGracePeriodSeconds = healthCheckGracePeriodSeconds, schedulingStrategy = schedulingStrategy, 
        deploymentController = deploymentController, tags = tags, enableECSManagedTags = enableECSManagedTags, 
        propagateTags = propagateTags))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "CreateService", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param service Character. The short name or full Amazon Resource Name (ARN) of the service to create the task set in.
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service to create...
#' @param externalId Character. An optional non-unique tag that identifies this task set in external systems.
#' @param taskDefinition Character. The task definition for the tasks in the task set to use.
#' @param networkConfiguration No description can be found.
#' @param loadBalancers List. A load balancer object representing the load balancer to use with the task set.
#' @param serviceRegistries List. The details of the service discovery registries to assign to this task set.
#' @param launchType Character.   The launch type that new tasks in the task set will use.
#' @param capacityProviderStrategy List.   The capacity provider strategy to use for the task set.
#' @param platformVersion Character. The platform version that the tasks in the task set should use.
#' @param scale No description can be found.
#' @param clientToken Character. Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
#' @param tags List.   The metadata that you apply to the task set to help you categorize and organize them.
#' @inheritParams CommonDoc
#' 
#' @section service:
#' The short name or full Amazon Resource Name
#' (ARN) of the service to create the task set in.
#' @section cluster:
#' The
#' short name or full Amazon Resource Name (ARN) of the cluster that hosts
#' the service to create the task set in.
#' @section externalId:
#' An optional
#' non-unique tag that identifies this task set in external systems. If the
#' task set is associated with a service discovery registry, the tasks in
#' this task set will have the `ECS_TASK_SET_EXTERNAL_ID` AWS Cloud Map
#' attribute set to the provided value.
#' @section taskDefinition:
#' The task
#' definition for the tasks in the task set to
#' use.
#' @section networkConfiguration:
#' No description can be found.
#' @section loadBalancers:
#' A load balancer object
#' representing the load balancer to use with the task set. The supported
#' load balancer types are either an Application Load Balancer or a Network
#' Load Balancer.
#' @section serviceRegistries:
#' The details of the service discovery
#' registries to assign to this task set. For more information, see
#' [Service
#' Discovery](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html).
#' @section launchType:
#' 
#' The launch type that new tasks in the task set will use. For more
#' information, see [Amazon ECS Launch
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If a `launchType` is specified, the `capacityProviderStrategy` parameter
#' must be omitted.
#' 
#' @section capacityProviderStrategy:
#' 
#' The capacity provider strategy to use for the task set.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If a `capacityProviderStrategy` is specified, the `launchType` parameter
#' must be omitted. If no `capacityProviderStrategy` or `launchType` is
#' specified, the `defaultCapacityProviderStrategy` for the cluster is
#' used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' The PutClusterCapacityProviders API operation is used to update the list
#' of available capacity providers for a cluster after the cluster is
#' created.
#' 
#' @section platformVersion:
#' The platform version that the tasks in the task set
#' should use. A platform version is specified only for tasks using the
#' Fargate launch type. If one isn\'t specified, the `LATEST` platform
#' version is used by
#' default.
#' @section scale:
#' No description can be found.
#' @section clientToken:
#' Unique, case-sensitive
#' identifier that you provide to ensure the idempotency of the request. Up
#' to 32 ASCII characters are allowed.
#' @section tags:
#' 
#' The metadata that you apply to the task set to help you categorize and
#' organize them. Each tag consists of a key and an optional value, both of
#' which you define. When a service is deleted, the tags are deleted as
#' well.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @return A list object or a character vector
#' @export
ecs_create_task_set <- function(service = NULL, cluster = NULL, externalId = NULL, taskDefinition = NULL, 
    networkConfiguration = NULL, loadBalancers = NULL, serviceRegistries = NULL, launchType = NULL, 
    capacityProviderStrategy = NULL, platformVersion = NULL, scale = NULL, clientToken = NULL, tags = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    service <- as.character(service)
    cluster <- as.character(cluster)
    externalId <- as.character(externalId)
    taskDefinition <- as.character(taskDefinition)
    launchType <- as.character(launchType)
    platformVersion <- as.character(platformVersion)
    clientToken <- as.character(clientToken)
    loadBalancers <- as.list(loadBalancers)
    serviceRegistries <- as.list(serviceRegistries)
    capacityProviderStrategy <- as.list(capacityProviderStrategy)
    tags <- as.list(tags)
    parameters <- c(others, list(service = service, cluster = cluster, externalId = externalId, taskDefinition = taskDefinition, 
        networkConfiguration = networkConfiguration, loadBalancers = loadBalancers, serviceRegistries = serviceRegistries, 
        launchType = launchType, capacityProviderStrategy = capacityProviderStrategy, platformVersion = platformVersion, 
        scale = scale, clientToken = clientToken, tags = tags))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "CreateTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Delete Account Setting
#' 
#' Disables an account setting for a specified
#' IAM user, IAM role, or the root user for an
#' account.
#' 
#' @param name Character. The resource name for which to disable the account setting.
#' @param principalArn Character. The ARN of the principal, which can be an IAM user, IAM role, or the root user.
#' @inheritParams CommonDoc
#' 
#' @section name:
#' The resource name for which to disable the account
#' setting. If `serviceLongArnFormat` is specified, the ARN for your Amazon
#' ECS services is affected. If `taskLongArnFormat` is specified, the ARN
#' and resource ID for your Amazon ECS tasks is affected. If
#' `containerInstanceLongArnFormat` is specified, the ARN and resource ID
#' for your Amazon ECS container instances is affected. If `awsvpcTrunking`
#' is specified, the ENI limit for your Amazon ECS container instances is
#' affected.
#' @section principalArn:
#' The ARN of the principal, which can be an
#' IAM user, IAM role, or the root user. If you specify the root user, it
#' disables the account setting for all IAM users, IAM roles, and the root
#' user of the account unless an IAM user or role explicitly overrides
#' these settings. If this field is omitted, the setting is changed only
#' for the authenticated user.
#' @return A list object or a character vector
#' @export
ecs_delete_account_setting <- function(name = NULL, principalArn = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    name <- as.character(name)
    principalArn <- as.character(principalArn)
    parameters <- c(others, list(name = name, principalArn = principalArn))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteAccountSetting", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Delete Attributes
#' 
#' Deletes one or more custom attributes from
#' an Amazon ECS resource.
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that contains the resource to delete...
#' @param attributes List. The attributes to delete from your resource.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full
#' Amazon Resource Name (ARN) of the cluster that contains the resource to
#' delete attributes. If you do not specify a cluster, the default cluster
#' is assumed.
#' @section attributes:
#' The attributes to delete from your
#' resource. You can specify up to 10 attributes per request. For custom
#' attributes, specify the attribute name and target ID, but do not specify
#' the value. If you specify the target ID using the short form, you must
#' also specify the target type.
#' @return A list object or a character vector
#' @export
ecs_delete_attributes <- function(cluster = NULL, attributes = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    attributes <- as.list(attributes)
    parameters <- c(others, list(cluster = cluster, attributes = attributes))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteAttributes", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Delete Capacity Provider
#' 
#' @param capacityProvider Character. The short name or full Amazon Resource Name (ARN) of the capacity provider to delete.
#' @inheritParams CommonDoc
#' 
#' @section capacityProvider:
#' The short name or full
#' Amazon Resource Name (ARN) of the capacity provider to
#' delete.
#' @return A list object or a character vector
#' @export
ecs_delete_capacity_provider <- function(capacityProvider = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    capacityProvider <- as.character(capacityProvider)
    parameters <- c(others, list(capacityProvider = capacityProvider))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Delete Cluster
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster to delete.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name
#' (ARN) of the cluster to delete.
#' @return A list object or a character vector
#' @export
ecs_delete_cluster <- function(cluster = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    parameters <- c(others, list(cluster = cluster))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteCluster", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Delete Service
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service to delete.
#' @param service Character. The name of the service to delete.
#' @param force Logical. If `true`, allows you to delete a service even if it has not been scaled down to zero tasks.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or
#' full Amazon Resource Name (ARN) of the cluster that hosts the service to
#' delete. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section service:
#' The name of the service to
#' delete.
#' @section force:
#' If `true`, allows you to delete a service
#' even if it has not been scaled down to zero tasks. It is only necessary
#' to use this if the service is using the `REPLICA` scheduling
#' strategy.
#' @return A list object or a character vector
#' @export
ecs_delete_service <- function(cluster = NULL, service = NULL, force = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    force <- as.logical(force)
    parameters <- c(others, list(cluster = cluster, service = service, force = force))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteService", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the...
#' @param service Character. The short name or full Amazon Resource Name (ARN) of the service that hosts the task set to delete.
#' @param taskSet Character. The task set ID or full Amazon Resource Name (ARN) of the task set to delete.
#' @param force Logical. If `true`, this allows you to delete a task set even if it hasn\'t been scaled down to zero.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource
#' Name (ARN) of the cluster that hosts the service that the task set
#' exists in to delete.
#' @section service:
#' The short name or full Amazon
#' Resource Name (ARN) of the service that hosts the task set to
#' delete.
#' @section taskSet:
#' The task set ID or full Amazon Resource Name
#' (ARN) of the task set to delete.
#' @section force:
#' If `true`, this
#' allows you to delete a task set even if it hasn\'t been scaled down to
#' zero.
#' @return A list object or a character vector
#' @export
ecs_delete_task_set <- function(cluster = NULL, service = NULL, taskSet = NULL, force = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    taskSet <- as.character(taskSet)
    force <- as.logical(force)
    parameters <- c(others, list(cluster = cluster, service = service, taskSet = taskSet, force = force))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeleteTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Deregister Container Instance
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instance...
#' @param containerInstance Character. The container instance ID or full ARN of the container instance to deregister.
#' @param force Logical.   Forces the deregistration of the container instance.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name
#' (ARN) of the cluster that hosts the container instance to deregister. If
#' you do not specify a cluster, the default cluster is
#' assumed.
#' @section containerInstance:
#' The container instance ID or full ARN of
#' the container instance to deregister. The ARN contains the `arn:aws:ecs`
#' namespace, followed by the Region of the container instance, the AWS
#' account ID of the container instance owner, the `container-instance`
#' namespace, and then the container instance ID. For example,
#' `arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID`.
#' @section force:
#' 
#' Forces the deregistration of the container instance. If you have tasks
#' running on the container instance when you deregister it with the
#' `force` option, these tasks remain running until you terminate the
#' instance or the tasks stop through some other means, but they are
#' orphaned (no longer monitored or accounted for by Amazon ECS). If an
#' orphaned task on your container instance is part of an Amazon ECS
#' service, then the service scheduler starts another copy of that task, on
#' a different container instance if possible.
#' 
#' Any containers in orphaned service tasks that are registered with a
#' Classic Load Balancer or an Application Load Balancer target group are
#' deregistered. They begin connection draining according to the settings
#' on the load balancer or target group.
#' 
#' @return A list object or a character vector
#' @export
ecs_deregister_container_instance <- function(cluster = NULL, containerInstance = NULL, force = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    containerInstance <- as.character(containerInstance)
    force <- as.logical(force)
    parameters <- c(others, list(cluster = cluster, containerInstance = containerInstance, force = force))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeregisterContainerInstance", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Deregister Task Definition
#' 
#' @param taskDefinition Character. The `family` and `revision` (`family:revision`) or full Amazon Resource Name (ARN) of the task definition...
#' @inheritParams CommonDoc
#' 
#' @section taskDefinition:
#' The `family` and `revision` (`family:revision`) or
#' full Amazon Resource Name (ARN) of the task definition to deregister.
#' You must specify a `revision`.
#' @return A list object or a character vector
#' @export
ecs_deregister_task_definition <- function(taskDefinition = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    taskDefinition <- as.character(taskDefinition)
    parameters <- c(others, list(taskDefinition = taskDefinition))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DeregisterTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Capacity Providers
#' 
#' Describes one or more of your capacity
#' providers.
#' 
#' @param capacityProviders List. The short name or full Amazon Resource Name (ARN) of one or more capacity providers.
#' @param include List. Specifies whether or not you want to see the resource tags for the capacity provider.
#' @param maxResults Integer. The maximum number of account setting results returned by `DescribeCapacityProviders` in paginated...
#' @inheritParams CommonDoc
#' 
#' @section capacityProviders:
#' The short name or
#' full Amazon Resource Name (ARN) of one or more capacity providers. Up to
#' `100` capacity providers can be described in an
#' action.
#' @section include:
#' Specifies whether or not you want to see the
#' resource tags for the capacity provider. If `TAGS` is specified, the
#' tags are included in the response. If this field is omitted, tags are
#' not included in the response.
#' @section maxResults:
#' The maximum number of
#' account setting results returned by `DescribeCapacityProviders` in
#' paginated output. When this parameter is used,
#' `DescribeCapacityProviders` only returns `maxResults` results in a
#' single page along with a `nextToken` response element. The remaining
#' results of the initial request can be seen by sending another
#' `DescribeCapacityProviders` request with the returned `nextToken` value.
#' This value can be between 1 and 10. If this parameter is not used, then
#' `DescribeCapacityProviders` returns up to 10 results and a `nextToken`
#' value if applicable.
#' @return A list object or a character vector
#' @export
ecs_describe_capacity_providers <- function(capacityProviders = NULL, include = NULL, maxResults = NULL, 
    nextToken = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    nextToken <- as.character(nextToken)
    capacityProviders <- as.list(capacityProviders)
    include <- as.list(include)
    maxResults <- as.integer(maxResults)
    parameters <- c(others, list(capacityProviders = capacityProviders, include = include, maxResults = maxResults, 
        nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeCapacityProviders", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Clusters
#' 
#' Describes one or more of your
#' clusters.
#' 
#' @param clusters List. A list of up to 100 cluster names or full cluster Amazon Resource Name (ARN) entries.
#' @param include List.   Whether to include additional information about your clusters in the response.
#' @inheritParams CommonDoc
#' 
#' @section clusters:
#' A list of up to 100 cluster names or full cluster
#' Amazon Resource Name (ARN) entries. If you do not specify a cluster, the
#' default cluster is assumed.
#' @section include:
#' 
#' Whether to include additional information about your clusters in the
#' response. If this field is omitted, the attachments, statistics, and
#' tags are not included.
#' 
#' If `ATTACHMENTS` is specified, the attachments for the container
#' instances or tasks within the cluster are included.
#' 
#' If `SETTINGS` is specified, the settings for the cluster are included.
#' 
#' If `STATISTICS` is specified, the following additional information,
#' separated by launch type, is included:
#' 
#' -   runningEC2TasksCount
#' 
#' -   runningFargateTasksCount
#' 
#' -   pendingEC2TasksCount
#' 
#' -   pendingFargateTasksCount
#' 
#' -   activeEC2ServiceCount
#' 
#' -   activeFargateServiceCount
#' 
#' -   drainingEC2ServiceCount
#' 
#' -   drainingFargateServiceCount
#' 
#' If `TAGS` is specified, the metadata tags associated with the cluster
#' are included.
#' 
#' @return A list object or a character vector
#' @export
ecs_describe_clusters <- function(clusters = NULL, include = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    clusters <- as.list(clusters)
    include <- as.list(include)
    parameters <- c(others, list(clusters = clusters, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeClusters", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Container Instances
#' 
#' Describes Amazon Elastic Container Service
#' container instances. Returns metadata about registered and remaining
#' resources on each container instance
#' requested.
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instances...
#' @param containerInstances List. A list of up to 100 container instance IDs or full Amazon Resource Name (ARN) entries.
#' @param include List. Specifies whether you want to see the resource tags for the container instance.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name (ARN)
#' of the cluster that hosts the container instances to describe. If you do
#' not specify a cluster, the default cluster is assumed. This parameter is
#' required if the container instance or container instances you are
#' describing were launched in any cluster other than the default
#' cluster.
#' @section containerInstances:
#' A list of up to 100 container instance IDs
#' or full Amazon Resource Name (ARN)
#' entries.
#' @section include:
#' Specifies whether you want to see the
#' resource tags for the container instance. If `TAGS` is specified, the
#' tags are included in the response. If this field is omitted, tags are
#' not included in the response.
#' @return A list object or a character vector
#' @export
ecs_describe_container_instances <- function(cluster = NULL, containerInstances = NULL, include = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    containerInstances <- as.list(containerInstances)
    include <- as.list(include)
    parameters <- c(others, list(cluster = cluster, containerInstances = containerInstances, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeContainerInstances", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Services
#' 
#' Describes the specified services running
#' in your cluster.
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN)the cluster that hosts the service to describe.
#' @param services List. A list of services to describe.
#' @param include List. Specifies whether you want to see the resource tags for the service.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full
#' Amazon Resource Name (ARN)the cluster that hosts the service to
#' describe. If you do not specify a cluster, the default cluster is
#' assumed. This parameter is required if the service or services you are
#' describing were launched in any cluster other than the default
#' cluster.
#' @section services:
#' A list of services to describe. You may
#' specify up to 10 services to describe in a single
#' operation.
#' @section include:
#' Specifies whether you want to see the
#' resource tags for the service. If `TAGS` is specified, the tags are
#' included in the response. If this field is omitted, tags are not
#' included in the response.
#' @return A list object or a character vector
#' @export
ecs_describe_services <- function(cluster = NULL, services = NULL, include = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    services <- as.list(services)
    include <- as.list(include)
    parameters <- c(others, list(cluster = cluster, services = services, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeServices", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Task Definition
#' 
#' @param taskDefinition Character. The `family` for the latest `ACTIVE` revision, `family` and `revision` (`family:revision`) for a...
#' @param include List. Specifies whether to see the resource tags for the task definition.
#' @inheritParams CommonDoc
#' 
#' @section taskDefinition:
#' The `family` for the
#' latest `ACTIVE` revision, `family` and `revision` (`family:revision`)
#' for a specific revision in the family, or full Amazon Resource Name
#' (ARN) of the task definition to describe.
#' @section include:
#' Specifies
#' whether to see the resource tags for the task definition. If `TAGS` is
#' specified, the tags are included in the response. If this field is
#' omitted, tags are not included in the response.
#' @return A list object or a character vector
#' @export
ecs_describe_task_definition <- function(taskDefinition = NULL, include = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    taskDefinition <- as.character(taskDefinition)
    include <- as.list(include)
    parameters <- c(others, list(taskDefinition = taskDefinition, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the...
#' @param service Character. The short name or full Amazon Resource Name (ARN) of the service that the task sets exist in.
#' @param taskSets List. The ID or full Amazon Resource Name (ARN) of task sets to describe.
#' @param include List. Specifies whether to see the resource tags for the task set.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The
#' short name or full Amazon Resource Name (ARN) of the cluster that hosts
#' the service that the task sets exist in.
#' @section service:
#' The short
#' name or full Amazon Resource Name (ARN) of the service that the task
#' sets exist in.
#' @section taskSets:
#' The ID or full Amazon Resource Name
#' (ARN) of task sets to describe.
#' @section include:
#' Specifies whether to
#' see the resource tags for the task set. If `TAGS` is specified, the tags
#' are included in the response. If this field is omitted, tags are not
#' included in the response.
#' @return A list object or a character vector
#' @export
ecs_describe_task_sets <- function(cluster = NULL, service = NULL, taskSets = NULL, include = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    taskSets <- as.list(taskSets)
    include <- as.list(include)
    parameters <- c(others, list(cluster = cluster, service = service, taskSets = taskSets, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTaskSets", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Describe Tasks
#' 
#' Describes a specified task or
#' tasks.
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task or tasks to...
#' @param tasks List. A list of up to 100 task IDs or full ARN entries.
#' @param include List. Specifies whether you want to see the resource tags for the task.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full
#' Amazon Resource Name (ARN) of the cluster that hosts the task or tasks
#' to describe. If you do not specify a cluster, the default cluster is
#' assumed. This parameter is required if the task or tasks you are
#' describing were launched in any cluster other than the default
#' cluster.
#' @section tasks:
#' A list of up to 100 task IDs or full ARN
#' entries.
#' @section include:
#' Specifies whether you want to see the
#' resource tags for the task. If `TAGS` is specified, the tags are
#' included in the response. If this field is omitted, tags are not
#' included in the response.
#' @return A list object or a character vector
#' @export
ecs_describe_tasks <- function(cluster = NULL, tasks = NULL, include = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    tasks <- as.list(tasks)
    include <- as.list(include)
    parameters <- c(others, list(cluster = cluster, tasks = tasks, include = include))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DescribeTasks", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Discover Poll Endpoint
#' 
#' @param containerInstance Character. The container instance ID or full ARN of the container instance.
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster to which the container instance...
#' @inheritParams CommonDoc
#' 
#' @section containerInstance:
#' The container instance ID
#' or full ARN of the container instance. The ARN contains the
#' `arn:aws:ecs` namespace, followed by the Region of the container
#' instance, the AWS account ID of the container instance owner, the
#' `container-instance` namespace, and then the container instance ID. For
#' example,
#' `arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID`.
#' @section cluster:
#' The
#' short name or full Amazon Resource Name (ARN) of the cluster to which
#' the container instance belongs.
#' @return A list object or a character vector
#' @export
ecs_discover_poll_endpoint <- function(containerInstance = NULL, cluster = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    containerInstance <- as.character(containerInstance)
    cluster <- as.character(cluster)
    parameters <- c(others, list(containerInstance = containerInstance, cluster = cluster))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "DiscoverPollEndpoint", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Account Settings
#' 
#' Lists the account settings for a specified
#' principal.
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @param name Character. The name of the account setting you want to list the settings for.
#' @param value Character. The value of the account settings with which to filter results.
#' @param principalArn Character. The ARN of the principal, which can be an IAM user, IAM role, or the root user.
#' @param effectiveSettings Logical. Specifies whether to return the effective settings.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section name:
#' The name
#' of the account setting you want to list the settings
#' for.
#' @section value:
#' The value of the account settings with which to
#' filter results. You must also specify an account setting name to use
#' this parameter.
#' @section principalArn:
#' The ARN of the principal, which can
#' be an IAM user, IAM role, or the root user. If this field is omitted,
#' the account settings are listed only for the authenticated
#' user.
#' @section effectiveSettings:
#' Specifies whether to return the effective
#' settings. If `true`, the account settings for the root user or the
#' default setting for the `principalArn` are returned. If `false`, the
#' account settings for the `principalArn` are returned if they are set.
#' Otherwise, no account settings are
#' returned.
#' @return A list object or a character vector
#' @export
ecs_list_account_settings <- function(maxResults = NULL, nextToken = NULL, name = NULL, value = NULL, 
    principalArn = NULL, effectiveSettings = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    name <- as.character(name)
    value <- as.character(value)
    principalArn <- as.character(principalArn)
    effectiveSettings <- as.logical(effectiveSettings)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, name = name, value = value, 
        principalArn = principalArn, effectiveSettings = effectiveSettings))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListAccountSettings", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param maxResults Character. Pagination limit\[optional\]
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster to list attributes.
#' @param targetType Character. The type of the target with which to list attributes.
#' @param attributeName Character. The name of the attribute with which to filter the results. 
#' @param attributeValue Character. The value of the attribute with which to filter results.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section cluster:
#' The short
#' name or full Amazon Resource Name (ARN) of the cluster to list
#' attributes. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section targetType:
#' The type of the target with which to list
#' attributes.
#' @section attributeName:
#' The name of the attribute with which to
#' filter the results. 
#' @section attributeValue:
#' The value of the attribute with
#' which to filter results. You must also specify an attribute name to use
#' this parameter.
#' @return A list object or a character vector
#' @export
ecs_list_attributes <- function(maxResults = NULL, nextToken = NULL, cluster = NULL, targetType = NULL, 
    attributeName = NULL, attributeValue = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    cluster <- as.character(cluster)
    targetType <- as.character(targetType)
    attributeName <- as.character(attributeName)
    attributeValue <- as.character(attributeValue)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, cluster = cluster, 
        targetType = targetType, attributeName = attributeName, attributeValue = attributeValue))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListAttributes", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Clusters
#' 
#' Returns
#' a list of existing clusters.
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @return A list object or a character vector
#' @export
ecs_list_clusters <- function(maxResults = NULL, nextToken = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListClusters", parameters = parameters, simplify = simplify, 
        token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
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
#' @param maxResults Character. Pagination limit\[optional\]
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instances...
#' @param filter Character. You can filter the results of a `ListContainerInstances` operation with cluster query language statements....
#' @param status Character. Filters the container instances by status.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section cluster:
#' The short
#' name or full Amazon Resource Name (ARN) of the cluster that hosts the
#' container instances to list. If you do not specify a cluster, the
#' default cluster is assumed.
#' @section filter:
#' You can filter the
#' results of a `ListContainerInstances` operation with cluster query
#' language statements. For more information, see [Cluster Query
#' Language](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section status:
#' Filters the container instances by status.
#' For example, if you specify the `DRAINING` status, the results include
#' only container instances that have been set to `DRAINING` using
#' UpdateContainerInstancesState. If you do not specify this parameter, the
#' default is to include container instances set to all states other than
#' `INACTIVE`.
#' @return A list object or a character vector
#' @export
ecs_list_container_instances <- function(maxResults = NULL, nextToken = NULL, cluster = NULL, filter = NULL, 
    status = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    cluster <- as.character(cluster)
    filter <- as.character(filter)
    status <- as.character(status)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, cluster = cluster, 
        filter = filter, status = status))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListContainerInstances", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Services
#' 
#' Lists the services that are running in a
#' specified cluster.
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the services to list.
#' @param launchType Character. The launch type for the services to list.
#' @param schedulingStrategy Character. The scheduling strategy for services to list.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section cluster:
#' The short
#' name or full Amazon Resource Name (ARN) of the cluster that hosts the
#' services to list. If you do not specify a cluster, the default cluster
#' is assumed.
#' @section launchType:
#' The launch type for the services to
#' list.
#' @section schedulingStrategy:
#' The scheduling strategy for services to
#' list.
#' @return A list object or a character vector
#' @export
ecs_list_services <- function(maxResults = NULL, nextToken = NULL, cluster = NULL, launchType = NULL, 
    schedulingStrategy = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    cluster <- as.character(cluster)
    launchType <- as.character(launchType)
    schedulingStrategy <- as.character(schedulingStrategy)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, cluster = cluster, 
        launchType = launchType, schedulingStrategy = schedulingStrategy))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListServices", parameters = parameters, simplify = simplify, 
        token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' List Tags For Resource
#' 
#' List the tags for an Amazon ECS
#' resource.
#' 
#' @param resourceArn Character. The Amazon Resource Name (ARN) that identifies the resource for which to list the tags.
#' @inheritParams CommonDoc
#' 
#' @section resourceArn:
#' The Amazon Resource Name (ARN) that identifies
#' the resource for which to list the tags. Currently, the supported
#' resources are Amazon ECS tasks, services, task definitions, clusters,
#' and container instances.
#' @return A list object or a character vector
#' @export
ecs_list_tags_for_resource <- function(resourceArn = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    resourceArn <- as.character(resourceArn)
    parameters <- c(others, list(resourceArn = resourceArn))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListTagsForResource", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Task Definition Families
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @param familyPrefix Character. The `familyPrefix` is a string that is used to filter the results of `ListTaskDefinitionFamilies`.
#' @param status Character. The task definition family status with which to filter the `ListTaskDefinitionFamilies` results.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section familyPrefix:
#' The
#' `familyPrefix` is a string that is used to filter the results of
#' `ListTaskDefinitionFamilies`. If you specify a `familyPrefix`, only task
#' definition family names that begin with the `familyPrefix` string are
#' returned.
#' @section status:
#' The task definition family status with
#' which to filter the `ListTaskDefinitionFamilies` results. By default,
#' both `ACTIVE` and `INACTIVE` task definition families are listed. If
#' this parameter is set to `ACTIVE`, only task definition families that
#' have an `ACTIVE` task definition revision are returned. If this
#' parameter is set to `INACTIVE`, only task definition families that do
#' not have any `ACTIVE` task definition revisions are returned. If you
#' paginate the resulting output, be sure to keep the `status` value
#' constant in each subsequent request.
#' @return A list object or a character vector
#' @export
ecs_list_task_definition_families <- function(maxResults = NULL, nextToken = NULL, familyPrefix = NULL, 
    status = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    familyPrefix <- as.character(familyPrefix)
    status <- as.character(status)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, familyPrefix = familyPrefix, 
        status = status))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListTaskDefinitionFamilies", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Task Definitions
#' 
#' Returns a list of task definitions that are
#' registered to your account. You can filter the results by family name
#' with the `familyPrefix` parameter or by status with the `status`
#' parameter.
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @param familyPrefix Character. The full family name with which to filter the `ListTaskDefinitions` results.
#' @param status Character. The task definition status with which to filter the `ListTaskDefinitions` results.
#' @param sort Character. The order in which to sort the results.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section familyPrefix:
#' The full
#' family name with which to filter the `ListTaskDefinitions` results.
#' Specifying a `familyPrefix` limits the listed task definitions to task
#' definition revisions that belong to that family.
#' @section status:
#' The
#' task definition status with which to filter the `ListTaskDefinitions`
#' results. By default, only `ACTIVE` task definitions are listed. By
#' setting this parameter to `INACTIVE`, you can view task definitions that
#' are `INACTIVE` as long as an active task or service still references
#' them. If you paginate the resulting output, be sure to keep the `status`
#' value constant in each subsequent request.
#' @section sort:
#' The order
#' in which to sort the results. Valid values are `ASC` and `DESC`. By
#' default (`ASC`), task definitions are listed lexicographically by family
#' name and in ascending numerical order by revision so that the newest
#' task definitions in a family are listed last. Setting this parameter to
#' `DESC` reverses the sort order on family name and revision so that the
#' newest task definitions in a family are listed
#' first.
#' @return A list object or a character vector
#' @export
ecs_list_task_definitions <- function(maxResults = NULL, nextToken = NULL, familyPrefix = NULL, status = NULL, 
    sort = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    familyPrefix <- as.character(familyPrefix)
    status <- as.character(status)
    sort <- as.character(sort)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, familyPrefix = familyPrefix, 
        status = status, sort = sort))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListTaskDefinitions", parameters = parameters, 
        simplify = simplify, token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' List Tasks
#' 
#' @param maxResults Character. Pagination limit\[optional\]
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the tasks to list.
#' @param containerInstance Character. The container instance ID or full ARN of the container instance with which to filter the `ListTasks`...
#' @param family Character. The name of the family with which to filter the `ListTasks` results.
#' @param startedBy Character. The `startedBy` value with which to filter the task results.
#' @param serviceName Character. The name of the service with which to filter the `ListTasks` results.
#' @param desiredStatus Character.   The task desired status with which to filter the `ListTasks` results.
#' @param launchType Character. The launch type for services to list.
#' @inheritParams CommonDoc
#' 
#' @section maxResults:
#' Pagination
#' limit
#' @section cluster:
#' The short
#' name or full Amazon Resource Name (ARN) of the cluster that hosts the
#' tasks to list. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section containerInstance:
#' The container instance ID or full ARN of
#' the container instance with which to filter the `ListTasks` results.
#' Specifying a `containerInstance` limits the results to tasks that belong
#' to that container instance.
#' @section family:
#' The name of the family
#' with which to filter the `ListTasks` results. Specifying a `family`
#' limits the results to tasks that belong to that
#' family.
#' @section startedBy:
#' The `startedBy` value with which to filter
#' the task results. Specifying a `startedBy` value limits the results to
#' tasks that were started with that value.
#' @section serviceName:
#' The name of
#' the service with which to filter the `ListTasks` results. Specifying a
#' `serviceName` limits the results to tasks that belong to that
#' service.
#' @section desiredStatus:
#' 
#' The task desired status with which to filter the `ListTasks` results.
#' Specifying a `desiredStatus` of `STOPPED` limits the results to tasks
#' that Amazon ECS has set the desired status to `STOPPED`. This can be
#' useful for debugging tasks that are not starting properly or have died
#' or finished. The default status filter is `RUNNING`, which shows tasks
#' that Amazon ECS has set the desired status to `RUNNING`.
#' 
#' Although you can filter results based on a desired status of `PENDING`,
#' this does not return any results. Amazon ECS never sets the desired
#' status of a task to that value (only a task\'s `lastStatus` may have a
#' value of `PENDING`).
#' 
#' @section launchType:
#' The launch type for services to
#' list.
#' @return A list object or a character vector
#' @export
ecs_list_tasks <- function(maxResults = NULL, nextToken = NULL, cluster = NULL, containerInstance = NULL, 
    family = NULL, startedBy = NULL, serviceName = NULL, desiredStatus = NULL, launchType = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    maxResults <- as.character(maxResults)
    nextToken <- as.character(nextToken)
    cluster <- as.character(cluster)
    containerInstance <- as.character(containerInstance)
    family <- as.character(family)
    startedBy <- as.character(startedBy)
    serviceName <- as.character(serviceName)
    desiredStatus <- as.character(desiredStatus)
    launchType <- as.character(launchType)
    parameters <- c(others, list(maxResults = maxResults, nextToken = nextToken, cluster = cluster, 
        containerInstance = containerInstance, family = family, startedBy = startedBy, serviceName = serviceName, 
        desiredStatus = desiredStatus, launchType = launchType))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "ListTasks", parameters = parameters, simplify = simplify, 
        token_name = "nextToken", print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' Put Account Setting
#' 
#' @param name Character. The Amazon ECS resource name for which to modify the account setting.
#' @param value Character. The account setting value for the specified principal ARN.
#' @param principalArn Character. The ARN of the principal, which can be an IAM user, IAM role, or the root user.
#' @inheritParams CommonDoc
#' 
#' @section name:
#' The Amazon ECS resource name for which to
#' modify the account setting. If `serviceLongArnFormat` is specified, the
#' ARN for your Amazon ECS services is affected. If `taskLongArnFormat` is
#' specified, the ARN and resource ID for your Amazon ECS tasks is
#' affected. If `containerInstanceLongArnFormat` is specified, the ARN and
#' resource ID for your Amazon ECS container instances is affected. If
#' `awsvpcTrunking` is specified, the elastic network interface (ENI) limit
#' for your Amazon ECS container instances is affected. If
#' `containerInsights` is specified, the default setting for CloudWatch
#' Container Insights for your clusters is
#' affected.
#' @section value:
#' The account setting value for the
#' specified principal ARN. Accepted values are `enabled` and
#' `disabled`.
#' @section principalArn:
#' The ARN of the principal, which can be
#' an IAM user, IAM role, or the root user. If you specify the root user,
#' it modifies the account setting for all IAM users, IAM roles, and the
#' root user of the account unless an IAM user or role explicitly overrides
#' these settings. If this field is omitted, the setting is changed only
#' for the authenticated user.
#' @return A list object or a character vector
#' @export
ecs_put_account_setting <- function(name = NULL, value = NULL, principalArn = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    name <- as.character(name)
    value <- as.character(value)
    principalArn <- as.character(principalArn)
    parameters <- c(others, list(name = name, value = value, principalArn = principalArn))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "PutAccountSetting", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Put Account Setting Default
#' 
#' Modifies an account setting for all IAM users on an
#' account for whom no individual account setting has been specified.
#' Account settings are set on a per-Region
#' basis.
#' 
#' @param name Character. The resource name for which to modify the account setting.
#' @param value Character. The account setting value for the specified principal ARN.
#' @inheritParams CommonDoc
#' 
#' @section name:
#' The resource name for
#' which to modify the account setting. If `serviceLongArnFormat` is
#' specified, the ARN for your Amazon ECS services is affected. If
#' `taskLongArnFormat` is specified, the ARN and resource ID for your
#' Amazon ECS tasks is affected. If `containerInstanceLongArnFormat` is
#' specified, the ARN and resource ID for your Amazon ECS container
#' instances is affected. If `awsvpcTrunking` is specified, the ENI limit
#' for your Amazon ECS container instances is affected. If
#' `containerInsights` is specified, the default setting for CloudWatch
#' Container Insights for your clusters is
#' affected.
#' @section value:
#' The account setting value for the
#' specified principal ARN. Accepted values are `enabled` and
#' `disabled`.
#' @return A list object or a character vector
#' @export
ecs_put_account_setting_default <- function(name = NULL, value = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    name <- as.character(name)
    value <- as.character(value)
    parameters <- c(others, list(name = name, value = value))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "PutAccountSettingDefault", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that contains the resource to apply...
#' @param attributes List. The attributes to apply to your resource.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource
#' Name (ARN) of the cluster that contains the resource to apply
#' attributes. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section attributes:
#' The attributes to apply to your resource.
#' You can specify up to 10 custom attributes per resource. You can specify
#' up to 10 attributes in a single call.
#' @return A list object or a character vector
#' @export
ecs_put_attributes <- function(cluster = NULL, attributes = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    attributes <- as.list(attributes)
    parameters <- c(others, list(cluster = cluster, attributes = attributes))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "PutAttributes", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Put Cluster Capacity Providers
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster to modify the capacity provider...
#' @param capacityProviders List.   The name of one or more capacity providers to associate with the cluster.
#' @param defaultCapacityProviderStrategy List.   The capacity provider strategy to use by default for the cluster.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name
#' or full Amazon Resource Name (ARN) of the cluster to modify the capacity
#' provider settings for. If you do not specify a cluster, the default
#' cluster is assumed.
#' @section capacityProviders:
#' 
#' The name of one or more capacity providers to associate with the
#' cluster.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' @section defaultCapacityProviderStrategy:
#' 
#' The capacity provider strategy to use by default for the cluster.
#' 
#' When creating a service or running a task on a cluster, if no capacity
#' provider or launch type is specified then the default capacity provider
#' strategy for the cluster is used.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' @return A list object or a character vector
#' @export
ecs_put_cluster_capacity_providers <- function(cluster = NULL, capacityProviders = NULL, defaultCapacityProviderStrategy = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    capacityProviders <- as.list(capacityProviders)
    defaultCapacityProviderStrategy <- as.list(defaultCapacityProviderStrategy)
    parameters <- c(others, list(cluster = cluster, capacityProviders = capacityProviders, defaultCapacityProviderStrategy = defaultCapacityProviderStrategy))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "PutClusterCapacityProviders", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Register Container Instance
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster with which to register your container...
#' @param instanceIdentityDocument Character. The instance identity document for the EC2 instance to register.
#' @param instanceIdentityDocumentSignature Character. The instance identity document signature for the EC2 instance to register.
#' @param totalResources List. The resources available on the instance.
#' @param versionInfo Object. The version information for the Amazon ECS container agent and Docker daemon running on the container...
#' @param containerInstanceArn Character. The ARN of the container instance (if it was previously registered).
#' @param attributes List. The container instance attributes that this container instance supports.
#' @param platformDevices List. The devices that are available on the container instance. The only supported device type is a GPU.
#' @param tags List.   The metadata that you apply to the container instance to help you categorize and organize them.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name (ARN)
#' of the cluster with which to register your container instance. If you do
#' not specify a cluster, the default cluster is
#' assumed.
#' @section instanceIdentityDocument:
#' The instance identity document for the EC2
#' instance to register. This document can be found by running the
#' following command from the instance:
#' `curl http://169.254.169.254/latest/dynamic/instance-identity/document/`
#' 
#' @section instanceIdentityDocumentSignature:
#' The instance identity document signature for the
#' EC2 instance to register. This signature can be found by running the
#' following command from the instance:
#' `curl http://169.254.169.254/latest/dynamic/instance-identity/signature/`
#' 
#' @section totalResources:
#' The resources available on the
#' instance.
#' @section versionInfo:
#' The version information for the Amazon ECS
#' container agent and Docker daemon running on the container
#' instance.
#' @section containerInstanceArn:
#' The ARN of the container instance (if it
#' was previously registered).
#' @section attributes:
#' The container instance
#' attributes that this container instance
#' supports.
#' @section platformDevices:
#' The devices that are available on the
#' container instance. The only supported device type is a
#' GPU.
#' @section tags:
#' 
#' The metadata that you apply to the container instance to help you
#' categorize and organize them. Each tag consists of a key and an optional
#' value, both of which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @return A list object or a character vector
#' @export
ecs_register_container_instance <- function(cluster = NULL, instanceIdentityDocument = NULL, instanceIdentityDocumentSignature = NULL, 
    totalResources = NULL, versionInfo = NULL, containerInstanceArn = NULL, attributes = NULL, platformDevices = NULL, 
    tags = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    instanceIdentityDocument <- as.character(instanceIdentityDocument)
    instanceIdentityDocumentSignature <- as.character(instanceIdentityDocumentSignature)
    containerInstanceArn <- as.character(containerInstanceArn)
    versionInfo <- as.list(versionInfo)
    totalResources <- as.list(totalResources)
    attributes <- as.list(attributes)
    platformDevices <- as.list(platformDevices)
    tags <- as.list(tags)
    parameters <- c(others, list(cluster = cluster, instanceIdentityDocument = instanceIdentityDocument, 
        instanceIdentityDocumentSignature = instanceIdentityDocumentSignature, totalResources = totalResources, 
        versionInfo = versionInfo, containerInstanceArn = containerInstanceArn, attributes = attributes, 
        platformDevices = platformDevices, tags = tags))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "RegisterContainerInstance", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Register Task Definition
#' 
#' @param family Character. You must specify a `family` for a task definition, which allows you to track multiple versions of...
#' @param taskRoleArn Character. The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can...
#' @param executionRoleArn Character. The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS container agent...
#' @param networkMode Character.   The Docker networking mode to use for the containers in the task.
#' @param containerDefinitions List. A list of container definitions in JSON format that describe the different containers that make up...
#' @param volumes List. A list of volume definitions in JSON format that containers in your task may use.
#' @param placementConstraints List. An array of placement constraint objects to use for the task.
#' @param requiresCompatibilities List. The task launch type that Amazon ECS should validate the task definition against.
#' @param cpu Character.   The number of CPU units used by the task.
#' @param memory Character.   The amount of memory (in MiB) used by the task.
#' @param tags List.   The metadata that you apply to the task definition to help you categorize and organize them.
#' @param pidMode Character.   The process namespace to use for the containers in the task.
#' @param ipcMode Character.   The IPC resource namespace to use for the containers in the task.
#' @param proxyConfiguration No description can be found.
#' @param inferenceAccelerators List. The Elastic Inference accelerators to use for the containers in the task.
#' @inheritParams CommonDoc
#' 
#' @section family:
#' You must specify a `family` for a task definition,
#' which allows you to track multiple versions of the same task definition.
#' The `family` is used as a name for your task definition. Up to 255
#' letters (uppercase and lowercase), numbers, and hyphens are
#' allowed.
#' @section taskRoleArn:
#' The short name or full Amazon Resource Name
#' (ARN) of the IAM role that containers in this task can assume. All
#' containers in this task are granted the permissions that are specified
#' in this role. For more information, see [IAM Roles for
#' Tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section executionRoleArn:
#' The Amazon Resource Name (ARN) of the task
#' execution role that grants the Amazon ECS container agent permission to
#' make AWS API calls on your behalf. The task execution IAM role is
#' required depending on the requirements of your task. For more
#' information, see [Amazon ECS task execution IAM
#' role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section networkMode:
#' 
#' The Docker networking mode to use for the containers in the task. The
#' valid values are `none`, `bridge`, `awsvpc`, and `host`. If no network
#' mode is specified, the default is `bridge`.
#' 
#' For Amazon ECS tasks on Fargate, the `awsvpc` network mode is required.
#' For Amazon ECS tasks on Amazon EC2 instances, any network mode can be
#' used. If the network mode is set to `none`, you cannot specify port
#' mappings in your container definitions, and the tasks containers do not
#' have external connectivity. The `host` and `awsvpc` network modes offer
#' the highest networking performance for containers because they use the
#' EC2 network stack instead of the virtualized network stack provided by
#' the `bridge` mode.
#' 
#' With the `host` and `awsvpc` network modes, exposed container ports are
#' mapped directly to the corresponding host port (for the `host` network
#' mode) or the attached elastic network interface port (for the `awsvpc`
#' network mode), so you cannot take advantage of dynamic host port
#' mappings.
#' 
#' When using the `host` network mode, you should not run containers using
#' the root user (UID 0). It is considered best practice to use a non-root
#' user.
#' 
#' If the network mode is `awsvpc`, the task is allocated an elastic
#' network interface, and you must specify a NetworkConfiguration value
#' when you create a service or run a task with the task definition. For
#' more information, see [Task
#' Networking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' Currently, only Amazon ECS-optimized AMIs, other Amazon Linux variants
#' with the `ecs-init` package, or AWS Fargate infrastructure support the
#' `awsvpc` network mode.
#' 
#' If the network mode is `host`, you cannot run multiple instantiations of
#' the same task on a single container instance when port mappings are
#' used.
#' 
#' Docker for Windows uses different network modes than Docker for Linux.
#' When you register a task definition with Windows containers, you must
#' not specify a network mode. If you use the console to register a task
#' definition with Windows containers, you must choose the ``
#' network mode object.
#' 
#' For more information, see [Network
#' settings](https://docs.docker.com/engine/reference/run/#network-settings)
#' in the *Docker run reference*.
#' 
#' @section containerDefinitions:
#' A list of container definitions in JSON format that
#' describe the different containers that make up your
#' task.
#' @section volumes:
#' A list of volume definitions in JSON format
#' that containers in your task may use.
#' @section placementConstraints:
#' An array of
#' placement constraint objects to use for the task. You can specify a
#' maximum of 10 constraints per task (this limit includes constraints in
#' the task definition and those specified at
#' runtime).
#' @section requiresCompatibilities:
#' The task launch type that Amazon ECS
#' should validate the task definition against. This ensures that the task
#' definition parameters are compatible with the specified launch type. If
#' no value is specified, it defaults to `EC2`.
#' @section cpu:
#' 
#' The number of CPU units used by the task. It can be expressed as an
#' integer using CPU units, for example `1024`, or as a string using vCPUs,
#' for example `1 vCPU` or `1 vcpu`, in a task definition. String values
#' are converted to an integer indicating the CPU units when the task
#' definition is registered.
#' 
#' Task-level CPU and memory parameters are ignored for Windows containers.
#' We recommend specifying container-level resources for Windows
#' containers.
#' 
#' If you are using the EC2 launch type, this field is optional. Supported
#' values are between `128` CPU units (`0.125` vCPUs) and `10240` CPU units
#' (`10` vCPUs).
#' 
#' If you are using the Fargate launch type, this field is required and you
#' must use one of the following values, which determines your range of
#' supported values for the `memory` parameter:
#' 
#' -   256 (.25 vCPU) - Available `memory` values: 512 (0.5 GB), 1024 (1
#'     GB), 2048 (2 GB)
#' 
#' -   512 (.5 vCPU) - Available `memory` values: 1024 (1 GB), 2048 (2 GB),
#'     3072 (3 GB), 4096 (4 GB)
#' 
#' -   1024 (1 vCPU) - Available `memory` values: 2048 (2 GB), 3072 (3 GB),
#'     4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 GB), 8192 (8 GB)
#' 
#' -   2048 (2 vCPU) - Available `memory` values: Between 4096 (4 GB) and
#'     16384 (16 GB) in increments of 1024 (1 GB)
#' 
#' -   4096 (4 vCPU) - Available `memory` values: Between 8192 (8 GB) and
#'     30720 (30 GB) in increments of 1024 (1 GB)
#' 
#' @section memory:
#' 
#' The amount of memory (in MiB) used by the task. It can be expressed as
#' an integer using MiB, for example `1024`, or as a string using GB, for
#' example `1GB` or `1 GB`, in a task definition. String values are
#' converted to an integer indicating the MiB when the task definition is
#' registered.
#' 
#' Task-level CPU and memory parameters are ignored for Windows containers.
#' We recommend specifying container-level resources for Windows
#' containers.
#' 
#' If using the EC2 launch type, this field is optional.
#' 
#' If using the Fargate launch type, this field is required and you must
#' use one of the following values, which determines your range of
#' supported values for the `cpu` parameter:
#' 
#' -   512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available `cpu` values: 256
#'     (.25 vCPU)
#' 
#' -   1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available `cpu`
#'     values: 512 (.5 vCPU)
#' 
#' -   2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB),
#'     7168 (7 GB), 8192 (8 GB) - Available `cpu` values: 1024 (1 vCPU)
#' 
#' -   Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) -
#'     Available `cpu` values: 2048 (2 vCPU)
#' 
#' -   Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) -
#'     Available `cpu` values: 4096 (4 vCPU)
#' 
#' @section tags:
#' 
#' The metadata that you apply to the task definition to help you
#' categorize and organize them. Each tag consists of a key and an optional
#' value, both of which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @section pidMode:
#' 
#' The process namespace to use for the containers in the task. The valid
#' values are `host` or `task`. If `host` is specified, then all containers
#' within the tasks that specified the `host` PID mode on the same
#' container instance share the same process namespace with the host Amazon
#' EC2 instance. If `task` is specified, all containers within the
#' specified task share the same process namespace. If no value is
#' specified, the default is a private namespace. For more information, see
#' [PID
#' settings](https://docs.docker.com/engine/reference/run/#pid-settings---pid)
#' in the *Docker run reference*.
#' 
#' If the `host` PID mode is used, be aware that there is a heightened risk
#' of undesired process namespace expose. For more information, see [Docker
#' security](https://docs.docker.com/engine/security/security/).
#' 
#' This parameter is not supported for Windows containers or tasks using
#' the Fargate launch type.
#' 
#' @section ipcMode:
#' 
#' The IPC resource namespace to use for the containers in the task. The
#' valid values are `host`, `task`, or `none`. If `host` is specified, then
#' all containers within the tasks that specified the `host` IPC mode on
#' the same container instance share the same IPC resources with the host
#' Amazon EC2 instance. If `task` is specified, all containers within the
#' specified task share the same IPC resources. If `none` is specified,
#' then IPC resources within the containers of a task are private and not
#' shared with other containers in a task or on the container instance. If
#' no value is specified, then the IPC resource namespace sharing depends
#' on the Docker daemon setting on the container instance. For more
#' information, see [IPC
#' settings](https://docs.docker.com/engine/reference/run/#ipc-settings---ipc)
#' in the *Docker run reference*.
#' 
#' If the `host` IPC mode is used, be aware that there is a heightened risk
#' of undesired IPC namespace expose. For more information, see [Docker
#' security](https://docs.docker.com/engine/security/security/).
#' 
#' If you are setting namespaced kernel parameters using `systemControls`
#' for the containers in the task, the following will apply to your IPC
#' resource namespace. For more information, see [System
#' Controls](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' -   For tasks that use the `host` IPC mode, IPC namespace related
#'     `systemControls` are not supported.
#' 
#' -   For tasks that use the `task` IPC mode, IPC namespace related
#'     `systemControls` will apply to all containers within a task.
#' 
#' This parameter is not supported for Windows containers or tasks using
#' the Fargate launch type.
#' 
#' @section proxyConfiguration:
#' No description can be found.
#' @section inferenceAccelerators:
#' The Elastic Inference
#' accelerators to use for the containers in the task.
#' @return A list object or a character vector
#' @export
ecs_register_task_definition <- function(family = NULL, taskRoleArn = NULL, executionRoleArn = NULL, 
    networkMode = NULL, containerDefinitions = NULL, volumes = NULL, placementConstraints = NULL, requiresCompatibilities = NULL, 
    cpu = NULL, memory = NULL, tags = NULL, pidMode = NULL, ipcMode = NULL, proxyConfiguration = NULL, 
    inferenceAccelerators = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    family <- as.character(family)
    taskRoleArn <- as.character(taskRoleArn)
    executionRoleArn <- as.character(executionRoleArn)
    networkMode <- as.character(networkMode)
    cpu <- as.character(cpu)
    memory <- as.character(memory)
    pidMode <- as.character(pidMode)
    ipcMode <- as.character(ipcMode)
    containerDefinitions <- as.list(containerDefinitions)
    volumes <- as.list(volumes)
    placementConstraints <- as.list(placementConstraints)
    requiresCompatibilities <- as.list(requiresCompatibilities)
    tags <- as.list(tags)
    inferenceAccelerators <- as.list(inferenceAccelerators)
    parameters <- c(others, list(family = family, taskRoleArn = taskRoleArn, executionRoleArn = executionRoleArn, 
        networkMode = networkMode, containerDefinitions = containerDefinitions, volumes = volumes, 
        placementConstraints = placementConstraints, requiresCompatibilities = requiresCompatibilities, 
        cpu = cpu, memory = memory, tags = tags, pidMode = pidMode, ipcMode = ipcMode, proxyConfiguration = proxyConfiguration, 
        inferenceAccelerators = inferenceAccelerators))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "RegisterTaskDefinition", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Run Task
#' 
#' @param capacityProviderStrategy List.   The capacity provider strategy to use for the task.
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster on which to run your task.
#' @param count Integer. The number of instantiations of the specified task to place on your cluster.
#' @param enableECSManagedTags Logical. Specifies whether to enable Amazon ECS managed tags for the task.
#' @param group Character. The name of the task group to associate with the task.
#' @param launchType Character.   The launch type on which to run your task.
#' @param networkConfiguration Object. The network configuration for the task.
#' @param overrides Object.   A list of container overrides in JSON format that specify the name of a container in the specified...
#' @param placementConstraints List. An array of placement constraint objects to use for the task.
#' @param placementStrategy List. The placement strategy objects to use for the task.
#' @param platformVersion Character. The platform version the task should run.
#' @param propagateTags Character.   Specifies whether to propagate the tags from the task definition to the task.
#' @param referenceId Character. The reference ID to use for the task.
#' @param startedBy Character.   An optional tag specified when a task is started.
#' @param tags List.   The metadata that you apply to the task to help you categorize and organize them.
#' @param taskDefinition Character. The `family` and `revision` (`family:revision`) or full ARN of the task definition to run.
#' @inheritParams CommonDoc
#' 
#' @section capacityProviderStrategy:
#' 
#' The capacity provider strategy to use for the task.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If a `capacityProviderStrategy` is specified, the `launchType` parameter
#' must be omitted. If no `capacityProviderStrategy` or `launchType` is
#' specified, the `defaultCapacityProviderStrategy` for the cluster is
#' used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' The PutClusterCapacityProviders API operation is used to update the list
#' of available capacity providers for a cluster after the cluster is
#' created.
#' 
#' @section cluster:
#' The short name or full Amazon Resource Name (ARN)
#' of the cluster on which to run your task. If you do not specify a
#' cluster, the default cluster is assumed.
#' @section count:
#' The number
#' of instantiations of the specified task to place on your cluster. You
#' can specify up to 10 tasks per call.
#' @section enableECSManagedTags:
#' Specifies
#' whether to enable Amazon ECS managed tags for the task. For more
#' information, see [Tagging Your Amazon ECS
#' Resources](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section group:
#' The name of the task group to associate with
#' the task. The default value is the family name of the task definition
#' (for example, family:my-family-name).
#' @section launchType:
#' 
#' The launch type on which to run your task. For more information, see
#' [Amazon ECS Launch
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' If a `launchType` is specified, the `capacityProviderStrategy` parameter
#' must be omitted.
#' 
#' @section networkConfiguration:
#' The network configuration for the task. This
#' parameter is required for task definitions that use the `awsvpc` network
#' mode to receive their own elastic network interface, and it is not
#' supported for other network modes. For more information, see [Task
#' Networking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section overrides:
#' 
#' A list of container overrides in JSON format that specify the name of a
#' container in the specified task definition and the overrides it should
#' receive. You can override the default command for a container (that is
#' specified in the task definition or Docker image) with a `command`
#' override. You can also override existing environment variables (that are
#' specified in the task definition or Docker image) on a container or add
#' new environment variables to it with an `environment` override.
#' 
#' A total of 8192 characters are allowed for overrides. This limit
#' includes the JSON formatting characters of the override structure.
#' 
#' @section placementConstraints:
#' An array of placement constraint objects to use for
#' the task. You can specify up to 10 constraints per task (including
#' constraints in the task definition and those specified at
#' runtime).
#' @section placementStrategy:
#' The placement strategy objects to use for
#' the task. You can specify a maximum of five strategy rules per
#' task.
#' @section platformVersion:
#' The platform version the task should run. A
#' platform version is only specified for tasks using the Fargate launch
#' type. If one is not specified, the `LATEST` platform version is used by
#' default. For more information, see [AWS Fargate Platform
#' Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section propagateTags:
#' 
#' Specifies whether to propagate the tags from the task definition to the
#' task. If no value is specified, the tags are not propagated. Tags can
#' only be propagated to the task during task creation. To add tags to a
#' task after task creation, use the TagResource API action.
#' 
#' An error will be received if you specify the `SERVICE` option when
#' running a task.
#' 
#' @section referenceId:
#' The reference ID to use for the
#' task.
#' @section startedBy:
#' 
#' An optional tag specified when a task is started. For example, if you
#' automatically trigger a task to run a batch process job, you could apply
#' a unique identifier for that job to your task with the `startedBy`
#' parameter. You can then identify which tasks belong to that job by
#' filtering the results of a ListTasks call with the `startedBy` value. Up
#' to 36 letters (uppercase and lowercase), numbers, hyphens, and
#' underscores are allowed.
#' 
#' If a task is started by an Amazon ECS service, then the `startedBy`
#' parameter contains the deployment ID of the service that starts it.
#' 
#' @section tags:
#' 
#' The metadata that you apply to the task to help you categorize and
#' organize them. Each tag consists of a key and an optional value, both of
#' which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @section taskDefinition:
#' The `family` and `revision` (`family:revision`) or
#' full ARN of the task definition to run. If a `revision` is not
#' specified, the latest `ACTIVE` revision is used.
#' @return A list object or a character vector
#' @export
ecs_run_task <- function(capacityProviderStrategy = NULL, cluster = NULL, count = NULL, enableECSManagedTags = NULL, 
    group = NULL, launchType = NULL, networkConfiguration = NULL, overrides = NULL, placementConstraints = NULL, 
    placementStrategy = NULL, platformVersion = NULL, propagateTags = NULL, referenceId = NULL, startedBy = NULL, 
    tags = NULL, taskDefinition = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    group <- as.character(group)
    launchType <- as.character(launchType)
    platformVersion <- as.character(platformVersion)
    propagateTags <- as.character(propagateTags)
    referenceId <- as.character(referenceId)
    startedBy <- as.character(startedBy)
    taskDefinition <- as.character(taskDefinition)
    networkConfiguration <- as.list(networkConfiguration)
    overrides <- as.list(overrides)
    capacityProviderStrategy <- as.list(capacityProviderStrategy)
    placementConstraints <- as.list(placementConstraints)
    placementStrategy <- as.list(placementStrategy)
    tags <- as.list(tags)
    count <- as.integer(count)
    enableECSManagedTags <- as.logical(enableECSManagedTags)
    parameters <- c(others, list(capacityProviderStrategy = capacityProviderStrategy, cluster = cluster, 
        count = count, enableECSManagedTags = enableECSManagedTags, group = group, launchType = launchType, 
        networkConfiguration = networkConfiguration, overrides = overrides, placementConstraints = placementConstraints, 
        placementStrategy = placementStrategy, platformVersion = platformVersion, propagateTags = propagateTags, 
        referenceId = referenceId, startedBy = startedBy, tags = tags, taskDefinition = taskDefinition))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "RunTask", parameters = parameters, simplify = simplify, 
        token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' Start Task
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster on which to start your task.
#' @param containerInstances List. The container instance IDs or full ARN entries for the container instances on which you would like...
#' @param enableECSManagedTags Logical. Specifies whether to enable Amazon ECS managed tags for the task.
#' @param group Character. The name of the task group to associate with the task.
#' @param networkConfiguration Object. The VPC subnet and security group configuration for tasks that receive their own elastic network...
#' @param overrides Object.   A list of container overrides in JSON format that specify the name of a container in the specified...
#' @param propagateTags Character. Specifies whether to propagate the tags from the task definition or the service to the task.
#' @param referenceId Character. The reference ID to use for the task.
#' @param startedBy Character.   An optional tag specified when a task is started.
#' @param tags List.   The metadata that you apply to the task to help you categorize and organize them.
#' @param taskDefinition Character. The `family` and `revision` (`family:revision`) or full ARN of the task definition to start.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The
#' short name or full Amazon Resource Name (ARN) of the cluster on which to
#' start your task. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section containerInstances:
#' The container instance IDs or full ARN
#' entries for the container instances on which you would like to place
#' your task. You can specify up to 10 container
#' instances.
#' @section enableECSManagedTags:
#' Specifies whether to enable Amazon ECS
#' managed tags for the task. For more information, see [Tagging Your
#' Amazon ECS
#' Resources](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section group:
#' The name of the task group to associate with
#' the task. The default value is the family name of the task definition
#' (for example, family:my-family-name).
#' @section networkConfiguration:
#' The VPC subnet
#' and security group configuration for tasks that receive their own
#' elastic network interface by using the `awsvpc` networking
#' mode.
#' @section overrides:
#' 
#' A list of container overrides in JSON format that specify the name of a
#' container in the specified task definition and the overrides it should
#' receive. You can override the default command for a container (that is
#' specified in the task definition or Docker image) with a `command`
#' override. You can also override existing environment variables (that are
#' specified in the task definition or Docker image) on a container or add
#' new environment variables to it with an `environment` override.
#' 
#' A total of 8192 characters are allowed for overrides. This limit
#' includes the JSON formatting characters of the override structure.
#' 
#' @section propagateTags:
#' Specifies whether to propagate the tags from the
#' task definition or the service to the task. If no value is specified,
#' the tags are not propagated.
#' @section referenceId:
#' The reference ID to use
#' for the task.
#' @section startedBy:
#' 
#' An optional tag specified when a task is started. For example, if you
#' automatically trigger a task to run a batch process job, you could apply
#' a unique identifier for that job to your task with the `startedBy`
#' parameter. You can then identify which tasks belong to that job by
#' filtering the results of a ListTasks call with the `startedBy` value. Up
#' to 36 letters (uppercase and lowercase), numbers, hyphens, and
#' underscores are allowed.
#' 
#' If a task is started by an Amazon ECS service, then the `startedBy`
#' parameter contains the deployment ID of the service that starts it.
#' 
#' @section tags:
#' 
#' The metadata that you apply to the task to help you categorize and
#' organize them. Each tag consists of a key and an optional value, both of
#' which you define.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @section taskDefinition:
#' The `family` and `revision` (`family:revision`) or
#' full ARN of the task definition to start. If a `revision` is not
#' specified, the latest `ACTIVE` revision is used.
#' @return A list object or a character vector
#' @export
ecs_start_task <- function(cluster = NULL, containerInstances = NULL, enableECSManagedTags = NULL, 
    group = NULL, networkConfiguration = NULL, overrides = NULL, propagateTags = NULL, referenceId = NULL, 
    startedBy = NULL, tags = NULL, taskDefinition = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    group <- as.character(group)
    propagateTags <- as.character(propagateTags)
    referenceId <- as.character(referenceId)
    startedBy <- as.character(startedBy)
    taskDefinition <- as.character(taskDefinition)
    networkConfiguration <- as.list(networkConfiguration)
    overrides <- as.list(overrides)
    containerInstances <- as.list(containerInstances)
    tags <- as.list(tags)
    enableECSManagedTags <- as.logical(enableECSManagedTags)
    parameters <- c(others, list(cluster = cluster, containerInstances = containerInstances, enableECSManagedTags = enableECSManagedTags, 
        group = group, networkConfiguration = networkConfiguration, overrides = overrides, propagateTags = propagateTags, 
        referenceId = referenceId, startedBy = startedBy, tags = tags, taskDefinition = taskDefinition))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "StartTask", parameters = parameters, simplify = simplify, 
        token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' Stop Task
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task to stop.
#' @param task Character. The task ID or full Amazon Resource Name (ARN) of the task to stop.
#' @param reason Character. An optional message specified when a task is stopped.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The
#' short name or full Amazon Resource Name (ARN) of the cluster that hosts
#' the task to stop. If you do not specify a cluster, the default cluster
#' is assumed.
#' @section task:
#' The task ID or full Amazon Resource Name
#' (ARN) of the task to stop.
#' @section reason:
#' An optional message
#' specified when a task is stopped. For example, if you are using a custom
#' scheduler, you can use this parameter to specify the reason for stopping
#' the task here, and the message appears in subsequent DescribeTasks API
#' operations on this task. Up to 255 characters are allowed in this
#' message.
#' @return A list object or a character vector
#' @export
ecs_stop_task <- function(cluster = NULL, task = NULL, reason = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    task <- as.character(task)
    reason <- as.character(reason)
    parameters <- c(others, list(cluster = cluster, task = task, reason = reason))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "StopTask", parameters = parameters, simplify = simplify, 
        token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' Submit Attachment State Changes
#' 
#' @param cluster Character. The short name or full ARN of the cluster that hosts the container instance the attachment belongs...
#' @param attachments List. Any attachments associated with the state change request.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full ARN of the cluster
#' that hosts the container instance the attachment belongs
#' to.
#' @section attachments:
#' Any attachments associated with the state change
#' request.
#' @return A list object or a character vector
#' @export
ecs_submit_attachment_state_changes <- function(cluster = NULL, attachments = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    attachments <- as.list(attachments)
    parameters <- c(others, list(cluster = cluster, attachments = attachments))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitAttachmentStateChanges", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Submit Container State Change
#' 
#' @param cluster Character. The short name or full ARN of the cluster that hosts the container.
#' @param task Character. The task ID or full Amazon Resource Name (ARN) of the task that hosts the container.
#' @param containerName Character. The name of the container.
#' @param runtimeId Character. The ID of the Docker container.
#' @param status Character. The status of the state change request.
#' @param exitCode Integer. The exit code returned for the state change request.
#' @param reason Character. The reason for the state change request.
#' @param networkBindings List. The network bindings of the container.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full ARN of the cluster
#' that hosts the container.
#' @section task:
#' The task ID or full Amazon
#' Resource Name (ARN) of the task that hosts the
#' container.
#' @section containerName:
#' The name of the
#' container.
#' @section runtimeId:
#' The ID of the Docker
#' container.
#' @section status:
#' The status of the state change
#' request.
#' @section exitCode:
#' The exit code returned for the state change
#' request.
#' @section reason:
#' The reason for the state change
#' request.
#' @section networkBindings:
#' The network bindings of the
#' container.
#' @return A list object or a character vector
#' @export
ecs_submit_container_state_change <- function(cluster = NULL, task = NULL, containerName = NULL, runtimeId = NULL, 
    status = NULL, exitCode = NULL, reason = NULL, networkBindings = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    task <- as.character(task)
    containerName <- as.character(containerName)
    runtimeId <- as.character(runtimeId)
    status <- as.character(status)
    reason <- as.character(reason)
    networkBindings <- as.list(networkBindings)
    exitCode <- as.integer(exitCode)
    parameters <- c(others, list(cluster = cluster, task = task, containerName = containerName, runtimeId = runtimeId, 
        status = status, exitCode = exitCode, reason = reason, networkBindings = networkBindings))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitContainerStateChange", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Submit Task State Change
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task.
#' @param task Character. The task ID or full ARN of the task in the state change request.
#' @param status Character. The status of the state change request.
#' @param reason Character. The reason for the state change request.
#' @param containers List. Any containers associated with the state change request.
#' @param attachments List. Any attachments associated with the state change request.
#' @param pullStartedAt Character. The Unix timestamp for when the container image pull began.
#' @param pullStoppedAt Character. The Unix timestamp for when the container image pull completed.
#' @param executionStoppedAt Character. The Unix timestamp for when the task execution stopped.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource
#' Name (ARN) of the cluster that hosts the task.
#' @section task:
#' The
#' task ID or full ARN of the task in the state change
#' request.
#' @section status:
#' The status of the state change
#' request.
#' @section reason:
#' The reason for the state change
#' request.
#' @section containers:
#' Any containers associated with the state
#' change request.
#' @section attachments:
#' Any attachments associated with the
#' state change request.
#' @section pullStartedAt:
#' The Unix timestamp for when
#' the container image pull began.
#' @section pullStoppedAt:
#' The Unix timestamp
#' for when the container image pull completed.
#' @section executionStoppedAt:
#' The
#' Unix timestamp for when the task execution
#' stopped.
#' @return A list object or a character vector
#' @export
ecs_submit_task_state_change <- function(cluster = NULL, task = NULL, status = NULL, reason = NULL, 
    containers = NULL, attachments = NULL, pullStartedAt = NULL, pullStoppedAt = NULL, executionStoppedAt = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    task <- as.character(task)
    status <- as.character(status)
    reason <- as.character(reason)
    pullStartedAt <- as.character(pullStartedAt)
    pullStoppedAt <- as.character(pullStoppedAt)
    executionStoppedAt <- as.character(executionStoppedAt)
    containers <- as.list(containers)
    attachments <- as.list(attachments)
    parameters <- c(others, list(cluster = cluster, task = task, status = status, reason = reason, 
        containers = containers, attachments = attachments, pullStartedAt = pullStartedAt, pullStoppedAt = pullStoppedAt, 
        executionStoppedAt = executionStoppedAt))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "SubmitTaskStateChange", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Tag Resource
#' 
#' Associates the specified tags to a resource with
#' the specified `resourceArn`. If existing tags on a resource are not
#' specified in the request parameters, they are not changed. When a
#' resource is deleted, the tags associated with that resource are deleted
#' as well.
#' 
#' @param resourceArn Character. The Amazon Resource Name (ARN) of the resource to which to add tags.
#' @param tags List.   The tags to add to the resource.
#' @inheritParams CommonDoc
#' 
#' @section resourceArn:
#' The Amazon Resource Name (ARN) of the
#' resource to which to add tags. Currently, the supported resources are
#' Amazon ECS capacity providers, tasks, services, task definitions,
#' clusters, and container instances.
#' @section tags:
#' 
#' The tags to add to the resource. A tag is an array of key-value pairs.
#' 
#' The following basic restrictions apply to tags:
#' 
#' -   Maximum number of tags per resource - 50
#' 
#' -   For each resource, each tag key must be unique, and each tag key can
#'     have only one value.
#' 
#' -   Maximum key length - 128 Unicode characters in UTF-8
#' 
#' -   Maximum value length - 256 Unicode characters in UTF-8
#' 
#' -   If your tagging schema is used across multiple services and
#'     resources, remember that other services may have restrictions on
#'     allowed characters. Generally allowed characters are: letters,
#'     numbers, and spaces representable in UTF-8, and the following
#'     characters: + - = . _ : / @.
#' 
#' -   Tag keys and values are case-sensitive.
#' 
#' -   Do not use `aws:`, `AWS:`, or any upper or lowercase combination of
#'     such as a prefix for either keys or values as it is reserved for AWS
#'     use. You cannot edit or delete tag keys or values with this prefix.
#'     Tags with this prefix do not count against your tags per resource
#'     limit.
#' 
#' @return A list object or a character vector
#' @export
ecs_tag_resource <- function(resourceArn = NULL, tags = NULL, simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), 
    retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    resourceArn <- as.character(resourceArn)
    tags <- as.list(tags)
    parameters <- c(others, list(resourceArn = resourceArn, tags = tags))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "TagResource", parameters = parameters, simplify = simplify, 
        token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, network_timeout = network_timeout)
}


#' Untag Resource
#' 
#' Deletes specified tags from a
#' resource.
#' 
#' @param resourceArn Character. The Amazon Resource Name (ARN) of the resource from which to delete tags.
#' @param tagKeys List. The keys of the tags to be removed.
#' @inheritParams CommonDoc
#' 
#' @section resourceArn:
#' The Amazon Resource Name (ARN) of the resource from
#' which to delete tags. Currently, the supported resources are Amazon ECS
#' capacity providers, tasks, services, task definitions, clusters, and
#' container instances.
#' @section tagKeys:
#' The keys of the tags to be
#' removed.
#' @return A list object or a character vector
#' @export
ecs_untag_resource <- function(resourceArn = NULL, tagKeys = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    resourceArn <- as.character(resourceArn)
    tagKeys <- as.list(tagKeys)
    parameters <- c(others, list(resourceArn = resourceArn, tagKeys = tagKeys))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UntagResource", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Capacity Provider
#' 
#' Modifies the parameters for a capacity
#' provider.
#' 
#' @param name Character. The name of the capacity provider to update.
#' @param autoScalingGroupProvider Object. An object representing the parameters to update for the Auto Scaling group capacity provider.
#' @inheritParams CommonDoc
#' 
#' @section name:
#' The name of the capacity provider to
#' update.
#' @section autoScalingGroupProvider:
#' An object representing the parameters to
#' update for the Auto Scaling group capacity
#' provider.
#' @return A list object or a character vector
#' @export
ecs_update_capacity_provider <- function(name = NULL, autoScalingGroupProvider = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    name <- as.character(name)
    autoScalingGroupProvider <- as.list(autoScalingGroupProvider)
    parameters <- c(others, list(name = name, autoScalingGroupProvider = autoScalingGroupProvider))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateCapacityProvider", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Cluster Settings
#' 
#' Modifies the settings to use for a
#' cluster.
#' 
#' @param cluster Character. The name of the cluster to modify the settings for.
#' @param settings List. The setting to use by default for a cluster.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The name of the cluster to modify the
#' settings for.
#' @section settings:
#' The setting to use by default for a
#' cluster. This parameter is used to enable CloudWatch Container Insights
#' for a cluster. If this value is specified, it will override the
#' `containerInsights` value set with PutAccountSetting or
#' PutAccountSettingDefault.
#' @return A list object or a character vector
#' @export
ecs_update_cluster_settings <- function(cluster = NULL, settings = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    settings <- as.list(settings)
    parameters <- c(others, list(cluster = cluster, settings = settings))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateClusterSettings", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Container Agent
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that your container instance is...
#' @param containerInstance Character. The container instance ID or full ARN entries for the container instance on which you would like...
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full
#' Amazon Resource Name (ARN) of the cluster that your container instance
#' is running on. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section containerInstance:
#' The container instance ID or full ARN
#' entries for the container instance on which you would like to update the
#' Amazon ECS container agent.
#' @return A list object or a character vector
#' @export
ecs_update_container_agent <- function(cluster = NULL, containerInstance = NULL, simplify = TRUE, others = list(), 
    print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    containerInstance <- as.character(containerInstance)
    parameters <- c(others, list(cluster = cluster, containerInstance = containerInstance))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateContainerAgent", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Container Instances State
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instance...
#' @param containerInstances List. A list of container instance IDs or full ARN entries.
#' @param status Character. The container instance state with which to update the container instance.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full
#' Amazon Resource Name (ARN) of the cluster that hosts the container
#' instance to update. If you do not specify a cluster, the default cluster
#' is assumed.
#' @section containerInstances:
#' A list of container instance IDs or full
#' ARN entries.
#' @section status:
#' The container instance state with which
#' to update the container instance. The only valid values for this action
#' are `ACTIVE` and `DRAINING`. A container instance can only be updated to
#' `DRAINING` status once it has reached an `ACTIVE` state. If a container
#' instance is in `REGISTERING`, `DEREGISTERING`, or `REGISTRATION_FAILED`
#' state you can describe the container instance but will be unable to
#' update the container instance state.
#' @return A list object or a character vector
#' @export
ecs_update_container_instances_state <- function(cluster = NULL, containerInstances = NULL, status = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    status <- as.character(status)
    containerInstances <- as.list(containerInstances)
    parameters <- c(others, list(cluster = cluster, containerInstances = containerInstances, status = status))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateContainerInstancesState", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Service
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that your service is running on.
#' @param service Character. The name of the service to update.
#' @param desiredCount Integer. The number of instantiations of the task to place and keep running in your service.
#' @param taskDefinition Character. The `family` and `revision` (`family:revision`) or full ARN of the task definition to run in your...
#' @param capacityProviderStrategy List.   The capacity provider strategy to update the service to use.
#' @param deploymentConfiguration Object. Optional deployment parameters that control how many tasks run during the deployment and the ordering...
#' @param networkConfiguration No description can be found.
#' @param placementConstraints List.   An array of task placement constraint objects to update the service to use.
#' @param placementStrategy List.   The task placement strategy objects to update the service to use.
#' @param platformVersion Character. The platform version on which your tasks in the service are running.
#' @param forceNewDeployment Logical. Whether to force a new deployment of the service.
#' @param healthCheckGracePeriodSeconds Integer. The period of time, in seconds, that the Amazon ECS service scheduler should ignore unhealthy Elastic...
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name
#' or full Amazon Resource Name (ARN) of the cluster that your service is
#' running on. If you do not specify a cluster, the default cluster is
#' assumed.
#' @section service:
#' The name of the service to
#' update.
#' @section desiredCount:
#' The number of instantiations of the task to
#' place and keep running in your service.
#' @section taskDefinition:
#' The `family`
#' and `revision` (`family:revision`) or full ARN of the task definition to
#' run in your service. If a `revision` is not specified, the latest
#' `ACTIVE` revision is used. If you modify the task definition with
#' `UpdateService`, Amazon ECS spawns a task with the new version of the
#' task definition and then stops an old task after the new version is
#' running.
#' @section capacityProviderStrategy:
#' 
#' The capacity provider strategy to update the service to use.
#' 
#' If the service is using the default capacity provider strategy for the
#' cluster, the service can be updated to use one or more capacity
#' providers as opposed to the default capacity provider strategy. However,
#' when a service is using a capacity provider strategy that is not the
#' default capacity provider strategy, the service cannot be updated to use
#' the cluster\'s default capacity provider strategy.
#' 
#' A capacity provider strategy consists of one or more capacity providers
#' along with the `base` and `weight` to assign to them. A capacity
#' provider must be associated with the cluster to be used in a capacity
#' provider strategy. The PutClusterCapacityProviders API is used to
#' associate a capacity provider with a cluster. Only capacity providers
#' with an `ACTIVE` or `UPDATING` status can be used.
#' 
#' If specifying a capacity provider that uses an Auto Scaling group, the
#' capacity provider must already be created. New capacity providers can be
#' created with the CreateCapacityProvider API operation.
#' 
#' To use a AWS Fargate capacity provider, specify either the `FARGATE` or
#' `FARGATE_SPOT` capacity providers. The AWS Fargate capacity providers
#' are available to all accounts and only need to be associated with a
#' cluster to be used.
#' 
#' The PutClusterCapacityProviders API operation is used to update the list
#' of available capacity providers for a cluster after the cluster is
#' created.
#' 
#' @section deploymentConfiguration:
#' Optional deployment parameters that control how
#' many tasks run during the deployment and the ordering of stopping and
#' starting tasks.
#' @section networkConfiguration:
#' No description can be found.
#' @section placementConstraints:
#' 
#' An array of task placement constraint objects to update the service to
#' use. If no value is specified, the existing placement constraints for
#' the service will remain unchanged. If this value is specified, it will
#' override any existing placement constraints defined for the service. To
#' remove all existing placement constraints, specify an empty array.
#' 
#' You can specify a maximum of 10 constraints per task (this limit
#' includes constraints in the task definition and those specified at
#' runtime).
#' 
#' @section placementStrategy:
#' 
#' The task placement strategy objects to update the service to use. If no
#' value is specified, the existing placement strategy for the service will
#' remain unchanged. If this value is specified, it will override the
#' existing placement strategy defined for the service. To remove an
#' existing placement strategy, specify an empty object.
#' 
#' You can specify a maximum of five strategy rules per service.
#' 
#' @section platformVersion:
#' The platform version on which your tasks in the
#' service are running. A platform version is only specified for tasks
#' using the Fargate launch type. If a platform version is not specified,
#' the `LATEST` platform version is used by default. For more information,
#' see [AWS Fargate Platform
#' Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
#' in the *Amazon Elastic Container Service Developer
#' Guide*.
#' @section forceNewDeployment:
#' Whether to force a new deployment of the
#' service. Deployments are not forced by default. You can use this option
#' to trigger a new deployment with no service definition changes. For
#' example, you can update a service\'s tasks to use a newer Docker image
#' with the same image/tag combination (`my_image:latest`) or to roll
#' Fargate tasks onto a newer platform version.
#' @section healthCheckGracePeriodSeconds:
#' The
#' period of time, in seconds, that the Amazon ECS service scheduler should
#' ignore unhealthy Elastic Load Balancing target health checks after a
#' task has first started. This is only valid if your service is configured
#' to use a load balancer. If your service\'s tasks take a while to start
#' and respond to Elastic Load Balancing health checks, you can specify a
#' health check grace period of up to 2,147,483,647 seconds. During that
#' time, the Amazon ECS service scheduler ignores the Elastic Load
#' Balancing health check status. This grace period can prevent the ECS
#' service scheduler from marking tasks as unhealthy and stopping them
#' before they have time to come up.
#' @return A list object or a character vector
#' @export
ecs_update_service <- function(cluster = NULL, service = NULL, desiredCount = NULL, taskDefinition = NULL, 
    capacityProviderStrategy = NULL, deploymentConfiguration = NULL, networkConfiguration = NULL, placementConstraints = NULL, 
    placementStrategy = NULL, platformVersion = NULL, forceNewDeployment = NULL, healthCheckGracePeriodSeconds = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    taskDefinition <- as.character(taskDefinition)
    platformVersion <- as.character(platformVersion)
    deploymentConfiguration <- as.list(deploymentConfiguration)
    capacityProviderStrategy <- as.list(capacityProviderStrategy)
    placementConstraints <- as.list(placementConstraints)
    placementStrategy <- as.list(placementStrategy)
    desiredCount <- as.integer(desiredCount)
    healthCheckGracePeriodSeconds <- as.integer(healthCheckGracePeriodSeconds)
    forceNewDeployment <- as.logical(forceNewDeployment)
    parameters <- c(others, list(cluster = cluster, service = service, desiredCount = desiredCount, 
        taskDefinition = taskDefinition, capacityProviderStrategy = capacityProviderStrategy, deploymentConfiguration = deploymentConfiguration, 
        networkConfiguration = networkConfiguration, placementConstraints = placementConstraints, placementStrategy = placementStrategy, 
        platformVersion = platformVersion, forceNewDeployment = forceNewDeployment, healthCheckGracePeriodSeconds = healthCheckGracePeriodSeconds))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateService", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
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
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the...
#' @param service Character. The short name or full Amazon Resource Name (ARN) of the service that the task set exists in.
#' @param primaryTaskSet Character. The short name or full Amazon Resource Name (ARN) of the task set to set as the primary task set...
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or
#' full Amazon Resource Name (ARN) of the cluster that hosts the service
#' that the task set exists in.
#' @section service:
#' The short name or full
#' Amazon Resource Name (ARN) of the service that the task set exists
#' in.
#' @section primaryTaskSet:
#' The short name or full Amazon Resource Name
#' (ARN) of the task set to set as the primary task set in the
#' deployment.
#' @return A list object or a character vector
#' @export
ecs_update_service_primary_task_set <- function(cluster = NULL, service = NULL, primaryTaskSet = NULL, 
    simplify = TRUE, others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    primaryTaskSet <- as.character(primaryTaskSet)
    parameters <- c(others, list(cluster = cluster, service = service, primaryTaskSet = primaryTaskSet))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateServicePrimaryTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}


#' Update Task Set
#' 
#' Modifies a task set. This is used when a
#' service uses the `EXTERNAL` deployment controller type. For more
#' information, see [Amazon ECS Deployment
#' Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html)
#' in the *Amazon Elastic Container Service Developer Guide*.
#' 
#' @param cluster Character. The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the...
#' @param service Character. The short name or full Amazon Resource Name (ARN) of the service that the task set exists in.
#' @param taskSet Character. The short name or full Amazon Resource Name (ARN) of the task set to update.
#' @param scale No description can be found.
#' @inheritParams CommonDoc
#' 
#' @section cluster:
#' The short name or full Amazon Resource
#' Name (ARN) of the cluster that hosts the service that the task set
#' exists in.
#' @section service:
#' The short name or full Amazon Resource
#' Name (ARN) of the service that the task set exists
#' in.
#' @section taskSet:
#' The short name or full Amazon Resource Name
#' (ARN) of the task set to update.
#' @section scale:
#' No description can be found.
#' @return A list object or a character vector
#' @export
ecs_update_task_set <- function(cluster = NULL, service = NULL, taskSet = NULL, scale = NULL, simplify = TRUE, 
    others = list(), print_on_error = aws_get_print_on_error(), retry_time = aws_get_retry_time(), 
    network_timeout = aws_get_network_timeout()) {
    cluster <- as.character(cluster)
    service <- as.character(service)
    taskSet <- as.character(taskSet)
    parameters <- c(others, list(cluster = cluster, service = service, taskSet = taskSet, scale = scale))
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request = ecs_request, action = "UpdateTaskSet", parameters = parameters, 
        simplify = simplify, token_name = NULL, print_on_error = print_on_error, retry_time = retry_time, 
        network_timeout = network_timeout)
}

