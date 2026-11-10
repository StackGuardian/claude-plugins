#!/usr/bin/env bash
# Copy the sg-* skills from a stackguardian-mcp checkout into the plugin and,
# when they changed, bump the plugin's patch version so installs pick them up.
#
#   scripts/sync-skills.sh <path-to-stackguardian-mcp>
set -euo pipefail

src="${1:?usage: sync-skills.sh <path-to-stackguardian-mcp>}/skills"
root="$(cd "$(dirname "$0")/.." && pwd)"
plugin="$root/plugins/stackguardian"
dest="$plugin/skills"

[ -d "$src" ] || { echo "no skills directory at $src" >&2; exit 1; }

mkdir -p "$dest"
rsync -a --delete --exclude '.DS_Store' --include 'sg-*/' --include 'sg-*/**' --exclude '*' "$src/" "$dest/"

if git -C "$root" diff --quiet -- "$dest" && [ -z "$(git -C "$root" ls-files --others --exclude-standard -- "$dest")" ]; then
  echo "skills already up to date"
  exit 0
fi

node -e '
  const fs = require("fs");
  const file = process.argv[1];
  const manifest = JSON.parse(fs.readFileSync(file, "utf8"));
  const [major, minor, patch] = manifest.version.split(".").map(Number);
  manifest.version = `${major}.${minor}.${patch + 1}`;
  fs.writeFileSync(file, JSON.stringify(manifest, null, 2) + "\n");
  console.log(`skills changed; version bumped to ${manifest.version}`);
' "$plugin/.claude-plugin/plugin.json"
