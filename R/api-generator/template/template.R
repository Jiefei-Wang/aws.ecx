{{{function_name}}} <- function({{{parameters}}}) {
    {{{list_to_array_process_code}}}
    {{{list_to_filter_process_code}}}
    parameters <- c(others,list({{{parameters_combine}}}){{{array_combine}}})
    parameters <- parameters[!vapply(parameters, is.null, logical(1))]
    make_request(service_request={{{service_request}}},
                 action="{{{action}}}",
                 parameters=parameters,
                 simplify=simplify,
                 token_name = {{{token_name}}})
}
