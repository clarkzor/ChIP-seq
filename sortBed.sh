#!/bin/bash
#$ -N z_sortBed_Foxi2_st9_AllPeaks
#$ -q frog,bio
#$ -m beas


module load bedtools2


sortBed -i /dfs5/bio/clarklh/Sox3_ChIP/St10_XtropV9/Intersect/Foxi2Sox3_St8910_Persis.sorted.narrowPeak > /dfs5/bio/clarklh/Sox3_ChIP/St10_XtropV9/Intersect/Foxi2Sox3_St8910_Persis.sorted.narrowPeak
