# Career AI Toolkit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> Toolkit expérimental v0.3 pour structurer son dossier professionnel, ses candidatures et sa préparation aux entretiens avec l'IA.

## Objectif

Le toolkit est un coach, pas un générateur de réponses : il aide le candidat à réfléchir, s'entraîner, progresser et s'approprier son histoire professionnelle, plutôt qu'à mémoriser des réponses toutes faites.

Le projet propose deux modes complémentaires :

1. **Coach d'entretien standalone** : un fichier Markdown autonome à installer dans un assistant ou un projet IA web. L'utilisateur joint ensuite son CV, son dossier professionnel, l'offre et les autres documents utiles.
2. **Career AI Workspace local** : un espace privé de fichiers à ouvrir dans VS Code, Claude Code ou un autre agent capable de lire et modifier des fichiers.

## Confidentialité

Le dépôt du toolkit ne doit jamais contenir de données personnelles réelles. Conservez votre workspace utilisateur dans un autre répertoire, sur un appareil personnel ou un stockage privé que vous contrôlez. N'y placez aucun document confidentiel appartenant à un employeur, un client ou un tiers.

## Construire les livrables

Sous Windows, exécutez :

```bat
build.bat
```

Le build crée localement dans `dist/` :

- `interview-coach-standalone-v<version>.md` ;
- `interview-coach-pilot-feedback-v<version>.md` ;
- `career-ai-workspace-v<version>.zip`.

`<version>` est le contenu du fichier `VERSION` (par exemple `0.4.0-dev` pendant le développement).

`dist/` n'est pas versionné. Les fichiers peuvent être ajoutés manuellement aux assets d'une release GitHub.

## Tester comme utilisateur final

1. Construire les livrables.
2. Copier le ZIP sur la machine personnelle utilisée pour la recherche d'emploi.
3. Extraire le ZIP hors du dépôt Git du toolkit.
4. Ouvrir le répertoire extrait dans l'outil IA local choisi.
5. Vérifier qu'au premier lancement le coach crée les fichiers obligatoires manquants sous `data/` sans rien écraser, puis renseigner `data/config/workspace.yaml`.
6. Déposer les documents autorisés dans `data/profile/sources/`.
7. Demander au coach de constituer la première version de `data/profile/professional-profile.md`.
8. Fournir au coach les sources d'une opportunité réelle et vérifier qu'il crée lui-même sa structure numérotée dans `data/opportunities/`.
9. Changer de conversation entre deux sessions de coaching et vérifier que le coach reprend uniquement à partir du workspace et des fichiers `current-status.md`.
10. Demander au coach de créer `data/feedback/pilot-feedback.md`, puis le compléter si vous acceptez de partager un retour anonymisé.

## Périmètre actuel du projet

La v0.3 privilégie le coach d'entretien, le dossier professionnel et la validation du workflow redesigné. Le générateur de CV, l'installation automatisée, les mises à jour non destructives et le rendu PDF portable figurent dans [BACKLOG.md](BACKLOG.md).

## Organisation du workspace

```text
career-ai-workspace/
|-- skills/                          # moteur : workflows et modèles réutilisables
`-- data/                            # données utilisateur (que des README dans le ZIP)
    |-- current-status.md            # dernier scope et point de reprise
    |-- config/                      # préférences du workspace
    |-- profile/                     # profil professionnel et sources
    |-- cv/                          # CV dérivés
    |-- opportunities/               # opportunités créées par le coach
    |   `-- 001-organization-role/
    |       |-- opportunity.md       # représentation canonique de l'offre
    |       |-- analysis.md          # analyse et positionnement
    |       |-- current-status.md    # état courant de l'opportunité
    |       `-- interviews/          # rounds, simulations et entretien réel
    |-- archives/
    `-- feedback/                    # retour pilote facultatif
```

L'[architecture détaillée](docs/architecture.md#workspace-tree) distingue les fichiers livrés dans le ZIP de ceux que le coach crée progressivement.

## Documentation

- [Glossaire métier français / anglais](docs/glossary.md)
- [Référence de conception du workflow](docs/design/01-career-ai-toolkit-workflow-design.md)
- [Journal des décisions de conception](docs/design/decision-log.md)
- [Architecture](docs/architecture.md)
- [Cas d'utilisation et parcours beta-testeur](docs/use-cases.md)
- [Cycle de vie des documents](docs/document-lifecycle.md)
- [Protocole de test pilote](docs/pilot-testing.md)

## Auteur

Créé et maintenu par Jérôme Jurbert.

Ce projet est né d'un besoin concret : structurer les informations
professionnelles, les candidatures et la préparation aux entretiens
à l'aide de workflows assistés par l'IA.

Career AI Toolkit est distribué sous licence MIT.
