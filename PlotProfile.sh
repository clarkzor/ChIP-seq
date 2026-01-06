#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J PlotProfiler_ScaledRegions
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=3 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#How to make the plotprofiler of genes within 10kb of a TF,
#1) Need to run closestBed on TF narrowPeak, generate genes within 10kb of peak list
#2) Need to take genes from 10kb peak list and match them to genes in /ReferenceGenome/XENTR_10x_GCF.bed
#3) Need to run computeMatrix using gene.bed's regions, TF scores
#4) Need to finally run this script's plotProfile to generate the bindingprofile figure of TF->Genes


#--plotWidth 7
#--plotHeight 6

module load deeptools
module load anaconda

MATRIX=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.sh
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.png

plotProfile --matrixFile $MATRIX --outFileName $OUTPUT --perGroup  --colors "#f97a35" "#765b73" --plotType "fill" --legendLocation "upper-right" #--yMax 200 --yMin 0

#'#c28a08' 
#ORANGES FOR H3K4me1 -  '#45433f' '#c28a08' '#ebab17' 
#GREENS FOR H3K27ac -  '#064202'  '#2d9426' "#9ad197"


# --samplesLabel " "

##739a71

##8aedbb


# "white, #418003"

##a7a8a5 light gray

#"#418003" green

 #"#f23f16" "#2a6af5"
