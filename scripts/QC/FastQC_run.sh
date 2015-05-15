REPO="/Temporary\ Files/RNASeq"

# Put all the tools in the search PATH
for d in $REPO/tools/*; do PATH="$PATH:$d"; done
export PATH=$PATH:$REPO/tools/samtools/bin
export PATH=$PATH:$REPO/tools/FastQC

DS_path=$REPO/datasets/BodyMap/adrenal_1.fastq

ls $DS_path

REPORT_PATH=f020_res_fastqc

# put if not exist on folder here before mkdir
mkdir $REPORT_PATH

#fastqc -o $REPORT_PATH $DS_path/BodyMap/adrenal_1.fastq

echo Run this from scripts/QC folder: fastqc -o $REPORT_PATH $DS_path/BodyMap/adrenal_1.fastq 



