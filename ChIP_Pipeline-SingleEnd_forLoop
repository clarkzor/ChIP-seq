#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J ChIPpipeline
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 10:00:00

module load bowtie2
module load samtools
module load macs
module load anaconda
module load deeptools

# single read, ChIP_READ as .fastq, BOWTIE2_INDEX_NAME without suffix, macs2 p-value 0.001

BOWTIE2_INDEX_NAME=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/Alignment_Indexes/XT-V10_0_Bowtie2/XT-V10_0

RAW_DIR=/dfs7/mbt/choj1/from-dfs1/chip/Ezh2_2020/raw/
OUT_DIR=/dfs7/mbt/nymar/paper_2025/Realignment/

for i in {1..2}; do
  echo "Processing Replicate ${i}"

  ChIP_READ1=${RAW_DIR}/st9-Ezh2-Foxh1mut_read1_Replicate${i}.fastq
  OUTPUT_NAME=${OUT_DIR}/EZH2_St9_FMO_Rep${i}

 bowtie2 -q -x "$BOWTIE2_INDEX_NAME" \
    -U "$ChIP_READ1" \
    -S "${OUTPUT_NAME}.sam"

  samtools view -b "${OUTPUT_NAME}.sam" > "${OUTPUT_NAME}.bam"

  samtools rmdup -s "${OUTPUT_NAME}.bam" "${OUTPUT_NAME}_rmdup.bam"

  samtools sort -o "${OUTPUT_NAME}_rmdup_sort.bam" "${OUTPUT_NAME}_rmdup.bam"

  samtools index "${OUTPUT_NAME}_rmdup_sort.bam"

  bamCoverage \
    -b "${OUTPUT_NAME}_rmdup_sort.bam" \
    -o "${OUTPUT_NAME}_rmdup_sort.bw" \
    --effectiveGenomeSize 1100000000 \
    --binSize 50 \
    --normalizeUsing RPKM

  samtools bamtobed \
    -i "${OUTPUT_NAME}_rmdup_sort.bam" \
    > "${OUTPUT_NAME}_rmdup_sort.bed"

done
