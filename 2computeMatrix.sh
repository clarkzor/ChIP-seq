#!/bin/bash
#$ -N z_computeMatrix_FoxH1_vs_Foxi2_Pooled_Pseudo_St9_SharedPeaksRefPoint1kb
#$ -q frog,bio
#$ -m beas

module load anaconda
module load bedtools/2.25.0

BIGWIG_COV=/dfs3/bio/clarklh/Foxi2_ChIP/IDR/Pooled/Foxi2_Pooled_St9_vs_XtropV9.sorted_RMDUP.bw /dfs3/bio/clarklh/FoxH1_ChIP/RmDup_Reads/FoxH1_St9/FoxH1_Pooled_St9_RMDUP.bw
BED_ALIGNMENT=/dfs3/bio/clarklh/Foxi2_ChIP/IDR/Pooled_Pseudo/IDR_Foxi2_Pooled_Pseudo_St9/Foxi2_Pooled_Pseudo_St9.IDR0.05.narrowPeak /dfs3/bio/clarklh/FoxH1_ChIP/RmDup_Reads/IDR/IDR_Pooled_PseudoReps_St9/FoxH1_Pooled_Pseudo_St9_IDR_05.narrowPeak
OUTPUT=/dfs3/bio/clarklh/Foxi2_ChIP/DeepTools/Matrix/Foxi2_vs_FoxH1_St9_RefPoint_1kb/Foxi2_vs_FoxH1_St9_RefPoint_1kb.sh

computeMatrix reference-point -S $BIGWIG_COV -b 1000 -a 1000 -R $BED_ALIGNMENT -o $OUTPUT --missingDataAsZero --referencePoint center

