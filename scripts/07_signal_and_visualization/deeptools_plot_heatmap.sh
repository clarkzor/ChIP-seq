#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=plot_heatmap
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

module load deeptools

MATRIX="/path/to/matrix.gz"
OUTPUT="/path/to/heatmap.png"
HEATMAP_HEIGHT=5
ZMAX=150
COLOR_LISTS=("white,#083977" "white,#a10f15")

require_file "$MATRIX"
ensure_parent_dir "$OUTPUT"

plotHeatmap   --matrixFile "$MATRIX"   --outFileName "$OUTPUT"   --colorList "${COLOR_LISTS[@]}"   --heatmapHeight "$HEATMAP_HEIGHT"   --zMax "$ZMAX"   --whatToShow "heatmap and colorbar"
