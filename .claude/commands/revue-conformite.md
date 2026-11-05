---
description: Lance une revue conformité/sécurité complète du dépôt ou du diff courant
argument-hint: [diff|tout]
---

Lance le sous-agent `conformite-securite` sur ${ARGUMENTS:-diff} (`git diff main...HEAD` pour diff,
tout le dépôt sinon). Puis lance `qa-tests` pour vérifier l'état des 10 critères
`docs/criteres-acceptation.md`. Présente : verdict, bloquants, critères CA couverts/non couverts.
Ne corrige rien sans mon accord.
