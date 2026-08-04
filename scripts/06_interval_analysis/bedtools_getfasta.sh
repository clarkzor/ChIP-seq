#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=getfasta
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load bedtools2

REFERENCE_FASTA="${XTROP_FASTA:-/path/to/reference.fa}"
BED_REGIONS="/path/to/regions.bed"
OUTPUT_FASTA="/path/to/regions.fa"

require_file "$REFERENCE_FASTA"
require_file "$BED_REGIONS"
ensure_parent_dir "$OUTPUT_FASTA"

bedtools getfasta   -nameOnly   -fi "$REFERENCE_FASTA"   -bed "$BED_REGIONS"   -fo "$OUTPUT_FASTA"
