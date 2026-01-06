#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Heatmap
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=2 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load deeptools

#colorList colors "white, darkblue" and "white, darkred"

MATRIX=/dfs7/mbt/nymar/paper_2025/fig2/heatmap-profile_plot_2D/ReviewerHeatmaps/IV-A_peaks_Ezh2_St105_WT-Foxh1Mut-scaled.sh
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig2/heatmap-profile_plot_2D/ReviewerHeatmaps/IV-A_peaks_Ezh2_St105_WT-Foxh1Mut-scaled.png

plotHeatmap --matrixFile $MATRIX --outFileName $OUTPUT --colorList "white, #083977" "white, #a10f15"  --heatmapHeight 5 --zMax 150 #--kmeans 2 --outFileSortedRegions /dfs7/mbt/nymar/paper_2025/fig2/heatmap-profile_plot_2D/ReviewerHeatmaps/II-B_peaks_Ezh2_St9_WT-Foxh1Mut-scaled_Kmeans2.bed #--whatToShow "heatmap and colorbar" 

#Fox and Sox "white, #cc2d2d" "white, #5392b6"

#ATAC BLACK "white, #636363"

#"white, #c71919" "white, #c71919" "white, #c71919"  "white, #3a5237" "white, #3a5237" "white, #147a04" "white, #147a04"

#"white, #4589b0" "white, #4589b0" "white, #4589b0"  "white, #3a5237" "white, #3a5237" "white, #147a04" "white, #147a04"


# P300 "white, #147a04"
# H3K427ac "white, #3a5237"
# H3K4me1  "white, #b3760c"
# H3K27me3 "white, #1a5391"

#af6c07
#29571b
# #2d661b

##418003
#"white, #dca771"

#"white, #525151" 
#"white, #bf7806"
