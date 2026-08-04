#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=sra_fastq
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=12:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load sra-tools

SRA_ACCESSION="SRR00000000"
OUTPUT_DIR="/path/to/output"

mkdir -p "$OUTPUT_DIR"
cd "$OUTPUT_DIR"

fastq-dump --split-files "$SRA_ACCESSION"
