

#Read & collate info from STAR output logs
options(stringsAsFactors=F)

FileNames <- dir(pattern="final.out",recursive=T, full.names=F)
temp <- read.delim(FileNames[1],header=F)
#remove leading & trailing white space and ending " |"
temp[,1] <- gsub("^\\s+|\\s+$", "", temp[,1])

STARlogs <- matrix(NA, nrow=nrow(temp)+1, ncol=length(FileNames)+1)
STARlogs[,1] <- c("file", temp[,1])
STARlogs[1,2:ncol(STARlogs)] <- FileNames
STARlogs[-1,2] <- temp[,2]

#Now do for the rest of the samples

for (i in 2:length(FileNames)) {
    STARlogs[-1,i+1] <- read.delim(FileNames[i],header=F)[,2]
}

#Write out to tab delimited-text file:

write.table(t(STARlogs), file="collated_STARlogs.txt", row.names=F, col.names=F, sep="\t", quote=F)