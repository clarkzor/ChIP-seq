#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

conda activate HOMER
conda init bash

TAGDIR=/dfs10/bio/clarklh/New_ChIP/Grhl1_tagDir/

makeUCSCfile $TAGDIR -o auto

