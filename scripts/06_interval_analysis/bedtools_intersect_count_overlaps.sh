#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=intersect_counts
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

QUERY_BAM="/path/to/query.sorted.bam"
TARGET_BED="/path/to/regions.bed"
OUTPUT="/path/to/overlap_counts.bed"

require_file "$QUERY_BAM"
require_file "$TARGET_BED"
ensure_parent_dir "$OUTPUT"

bedtools intersect -C   -abam "$QUERY_BAM"   -b "$TARGET_BED"   -bed > "$OUTPUT"
