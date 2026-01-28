#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J DeepTools
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00 

module load deeptools

BAM_INPUT1=/dfs7/mbt/nymar/alignment_v10/ezh2_chip/st105/St105_ezh2_foxh1mut.sorted.bam
BAM_INPUT2=/dfs7/mbt/nymar/alignment_v10/ezh2_chip/st105/St105_ezh2_wt.sorted.bam
OUTPUT_NPZ=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/Ezh2_St105_Background_Foxh1Mut-vs-WT.npz
OUTPUT_COUNTS_IN_BINNED_REGIONS=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/Ezh2_St105_Background_Foxh1Mut-vs-WT.tab

multiBamSummary bins \
  --bamfiles $BAM_INPUT1 $BAM_INPUT2 \
  --outFileName $OUTPUT_NPZ \
  --outRawCounts $OUTPUT_COUNTS_IN_BINNED_REGIONS
