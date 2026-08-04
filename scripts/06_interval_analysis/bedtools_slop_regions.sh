#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=slop_regions
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

INPUT_REGIONS="/path/to/summits.bed"
GENOME_FILE="${XTROP_GENOME_FILE:-/path/to/reference.genome}"
OUTPUT="/path/to/summits_extended.bed"
EXTEND_BP=250

require_file "$INPUT_REGIONS"
require_file "$GENOME_FILE"
ensure_parent_dir "$OUTPUT"

bedtools slop   -i "$INPUT_REGIONS"   -g "$GENOME_FILE"   -b "$EXTEND_BP" > "$OUTPUT"
