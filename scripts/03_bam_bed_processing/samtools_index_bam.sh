#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=index_bam
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load samtools

INPUT_BAM="/path/to/input.sorted.bam"
OUTPUT_BAI="${INPUT_BAM}.bai"

require_file "$INPUT_BAM"
ensure_parent_dir "$OUTPUT_BAI"

samtools index -@ "${SLURM_CPUS_PER_TASK:-4}" "$INPUT_BAM" "$OUTPUT_BAI"
