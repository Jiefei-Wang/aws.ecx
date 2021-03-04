{{{function_name}}} <- function({{{parameters}}}) {
    {{{list_to_array_process_code}}}
    {{{list_to_filter_process_code}}}
    parameters <- c(others,list({{{parameters_combine}}}){{{array_combine}}})
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    result <- {{{service_request}}}(action = "{{{action}}}", parameters = parameters)
    if (simplify) {
        response <- result
        while (!is.null(response[["nextToken"]])) {
            parameters[["{{{token_name}}}"]] <- response[["nextToken"]]
            response <- {{{service_request}}}(action = "{{{action}}}", parameters = parameters)
            result <- lapply(unique(c(names(result), names(response))),
                             function(x) list(
                                 c(result[[x]],response[[x]])
                             ))
        }
        simplified_result <- result[!names(result) %in% excluded_response_names]
        if (length(simplified_result) == 1) {
            result <- simplified_result[[1]]
        }
    }
    result
}
