#!/usr/bin/env bash
# Publishes skills to npm (all of them, or the names given). Logs in to npm first if needed;
# bump "version" in a skill's package.json before republishing it.
set -euo pipefail
cd "$(dirname "$0")/.."
if ! npm whoami >/dev/null 2>&1; then
  echo "Not logged in to npm. Logging in now (approve it in the browser)..."
  npm login
  npm whoami >/dev/null 2>&1 || { echo "npm login did not finish. Run this script again." >&2; exit 1; }
fi
names=("$@")
if [[ ${#names[@]} -eq 0 ]]; then for d in skills/*/; do [[ -f "${d}package.json" ]] && names+=("$(basename "$d")"); done; fi
for n in "${names[@]}"; do echo "== $n"; bash "skills/$n/publish.sh"; echo; done
