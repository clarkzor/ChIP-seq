#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J ConcdHeatBoiz_Foxi2Score_Foxi2Sox3SEregions
#SBATCH -p standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH -error=slurm-%J.err

module load deeptools

MATRIX=                         
OUTPUT=/dfs5/bio/clarklh/Foxi2_ChIP/Bedtools/V10_0-Analysis/Intersect/P300_St10WE/Matrix/Foxi2Sox3P300Scores_Foxi2Sox3P300SharedSt105Regions_

y_AxisLabel="Foxi2 St10.5 Peaks (6,049)"
ColorList='black,yellow'

########No k-means heatmap#########

plotHeatmap \
  -m "$MATRIX" \
  -out "${OUTPUT}No_Kmeans.png" \
  --refPointLabel "Center" \
  --colorList $ColorList \
  --heatmapHeight 10 \
  --whatToShow "plot and heatmap" \
  --legendLocation "none"


#########Varied K-means heatmaps#########

for k in 2 3 5 6; do

  # Generate region labels: I II III ...
  regions=$(printf '"%s" ' $(seq -f "%g" -w 1 $k | sed 's/.*/I/;s/I\{2\}/II/;s/I\{3\}/III/;s/I\{4\}/IV/;s/I\{5\}/V/;s/I\{6\}/VI/'))

  plotHeatmap \
    -m "$MATRIX" \
    -out "${OUTPUT}Kmeans${k}.png" \
    --kmeans $k \
    --refPointLabel "Center" \
    --colorList $ColorList \
    --heatmapHeight 10 \
    --yAxisLabel "$y_AxisLabel" \
    --xAxisLabel " " \
    --regionsLabel $(eval echo $regions) \
    --outFileSortedRegions "${OUTPUT}SortedRegions_Kmeans${k}.bed"

done
