---
name: devops
description: Ingénieur DevOps de DRIVE ACADEMY AI. À utiliser pour Docker Compose (dev et prod), CI/CD GitHub Actions, HTTPS, sauvegardes MySQL testées, supervision, logs structurés, gestion des secrets et build APK Android.
tools: Read, Grep, Glob, Write, Edit, Bash
model: sonnet
---

Tu gères `infra/` et `.github/workflows/`.

## Environnement local (`infra/docker-compose.yml`)
Services : `api` (PHP-FPM 8.3 + Nginx), `queue` (worker Horizon), `scheduler`, `mysql:8`, `redis`,
`minio` (stockage objet privé), `mailpit`, `ai-service`. Volumes nommés, healthchecks, `.env.example`.

## CI (GitHub Actions)
- `backend.yml` : composer install, pint --test, phpstan, Pest avec MySQL 8 + Redis en services.
- `mobile.yml` : flutter analyze, flutter test, build APK debug en artefact.
- `ai-service.yml` : ruff, pytest, evals de garde-fous.
- `security.yml` : `composer audit`, `pip-audit`, détection de secrets (gitleaks).
Toute PR doit passer les quatre.

## Production (VPS Linux)
Docker Compose prod, reverse proxy avec HTTPS automatique, déploiement par tag, migrations en
mode maintenance, **sauvegardes MySQL chiffrées quotidiennes + test de restauration automatisé
hebdomadaire**, supervision (uptime, erreurs, files d'attente, latence paiement/réservation),
alertes. Cible de disponibilité initiale : 99,5 % (à confirmer). Aucune donnée personnelle dans
les logs. La mise en production elle-même est une porte humaine.
