#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=filter_closest
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=02:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

INPUT_DIR="/path/to/closest_feature_outputs"
GLOB_PATTERN="*.closest.txt"

require_dir "$INPUT_DIR"

shopt -s nullglob
for input in "$INPUT_DIR"/$GLOB_PATTERN; do
  output="${input%.txt}.genes_only.txt"

  # NOTE: The field number used below is NOT universal.
  # bedtools closest appends columns from the -b annotation file to the -a record,
  # so the location of the feature-type field depends on the exact column count and
  # syntax of BOTH input files (for example BED + GFF3 versus BED + GTF).
  # Inspect a few rows of your closestBed output before running this filter and
  # change $13 / NF as needed for that specific analysis.
  # The condition below is retained only as the historical Xenopus example.
  awk -F'	' 'NF >= 13 && $13 == "gene"' "$input" > "$output"
done
