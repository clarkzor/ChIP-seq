#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=fastqc
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load fastqc

INPUT_FASTQ="/path/to/sample.fastq.gz"
OUTPUT_DIR="/path/to/fastqc"

require_file "$INPUT_FASTQ"
mkdir -p "$OUTPUT_DIR"

fastqc --threads "${SLURM_CPUS_PER_TASK:-8}" "$INPUT_FASTQ" --outdir "$OUTPUT_DIR"
