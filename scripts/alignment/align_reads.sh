# Align case reads
for i in {1..3}; do tophat2 -r 300 -o tophat/f02$i\_case_tophat_out   index/f000_chr21_ref_genome_sequence   reads/f01$i\_case_read1.fastq reads/f01$i\_case_read2.fastq; done

# Align control reads
for i in {4..6}; do tophat2 -r 300 -o tophat/f02$i\_cont_tophat_out   index/f000_chr21_ref_genome_sequence   reads/f01$i\_cont_read1.fastq reads/f01$i\_cont_read2.fastq; done
