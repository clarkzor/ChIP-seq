#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=heatmap_kmeans
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=06:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load deeptools

MATRIX="/path/to/matrix.gz"
OUTPUT_PREFIX="/path/to/heatmap"
Y_AXIS_LABEL="Peak regions"
COLOR_LIST="black,yellow"
K_VALUES=(2 3 5 6)

require_file "$MATRIX"
mkdir -p "$(dirname "$OUTPUT_PREFIX")"

plotHeatmap   -m "$MATRIX"   -out "${OUTPUT_PREFIX}_no_kmeans.png"   --refPointLabel Center   --colorList "$COLOR_LIST"   --heatmapHeight 10   --whatToShow "plot and heatmap"   --legendLocation none

for k in "${K_VALUES[@]}"; do
  plotHeatmap     -m "$MATRIX"     -out "${OUTPUT_PREFIX}_kmeans${k}.png"     --kmeans "$k"     --refPointLabel Center     --colorList "$COLOR_LIST"     --heatmapHeight 10     --yAxisLabel "$Y_AXIS_LABEL"     --outFileSortedRegions "${OUTPUT_PREFIX}_kmeans${k}_sorted_regions.bed"
done
