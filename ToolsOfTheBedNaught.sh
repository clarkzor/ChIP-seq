#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bedtools_Intersect_Foxi2P300
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bedtools2

bedtools intersect -v \
 -a /dfs7/mbt/nymar/alignment_v10/H3K27me3_chip/macs2_p0.001/St105_H3K27me3-foxh1mut_vg_shift37_extsize73_peaks.broadPeak \
 -b /dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/St105_foxh1_peaks.bed \
 > /dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/St105_H3K27me3_foxh1mut_vg_peaks-Unique_vs_foxh1_st105.bed


#/dfs5/bio/clarklh/Sox3_ChIP/St9_XtropV10/IDR/Sox3_St9_IDR_R1vsR2.IDR0.05.sorted.narrowPeak
