# Exigences — Build

Règles de `build.bat` et des artefacts qu'il produit : ZIP du workspace, ZIP du
kit de test et script de démo.

### REQ-BLD-01 — Build limité à l'empaquetage

- **Exigence** : `build.bat` ne fait qu'empaqueter le contenu source : il
  n'installe rien, n'accède pas au réseau et n'écrit qu'à l'intérieur de
  `build/` et de `dist/`.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-02 — Deux artefacts dans `dist/`

- **Exigence** : lancé depuis une copie propre du dépôt sous Windows,
  `build.bat` crée `dist/` et y produit exactement deux fichiers :
  `mycareer-workspace-v<version>.zip` et
  `mycareer-workspace-test-kit-v<version>.zip`, où `<version>` est le contenu
  de `VERSION`. Aucun autre artefact (livrable standalone, formulaire de
  retour pilote, ancien nom de produit).
- **Origine** : avant #5, #12, #14, #15, #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-03 — Racine unique du ZIP du workspace

- **Exigence** : le ZIP du workspace contient un seul répertoire racine,
  `mycareer-workspace/`.
- **Origine** : #5, #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-04 — Marqueur `ENGINE-VERSION`

- **Exigence** : le ZIP du workspace contient à sa racine un fichier
  `ENGINE-VERSION` généré par le build, d'une seule ligne, égale au contenu de
  `VERSION`.
- **Origine** : D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-05 — Racine de `workspace/` limitée au moteur et à `data/`

- **Exigence** : le build échoue avec un message clair quand la racine de
  `workspace/` contient une entrée autre que les fichiers du moteur et
  `data/`, notamment un fichier `ENGINE-VERSION`.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-06 — `data/` du ZIP limité aux `README.md`

- **Exigence** : dans le ZIP du workspace, `data/` ne contient que des
  `README.md` : aucun fichier de travail initialisé (`workspace.yaml`,
  `current-status.md`, dossier professionnel, `external-references.md`,
  journal du feedback produit, feedback généré).
- **Origine** : #5, D-004, #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-07 — Arborescence conforme à l'architecture

- **Exigence** : l'arborescence du ZIP du workspace est conforme à
  [`docs/architecture.md`](../architecture.md#workspace-tree) : le moteur à la
  racine, les données sous `data/`, et aucun autre contenu (documentation du
  dépôt notamment).
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-08 — Échec sur un fichier source obligatoire manquant

- **Exigence** : le build échoue avec un message qui nomme le fichier quand un
  fichier source obligatoire du workspace manque (instructions, skills,
  modèles, références, guides utilisateur).
- **Origine** : avant #5, #15, #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-09 — Fichiers obligatoires présents dans le ZIP

- **Exigence** : le ZIP du workspace contient les deux guides utilisateur
  (`USER-GUIDE.md`, `USER-GUIDE.fr.md`) à sa racine, les quatre modèles
  d'initialisation sous `skills/init-workspace/assets/`, les deux modèles du
  feedback produit dans les assets de son skill, la référence de structure
  des opportunités et ses modèles.
- **Origine** : avant #5, #15, #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-10 — Échec sur un fichier de données dans `workspace/data/`

- **Exigence** : le build échoue avec un message clair quand
  `workspace/data/` contient un fichier autre qu'un `README.md`.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-11 — Échec sur un fichier de travail dans le moteur

- **Exigence** : le build échoue avec un message clair quand le moteur
  (`workspace/skills/`) contient un fichier de travail initialisé
  (`workspace.yaml`, `current-status.md`, `professional-profile.md`,
  `external-references.md`, `feedback-log.md`).
- **Origine** : #5, D-004, #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-12 — ZIP du workspace sans contenu de démonstration

- **Exigence** : le ZIP du workspace ne contient ni l'exemple fictif
  (`examples/`), ni le kit de test, ni aucune donnée de démonstration, réelle
  ou fictive.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-13 — Artefacts précédents remplacés

- **Exigence** : chaque build remplace les artefacts locaux du build
  précédent : `dist/` ne garde aucun fichier d'un build antérieur.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-14 — Contenu du ZIP du kit de test

- **Exigence** : le ZIP du kit contient un seul répertoire racine,
  `mycareer-workspace-test-kit/`, avec le README du kit, le scénario maître,
  le guide testeur, le script de démo et les sources fictives au format PDF,
  DOCX ou TXT, sans aucune référence Markdown sous `sources/`.
- **Origine** : #12, #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-15 — Contenu du script de démo

- **Exigence** : le script de démo généré ne reprend que les étapes taguées
  `[demo]` et non `[todo #N]`, réduites à la durée, la conversation, les
  fichiers, les actions, les prompts et les points à montrer, sans les
  attendus, le champ Socle ni le tag `[socle]` ; son en-tête indique la
  version.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-16 — Aucune génération ni dépendance au build

- **Exigence** : `build.bat` n'appelle jamais le script de génération des
  sources du kit et ne requiert rien d'autre que Windows et PowerShell
  (ni Python, ni bibliothèque, ni réseau) ; il empaquette les fichiers
  générés et commités.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-17 — Échec sur un scénario maître manquant

- **Exigence** : le build échoue avec un message clair quand
  `test-kit/scenario.md` manque.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-18 — Échec sur une source du kit manquante

- **Exigence** : le build échoue avec un message qui nomme le fichier quand
  une source requise du kit de test (PDF, DOCX ou TXT) manque.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-BLD-19 — Liens du ZIP valides hors du dépôt

- **Exigence** : les documents du ZIP du workspace (README, guides
  utilisateur) ne contiennent aucun lien vers `docs/` ou vers le dépôt : leurs
  liens restent valides une fois le ZIP extrait hors du dépôt.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun
