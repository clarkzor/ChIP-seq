#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=homer_motif_sites
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

module load miniconda3
conda activate HOMER

PEAKS="/path/to/peaks.narrowPeak"
GENOME_FASTA="${XTROP_FASTA:-/path/to/reference.fa}"
MOTIF="/path/to/known.motif"
OUTPUT_HISTOGRAM="/path/to/motif_histogram.txt"
OUTPUT_MOTIF_BED="/path/to/motif_occurrences.bed"

require_file "$PEAKS"
require_file "$GENOME_FASTA"
require_file "$MOTIF"
ensure_parent_dir "$OUTPUT_HISTOGRAM"
ensure_parent_dir "$OUTPUT_MOTIF_BED"

annotatePeaks.pl   "$PEAKS" "$GENOME_FASTA"   -size 2000   -hist 20   -ghist   -m "$MOTIF"   -mbed "$OUTPUT_MOTIF_BED" > "$OUTPUT_HISTOGRAM"
