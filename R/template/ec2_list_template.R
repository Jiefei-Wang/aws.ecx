#' @rdname %rd_name%
#' @export
%function_name%<-function(json = list()){
    action <- "%target%"
    response <- ec2_get(action = action, query = json)
    result <- %result_getter%
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            %result_getter%
        )
    }
    result
}
