# Lot 2 — DRIVE CONNECT (partie 1 des 8–14 semaines) · Validation : contrôle des habilitations

Prérequis humain : H1 pour publier des indépendants (le code de blocage se développe sans attendre).

- [ ] L2-01 `architecte` — Modèle organisations, affiliations, habilitations, véhicules ; règle `publishable`.
- [ ] L2-02 `backend-laravel` — Compte professionnel, déclaration de statut (rattaché / indépendant).
- [ ] L2-03 `backend-laravel` — Téléversement de pièces (stockage privé, type/taille, URL signées). `POST /v1/instructor/credentials`
- [ ] L2-04 `admin-filament` — File de vérification, décision motivée, approbation conditionnelle, recours, audit. `GET/POST /admin/verifications`
- [ ] L2-05 `backend-laravel` — Suivi des expirations (job quotidien, alerte J-30), suspension automatique. **CA-08**
- [ ] L2-06 `admin-filament` — Portail auto-école : rattachements, moniteurs, véhicules, élèves autorisés.
- [ ] L2-07 `backend-laravel` — Fiche moniteur publique (sans données sensibles, badge contextualisé).
- [ ] L2-08 `backend-laravel` — Recherche : filtres CDC §7.1, classement explicable, sponsorisé signalé, pagination. **CA-03**
- [ ] L2-09 `backend-laravel` — Services, tarifs, disponibilités, durée et temps de déplacement. `PATCH /instructor/availability`
- [ ] L2-10 `mobile-flutter` — Recherche, filtres, fiche moniteur (mention courte). **CA-10**
- [ ] L2-11 `mobile-flutter` — Espace moniteur : dossier, statut de vérification, calendrier.
- [ ] L2-99 `qa-tests` + `conformite-securite` — CA-03 (recherche), CA-08 verts.
