#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=homer_tagdir
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=06:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

module load miniconda3
conda activate HOMER

ALIGNMENT_BED="/path/to/alignment.bed"
TAG_DIRECTORY="/path/to/tag_directory"

require_file "$ALIGNMENT_BED"
mkdir -p "$TAG_DIRECTORY"

makeTagDirectory "$TAG_DIRECTORY" -format bed -forceBED "$ALIGNMENT_BED"
