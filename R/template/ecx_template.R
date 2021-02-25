#' @rdname `rd_name`
#' @export
`function_name`<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- `ecx_func`(action = "`target`", query = json)
    response
}
