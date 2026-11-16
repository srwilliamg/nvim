#!/usr/bin/env bash
# libs-rm.sh — Remove all Neovim runtime data.
# Usage: bash scripts/libs-rm.sh
# Removes plugins, state, cache. Does not touch ~/.config/nvim.

set -euo pipefail

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
