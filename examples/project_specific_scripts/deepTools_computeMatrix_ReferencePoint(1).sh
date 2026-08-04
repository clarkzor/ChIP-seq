#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J computeMatrix
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load deeptools
module load anaconda

BIGWIG_COV="/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3_VG_scaledto1.000_RPKM.bw /dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3-Mfoxh1_VG_scaledto0.966_RPKM.bw"
BED_ALIGNMENT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_ezh2-foxh1_VG-genes_20kb.txt
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.sh

computeMatrix reference-point -S $BIGWIG_COV -R $BED_ALIGNMENT -o $OUTPUT --missingDataAsZero --binSize 20 -b 20000 -a 20000 --referencePoint center
