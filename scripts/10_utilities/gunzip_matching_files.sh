#!/bin/bash
#SBATCH --account=kwcho_lab
#SBATCH --job-name=gunzip_files
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=04:00:00
#SBATCH --error=slurm-%x-%j.err

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
# shellcheck source=../lib/common.sh
source "$REPO_ROOT/scripts/lib/common.sh"
load_reference_config "$REPO_ROOT"

INPUT_DIR="/path/to/files"
GLOB_PATTERN="*.gz"

require_dir "$INPUT_DIR"

shopt -s nullglob
files=("$INPUT_DIR"/$GLOB_PATTERN)
(( ${#files[@]} > 0 )) || fail "No files matched: $INPUT_DIR/$GLOB_PATTERN"

gunzip "${files[@]}"
