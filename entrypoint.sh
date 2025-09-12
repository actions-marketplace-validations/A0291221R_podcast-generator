#!/bin/bash

echo "=========================="

git config --global user.name "{GITHUB_ACTOR}"
git config --global user.email "{INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

#!/usr/bin/env sh
set -euo pipefail

# If you want to call feed directly (requires shebang + chmod +x):
# /usr/local/bin/feed "$@"

# Or call via python explicitly:
python -u /usr/local/bin/feed "$@"

git add -A && git commit -m "Updated Feed"
git push --set-upstream origin main

echo "=========================="
