#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Moteefer
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=20 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load samtools

BAM_INPUT=/dfs10/bio/clarklh/Foxi2_ChIP/MACS2-IDR/Bowtie_V10/IDR/TotalPeak/Foxi2_St89105CombPeaks_IDR_Unique.05.narrowPeak
BAM_OUTPUT=/dfs10/bio/clarklh/Foxi2_ChIP/MACS2-IDR/Bowtie_V10/IDR/TotalPeak/Foxi2_St89105CombPeaks_IDR_Unique_RmDup.05.narrowPeak

samtools rmdup $BAM_INPUT $BAM_OUTPUT
