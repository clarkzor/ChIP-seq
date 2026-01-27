#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BedToBam
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


module load bedtools2

BED_INPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sort.bed
BAM_OUTPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup.bam
GENOME_GFF3=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV10.genome

bedtools bedtobam -i $BED_INPUT -g $GENOME_GFF3 > $BAM_OUTPUT

