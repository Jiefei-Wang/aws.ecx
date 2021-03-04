excluded_response_names <- c("nextToken", "requestId", "RequestID")


has_token <- function(response){
    tolower(names(response)) %in% "nexttoken"
}


