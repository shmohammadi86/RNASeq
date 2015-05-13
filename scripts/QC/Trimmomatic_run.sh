REPO=~/RNASeq

# Put all the tools in the search PATH
for d in $REPO/tools/*; do PATH="$PATH:$d"; done
export PATH=$PATH:$REPO/tools/samtools/bin
export PATH=$PATH:$REPO/tools/FastQC

DS_path=$REPO/datasets/BodyMap/adrenal_1.fastq

ls $DS_path


echo Run this from scripts/QC folder: mkdir TrimmomaticReads

echo Then run this:  java -jar ../../tools/Trimmomatic/trimmomatic-0.33/trimmomatic-0.33.jar PE ~/RNASeq/datasets/BodyMap/adrenal_1.fastq ~/RNASeq/datasets/BodyMap/adrenal_2.fastq ./TrimmomaticReads/adrenal_1_paired.fq.gz ./TrimmomaticReads/adrenal_1_unpaired.fq.gz ./TrimmomaticReads/adrenal_2_paired.fq.gz ./TrimmomaticReads/adrenal_2_unpaired.fq.gz ILLUMINACLIP:../../tools/Trimmomatic/trimmomatic-0.33/adapters/TruSeq2-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:30



