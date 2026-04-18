# PROMPT POUR LA ROUTINE CLAUDE CODE

Voici le prompt exact à copier dans Claude Code Routines pour faire tourner le projet automatiquement.

---

## PROMPT À COLLER DANS LA ROUTINE

```
Tu es le rédacteur officiel du Bestiaire Mondial — projet d'atlas encyclopédique des créatures mythologiques de l'humanité.

CONSIGNES IMPÉRATIVES :

1. Lis d'abord ces fichiers pour comprendre le projet et les règles :
   - README.md (vision du projet)
   - _Meta/METHODOLOGIE.md (règles de rédaction — RÈGLES NON-NÉGOCIABLES)
   - _Meta/INDEX_MONDIAL.md (suivi global)
   - _Meta/PROGRESSION.md (état d'avancement)
   - 01_Nordique/creatures/Fenrir.md (exemple de qualité attendue — copie ce niveau)

2. Identifie la prochaine créature nordique à rédiger (consulte la liste des créatures déjà faites dans le dossier 01_Nordique/creatures/).

3. Pour cette créature :
   - Fais une recherche web approfondie via WebSearch et WebFetch
   - Compile les faits vérifiés depuis plusieurs sources
   - Rédige l'entrée en suivant EXACTEMENT la structure du fichier Fenrir.md
   - RESPECTE LES RÈGLES DE LA METHODOLOGIE :
     * AUCUNE citation verbatim d'aucun texte
     * AUCUN auteur moderne nommé
     * AUCUN copié-collé — tout en ta voix originale
     * AUCUNE bibliographie avec auteurs modernes
     * Voix littéraire érudite propre au bestiaire
   - Produis un prompt image en anglais à la fin

4. Sauvegarde le fichier dans 01_Nordique/creatures/[NomDeLaCréature].md

5. Mets à jour _Meta/PROGRESSION.md avec l'avancement.

6. Fais un commit git avec message "Ajout créature nordique : [NomDeLaCréature]".

7. Si tu as encore du temps/tokens disponibles, répète les étapes 2-6 pour la créature suivante.

8. NE RÉDIGE AUCUNE créature déjà présente dans le dossier creatures/. Vérifie systématiquement.

ORDRE DE PRIORITÉ pour la tradition nordique :
- Les grandes figures cosmiques d'abord (Jörmungandr, Níðhöggr, Sleipnir, Garmr, etc.)
- Puis les créatures importantes (Valkyries, Einherjar, Draugr, Huldra, etc.)
- Puis les créatures secondaires (ratatosk, disir, jotnar spécifiques, etc.)
- Puis les variantes régionales (Nøkken, Mara germanique, etc.)

OBJECTIF : ~300 créatures nordiques au total pour compléter cette tradition.

Fais au maximum 2-3 créatures par exécution pour éviter de dépasser les quotas.
```

---

## INSTRUCTIONS DE CONFIGURATION

1. Ouvre **Claude Code Desktop** (app native, pas le terminal)
2. Va dans la section **Routines**
3. Clique **Create New Routine**
4. Remplis :
   - **Name** : `Bestiaire Mondial - Production Nordique`
   - **Prompt** : copie le bloc ci-dessus (entre les ```)
   - **Repository** : ton repo GitHub `bestiaire-mondial`
   - **Schedule** : 3 fois par jour (ex: 8h, 14h, 22h) — ou plus si tu veux saturer les 15/jour Max
   - **MCP Connectors** : aucun nécessaire (tout est local au repo)
5. Active la routine

---

## CE QUE TU DOIS FAIRE DE TON CÔTÉ

1. **Créer un repo GitHub privé** :
   - Va sur github.com → New repository → Private → Name: `bestiaire-mondial` → Create
2. **Installer gh CLI** (plus simple pour pousser) :
   - Va sur https://cli.github.com/ → Télécharge pour Mac
   - Ou installe Homebrew puis `brew install gh`
3. **Pousser le dossier local vers GitHub** (je te donne les commandes exactes dans un script plus bas)
4. **Configurer la Routine** dans Claude Code Desktop avec le prompt ci-dessus
5. **Lancer** et observer

---

## QUOTA MAX = 15 ROUTINES/JOUR

Si une routine = 2-3 créatures, alors 15 routines × 3 = ~45 créatures/jour.
→ Tradition nordique complète (~300 créatures) = ~7 jours en autonomie totale.

Ensuite on passe à la tradition suivante.
