# Exigences — Confidentialité et navigation web

Rappel de confidentialité de la première session et navigation web : règle
par défaut, exceptions ponctuelles avec l'accord du candidat, validation et
provenance des informations récupérées, y compris pendant une simulation.

### REQ-PRIV-01 — Rappel de confidentialité en première session

- **Exigence** : à la première session, après le compte rendu de création des
  fichiers et avant le message d'information du feedback produit, le coach
  donne une seule fois le rappel de confidentialité, en un paragraphe, au
  texte exact des consignes.
- **Origine** : #8, #17, D-003
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-02 — Rappel non bloquant

- **Exigence** : le rappel n'attend pas de réponse : le coach enchaîne dans le
  même message sur la suite de la première session, sans conditionner le
  travail à une vérification par le candidat de ses paramètres.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-03 — Rappel absent des sessions suivantes

- **Exigence** : le rappel de confidentialité n'est jamais redonné après la
  première session, ni dans une session suivante, ni dans une nouvelle
  conversation.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-04 — Rappel de confidentialité en anglais

- **Exigence** : avec l'anglais comme langue de coaching, le rappel de la
  première session est donné au texte anglais exact des consignes, à la même
  place.
- **Origine** : #8, #17
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-05 — Navigation désactivée si le paramètre manque ou est illisible

- **Exigence** : le coach lit `privacy.allow_external_web_search` au démarrage
  de la session avec les autres clés de configuration, et le traite comme
  `false` quand il est absent ou que sa valeur est invalide.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-06 — Aucune navigation de la propre initiative du coach

- **Exigence** : avec `false`, le coach ne consulte jamais le web de sa
  propre initiative, y compris quand un message ou une source contient un
  lien.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-07 — Accord explicite pour une exception ponctuelle

- **Exigence** : avec `false`, le coach ne consulte une ressource web
  qu'après l'accord explicite du candidat pour ce besoin précis, que
  l'exception soit proposée par le coach ou demandée par le candidat ; il le
  demande par la question exacte des consignes.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-08 — Lien fourni sans accord

- **Exigence** : un lien fourni par le candidat n'est pas un accord : le coach
  pose la question d'accord pour ce lien avant de l'ouvrir.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-09 — Demande explicite d'ouverture

- **Exigence** : quand le message du candidat demande explicitement d'ouvrir
  un lien (« peux-tu lire cette offre en ligne ? »), le coach ne repose pas la
  question d'accord avant de naviguer.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-10 — Accord non permanent

- **Exigence** : l'accord vaut pour ce seul besoin : un besoin suivant, même
  dans la même conversation, donne une nouvelle question d'accord.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-11 — Exception refusée

- **Exigence** : quand le candidat refuse l'exception, le coach ne consulte
  rien et propose de coller le contenu ou de fournir le fichier.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PRIV-12 — Navigation autorisée par le paramètre

- **Exigence** : avec `true`, y compris quand le candidat a changé la valeur à
  la main, le coach peut consulter le web sans demander l'accord à chaque
  fois, dès la session qui lit cette valeur.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-13 — Lien impossible à ouvrir

- **Exigence** : quand un lien ne peut pas être ouvert, le coach le dit par le
  message exact des consignes, n'affirme jamais avoir consulté la ressource et
  laisse le candidat coller le contenu ou fournir le fichier.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-14 — Navigation indisponible dans l'outil

- **Exigence** : quand l'outil ne permet pas de naviguer, le coach le dit par
  le même message exact, sans jamais affirmer avoir consulté la ressource.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-15 — Information récupérée validée avant intégration

- **Exigence** : toute information récupérée sur le web est présentée au
  candidat pour validation avant d'entrer dans le dossier professionnel ou
  une opportunité, quelle que soit la valeur du paramètre.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-16 — Provenance de l'information récupérée

- **Exigence** : l'information récupérée et validée est enregistrée avec sa
  provenance : le lien et la date de consultation.
- **Origine** : #8, D-003
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-17 — Offre lue en ligne conservée en transcription

- **Exigence** : une offre lue depuis un lien est conservée en transcription
  Markdown sous `sources/` de l'opportunité, avec le lien et la date de
  consultation dans son en-tête, et citée avec le lien dans la section
  Sources d'`opportunity.md`.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-18 — Référence externe consultée pour le dossier

- **Exigence** : quand une référence externe consultée en ligne sert au
  dossier professionnel, la proposition de mise à jour cite le lien et la
  date de consultation, et `data/profile/sources/external-references.md` les
  enregistre.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-19 — Navigation demandée pendant une simulation

- **Exigence** : une demande de navigation pendant une simulation suit les
  mêmes règles et ne met pas fin à la simulation : le coach sort du rôle par
  la ligne en italique des consignes, traite la demande, puis reprend le rôle
  par la ligne de retour, et la simulation continue.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-PRIV-20 — Navigation en simulation distincte du joker

- **Exigence** : la sortie de rôle pour une demande de navigation n'est pas un
  joker : elle n'est pas marquée comme joker dans `transcript.md` ni comptée
  au débrief.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PRIV-21 — Messages de navigation en anglais

- **Exigence** : avec l'anglais comme langue de coaching, la question
  d'accord, le message d'échec et les lignes de sortie et de retour de rôle
  sont donnés au texte anglais exact des consignes.
- **Origine** : #8
- **Statut** : ✅ Active
- **Message** : formulation fixe
