# 🤖 AUTOMATISATION — Génération automatique des 407 doubles-pages

Trois niveaux d'automatisation au choix, du plus simple au plus avancé.

---

## NIVEAU 1 — Custom GPT (zéro code, recommandé pour démarrer)

C'est l'option la plus simple si tu n'as pas envie de toucher à du code.

### Setup (5 minutes)

1. Va sur [chat.openai.com/gpts](https://chat.openai.com/gpts)
2. Clique **"Create"** → **"Configure"**
3. **Name** : `Bestiaire Mondial — Compositeur`
4. **Description** : `Génère des doubles-pages de bestiaire premium en français, style manuscrit ancien`
5. **Instructions** : copie-colle TOUT le contenu de `_BookA/MASTER_STYLE_PROMPT.md` (la partie sous `---`)
6. **Capabilities** : active uniquement **DALL-E Image Generation**
7. Sauvegarde

### Utilisation

Pour chaque créature :
1. Ouvre ton Custom GPT
2. Colle le **contenu du `.md`** de la créature (depuis `_BookA/CARDS/NNN_X.md` ou directement depuis `XX_Tradition/creatures/X.md`)
3. → Il génère la double-page automatiquement avec le bon style

**Avantage** : un seul setup, ensuite tu colles juste les données. Le style est garanti consistant.

---

## NIVEAU 2 — Script Python via API OpenAI (vraie automatisation)

C'est l'option où tu lances un script et **tu pars te coucher**. Au réveil, les 407 images sont dans `_BookA/images/`.

### Coût

- Modèle : **gpt-image-1** (le moteur derrière ChatGPT, qualité maximale)
- ~$0.05–0.08 par image en HD 1536×1024
- **Total 407 images : ~$25-35** (≈25-32€)

### Setup (10 minutes)

#### 1. Installe Python + dépendance

```bash
# Python 3 est déjà installé sur Mac
# Si pas pip :
python3 -m ensurepip --upgrade

# Installe la lib OpenAI
pip3 install --upgrade openai
```

#### 2. Récupère une clé API OpenAI

1. Va sur [platform.openai.com/api-keys](https://platform.openai.com/api-keys)
2. Connecte-toi (compte différent ou même que ChatGPT Plus)
3. **"Create new secret key"** → copie la clé `sk-...`
4. Va sur [platform.openai.com/billing](https://platform.openai.com/billing) → recharge **$30** pour avoir de la marge

#### 3. Configure ta clé dans le terminal

```bash
export OPENAI_API_KEY="sk-tonsuper-key-ici"
```

(Pour la rendre permanente, ajoute cette ligne à `~/.zshrc` puis `source ~/.zshrc`.)

### Utilisation

#### Test : générer juste les 5 premières créatures (~$0.40)

```bash
cd ~/Desktop/Bestiaire_Mondial
python3 _BookA/auto_generate.py --start 1 --end 5
```

→ Tu vérifies que les images dans `_BookA/images/01_Nordique/` te plaisent.

#### Lancer toute la production (407 images, ~$25-35, ~3-5h)

```bash
python3 _BookA/auto_generate.py
```

Le script :
- Affiche la progression en temps réel
- **Skippe les images déjà générées** (resume si interrompu)
- Sauvegarde à fur et à mesure dans `_BookA/images/<tradition>/`
- Attend 2 secondes entre 2 appels (anti rate-limit)

#### Limiter à une seule tradition

```bash
python3 _BookA/auto_generate.py --tradition 01_Nordique
```

#### Mode dry-run (vérifier sans appeler l'API)

```bash
python3 _BookA/auto_generate.py --dry-run
```

#### Économique : qualité medium au lieu de high (~50% moins cher)

```bash
python3 _BookA/auto_generate.py --quality medium
```

### Si rate-limit ou erreur

Le script reprend automatiquement où il s'est arrêté. Tu peux relancer la même commande, il skippe ce qui est déjà fait.

Si rate-limit fréquent → augmente le delay :
```bash
python3 _BookA/auto_generate.py --delay 5
```

---

## NIVEAU 3 — Local (Flux/SD) — pour pros

Si tu veux 0 coût mais beaucoup de setup :
- Modèle : **Flux.1 Dev** ou **SDXL** + ControlNet pour la mise en page
- Hardware nécessaire : Mac M-series ou GPU NVIDIA 12 GB+
- Outils : ComfyUI ou A1111
- Qualité texte : moins constante que gpt-image-1
- Pas recommandé sauf si tu maîtrises déjà

---

## 💡 Recommandation pratique

1. **Commence par le Niveau 1 (Custom GPT)** — fais 10-20 créatures à la main pour valider la qualité
2. **Si ça te plaît, passe au Niveau 2** — lance la production complète en automatique pour les 380 restantes
3. **Tu réintègres les 10-20 du Niveau 1** dans le PDF final

Coût total moyen attendu :
- Custom GPT : 0€ (inclus ChatGPT Plus 22€/mois)
- Script Python : 25-35€ pour 407 images
- **Total production images : ~25-35€**

À comparer aux **3 000-5 000€** que coûterait un illustrateur freelance pour 407 illustrations originales.

---

## Workflow recommandé après génération

```
1. python3 _BookA/auto_generate.py    ← lance la prod (~3-5h)
2. Tu reviens, tu vérifies les 407 images dans _BookA/images/
3. Tu refais à la main celles qui sont ratées (Custom GPT ou re-run du script)
4. Tu compiles le PDF final via Canva (template 2-pages prêt) ou import direct
5. Tu mets en vente sur Gumroad / ton Shopify avec POD Bookvault
```
