#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J MACS2
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load python
module load macs

CHIP=/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_R1_rmdup.bed
INPUT=/dfs10/bio/clarklh/FoxH1_ChIP/RmDup_Reads/V10_0-Analysis/FoxH1_Inp_St105.sorted.bed
OUTPUT=/dfs10/bio/clarklh/New_ChIP/MACS2/Grhl1_ChIP_R1

macs2 callpeak -t $CHIP -c $INPUT -n $OUTPUT -f BED -g 1.1e9 -p .001
