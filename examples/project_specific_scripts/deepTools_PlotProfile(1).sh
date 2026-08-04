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

module load deeptools
module load anaconda

MATRIX=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.sh
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig3/profile_plot_3C/ReviewerPlots/St105_ezh2-foxh1_VG-genes_20kb_H3K27me3_VG-nathan_WT-Foxh1MutSignal-UNscaled.png
WIDTH=7
HEIGHT=6
COLOR1="#f97a35"
COLOR2="#765b73"
SIGNAL_MAX=200
SIGNAL_MIN=0

plotProfile --matrixFile $MATRIX --outFileName $OUTPUT --perGroup --colors $COLOR1 $COLOR2 --plotType "fill" --legendLocation "upper-right" --yMax $SIGNAL_MAX --yMin $SIGNAL_MIN --plotHeight $HEIGHT --plotWidth $WIDTH
#"#418003" green

 #"#f23f16" "#2a6af5"
