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
