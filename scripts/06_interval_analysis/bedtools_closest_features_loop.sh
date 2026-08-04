#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=closest_features
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=06:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bedtools2

INPUT_DIR="/path/to/peak_files"
GLOB_PATTERN="*.sorted.narrowPeak"
ANNOTATION="${XTROP_GFF3:-/path/to/genes.sorted.gff3}"
OUTPUT_DIR="/path/to/closest_features"
K_NEAREST=5

require_dir "$INPUT_DIR"
require_file "$ANNOTATION"
mkdir -p "$OUTPUT_DIR"

shopt -s nullglob
for peaks in "$INPUT_DIR"/$GLOB_PATTERN; do
  base="$(basename "$peaks")"
  output="$OUTPUT_DIR/${base}.closest.txt"
  bedtools closest -d -k "$K_NEAREST" -a "$peaks" -b "$ANNOTATION" > "$output"
done
