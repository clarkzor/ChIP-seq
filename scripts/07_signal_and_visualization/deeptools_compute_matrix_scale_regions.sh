#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=matrix_scaleregions
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

BIGWIGS=(
  "/path/to/sample1.bw"
  "/path/to/sample2.bw"
)
REGIONS="/path/to/regions.bed"
OUTPUT_MATRIX="/path/to/matrix.scale_regions.gz"

for bw in "${BIGWIGS[@]}"; do require_file "$bw"; done
require_file "$REGIONS"
ensure_parent_dir "$OUTPUT_MATRIX"

computeMatrix scale-regions   -S "${BIGWIGS[@]}"   -R "$REGIONS"   -o "$OUTPUT_MATRIX"   --numberOfProcessors "${SLURM_CPUS_PER_TASK:-8}"   --missingDataAsZero   --binSize 20   -b 20000   -a 20000   --regionBodyLength 4000
