#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=scale_bigwig
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=06:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load deeptools

INPUT_BIGWIG="/path/to/input.bw"
OUTPUT_BIGWIG="/path/to/input.scaled.bw"
SCALE_FACTOR=0.79

require_file "$INPUT_BIGWIG"
ensure_parent_dir "$OUTPUT_BIGWIG"

# bigwigCompare can scale one track by comparing it with itself and retaining b1.
bigwigCompare   -b1 "$INPUT_BIGWIG"   -b2 "$INPUT_BIGWIG"   --scaleFactors "${SCALE_FACTOR}:1"   --operation first   --outFileFormat bigwig   -o "$OUTPUT_BIGWIG"
