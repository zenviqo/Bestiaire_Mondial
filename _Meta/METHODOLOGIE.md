# MÉTHODOLOGIE DE RÉDACTION

## VISION DU PROJET

Devenir **LA référence mondiale** consultée par quiconque s'intéresse aux créatures mythologiques, quelle que soit sa culture d'origine. L'ouvrage utilisé par :

- Chercheurs, enseignants, étudiants dans toutes les universités du monde
- Écrivains, scénaristes, game designers, artistes
- Passionnés et curieux, accessibles au grand public cultivé
- Bibliothèques publiques et spécialisées

Cette ambition implique un niveau de **rigueur factuelle** et un niveau d'**accessibilité universelle**, sans sacrifier l'un pour l'autre.

---

## PRINCIPES FONDAMENTAUX (NON-NÉGOCIABLES)

### Sur le fond

1. **FIDÉLITÉ ABSOLUE** au folklore attesté par les traditions réelles
2. **AUCUNE INVENTION NARRATIVE** — on ne romance pas, on ne fabrique pas de détail
3. **VÉRIFICATION SYSTÉMATIQUE** par recherche avant rédaction
4. **DISTINCTION CLAIRE** entre folklore attesté et élaboration moderne

### Sur la forme — CONTRAINTES COMMERCIALES IMPÉRATIVES

5. **AUCUNE CITATION VERBATIM** d'aucun texte (même ancien, même en traduction)
   - Les traductions modernes sont sous copyright
   - Même les textes anciens cités via traductions récentes posent problème
   - → On ne cite JAMAIS, on PARAPHRASE toujours dans notre propre voix

6. **AUCUNE ATTRIBUTION NOMMÉE** à des auteurs/chercheurs contemporains
   - Ne pas nommer « Simek », « Lindow », « Orchard », « Dumézil », etc.
   - Ne pas citer « selon tel universitaire… » ou « le chercheur X propose… »
   - → On présente les faits sans apparat d'autorités modernes

7. **AUCUN COPIÉ-COLLÉ** d'aucune source
   - Recherche → compréhension → réécriture intégrale en notre voix originale
   - Chaque phrase doit être formulée par nous, pas reprise d'ailleurs

8. **VOIX ORIGINALE PROPRE AU BESTIAIRE**
   - Ton érudit, solennel, littéraire
   - Propriété exclusive de l'œuvre
   - Reconnaissable, signature stylistique

### Comment on fait autorité SANS citer

Les **faits mythologiques eux-mêmes ne sont pas copyrightables**. Ce qui est copyrightable :
- Les traductions particulières
- Les formulations spécifiques des chercheurs
- L'organisation originale d'un livre particulier

Ce qui est **libre** :
- Les trames mythologiques (faits)
- Les noms de créatures
- Les structures narratives traditionnelles
- Les attributs attestés par tradition

→ On construit notre autorité par **la richesse et la précision** des faits que nous compilons, pas par l'autorité de nos sources.

---

## STRUCTURE STANDARD D'UNE ENTRÉE

```markdown
---
nom_principal: [NAME]
nom_original: [en langue d'origine, translittéré si besoin]
variantes_linguistiques:
  - [langue]: variante
categorie: [catégorie typologique]
tradition: [culture]
statut: [validé | en_recherche]
---

# [NAME]

## SIGNIFICATION DU NOM
[Ce que le nom veut dire dans sa langue d'origine, évolutions, autres appellations traditionnelles]

## ORIGINE
[Provenance culturelle, filiation mythologique, première émergence dans la tradition]

## NATURE
[Ce qu'EST la créature ontologiquement — sa catégorie, son mode d'existence]

## HABITAT
[Où elle se trouve selon les traditions — précisions géographiques, écologiques, cosmologiques]

## DESCRIPTION
[Apparence physique selon les traditions — variations documentées signalées sans citer]

## POUVOIRS
[Capacités que la tradition lui attribue]

## FAIBLESSES
[Méthodes de protection, défense, destruction selon la tradition]

## COMPORTEMENT
[Motivations, patterns d'action, rapports aux humains]

## RÉCITS TRADITIONNELS
[Narration synthétique des légendes majeures, dans notre voix originale, SANS citation]

## VARIANTES RÉGIONALES
[Différences documentées — telle région dit X, telle autre dit Y]

## DISTINCTION AVEC L'IMAGINAIRE MODERNE
[Erreurs communes du cinéma/jeux/romans signalées clairement]

## ICONOGRAPHIE HISTORIQUE
[Représentations anciennes authentiques — décrites sans nommer les œuvres modernes qui les commentent]

## POUR ALLER PLUS LOIN
[Mention des GRANDES TRADITIONS TEXTUELLES où la créature apparaît — exemple : "Cette créature figure dans les principaux textes du corpus eddique." — sans nommer éditions particulières]
```

