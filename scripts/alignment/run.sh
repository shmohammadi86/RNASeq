current_path=`pwd`

# Path to main git repository folder
REPO=~/Dropbox/RNASeq

# Add all tools to the search PATH
for d in $REPO/tools/*; do 
   PATH="$PATH:$d"; 
done
PATH=$PATH:$current_path

export PATH

# Change to dataset folder
cd $REPO/datasets/ngscourse.org 

# To store bowtie index
if [ ! -d index ]; then
   mkdir index
fi

# To store TopHat alignments
if [ ! -d tophat ]; then
   mkdir tophat
fi

# To store bam files sorted by name
if [ ! -d bam_name_sorted ]; then
   mkdir bam_name_sorted
fi

# To store bam files sorted by position and indexed
if [ ! -d bam_sorted_indexed ]; then
   mkdir bam_sorted_indexed
fi


## Now run the actual processing
echo Building indexed reference genome ...
time build_index.sh

echo Aligning reads ...
time align_reads.sh

echo Indexing and storing alignments ...
time sort_and_index.sh

echo Sort alignments by name ...
time sort_by_name.sh

cd $current_path

echo Done! All output files are stored in $REPO/datasets/ngscourse.org
