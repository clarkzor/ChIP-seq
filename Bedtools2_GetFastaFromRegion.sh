#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J GetFasta_Newer
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load bedtools2

REF_FASTA=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta
BED_REGIONS=/dfs10/bio/clarklh/ATAC/St12/MACS2/ATAC_St12_closestBed_50kb_genes_ForFasta.bed
OUTPUT=/dfs10/bio/clarklh/ATAC/St12/MACS2/ATAC_St12_closestBed_50kb_genes_ForFasta.fasta

bedtools getfasta -nameOnly -fi $REF_FASTA -bed $BED_REGIONS -fo $OUTPUT
