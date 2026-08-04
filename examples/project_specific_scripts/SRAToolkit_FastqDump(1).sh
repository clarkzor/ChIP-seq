#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J SRA_FastqDump_H3K27Ac_St8
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=20 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load sra-tools

cd /dfs10/bio/clarklh/ATAC/Ira_data/

fastq-dump --split-files SRR24482416


