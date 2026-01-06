#!/bin/bash
#SBATCH --job-name=Shplittuh_Foxi2_St105_Pooled
#SBATCH -A clarklh
#SBATCH -p standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10 


SAMPLE=/dfs7/mbt/aminaoh/my_data/ChIP-seq/2022-04-10-ep300-stage-10-5/Animal_Input/AC_input_RMDUP.bed

cat $SAMPLE |shuf|split -d -l 10000000 > 01
