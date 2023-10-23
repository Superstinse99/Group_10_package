#' GenerateRandomDNASequence
#'
#' @param sequenceLength
#'
#' @return randomDNASequence
#' @export
#'
#' @examples
#'
generateRandomDNASequence <- function(sequenceLength){
  randomNucleotides <- sample(c("A", "T", "G", "C"),
                              size = sequenceLength, replace = TRUE)
  randomDNASequence <- paste0(randomNucleotides, collapse = "")
  return(randomDNASequence)
}
