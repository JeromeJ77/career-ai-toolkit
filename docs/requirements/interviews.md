# Exigences — Entretiens

Tours d'entretien d'une opportunité : création, artefacts progressifs,
préparation, `interview.md`, questions à poser, fiche de préparation et retour
après l'entretien réel.

### REQ-ITW-01 — Tours d'entretien numérotés

- **Exigence** : chaque tour d'entretien est créé sous `interviews/` avec le
  numéro suivant sur au moins deux chiffres et le type le plus précis que les
  faits connus permettent (`01-screening`, `02-technical`…), sans
  renumérotation ; son `interview.md` porte la séquence, le type, la logistique
  connue et les incertitudes.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-02 — Artefacts créés à l'étape atteinte

- **Exigence** : `interviews/`, `preparation.md`, `simulations/` et `actual/`
  ne sont créés que lorsque le travail atteint l'étape correspondante ; aucune
  arborescence vide n'est créée d'avance.
- **Origine** : avant #5, D-006
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-03 — Entretien passé tracé sans détail inventé

- **Exigence** : un entretien déjà passé et signalé par le candidat reçoit son
  tour, avec les seuls faits connus et sans détail inventé.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-04 — Préparation sans jeu de rôle

- **Exigence** : la préparation d'un entretien reste du coaching : le coach
  pose ses questions en tant que coach, jamais en tant qu'interviewer,
  n'annonce ni entrée ni sortie de rôle et n'emploie pas les lignes de rôle en
  italique, réservées aux simulations.
- **Origine** : #12, #14
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-05 — Préparation commencée notée dans `interview.md`

- **Exigence** : dès que la préparation commence, l'`interview.md` du tour
  passe au statut « en préparation », avec la préparation « en cours » et ce
  qui a été travaillé, tant que la fiche `preparation.md` n'est pas générée.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-06 — `interview.md` à jour après chaque étape

- **Exigence** : l'`interview.md` du tour est mis à jour après chaque
  simulation, chaque débrief et quand l'entretien réel est documenté.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-07 — Revue des questions à poser

- **Exigence** : avant la fiche, le coach revoit les questions du candidat pour
  les interviewers : il reprend les idées déjà notées dans le dossier sans les
  redemander, donne son avis sur chacune, propose des reformulations et une ou
  deux questions propres à l'opportunité, présentées comme ses suggestions et
  distinctes des idées du candidat, sépare les questions de ce tour de celles
  des tours suivants, et ne consigne que ce que le candidat valide.
- **Origine** : #12, #14
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-ITW-08 — Fiche demandée sans questions travaillées

- **Exigence** : quand la fiche est demandée sans que les questions à poser
  aient été travaillées pour ce tour, le coach le signale et demande si le
  candidat veut les revoir d'abord ; à un refus, il génère la fiche avec les
  sections de questions visiblement vides, sans inventer de question.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-ITW-09 — Structure de la fiche de préparation

- **Exigence** : la fiche est un `preparation.md` par tour : première page
  autonome, lisible par les interviewers, sans points de vigilance ni rappels
  de communication ; deuxième page réservée aux notes ; détail à partir de la
  troisième page, qui commence par les points de vigilance ; aucun fait
  nouveau.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-ITW-10 — Retour après l'entretien réel

- **Exigence** : à partir des notes du candidat, sans transcript requis, le
  coach écrit `actual/notes.md` et `actual/review.md`, qui sépare faits
  observables, ressenti, interprétations possibles et améliorations, et
  propose un nouveau tour si le processus continue.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun
