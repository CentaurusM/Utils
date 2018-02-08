#!/bin/bash
sample_id=$1

input_dir=./data_input
local_dir=./temp
bucket_dir=./new-berry-data/falcon
ref_dir=./ref
ref_genome=$ref_dir/human_g1k_v37.fasta
out_dir=./output
dbSNP=$ref_dir/dbsnp_138.b37.vcf
#dbSNP=$ref_dir/All_20161121.vcf.gz
#g1000_indels=$ref_dir/1000G_phase1.indels.b37.vcf
#g1000_gold_standard_indels=$ref_dir/Mills_and_1000G_gold_standard.indels.b37.vcf

start_ts=$(date +%s)
set -x
/usr/local/falcon/bin/fcs-genome align \
    -r $ref_genome \
    -1 ${input_dir}/${sample_id}_1.fastq.gz \
    -2 ${input_dir}/${sample_id}_2.fastq.gz \
    -o $local_dir/${sample_id}.bam \
    -R $sample_id -S $sample_id -L $sample_id -P illumina -f

/usr/local/falcon/bin/fcs-genome bqsr \
    -r $ref_genome \
    -i $local_dir/${sample_id}.bam \
    -o $local_dir/${sample_id}.recal.bam \
    -K $dbSNP -f

/usr/local/falcon/bin/fcs-genome htc \
    -r $ref_genome \
    -i $local_dir/${sample_id}.recal.bam \
    -O "-stand_call_conf 50" \
    -O "-A RMSMappingQuality" \
    -O " -maxAltAlleles 15" \
    -o ${out_dir}/${sample_id}.vcf -v -f
set +x
#-O "-A BaseCounts" \
#-O "-stand_emit_conf 10.0" \

end_ts=$(date +%s)
echo "Pipeline finishes in $((end_ts - start_ts)) seconds"
#mv
