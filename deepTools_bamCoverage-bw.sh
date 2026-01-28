#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J DeepTools
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#DeepTools-bamCoverage is housed within anaconda, and is therefore loaded alongside anaconda.
#-b = your input bam file to convert into a bw (BigWig) file.
#-o = your output bw (BigWig) file containing coverage information. 

module load anaconda
module load deeptools

BAM_READS=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bam
OUTPUT=/dfs10/bio/clarklh/EP300_ChIP/FS_MO/Aligned/P300_FSmo_St105_AC_Pooled_rmdup_sorted.bw
SCALE_FACTOR=0.81

bamCoverage -b $BAM_READS  -o $OUTPUT  --binSize 20 --effectiveGenomeSize 1100000000 --normalizeUsing RPKM --scaleFactor $SCALE_FACTOR
