#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J DeepTools
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00 

module load deeptools

#BED-file - requires regions file
#bins
#  --BED /dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/H3K27me3_VG_GeneCoords.bed \

multiBamSummary bins \
  --bamfiles /dfs7/mbt/nymar/alignment_v10/ezh2_chip/st105/St105_ezh2_foxh1mut.sorted.bam /dfs7/mbt/nymar/alignment_v10/ezh2_chip/st105/St105_ezh2_wt.sorted.bam \
  --outFileName /dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/Ezh2_St105_Background_Foxh1Mut-vs-WT.npz \
  --outRawCounts /dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/Ezh2_St105_Background_Foxh1Mut-vs-WT.tab

