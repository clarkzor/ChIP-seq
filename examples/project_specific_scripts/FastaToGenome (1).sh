#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J DeepTools
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=10 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


# Input FASTA file
fasta_file="/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta.fai"

# Output BED file
bed_file="/dfs5/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0.genome.bed"

# Process the FASTA file
while read -r header; do
    read -r sequence

    # Remove leading ">" character from the header
    scaffold_name="${header#>}"
    scaffold_length=${#sequence}

    # Write the BED entry to the output file
    echo -e "$scaffold_name\t0\t$scaffold_length" >> "$bed_file"
done < "$fasta_file"

