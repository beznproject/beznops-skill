#!/usr/bin/env bash
# install.sh - Cross-platform installer for beznops and focused skills on macOS, Linux, and WSL

set -euo pipefail

TARGET_PROJECT="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SKILLS_BASE="${SCRIPT_DIR}/.agents/skills"

SKILL_FOLDERS=(
  "beznops"
  "beznops-typography"
  "beznops-web"
  "beznops-design"
  "beznops-clean"
  "beznops-audit"
)

if [ ! -f "${SOURCE_SKILLS_BASE}/beznops/SKILL.md" ]; then
  echo "Error: Source beznops skill not found at ${SOURCE_SKILLS_BASE}/beznops" >&2
  exit 1
fi

if [ -z "${TARGET_PROJECT}" ]; then
  GLOBAL_BASE="${HOME}/.gemini/config/skills"
  mkdir -p "${GLOBAL_BASE}"
  for skill in "${SKILL_FOLDERS[@]}"; do
    src="${SOURCE_SKILLS_BASE}/${skill}"
    dst="${GLOBAL_BASE}/${skill}"
    if [ -d "${src}" ]; then
      mkdir -p "${dst}"
      cp -R "${src}/"* "${dst}/"
      echo -e "\033[0;32m[OK] Installed ${skill} globally to: ${dst}\033[0m"
    fi
  done
  echo -e "\n\033[0;36mAll beznops skills installed successfully!\033[0m"
  echo "Start a new Antigravity session to load beznops across all workspaces."
else
  WORKSPACE_SKILLS_BASE="${TARGET_PROJECT}/.agents/skills"
  mkdir -p "${WORKSPACE_SKILLS_BASE}"
  for skill in "${SKILL_FOLDERS[@]}"; do
    src="${SOURCE_SKILLS_BASE}/${skill}"
    dst="${WORKSPACE_SKILLS_BASE}/${skill}"
    if [ -d "${src}" ]; then
      mkdir -p "${dst}"
      cp -R "${src}/"* "${dst}/"
      echo -e "\033[0;32m[OK] Installed ${skill} into workspace: ${dst}\033[0m"
    fi
  done
fi
