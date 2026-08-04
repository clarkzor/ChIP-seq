#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=intersect_unique
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

QUERY="/path/to/query.bed"
TARGET="/path/to/target.bed"
OUTPUT="/path/to/query_nonoverlapping_target.bed"

require_file "$QUERY"
require_file "$TARGET"
ensure_parent_dir "$OUTPUT"

bedtools intersect -v -a "$QUERY" -b "$TARGET" > "$OUTPUT"
