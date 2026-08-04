#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=sort_bed_loop
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bedtools2

INPUT_DIR="/path/to/bed/files"
GLOB_PATTERN="*.narrowPeak"
OUTPUT_DIR="/path/to/sorted"

require_dir "$INPUT_DIR"
mkdir -p "$OUTPUT_DIR"

shopt -s nullglob
for input in "$INPUT_DIR"/$GLOB_PATTERN; do
  base="$(basename "$input")"
  output="$OUTPUT_DIR/${base%.*}.sorted.${base##*.}"
  sortBed -i "$input" > "$output"
done
