#!/bin/bash
set -euo pipefail

INPUT_FILE="${1:-}"
[[ -n "$INPUT_FILE" ]] || { echo "Usage: $0 FILE" >&2; exit 1; }
[[ -f "$INPUT_FILE" ]] || { echo "File not found: $INPUT_FILE" >&2; exit 1; }

less -N "$INPUT_FILE"
