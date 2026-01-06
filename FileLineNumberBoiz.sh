#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J MACS2_Sox3_PPseudo1
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load samtools

less -N +F /dfs5/bio/clarklh/Foxi2_ChIP/Bowtie1/St105_V10/Foxi2_St105_Pooled_V10Align.sorted.bed

