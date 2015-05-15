### Counting reads with HTSeq
---------------------------------------------------------------------------

#### Copied From the NGS workshop

    htseq-count --format=bam --stranded=no --type=gene g031_case_sorted_n.bam f005_chr21_genome_annotation.gtf > h041_case.count
    htseq-count --format=bam --stranded=no --type=gene g032_case_sorted_n.bam f005_chr21_genome_annotation.gtf > h042_case.count
    htseq-count --format=bam --stranded=no --type=gene g033_case_sorted_n.bam f005_chr21_genome_annotation.gtf > h043_case.count

    htseq-count --format=bam --stranded=no --type=gene g034_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > h044_cont.count
    htseq-count --format=bam --stranded=no --type=gene g035_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > h045_cont.count
    htseq-count --format=bam --stranded=no --type=gene g036_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > h046_cont.count

or at __exon__ level (the default setting)

    htseq-count --format=bam --stranded=no --type=exon g031_case_sorted_n.bam f005_chr21_genome_annotation.gtf > g041_case.count
    htseq-count --format=bam --stranded=no --type=exon g032_case_sorted_n.bam f005_chr21_genome_annotation.gtf > g042_case.count
    htseq-count --format=bam --stranded=no --type=exon g033_case_sorted_n.bam f005_chr21_genome_annotation.gtf > g043_case.count

    htseq-count --format=bam --stranded=no --type=exon g034_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > g044_cont.count
    htseq-count --format=bam --stranded=no --type=exon g035_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > g045_cont.count
    htseq-count --format=bam --stranded=no --type=exon g036_cont_sorted_n.bam f005_chr21_genome_annotation.gtf > g046_cont.count


Observe the structure of the "count" files. 

    head h041_case.count 
    tail h041_case.count 

Compare the __gene__ and the __exon__ level computations.

    head h041_case.count
    head g041_case.count 


Can you find a way to report counts at _exon_ level? (read the help of `htseq-count`)
  <!-- htseq-count --format=bam --stranded=no --type=exon --idattr=exon_id g031_case_sorted_n.bam f005_chr21_genome_annotation.gtf | head -->


After sorting bam files by name, you can count using HTSeq:

```
htseq-count -q -m union -s no -t exon -i gene_id t21rep1.sam Mus_chr19.gtf > t21rep1.counts
```

Show to make sure it's okay:

```
head –n 30 t21rep1.counts
tail –n 10 t21rep1.counts
```

The following commands generate the combined matrix

```
echo -e "Genes\tt7r1\tt7r2\tt7r3\tt21r1\tt21r2\tt21r3" > matrix.part1
paste t7rep*.counts t21rep*.counts > matrix.part2 cut -f 1,2,4,6,8,10,12 matrix.part2 > matrix.part3 cat matrix.part1 matrix.part3 > counts_matrix.txt
```

The complete matrix is counts_matrix.txt 

```
head counts_matrix.txt // View the top of the matrix wc –l counts_matrix.txt
```

Count number of lines in file.971 lines are present

Remove last 5 lines of HTSeq statistics information from the file

```
sed ‘967,971d’ < counts_matrix.txt > counts_matrix_final.txt
```