#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=chipseq_pe
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --time=12:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bowtie2
module load samtools
module load bedtools2
module load deeptools

INDEX_PREFIX="${BOWTIE2_INDEX_PREFIX:-/path/to/index/prefix}"
READ1="/path/to/sample_R1.fastq.gz"
READ2="/path/to/sample_R2.fastq.gz"
OUTPUT_PREFIX="/path/to/results/sample"
EFFECTIVE_SIZE="${EFFECTIVE_GENOME_SIZE:-1100000000}"

require_file "$READ1"
require_file "$READ2"
mkdir -p "$(dirname "$OUTPUT_PREFIX")"

bowtie2 -x "$INDEX_PREFIX" -1 "$READ1" -2 "$READ2"   -p "${SLURM_CPUS_PER_TASK:-16}"   -S "${OUTPUT_PREFIX}.sam"

samtools view -@ "${SLURM_CPUS_PER_TASK:-16}" -b   "${OUTPUT_PREFIX}.sam" -o "${OUTPUT_PREFIX}.bam"

samtools sort -@ "${SLURM_CPUS_PER_TASK:-16}"   -o "${OUTPUT_PREFIX}.sorted.bam" "${OUTPUT_PREFIX}.bam"

samtools index -@ "${SLURM_CPUS_PER_TASK:-16}" "${OUTPUT_PREFIX}.sorted.bam"

bamCoverage   -b "${OUTPUT_PREFIX}.sorted.bam"   -o "${OUTPUT_PREFIX}.sorted.bw"   --numberOfProcessors "${SLURM_CPUS_PER_TASK:-16}"   --effectiveGenomeSize "$EFFECTIVE_SIZE"   --binSize 50   --normalizeUsing RPKM

bedtools bamtobed -i "${OUTPUT_PREFIX}.sorted.bam" > "${OUTPUT_PREFIX}.sorted.bed"
