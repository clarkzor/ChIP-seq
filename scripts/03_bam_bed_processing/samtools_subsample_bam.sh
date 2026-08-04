#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=subsample_bam
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

module load samtools

INPUT_BAM="/path/to/input.bam"
OUTPUT_BAM="/path/to/input.subsampled.bam"
SUBSAMPLE_ARGUMENT="0.9562"  # historical samtools -s SEED.FRACTION syntax; confirm for installed version

require_file "$INPUT_BAM"
ensure_parent_dir "$OUTPUT_BAM"

samtools view   -@ "${SLURM_CPUS_PER_TASK:-4}"   -s "$SUBSAMPLE_ARGUMENT"   -b "$INPUT_BAM"   -o "$OUTPUT_BAM"
