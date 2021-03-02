## Generate the roxygen documentation of a function
generate_document <- function(definition, param_table){
    param_table <- param_table[!param_table$name%in%token_params,]

    descriptions <- vapply(param_table$description, html_to_markdown, character(1))
    short_descriptions <- vapply(seq_len(nrow(param_table)),
                                 function(i)get_short_description(
                                     param_name = param_table$name[i],
                                     description = descriptions[i],
                                     required = param_table$required[i],
                                     type = param_table$type[i]),
                                 character(1))
    description_idx <- short_descriptions!=""

    function_description <- html_to_markdown(definition$description)
    document <- c(
        camel_to_title(definition$`x-aws-operation-name`),
        "\n",
        strsplit(function_description, "\\n\\n")[[1]][1],
        "\n",
        paste0("@param ", param_table$name[description_idx], " ", short_descriptions[description_idx]),
        "@inheritParams additionalDoc",
        "\n",
        paste0("@section ", param_table$name, ":\n", descriptions),
        "@return A list object or a character vector",
        "@export"
    )
    document <- paste0(document, collapse = "\n")
    document <- gsub("\n{3,}", "\n\n", document)
    document <- gsub("\n", "\n#' ", document, fixed = TRUE)
    document <- gsub("%", "\\%", document, fixed = TRUE)
    document <- paste0("#' ", document)
    document
}


# service <- "ec2"
# action <- "DescribeVpcs"
generate_function <- function(service ,action, param_table){
    service_func_name <- paste0(service, "_request")
    function_name <- paste0(service, "_", pascal_to_camel(action))
    token_idx <- which(param_table$name %in% token_params)

    function_header <- paste0(function_name, " <- function(",
                              paste0(
                                  paste0(param_table$name,
                                         ifelse(param_table$required, "", " = NULL")
                                  ),
                                  collapse = ", "),
                              ", simplify = TRUE",
                              ", others = list()",
                              "){")


    if("Filter" %in% param_table$name){
        filter_code <- "Filter <- get_filter(Filter)"
    }else{
        filter_code <- NULL
    }

    array_param <- param_table$name[param_table$type=="array"& param_table$name!="Filter"]
    array_code <- vapply(array_param,
                         function(x)
                             paste0(x," <- list_to_array(\"",x,"\", ",x,")" ),
                         character(1))

    request_code <- generate_function_call(service_func_name,
                                           action = dQuote(action, FALSE),
                                           parameters = "parameters")

    array_idx <- param_table$type=="array"
    if(any(array_idx)){
        array_char <- paste0(", ",paste0(param_table$name[array_idx], collapse = ", "))
    }else{
        array_char <- NULL
    }

    if(any(!array_idx)){
        non_array_char <- paste0(
            paste0(param_table$name[!array_idx],"=", param_table$name[!array_idx]),
            collapse = ", ")
    }else{
        non_array_char <- NULL
    }

    all_paramters <- paste0(
        "c(list(",non_array_char,"), others",array_char,")"
    )

    function_body <- c(
        filter_code,
        array_code,
        paste0("parameters <- ", all_paramters),
        paste0("parameters <- parameters[!vapply(parameters, is.null, logical(1))]"),
        paste0("response <- ", request_code),
        "result <- response"
    )
    ## If token presents, we need to handle the token
    if(length(token_idx)){
        token_name <- param_table$name[token_idx]
        function_body <- c(
            function_body,
            "if(simplify){",
            "while(!is.null(response[[\"nextToken\"]])){",
            paste0("parameters[[",dQuote(token_name, FALSE),"]] <- response[[\"nextToken\"]]"),
            paste0("response <- ", request_code),
            paste0("result <- lapply(unique(c(names(result), names(response))),",
                   "function(x) list(c(result[[x]], response[[x]])))"),
            "}",
            "}")
    }

    function_body <- c(
        function_body,
        "if(simplify){",
        "result1 <- result[!names(result) %in% excluded_response]",
        "if(length(result1) == 1){",
        "result <- result1[[1]]",
        "}",
        "}",
        "result"
    )


    x <- paste0(c(function_header, function_body, "}"),collapse = "\n")
    x
}


