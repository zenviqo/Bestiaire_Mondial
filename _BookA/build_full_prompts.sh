#!/usr/bin/env bash
# Génère, pour chaque créature sélectionnée, UN gros prompt complet à coller dans ChatGPT.
# Chaque prompt = MASTER_STYLE_PROMPT + données complètes de la créature (texte intégral du .md, sans frontmatter ni section PROMPT IMAGE).
#
# Sortie : _BookA/FULL_PROMPTS/NNN_NomCreature.txt
#
# Usage : bash _BookA/build_full_prompts.sh

set -euo pipefail

cd "$(dirname "$0")/.."  # repo root

SEL="_BookA/SELECTION.md"
MASTER="_BookA/MASTER_STYLE_PROMPT.md"
OUT_DIR="_BookA/FULL_PROMPTS"

mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR"/*

# Charger le master prompt (sans son propre header markdown)
MASTER_TEXT=$(awk '/^---$/{seen++; next} seen>=1' "$MASTER")

count=0
missing=0

while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]{2}_ ]] && [[ "$line" == */* ]]; then
    tradition="${line%%/*}"
    creature="${line#*/}"
    creature="${creature%%[[:space:]]*}"
    md_file="${tradition}/creatures/${creature}.md"

    if [ ! -f "$md_file" ]; then
      missing=$((missing+1))
      continue
    fi

    count=$((count+1))
    num=$(printf "%03d" $count)
    out_file="$OUT_DIR/${num}_${creature}.txt"

    # Extraire le contenu complet du .md sans frontmatter YAML et sans section PROMPT IMAGE
    body=$(awk '
      BEGIN{infront=0; inprompt=0}
      /^---$/{infront=!infront; next}
      infront{next}
      /^## PROMPT IMAGE/{inprompt=1; next}
      inprompt{next}
      {print}
    ' "$md_file")

    # Composer le prompt final
    {
      echo "$MASTER_TEXT"
      echo ""
      echo "═══════════════════════════════════════════════"
      echo "  CRÉATURE : $creature"
      echo "  Tradition : $(echo "$tradition" | sed 's/^[0-9]*_//' | sed 's/_/ /g')"
      echo "═══════════════════════════════════════════════"
      echo ""
      echo "$body"
    } > "$out_file"
  fi
done < "$SEL"

echo ""
echo "✓ $count fichiers générés dans $OUT_DIR/"
echo "  Manquants : $missing"
echo ""
echo "📋 Comment t'en servir :"
echo "  1. Ouvre $OUT_DIR/001_Fenrir.txt"
echo "  2. Copie tout le contenu (Cmd+A puis Cmd+C)"
echo "  3. Colle dans ChatGPT (avec image generation activé)"
echo "  4. ChatGPT te génère la double-page complète"
echo "  5. Télécharge l'image et passe au suivant"
echo ""
