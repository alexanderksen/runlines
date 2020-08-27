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
s <- function(beg = 1, 
              end = as.numeric(length(readLines(file, warn = FALSE))), 
              file = dir()[grep("\\.R$", dir(), ignore.case = TRUE)][1],
              number.is.section = FALSE){
  	lines = readLines(file, warn = FALSE)
  	if(number.is.section){
  	  sections <- grep(paste0("^#.*", ".+", ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)
  	  if(beg == "last"){
  	     beg <- end <- gsub("^#+(.*)(#{4,}|-{4,}|={4,})$", "\\1", 
  	                 lines[sections[length(sections)]])
  	  }else{
  	     beg <- gsub("^#+(.*)(#{4,}|-{4,}|={4,})$", "\\1", lines[sections[beg]])
  	     end <- gsub("^#+(.*)(#{4,}|-{4,}|={4,})$", "\\1", lines[sections[end]])
  	  }
  	}
  	if(class(beg) != "numeric"){
  		beg = grep(paste0("^#+.*", beg, ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)[1]
  		if(is.na(beg)) return(cat("Section does not exist."))
  	}else if(beg < 0){beg <- beg + end}
  	if(class(end) != "numeric"){
  	  end <- grep(paste0("^#+.*", end, ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)[1]
  		if(beg == end){
  		  end <- as.numeric(grep(paste("^#", ".+", "(#{4,}|-{4,}|={4,})$"), 
  		                         lines[(beg + 1):length(lines)], 
  		                         ignore.case = TRUE)[1]) + beg - 1
  		  if(is.na(end)){end <- length(lines)}
  		}
  	  if(is.na(end)){return(cat("Section does not exist."))}
  	}
  	if(beg > length(lines)) return(cat("Line does not exist."))
  	cat(paste("Source line: ", beg, "-", end, "\n"))
  	eval(parse(text = lines[beg:end]), envir = .GlobalEnv)
}