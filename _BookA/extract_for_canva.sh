#!/usr/bin/env bash
# Extrait les 407 créatures sélectionnées en :
# 1. _BookA/PROMPTS.txt — tous les prompts image numérotés, prêts à copier-coller dans ChatGPT
# 2. _BookA/CARDS/NNN_Nom.md — fiche par créature (texte propre + prompt mis en valeur), pour Canva
# 3. _BookA/images/XX_Tradition/ — dossiers vides prêts pour recevoir les images générées
# 4. _BookA/CHECKLIST.csv — tableau Google Sheets pour suivre l'avancement

set -euo pipefail

cd "$(dirname "$0")/.."  # repo root

SEL="_BookA/SELECTION.md"
PROMPTS="_BookA/PROMPTS.txt"
CHECKLIST="_BookA/CHECKLIST.csv"
CARDS_DIR="_BookA/CARDS"
IMAGES_DIR="_BookA/images"

mkdir -p "$CARDS_DIR" "$IMAGES_DIR"
rm -f "$PROMPTS" "$CHECKLIST"
rm -rf "$CARDS_DIR"/*

# CSV header
echo "ordre,tradition,nom_creature,fichier_md,prompt_chatgpt,nom_image_attendue,statut" > "$CHECKLIST"

# PROMPTS header
{
  echo "════════════════════════════════════════════════════════════════════"
  echo "  BESTIAIRE MONDIAL — 407 PROMPTS IMAGE POUR CHATGPT"
  echo "════════════════════════════════════════════════════════════════════"
  echo ""
  echo "Mode d'emploi :"
  echo "  1. Copier le prompt sous le numéro souhaité"
  echo "  2. Coller dans ChatGPT (avec image generation activée)"
  echo "  3. Télécharger l'image"
  echo "  4. La nommer '<numéro>_<nom>.png' (ex: 001_Fenrir.png)"
  echo "  5. La déposer dans _BookA/images/<XX_Tradition>/"
  echo ""
  echo "════════════════════════════════════════════════════════════════════"
  echo ""
} > "$PROMPTS"

count=0
missing=0

while IFS= read -r line; do
  # Match toute ligne commençant par NN_Tradition/Creature (caractères Unicode possibles)
  if [[ "$line" =~ ^[0-9]{2}_ ]] && [[ "$line" == */* ]]; then
    tradition="${line%%/*}"
    creature="${line#*/}"
    # Trim
    creature="${creature%%[[:space:]]*}"
    md_file="${tradition}/creatures/${creature}.md"

    if [ ! -f "$md_file" ]; then
      missing=$((missing+1))
      continue
    fi

    count=$((count+1))
    num=$(printf "%03d" $count)
    image_name="${num}_${creature}.png"

    # Créer dossier images de la tradition
    mkdir -p "$IMAGES_DIR/$tradition"

    # Extraire le PROMPT IMAGE
    prompt=$(awk '/^## PROMPT IMAGE/{flag=1; next} flag && /^---|^## /{flag=0} flag && NF' "$md_file" | tr '\n' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//')

    # Extraire le texte pour la card (sans frontmatter, sans PROMPT IMAGE)
    body=$(awk 'BEGIN{infront=0; inprompt=0} /^---$/{infront=!infront; next} infront{next} /^## PROMPT IMAGE/{inprompt=1; next} inprompt{next} {print}' "$md_file")

    # Écrire dans PROMPTS.txt
    {
      echo "──────────────────────────────────────────────────────────────────"
      echo "  $num. $creature  ($tradition)"
      echo "  Image attendue : $tradition/$image_name"
      echo "──────────────────────────────────────────────────────────────────"
      echo ""
      echo "$prompt"
      echo ""
      echo ""
    } >> "$PROMPTS"

    # Écrire la card pour Canva
    card_file="$CARDS_DIR/${num}_${creature}.md"
    {
      echo "# $num — $creature"
      echo ""
      echo "**Tradition :** $(echo "$tradition" | sed 's/^[0-9]*_//' | sed 's/_/ /g')"
      echo ""
      echo "**Image à insérer :** \`_BookA/images/$tradition/$image_name\`"
      echo ""
      echo "---"
      echo ""
      echo "## ⤓ PROMPT À COPIER-COLLER DANS CHATGPT"
      echo ""
      echo "\`\`\`"
      echo "$prompt"
      echo "\`\`\`"
      echo ""
      echo "---"
      echo ""
      echo "## TEXTE DE LA FICHE (à coller dans Canva)"
      echo ""
      echo "$body"
    } > "$card_file"

    # Ajouter à la checklist
    # Échapper les virgules dans le prompt pour CSV
    prompt_csv=$(echo "$prompt" | sed 's/"/""/g')
    echo "$num,$tradition,$creature,$md_file,\"$prompt_csv\",$image_name," >> "$CHECKLIST"

  fi
done < "$SEL"

echo ""
echo "✓ Extraction terminée"
echo "  • Créatures traitées : $count"
echo "  • Manquantes : $missing"
echo ""
echo "📁 Fichiers générés :"
echo "  • _BookA/PROMPTS.txt        ← copie/colle ces prompts dans ChatGPT"
echo "  • _BookA/CHECKLIST.csv      ← ouvre dans Google Sheets pour suivre l'avancement"
echo "  • _BookA/CARDS/             ← 407 fiches individuelles prêtes pour Canva"
echo "  • _BookA/images/            ← 40 dossiers prêts à recevoir tes images"
echo ""
