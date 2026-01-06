#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=2 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


#Bowtie Command Notes
#-m denotes the amount of duplicate alignments allowed for a particular read. -m 1 should limit the amount of alignments per read to the single best alignment.
#-p denotes the amount of in-parallel alignment computations you will endeavor by submitting the script->job.

module load bowtie/1.2.3

INDEX=/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/Alignment_Indexes/XT-V10/
FORWARD=
REVERSE=/dfs5/bio/clarklh/ATAC/St105/R2/Raw/ATAC_St105_R2_read2.fastq
OUTPUT=/dfs5/bio/clarklh/ATAC/St105/R1/V10/ATAC_St105_R2.sam

bowtie $INDEX -1 $FORWARD -2 $REVERSE -M 1 -p 15 --sam > $OUTPUT

