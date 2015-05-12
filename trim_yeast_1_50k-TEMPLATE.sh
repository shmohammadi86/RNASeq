#!/bin/bash
#PBS -l walltime=36:00:00
#PBS -l mem=2gb
#PBS -l nodes=1:ppn=2
#PBS -q classroom
#PBS -j oe
#PBS -M emailaddress
#PBS -N yeast_1_50k.trim
#PBS -m ae

module load trimmomatic/0.30

cd ~/trimming/

java -jar /home/apps/trimmomatic/trimmomatic-0.30/trimmomatic-0.30.jar SE \
-threads 2 -phred33 -trimlog yeast_1_50K.trimlog.txt ~/raw-data/yeast_1_50K.fastq.gz \
 yeast_1_50K.trimmed.fastq.gz ILLUMINACLIP:adapter.fa:2:30:10 LEADING:28 \
TRAILING:28 MINLEN:30

