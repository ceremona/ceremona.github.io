#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"   # run from anywhere; anchor to project root

# 1. Keep / and /about/ in lockstep — about.md is canonical
cp src/pages/about.md src/pages/index.md
echo "-> synced about.md -> index.md"

# 2. Stage absolutely everything
git add -A
echo ""
echo "Staged changes:"
git status --short
echo ""

# 3. Prompt for message; default if you just hit return
read -p "Commit message: " msg
msg="${msg:-site update}"

# 4. Commit + push
git commit -m "$msg"
git push
echo ""
echo "Pushed."
