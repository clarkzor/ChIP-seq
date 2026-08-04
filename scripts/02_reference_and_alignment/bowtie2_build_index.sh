#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=bowtie2_index
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

module load bowtie2

REFERENCE_FASTA="${XTROP_FASTA:-/path/to/reference.fa}"
INDEX_PREFIX="${BOWTIE2_INDEX_PREFIX:-/path/to/index/prefix}"

require_file "$REFERENCE_FASTA"
mkdir -p "$(dirname "$INDEX_PREFIX")"

# bowtie2-build syntax: reference_in basename
bowtie2-build --threads "${SLURM_CPUS_PER_TASK:-8}" "$REFERENCE_FASTA" "$INDEX_PREFIX"
