#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=macs2_broad
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=08:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load macs

CHIP="/path/to/chip.bed"
CONTROL="/path/to/input_control.bed"
OUTPUT_PREFIX="/path/to/results/sample"
GENOME_SIZE="1.1e9"
QVALUE="0.05"

require_file "$CHIP"
require_file "$CONTROL"
mkdir -p "$(dirname "$OUTPUT_PREFIX")"

macs2 callpeak   -t "$CHIP"   -c "$CONTROL"   -n "$OUTPUT_PREFIX"   -f BED   -g "$GENOME_SIZE"   -q "$QVALUE"   --broad   --nomodel
