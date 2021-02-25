#' @rdname `rd_name`
#' @export
`function_name`<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- `ecx_func`(action = "`target`", query = json)
    if(simplify){
        result <- `result_getter`
        while(!is.null(response$nextToken)){
            query$`NextToken` <- response$nextToken
            response <- `ecx_func`(action = action, query = query)
            result <- c(
                result,
                `result_getter`
            )
        }
    }else{
        result <- response
    }
    result
}
