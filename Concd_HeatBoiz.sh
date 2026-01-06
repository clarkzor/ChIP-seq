#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J ConcdHeatBoiz_Foxi2Score_Foxi2Sox3SEregions
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load deeptools

MATRIX=

OUTPUT=/dfs5/bio/clarklh/Foxi2_ChIP/Bedtools/V10_0-Analysis/Intersect/P300_St10WE/Matrix/Foxi2Sox3P300Scores_Foxi2Sox3P300SharedSt105Regions_

samples_Label_top="Foxi2 St10.5 Peaks (6,049)"
samples_Label_bottom=
y_AxisLabel_top="H3K4me1 Scores"
y_AxisLabel_bottom="Foxi2 St10.5 Peaks (6,049)"
ColorList='black,yellow'


plotHeatmap -m $MATRIX -out ${OUTPUT}No_Kmean.png --refPointLabel "Center" --colorList $ColorList --heatmapHeight 10  --whatToShow "plot and heatmap" --legendLocation "none"

plotHeatmap -m $MATRIX -out ${OUTPUT}Kmeans2.png --kmeans 2 --refPointLabel "Center" --colorList $ColorList --heatmapHeight 10  --yAxisLabel "$y_AxisLabel_bottom"  --xAxisLabel " " --regionsLabel "I" "II" --outFileSortedRegions ${OUTPUT}SortedRegions_Kmeans2.bed

plotHeatmap -m $MATRIX -out ${OUTPUT}Kmeans3.png --kmeans 3 --refPointLabel "Center" --colorList $ColorList --heatmapHeight 10 --yAxisLabel "$y_AxisLabel_bottom"  --xAxisLabel " " --regionsLabel "I" "II" "III" --outFileSortedRegions ${OUTPUT}SortedRegions_Kmeans3.bed

plotHeatmap -m $MATRIX -out ${OUTPUT}Kmeans5.png --kmeans 5 --refPointLabel " " --colorList $ColorList --heatmapHeight 10 --yAxisLabel "$y_AxisLabel_bottom"  --xAxisLabel "Center" --regionsLabel "I" "II" "III" "IV" "V" --outFileSortedRegions ${OUTPUT}SortedRegions_Kmeans5.bed

plotHeatmap -m $MATRIX -out ${OUTPUT}Kmeans6.png --kmeans 6 --refPointLabel " " --colorList $ColorList --heatmapHeight 10  --yAxisLabel "$y_AxisLabel_bottom"  --xAxisLabel "Center" --regionsLabel "I" "II" "III" "IV" "V" "VI" --outFileSortedRegions ${OUTPUT}SortedRegions_Kmeans6.bed

