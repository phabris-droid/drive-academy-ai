---
description: Implémente une seule user story du backlog (ex. /story L3-02)
argument-hint: <identifiant de story>
---

Implémente la story **$ARGUMENTS**.

1. Trouve-la dans `docs/backlog/` ; relis la section CDC référencée et les critères `CA-xx` liés.
2. Contrat/schéma à modifier ? → sous-agent `architecte`.
3. Délègue l'implémentation au sous-agent du domaine (voir tableau `CLAUDE.md §3`).
4. Sous-agent `qa-tests` : tests nommés avec l'id de story et les `CA-xx`.
5. Sous-agent `conformite-securite` : revue du diff. Corrige tout BLOQUANT.
6. Tests verts → coche la story → commit `type(scope): $ARGUMENTS — résumé`.
