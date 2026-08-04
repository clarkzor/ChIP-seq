#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bowtie2_se
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --time=12:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bowtie2

INDEX_PREFIX="${BOWTIE2_INDEX_PREFIX:-/path/to/index/prefix}"
READS="/path/to/sample.fastq.gz"
OUTPUT_SAM="/path/to/sample.sam"

require_file "$READS"
ensure_parent_dir "$OUTPUT_SAM"

bowtie2   -x "$INDEX_PREFIX"   -U "$READS"   -p "${SLURM_CPUS_PER_TASK:-12}"   -S "$OUTPUT_SAM"
