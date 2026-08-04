#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bowtie1_se
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=12:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bowtie/1.2.3

INDEX_PREFIX="${BOWTIE1_INDEX_PREFIX:-/path/to/index/prefix}"
READS="/path/to/sample.fastq.gz"
OUTPUT_SAM="/path/to/sample.sam"

require_file "$READS"
ensure_parent_dir "$OUTPUT_SAM"

bowtie "$INDEX_PREFIX"   -q "$READS"   -M 1   -p "${SLURM_CPUS_PER_TASK:-8}"   --best   --strata   --sam   "$OUTPUT_SAM"
