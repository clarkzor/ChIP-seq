#!/bin/bash
#SBATCH -A kwcho_lab 
#SBATCH -J ROSE
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

cd /dfs5/bio/clarklh/ROSE

module load python/2.7.17
module load R
module load samtools


GENOME_BUILD=XTROP
INPUT_CONSTITUENT_GFF=/dfs5/bio/clarklh/H3K27me3_ChIP/St105/Jin/MACS2_broadpeak/H3K27me3_St105_VG_Pooled_rmdup_sort_peaks.bed
RANKING_BAM=/dfs5/bio/clarklh/H3K27me3_ChIP/St105/Jin/H3K27me3_St105_VG_Pooled_rmdup_99scaled.sorted.bam
OUTPUT=/dfs5/bio/clarklh/ROSE/H3K27me3/VG



python ROSE_main.py -g $GENOME_BUILD -i $INPUT_CONSTITUENT_GFF -r $RANKING_BAM -o $OUTPUT
