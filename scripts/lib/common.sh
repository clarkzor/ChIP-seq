#!/bin/bash
fail() {
  echo "ERROR: $*" >&2
  exit 1
}

require_file() {
  local path="$1"
  [[ -f "$path" ]] || fail "Required file not found: $path"
}

require_dir() {
  local path="$1"
  [[ -d "$path" ]] || fail "Required directory not found: $path"
}

ensure_parent_dir() {
  local path="$1"
  mkdir -p "$(dirname "$path")"
}

repo_root_from_script() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[1]}")" && pwd)"
  cd "$script_dir/../.." && pwd
}

load_reference_config() {
  local repo_root="$1"
  local config_file="${CONFIG_FILE:-$repo_root/config/reference_paths.sh}"
  if [[ -f "$config_file" ]]; then
    # shellcheck disable=SC1090
    source "$config_file"
  fi
}
