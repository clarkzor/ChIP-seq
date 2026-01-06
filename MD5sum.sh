#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

FILEPATH=/dfs7/mbt/nymar/alignment_v10/ezh2_chip/st9/macs2_p0.001/idr_0.02/ezh2_st9_foxh1mut_pseudo.IDR0.02.narrowPeak
OUTPUT=/dfs10/bio/clarklh/H3K27me3_ChIP/Ezh2_Paper-Checksums/Ezh2_St9_Foxh1mut_Peaks-md5.sh

md5sum $FILEPATH > $OUTPUT
