#' source only a single line or section, defaulting to the first section ####
#'
#'
#' @param method2order 
#' @param cex 
#' @param mar 
#'
#' @return None
#'
#' @examples
#' so()
#'
#' @export
o <- function(start = "head",
               file = dir()[grep("\\.R$", dir(), ignore.case = TRUE)][1]){
	r(start = start, end = start)
}