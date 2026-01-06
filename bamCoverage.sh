#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J BedTools_GenomeCov-d_Foxi2_St8
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#DeepTools/bamCoverage Command Notes
#bamCoverage is capable of transforming .bam read alignment files with coverage information into .bw (bigwig) files which are more computationally efficient for visualization within IGV
#INPUT = .bam input file resulting from an alignment
#OUTPUT = .bw output file which you will use for downsteam IGV visualization
#utilize module load anacondo(Newest version) to be able to gain DeepTools access

module load bedtools2
module load anaconda

INPUT=/dfs5/bio/clarklh/Sox3_ChIP/St10_XtropV9/Sox3_St10_Pooled.sorted.bam

bedtools genomecov -ibam $INPUT -g /dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XtropV9_0.genome -bg 
