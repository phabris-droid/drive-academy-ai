# Lot 3 — Transactionnel · Validation : tests de bout en bout

Prérequis humains : H2, H3 pour l'intégration réelle ; tout se développe sur `FakeGateway` avant.

- [ ] L3-01 `reservation-paiement` — Moteur de créneaux et holds avec expiration. `POST /v1/bookings/holds`
- [ ] L3-02 `reservation-paiement` — Création de réservation, prévention atomique des conflits. **CA-04**
- [ ] L3-03 `reservation-paiement` — Machine à états, modes immédiat / sur demande avec expiration.
- [ ] L3-04 `reservation-paiement` — Prix détaillé, politique d'annulation figée, intent de paiement. `POST /v1/payments/intents`
- [ ] L3-05 `reservation-paiement` — Webhook signé, idempotent, anti-rejeu. **CA-05** `POST /webhooks/payments`
- [ ] L3-06 `reservation-paiement` — Annulation, report (accord + disponibilité), remboursements partiels/totaux. **CA-06**
- [ ] L3-07 `reservation-paiement` — Chargebacks, échecs, doublons, reversements, rapprochement comptable.
- [ ] L3-08 `backend-laravel` — Séance : code de début/fin, validation manuelle contrôlée, compte rendu. `POST /sessions/{id}/complete`
- [ ] L3-09 `backend-laravel` — Avis vérifiés, détection de faux avis, contestation. **CA-07**
- [ ] L3-10 `backend-laravel` — Signalements, incidents, absences. `POST /v1/reports`
- [ ] L3-11 `backend-laravel` — Mineurs : âge minimum, consentement du représentant légal (règles H2).
- [ ] L3-12 `backend-laravel` — Notifications push/SMS/e-mail selon consentement.
- [ ] L3-13 `reservation-paiement` — Abonnements apprenants et professionnels (offres CDC §9, prix configurables). Distinguer prestations physiques et abonnements numériques (règles des stores).
- [ ] L3-14 `admin-filament` — Litiges, remboursements selon permission, modération des avis.
- [ ] L3-15 `mobile-flutter` — Tunnel de réservation complet §7.2 + paiement + suivi + évaluation. **CA-10**
- [ ] L3-16 `mobile-flutter` — Côté moniteur : demandes, acceptation, code de séance, compte rendu.
- [ ] L3-99 `qa-tests` + `conformite-securite` — CA-03 à CA-07 verts, test E2E du parcours complet.
