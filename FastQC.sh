#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J FastQC
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load fastqc

input=/dfs10/bio/clarklh/Ezh2_Rebuttal/St9_ezh2_wt.sorted.fastq
output=/dfs10/bio/clarklh/Ezh2_Rebuttal/FastQC/

fastqc $input -o $output 

