#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=idr
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
conda activate IDR

IDR_THRESHOLD=0.05
REP1_PEAKS="/path/to/rep1_peaks.narrowPeak"
REP2_PEAKS="/path/to/rep2_peaks.narrowPeak"
POOLED_PEAKS="/path/to/pooled_peaks.narrowPeak"
IDR_FULL_OUTPUT="/path/to/results/sample.idr.txt"
PASSING_PREFIX="/path/to/results/sample_rep1_vs_rep2"

require_file "$REP1_PEAKS"
require_file "$REP2_PEAKS"
require_file "$POOLED_PEAKS"
ensure_parent_dir "$IDR_FULL_OUTPUT"

idr   --samples "$REP1_PEAKS" "$REP2_PEAKS"   --peak-list "$POOLED_PEAKS"   --input-file-type narrowPeak   --output-file "$IDR_FULL_OUTPUT"   --rank signal.value   --soft-idr-threshold "$IDR_THRESHOLD"   --plot

IDR_TRANSFORMED="$(awk -v p="$IDR_THRESHOLD" 'BEGIN{print -log(p)/log(10)}')"
PASSING="${PASSING_PREFIX}.IDR${IDR_THRESHOLD}.narrowPeak.gz"

awk 'BEGIN{OFS="	"} $12>='"$IDR_TRANSFORMED"' {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}'   "$IDR_FULL_OUTPUT"   | sort -u   | gzip -nc > "$PASSING"

echo "Passing peaks: $(zcat "$PASSING" | wc -l)"
