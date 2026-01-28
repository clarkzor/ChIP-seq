#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J SlopTool_50bp_Foxi2_h1_p300_persis
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=3 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

module load bedtools2

SUMMITS=/dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/Animal_ChIP/macs2_analysis/ep300_AC_stage10_5_pooled_r1vsr2.IDR0.05.sorted_summits.narrowPeak
GENOME=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV10.genome
OUTPUT=/dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/Animal_ChIP/macs2_analysis/ep300_AC_stage10_5_pooled_r1vsr2.IDR0.05.sorted_summits_slop250.narrowPeak
COORDINATE_WIDTH_TO_EXTEND_FROM_SUMMIT=250

bedtools slop -i $SUMMITS -g $GENOME -b $COORDINATE_WIDTH_TO_EXTEND_FROM_SUMMIT > $OUTPUT
