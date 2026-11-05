---
description: Exécute un lot de la roadmap CDC §14 (ex. /lot 1) en orchestrant les sous-agents
argument-hint: <numéro du lot 1-6>
---

Exécute le **lot $ARGUMENTS** de DRIVE ACADEMY AI.

1. Lis `CLAUDE.md`, `docs/backlog/lot-$ARGUMENTS.md` et `docs/points-ouverts.md`.
   Si une porte humaine listée comme prérequis du lot n'est pas levée, **arrête-toi** et liste
   ce qui manque (sauf travaux préparatoires explicitement autorisés dans le backlog).
2. Crée une liste de tâches (une par story non cochée), dans l'ordre des dépendances.
3. Pour chaque story, applique la boucle de `CLAUDE.md §4` :
   `architecte` (si contrat/schéma) → agent(s) du domaine (en parallèle quand indépendants)
   → `qa-tests` → `conformite-securite` → corrections → tests verts → cocher la story → commit.
4. En fin de lot : `conformite-securite` en revue globale, exécution de toutes les suites de tests,
   mise à jour de `docs/journal-de-bord.md` (fait, reste, risques, décisions, portes humaines atteintes).
5. Termine par un résumé court : stories livrées, tests, verdict conformité, validations humaines attendues.
