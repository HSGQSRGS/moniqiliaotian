#!/usr/bin/env bash
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
OK=0; NG=0
for f in $(find . -name '*.html'); do grep -qi '<html' "$f" && OK=$((OK+1)) || NG=$((NG+1)); done
MISS=$(grep -rohE '(src|href)="[^"#][^"]*"' --include='*.html' . | sed -E 's/^(src|href)="//;s/"$//' | grep -v '://' | grep -v '^data:' | sort -u | while read r; do [ -e "./${r#../}" ] || echo "$r"; done | wc -l)
LEFT=$(grep -rlE 'TransparentLC|yydsym|源码网|51\.la|易乐游|1355383870|41661|xsymw|keleyi' . --include='*.html' --include='*.js' --include='*.css' --include='*.php' 2>/dev/null | wc -l)
echo "HTML OK=$OK FAIL=$NG MISS_LINK=$MISS RESIDUE=$LEFT"
echo "Lion"
