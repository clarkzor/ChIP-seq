#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bowtie1_pe
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

module load bowtie/1.2.3

INDEX_PREFIX="${BOWTIE1_INDEX_PREFIX:-/path/to/index/prefix}"
READ1="/path/to/sample_R1.fastq.gz"
READ2="/path/to/sample_R2.fastq.gz"
OUTPUT_SAM="/path/to/sample.sam"

require_file "$READ1"
require_file "$READ2"
ensure_parent_dir "$OUTPUT_SAM"

bowtie "$INDEX_PREFIX"   -1 "$READ1"   -2 "$READ2"   -M 1   -p "${SLURM_CPUS_PER_TASK:-12}"   --sam   "$OUTPUT_SAM"
