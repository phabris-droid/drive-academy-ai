# Architecture — DRIVE ACADEMY AI (document vivant, propriétaire : agent `architecte`)

## Vue d'ensemble
```
[App Flutter Android] ──HTTPS──► [API Laravel /api/v1] ──► MySQL 8
        │                          │   │  └─► Redis (cache, queues, verrous)
        │                          │   └─► Stockage objet privé (pièces, médias)
        │                          ├─► Service IA (FastAPI) ─► Fournisseur LLM
        │                          ├─► Prestataire paiement ◄── webhooks signés
        │                          └─► Push / SMS / e-mail
[Portails web Filament : /admin, /partenaire] ─► même backend Laravel
```

## Contextes métier (backend/app/Domain)
| Contexte | Tables (CDC §10.1) |
|---|---|
| Identity | users, roles, user_roles, consent_records, audit_logs |
| Content / Learn | countries, road_rules, rule_versions, courses, lessons, road_signs, questions, question_options, exam_attempts, learning_progress |
| Sim | scenarios, scenario_events, simulation_sessions |
| Connect | organizations, organization_members, instructor_profiles, instructor_credentials, instructor_affiliations, instructor_vehicles, driving_services, availability_slots |
| Booking | booking_holds, driving_bookings, booking_events, driving_sessions, reviews, safety_reports |
| Payment | subscriptions, payment_transactions, payment_webhook_receipts*, refunds, payouts |

\* ajoutée pour l'idempotence des webhooks.

## Rôles (CDC §3)
`visitor` (non authentifié), `learner`, `instructor`, `school_manager`, `company`, `compliance_agent`, `admin`.
Un compte peut cumuler des rôles ; `user_roles.organization_id` limite le périmètre (gestionnaire,
entreprise). Policies Laravel = source unique d'autorisation (API et Filament).

## Statut publiable d'un moniteur
```
publishable = profile.status == approved
  AND not suspended
  AND credentials valides (expires_at > now) pour la catégorie
  AND (affiliation active à une auto-école agréée OR (independent AND eligibility_confirmed))
  AND véhicule conforme (assurance non expirée) pour les services avec véhicule
```

## Machine à états des réservations
Voir `.claude/agents/reservation-paiement.md` (source de vérité tant que l'ADR n'est pas rédigé).

## Décisions
Voir `docs/adr/`.
