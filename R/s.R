#' Any comment line which includes at least four trailing dashes (-), 
#' equal signs (=), or pound signs (#) automatically creates a code section.
#'
#'
#' @param method2order 
#' @param cex 
#' @param mar 
#'
#' @return None
#'
#' @examples
#' s(1, 10)
#'
#' @export
s <- function(start = 1, 
              end = as.numeric(length(readLines(file, warn = FALSE))), 
              file = dir()[grep("\\.R$", dir(), ignore.case = TRUE)][1],
              number.is.section = FALSE){
  	lines = readLines(file, warn = FALSE)
  	if(number.is.section){
  	  sections <- grep(paste0("^#.*", "\\w+", ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)
  	  if(start == "last"){
  	     start <- end <- gsub("^#+(\\w*)(#{4,}|-{4,}|={4,})$", "\\1", 
  	                 lines[sections[length(sections)]])
  	  }else{
  	     start <- gsub("^#+(\\w*)(#{4,}|-{4,}|={4,})$", "\\1", lines[sections[start]])
  	     end <- gsub("^#+(\\w*)(#{4,}|-{4,}|={4,})$", "\\1", lines[sections[end]])
  	  }
  	}
  	if(class(start) != "numeric"){
  	   if(start == "head"){
  	      start <- 1
  	      end <- as.numeric(grep(paste("^#", "\\w+", "(#{4,}|-{4,}|={4,})$"), 
  	                             lines, ignore.case = TRUE)[1]) - 1
  	   }else{
     	   start = grep(paste0("^#+.*", start, ".*(#{4,}|-{4,}|={4,})$"),
     		         lines, ignore.case = TRUE)[1]}
  	   if(is.na(start)) return(cat("Section does not exist."))
  	}else if(start < 0){start <- start + end}
  	
  	if(class(end) != "numeric"){
  	  end <- grep(paste0("^#+.*", end, ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)[1]
  		if(start == end){
  		   end <- as.numeric(grep(paste("^#", "\\w+", "(#{4,}|-{4,}|={4,})$"), 
  		                         lines[(start + 1):length(lines)], 
  		                         ignore.case = TRUE)[1]) + start - 1
  		   if(is.na(end)){end <- length(lines)}
  		}
  	}
  	if(is.na(end)){return(cat("Section does not exist."))}
  	if(start > length(lines)) return(cat("Line does not exist."))
  	cat(paste("Source line: ", start, "-", end, "\n"))
  	eval(parse(text = lines[start:end]), envir = .GlobalEnv)
}