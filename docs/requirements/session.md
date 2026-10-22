# Exigences — Démarrage de session

Ouverture de chaque session par le coach : ligne de lancement, première
session (accueil, prénom, fichiers obligatoires), sessions suivantes
(salutation, ligne de statut du dossier), reprise depuis l'espace carrière et
rôle de `data/current-status.md`.

### REQ-SES-01 — Consignes du workspace appliquées dès l'ouverture

- **Exigence** : ouvert comme projet dans l'outil IA, hors du dépôt, le
  workspace extrait voit ses consignes racine (`AGENTS.md`, `CLAUDE.md`, skill
  d'initialisation) lues et appliquées dès la première réponse du coach.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-02 — Ligne de lancement

- **Exigence** : en français, la réponse du coach au premier message de chaque
  session, première ou suivante, s'ouvre sur la ligne fixe en italique
  *Lancement de la session…*, suivie directement de l'accueil ou de la
  salutation.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-03 — Aucun préambule

- **Exigence** : rien d'autre ne précède l'accueil ou la salutation : le coach
  ne mentionne ni les fichiers de consignes (`CLAUDE.md`, `AGENTS.md`,
  skills), ni la procédure ou ses étapes, ni ce qu'il vérifie, ni le fait qu'il
  s'agit d'une première session.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-04 — Aucune phrase d'état quand rien n'a changé

- **Exigence** : quand rien n'a été créé, ajouté ni trouvé manquant au
  démarrage, le coach ne dit rien de l'état de l'initialisation ou de la
  configuration (pas de « Votre espace carrière est prêt… »).
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-05 — Détection de la première session

- **Exigence** : la session est une première session quand
  `data/current-status.md` n'existe pas et qu'aucun dossier professionnel ni
  répertoire d'opportunité n'existe ; aucun fichier marqueur n'est utilisé.
  Avant l'accueil, le coach ne fait que vérifier l'existence de ces fichiers,
  sans les lire.
- **Origine** : #5, #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-06 — Perte possible de `data/current-status.md`

- **Exigence** : quand `data/current-status.md` manque alors que le dossier
  professionnel ou une opportunité existe, ce n'est pas une première session :
  pas de message d'accueil ; le coach signale une perte possible du fichier et
  demande comment procéder, sans le recréer avant la réponse.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SES-07 — Accueil de première session

- **Exigence** : en français, la première session affiche, juste après la ligne
  de lancement, l'accueil exact (« Bienvenue dans votre **espace carrière** ! »,
  phrase de présentation, question du prénom), en vouvoyant le candidat.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-08 — Accueil avant tout examen des données

- **Exigence** : seul le contrôle de première session (REQ-SES-05) précède
  l'accueil : le coach ne lit aucun fichier de données avant de l'afficher.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-09 — Attente de la réponse au prénom

- **Exigence** : après l'accueil, le coach attend la réponse à la question du
  prénom sans aucune autre tâche d'initialisation (aucun fichier créé). Si le
  premier message contient une vraie demande, il dit qu'il la traitera ensuite.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SES-10 — Pas d'accueil hors première session

- **Exigence** : le message d'accueil n'apparaît pas dans une session suivante,
  même quand un autre fichier obligatoire vient d'être recréé.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-11 — Fichiers obligatoires créés à la première session

- **Exigence** : après la réponse au prénom, le coach crée depuis les modèles
  du moteur les quatre fichiers obligatoires manquants :
  `data/config/workspace.yaml`, `data/current-status.md`,
  `data/profile/professional-profile.md` et
  `data/profile/sources/external-references.md`.
- **Origine** : #5, #15, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-12 — Compte rendu de création en une phrase

- **Exigence** : à la première session, le coach rend compte de la création en
  une seule phrase fonctionnelle, la phrase exacte des consignes (« J'ai
  préparé votre espace : … »).
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-13 — Proposition de la première étape

- **Exigence** : à la fin des messages de première session, le coach propose
  de construire le dossier professionnel à partir des documents du candidat,
  avec la phrase des consignes, sans le remplir.
- **Origine** : #15
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-14 — Session suivante sans création ni réécriture

- **Exigence** : une session suivante sur un espace carrière complet ne crée
  ni ne réécrit aucun fichier, et ne signale aucune création.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-15 — Fichier obligatoire manquant recréé seul

- **Exigence** : un fichier obligatoire supprimé par l'utilisateur est recréé
  seul depuis son modèle, au démarrage de la session suivante, et le coach le
  signale en une phrase courte.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SES-16 — Fichier personnalisé laissé intact

- **Exigence** : un fichier existant de `data/` au contenu personnalisé n'est
  jamais écrasé, réécrit ni reformaté par l'initialisation, même s'il paraît
  vide ou périmé.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-17 — Prénom accepté

