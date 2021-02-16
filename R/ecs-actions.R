#' @rdname AWS_APIs
#' @export
ecs_deregister_task_definition <- function(json = list()){
    response <- ecs_post(target = "DeregisterTaskDefinition", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_create_cluster <- function(json = list()){
    response <- ecs_post(target = "CreateCluster", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_delete_cluster <- function(json = list()){
    response <- ecs_post(target = "DeleteCluster", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_create_subnet <- function(json = list()){
    response <- ecs_post(target = "CreateSubnet", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_delete_subnet <- function(json = list()){
    response <- ecs_post(target = "DeleteSubnet", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_run_task <- function(json = list()){
    response <- ecs_post(target = "RunTask", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_stop_task <- function(json = list()){
    response <- ecs_post(target = "StopTask", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_describe_tasks <- function(json = list()){
    response <- ecs_post(target = "DescribeTasks", json = json)
    response
}

#' @rdname AWS_APIs
#' @export
ecs_list_task_definitions<-function(json = list()){
    target <- "ListTaskDefinitions"
    response <- ecs_post(target = target, json = json)
    results <- unlist(response[["taskDefinitionArns"]])
    while(!is.null(response$nextToken)){
        json$nextToken <- response$nextToken
        response <- ecs_post(target = target, json = json)
        results <- c(results, unlist(response[["taskDefinitionArns"]]))
    }
    results
}

#' @rdname AWS_APIs
#' @export
ecs_list_clusters<-function(json = list()){
    target <- "ListClusters"
    response <- ecs_post(target = target, json = json)
    results <- unlist(response[["clusterArns"]])
    while(!is.null(response$nextToken)){
        json$nextToken <- response$nextToken
        response <- ecs_post(target = target, json = json)
        results <- c(results, unlist(response[["clusterArns"]]))
    }
    results
}

#' @rdname AWS_APIs
#' @export
ecs_list_tasks<-function(json = list()){
    target <- "ListTasks"
    response <- ecs_post(target = target, json = json)
    results <- unlist(response[["taskArns"]])
    while(!is.null(response$nextToken)){
        json$nextToken <- response$nextToken
        response <- ecs_post(target = target, json = json)
        results <- c(results, unlist(response[["taskArns"]]))
    }
    results
}
