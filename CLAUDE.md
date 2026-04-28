# CLAUDE.md — Règles absolues du projet Bestiaire Mondial

Ce fichier est lu automatiquement par Claude Code à chaque démarrage de session.
Ces règles s'appliquent à toutes les sessions, automatiques ou manuelles.

## RÈGLE N°1 — ZÉRO RECHERCHE WEB

**N'utilise JAMAIS WebSearch ni WebFetch dans ce projet.**

Les recherches web provoquent des pauses silencieuses de 60-90 secondes qui entraînent des "Stream idle timeout" et font échouer la session entière. Rien n'est sauvegardé, rien n'est commité.

Rédige uniquement depuis ta connaissance du folklore et de la mythologie.

## RÈGLE N°2 — CRÉATURES UNIQUEMENT. AUCUN DIEU, AUCUN HÉROS.

C'est la règle la plus importante. Le Bestiaire Mondial est un **bestiaire** : il recense des créatures, pas des panthéons.

**VALIDE — écrire ces entrées :**
- Monstres et bêtes fabuleuses : dragon, loup-garou, sirène, minotaure, chimère, basilic...
- Esprits et entités surnaturelles : fantômes, lutins, fées, djinns, yokai, esprits de la nature...
- Créatures hybrides : centaure, harpie, sphinx, griffon, manticore...
- Êtres du folklore anonyme : tout ce que les gens racontent dans la tradition orale

**INVALIDE — ne jamais écrire ces entrées :**
- Dieux et déesses : Zeus, Odin, Hecate, Ægir, Osiris, Shiva → **REFUSER**
- Héros légendaires humains : Achille, Hercule, Siegfried, Persée, Ulysse → **REFUSER**
- Titans et primordiaux divins : Cronos, Prométhée, les Titans grecs → **REFUSER**
- Personnifications abstraites : Léthé, Thanatos, Hypnos (quand ce sont des concepts divins) → **REFUSER**

**En cas de doute :** est-ce qu'un enfant de 10 ans appellerait ça "un monstre" ? Si oui → écrire. Si c'est un dieu ou un héros → passer à la suivante.

## RÈGLE N°3 — DROITS ET AUTHENTICITÉ FOLKLORIQUE

N'inclure que des créatures du folklore anonyme préexistant à tout auteur identifiable.

**Invalides :** Lorelei (Brentano 1801), Erlkönig (Goethe 1782).
**Valides :** Drache, Nixe, Werwolf, Krampus, Perchta.

En cas de doute, passer à la suivante.

## RÈGLE N°4 — UNE SEULE CRÉATURE PAR SESSION

Rédige exactement **1 créature** par session, puis commite et pushe. Stop.

**Longueur cible : 100-130 lignes.** Au-delà de 150 lignes → timeout garanti.

## RÈGLE N°5 — PROCÉDURE DE SESSION

1. Identifier la tradition active dans "TRADITION ACTIVE" ci-dessous
2. `ls <tradition>/creatures/` — voir ce qui existe déjà
3. `cat <tradition>/INDEX.md` — trouver la première créature manquante (pas un dieu, pas un héros)
4. Rédiger 100-130 lignes depuis ta connaissance (SANS WebSearch)
5. Sauvegarder dans `<tradition>/creatures/<Nom>.md`
6. `git add` + `git -c commit.gpgsign=false commit` + `git push origin main`
7. Stop.

## RÈGLE N°6 — STRUCTURE OBLIGATOIRE

Frontmatter YAML : nom_principal, nom_original, variantes_linguistiques, categorie, tradition, sous_tradition, statut, date_rédaction.

Sections dans l'ordre : SIGNIFICATION DU NOM / ORIGINE / NATURE / HABITAT / DESCRIPTION / POUVOIRS / FAIBLESSES / COMPORTEMENT / RÉCITS TRADITIONNELS / VARIANTES RÉGIONALES / DISTINCTION AVEC L'IMAGINAIRE MODERNE / ICONOGRAPHIE HISTORIQUE / POUR ALLER PLUS LOIN / PROMPT IMAGE (en anglais, style medieval bestiary).

## RÈGLE N°7 — CONVENTION DE NOMMAGE

ä→ae, ö→oe, ü→ue, ß→ss, espaces→_, accents supprimés du nom de fichier.

## RÈGLE N°8 — GIT

```bash
git add <tradition>/creatures/<Fichier>.md
git -c commit.gpgsign=false commit -m "Cron auto : +1 créature <tradition> — <Nom>"
git push origin main
```

---

## TRADITION ACTIVE ET ORDRE DE PROGRESSION

Traiter les traditions dans cet ordre, une créature par session :

### En cours : 03_Germanique (99 créatures)
Passer en Phase 3 (créatures régionales mineures attestées). Exemples :
Hüterich, Pestjungfrau, Schimmelreiter (légende firsonne), Nöck (variante allemande), Sträggele, Schrat variantes régionales, Erdmännlein variantes, Spuk, Irrsal, Mahr variantes régionales.

### Suivante : 06_Mesopotamien (0 créatures)
Créatures valides : Lamassu, Anzû, Humbaba, Kur, Asag, Mushussu, Pazuzu, Utukku, Gallu, Lamashtu, Lilitu, Apkallu, Sirrush...

### Puis : 07_Egyptien (0 créatures)
Créatures valides : Ammout, Apopis, Aker, Bennou, Griffon égyptien, Medjed, Seth (aspect animal), Sphinx égyptien, Serpopard...

### Puis toutes les traditions à 0 créature, dans l'ordre numérique.

### Objectif final
~50-150 créatures par tradition × 40 traditions = 2000-6000 entrées total.
