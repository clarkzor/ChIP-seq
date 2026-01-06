#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J DeepTools
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load deeptools

bigwigCompare -b1 /dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3-Mfoxh1_AC_scaledto0.844_RPKM.bw -b2 /dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3-Mfoxh1_AC_scaledto0.844_RPKM.bw --scaleFactors 0.79:1 --operation first -of bigwig -o /dfs7/mbt/nymar/paper_2025/fig3/St105_H3K27me3-Mfoxh1_AC_scaledto0.966_RPKM_MAscaledto0_79.bw



#/dfs7/mbt/nymar/paper_2025/fig3/St105_H3K27me3-Mfoxh1_VG_scaledto0.966_RPKM.bw
#/dfs7/mbt/nymar/paper_2025/fig3/St105_H3K27me3-Mfoxh1_VG_scaledto0.966_RPKM.bw


