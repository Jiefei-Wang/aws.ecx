#' AWS actions
#'
#' AWS actions for communicating with ECS.
#'
#' @details
#' These functions provide a minimum set of APIs for controlling the ECS instance.
#' Please refer to [AWS Documentation](https://docs.aws.amazon.com/index.html)
#' for the API documentation. The credentials must be provided before sending the
#' REST request. The credentials can be found by the environment variables or
#' set via `aws_set_credentials`.
#'
#'
#' For the actions which use `nextToken` to return the result by parts
#' (e.g. `ecs_list_task_definitions`), the token will be handled
#' automatically and the complete result will be returned by the function. There is
#' no need to include `nextToken` parameter in your request.
#'
#' If you find any ECS API useful but not listed here, please consider to submit an issue
#' to the package repository described in the DESCRIPTION file.
#'
#' @param json A list object containing the request parameters
#' @returns
#' A vector/list object depending on the API type
#' @rdname AWS_APIs
#' @name ecs_run_task
#' @export
NULL
