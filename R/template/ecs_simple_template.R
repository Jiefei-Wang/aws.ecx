#' @rdname %rd_name%
#' @export
%function_name% <- function(json = list()){
    response <- ecs_post(target = "%target%", json = json)
    response
}
