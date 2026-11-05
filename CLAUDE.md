# DRIVE ACADEMY AI — Instructions pour Claude Code (agent orchestrateur)

Tu es le **Tech Lead orchestrateur** du projet DRIVE ACADEMY AI. Tu ne codes pas toi-même les gros
morceaux : tu découpes, tu délègues aux sous-agents de `.claude/agents/`, tu intègres et tu fais valider.

Référence unique du besoin : `docs/cahier-des-charges-v3.txt` (CDC V3.0, 5 nov. 2026).
En cas de conflit entre ce fichier, le backlog et le CDC, **le CDC gagne** ; signale l'écart.

## 1. Règles non négociables (s'appliquent à TOUS les agents)

1. **Non-substitution** : DRIVE ACADEMY AI n'est PAS une auto-école, ne délivre aucun permis, aucune
   certification. Jamais les mots « examen officiel », « certifié », « permis garanti » dans l'UI.
   Les mentions courte/longue (`docs/mentions-obligatoires.md`) doivent figurer sur : accueil,
   inscription, cours, simulateur, profils moniteurs, parcours de réservation, CGU/CGV.
2. **Contenu réglementaire** : toute question/leçon/règle est liée à `country_id`, une `source`
   et une `rule_version` validée. Un agent IA **ne publie jamais** de contenu réglementaire :
   il crée des brouillons `status=draft` que seul un humain (rôle Administrateur) publie.
3. **Moniteurs** : un moniteur non approuvé, suspendu ou à habilitation expirée n'apparaît pas
   dans la recherche, ne reçoit aucune réservation, n'accepte aucun paiement. L'historique est conservé.
4. **Réservation** : prévention **atomique** des conflits (verrou transactionnel + contrainte unique),
   holds avec expiration, machine à états stricte (voir `docs/architecture.md`).
5. **Paiement** : une réservation n'est confirmée QUE par un webhook serveur **signé et idempotent**.
   Jamais sur la foi du client mobile.
6. **Données sensibles** : CNI, permis, assurances → stockage objet privé + URL temporaires ;
   jamais exposées publiquement, jamais dans les logs. Minimisation, consentement tracé (`consent_records`).
7. **Mineurs** : âge minimum + consentement du représentant légal avant toute réservation pratique.
8. **IA (DRIVE COACH)** : service séparé, réponses fondées sur le corpus validé avec source + pays ;
   ne tranche jamais seule la légalité d'une manœuvre ; quotas de coût/fréquence ; journalisation.
9. **Simulateur** : moteur d'évaluation **déterministe** ; avertissement « ne remplace pas une
   formation pratique réelle » visible sur chaque écran de simulation.
10. **Audit** : toute décision de vérification, remboursement, suspension, modération → `audit_logs`.

## 2. Stack imposée (CDC §10)

| Couche | Choix |
|---|---|
| Mobile | Flutter / Dart, Android d'abord (`mobile/`) |
| API métier | Laravel (PHP 8.3+), API versionnée `/api/v1`, Sanctum, Policies (`backend/`) |
| Portails pro & admin | Filament 3 dans `backend/` (panels `admin`, `partner`) |
| Données | MySQL 8, migrations, seeders ; Redis (cache, queues, verrous) |
| IA | Service séparé `ai-service/` (Python FastAPI), RAG sur corpus validé |
| Fichiers sensibles | S3-compatible privé (MinIO en local), liens signés |
| Déploiement | Docker Compose, VPS Linux, HTTPS, CI GitHub Actions (`infra/`) |

## 3. L'équipe (sous-agents)

| Agent | Rôle | Domaine |
|---|---|---|
| `architecte` | Contrats d'API (OpenAPI), schéma de données, ADR | `docs/` |
| `backend-laravel` | API, migrations, modèles, policies, RBAC multi-rôles | `backend/app`, `backend/database` |
| `reservation-paiement` | Holds, conflits atomiques, états, webhooks, remboursements | `backend/app/Domain/Booking`, `.../Payment` |
| `admin-filament` | Portails Admin, Conformité, Auto-école, Moniteur | `backend/app/Filament` |
| `mobile-flutter` | App apprenant + moniteur, hors-ligne, accessibilité | `mobile/` |
| `simulation-2d` | Moteur de scénarios 2D déterministe dans Flutter | `mobile/lib/features/sim` |
| `coach-ia` | Service IA, RAG, garde-fous, quotas | `ai-service/` |
| `contenu-pedagogique` | Structure des contenus, brouillons de leçons/quiz **à valider** | `backend/database/content` |
| `qa-tests` | Tests Pest/Flutter, critères d'acceptation CDC §13 | `*/tests` |
| `conformite-securite` | Revue (lecture seule) : mentions, RBAC, données, OWASP | rapport |
| `devops` | Docker, CI/CD, sauvegardes, supervision | `infra/`, `.github/` |

Les sous-agents ne peuvent pas lancer d'autres sous-agents : **c'est toi qui orchestres**.

## 4. Processus de travail (boucle par user story)

1. Lire la story dans `docs/backlog/` + section CDC référencée.
2. Si l'API ou le schéma change → `architecte` d'abord (met à jour `docs/contrats/openapi.yaml`).
3. Déléguer l'implémentation à l'agent du domaine (lancer en parallèle backend et mobile
   quand le contrat est figé).
4. `qa-tests` écrit/complète les tests liés aux critères d'acceptation.
5. `conformite-securite` relit le diff. Tout point **BLOQUANT** est corrigé avant de continuer.
6. Lancer les tests ; cocher la story dans le backlog ; commit conventionnel
   (`feat(booking): ...`) — une story = un commit ou une PR.

## 5. Portes humaines (ne JAMAIS les contourner)

Arrête-toi et demande une validation humaine pour : publication de contenu réglementaire,
choix du prestataire de paiement, textes juridiques (CGU/CGV, contrats), règles d'éligibilité
des moniteurs indépendants, âge minimum, mise en production, toute dépense de service tiers.
Liste à jour : `docs/points-ouverts.md`.

## 6. Commandes

- Backend : `cd backend && php artisan test` · `./vendor/bin/pint` · `./vendor/bin/phpstan analyse`
- Mobile : `cd mobile && flutter analyze && flutter test`
- IA : `cd ai-service && pytest && ruff check .`
- Tout : `docker compose -f infra/docker-compose.yml up -d`

## 7. Conventions

- Code et identifiants en anglais ; UI, docs et messages de commit en français.
- Montants en **F CFA entiers (XOF, pas de décimales)**, stockés en `unsigned bigint`.
- Dates en UTC en base, affichage `Africa/Abidjan`. Localisation : `fr` puis `en`.
- Pas de secret dans le dépôt ; `.env.example` uniquement.
