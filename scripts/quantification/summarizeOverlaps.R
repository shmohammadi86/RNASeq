library(GenomicRanges)
library(GenomicFeatures)
library(GenomicAlignments)

setwd("/Temporary\ Files/RNASeq/datasets/ngscourse.org")

txdb <- makeTranscriptDbFromGFF(file = "f005_chr21_genome_annotation.gtf", format = "gtf")

eByg <- exonsBy(txdb, by = "gene") #GenomicFeatures

bamdir <- "bam_sorted_indexed"
fls <- BamFileList(dir(bamdir, ".bam$", full = TRUE)) #GenomicAlignment
names(fls) <- basename(names(fls))

genehits <- summarizeOverlaps(features = eByg, reads = fls, mode = "Union")

counts <- assays(genehits)$counts
counts <- as.data.frame(counts)

names(counts) <- c("g031_case", "g032_case",  "g033_case", "g034_cont", "g035_cont", "g036_cont")  
	
write.table(counts, file="count_matrix.txt")
