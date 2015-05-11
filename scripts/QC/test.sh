REPO=~/RNASeq

# Put all the tools in the search PATH
for d in $REPO/tools/*; do PATH="$PATH:$d"; done
export PATH=$PATH:$REPO/tools/samtools/bin

DS_path=$REPO/datasets/QC_test

ls $DS_path

REPORT_PATH=f020_res_fastqc

# put if not exist on folder here before mkdir
mkdir $REPORT_PATH

#fastqc -o $REPORT_PATH $DS_path/f010_raw_mirna.fastq

echo Run this from scripts/QC folder: fastqc -o $REPORT_PATH $DS_path/f010_raw_mirna.fastq



