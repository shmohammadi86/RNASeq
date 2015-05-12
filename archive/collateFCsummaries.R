

#Read & collate info from featureCount output summary files
options(stringsAsFactors=F)

FileNames <- dir(pattern="\\.summary",recursive=T, full.names=F)
temp <- read.delim(FileNames[1],header=F)

FCsummary <- matrix(NA, nrow=nrow(temp), ncol=length(FileNames)+1)
FCsummary[,1] <- c("file", temp[-1,1])
FCsummary[1,2:ncol(FCsummary)] <- FileNames
FCsummary[-1,2] <- temp[-1,2]

#Now do for the rest of the samples

for (i in 2:length(FileNames)) {
    FCsummary[-1,i+1] <- read.delim(FileNames[i],header=F)[-1,2]
}

#Write out to tab delimited-text file:

write.table(t(FCsummary), file="collated_featureCountSummaries.txt", row.names=F, col.names=F, sep="\t", quote=F)