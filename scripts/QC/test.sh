REPO=~/RNASeq

# Put all the tools in the search PATH
for d in $REPO/tools/*; do PATH="$PATH:$d"; done
export PATH=$PATH:$REPO/tools/samtools/bin

DS_path=$REPO/datasets/QC_test

ls $DS_path

REPORT_PATH=f020_res_fastqc
mkdir $REPORT_PATH
fastqc -o $REPORT_PATH $DS_path/f010_raw_mirna.fastq



