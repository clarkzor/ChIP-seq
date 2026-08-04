#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bam_To_Bed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

BAM_INPUT=/dfs10/bio/clarklh/New_ChIP/Input_G_rmdup.bam
BED_OUTPUT=/dfs10/bio/clarklh/New_ChIP/Input_G_rmdup.bed

bedtools bamtobed -i $BAM_INPUT > $BED_OUTPUT
