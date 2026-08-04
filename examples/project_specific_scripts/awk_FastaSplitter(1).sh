#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=2 ##number of nodes to use
#SBATCH --cpus-per-task=15 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file

#Below, awk splits a fasta into 15,000,000 basepair chunks

awk 'BEGIN {n=0;} /^>/ {if(n%15000000==0){file=sprintf("chunk%d.fa",n);} print >> file; n++; next;} { print >> file; }' < multi.fa

