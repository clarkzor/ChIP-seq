#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bamcoverage
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=08:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load deeptools

INPUT_BAM="/path/to/input.sorted.bam"
OUTPUT_BIGWIG="/path/to/output.bw"
BIN_SIZE=20
EFFECTIVE_SIZE="${EFFECTIVE_GENOME_SIZE:-1100000000}"
NORMALIZATION="RPKM"
SCALE_FACTOR=1.0

require_file "$INPUT_BAM"
ensure_parent_dir "$OUTPUT_BIGWIG"

bamCoverage   -b "$INPUT_BAM"   -o "$OUTPUT_BIGWIG"   --numberOfProcessors "${SLURM_CPUS_PER_TASK:-8}"   --binSize "$BIN_SIZE"   --effectiveGenomeSize "$EFFECTIVE_SIZE"   --normalizeUsing "$NORMALIZATION"   --scaleFactor "$SCALE_FACTOR"
