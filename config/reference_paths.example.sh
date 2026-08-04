#!/bin/bash
# Copy this file to config/reference_paths.sh and edit the paths for your system.
# config/reference_paths.sh is ignored by Git so local HPC paths are not committed.

# Xenopus tropicalis reference resources
XTROP_FASTA="/path/to/Xenopus_tropicalis.fa"
XTROP_FASTA_FAI="/path/to/Xenopus_tropicalis.fa.fai"
XTROP_GENOME_FILE="/path/to/Xenopus_tropicalis.genome"
XTROP_GTF="/path/to/Xenopus_tropicalis.gtf"
XTROP_GFF3="/path/to/Xenopus_tropicalis.gff3"

# Alignment indexes
BOWTIE1_INDEX_PREFIX="/path/to/bowtie1/index_prefix"
BOWTIE2_INDEX_PREFIX="/path/to/bowtie2/index_prefix"

# Effective genome size used for coverage normalization.
# Confirm this value for the exact reference build used in the analysis.
EFFECTIVE_GENOME_SIZE=1100000000

# Optional legacy ROSE installation directory
ROSE_DIR="/path/to/ROSE"
