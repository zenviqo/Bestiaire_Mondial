# 🚀 COMMENT REPRENDRE LE PROJET DANS UNE NOUVELLE CONVERSATION

## Méthode en 2 étapes

### ÉTAPE 1 — Ouvrir une nouvelle conversation Claude Code

Dans Terminal :
```bash
cd ~/Desktop/Bestiaire_Mondial
claude
```

(Ou simplement ouvre Claude Code dans une nouvelle conversation.)

### ÉTAPE 2 — Copier-coller EXACTEMENT ce bloc ci-dessous dans la conversation

---

## 📋 PROMPT À COPIER-COLLER (tout le bloc entre les lignes)

---

```
/loop Tu es le rédacteur officiel du Bestiaire Mondial — projet d'atlas encyclopédique des créatures mythologiques de l'humanité.

AVANT DE RÉDIGER QUOI QUE CE SOIT, lis impérativement dans cet ordre :
1. /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/README.md (vision)
2. /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/_Meta/METHODOLOGIE.md (règles NON-NÉGOCIABLES)
3. /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/01_Nordique/creatures/Fenrir.md (modèle de qualité à copier EXACTEMENT en niveau et structure)
4. /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/_Meta/PROGRESSION.md (état d'avancement)
5. Liste le contenu actuel de /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/01_Nordique/creatures/ pour savoir quelles créatures sont déjà faites

Ensuite, à chaque itération du loop :

1. Identifie la PROCHAINE créature nordique à rédiger (non encore présente dans le dossier creatures/)
2. Fais une recherche web APPROFONDIE via WebSearch et WebFetch pour compiler les faits vérifiés depuis plusieurs sources
3. Rédige l'entrée complète en suivant EXACTEMENT la structure du fichier Fenrir.md (métadonnées YAML + toutes les sections)
4. RESPECTE ABSOLUMENT les règles de METHODOLOGIE.md :
   - AUCUNE citation verbatim d'aucun texte ancien ou moderne
   - AUCUN auteur moderne nommé dans le texte (pas de "Simek", "Lindow", "Orchard" etc.)
   - AUCUN copié-collé — tout en voix originale propre au bestiaire
   - AUCUNE bibliographie avec auteurs modernes
   - Voix littéraire érudite, ton solennel, synthèse originale
   - Inclure la section "Distinction avec l'imaginaire moderne" pour démarquer vérité vs fantasy
   - Produire un prompt image en anglais à la fin
5. Sauvegarde le fichier à /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/01_Nordique/creatures/[NomDeLaCréature].md
6. Commit git avec message "Ajout créature nordique : [NomDeLaCréature]"
7. Fais une créature par itération (pas plus) pour garder la qualité maximale

ORDRE DE PRIORITÉ tradition nordique :
- Créatures cosmiques majeures d'abord : Jörmungandr, Níðhöggr, Sleipnir, Garmr, Sköll, Hati, Ratatoskr, Hræsvelgr, Geri & Freki, Huginn & Muninn
- Puis êtres divins mineurs / familiers : Audhumla, Veðrfölnir, Tanngrisnir & Tanngnjóstr
- Puis créatures de tradition Edda : Svartálfar, Ljósálfar, Dvergar spécifiques nommés
- Puis créatures folkloriques scandinaves régionales : Nøkken, Fossegrim variantes, Vardøger, Gjenganger, Mare, Alven, Huldra variantes, Skogsrå variantes
- Puis yōkai-équivalents nordiques, géants nommés spécifiques, Jötnar individuels (Ymir, Bergelmir, Thrym, Skrymir, Utgardaloki, Suttungr, Mimir, Ægir, Gerdr, Skadi, etc.)

OBJECTIF : ~300 créatures nordiques pour couvrir exhaustivement la tradition.

Continue le loop jusqu'à avoir couvert toute la tradition nordique, puis arrête-toi et signale-le.

Entre chaque itération, choisis un delay court (60-120s) pour rester dans le cache de contexte.
```

---

## 🎯 Après le collage

Claude Code va :
1. Lire les fichiers de référence
2. Se familiariser avec la qualité attendue
3. Lancer la production en boucle
4. Produire 1 créature par itération, toutes rigoureusement recherchées

## 📊 Suivre l'avancement

Dans un autre terminal, tu peux voir en live :
```bash
ls /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/01_Nordique/creatures/ | wc -l
```
(Nombre de créatures nordiques complétées)

```bash
cat /Users/guillaumeploumion/Desktop/Bestiaire_Mondial/_Meta/PROGRESSION.md
```
(Log détaillé)

## 🔁 Quand la tradition nordique est finie

Tu relances une nouvelle conversation avec le MÊME prompt mais en remplaçant :
- `01_Nordique/creatures/` → `02_Celtique/creatures/`
- `tradition nordique` → `tradition celtique`
- L'ordre de priorité par celui de la tradition celtique

Et ainsi de suite pour chaque tradition.

---

## ⚠️ RÈGLE ABSOLUE

Même dans une nouvelle conversation, si Claude Code **n'a pas lu METHODOLOGIE.md**, il va probablement dériver vers du littéraire-avec-citations-inventées comme dans le grimoire Vol.2. C'est pourquoi la première instruction du prompt est toujours de lire les fichiers de référence.

Si tu remarques qu'une créature produite contient des citations inventées ou cite des auteurs modernes, **arrête le loop** et rappelle la méthodologie.
