#' Print script information
#'
#'
#' @param method2order 
#' @param cex 
#' @param mar 
#'
#' @return None
#'
#' @examples
#' ps()
#'
#' @export
ps <- function(file = dir()[grep("\\.R$", dir(), ignore.case = TRUE)][1]){
  lines <- readLines(file, warn = FALSE)
  cat(paste("Number of Lines:", length(lines), "\n"))
  sections <- grep(paste0("^#+.*", ".+", ".*(#{4,}|-{4,}|={4,})$"),
  		           lines, ignore.case = TRUE)
  sections <- gsub("^#+\\s*(\\S+)\\s*(#{4,}|-{4,}|={4,})$", "\\1", lines[sections])
  if(length(sections) == 0) sections <- "None"
  cat(paste("Sections:", paste(sections, "\n", collapse = ", ")))
}