## Generate character function code given the function name and
## its arguments
generate_function_call<-function(name, ...){
    arguments_raw <- list(...)
    arguments <- c()
    for(i in seq_along(arguments_raw)){
        arg_name <- names(arguments_raw)[i]
        arg_value <- arguments_raw[i]
        if(!is.null(arg_name)&&arg_name!=""){
            arguments[i] <- paste0(arg_name, " = ", arg_value)
        }else{
            arguments[i] <- arg_value
        }
    }
    paste0(name, "(", paste0(arguments , collapse = ", "),")")
}

get_parameter_table <- function(params){
    param_names <- vapply(params,function(x)x$name,character(1))
    param_types <- vapply(params,function(x)x$schema$type,character(1))
    is_required <- vapply(params,function(x)x$required,logical(1))
    descriptions <- vapply(params,function(x)ifelse(is.null(x$description), "", x$description),
                           character(1))
    x <- S4Vectors::DataFrame(
        name = param_names,
        type = param_types,
        required = is_required,
        description = descriptions
    )
    x <- rbind(x[x$required,], x[!x$required,])
    x <- x[!x$name%in%excluded_params,]
    x
}




sort_params <- function(x, is_required){
    c(x[is_required], x[!is_required])
}


capitalize <- function(x){
    x <- paste0(toupper(substr(x,1,1)), substring(x,2))
    x
}

get_short_description <- function(param_name, description, required, type=NULL){
    ## Special treatment for the Filter parameter
    if(param_name == "Filter"){
        return("")
    }
    max_char <- 100
    stripped_description <- gsub("\n", " ", description)
    # stripped_description <- gsub("  ", " ", stripped_description, fixed = TRUE)
    if(nchar(stripped_description) < max_char ){
        short_description <- stripped_description
    }else{
        first_sentence <- stringr::str_extract(stripped_description, '^.*?(\\.|.$)')
        if(nchar(first_sentence) < max_char ){
            short_description <- first_sentence
        }else{
            short_description <- truncate_string(first_sentence,max_char-10)
            short_description <- paste0(short_description, "...(see below)")
        }
    }
    short_description <- paste0(short_description , ifelse(required,"","(optional)"))
    if(!is.null(type)){
        if(type=="array"){
            type <- "list or named list"
        }
        short_description <- paste0(capitalize(type), ". ", short_description)
    }
    short_description
}

truncate_string <- function(x, len){
    x1 <- substr(x,1,len)
    x_split <- unlist(strsplit(x, " ", fixed = TRUE))
    x1_split <- unlist(strsplit(x1, " ", fixed = TRUE))
    paste0(x_split[seq_along(x1_split)], collapse = " ")
}

html_to_markdown <- function(x){
    file_path_in <- tempfile()
    cat(x, file = file_path_in)
    file_path_out <- tempfile()
    rmarkdown::pandoc_convert(file_path_in, to = "markdown", from="html", output = file_path_out)
    x <- gsub("\r", "", readChar(file_path_out, file.info(file_path_out)$size))
    x <- gsub("\\_", "_", x, fixed = TRUE)
    x <- gsub("<.{1,7}>", "", x)
    x
}



output_to_file <- function(content, file_path){
    write(content,file=file_path,append=FALSE)
}

pascal_to_camel <- function(x) {
    tolower(
        gsub("([a-z0-9])([A-Z])",
             "\\1_\\2",
             gsub("(.)([A-Z][a-z]+)", "\\1_\\2", x))
    )
}

camel_to_title <- function(x){
    simpleCap(
        gsub("([a-z0-9])([A-Z])",
             "\\1 \\2",
             gsub("(.)([A-Z][a-z]+)", "\\1 \\2", x))
    )
}

simpleCap <- function(x) {
    s <- strsplit(x, " ")[[1]]
    paste(toupper(substring(s, 1,1)), substring(s, 2),
          sep="", collapse=" ")
}



get_yaml_path <- function(service){
    filePath <- paste0("R/api-generator/openapi/",service,".yaml")
    filePath
}

get_aws_api <- function(service){
    filePath <- get_yaml_path(service)
    api <- suppressWarnings(rapiclient::get_api(filePath))
    api
}
