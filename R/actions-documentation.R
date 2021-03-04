#' AWS actions
#'
#' AWS actions for communicating with ECS.
#'
#' @details
#' These functions provide a set of APIs for controlling the ECS instance.
#' Please refer to [AWS Documentation](https://docs.aws.amazon.com/index.html)
#' for the API documentation. The credentials must be provided before sending the
#' REST request. The credentials can be found by the environment variables or
#' set via `aws_set_credentials`.
#'
#'
#' For the actions which use `nextToken` to return the result by parts
#' (e.g. `ecs_list_task_definitions`), the token can be handled
#' automatically and the complete result can be returned by the function
#' if the argument `simplify = TRUE`.
#'
#' If you find any ECS API useful but not listed here, please consider to submit an issue
#' to the package repository described in the DESCRIPTION file.
#'
#' @returns
#' A vector/list object depending on the API type
#' @rdname AWS_APIs
#' @name ecs_run_task
NULL



#' Common documents
#'
#' Common documents
#'
#' @param others Named list. The parameters that are not included in the
#' function parameters and need to be added into the request.
#' @param simplify Logical. Whether to simplify the result and handle `nextToken`
#' in the response
#' @param Filter Named list where the name is the filter name and the value is the
#' filter value. (see below)(optional)
#' @param NextToken Characters, The token for the next page of results.
#' @rdname additionalDoc
#' @name additionalDoc
NULL

