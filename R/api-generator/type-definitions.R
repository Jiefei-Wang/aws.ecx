type_map <- list(
    Array = "List"
)
excluded_request_names <- c("Action", "Version", "X-Amz-Target")
token_names <- c("nextToken", "NextToken")

# api info format
api_template <- list(
    name = "",
    parameters = S4Vectors::DataFrame(
        name = NULL,
        type = NULL,
        required = NULL,
        description = NULL
    ),
    description = "",
    document="",
    definition=""
)
