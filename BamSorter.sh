#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BamSorter
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load samtools/1.10

INPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup.bam
OUTPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bam

samtools sort $INPUT -o $OUTPUT -O bam

