#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=homer_annotate
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

PEAKS="/path/to/peaks.bed"
GENOME_FASTA="${XTROP_FASTA:-/path/to/reference.fa}"
ANNOTATION_GTF="${XTROP_GTF:-/path/to/genes.gtf}"
OUTPUT="/path/to/annotated_peaks.txt"

require_file "$PEAKS"
require_file "$GENOME_FASTA"
require_file "$ANNOTATION_GTF"
ensure_parent_dir "$OUTPUT"

annotatePeaks.pl "$PEAKS" "$GENOME_FASTA" -gtf "$ANNOTATION_GTF" > "$OUTPUT"
