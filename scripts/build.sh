#!/usr/bin/env sh
# Copy single-source-of-truth files into the per-harness directories.
#
# Sources (edit these):
#   SKILL.md
#   references/
#   rules/contentstack.mdc
#
# Generated (do not edit):
#   skills/contentstack-vibe-docs/SKILL.md
#   skills/contentstack-vibe-docs/references/
#   codex/skills/contentstack-vibe-docs/SKILL.md
#   codex/skills/contentstack-vibe-docs/references/
#   cursor/rules/contentstack.mdc
#
# codex/AGENTS.md is hand-written and not touched by this script.

set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

copy_skill() {
  dest="$1"
  rm -rf "$dest"
  mkdir -p "$dest"
  cp SKILL.md "$dest/SKILL.md"
  cp -R references "$dest/references"
}

copy_skill "skills/contentstack-vibe-docs"
copy_skill "codex/skills/contentstack-vibe-docs"

mkdir -p cursor/rules
cp rules/contentstack.mdc cursor/rules/contentstack.mdc

ref_count=$(find references -type f | wc -l | tr -d ' ')
echo "Built:"
echo "  skills/contentstack-vibe-docs/        (SKILL.md + $ref_count reference files)"
echo "  codex/skills/contentstack-vibe-docs/  (SKILL.md + $ref_count reference files)"
echo "  cursor/rules/contentstack.mdc"
