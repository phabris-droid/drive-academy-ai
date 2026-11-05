# Lot 1 — Socle (6–10 semaines) · Validation : tests pédagogiques

Prérequis humain : H6. Contenus publiés seulement après H4 (sinon `[DEMO]`).

## Infrastructure
- [ ] L1-00 `devops` + tous — Initialisation monorepo (`/demarrage`).

## Comptes et droits (CDC §3)
- [ ] L1-01 `backend-laravel` — Inscription/connexion e-mail ou téléphone (OTP), Sanctum, rate limiting.
- [ ] L1-02 `backend-laravel` — Rôles multiples + périmètre organisation, Policies de base.
- [ ] L1-03 `backend-laravel` — Consentements (`consent_records`), export et suppression de compte.
- [ ] L1-04 `admin-filament` — Panel admin avec MFA, gestion des rôles, journal d'audit.

## DRIVE LEARN (CDC §4)
- [ ] L1-10 `backend-laravel` — Pays, règles, versions de règles ; contenu versionné par pays. **CA-02**
- [ ] L1-11 `backend-laravel` — Cours/leçons (objectif, prérequis, durée, contenu, exercice, correction, source, date de validation).
- [ ] L1-12 `backend-laravel` — Panneaux : recherche, filtres, sens, cas d'usage, erreurs fréquentes.
- [ ] L1-13 `backend-laravel` — Quiz : tirage par thème/difficulté, correction, historique, répétition espacée.
- [ ] L1-14 `backend-laravel` — Examens blancs paramétrables par pays (paramètres = hypothèses tant que H7 ouvert).
- [ ] L1-15 `backend-laravel` — Progression : compétences, tentatives, erreurs récurrentes, objectifs hebdo. **CA-01**
- [ ] L1-16 `admin-filament` — Workflow catalogue draft → in_review → published (publication humaine uniquement).
- [ ] L1-17 `contenu-pedagogique` — Brouillons de leçons/questions/panneaux et seeders `[DEMO]`.

## Mobile
- [ ] L1-20 `mobile-flutter` — Auth, onboarding (objectifs, prérequis), mention courte. **CA-10**
- [ ] L1-21 `mobile-flutter` — Cours, leçons, panneaux, audio facultatif.
- [ ] L1-22 `mobile-flutter` — Quiz et examens blancs, synchronisation hors-ligne. **CA-01**
- [ ] L1-23 `mobile-flutter` — Tableau de progression.

## Clôture
- [ ] L1-99 `qa-tests` + `conformite-securite` — Revue de lot, CA-01, CA-02, CA-10 (parties lot 1) verts.