---

## NIVEAUX DE CERTITUDE (étiquetage interne)

Lors de la rédaction, chaque affirmation est mentalement classée :
- 🟢 **Attesté traditionnellement** : figure dans plusieurs sources anciennes convergentes
- 🟡 **Attesté avec variantes** : sources divergentes, nuances indiquées
- 🟠 **Interprétation tardive** : ajout médiéval ou renaissance, signalé dans le texte comme tel
- 🔴 **Tradition orale régionale** : signalé comme « dans certaines régions », « selon une variante locale »
- ⚫ **Invention moderne** : classé dans section « Distinction avec l'imaginaire moderne »

L'étiquetage ne figure PAS dans le texte publié, mais guide la formulation :
- 🟢 → « La tradition rapporte que… »
- 🟡 → « Selon les traditions, qui divergent sur ce point… »
- 🟠 → « Des élaborations ultérieures ajoutent que… »
- 🔴 → « Dans certaines régions, on rapporte que… »
- ⚫ → « Contrairement à une croyance diffusée par la fiction moderne… »

---

## PROCESSUS DE RÉDACTION POUR CHAQUE CRÉATURE

### 1. Phase recherche (interne, jamais publiée)
- Recherche web systématique via agents
- Compilation interne des faits vérifiés
- Identification des consensus traditionnels
- Marquage des controverses / variantes

### 2. Phase synthèse
- Organisation des faits par section de notre structure
- Pondération selon niveau de certitude
- Identification des inventions modernes à séparer

### 3. Phase rédaction originale
- Écriture en notre voix propre, sans reprise de formulation
- Aucune citation verbatim
- Aucun nom d'auteur contemporain
- Style littéraire soutenu, accessible, universel

### 4. Phase vérification
- Relecture factuelle
- Contrôle anti-plagiat intuitif (aucune phrase trop proche d'une source)
- Validation du ton universel (lisible par un Japonais, un Brésilien, un Finlandais)

### 5. Phase d'archivage
- Fichier .md individuel pour chaque créature
- Métadonnées YAML pour indexation future
- Mise à jour de l'index mondial

---

## VOIX NARRATIVE DU BESTIAIRE

### Ton
- Érudit sans être pédant
- Poétique sans être fantaisiste
- Grave sans être sombre inutilement
- Respectueux des traditions qu'il décrit

### Formules récurrentes (propriété stylistique du bestiaire)
- « La tradition rapporte que… »
- « On dit que… »
- « Il est dit que… »
- « Les récits les plus anciens affirment… »
- « Selon les traditions qui nous parviennent… »
- « Dans l'imaginaire des peuples qui connurent cette créature… »

### À bannir absolument
- Phrases commençant par « Selon [auteur moderne] »
- Phrases avec guillemets citationnels (« … »)
- Références bibliographiques dans le texte (« [Simek 1993] »)
- Toute formulation pouvant évoquer un article Wikipedia ou un manuel universitaire

### À cultiver
- Originalité stylistique reconnaissable
- Légères archaïsmes quand appropriés (sans excès)
- Rythme littéraire
- Images évocatrices (nées de la tradition, formulées par nous)

---

## RÈGLE D'OR

> Une créature est **entièrement** dans notre texte, ou elle n'y est pas.
> Aucun fragment textuel emprunté, aucun auteur cité, aucune bibliographie-apparat.
> Notre autorité se construit par l'exhaustivité des faits synthétisés et la beauté de leur formulation — pas par l'invocation d'autorités modernes.

Ce choix protège commercialement l'œuvre et la place dans la lignée des **grands ouvrages de synthèse** (type Encyclopædia Britannica classique, Larousse mythologique) qui présentent les faits sans apparat académique.
