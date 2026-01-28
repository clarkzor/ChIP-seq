#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=4 ##number of nodes to use
#SBATCH --cpus-per-task=5 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load bowtie2

index=/dfs5/bio/clarklh/FoxH1_MO_WithSneha/XtropV10_Index/XtropV10
genome=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta

bowtie2-build  $index $genome
