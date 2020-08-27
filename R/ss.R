#' source the n-th section of the script, defaulting to the last section ####
#'
#'
#' @param method2order 
#' @param cex 
#' @param mar 
#'
#' @return None
#'
#' @examples
#' ss()
#'
#' @export
ss <- function(beg = "last",
               end = beg, 
               file = dir()[grep("\\.R$", dir(), ignore.case = TRUE)][1]){
  s(beg, end, file, number.is.section = TRUE)
}