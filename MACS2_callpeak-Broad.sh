#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J MACS2_Broad
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load macs

CHIP=/dfs5/bio/clarklh/H3K27me3_ChIP/St105/Jin/H3K27me3_St105_VG_Pooled_rmdup_sort.bed
INPUT=/dfs5/bio/clarklh/FoxH1_ChIP/RmDup_Reads/V10_0-Analysis/FoxH1_Inp_St105.sorted.bed
OUTPUT=/dfs5/bio/clarklh/H3K27me3_ChIP/St105/Jin/MACS2_broadpeak/H3K27me3_St105_VG_Pooled_rmdup_sort

macs2 callpeak -t $CHIP -c $INPUT -n $OUTPUT -f BED -g 1.1e9 -q .05 --broad --nomodel
