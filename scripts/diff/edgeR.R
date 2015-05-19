setwd("/Temporary\ Files/RNASeq/datasets/ngscourse.org")

# Clean the working space and load the library.
rm (list = ls ())
library(edgeR)

# Download the count matrix
data <- read.table("count_matrix.txt")

# View the first few rows of the count matrix
head(data)

# 736 genes, 6 samples
dim(data)

# Define the groups: 3 cases, 3 controls
grps <- c(rep("case", 3), rep("cont", 3))
grps

# DGEList object, which gets passed to edgeR
data <- DGEList(counts=data, group=grps)

# View sample information: group membership, library sizes, and normalization factors (currently set to 1)
data$samples

# Calculate normalization factors
data <- calcNormFactors(data)

# View how this changed the normalization factors
data$samples

# Preliminary plot to see how well the groups "separate" 
plotMDS(data)

# Estimate common dispersion 
data <- estimateCommonDisp(data, verbose=TRUE)

# Estimate tagwise dispersion
data <- estimateTagwiseDisp(data)

# Perform exact test on each gene
res <- exactTest(data)

# View the top most differentially expressed genes
topTags(res)

# Adjust p-values by BH procedure
padj <- p.adjust(res$table$PValue, "BH")

# View only the significant genes
touse <- padj < 0.05
table(touse)
res[touse,]$table




