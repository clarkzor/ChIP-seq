#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BamToBai
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#Here we can use "Index" command of samtools to create a .bai (bam index) from our input .bam file.
#You must create .bai bam index files if you want to be able to convert your .bam file into a wiggle file for binning and downstream visualization.


module load samtools

samtools index /dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bam /dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bai
