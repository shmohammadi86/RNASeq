# GLBio RNA-Seq Workshop

This is the main repository for the RNA-Seq hands-on workshop, held at GLBio 2015, Purdue University. During this workshop, you will learn the basics of RNA-Seq data analysis, focusing on quality control, sequencing read alignment, and differential expression analysis. 

This course assumes a very basic knowledge of Linux, R, and next-generation sequencing (NGS). All materials in this course are free and open; feel free to reuse them as you like. 

Please find all workshop instructions on the [workshop wiki page](https://github.com/shmohammadi86/RNASeq/wiki).


## Description of Datasets and Tools Used in the Workshop

### Datasets

Name  | Download link  | Local path  | Description
------------- | ------------- | ------------- | -------------
Quality-Control Example Dataset | [Link](https://usegalaxy.org/u/jeremy/p/galaxy-rna-seq-analysis-exercise) | ./datasets/BodyMap | Small samples of datasets from the Illumina BodyMap 2.0 project; specifically, the datasets are paired-end 50bp reads from adrenal and brain tissues. The sampled reads map mostly to a 500Kb region of chromosome 19, positions 3-3.5 million (chr19:3000000:3500000)
RNA-Seq Analysis Dataset | NA |./datasets/workshop | Simulated data from human chromosome 21. 1-2M reads are simulated with various parameters, including length and mutation rates. Samples are paired-end, with 3 treatment and 3 controls.

### Tools

Name  | Download link  | Local path  | Description
------------- | ------------- | ------------- | -------------
FastQC | [Link](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | ./tools/FastQC | A quality control tool for high throughput sequence data
Trimmomatic | [Link](http://www.usadellab.org/cms/?page=trimmomatic) | ./tools/Trimmomatic | Performs a variety of useful trimming tasks for Illumina paired-end and single-end data. The selection of trimming steps and their associated parameters are supplied on the command line.
Bowtie2 | [Link](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml) | ./tools/bowtie | An ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.
SAMtools | [Link](http://samtools.sourceforge.net/) | ./tools/samtools | Provides various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format.
TopHat | [Link](http://ccb.jhu.edu/software/tophat/index.shtml) | ./tools/tophat | TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.
Cufflinks | [Link](http://cole-trapnell-lab.github.io/cufflinks/) | ./tools/cufflinks | Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.
