#!/bin/bash
#$ -N z_HomerTagDir_Smad23_R2
#$ -q frog,bio
#$ -m beas

module load anaconda
module load homer/4.10

TAGDIR=/dfs3/bio/clarklh/ChIP/Processed_Reads/HomerTagDir/Smad23_R2

makeUCSCfile $TAGDIR -o auto

