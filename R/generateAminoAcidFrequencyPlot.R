#' Generate amino acid frequency plot
#'
#' @param proteinSequence
#'
#' @return plot of amino acid frequency
#' @export
#'
#' @examples
generateAminoAcidFrequencyPlot <- function(Sequence){
  amino_acids <- Sequence |>
    stringr::str_split(pattern = stringr::boundary("character"), simplify = TRUE) |>
    as.character() |>
    unique()

  amino_acid_counts <- sapply(amino_acids, function(amino_acid) stringr::str_count(string = Sequence, pattern = amino_acid)) |>
    as.data.frame()

  colnames(amino_acid_counts) <- c("Counts")
  amino_acid_counts[["AminoAcid"]] <- rownames(amino_acid_counts)

  frequency_plot <- amino_acid_counts |>
    ggplot2::ggplot(ggplot2::aes(x = AminoAcid, y = Counts, fill = AminoAcid)) +
    ggplot2::geom_col() +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.position = "none")

  return(frequency_plot)
}