- **Exigence** : quand le candidat accepte avec un prénom, le coach écrit
  `user.address_by_first_name: yes` et `user.first_name` dans
  `data/config/workspace.yaml` et accuse réception avec la phrase exacte des
  consignes (« Entendu, <prénom>. Vous pourrez changer cela à tout moment… »).
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-18 — « Oui » sans prénom

- **Exigence** : à un « oui » sans prénom, le coach demande « Quel prénom
  dois-je utiliser ? » et n'écrit rien tant que le prénom n'est pas donné.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-19 — Prénom refusé

- **Exigence** : à un refus, le coach écrit `no`, accuse réception avec la
  phrase exacte des consignes, salue ensuite par « Bonjour. » et ne repose
  plus la question.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-20 — Question du prénom ignorée

- **Exigence** : quand le candidat répond à autre chose, le coach n'insiste
  pas, traite la demande et écrit `ask_again` ; il repose la question une
  seule fois à la conversation suivante, puis écrit `no` si elle est de
  nouveau ignorée.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-21 — Question du prénom sans accueil

- **Exigence** : quand `user.address_by_first_name` vaut `unset` en dehors
  d'une première session (par exemple dans un workspace d'une version
  antérieure, où la section `user` vient d'être ajoutée), le coach pose la
  question du prénom en début de session, sans le message d'accueil.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-22 — Salutation de début de conversation

- **Exigence** : dans une session suivante, la ligne de lancement est suivie
  directement de la salutation « Bonjour <prénom>. » (prénom accepté) ou
  « Bonjour. », donnée une fois par conversation.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-23 — Au revoir

- **Exigence** : quand le candidat termine la session (par exemple « merci, au
  revoir »), le coach répond « À bientôt, <prénom>. » ou « À bientôt. ».
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-24 — Prénom limité à la salutation

- **Exigence** : le coach n'emploie le prénom que dans la salutation,
  l'accusé de réception du choix et l'au revoir, jamais dans ses autres
  messages.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-25 — Aucune ligne de statut en première session

- **Exigence** : la première session n'affiche pas la ligne de statut du
  dossier professionnel ; le compte rendu de création dit déjà que le dossier
  est vide.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-26 — Ligne de statut du dossier

- **Exigence** : en français, dans chaque session suivante, la ligne qui suit
  la salutation est la ligne de statut exacte, avec l'émoji, le libellé et la
  version lus dans l'en-tête du dossier (« Dossier professionnel : 🟠 en
  construction (version 0.2). »), quel que soit le statut, y compris `ready` ;
  rien d'autre n'est dit sur le statut quand aucune opportunité n'est
  concernée.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-27 — Ligne de statut en anglais

- **Exigence** : en anglais, la ligne de statut est la formulation anglaise
  exacte des consignes (« Professional profile: 🟠 in progress (version
  0.2). »).
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-28 — Démarrage de session en anglais

- **Exigence** : en anglais (langue de coaching configurée, ou langue du
  premier message quand la configuration n'existe pas encore), les messages
  fixes du démarrage sont ceux de la version anglaise des consignes : ligne de
  lancement *Starting the session…*, accueil (« Welcome to your **career
  workspace**! »…), accusé de réception, compte rendu de création et première
  étape.
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SES-29 — Dossier professionnel lu avant de répondre

- **Exigence** : avant de répondre sur le dossier professionnel, le coach l'a
  lu : il sait s'il est encore le squelette vide ou déjà rempli et ne dit
  jamais qu'il ignore son contenu.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-30 — État courant périmé corrigé

- **Exigence** : quand un `current-status.md` contredit ce que contiennent les
  fichiers (par exemple un dossier dit vide alors qu'il est rempli, ou un
  point de reprise déjà dépassé), le coach se fie aux fichiers et corrige
  l'état courant en début de session, sans répéter l'état périmé au candidat.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-31 — Reprise depuis l'espace carrière

- **Exigence** : dans une nouvelle conversation, sans historique, le coach
  reprend le travail à partir des seuls fichiers : il lit
  `data/current-status.md`, puis le statut de chaque opportunité concernée,
  résume où en est le travail et propose un point de reprise sans choisir à la
  place du candidat quand plusieurs sont plausibles.
- **Origine** : avant #5, D-001
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-32 — État courant minimal

- **Exigence** : `data/current-status.md` reste un instantané minimal de
  routage (périmètre et point de reprise) : il ne duplique pas l'état détaillé
  des opportunités, tenu dans le statut de chacune.
- **Origine** : avant #5, D-001
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SES-33 — Salutation et au revoir en anglais

- **Exigence** : en anglais, la salutation de début de conversation et l'au
  revoir sont les formulations anglaises exactes des consignes (« Hello
  <first_name>. » ou « Hello. », « See you soon, <first_name>. » ou « See you
  soon. »).
- **Origine** : #15, D-019
- **Statut** : ✅ Active
- **Message** : formulation fixe
