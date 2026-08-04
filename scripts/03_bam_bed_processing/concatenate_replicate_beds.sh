#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=pool_beds
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

INPUT_DIR="/path/to/replicates"
OUTPUT_BED="/path/to/pooled.bed"
REPLICATES=(1 2 3 4)

mkdir -p "$(dirname "$OUTPUT_BED")"
: > "$OUTPUT_BED"

for rep in "${REPLICATES[@]}"; do
  input="$INPUT_DIR/sample_R${rep}.bed"
  require_file "$input"
  cat "$input" >> "$OUTPUT_BED"
done
