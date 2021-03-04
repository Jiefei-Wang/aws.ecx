{{{function_name}}} <- function({{{parameters}}}) {
    {{{list_to_array_process_code}}}
    {{{list_to_filter_process_code}}}
    parameters <- c(others,list({{{parameters_combine}}}){{{array_combine}}})
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    response <- {{{service_request}}}(action = "{{{action}}}", parameters = parameters)
    if (simplify) {
        simplified_result <- response[!names(response) %in% excluded_response_names]
        if (length(simplified_result) == 1) {
            response <- simplified_result[[1]]
        }
    }
    response
}
