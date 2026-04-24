# CLAUDE.md — Règles absolues du projet Bestiaire Mondial

Ce fichier est lu automatiquement par Claude Code à chaque démarrage de session.
Ces règles s'appliquent à toutes les sessions, automatiques ou manuelles.

## RÈGLE N°1 — ZÉRO RECHERCHE WEB

**N'utilise JAMAIS WebSearch ni WebFetch dans ce projet.**

Les recherches web provoquent des pauses silencieuses de 60-90 secondes qui entraînent des "Stream idle timeout" et font échouer la session entière. Rien n'est sauvegardé, rien n'est commité.

Rédige uniquement depuis ta connaissance du folklore et de la mythologie. Pour les créatures germaniques, nordiques, celtiques, slaves et gréco-romaines, ta connaissance intégrée est suffisante et fiable.

## RÈGLE N°2 — UNE SEULE CRÉATURE PAR SESSION

Rédige exactement **1 créature** par session, puis commite et pushe. Ensuite arrête-toi.

Ne tente jamais d'en faire 2 ou 3. Une seule créature de qualité vaut mieux que deux timeouts.

**Longueur cible : 100-130 lignes.** Sections concises mais complètes. Au-delà de 150 lignes le stream timeout survient systématiquement. Priorité à la densité d'information, pas à la longueur.

## RÈGLE N°3 — PROCÉDURE DE SESSION

1. `ls /home/user/Bestiaire_Mondial/03_Germanique/creatures/` — voir ce qui existe
2. `cat /home/user/Bestiaire_Mondial/03_Germanique/INDEX.md` — trouver la première manquante
3. Rédiger le fichier de 100-130 lignes depuis ta connaissance (SANS WebSearch)
4. Sauvegarder dans `/home/user/Bestiaire_Mondial/03_Germanique/creatures/[Nom].md`
5. `git add` + `git commit` + `git push origin main`
6. Stop.

## RÈGLE N°4 — STRUCTURE OBLIGATOIRE

Chaque fichier doit contenir dans l'ordre :
- Frontmatter YAML (nom_principal, nom_original, variantes_linguistiques, categorie, tradition, sous_tradition, statut, date_rédaction)
- `# NOM EN MAJUSCULES`
- `## SIGNIFICATION DU NOM`
- `## ORIGINE`
- `## NATURE`
- `## HABITAT`
- `## DESCRIPTION`
- `## POUVOIRS`
- `## FAIBLESSES`
- `## COMPORTEMENT`
- `## RÉCITS TRADITIONNELS`
- `## VARIANTES RÉGIONALES`
- `## DISTINCTION AVEC L'IMAGINAIRE MODERNE`
- `## ICONOGRAPHIE HISTORIQUE`
- `## POUR ALLER PLUS LOIN`
- `## PROMPT IMAGE` ← obligatoire, en anglais, style "Medieval bestiary illumination"

## RÈGLE N°5 — CONVENTION DE NOMMAGE DES FICHIERS

- ä → ae (Hämmerling → Haemmerling)
- ö → oe (Mönch → Moench)
- ü → ue (Füchslein → Fuechslein)
- ß → ss
- espaces → _
- accents et caractères spéciaux supprimés

## RÈGLE N°6 — GIT

Le git est configuré avec PAT dans `.git/config`. GPG signing est désactivé. Ne touche pas à `.git/config`.

Commande de commit :
```bash
cd /home/user/Bestiaire_Mondial
git add 03_Germanique/creatures/[Fichier].md
git commit -m "Cron auto : +1 créature 03_Germanique — [Nom]"
git push origin main
```

## TRADITION ACTIVE : 03_Germanique Phase 2

Créatures prioritaires restantes (vérifier lesquelles manquent dans creatures/) :
- Bergmönch → Bergmoench.md
- Schnabelpercht → Schnabelpercht.md
- Silberfuß → Silberfuss.md
- Pilatusdrache → Pilatusdrache.md
- Stollenwurm → Stollenwurm.md
- Wiedergänger → Wiedergaenger.md
- Hakelberg → Hakelberg.md
- Stoete Seute Lieven → Stoete_Seute_Lieven.md
