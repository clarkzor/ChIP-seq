#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J bamMerge
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load samtools

OUTPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_WT_St105_AC_Pooled_rmdup_sort.bam
BAM1=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_WT_St105_AC_Rep1_rmdup_sort.bam
BAM2=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_WT_St105_AC_Rep2_rmdup_sort.bam

samtools merge -o $OUTPUT -b $BAM1 $BAM2
