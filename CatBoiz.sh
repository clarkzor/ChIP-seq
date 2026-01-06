#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J CatBoiz
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

cd /dfs10/bio/clarklh/ATAC/St12

FILE_1=/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_R1_rmdup.bed
FILE_2=/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_R2_rmdup.bed
#FILE_3=Foxi2_St9_vs_St8andSt105-III-v_sorted.narrowPeak
#FILE_4=Foxi2_St8-St105Shared_vs_St9-IV-v.sorted.narrowPeak
#FILE_5=Foxi2_St9-St105Shared_vs_St8-V-v.sorted.narrowPeak
#FILE_6=Foxi2_St105_vs_St8andSt9-VI-v_sorted.narrowPeak
#FILE_7=Foxi2_St89105_Persis-VII-wa_sorted.narrowPeak
OUTPUT=/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_Pooled_rmdup.bed

cat $FILE_1 $FILE_2 > $OUTPUT 

