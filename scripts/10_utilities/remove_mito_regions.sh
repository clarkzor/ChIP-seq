#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=remove_mt
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

INPUT_BED="/path/to/input.bed"
OUTPUT_BED="/path/to/input.no_mt.bed"
MITO_PREFIX="MT"

require_file "$INPUT_BED"
ensure_parent_dir "$OUTPUT_BED"

grep -v "^${MITO_PREFIX}" "$INPUT_BED" > "$OUTPUT_BED"
