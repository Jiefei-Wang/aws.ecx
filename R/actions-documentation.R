#' Common documents
#'
#' Common documents
#'
#' @param others Named list. The parameters that are not included in the
#' function parameters and need to be added into the request\[optional\]
#' @param simplify Logical. Whether to simplify the result and handle `nextToken`
#' in the response\[optional\]
#' @param Filter Named list where the name is the filter name and the value is the
#' filter's value. The value can be a vector or a list object (see below)\[optional\]
#' @param NextToken Characters. The token for the next page of results\[optional\]
#' @param nextToken Characters. The token for the next page of results\[optional\]
#' @param print_on_error Logical. Whether to show an error message when a
#' network error occurs.
#' @param retry_time Integer. Number of retries for a REST request when encounter the
#' network issue. If the request has been sent `retry_time` times but still not
#' be able to get the response, an error will be thrown.
#' @param network_timeout Numeric. Number of seconds to wait for a REST response
#' until giving up. Can not be less than 1 ms.
#' @param region Character. The region of the AWS service.
#' @rdname CommonDoc
#' @return No return value
#' @name CommonDoc
NULL

