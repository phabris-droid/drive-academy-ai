#!/usr/bin/env bash
# Hook PreToolUse (Write|Edit) : bloque l'écriture de formulations interdites par le CDC §8/§16
# et l'écriture de secrets dans le dépôt. Code de sortie 2 = blocage, message renvoyé à Claude.
set -euo pipefail
input="$(cat)"
path="$(printf '%s' "$input" | python3 -c 'import sys,json;d=json.load(sys.stdin);print(d.get("tool_input",{}).get("file_path",""))')"
content="$(printf '%s' "$input" | python3 -c 'import sys,json;t=json.load(sys.stdin).get("tool_input",{});print(t.get("content") or t.get("new_string") or "")')"

case "$path" in
  *.claude/*|*docs/*|*CLAUDE.md|*/tests/*|*_test.dart|*test_*.py) exit 0 ;;
esac

if [[ "$(basename "$path")" == ".env" ]]; then
  echo "Interdit : ne pas écrire de fichier .env dans le dépôt (utiliser .env.example)." >&2; exit 2
fi

if printf '%s' "$content" | grep -qiE "examen officiel|permis garanti|réussite garantie|auto-école en ligne"; then
  echo "Formulation interdite par le CDC §8/§16 (la plateforme ne délivre ni permis ni examen officiel). Reformule." >&2; exit 2
fi

if printf '%s' "$content" | grep -qE "(sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN (RSA )?PRIVATE KEY-----)"; then
  echo "Secret détecté dans le contenu. Utilise une variable d'environnement." >&2; exit 2
fi
exit 0
