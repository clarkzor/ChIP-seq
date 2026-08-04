#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bedtools_Intersect_Foxi2P300
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

GENOME=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV10.genome
RANDOM_BED_OUTPUT=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV10_genomeFile_20kRandom700BP_Real.bed
NUMBER_OF_RANDOM_BED_REGIONS_GENERATED=20000
LENGTH_OF_RANDOM_BED_REGIONS_GENERATED=700

bedtools random -n $NUMBER_OF_RANDOM_BED_REGIONS_GENERATED -l $LENGTH_OF_RANDOM_BED_REGION_GENERATED -g $GENOME > $RANDOM_BED_OUTPUT
