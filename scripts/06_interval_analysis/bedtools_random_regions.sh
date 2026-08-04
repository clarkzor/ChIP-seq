#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=random_regions
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

module load bedtools2

GENOME_FILE="${XTROP_GENOME_FILE:-/path/to/reference.genome}"
OUTPUT_BED="/path/to/random_regions.bed"
N_REGIONS=20000
REGION_LENGTH=700

require_file "$GENOME_FILE"
ensure_parent_dir "$OUTPUT_BED"

bedtools random   -n "$N_REGIONS"   -l "$REGION_LENGTH"   -g "$GENOME_FILE" > "$OUTPUT_BED"
