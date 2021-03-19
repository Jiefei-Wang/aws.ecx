package_setting<-new.env()
package_setting$print_on_error <- TRUE
package_setting$retry_time <- 5
package_setting$network_timeout <- 10

#' Get or set the package settings
#'
#' Get or set the package settings
#'
#' @param x the value to be set. For the timeout setting, the unit is seconds.
#' @returns
#' Setter: The old value
#' Getter: The current value
#' @examples
#' ## Set the timeout to 10 seconds
#' aws_set_network_timeout(10)
#' ## Get the timeout setting
#' aws_get_network_timeout()
#'
#' ## Turn off print on error
#' aws_set_print_on_error(FALSE)
#'
#' ## Set the retry times to 5
#' aws_set_retry_time(5)
#'
#' @rdname packageSettings
#' @export
aws_set_retry_time <- function(x){
    old_value <- package_setting$retry_time
    package_setting$retry_time <- x
    old_value
}
#' @rdname packageSettings
#' @export
aws_set_print_on_error <- function(x){
    old_value <- package_setting$print_on_error
    package_setting$print_on_error <- x
    old_value
}
#' @rdname packageSettings
#' @export
aws_set_network_timeout <- function(x){
    old_value <- package_setting$network_timeout
    package_setting$network_timeout <- x
    old_value
}

#' @rdname packageSettings
#' @export
aws_get_retry_time <- function(){
    package_setting$retry_time
}
#' @rdname packageSettings
#' @export
aws_get_print_on_error <- function(){
    package_setting$print_on_error
}
#' @rdname packageSettings
#' @export
aws_get_network_timeout <- function(){
    package_setting$network_timeout
}
