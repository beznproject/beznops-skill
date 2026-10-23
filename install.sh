#!/usr/bin/env bash
# install.sh - Cross-platform installer for beznops on macOS, Linux, and WSL

set -euo pipefail

TARGET_PROJECT="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SKILL_DIR="${SCRIPT_DIR}/.agents/skills/beznops"

if [ ! -f "${SOURCE_SKILL_DIR}/SKILL.md" ]; then
  echo "Error: Source beznops skill not found at ${SOURCE_SKILL_DIR}" >&2
  exit 1
fi

if [ -z "${TARGET_PROJECT}" ]; then
  GLOBAL_SKILLS_DIR="${HOME}/.gemini/config/skills/beznops"
  mkdir -p "${GLOBAL_SKILLS_DIR}"
  cp -R "${SOURCE_SKILL_DIR}/"* "${GLOBAL_SKILLS_DIR}/"
  echo -e "\033[0;32m[OK] Installed beznops globally to: ${GLOBAL_SKILLS_DIR}\033[0m"
  echo "     Start a new Antigravity session to load beznops across all workspaces."
else
  TARGET_SKILL_DIR="${TARGET_PROJECT}/.agents/skills/beznops"
  mkdir -p "${TARGET_SKILL_DIR}"
  cp -R "${SOURCE_SKILL_DIR}/"* "${TARGET_SKILL_DIR}/"
  echo -e "\033[0;32m[OK] Installed beznops into workspace: ${TARGET_SKILL_DIR}\033[0m"
fi
