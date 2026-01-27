#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=3 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

cd /dfs10/bio/clarklh/New_RNA/

gunzip DMSO*
