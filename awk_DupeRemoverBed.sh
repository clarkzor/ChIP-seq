#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Moteefer
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=1 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

INPUT_BED=/dfs10/bio/clarklh/New_ChIP/IDR/Intersect/Grhl1_vs_Sox3_St105.narrowPeak
DUPE_REMOVED_BED=/dfs10/bio/clarklh/New_ChIP/IDR/Intersect/Grhl1_vs_Sox3_St105_RmDup.narrowPeak

awk '!seen[$1,$2,$3]++' $INPUT_BED > $DUPE_REMOVED_BED
