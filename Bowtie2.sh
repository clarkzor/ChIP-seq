#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=2 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


module load bowtie2

INDEX=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/Alignment_Indexes/XT-V10_0_Bowtie2_New/XT-V10_0
SINGLE_END_READS=/dfs7/mbt/choj1/raw-sequence/ChIP-seq/H3K27me3/H3K27me3_st10p5_WT_AC_nR038-L1-G2-P17-CGATGT.txt
SAM_ALIGNMENT_OUTPUT=

bowtie2 -x $INDEX $SINGLE_END_READS -S $SAM_ALIGNMENT_OUTPUT

