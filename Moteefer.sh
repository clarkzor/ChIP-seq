#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bedtools_Intersect_Foxi2P300
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

conda activate HOMER

PEAKS=/dfs10/bio/clarklh/New_ChIP/IDR/Intersect/Grhl1_UniquefromFoxi2andSox3.narrowPeak
OUTPUT=/dfs10/bio/clarklh/New_ChIP/IDR/Grhl1_UniquefromFoxi2Sox3_motif
GENOME=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta

findMotifsGenome.pl $PEAKS $GENOME $OUTPUT -size 100
