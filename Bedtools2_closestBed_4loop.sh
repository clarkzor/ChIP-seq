#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J closestBed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

cd /dfs5/bio/clarklh/Sox3_ChIP/V10_Intersect

GENOME=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_Xenbase.sorted.gff3
OUTPUT_DIR=/dfs5/bio/clarklh/Sox3_ChIP/closestBed

for PEAKS in Sox3*.sorted.narrowPeak; do
    OUTPUT="${OUTPUT_DIR}/${PEAKS}.closestBed.txt"
    closestBed -d -k 5 -a "$PEAKS" -b "$GENOME" > "$OUTPUT"
done

