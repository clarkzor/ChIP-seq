#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BamSplitter
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


module load samtools


samtools view -s 0.9562 -b /dfs7/mbt/nymar/data/H3K27me3/St105_H3K27me3-foxh1mut_vg.sorted.bam  > /dfs7/mbt/nymar/data/H3K27me3/St105_H3K27me3-foxh1mut_vg.sorted_95scaled.bam
