#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH -J IDR
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load anaconda
module load miniconda3
module load bioconda

conda activate IDR_3
conda init bash

IDR_THRESH=0.05
REP1_PEAK_FILE=/dfs10/bio/clarklh/New_ChIP/MACS2/Grhl1_ChIP_R1_peaks.narrowPeak
REP2_PEAK_FILE=/dfs10/bio/clarklh/New_ChIP/MACS2/Grhl1_ChIP_R2_peaks.narrowPeak
POOLED_PEAK_FILE=/dfs10/bio/clarklh/New_ChIP/MACS2/Grhl1_ChIP_Pooled_peaks.narrowPeak
IDR_OUTPUT=/dfs10/bio/clarklh/New_ChIP/IDR/Grhl1_Pooled
REP1_VS_REP2=/dfs10/bio/clarklh/New_ChIP/IDR/Grhl1_Pooled_R1_vs_R2

# ============================================================================#
# Perform IDR analysis.                                                       #
# Generate a plot and IDR output with additional columns including IDR scores.#
# ============================================================================#

idr --samples ${REP1_PEAK_FILE} ${REP2_PEAK_FILE} --peak-list ${POOLED_PEAK_FILE} --input-file-type narrowPeak --output-file ${IDR_OUTPUT} --rank signal.value --soft-idr-threshold ${IDR_THRESH} --plot



# =====================================#
# Get peaks passing IDR threshold of 5%#
# =====================================#

IDR_THRESH_TRANSFORMED=$(awk -v p=${IDR_THRESH} 'BEGIN{print -log(p)/log(10)}')

awk 'BEGIN{OFS="\t"} $12>='"${IDR_THRESH_TRANSFORMED}"' {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' ${IDR_OUTPUT} | sort | uniq | sort -k7n,7n | gzip -nc > ${REP1_VS_REP2}.IDR0.05.narrowPeak.gz

NPEAKS_IDR=$(zcat ${REP1_VS_REP2}.IDR0.05.narrowPeak.gz | wc -l)
