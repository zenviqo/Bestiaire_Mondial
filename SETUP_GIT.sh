#!/bin/bash
# Script de setup Git + push GitHub pour le Bestiaire Mondial
# À exécuter UNE FOIS après avoir créé le repo sur github.com

# ÉTAPE 1 : Configure ton identité git (remplace par tes infos)
# git config --global user.name "Ton Nom"
# git config --global user.email "zenviqo@gmail.com"

# ÉTAPE 2 : Exécute ce script depuis le dossier Bestiaire_Mondial

cd "$(dirname "$0")"

# Initialise le repo
git init
git add .
git commit -m "Initial commit : structure projet + méthodologie + Fenrir (entrée-test validée)"

# Configure la branche main
git branch -M main

# Ajoute le remote (remplace 'TON_USERNAME_GITHUB' par ton vrai username GitHub)
echo ""
echo "ATTENTION : avant de continuer, édite la ligne ci-dessous dans ce script :"
echo "Remplace TON_USERNAME_GITHUB par ton vrai username GitHub"
echo ""
# git remote add origin https://github.com/TON_USERNAME_GITHUB/bestiaire-mondial.git

# Push vers GitHub
# git push -u origin main

echo ""
echo "Une fois le remote ajouté et le push fait, vérifie sur github.com que le repo contient :"
echo "- README.md"
echo "- _Meta/ (avec METHODOLOGIE, INDEX_MONDIAL, PROGRESSION)"
echo "- 01_Nordique/creatures/Fenrir.md"
echo "- ROUTINE_PROMPT.md"
