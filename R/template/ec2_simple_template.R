#' @rdname %rd_name%
#' @export
%function_name% <- function(json = list()){
    action <- "%target%"
    response <- ec2_get(action = action, query = json)
    response
}
