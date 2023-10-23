
<!-- README.md is generated from README.Rmd. Please edit that file -->

# centralMolBio

<!-- badges: start -->
<!-- badges: end -->

The ‘CentralMolBio’ package, is a collection of useful functions for
analysing biological data. including reading, subtitute and translating
sequences.

## Installation

The package can be install either of these methods: -
devtools::install_github(“Superstinse99/Group_10_package”) -
install.packages(“Group_10_package”)

``` r
# install.packages("devtools")
devtools::install_github("Superstinse99/group_10_package")



```r
library(centralMolBio)
```

## Codon Table

The given codon table is used in the package:

``` r
codon_table <- c("UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
  "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
  "UUA" = "L", "UCA" = "S", "UAA" = "_", "UGA" = "_",
  "UUG" = "L", "UCG" = "S", "UAG" = "_", "UGG" = "W",
  "CUU" = "L", "CCU" = "P", "CAU" = "H", "CGU" = "R",
  "CUC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
  "CUA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
  "CUG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
  "AUU" = "I", "ACU" = "T", "AAU" = "N", "AGU" = "S",
  "AUC" = "I", "ACC" = "T", "AAC" = "N", "AGC" = "S",
  "AUA" = "I", "ACA" = "T", "AAA" = "K", "AGA" = "R",
  "AUG" = "M", "ACG" = "T", "AAG" = "K", "AGG" = "R",
  "GUU" = "V", "GCU" = "A", "GAU" = "D", "GGU" = "G",
  "GUC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
  "GUA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
  "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G")
```

Function 1: The first function in the package is generating a random
sequence of the bases in the desired length

``` r
generateRandomDNASequence <- function(sequenceLength){
  randomNucleotides <- sample(c("A", "T", "G", "C"), 
                              size = sequenceLength, replace = TRUE)
  randomDNASequence <- paste0(randomNucleotides, collapse = "")
  return(randomDNASequence)
}
```

Function 2: The second function in the package is a translation, where T
is replaced with U, therefore transcribing DNA to RNA

``` r
substitueDNARNA <- function(DNA_sequence){
  RNA_sequence <- gsub("T", "U", DNA_sequence)
  return(RNA_sequence)
}
```

Function 3: The third function in the package is taking in the DNA
sequence, indicating start of the sequence at one, and then reading it
in codons, also known as the reading frame of the sequence.

``` r
settingReadingFrameCodons <- function(dnaSequence, start = 1){
  sequenceLength <- nchar(dnaSequence)
  codons <- substring(dnaSequence,
                      first = seq(from = start, to = sequenceLength - 3 + 1, by = 3),
                      last = seq(from = 3 + start - 1, to = sequenceLength, by = 3))
  return(codons)
}
```

Function 4: The fourth function in the package is a translation of the
RNA, generating the translated amino acids of the sequence.

``` r
generateAAFromCodons <- function(codons){
  AA <- paste0(codon_table[codons], collapse = "")
  return(AA)
}
```

Function 5: The fifth function in the package is plotting the frequency
of each amino acid observed in the sequence.

``` r
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
```
