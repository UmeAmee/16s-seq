
setwd("D:/R_wenji/21_07_05")

library(vegan)
library(picante)


otu <- read.delim('otu.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)

otu <- t(otu)

tree <- read.tree('otu_tree.tre')

observed_species <- rowSums(otu > 0)

observed_species
