#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J computeMatrix
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load deeptools
module load anaconda

BIGWIG_COV=
BED_ALIGNMENT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_ezh2-foxh1_VG-genes_20kb.txt
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.sh

computeMatrix scale-regions -S /dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3_VG_scaledto1.000_RPKM.bw /dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/St105_H3K27me3-Mfoxh1_VG_scaledto0.966_RPKM.bw -R $BED_ALIGNMENT -o $OUTPUT --missingDataAsZero --binSize 20 -b 20000 -a 20000 --regionBodyLength 4000 #--referencePoint center


#/dfs10/bio/clarklh/Foxi2_ChIP/Bowtie1/St105_V10/Foxi2_St105_Rep2_V10Align_RPKM.sorted.bw /dfs10/bio/clarklh/Sox3_ChIP/St105_XtropV10/Sox3_St10_Pooled_RPKM.sorted.bw /dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_WT_St105_AC_Pooled_rmdup_sorted.bw /dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bw


#/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_WT_St105_VG_Pooled_rmdup_sorted.bw /dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_VG_Pooled_rmdup_sorted.bw

#/dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St8/H3K27ac_St8_Pooled_Gupta_rmdup_sort.-60scaled.bw /dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St9/H3K27ac_St9_Pooled_Gupta_rmdup.70-60scaled.bw /dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St10/H3K27ac_St10_Pooled_Gupta_rmdup_sort.70-60scaled.bw




#/dfs5/bio/clarklh/SuperEnhancers/KittSE/Bowtie/ChIPWT-h3k4me1-ecto-pooled.sorted_RPKM.bw /dfs5/bio/clarklh/SuperEnhancers/KittSE/Bowtie/ChIPWT-h3k4me1-endo-Pooled.sorted_81scaled-RPKM.bw

#/dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/aligned/animal-ep300-chip-st10-5-aligned-xtrop-v10-rmv-sorted_81scaled-RPKM.bw /dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/aligned/vegetal-ep300-chip-st10-5-aligned-xtrop-v10-rmv-sorted-RPKM.bw

#/dfs5/bio/clarklh/AC_VG_Epi/bigwig/H3K27ac-AC_St105.bw /dfs5/bio/clarklh/AC_VG_Epi/bigwig/H3K27ac-VG_St105.bw

#/dfs5/bio/clarklh/H3K4me1_ChIP/Genscht/H3K4Me1_St8_R1.sorted.bw /dfs5/bio/clarklh/H3K4me1_ChIP/Hontelez/V10_0-Analysis/H3K4Me1_St9.sorted.bw /dfs5/bio/clarklh/H3K4me1_ChIP/Hontelez/V10_0-Analysis/H3K4Me1_St105.sorted.bw

#/dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St8/H3K27ac_St8_Pooled_Gupta_rmdup_sort_100.bw /dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St9/H3K27ac_St9_Pooled_Gupta_rmdup_sort_100.bw /dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St10/H3K27ac_St10_Pooled_Gupta_rmdup_sort_100.bw


#/dfs5/bio/clarklh/H3K4me1_ChIP/Hontelez/V10_0-Analysis/H3K4Me1_St105.sorted.bw


#/dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St9/H3K27ac_St9_Pooled_Gupta_rmdup_sort_100.bw

#/dfs5/bio/clarklh/H3K27ac_ChIP/Gupta/St8/H3K27ac_St8_Pooled_Gupta_rmdup_sort_100.bw

#/dfs5/bio/clarklh/ATAC/St105/AC/V10_0/Bowtie/ATAC_St105_AC_R1_RmDup.sorted_100.bw

#/dfs5/bio/clarklh/SuperEnhancers/KittSE/Bowtie/ChIPWT-h3k4me1-ecto-Pooled.sorted.bw



#/dfs5/bio/clarklh/Sox3_ChIP/St8_XtropV10/Sox3_St8_Rep2_RPKM.sorted.bw /dfs5/bio/clarklh/Sox3_ChIP/St9_XtropV10/Sox3_St9_Pooled_RPKM.sorted.bw /dfs5/bio/clarklh/Sox3_ChIP/St105_XtropV10/Sox3_St10_Pooled_RPKM.sorted.bw /dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/aligned/animal-ep300-chip-st10-5-aligned-xtrop-v10-rmv-sorted_81scaled-RPKM.bw /dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/aligned/vegetal-ep300-chip-st10-5-aligned-xtrop-v10-rmv-sorted-RPKM.bw /dfs5/bio/clarklh/AC_VG_Epi/bigwig/H3K27ac-AC_St105.bw /dfs5/bio/clarklh/AC_VG_Epi/bigwig/H3K27ac-VG_St105.bw
