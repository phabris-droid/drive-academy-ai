# DRIVE ACADEMY AI — Dépôt piloté par agents IA

Ce dépôt contient une **équipe de 11 agents Claude Code** configurée pour développer la plateforme
décrite dans le cahier des charges V3.0 (`docs/cahier-des-charges-v3.txt`).

> DRIVE ACADEMY AI accompagne votre apprentissage de la conduite. La plateforme ne remplace pas une auto-école agréée.

## Démarrage (sur votre machine)

Prérequis : [Claude Code](https://docs.claude.com/en/docs/claude-code), Git, Docker, PHP 8.3 + Composer,
Flutter (stable), Python 3.12.

```bash
unzip drive-academy-ai.zip && cd drive-academy-ai
git init && git add . && git commit -m "chore: équipe d'agents et cadrage"
chmod +x .claude/hooks/garde-fous.sh
claude            # lance Claude Code dans le dossier
```

Puis, dans Claude Code :

| Commande | Effet |
|---|---|
| `/agents` | Voir/ajuster les 11 agents |
| `/lot 0` | Préparer le cadrage (OpenAPI, maquettes, comparatif paiement) |
| `/demarrage` | Initialiser Laravel + Filament + Flutter + FastAPI + Docker + CI |
| `/lot 1` | Développer le socle (comptes, cours, panneaux, quiz, admin) |
| `/story L3-05` | Développer une seule story |
| `/revue-conformite tout` | Audit conformité + état des critères CA-01…CA-10 |

## Comment ça fonctionne

```
Vous ──► Orchestrateur (CLAUDE.md) ──► architecte ──► agents de domaine (en parallèle)
                                                     ├─ backend-laravel
                                                     ├─ reservation-paiement
                                                     ├─ admin-filament
                                                     ├─ mobile-flutter
                                                     ├─ simulation-2d
                                                     ├─ coach-ia
                                                     └─ contenu-pedagogique
                                    ◄── qa-tests ◄── conformite-securite (lecture seule, peut bloquer)
                                    ◄── devops (infra, CI/CD)
```

- **CLAUDE.md** : règles non négociables issues du CDC, stack, processus, portes humaines.
- **.claude/agents/** : un fichier par agent (rôle, périmètre, exigences, définition de « terminé »).
- **.claude/commands/** : commandes d'orchestration.
- **.claude/hooks/garde-fous.sh** : bloque les formulations interdites (« examen officiel »…) et les secrets.
- **docs/backlog/** : lots 0 à 6 en user stories, reliées aux sections du CDC.
- **docs/criteres-acceptation.md** : les 10 critères CDC §13, chacun lié à un test.
- **docs/points-ouverts.md** : les 10 décisions humaines où les agents s'arrêtent. **À tenir à jour.**

## Ce que les agents ne feront pas seuls
Publier du contenu réglementaire, choisir le prestataire de paiement, rédiger des CGU/CGV
définitives, trancher l'éligibilité des moniteurs indépendants, mettre en production.
Ces décisions vous reviennent (CDC §6, §8, §17).
