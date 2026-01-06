#!/bin/bash
#$ -N z_closestBed_Foxi2_St9_AllPeaks
#$ -q frog,bio
#$ -m beas

module load bedtools/2.25.0

PEAKS=/dfs5/bio/clarklh/Foxi2_ChIP/IDR/Pooled_Pseudo/IDR_Foxi2_Pooled_Pseudo_St9/Foxi2_Pooled_Pseudo_St9.IDR0.05.narrowPeak
GENOME=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XenoTropV9_0.gff3

closestBed -d -a $PEAKS -b $GENOME


closestBed -d -a /dfs5/bio/clarklh/Foxi2_ChIP/IDR/Pooled_Pseudo/IDR_Foxi2_Pooled_Pseudo_St9/Foxi2_Pooled_Pseudo_St9.IDR0.05.narrowPeak -b /dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XenoTropV9_0.sorted.bed > /dfs5/bio/clarklh/Foxi2_ChIP/IDR/Pooled_Pseudo/IDR_Foxi2_Pooled_Pseudo_St9/Foxi2_Pooled_Pseudo_St9.IDR0.05_closestGenes.bed

