---
description: Initialise le monorepo (squelettes Laravel, Filament, Flutter, FastAPI, Docker, CI)
---

Initialise le projet (story L1-00) :

1. Sous-agent `devops` : `infra/docker-compose.yml`, `.env.example`, workflows CI.
2. Sous-agent `backend-laravel` : `composer create-project laravel/laravel backend` (si `backend/`
   ne contient que le README), Sanctum, Pest, Larastan, Pint ; structure `app/Domain/*` ; enums de rôles.
3. Sous-agent `admin-filament` : installation Filament 3, panels `admin` et `partner`, MFA admin.
4. Sous-agent `mobile-flutter` : `flutter create --org ci.driveacademy --platforms android mobile`,
   Riverpod, go_router, dio, drift, l10n fr/en, `DisclaimerBanner`.
5. Sous-agent `coach-ia` : squelette FastAPI, `FakeProvider`, endpoint `/health`, pytest.
6. Vérifie que toutes les commandes de `CLAUDE.md §6` tournent, puis commit `chore: initialisation monorepo`.
