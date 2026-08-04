#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=merge_bams
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=08:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load samtools

BAM1="/path/to/rep1.sorted.bam"
BAM2="/path/to/rep2.sorted.bam"
OUTPUT_BAM="/path/to/pooled.sorted.bam"

require_file "$BAM1"
require_file "$BAM2"
ensure_parent_dir "$OUTPUT_BAM"

samtools merge   -@ "${SLURM_CPUS_PER_TASK:-8}"   -o "$OUTPUT_BAM"   "$BAM1" "$BAM2"
