#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Bedtools_Intersect_Foxi2P300
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=1 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00


#bedtools intersect command is really useful for filtering similarities, or dissimilarities, between .bed format files. The main use is filtering for physically overlapping peaks to create logical Venn Diagrams. Another use is for filtering .summit files using previous filtered IDR.narrowPeak files. This is useful because in order to call Motifs on persistent peaks, we need to define the persistent peaks by intersecting IDR outputs. Next we need to filter our Pooled.summit file using our intersected/filtered IDR output to create a summit files containing only persistent peak summits. Next we use bedtools slop to create a new bedfile containing the peak summit plus (x) amount of bases on either side of the summit. If our slop usage is set to 50bp, then our output slop.bed file will contain the peak summit, along with 50bp on either side of the summit, giving a 101bp peak fragment, centered on the summit. Very finally we use getfasta command on the slop output to create fasta files of the 101 bp fragment centered on summit. MeMe-ChIP uses these fasta fragments centered on summit to then call Motif enrichment across the particular population on peaks.

module load bedtools2

QUERY=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/intersect/Ezh2_Foxh1_St105_Shared_vs_H3K27me3_VG_real.bed
TARGET=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/intersect/Ezh2_Foxh1_St105_Shared_vs_H3K27me3_AC_real.bed
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/intersect/Ezh2_Foxh1_St105_Shared_vs_H3K27me3_AC_VS_VG_real.bed

bedtools intersect -wa\
 -a $QUERY \
 -b $TARGET \
 > $OUTPUT

#/dfs5/bio/clarklh/Foxi2_ChIP/MACS2-IDR/Bowtie_V10/IDR/St105/Foxi2_St105_R1vR2_IDR.IDR0.05.narrowPeak

#/dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/Animal_ChIP/IDR/ep300_AC_stage10_5_pooled_r1vsr2.IDR0.05.sorted.narrowPeak

#/dfs5/bio/clarklh/Sox3_ChIP/V10_Intersect/P300/Sox3_St89105Combined_P300-AC_Peaks-wa_sorted.narrowPeak
