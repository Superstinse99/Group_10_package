#' Setting the reading frame in codons
#'
#' @param dnaSequence
#' @param start
#'
#' @return codons
#' @export
#'
#' @examples
settingReadingFrameCodons <- function(dnaSequence, start = 1){
  sequenceLength <- nchar(dnaSequence)
  codons <- substring(dnaSequence,
                      first = seq(from = start, to = sequenceLength - 3 + 1, by = 3),
                      last = seq(from = 3 + start - 1, to = sequenceLength, by = 3))
  return(codons)
}
