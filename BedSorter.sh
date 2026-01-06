#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J sortBed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00
module load bedtools2



sortBed -i /dfs10/bio/clarklh/New_ChIP/IDR/Intersect/Grhl1_vs_Foxi2_vsSox3_vsEp300AC-Amina_St105.narrowPeak > /dfs10/bio/clarklh/New_ChIP/IDR/Grhl1_vs_Foxi2_vsSox3_vsEp300AC-Amina_St105.sorted.bed
