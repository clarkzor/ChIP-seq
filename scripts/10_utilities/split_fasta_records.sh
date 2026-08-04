#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=split_fasta
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

INPUT_FASTA="/path/to/input.fa"
OUTPUT_PREFIX="/path/to/chunks/chunk"
RECORDS_PER_FILE=1000

require_file "$INPUT_FASTA"
mkdir -p "$(dirname "$OUTPUT_PREFIX")"

# Splits by FASTA records (not base pairs). Each output contains up to
# RECORDS_PER_FILE sequence records.
awk -v prefix="$OUTPUT_PREFIX" -v n="$RECORDS_PER_FILE" '
  /^>/ {
    record++
    if ((record - 1) % n == 0) {
      file=sprintf("%s_%04d.fa", prefix, int((record - 1) / n) + 1)
    }
  }
  { print >> file }
' "$INPUT_FASTA"
