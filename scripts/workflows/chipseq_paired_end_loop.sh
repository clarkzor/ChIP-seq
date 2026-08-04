#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=chipseq_pe_loop
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
RAW_DIR="/path/to/fastq"
OUTPUT_DIR="/path/to/alignment"
SAMPLE_PREFIX="sample"
REPLICATES=(1 2)
EFFECTIVE_SIZE="${EFFECTIVE_GENOME_SIZE:-1100000000}"

mkdir -p "$OUTPUT_DIR"

for rep in "${REPLICATES[@]}"; do
  read1="$RAW_DIR/${SAMPLE_PREFIX}_Rep${rep}_R1.fastq.gz"
  read2="$RAW_DIR/${SAMPLE_PREFIX}_Rep${rep}_R2.fastq.gz"
  prefix="$OUTPUT_DIR/${SAMPLE_PREFIX}_Rep${rep}"

  require_file "$read1"
  require_file "$read2"

  bowtie2 -x "$INDEX_PREFIX" -1 "$read1" -2 "$read2"     -p "${SLURM_CPUS_PER_TASK:-16}"     -S "${prefix}.sam"

  samtools view -@ "${SLURM_CPUS_PER_TASK:-16}" -b     "${prefix}.sam" -o "${prefix}.bam"

  samtools sort -@ "${SLURM_CPUS_PER_TASK:-16}"     -o "${prefix}.sorted.bam" "${prefix}.bam"

  samtools index -@ "${SLURM_CPUS_PER_TASK:-16}" "${prefix}.sorted.bam"

  bamCoverage     -b "${prefix}.sorted.bam"     -o "${prefix}.sorted.bw"     --numberOfProcessors "${SLURM_CPUS_PER_TASK:-16}"     --effectiveGenomeSize "$EFFECTIVE_SIZE"     --binSize 50     --normalizeUsing RPKM

  bedtools bamtobed -i "${prefix}.sorted.bam" > "${prefix}.sorted.bed"
done
