# Lot 5 — Enrichissement · Validation : qualité et sécurité

Prérequis humain : H9 pour l'IA ; validation humaine de chaque scénario avant publication.

## DRIVE SIM 2D (CDC §5)
- [ ] L5-01 `simulation-2d` — JSON Schema des scénarios + moteur d'évaluation déterministe.
- [ ] L5-02 `simulation-2d` — Rendu 2D : priorités, ronds-points, passages piétons, feux, insertion, dépassement, visibilité. **CA-09**
- [ ] L5-03 `backend-laravel` — API scénarios et sessions de simulation ; admin de publication.
- [ ] L5-04 `contenu-pedagogique` — Brouillons de 15 scénarios couvrant les 7 thèmes.

## DRIVE COACH (CDC §6)
- [ ] L5-10 `coach-ia` — Service, RAG sur corpus publié, citations obligatoires.
- [ ] L5-11 `coach-ia` — Garde-fous, quotas, coupe-circuit, journalisation, evals en CI.
- [ ] L5-12 `coach-ia` — Planificateur de révision (compétences faibles + comptes rendus sim).
- [ ] L5-13 `coach-ia` — Agents veille réglementaire et qualité des contenus → propositions en revue dans Filament.
- [ ] L5-14 `mobile-flutter` — Écran coach, plan de révision, voix facultative.

## Entreprise (V2)
- [ ] L5-20 `backend-laravel` + `admin-filament` — Parcours flottes, attribution de formations, rapports autorisés.

- [ ] L5-99 `qa-tests` + `conformite-securite` — CA-09, evals IA, revue garde-fous.
