#!/usr/bin/env bash
# Publishes this skill to npm. Logs in to npm first if needed; bump "version" in
# package.json before republishing, npm refuses to overwrite a version.
set -euo pipefail
cd "$(dirname "$0")"
if ! npm whoami >/dev/null 2>&1; then
  echo "Not logged in to npm. Logging in now (approve it in the browser)..."
  npm login
  npm whoami >/dev/null 2>&1 || { echo "npm login did not finish. Run this script again." >&2; exit 1; }
fi
bash test.sh
npm publish --access public "$@"
NAME="$(node -p "require('./package.json').name")"
echo; echo "Published ${NAME}. Try:  npx ${NAME} --dry-run"
