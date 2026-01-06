#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Moteefer
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


conda activate HOMER
conda init bash

PEAKS=/dfs10/bio/clarklh/Foxi2_ChIP/MACS2-IDR/Bowtie_V10/IDR/TotalPeak/Foxi2_St89105CombPeaks_IDR_Unique.05.narrowPeak
GENOME=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta
OUTPUT=/dfs10/bio/clarklh/Foxi2_ChIP/Bedtools/V10_0-Analysis/Intersect/FindMotifOccurrence/Foxf1Motif_Foxi2St8-10-SharedPeakMotifLocation.txt
MOTIF=/dfs10/bio/clarklh/Homer_Motifs/V10_Analysis/Foxi2_St8-105_CombPeaks/Foxi2TotalPeak/knownResults/known3.motif
MOTIF_BED=/dfs10/bio/clarklh/Foxi2_ChIP/Bedtools/V10_0-Analysis/Intersect/FindMotifOccurrence/Foxf1Motif_Foxi2St8-10-SharedPeakMotifLocation.bed

annotatePeaks.pl $PEAKS $GENOME -size 2000 -hist 20 -ghist -m $MOTIF -mbed $MOTIF_BED > $OUTPUT

#annotatePeaks.pl $PEAKS $GENOME -size 2000 -m $MOTIF -mbed $MOTIF_BED > $OUTPUT 

