# Contrôles du build, du dépôt et de la documentation

Tests qui ne se jouent pas avec le coach. Les tests joués avec le coach sont les
étapes de [`test-kit/scenario.md`](../test-kit/scenario.md). Chaque contrôle
cite les exigences de [`docs/requirements/`](requirements/) qu'il couvre ;
son résultat est consigné dans une session de
[`docs/test-history/`](test-history/) et reporté au tableau de bord
[`docs/test-log.md`](test-log.md).

## Build

### CHK-BLD-01 — Build nominal et artefacts

- **Procédure** : sur une copie propre du dépôt, à un chemin court hors de
  OneDrive (par exemple sous `C:\Temp\`), lancer `build.bat`, puis déposer un
  fichier témoin dans `dist/` et relancer `build.bat`.
- **Attendu** : les deux builds réussissent ; `dist/` contient exactement
  `mycareer-workspace-v<version>.zip` et
  `mycareer-workspace-test-kit-v<version>.zip`, `<version>` étant le contenu
  de `VERSION` ; le fichier témoin a disparu après le second build.
- **Exigences** : REQ-BLD-02, REQ-BLD-13

### CHK-BLD-02 — Contenu du ZIP du workspace

- **Procédure** : extraire le ZIP du workspace hors du dépôt et en lister le
  contenu ; ouvrir `ENGINE-VERSION` ; comparer l'arborescence à
  [`docs/architecture.md`](architecture.md#workspace-tree) ; rechercher dans
  les README et les guides du ZIP les liens vers `docs/` ou le dépôt.
- **Attendu** : un seul répertoire racine `mycareer-workspace/` ;
  `ENGINE-VERSION` à la racine, d'une seule ligne égale à `VERSION` ; `data/`
  ne contient que des `README.md` ; arborescence conforme à l'architecture,
  sans documentation du dépôt ; guides utilisateur à la racine, modèles
  d'initialisation, modèles du feedback produit, référence de structure des
  opportunités et ses modèles présents ; aucun fichier de `examples/` ni du
  kit de test ; aucun lien vers `docs/` ou le dépôt.
- **Exigences** : REQ-BLD-03, REQ-BLD-04, REQ-BLD-06, REQ-BLD-07,
  REQ-BLD-09, REQ-BLD-12, REQ-BLD-19

### CHK-BLD-03 — Cas négatifs du build

- **Procédure** : sur une copie du dépôt, à un chemin court hors de OneDrive,
  provoquer tour à tour chaque cas, lancer `build.bat`, puis remettre la copie
  en état : retirer un fichier obligatoire du workspace (par exemple
  `workspace/USER-GUIDE.fr.md`) ; ajouter un fichier `notes.txt` sous
  `workspace/data/` ; ajouter un `workspace.yaml` sous `workspace/skills/` ;
  ajouter `workspace/ENGINE-VERSION` ; retirer `test-kit/scenario.md` ;
  retirer une source PDF du kit.
- **Attendu** : chaque cas fait échouer le build avec un message clair, qui
  nomme le fichier manquant ou l'entrée refusée.
- **Exigences** : REQ-BLD-05, REQ-BLD-08, REQ-BLD-10, REQ-BLD-11,
  REQ-BLD-17, REQ-BLD-18

### CHK-BLD-04 — ZIP du kit et script de démo

- **Procédure** : extraire le ZIP du kit hors du dépôt, en lister le contenu
  et ouvrir `demo-script.md` ; compter dans `test-kit/scenario.md` les étapes
  taguées `[demo]` et non `[todo #N]`.
- **Attendu** : un seul répertoire racine `mycareer-workspace-test-kit/` avec
  README, scénario, guide testeur, script de démo et sources PDF, DOCX ou
  TXT, sans aucun `.md` sous `sources/` ; le script de démo a autant d'étapes
  que le scénario compte d'étapes `[demo]` livrées, sans champ Attendu ni
  Socle, sans tag `[socle]`, et son en-tête indique la version.
- **Exigences** : REQ-BLD-14, REQ-BLD-15

### CHK-BLD-05 — Build sans effet de bord ni dépendance

- **Procédure** : relire `build.bat` et `test-kit/tools/make_demo_script.ps1` ;
  y rechercher les appels à Python, à `generate_sources.py`, au réseau et les
  écritures hors de `build/` et `dist/`.
- **Attendu** : seuls `cmd` et Windows PowerShell sont appelés ; aucune
  installation, aucun accès réseau, aucune écriture hors de `build/` et
  `dist/`, aucun appel au script de génération des sources.
- **Exigences** : REQ-BLD-01, REQ-BLD-16

## Dépôt

### CHK-REPO-01 — Coordonnées personnelles et données d'exemple

- **Procédure** : rechercher dans le dépôt, hors `.git/`, `dist/` et `plans/`,
  les adresses électroniques, les numéros de téléphone et les chemins locaux
  personnels (`C:\Users\…`) ; relire les données de `examples/` et des
  sources du kit.
- **Attendu** : seules des valeurs fictives (`.example`, `example.net`,
  `06 00 00 00 01`, URL LinkedIn `-example`) ; les données d'exemple sont
  explicitement fictives. Les motifs trouvés dans le contenu binaire d'un PDF
  sont relus avant d'être écartés.
- **Exigences** : REQ-REPO-01, REQ-REPO-03

### CHK-REPO-02 — Noms réels et contenu d'employeur

- **Procédure** : le mainteneur recherche dans le dépôt les noms réels et les
  contenus d'employeur qu'il connaît (liste tenue hors du dépôt), et relit le
  diff depuis la dernière release.
- **Attendu** : aucun nom de personne réelle hors attribution de l'auteur,
  aucun contenu propre à un employeur réel, aucune donnée réelle de candidat.
- **Exigences** : REQ-REPO-02

### CHK-REPO-03 — Artefacts de build ignorés

- **Procédure** : `git check-ignore dist build` puis `git ls-files dist build`.
- **Attendu** : les deux répertoires sont ignorés et aucun fichier suivi ne
  s'y trouve.
- **Exigences** : REQ-REPO-04

### CHK-REPO-04 — Noms et chemins obsolètes

- **Procédure** : rechercher dans le dépôt (`git grep`), hors
  `CHANGELOG.md`, `docs/test-history/` et `docs/design/decision-log.md` :
  « Career AI Workspace », `career-ai-workspace`, `career-ai-test-kit`,
  « My Career Workspace », `my-career-workspace` ; « standalone », « mode
  autonome » ; `fictitious-principal-architect` ; les anciens chemins de
  données à la racine (`profile/`, `opportunities/`, `config/`, `feedback/`,
  `cv/`, `archives/`, `current-status.md`) employés sans le préfixe `data/`.
- **Attendu** : chaque occurrence restante est historique, le rappel d'une
  décision, la documentation du répertoire libre `career-ai-workspace/`, un
  emploi de l'adjectif anglais « standalone » au sens courant, ou un chemin
  qui n'est pas une donnée du workspace (par exemple
  `test-kit/sources/profile/`).
- **Exigences** : REQ-REPO-05, REQ-REPO-06, REQ-REPO-07, REQ-REPO-08

### CHK-REPO-05 — Historiques non réécrits

- **Procédure** : comparer `CHANGELOG.md` et `docs/design/decision-log.md`
  avec leur état à la dernière release (`git diff <tag>..HEAD -- <fichier>`).
- **Attendu** : `CHANGELOG.md` ne change que dans `[Unreleased]` ou la
  version en préparation ; dans le journal des décisions, les entrées
  existantes ne perdent aucun texte (ajouts de statut, de conséquence ou
  nouvelles entrées seulement).
- **Exigences** : REQ-REPO-09, REQ-REPO-10

### CHK-REPO-06 — Version

- **Procédure** : lire `VERSION` et la liste des tags (`git tag`) ;
  rechercher les numéros de version (`0.4`, `v0.`…) dans les README,
  `CONTRIBUTING.md` et `docs/`, hors `CHANGELOG.md`, `docs/test-history/`,
  `docs/design/decision-log.md` et les documents datés.
- **Attendu** : pendant le développement, `VERSION` porte le suffixe `-dev`
  et ne correspond à aucun tag publié ; aucun numéro de version superflu dans
  la documentation courante.
- **Exigences** : REQ-REPO-11, REQ-REPO-12

## Kit de test

### CHK-KIT-01 — Sources fictives du kit

- **Procédure** : relire les sources Markdown de `test-kit/sources/profile/`
  et `test-kit/sources/opportunities/`, et le nombre de pages du livret de
  formation généré.
- **Attendu** : profil explicitement fictif, réaliste et cohérent d'une source
  à l'autre (dates, employeurs, certification) ; au moins deux opportunités
  fictives, la seconde accompagnée d'une note d'appel qui permet le travail en
  parallèle ; une source très longue (plusieurs dizaines de pages) générée
  depuis sa référence Markdown.
- **Exigences** : REQ-KIT-01, REQ-KIT-02, REQ-KIT-03

### CHK-KIT-02 — Génération des sources

- **Procédure** : relancer `generate_sources.py` (voir
  [`test-kit/tools/README.md`](../test-kit/tools/README.md)), puis ouvrir
  chaque PDF et DOCX produit.
- **Attendu** : un fichier produit par entrée du manifeste ; rendu correct
  (titres, puces, tableaux, styles) ; texte conforme à sa source Markdown et
  aux fichiers commités.
- **Exigences** : REQ-KIT-04

### CHK-KIT-03 — Format du scénario maître

- **Procédure** : parcourir les étapes de `test-kit/scenario.md` et la liste
  des issues ouvertes (`gh issue list`) ; comparer les fichiers à déposer de
  chaque étape au contenu du ZIP du kit.
- **Attendu** : chaque étape porte, quand ils s'appliquent, fichiers et
  destination, prompts, mots-clés, attendu et ligne « Exigences » ; chaque
  étape avec prompt indique sa conversation ; les étapes dépendant d'une issue
  ouverte sont taguées `[todo #N]` avec un titre en italique ; chaque fichier
  à déposer est fourni par le ZIP du kit.
- **Exigences** : REQ-KIT-05, REQ-KIT-06, REQ-KIT-07, REQ-KIT-09

### CHK-KIT-04 — Démo minutée

- **Procédure** : jouer les étapes du script de démo depuis ce seul script,
  dans un workspace neuf, en relevant les heures de début et de fin.
- **Attendu** : la durée totale tient dans la cible indiquée au scénario.
- **Exigences** : REQ-KIT-08

### CHK-KIT-05 — Exemple fictif

- **Procédure** : comparer `examples/fictitious-developer/data/` à
  l'arborescence `data/` d'un workspace et à la structure canonique des
  opportunités (`workspace/skills/interview-coach/references/opportunity-structure-guidelines.md`).
- **Attendu** : même arborescence que `data/`, aucun fichier du moteur ;
  opportunités, entretiens, simulations et entretien réel conformes à la
  structure canonique ; l'exemple provient d'un déroulé du scénario (étape
  F2).
- **Exigences** : REQ-KIT-10, REQ-KIT-11

## Référentiel de tests

### CHK-QA-01 — Traçabilité sans erreur

- **Procédure** : lancer le script de contrôle de la traçabilité depuis la
  racine du dépôt.
- **Attendu** : aucune erreur. La liste des exigences sans test,
  donnée en avertissement, est relue avec le mainteneur.
- **Exigences** : REQ-QA-02, REQ-QA-03, REQ-QA-05, REQ-QA-10

### CHK-QA-02 — Cas négatifs du script de traçabilité

- **Procédure** : sur une copie temporaire du dépôt, hors du dépôt, introduire
  tour à tour un identifiant d'exigence en double, un statut d'exigence
  inconnu, une exigence citée inexistante, une exigence remplaçante
  inexistante, une exigence active sans ligne au tableau de bord et, dans la
  colonne Tests d'une ligne du tableau de bord, un test existant qui ne cite
  pas l'exigence de la ligne, puis lancer le script.
- **Attendu** : chaque cas fait échouer le script avec un message qui nomme le
  fichier et l'identifiant en cause.
- **Exigences** : REQ-QA-02, REQ-QA-10

### CHK-QA-03 — Script de démo

- **Procédure** : lancer `build.bat`, puis ouvrir le script de démo du ZIP du
  kit de test.
- **Attendu** : aucune ligne « Exigences » ni « Plan de test » ; le nombre
  d'étapes `[demo]` est celui du build précédant la migration.
- **Exigences** : REQ-QA-11

### CHK-QA-04 — Couverture affichée par le mod

- **Procédure** : charger le mod `test-coverage`, lancer `/test-coverage`
  puis `/test-coverage -v`.
- **Attendu** : le total est égal au nombre d'exigences proposées ou actives ; le détail donne une ligne par domaine ; les sections annexes ne sont
  pas comptées.
- **Exigences** : REQ-QA-05, REQ-QA-12

### CHK-QA-05 — Table de migration complète

- **Procédure** : parcourir la table de migration de l'issue #20.
- **Attendu** : chaque puce de l'ancien plan de test et chaque ligne de
  l'ancien journal a une destination : une ou plusieurs exigences, ou « non
  migré » avec sa raison (contrôle ponctuel de livraison, doublon). Les règles
  remplacées gardent leur origine. Le mainteneur relit un domaine complet.
- **Exigences** : REQ-QA-01, REQ-QA-09

### CHK-QA-06 — Statuts justifiés par les sessions

- **Procédure** : tirer un échantillon d'exigences ✅ Validé, dans plusieurs
  domaines, et ouvrir la session citée pour chacune.
- **Attendu** : la session joue exactement ce que dit l'exigence, avec un
  résultat conforme, sur une version postérieure au dernier changement de
  l'exigence.
- **Exigences** : REQ-QA-06

### CHK-QA-07 — Plus de renvoi à l'ancien plan

- **Procédure** : rechercher « Plan de test » dans `test-kit/scenario.md`, et
  les renvois à `docs/test-plan.md` dans `AGENTS.md`, `CONTRIBUTING.md`,
  `test-kit/` et `.claude/skills/prompteur/`.
- **Attendu** : chaque étape du scénario cite ses exigences par une ligne
  « Exigences » ; `docs/test-plan.md` n'est plus cité comme liste de
  vérifications, seulement comme stratégie de test.
- **Exigences** : REQ-QA-03, REQ-QA-04, REQ-QA-08

### CHK-QA-08 — Historique inchangé

- **Procédure** : comparer `docs/test-history/` avec son état avant la
  migration (`git diff` sur les fichiers existants).
- **Attendu** : aucune session existante n'est modifiée.
- **Exigences** : REQ-QA-07

### CHK-QA-09 — Passe courte avec le prompteur

- **Procédure** : jouer B2 avec `/prompteur B2` dans un workspace de test.
- **Attendu** : la session rédigée cite les tests joués (B2) ; seules les
  exigences citées par B2 sont mises à jour au tableau de bord, selon
  REQ-QA-06.
- **Exigences** : REQ-QA-04, REQ-QA-07, REQ-QA-13
