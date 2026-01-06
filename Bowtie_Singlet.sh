#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=2 ##number of nodes to use
#SBATCH --cpus-per-task=25 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


#Bowtie Command Notes
#-m denotes the amount of duplicate alignments allowed for a particular read. -m 1 should limit the amount of alignments per read to the single best alignment.
#-p denotes the amount of in-parallel alignment computations you will endeavor by submitting the script->job.

module load bowtie/1.2.3

INDEX=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/Alignment_Indexes/XT-V9_0_Update/
FORWARD=/dfs5/bio/clarklh/H3K27me3_ChIP/St10.5/H3K27me3.fastq
OUTPUT=/dfs5/bio/clarklh/H3K27me3_ChIP/St10.5//H3K27me3.sam

bowtie $INDEX -q $FORWARD -M 1 -p 8 --best --strata --sam > --al $OUTPUT

