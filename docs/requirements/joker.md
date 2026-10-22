# Exigences — Joker

Aide sur la question en cours pendant une simulation, sans y mettre fin :
conseil ou réponse proposée, seule exception au principe « coach, pas
générateur de réponses ».

### REQ-JOK-01 — Rappel du joker au début de la simulation

- **Exigence** : en français, juste après le rappel des mots-clés d'arrêt et
  avant le jeu de rôle, le coach mentionne le joker par la phrase exacte des
  consignes (« Si vous bloquez sur une question, demandez un joker : … »).
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-02 — Déclenchement

- **Exigence** : « joker » au début de la première phrase d'un message, suivi
  de la demande (conseil ou réponse proposée), déclenche le joker.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-03 — Formulation équivalente

- **Exigence** : une formulation de même sens en français (« j'ai besoin d'un
  joker », « je prends un joker ») déclenche le joker de la même façon.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-04 — Joker de conseil

- **Exigence** : à une demande de conseil, le coach conseille sur la question
  posée (angle, structure, éléments du dossier à mobiliser) sans rédiger la
  réponse, puis reprend le rôle.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-05 — Question non reposée après le retour

- **Exigence** : après le retour au rôle, l'interviewer ne repose ni ne
  reformule la question, même en abrégé : au plus « Je vous écoute. », puis il
  attend la réponse à la même question.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-06 — Une ligne de sortie et une ligne de retour

- **Exigence** : chaque joker a exactement une ligne de sortie en italique
  (*Je sors du rôle des interviewers pour votre joker.*) et une ligne de
  retour (*Je reprends le rôle des interviewers.*) ; une éventuelle précision
  se fait entre les deux, sans autre annonce de rôle ni ligne de sortie
  répétée.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-07 — Demande de précision

- **Exigence** : à « joker » seul ou à une demande ambiguë, le coach ne devine
  pas : hors rôle, il demande « Souhaitez-vous un conseil pour répondre à
  cette question, ou une réponse proposée à votre place ? », puis agit selon
  la réponse.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-08 — Joker annulé : reprise du rôle

- **Exigence** : quand le candidat renonce au joker (« non, en fait c'est bon,
  pas besoin »), le coach reprend seulement le rôle par la ligne de retour et
  l'interviewer attend la réponse sans reposer la question.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-09 — Joker annulé ignoré

- **Exigence** : un joker annulé n'est ni noté dans `transcript.md`, ni compté,
  ni mentionné dans le débrief.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-10 — Réponse proposée étiquetée

- **Exigence** : une réponse proposée commence par l'étiquette
  « **Réponse proposée (joker) :** » et n'est suivie d'aucun avertissement,
  commentaire ni consigne (pas de « exemple à analyser »).
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-11 — Réponse proposée sans fait inventé

- **Exigence** : la réponse proposée ne s'appuie que sur le dossier
  professionnel et l'opportunité, n'invente ni n'exagère aucun fait, y compris
  sur un sujet non pratiqué ; ce qui a dû être supposé, et seulement cela, est
  signalé sur sa propre ligne en italique, *Supposé faute d'information : …*.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-12 — Réaction de l'interviewer à la réponse proposée

- **Exigence** : après une réponse proposée et le retour au rôle,
  l'interviewer y réagit comme à une réponse du candidat (relance ou question
  suivante).
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-13 — Jokers dans le transcript

- **Exigence** : dans `transcript.md`, un joker de conseil est noté par une
  ligne factuelle sans son contenu (*Joker : conseil demandé.*) et une réponse
  proposée prend la place du tour du candidat, avec son étiquette et la ligne
  des suppositions s'il y en a une.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-14 — Décompte des jokers au débrief

- **Exigence** : le débrief indique, pour information, le nombre de jokers
  (conseils et réponses proposées), compté d'après les seuls marqueurs du
  transcript ; sans marqueur, « Jokers : aucun ».
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-JOK-15 — Réponse proposée non évaluée

- **Exigence** : au débrief, une réponse proposée n'est pas évaluée comme celle
  du candidat : elle n'est ni un point fort ni une priorité, et peut être
  citée comme exemple en le disant.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-16 — Réponse après conseil évaluée

- **Exigence** : au débrief, la réponse donnée après un joker de conseil est
  évaluée comme toute réponse du candidat, en mentionnant le conseil reçu
  quand c'est utile.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-17 — Joker hors simulation

- **Exigence** : hors simulation (préparation, débrief, autre session), une
  demande de joker ne déclenche rien de particulier : le coach écrit sur une
  ligne en italique la phrase exacte des consignes (*Le joker ne s'utilise que
  pendant une simulation d'entretien ; voici ma réponse à votre demande.*),
  puis répond à la ligne suivante comme à une demande de coaching ordinaire.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-JOK-18 — « joker » dans une réponse

- **Exigence** : le mot « joker » ailleurs qu'au début de la première phrase
  d'un message ne déclenche rien ; le débrief ne le commente ni ne le signale
  comme anomalie.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-19 — Jokers sans limite

- **Exigence** : le nombre de jokers n'est pas limité, y compris deux de suite,
  et le décompte du débrief correspond au transcript.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-20 — Arrêt juste après un joker

- **Exigence** : un joker ne termine jamais la simulation ; une demande d'arrêt
  juste après un joker suit la règle habituelle de confirmation.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-JOK-21 — Joker en anglais

- **Exigence** : dans une simulation en anglais, le déclencheur anglais
  (« joker », « I need a joker ») fonctionne et les textes du joker sont les
  formulations anglaises exactes des consignes : rappel, lignes de sortie et de
  retour, demande de précision, « Go ahead. », étiquette « **Proposed answer
  (joker):** », *Assumed for lack of information: …*, ligne hors simulation et
  marqueur du transcript.
- **Origine** : #18, D-020
- **Statut** : ✅ Active
- **Message** : formulation fixe
