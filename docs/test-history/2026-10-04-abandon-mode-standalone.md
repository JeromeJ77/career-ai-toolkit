# 2026-10-04 — Abandon du mode standalone (issue #14)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : agent de développement, résultat à vérifier par le développeur du toolkit.
- **Version** : `0.4.0-dev`, build local sur une copie propre de l'arbre de travail (fichiers suivis et non ignorés, hors `.git`).
- **Données** : aucune ; seuls le contenu du dépôt et les livrables du build sont examinés. Aucune conversation avec le coach n'a été jouée.

## Résultats

- ✅ Build nominal : `build.bat` réussit ; `dist/` contient le ZIP du workspace, le ZIP du kit de test et `interview-coach-pilot-feedback-v0.4.0-dev.md`, et plus aucun fichier `interview-coach-standalone-v<version>.md`. La version du modèle de retour pilote est égale à `VERSION`.
- ✅ Non-régression du ZIP du workspace : liste des 42 entrées identique à celle d'un build de `HEAD` (avant l'issue), `ENGINE-VERSION` compris ; `data/` ne contient que des `README.md`.
- ✅ Cas négatifs du build : `workspace/AGENTS.md` retiré, échec « Required file missing » ; fichier non `README.md` ajouté sous `workspace/data/`, échec clair. Les fichiers de test ont été remis en état ensuite.
- ✅ `dist/` et `build/` ignorés par `.gitignore`.
- ✅ Recherche de « standalone » et « mode autonome » dans le dépôt (hors `CHANGELOG.md`, `docs/test-history/`, `.git`, `.venv`) : il ne reste que l'entrée D-016, son rappel dans D-009 et D-015, l'entrée du glossaire marquée abandonnée, le label conservé dans `CONTRIBUTING.md`, le plan et le journal de test de #14, la planification de `BACKLOG.md`, et deux emplois de l'adjectif anglais au sens « autonome » (`CONTRIBUTING.md`, consignes de simulation).
- ✅ D-016 au format #13 (type `PRODUCT`, statut « ✅ Adoptée », contexte et limites, trois options, conséquences, condition de réévaluation) ; D-009 présente le standalone comme abandonné.
- ✅ `CHANGELOG.md` annonce l'abandon dans « Removed » ; les entrées antérieures et `docs/test-history/` ne sont pas modifiés.
- ✅ Modèle de retour pilote sans ligne « Mode testé » ; `test-kit/scenario.md` renvoie aux puces Workspace du plan ; `test-kit/guide-testeur.md` ne cite plus le standalone.
- ✅ Règles de coaching génériques du standalone comparées aux skills : les règles absentes sont reprises dans `interview-coach/SKILL.md` (dimensions de l'analyse, messages comme hypothèses, contenu et structure de la préparation, reconstruction de l'entretien réel, compétences transférables, critères internes, données inutiles, coaching en anglais). Les règles propres au mode (démarrage par menu, une conversation par opportunité, limites du mode, amorces) ne sont pas reprises.
- ⚠️ Confidentialité : recherche par motifs d'adresses e-mail et de numéros de téléphone sans résultat hors faux positifs dans les PDF, et relecture du diff ; la recherche de noms réels et de contenus d'employeur n'a pas été refaite.
- ⬜ Issues GitHub #8, #9 et #3 : non modifiées, en attente de validation des commentaires.

## Suites à donner

- La génération d'une lettre de motivation, proposée par le standalone en fin de préparation, n'a pas de workflow dans le workspace (modèle `cover-letter.template.md` présent mais non référencé, emplacement non défini). Signalée, non reprise.
- Rejouer avec le coach les contrôles Workspace repris du standalone et la préparation (D4), modifiée par #14.
