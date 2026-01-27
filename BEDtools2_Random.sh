#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bedtools_Intersect_Foxi2P300
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

bedtools random -n 20000 -l 700 -g /dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV10.genome > /dfs5/bio/clarklh/RNA_Seq/ReferenceGenome//XtropV10_genomeFile_20kRandom700BP_Real.bed
