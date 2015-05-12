#!/bin/bash
#PBS -l walltime=36:00:00
#PBS -l mem=8gb
#PBS -l nodes=1:ppn=1
#PBS -q classroom
#PBS -j oe
#PBS -N yeast_1_featCounts
#PBS -M emailaddress
#PBS -m ae

module load subread

cd ~/featureCounts/

featureCounts -T 1 -s 2 -g gene_id -t exon -o yeast_1_50K_featCounts.txt \
-a /home/mirrors/igenome/Saccharomyces_cerevisiae/Ensembl/R64-1-1/Annotation/Genes/genes.gtf \
../star-runs/yeast_1_50K_star_Aligned.sortedByCoord.out.bam
