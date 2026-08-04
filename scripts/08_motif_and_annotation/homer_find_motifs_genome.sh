#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=homer_motifs
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

module load miniconda3
conda activate HOMER

PEAKS="/path/to/peaks.narrowPeak"
GENOME_FASTA="${XTROP_FASTA:-/path/to/reference.fa}"
OUTPUT_DIR="/path/to/motif_results"
REGION_SIZE=100

require_file "$PEAKS"
require_file "$GENOME_FASTA"
mkdir -p "$OUTPUT_DIR"

findMotifsGenome.pl "$PEAKS" "$GENOME_FASTA" "$OUTPUT_DIR" -size "$REGION_SIZE"
