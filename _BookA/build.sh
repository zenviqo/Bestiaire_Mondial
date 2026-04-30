#!/usr/bin/env bash
# Compilation du Bestiaire Mondial Premium (Stratégie A)
# Lit SELECTION.md et concatène les entrées dans Bestiaire_Mondial_Premium.md

set -euo pipefail

cd "$(dirname "$0")/.."  # repo root

OUT="_BookA/Bestiaire_Mondial_Premium.md"
SEL="_BookA/SELECTION.md"

echo "→ Génération $OUT"

# Front matter
{
  cat _BookA/00_Frontispice.md 2>/dev/null || true
  echo ""
  cat _BookA/01_Preface.md 2>/dev/null || true
  echo ""
  cat _BookA/02_Comment_lire.md 2>/dev/null || true
  echo ""
  cat _BookA/03_Sommaire.md 2>/dev/null || true
  echo ""
} > "$OUT"

current_section=""
missing_count=0
included_count=0

# Parse SELECTION.md ligne par ligne
while IFS= read -r line; do
  # Section principale (## I — EUROPE…)
  if [[ "$line" =~ ^##[[:space:]]+[IVX]+ ]]; then
    section_title=$(echo "$line" | sed 's/^##\s*//')
    {
      echo ""
      echo "\\newpage"
      echo ""
      echo "# $section_title"
      echo ""
    } >> "$OUT"
    continue
  fi

  # Sous-section (### XX_Tradition (N))
  if [[ "$line" =~ ^###[[:space:]]+([0-9]{2}_[A-Za-z_]+) ]]; then
    tradition_title=$(echo "$line" | sed 's/^###\s*//' | sed 's/^[0-9]\{2\}_//' | sed 's/_/ /g')
    {
      echo ""
      echo "\\newpage"
      echo ""
      echo "## $tradition_title"
      echo ""
    } >> "$OUT"
    continue
  fi

  # Entrée créature : XX_Tradition/NomCreature
  if [[ "$line" =~ ^([0-9]{2}_[A-Za-z_]+)/([A-Za-z0-9_\.\-]+) ]]; then
    tradition="${BASH_REMATCH[1]}"
    creature="${BASH_REMATCH[2]}"
    creature_file="${tradition}/creatures/${creature}.md"

    # Le fichier peut avoir des caractères spéciaux non capturés par le regex bash
    if [ ! -f "$creature_file" ]; then
      # Essai 2 : lire la ligne entière comme path et reconstruire
      raw="$line"
      raw_tradition=$(echo "$raw" | cut -d/ -f1)
      raw_creature=$(echo "$raw" | cut -d/ -f2)
      creature_file="${raw_tradition}/creatures/${raw_creature}.md"
    fi

    if [ ! -f "$creature_file" ]; then
      echo "  ⚠ MANQUANT : $creature_file" >&2
      missing_count=$((missing_count+1))
      continue
    fi

    {
      echo ""
      echo "\\newpage"
      echo ""
      cat "$creature_file"
      echo ""
    } >> "$OUT"
    included_count=$((included_count+1))
  fi
done < "$SEL"

# Back matter
{
  echo ""
  cat _BookA/97_Glossaire.md 2>/dev/null || true
  echo ""
  cat _BookA/98_Index.md 2>/dev/null || true
  echo ""
  cat _BookA/99_Colophon.md 2>/dev/null || true
} >> "$OUT"

word_count=$(wc -w < "$OUT" | tr -d ' ')

echo ""
echo "✓ $OUT généré"
echo "  • Entrées incluses : $included_count"
echo "  • Manquantes : $missing_count"
echo "  • Mots : $word_count"
echo "  • Estimation pages (300 mots/page) : $((word_count / 300))"

# Optionnel : génération PDF si pandoc dispo
if command -v pandoc &>/dev/null; then
  echo ""
  echo "→ Génération PDF avec pandoc…"
  PDF="_BookA/Bestiaire_Mondial_Premium.pdf"
  pandoc "$OUT" \
    -o "$PDF" \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    -V geometry:margin=2cm \
    -V documentclass=book \
    -V mainfont="Garamond" \
    -V fontsize=11pt \
    2>/dev/null && echo "  ✓ $PDF" || echo "  ⚠ pandoc a échoué — installer xelatex et une police Garamond"
else
  echo ""
  echo "ℹ pandoc non installé. Pour générer le PDF :"
  echo "  brew install pandoc basictex"
  echo "  sudo tlmgr install collection-fontsrecommended xetex"
  echo "  ./_BookA/build.sh"
fi
