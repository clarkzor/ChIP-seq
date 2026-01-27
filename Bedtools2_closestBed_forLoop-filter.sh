#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J closestBed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

cd /dfs5/bio/clarklh/Sox3_ChIP/closestBed/

for INPUT in Sox3*.closestBed.txt; do
    OUTPUT="${INPUT%.closestBed.txt}.closestBed_filtered.txt"
    awk -F'\t' 'NF >= 9 && $13 == "gene"' "$INPUT" > "$OUTPUT"
done
