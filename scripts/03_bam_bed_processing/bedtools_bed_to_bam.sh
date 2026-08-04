#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bed_to_bam
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

INPUT_BED="/path/to/input.bed"
GENOME_FILE="${XTROP_GENOME_FILE:-/path/to/reference.genome}"
OUTPUT_BAM="/path/to/output.bam"

require_file "$INPUT_BED"
require_file "$GENOME_FILE"
ensure_parent_dir "$OUTPUT_BAM"

bedtools bedtobam -i "$INPUT_BED" -g "$GENOME_FILE" > "$OUTPUT_BAM"
