#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=md5sum
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

INPUT_FILE="/path/to/file"
OUTPUT_MD5="/path/to/file.md5"

require_file "$INPUT_FILE"
ensure_parent_dir "$OUTPUT_MD5"

md5sum "$INPUT_FILE" > "$OUTPUT_MD5"
