#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT="$REPO_ROOT/validation/bash_syntax_validation.tsv"

printf 'script\tstatus\n' > "$REPORT"
failures=0

while IFS= read -r script; do
  rel="${script#"$REPO_ROOT"/}"
  if bash -n "$script"; then
    printf '%s\tPASS\n' "$rel" >> "$REPORT"
  else
    printf '%s\tFAIL\n' "$rel" >> "$REPORT"
    failures=$((failures + 1))
  fi
done < <(find "$REPO_ROOT/scripts" -type f -name '*.sh' | sort)

echo "Validation report: $REPORT"
echo "Failures: $failures"
exit "$failures"
