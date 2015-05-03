# GLBio RNASeq workshop

This is the main repository for the RNA-Seq hands-on workshop, held at GLBio 2015, Purdue University. You can clone the repository to your local machine using:

```
git clone https://github.com/shmohammadi86/RNASeq.git
```

For detailed information regarding workshop exercises, please visit [Workshop outline](https://github.com/shmohammadi86/RNASeq/wiki)


## Dowload links and descriptions

### Datasets

Name  | Download link  | Local path  | Description
------------- | ------------- | ------------- | -------------
RNA-seq Analysis Exercise | https://usegalaxy.org/u/jeremy/p/galaxy-rna-seq-analysis-exercise | ./dataset/BodyMap | Small samples of datasets from the Illumina BodyMap 2.0 project; specifically, the datasets are paired-end 50bp reads from adrenal and brain tissues. The sampled reads map mostly to a 500Kb region of chromosome 19, positions 3-3.5 million (chr19:3000000:3500000)



### Tools

Name  | Download link  | Local path  | Description
------------- | ------------- | ------------- | -------------
Bowtie2 | http://bowtie-bio.sourceforge.net/bowtie2/index.shtml | ./tools/bowtie | An ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences 
FastQC | http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ | ./tools/FastQC | A quality control tool for high throughput sequence data
Trimmomatic | http://www.usadellab.org/cms/?page=trimmomatic | ./tools/Trimmomatic | performs a variety of useful trimming tasks for illumina paired-end and single ended data.The selection of trimming steps and their associated parameters are supplied on the command line
SAMtools | http://samtools.sourceforge.net/ | ./tools/samtools | provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format
TopHat | http://ccb.jhu.edu/software/tophat/index.shtml | ./tools/tophat | TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.
Cufflinks | http://cole-trapnell-lab.github.io/cufflinks/ | ./tools/cufflinks | Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.
