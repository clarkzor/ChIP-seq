#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=homer_ucsc
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

module load miniconda3
conda activate HOMER

TAG_DIRECTORY="/path/to/tag_directory"

require_dir "$TAG_DIRECTORY"

makeUCSCfile "$TAG_DIRECTORY" -o auto
