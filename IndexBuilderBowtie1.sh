#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J Index_Bowtie_XTropV10
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#Build a bowtie2 index for your reference genome .fasta file
#Can skip this step if you have already made a bowtie2 index for your genome before
#first file is your genome.fasta
#second file is directory with index files

module load bowtie

BOWTIE_INDEX=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/Alignment_Indexes/XT-V9_0_Update/
REFERENCE_GENOME=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV9_0.fasta

bowtie-build $REFERENCE_GENOME $BOWTIE_INDEX

