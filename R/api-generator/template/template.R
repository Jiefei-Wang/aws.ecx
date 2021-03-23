{{{function_name}}} <- function({{{parameters}}},
                                print_on_error = aws_get_print_on_error(),
                                retry_time = aws_get_retry_time(),
                                network_timeout = aws_get_network_timeout()) {
    {{{parameters_conversion}}}
    {{{list_to_array_process_code}}}
    {{{list_to_filter_process_code}}}
    parameters <- c(others,list({{{parameters_combine}}}){{{array_combine}}})
    parameters <- parameters[!vapply(parameters, is.empty, logical(1))]
    make_request(service_request={{{service_request}}},
                 action="{{{action}}}",
                 parameters=parameters,
                 simplify=simplify,
                 token_name = {{{token_name}}},
                 print_on_error = print_on_error,
                 retry_time = retry_time,
                 network_timeout = network_timeout)
}
