#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Heatmap
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=2 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load deeptools

MATRIX=/dfs7/mbt/nymar/paper_2025/fig2/heatmap-profile_plot_2D/ReviewerHeatmaps/IV-A_peaks_Ezh2_St105_WT-Foxh1Mut-scaled.sh
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig2/heatmap-profile_plot_2D/ReviewerHeatmaps/IV-A_peaks_Ezh2_St105_WT-Foxh1Mut-scaled.png
COLOR1="white, #083977"
COLOR2="white, #a10f15"
PlotHeight=5
Max_Signal=150

plotHeatmap --matrixFile $MATRIX --outFileName $OUTPUT --colorList $COLOR1 $COLOR2 --heatmapHeight $PlotHeight --zMax $Max_Signal --whatToShow "heatmap and colorbar" 
