#' Substitute DNA to RNA
#'
#' @param DNA_sequence
#'
#' @return RNA_sequence
#' @export
#'
#' @examples
substitueDNARNA <- function(DNA_sequence){
  RNA_sequence <- gsub("T", "U", DNA_sequence)
  return(RNA_sequence)
}
