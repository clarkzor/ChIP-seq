#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=plot_profile
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
OUTPUT="/path/to/profile.png"
WIDTH=7
HEIGHT=6
SIGNAL_MIN=0
SIGNAL_MAX=200
COLORS=("#f97a35" "#765b73")

require_file "$MATRIX"
ensure_parent_dir "$OUTPUT"

plotProfile   --matrixFile "$MATRIX"   --outFileName "$OUTPUT"   --perGroup   --colors "${COLORS[@]}"   --plotType fill   --legendLocation upper-right   --yMax "$SIGNAL_MAX"   --yMin "$SIGNAL_MIN"   --plotHeight "$HEIGHT"   --plotWidth "$WIDTH"
