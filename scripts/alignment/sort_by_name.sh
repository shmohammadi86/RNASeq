# Sort 'case' bam file by name
for i in {1..3}; do samtools sort -n tophat/f02$i\_case_tophat_out/accepted_hits.bam  bam_name_sorted/g03$i\_case_sorted_n; done

# Sort 'control' bam file by name
for i in {4..6}; do samtools sort -n tophat/f02$i\_cont_tophat_out/accepted_hits.bam  bam_name_sorted/g03$i\_cont_sorted_n; done
