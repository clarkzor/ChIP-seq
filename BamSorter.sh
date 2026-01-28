#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BamSorter
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load samtools/1.10

INPUT=/dfs7/mbt/nymar/paper_2025/Realignment/EZH2_St9_FMO_RepY_rmdup.bam
OUTPUT=/dfs7/mbt/nymar/paper_2025/Realignment/EZH2_St9_FMO_RepY_sorted_rmdup.bam

samtools sort $INPUT -o $OUTPUT -O bam

