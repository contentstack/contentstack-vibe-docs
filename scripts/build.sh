#!/usr/bin/env sh
# Copy single-source-of-truth files into the per-harness directories.
#
# Source of truth (edit these):
#   skills/contentstack-vibe-docs/SKILL.md
#   skills/contentstack-vibe-docs/references/
#   rules/contentstack.mdc
#
# Generated (do not edit):
#   codex/skills/contentstack-vibe-docs/SKILL.md
#   codex/skills/contentstack-vibe-docs/references/
#   cursor/rules/contentstack.mdc
#
# codex/AGENTS.md is hand-written and not touched by this script.

set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

SRC="skills/contentstack-vibe-docs"

# Codex: mirror the canonical skill into codex/skills/ so Codex CLI users can
# copy the codex/ directory into their project.
CODEX_DEST="codex/skills/contentstack-vibe-docs"
rm -rf "$CODEX_DEST"
mkdir -p "$CODEX_DEST"
cp "$SRC/SKILL.md" "$CODEX_DEST/SKILL.md"
cp -R "$SRC/references" "$CODEX_DEST/references"

# Cursor: single rule file for manual .cursor/rules/ install.
mkdir -p cursor/rules
cp rules/contentstack.mdc cursor/rules/contentstack.mdc

ref_count=$(find "$SRC/references" -type f | wc -l | tr -d ' ')
echo "Built:"
echo "  $CODEX_DEST/  (SKILL.md + $ref_count reference files)"
echo "  cursor/rules/contentstack.mdc"
