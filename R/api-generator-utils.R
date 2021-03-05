excluded_response_names <- c("nextToken", "requestId", "RequestID")


make_request <- function(service_request, action, parameters, simplify, token_name){
    result <- service_request(action = action, parameters = parameters)
    if (simplify) {
        if(!is.null(token_name)){
            response <- result
            while (!is.null(response[["nextToken"]])) {
                parameters[[token_name]] <- response[["nextToken"]]
                response <- {{{service_request}}}(action = action, parameters = parameters)
                all_names <- unique(c(names(result), names(response)))
                result <- lapply(all_names,
                                 function(x) c(result[[x]],response[[x]])
                )
                names(result) <- all_names
            }
        }
        simplified_result <- result[!names(result) %in% excluded_response_names]
        if (length(simplified_result) == 1) {
            result <- simplified_result[[1]]
            if(endsWith(names(simplified_result), "Arns")){
                result <- unlist(result)
            }
        }
    }
    result
}

