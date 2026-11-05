# Critères d'acceptation prioritaires (CDC §13)

Chaque critère doit être couvert par au moins un test automatisé dont le nom contient son identifiant.

| Id | Critère (CDC §13) | Test attendu | Agent | Lot |
|---|---|---|---|---|
| CA-01 | Un apprenant peut compléter une leçon et retrouver sa progression après reconnexion | Pest : POST progression → logout → login → GET /me/progress identique. Flutter : progression hors-ligne synchronisée | backend-laravel, mobile-flutter | 1 |
| CA-02 | Chaque question réglementaire est liée à un pays, une source et une version validée | Migration NOT NULL + test : création sans `country_id`/`source`/`rule_version_id` refusée ; GET /questions ne renvoie que `published` | backend-laravel | 1 |
| CA-03 | Un moniteur non approuvé n'apparaît pas dans la recherche et ne peut accepter de paiement | Pest : statuts pending/rejected/suspended/expired absents de GET /instructors ; hold et intent refusés (403/422) | backend-laravel, reservation-paiement | 2–3 |
| CA-04 | Deux utilisateurs ne peuvent confirmer simultanément le même créneau | Test de concurrence (processus parallèles) : 1 succès, 1 conflit 409 | reservation-paiement | 3 |
| CA-05 | Un webhook de paiement répété ne crée ni deuxième réservation ni double reversement | Webhook rejoué 2× séquentiel + 2× parallèle : 1 confirmation, 0 payout dupliqué | reservation-paiement | 3 |
| CA-06 | Une réservation annulée applique la politique affichée et génère une trace auditable | Politique figée sur la réservation ; remboursement calculé = attendu ; `booking_events` + `audit_logs` présents | reservation-paiement | 3 |
| CA-07 | Un avis ne peut être créé que pour une séance terminée et vérifiée | POST /reviews sur séance non `completed` → 403/422 ; un seul avis par séance | backend-laravel | 3 |
| CA-08 | L'expiration d'une habilitation bloque les nouvelles prestations sans effacer l'historique | Job d'expiration : moniteur retiré de la recherche, holds refusés, réservations passées intactes | backend-laravel, admin-filament | 2 |
| CA-09 | Le simulateur affiche clairement qu'il ne remplace pas une formation pratique réelle | Test widget : avertissement présent sur chaque écran `sim/` | simulation-2d | 5 |
| CA-10 | Les pages publiques et contrats comportent la mention de non-substitution | Tests widget/HTTP sur accueil, inscription, cours, simulateur, profil moniteur, réservation, CGU/CGV | mobile-flutter, admin-filament | 1–3 |
