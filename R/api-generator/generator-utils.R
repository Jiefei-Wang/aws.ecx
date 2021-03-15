## Generate the roxygen documentation of a function
generate_document <- function(api_info){
    param_table <- api_info$parameters
    param_table <- param_table[!param_table$name%in%token_names,]

    param_descriptions <- param_table$description
    param_descriptions[param_descriptions==""] <- "No description can be found."
    short_descriptions <- vapply(seq_len(nrow(param_table)),
                                 function(i)get_short_description(
                                     param_name = param_table$name[i],
                                     description = param_descriptions[i],
                                     required = param_table$required[i],
                                     type = param_table$type[i],
                                     add_optional = param_table$addOptional[i]),
                                 character(1))
    short_description_idx <-
        get_nonexclude_short_description_bool(param_table$name)
    #short_descriptions[gsub(" ", "", short_descriptions)==""] <- "No description can be found."

    function_description <- api_info$description
    document_title <- camel_to_title(api_info$name)
    md_short_description <- NULL
    if(length(short_descriptions)!=0){
        md_short_description <- paste0("@param ",
                                       param_table$name[short_description_idx],
                                       " ",
                                       short_descriptions[short_description_idx])
    }
    md_long_description <- NULL
    if(length(param_descriptions)!=0){
        md_long_description <- paste0("@section ", param_table$name, ":\n", param_descriptions)
    }

    document <- c(
        document_title,
        "\n",
        strsplit(function_description, "\\n\\n")[[1]][1],
        "\n",
        md_short_description,
        "@inheritParams CommonDoc",
        "\n",
        md_long_description,
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
generate_function <- function(service, api_info){
    template <- get_template()
    action <- api_info$name
    param_table <- api_info$parameters
    service_request <- paste0(service, "_request")
    function_name <- paste0(service, "_", pascal_to_camel(api_info$name))
    parameters <- paste0(
        c(paste0(
            param_table$name,ifelse(param_table$required, "", " = NULL")),
          "simplify = TRUE",
          "others = list()"),
        collapse = ", ")
    if(any(token_names%in%param_table$name)){
        token_name <- shQuote(token_names[token_names%in%param_table$name])
    }else{
        token_name <- "NULL"
    }

    if(service=="ec2"){
        array_param <- param_table$name[param_table$type=="array"& param_table$name!="Filter"]
        list_to_array_process_code <- paste0(
            vapply(array_param,
                   function(x)
                       paste0(x," <- list_to_array(\"",x,"\", ",x,")" ),
                   character(1)),
            collapse = "\n")

        if("Filter" %in% param_table$name){
            list_to_filter_process_code <- "Filter <- list_to_filter(Filter)"
        }
        array_idx <- param_table$type=="array"
        if(any(array_idx)){
            array_combine <- paste0(", ", paste0(param_table$name[array_idx], collapse = ", "))
        }
        if(any(!array_idx)){
            parameters_combine <- paste0(
                paste0(param_table$name[!array_idx],"=", param_table$name[!array_idx]),
                collapse = ", ")
        }
    }else{
        array_idx <- param_table$type=="array"
        parameters_combine1 <- NULL
        parameters_combine2 <- NULL

        if(any(!array_idx)){
            parameters_combine1 <- paste0(
                paste0(param_table$name[!array_idx],"=", param_table$name[!array_idx]),
                collapse = ", ")
        }
        if(any(array_idx)){
            parameters_combine2 <- paste0(
                paste0(param_table$name[array_idx],"=as.list(", param_table$name[array_idx]),")",
                collapse = ", ")
        }
        parameters_combine <- paste0(
            c(parameters_combine1,parameters_combine2),
            collapse = ", ")
    }

    x <- whisker::whisker.render(template)
    x
}


generate_parameter_table <- function(params){
    param_names <- vapply(params,function(x)x$name,character(1))
    param_types <- vapply(params,function(x)x$schema$type,character(1))
    is_required <- vapply(params,function(x)x$required,logical(1))
    descriptions <- vapply(params,function(x)ifelse(is.null(x$description), "", x$description),
                           character(1))
    x <- S4Vectors::DataFrame(
        name = param_names,
        type = param_types,
        required = is_required,
        description = descriptions,
        addOptional = !is_required
    )
    x <- rbind(x[x$required,], x[!x$required,])
    x <- x[!x$name%in%excluded_request_names,]
    x
}


generate_parameter_table_ecs  <- function(ecs_api, properties){
    properties1 <- lapply(properties, function(x) x$allOf)
    properties2 <- lapply(properties1, function(x) as.list(unlist(x)))

    param_names <- names(properties2)
    param_types <- lapply(param_names,function(x)
        get_referred_doc(ecs_api, properties2[[x]]$`$ref`)$type)
    is_required <- rep(FALSE, length(param_names))
    descriptions <- lapply(param_names,function(x)
        properties2[[x]]$description)

    param_types[sapply(param_types, is.null)] <- ""
    descriptions[sapply(descriptions, is.null)] <- ""


    x <- S4Vectors::DataFrame(
        name = param_names,
        type = unlist(param_types),
        required = is_required,
        description = unlist(descriptions),
        addOptional = is_required
    )
    x <- x[!x$name%in%excluded_request_names,]
    x
}

get_referred_doc <- function(ecs_api, path){
    if(is.null(path))return(NULL)
    pathes <- strsplit(path, "/", fixed = TRUE)[[1]][-1]
    result <- ecs_api
    for(i in pathes){
        result <- result[[i]]
    }
    result
}

capitalize <- function(x){
    x <- paste0(toupper(substr(x,1,1)), substring(x,2))
    x
}

get_short_description <- function(param_name, description, required, type, add_optional){
    ## Special treatment for the Filter parameter
    if(param_name == "Filter"){
        return("")
    }
    max_char <- 100
    stripped_description <- gsub("\n", " ", description)
    if(nchar(stripped_description) < max_char ){
        short_description <- stripped_description
    }else{
        ## truncate the string while still preserve most description text
        first_sentence <- stringr::str_extract(stripped_description, '^.*?(\\.|.$)')
        sentence_raw <- charToRaw(first_sentence)
        parentheses_match <- sum(sentence_raw == charToRaw('('))==sum(sentence_raw == charToRaw(')'))
        bracket_match <- sum(sentence_raw == charToRaw('['))==sum(sentence_raw == charToRaw(']'))
        if(parentheses_match && bracket_match){
            if(nchar(first_sentence) < max_char){
                short_description <- first_sentence
            }else{
                short_description <- truncate_string(first_sentence, max_char-3)
                short_description <- paste0(short_description, "...")
            }
        }else{
            short_description <- truncate_string(stripped_description, max_char-3)
            short_description <- paste0(short_description, "...")
        }
    }
    short_description <- paste0(short_description ,
                                ifelse((!required)&&add_optional,"\\[optional\\]",""))
    if(!is.null(type)&&type!=""){
        type <- type_mapping(type)
        short_description <- paste0(capitalize(type), ". ", short_description)
    }
    short_description
}

truncate_string <- function(x, len){
    x_raw <- charToRaw(x)
    parentheses_match <- sum(x_raw == charToRaw('('))==sum(x_raw == charToRaw(')'))
    bracket_match <- sum(x_raw == charToRaw('['))==sum(x_raw == charToRaw(']'))

    x1 <- substr(x,1,len)
    x_split <- unlist(strsplit(x, " ", fixed = TRUE))
    x1_split <- unlist(strsplit(x1, " ", fixed = TRUE))

    for(i in length(x1_split):length(x_split)){
        parenthesis_ok <- TRUE
        bracket_ok <- TRUE
        x_new <- paste0(x_split[seq_len(i)], collapse = " ")
        x_new_raw <- charToRaw(x_new)
        if(parentheses_match){
            parenthesis_ok <- sum(x_new_raw == charToRaw('('))==sum(x_new_raw == charToRaw(')'))
        }
        if(bracket_match){
            bracket_ok <- sum(x_new_raw == charToRaw('['))==sum(x_new_raw == charToRaw(']'))
        }
        if(parenthesis_ok&&bracket_ok)
            break
    }
    x_new
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

to_markdown <- function(api_info_list){
    function_descriptions <- vapply(api_info_list,
                                    function(x)x$description,character(1))
    function_descriptions <- html_list_to_markdown(function_descriptions)
    for(i in seq_along(api_info_list)){
        api_info_list[[i]]$description <- function_descriptions[i]
    }


    parameter_descriptions <- unlist(lapply(api_info_list,
                                            function(x)x$parameters$description))
    parameter_descriptions <- html_list_to_markdown(parameter_descriptions)
    idx <- 1
    for(i in seq_along(api_info_list)){
        description_num <- length(api_info_list[[i]]$parameters$description)
        if(description_num==0)
            next
        api_info_list[[i]]$parameters$description <-
            parameter_descriptions[idx:(idx+description_num-1)]
        idx <- idx + description_num
    }
    api_info_list
}


html_list_to_markdown <- function(x){
    separator <- "======separator======"
    x_n <- length(x)
    x1 <- paste0(x,collapse = separator)
    x2 <- html_to_markdown(x1)
    x3 <- strsplit(x2, separator, fixed = TRUE)[[1]]
    if(endsWith(x3[length(x3)],"\n")){
        x3[length(x3)] <- substr(x3[length(x3)], 1, nchar(x3[length(x3)])-1)
    }
    stopifnot(length(x3)==x_n)
    x3
}

write_apis_to_file <- function(api_info_list, file_path){
    code <- c()
    for(i in api_info_list){
        code <- c(code,
                  paste0(i$document,"\n",i$definition)
        )
    }
    code <- paste0(code,collapse = "\n\n")
    code0 <- ""
    while(code!=code0){
        code0 <- code
        code <- gsub("\n +\n", "\n", code)
    }
    output_to_file(code, file_path)
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


