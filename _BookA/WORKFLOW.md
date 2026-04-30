# 🎨 WORKFLOW PRODUCTION — Stratégie A (Toi → ChatGPT → Canva)

Voilà comment tu produis le PDF en pratique, étape par étape.

---

## 📁 Ce qui est à ta disposition

```
_BookA/
├── PROMPTS.txt           ← 407 prompts numérotés à copier-coller dans ChatGPT
├── CHECKLIST.csv         ← Tableau Google Sheets pour tracker l'avancement
├── CARDS/                ← 407 fiches individuelles (texte propre + prompt)
│   ├── 001_Fenrir.md
│   ├── 002_Jörmungandr.md
│   └── ... (jusqu'à 407)
└── images/               ← 40 dossiers vides (un par tradition)
    ├── 01_Nordique/      ← Tu déposes ici 001_Fenrir.png, 002_Jörmungandr.png, etc.
    ├── 02_Celtique/
    └── ... (jusqu'à 40_Maghreb)
```

---

## 🚀 ÉTAPE 1 — Génération des images (toi + ChatGPT)

1. Ouvre `_BookA/PROMPTS.txt`
2. Copie le prompt sous "001. Fenrir"
3. Va dans **ChatGPT** (avec génération d'image activée — Plus, Pro)
4. Colle le prompt → ChatGPT génère l'image
5. Télécharge l'image en PNG
6. **Renomme-la** exactement : `001_Fenrir.png`
7. **Place-la** dans `_BookA/images/01_Nordique/`
8. Coche la case "fait" dans `CHECKLIST.csv`

**Astuce** : Tu peux faire des batchs de 10-20 prompts d'affilée. ChatGPT garde le contexte du style si tu lui dis "même style que la précédente".

**Astuce 2** : Si une image ne plaît pas, demande à ChatGPT "fais une variante plus sombre/plus colorée/etc."

---

## 📝 ÉTAPE 2 — Mise en page (toi + Canva)

### Setup Canva (1 fois, ~30 min)

1. Crée un compte **Canva Pro** (gratuit pour 30 jours, après ~12€/mois)
2. Cherche un template "Coffee Table Book" ou "Magazine layout"
3. Crée un document A4 portrait (ou 21×26 cm carré pour effet luxe)
4. Définis ta charte :
   - **Police titre** : Trajan Pro / Playfair Display / Cormorant Garamond
   - **Police corps** : Garamond / EB Garamond / Crimson Pro
   - **Couleurs** : crème (#FAF6E9), encre noire (#1A1A1A), accent ocre (#B08D57)
5. Crée 1 page modèle "Créature" :
   - Haut de page : numéro + tradition (petit)
   - Centre haut : grande image (pleine largeur)
   - Bas : titre de la créature + corps de texte sur 2 colonnes

### Production page par page (rythme : ~3 min par créature)

Pour chaque créature, dans Canva :

1. **Duplique la page modèle**
2. Ouvre `_BookA/CARDS/001_Fenrir.md` à côté
3. **Drag-and-drop** l'image `_BookA/images/01_Nordique/001_Fenrir.png` dans le placeholder
4. **Copie le titre** (`# FENRIR`) → colle en haut
5. **Copie le corps** (sections SIGNIFICATION DU NOM, ORIGINE, etc.) → colle dans la zone texte 2 colonnes
6. Ajuste la mise en page : sauts de section, sauts de ligne, italiques sur les noms étrangers

### Pour les sections de transition (entre traditions)

Les `## I — EUROPE DU NORD ET CENTRE`, `## II — ORIENT ANCIEN` etc. dans `SELECTION.md` sont les **10 grandes parties du livre**. Pour chacune, prévois 1 page de garde décorative dans Canva.

---

## 📦 ÉTAPE 3 — Compilation finale

Une fois les ~440 pages prêtes dans Canva (407 créatures + 10 sections + front/back matter) :

1. **Vérifie l'enchaînement** : ouvre `SELECTION.md` et clique sur les noms pour parcourir l'ordre exact
2. **Exporte en PDF** :
   - Format : "PDF Print" (haute qualité)
   - CMYK si tu veux imprimer, RGB si c'est juste numérique
   - Sans marques de coupe pour le PDF, AVEC marques de coupe pour l'impression POD
3. **Vérifie le PDF** :
   - Pages dans le bon ordre
   - Toutes les images présentes
   - Pas d'erreurs typographiques manifestes
   - Sommaire interactif (cliquable depuis Canva si tu utilises sa fonction "TOC")

---

## 💰 ÉTAPE 4 — Vente

### Plateforme rapide : Gumroad (recommandé pour démarrer)

1. Crée un compte gratuit sur **gumroad.com**
2. Upload ton PDF (jusqu'à 16 GB par fichier)
3. Définis le prix : **49€** pour le PDF Premium (cf. analyse marché)
4. Ajoute :
   - Cover image (Canva : exporte la couverture en PNG haute résolution)
   - Description vendeuse (je te génère ça si tu veux)
   - 5-10 pages d'aperçu en watermark
5. Active le paiement Stripe ou PayPal
6. **Tu commences à vendre.**

Commission Gumroad : 10% + frais Stripe (~2,9% + 0,30€).

### Pour aller plus loin

- **Print-on-Demand** : duplique le PDF sur **Lulu.com** (POD haut de gamme) ou **Blurb.com** pour vendre la version papier sans gérer de stock
- **Amazon KDP** : si tu traduis en anglais, le marché US est 5-10× plus grand (cible aussi les versions Kindle)
- **Ton propre site** : WordPress + WooCommerce ou Shopify (~30€/mois) pour avoir 100% de la marge à long terme

---

## 📊 Suivi avec CHECKLIST.csv

Ouvre `CHECKLIST.csv` dans **Google Sheets** :

| ordre | tradition | nom_creature | prompt_chatgpt | image_attendue | statut |
|---|---|---|---|---|---|
| 001 | 01_Nordique | Fenrir | (long prompt) | 001_Fenrir.png | |
| 002 | 01_Nordique | Jörmungandr | (long prompt) | 002_Jörmungandr.png | |

Mets `OK` ou `✓` dans la colonne `statut` au fur et à mesure. Filtre par tradition pour t'organiser.

---

## ⏱ Estimation temps

- **Génération images ChatGPT** : ~3 min/image × 407 = **~20 heures** (étalable sur 2-3 semaines à raison de 30/jour)
- **Mise en page Canva** : ~3 min/page × 440 pages = **~22 heures**
- **Front matter + cover + finitions** : ~10 heures
- **Setup Gumroad + page vente** : ~3 heures

**Total : ~55 heures** de travail réparties sur 3-6 semaines pour avoir un PDF vendable.

---

## ⚠️ Points d'attention

1. **Cohérence visuelle** : les images ChatGPT varient en style. Pour avoir un livre cohérent, demande dans ton prompt de session : *"Pour toutes les images suivantes, garde le même style : ink on aged parchment, medieval bestiary, sepia wash, no text"*. Génère par batch de tradition pour conserver le style.

2. **Droits d'auteur** : ChatGPT/DALL-E te donnent les droits d'usage commercial sur les images générées (selon les CGU OpenAI 2024). Vérifie au moment de publier que c'est toujours le cas.

3. **Mentions légales** : Sur la page de copyright de ton PDF, indique :
   - Auteur, éditeur, année
   - ISBN si tu en demandes un
   - Mention "Tous droits réservés" + "Aucun extrait ne peut être reproduit sans autorisation"
   - Mention "Illustrations générées par IA à partir de descriptions originales" (transparence légale recommandée)

4. **ISBN** (optionnel mais recommandé pour vendre sérieusement) :
   - France : ~10€ via [bibliographie nationale française](https://www.bnf.fr/fr/numero-isbn)
   - Amazon KDP : ISBN gratuit fourni à la création
   - International : ~125$ via Bowker

---

## 🎁 Bonus : checklist pré-lancement

Avant de mettre en vente :

- [ ] PDF complet, ordre vérifié, toutes les images présentes
- [ ] Cover finale (avec titre, sous-titre, ton nom de plume)
- [ ] Quatrième de couverture rédigée (~150 mots vendeurs)
- [ ] Page de copyright + ISBN
- [ ] 5-10 pages d'aperçu avec watermark "EXTRAIT" pour la fiche Gumroad
- [ ] Description Gumroad rédigée (3-4 paragraphes vendeurs)
- [ ] 3 captures d'écran "marketing" (page créature, page de transition, sommaire)
- [ ] Compte Stripe ou PayPal connecté
- [ ] Prix défini
- [ ] Test d'achat avec ton propre compte (pour vérifier le téléchargement)
