#!/bin/bash
#PBS -l walltime=36:00:00
#PBS -l nodes=1:ppn=2,mem=4gb
#PBS -q classroom
#PBS -N align_STAR
#PBS -m ae
#PBS -j oe
#PBS -M emailaddress

cd ~/star-runs/

module load STAR

STAR --runThreadN $PBS_NUM_PPN \
     --genomeDir /home/classroom/hpcbio/sp15-rnaseq/starIndex \
     --readFilesIn ../trimming/yeast_1_50K.trimmed.fastq \
     --sjdbGTFfile /home/mirrors/igenome/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Annotation/Genes/genes.gtf \
     --outFileNamePrefix yeast_1_50K_star_ \
     --outSAMtype BAM SortedByCoordinate

