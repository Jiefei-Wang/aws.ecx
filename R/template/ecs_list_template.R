#' @rdname %rd_name%
#' @export
%function_name%<-function(json = list()){
    target <- "%target%"
    response <- ecs_post(target = target, json = json)
    results <- %result_getter%
    while(!is.null(response$nextToken)){
        json$nextToken <- response$nextToken
        response <- ecs_post(target = target, json = json)
        results <- c(results, %result_getter%)
    }
    results
}
