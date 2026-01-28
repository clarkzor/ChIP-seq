#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BedTools_GenomeCov-d_Foxi2_St8
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2
module load anaconda

INPUT=/dfs5/bio/clarklh/Sox3_ChIP/St10_XtropV9/Sox3_St10_Pooled.sorted.bam
OUTPUT_GENOME_FILE=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV9_0.genome

bedtools genomecov -ibam $INPUT -g $OUTPUT_GENOME_FILE
