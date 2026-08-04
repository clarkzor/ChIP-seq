#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=rose_legacy
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

# LEGACY TEMPLATE:
# The historical workflow used ROSE with Python 2.7. Confirm the maintained
# installation/environment before using this script in a new analysis.
module load python/2.7.17
module load R
module load samtools

ROSE_DIRECTORY="${ROSE_DIR:-/path/to/ROSE}"
GENOME_BUILD="XTROP"
CONSTITUENT_REGIONS="/path/to/constituent_regions.bed"
RANKING_BAM="/path/to/ranking.sorted.bam"
OUTPUT_DIR="/path/to/rose_output"

require_dir "$ROSE_DIRECTORY"
require_file "$CONSTITUENT_REGIONS"
require_file "$RANKING_BAM"
mkdir -p "$OUTPUT_DIR"

cd "$ROSE_DIRECTORY"
python ROSE_main.py   -g "$GENOME_BUILD"   -i "$CONSTITUENT_REGIONS"   -r "$RANKING_BAM"   -o "$OUTPUT_DIR"
