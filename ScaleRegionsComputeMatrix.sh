#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J ScaledRegionsComputeMatrix
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

module load deeptools
module load anaconda

BIGWIG_COV=
BED_ALIGNMENT=/dfs5/bio/clarklh/AC_VG_Epi/closestBed/AC-VG_GeneFiltered/H3K27ac-VG_Top250VG-ZygoticGeneCoords_RmDup.bed
OUTPUT=/dfs5/bio/clarklh/AC_VG_Epi/closestBed/AC-VG_GeneFiltered/H3K27ac-VG_VG-Top250GeneCoords_P300AC-VG_Scores_ScaleRegions.sh

computeMatrix scale-regions -S /dfs5/bio/clarklh/EP300_ChIP/St105/AminaData/P300_AC_St105_R1_rmdup_sort_81scaled-RPKM.bw /dfs5/bio/clarklh/EP300_ChIP/St105/AminaData/P300_VG_St105_R1_rmdup_sort_81scaled-RPKM.bw -R $BED_ALIGNMENT -o $OUTPUT --binSize 50 -b 25000 -a 25000 --regionBodyLength 10000

