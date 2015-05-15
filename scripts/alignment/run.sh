#!/bin/bash

current_path=`pwd`

# Path to main git repository folder
REPO="/Temporary Files/RNASeq"

# Add all tools to the search PATH
for d in "$REPO"/tools/*; do 
   PATH="$PATH:$d"; 
done
PATH=$PATH:$current_path

export PATH

# Change to dataset folder
cd "$REPO"/datasets/workshop 

# To store bowtie index
if [ ! -d index ]; then
   mkdir index
fi

# To store TopHat alignments
if [ ! -d tophat ]; then
   mkdir tophat
fi

# To store sam files
if [ ! -d sam ]; then
   mkdir sam
fi

# To store bam files sorted by name
if [ ! -d bam_name_sorted ]; then
   mkdir bam_name_sorted
fi

# To store bam files sorted by position and indexed
if [ ! -d bam_sorted_indexed ]; then
   mkdir bam_sorted_indexed
fi

# To store bam files sorted by position and indexed
if [ ! -d cufflinks ]; then
   mkdir cufflinks
fi


## Now run the actual processing
echo Building indexed reference genome ...
bowtie-build f000_chr21_ref_genome_sequence.fa index/f000_chr21_ref_genome_sequence

echo Aligning reads ...
# Align case reads
for i in {1..3}; do tophat -r 300 -o tophat/f02$i\_case_tophat_out   index/f000_chr21_ref_genome_sequence   reads/f01$i\_case_read1.fastq reads/f01$i\_case_read2.fastq; done

# Align control reads
#or i in {4..6}; do tophat -r 300 -o tophat/f02$i\_cont_tophat_out   index/f000_chr21_ref_genome_sequence   reads/f01$i\_cont_read1.fastq reads/f01$i\_cont_read2.fastq; done

echo Indexing and storing alignments ...
for i in {1..3}; do 
   samtools sort tophat/f02$i\_case_tophat_out/accepted_hits.bam  bam_sorted_indexed/g03$i\_case_sorted_n;
   samtools index bam_sorted_indexed/g03$i\_case_sorted_n.bam;
done

# Sort 'control' bam file by name
for i in {4..6}; do 
    samtools sort tophat/f02$i\_cont_tophat_out/accepted_hits.bam  bam_sorted_indexed/g03$i\_cont_sorted_n;
    samtools index bam_sorted_indexed/g03$i\_cont_sorted_n.bam;
done

echo Sort alignments by name ...
# Sort 'case' bam file by name
for i in {1..3}; do samtools sort -n tophat/f02$i\_case_tophat_out/accepted_hits.bam  bam_name_sorted/g03$i\_case_sorted_n; done

# Sort 'control' bam file by name
for i in {4..6}; do samtools sort -n tophat/f02$i\_cont_tophat_out/accepted_hits.bam  bam_name_sorted/g03$i\_cont_sorted_n; done


echo extract SAM files back from BAM files
for i in {1..3}; do 
   samtools view tophat/f02$i\_case_tophat_out/accepted_hits.bam  > sam/f03$i\_case.sam
done

# Sort 'control' bam file by name
for i in {4..6}; do 
	samtools view tophat/f02$i\_cont_tophat_out/accepted_hits.bam  > sam/f03$i\_cont.sam
done

cd "$current_path"

cuffdiff -o cufflinks f005_chr21_genome_annotation.gtf   sam/f031_case.sam   sam/f034_cont.sam

echo Done! All output files are stored in $REPO/datasets/workshop
