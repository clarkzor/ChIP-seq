#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J sortBed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

cd /dfs5/bio/clarklh/Foxi2_ChIP/Bedtools/V10_0-Analysis/Intersect/FindMotifOccurrence/

for file in Foxi2St89105Act_Sox3St89105Act-wa.narrowPeak; do
    sortBed -i "$file" > "${file%.narrowPeak}.sorted.narrowPeak"
done

