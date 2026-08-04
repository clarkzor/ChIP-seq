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
ChIP_READ1=/dfs7/mbt/choj1/from-dfs1/chip/Ezh2_2020/raw/st9-Ezh2-Foxh1mut2-READ1_Replicate1.fastq
ChIP_READ2=/dfs7/mbt/choj1/from-dfs1/chip/Ezh2_2020/raw/st9-Ezh2-Foxh1mut2-READ2_Replicate1.fastq
OUTPUT_NAME=/dfs7/mbt/nymar/paper_2025/Realignment/EZH2_St9_FMO_Rep1

bowtie2 -q -x $BOWTIE2_INDEX_NAME -1 $ChIP_READ1 -2 $ChIP_READ2 -S ${OUTPUT_NAME}.sam

samtools view -b ${OUTPUT_NAME}.sam -o ${OUTPUT_NAME}.bam

samtools rmdup -s ${OUTPUT_NAME}.bam ${OUTPUT_NAME}_rmdup.bam

samtools sort -o ${OUTPUT_NAME}_rmdup_sort.bam -O bam ${OUTPUT_NAME}_rmdup.bam

samtools index ${OUTPUT_NAME}_rmdup_sort.bam ${OUTPUT_NAME}_rmdup_sort.bai

bamCoverage -b ${OUTPUT_NAME}_rmdup_sort.bai -o ${OUTPUT_NAME}_rmdup_sort.bw --effectiveGenomeSize 1100000000 --binSize 50 --normalizeUsing RPKM

samtools bamtobed -i ${OUTPUT_NAME}_rmdup_sort.bam > ${OUTPUT_NAME}_rmdup_sort.bed
