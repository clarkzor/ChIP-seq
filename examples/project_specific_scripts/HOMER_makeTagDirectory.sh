#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J HomerTagDir
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load anaconda
module load bioconda
module load miniconda3

conda activate HOMER
conda init bash

ALIGNMENT=/dfs10/bio/clarklh/New_ChIP/Foxi1_ChIP_Pooled_rmdup.sorted.bed
TAGDIR=/dfs10/bio/clarklh/New_ChIP/Foxi1_tagDir/

makeTagDirectory $TAGDIR -format bed -forceBED $ALIGNMENT
