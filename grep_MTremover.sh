#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J grep_removed
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

INPUT=/dfs7/mbt/share-folder/AminaH3K27ac_ClarkFoxSox_EpigeneticAnalysis/AC/MACS2/h3k27ac-st10.5-animal-chip-aligned-xtrop-v10-rmv-sorted_35scaled_peaks.bed
GREP_REMOVED_OUTPUT=/dfs7/mbt/share-folder/AminaH3K27ac_ClarkFoxSox_EpigeneticAnalysis/AC/MACS2/h3k27ac-st10.5-animal-chip-aligned-xtrop-v10-rmv-sorted_35scaled_peaks_rmMT.bed

grep -v "^MT" $INPUT > $GREP_REMOVED_OUTPUT\
