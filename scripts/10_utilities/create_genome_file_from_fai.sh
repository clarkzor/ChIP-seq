#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=make_genome_file
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

FASTA_INDEX="${XTROP_FASTA_FAI:-/path/to/reference.fa.fai}"
OUTPUT_GENOME="${XTROP_GENOME_FILE:-/path/to/reference.genome}"

require_file "$FASTA_INDEX"
ensure_parent_dir "$OUTPUT_GENOME"

# BEDTools genome files contain sequence name and sequence length.
cut -f1,2 "$FASTA_INDEX" > "$OUTPUT_GENOME"
