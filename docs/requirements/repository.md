# Exigences — Dépôt

Invariants du dépôt du toolkit : aucune donnée réelle, données d'exemple
fictives, fichiers générés ignorés, noms et chemins obsolètes absents,
historiques non réécrits, version.

### REQ-REPO-01 — Aucune coordonnée personnelle

- **Exigence** : le dépôt ne contient aucune adresse électronique, aucun
  numéro de téléphone ni aucun chemin local personnel réels ; les seules
  occurrences sont fictives (domaines `.example` ou `example.net`, numéro
  `06 00 00 00 01`).
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-02 — Aucun nom réel ni contenu d'employeur

- **Exigence** : le dépôt ne contient aucun nom de personne réelle hors
  attribution de l'auteur (licence, README, fiches de test), ni contenu propre
  à un employeur réel, ni donnée réelle de candidat (CV, certification, offre,
  notes d'entretien).
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-03 — Données d'exemple explicitement fictives

- **Exigence** : toutes les données d'exemple du dépôt (`examples/`,
  `test-kit/`) sont explicitement fictives.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-04 — Artefacts de build ignorés

- **Exigence** : `dist/` et `build/` sont ignorés par Git et aucun fichier
  suivi ne s'y trouve.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-05 — Chemins racine obsolètes absents

- **Exigence** : les instructions, le moteur et la documentation ne citent
  plus les anciens chemins de données à la racine du workspace (`profile/`,
  `opportunities/`, `config/`, `feedback/`, `cv/`, `archives/`,
  `current-status.md` à la racine) : toutes les données sont sous `data/`.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-06 — Anciens noms du produit absents

- **Exigence** : hors `CHANGELOG.md`, `docs/test-history/` et la décision de
  renommage, le dépôt n'emploie plus « Career AI Workspace »,
  `career-ai-workspace`, `career-ai-test-kit`, « My Career Workspace » (avec
  espace) ni `my-career-workspace` comme nom actuel du produit ; seule la
  documentation des workspaces existants mentionne `career-ai-workspace/`
  comme nom de répertoire encore accepté.
- **Origine** : #15, D-017
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-07 — Mode standalone absent

- **Exigence** : hors `CHANGELOG.md`, `docs/test-history/` et la décision
  d'abandon, le dépôt ne présente plus le mode standalone (« standalone »,
  « mode autonome ») comme un composant actif.
- **Origine** : #14, D-016
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-08 — Ancien exemple fictif absent

- **Exigence** : `examples/fictitious-principal-architect/` n'existe plus et
  aucun document n'y renvoie.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-09 — Entrées publiées du `CHANGELOG.md` non réécrites

- **Exigence** : les entrées de `CHANGELOG.md` des versions publiées ne sont
  pas modifiées ; seules la section `[Unreleased]` et la préparation d'une
  nouvelle version changent.
- **Origine** : #14, #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-10 — Entrées du journal des décisions non réécrites

- **Exigence** : les entrées existantes de `docs/design/decision-log.md` ne
  sont pas réécrites : une évolution s'ajoute (statut, conséquence complétée,
  nouvelle entrée) sans effacer le texte d'origine.
- **Origine** : #14, #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-11 — Pas de numéro de version superflu dans la documentation

- **Exigence** : les README, `CONTRIBUTING.md` et la documentation ne portent
  pas de numéro de version quand il n'est pas nécessaire, de sorte qu'une
  release ne modifie que `VERSION` et `CHANGELOG.md`.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-REPO-12 — Version de développement

- **Exigence** : pendant le développement, `VERSION` porte la release en cours
  avec le suffixe `-dev`, jamais une version déjà publiée ; le suffixe n'est
  retiré qu'à la préparation de la release.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun
