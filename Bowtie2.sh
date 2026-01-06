#!/bin/bash
#SBATCH -A 
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


module load bowtie2

INDEX=
SINGLE_END_READS=
SAM_ALIGNMENT_OUTPUT=

bowtie2 -x $INDEX $SINGLE_END_READS -S $SAM_ALIGNMENT_OUTPUT

