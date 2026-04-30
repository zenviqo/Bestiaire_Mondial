# BESTIAIRE MONDIAL — Édition Premium (Stratégie A)

PDF de luxe, ~350 créatures emblématiques sélectionnées sur 40 traditions.

## Pipeline

```
SELECTION.md (curation manuelle)
       ↓
build.sh (concat ordonnée + front matter)
       ↓
Bestiaire_Mondial_Premium.md (markdown unique)
       ↓ pandoc
Bestiaire_Mondial_Premium.pdf
```

## Structure du livre cible

1. **Frontispice** + page de titre
2. **Préface** — La vision : un atlas mondial des créatures de l'humanité
3. **Comment lire ce bestiaire** — méthodologie, structure d'une entrée, niveaux de certitude
4. **Carte mondiale des traditions** (à produire en visuel)
5. **40 chapitres** (un par tradition), chaque chapitre = intro + 8 à 15 créatures
6. **Glossaire** des termes récurrents
7. **Index** alphabétique de toutes les créatures
8. **Bibliographie des traditions textuelles** (sans nommer d'auteur moderne)
9. **Colophon**

## Quotas par tradition

| Tier | Traditions | Quota |
|---|---|---:|
| S (≥100) | 01, 02, 03, 04, 05 | 15 |
| A (40+) | 09, 11, 12, 14, 21 | 12 |
| B (20-29) | 13, 15-18, 20, 22, 24-28, 31-32, 35-37, 39 | 10 |
| C (10-19) | 06-08, 10, 19, 23, 29, 30, 33-34, 38, 40 | 8 |

Total cible : **75 + 60 + 170 + 88 = 393 entrées**

## Tâches

- [x] Plan structure
- [x] Sélection curated (`SELECTION.md`)
- [x] Script de build (`build.sh`)
- [x] Front matter (`00_*.md` à `99_*.md`)
- [ ] Génération images via PROMPT IMAGE de chaque entrée
- [ ] Mise en page InDesign / template Pandoc avec CSS de luxe
- [ ] Couverture
- [ ] Quatrième de couverture
- [ ] ISBN + dépôt légal
