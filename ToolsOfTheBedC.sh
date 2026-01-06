#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BedVsBamC
#SBATCH -p standard
#SBATCH --nodes=2 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

QUERY=/dfs7/mbt/nymar/data/H3K27me3/St105_H3K27me3_ac.sorted.bam
TARGET=/dfs7/mbt/nymar/data/H3K27me3/gtf_gene_EZH2-Foxh1_AC.tsv
OUTPUT=/dfs7/mbt/nymar/data/H3K27me3/Intersect/EZH2-Foxh1-ACGenebody_H3K27me3-AC-C.bed


bedtools intersect -C\
 -abam $QUERY \
 -b $TARGET -bed \
 > $OUTPUT

