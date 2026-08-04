#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bam_to_bed
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

INPUT_BAM="/path/to/input.bam"
OUTPUT_BED="/path/to/output.bed"

require_file "$INPUT_BAM"
ensure_parent_dir "$OUTPUT_BED"

bedtools bamtobed -i "$INPUT_BAM" > "$OUTPUT_BED"
