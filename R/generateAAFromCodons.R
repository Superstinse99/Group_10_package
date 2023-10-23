#' Translation of sequence
#'
#' @param codons
#'
#' @return proteins
#' @export
#'
#' @examples
generateAAFromCodons <- function(codons){
  AA <- paste0(codon_table[codons], collapse = "")
  return(AA)
}
