

add_asterisk_in_middle <- function(x, begin_nchar = 2, end_nchar = 2){
  if(!is.null(x)){
    if(nchar(x)>begin_nchar+end_nchar){
      substr(x,begin_nchar+1,nchar(x)-end_nchar) <-
        paste0(rep("*",nchar(x)-begin_nchar-end_nchar),collapse = "")
    }else{
      x <- paste0(rep("*",nchar(x)),collapse = "")
    }
  }
  x
}

##  list_to_array("Filter", list(Name = "a", value = list("b")))
## list_to_array("Filter", list(list(Name = "a", value = list("b","d"))))
## list_to_array("Filter", list(a=1,b=list(x1=list(y1=1,y2=2),x2=3)))
## list_to_array("vpcId", list(1,2,3))
#' Utility functions
#'
#' Utility functions. `list_to_array` converts a list or a vector to an
#' Array object in AWS Documentation. `list_to_filter` converts a filter
#' list to an Array object.
#'
#' @param prefix Character, the name of the parameter
#' @param x List or Vector, the value of the parameter
#'
#' @examples
#' vpc_id = c("vpc-081ec835f3", "vpc-0ee975135d", "vpc-06e4ab6c6c")
#' list_to_array("VpcId", vpc_id)
#'
#' filter = list(`dhcp-options-id` = c("dopt-7a8b9c2d", "dopt-2b2a3d3c"), state="available")
#' list_to_filter(filter)
#' @return A list object
#' @rdname converter
#' @export
list_to_array <- function(prefix ,x){
  if(length(x)==0) return(NULL)
  result <- list()
  for(i in seq_along(x)){
    if(is.null(names(x)[i])){
      cur_name <- paste0(prefix,".",i)
    }else{
      cur_name <- paste0(prefix,".",names(x)[i])
    }
    cur_value <- x[[i]]
    if(is.list(x[[i]])||length(x[[i]])>1){
      result <- c(result, list_to_array(cur_name, cur_value))
    }else{
      result[[cur_name]] <- cur_value
    }
  }
  result
}

#' @rdname converter
#' @export
list_to_filter <- function(x){
  if(length(x)==0) return(NULL)
  filters <- list()
  prefix <- "Filter"
  for(i in seq_along(x)){
    filter_name <- names(x)[i]
    filter_value <- x[[i]]
    filters[[paste0(prefix,".",i,".Name")]] <- filter_name
    for(j in seq_along(filter_value)){
      filters[[paste0(prefix,".",i,".Value.",j)]] <- filter_value[j]
    }
  }
  filters
}
