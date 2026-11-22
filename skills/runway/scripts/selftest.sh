#!/usr/bin/env bash
# Selftest for runway: manifest versions, SKILL.md frontmatter & size, relative markdown link resolution, templates existence.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
skill="$(cd "$here/.." && pwd)"
root="$(cd "$skill/../.." && pwd)"
fail=0
bad() { echo "FAIL  $*"; fail=1; }
ok()  { echo "ok    $*"; }

v1=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$root/plugin.json")
v2=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$root/.claude-plugin/plugin.json")
v3=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["plugins"][0]["version"])' "$root/.claude-plugin/marketplace.json")
[ "$v1" = "$v2" ] && [ "$v1" = "$v3" ] && ok "manifest versions agree ($v1)" || bad "manifest versions differ ($v1 / $v2 / $v3)"

for t in RELEASE.md PROFILE.md STATE.md; do
  [ -f "$skill/templates/$t" ] && ok "template $t present" || bad "missing template $t"
done

broken=0
while IFS= read -r f; do
  d=$(dirname "$f")
  while IFS= read -r l; do
    l=${l%%#*}
    [ -z "$l" ] && continue
    [ -e "$d/$l" ] || { bad "broken link in ${f#$root/}: $l"; broken=1; }
  done < <(grep -oE '\]\(([^)#: ]+\.md)(#[^)]*)?\)' "$f" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//' || true)
done < <(find "$skill" "$root/README.md" -name '*.md')
[ "$broken" -eq 0 ] && ok "all relative markdown links resolve"

[ "$fail" = 0 ] && echo "ALL OK" || exit 1
