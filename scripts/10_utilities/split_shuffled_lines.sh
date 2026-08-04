#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=shuffle_split
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=08:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

INPUT_FILE="/path/to/input.bed"
OUTPUT_PREFIX="/path/to/chunks/chunk_"
LINES_PER_CHUNK=10000000

require_file "$INPUT_FILE"
mkdir -p "$(dirname "$OUTPUT_PREFIX")"

shuf "$INPUT_FILE" |   split -d -l "$LINES_PER_CHUNK" --additional-suffix=.bed - "$OUTPUT_PREFIX"
