# Exigences — Simulation d'entretien

Conduite d'une simulation : profondeurs, tours de parole, lignes de rôle,
arrêt et sa confirmation, transcript, simulations successives d'un même tour.

### REQ-SIM-01 — Profondeurs proposées

- **Exigence** : avant une simulation, le coach propose les profondeurs Court,
  Standard et Approfondi avec leur durée et leur nombre de questions
  indicatifs, Standard par défaut, et ne demande que les paramètres inconnus.
- **Origine** : #5, D-009
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-02 — Rappel des mots-clés d'arrêt

- **Exigence** : avant de commencer le jeu de rôle, le coach rappelle que la
  simulation peut être arrêtée à tout moment par « stop », « arrête la
  simulation », « arrêtons l'interview » ou « end the simulation ».
- **Origine** : #5, D-009
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-03 — Une question à la fois

- **Exigence** : la simulation pose une question à la fois et relance
  naturellement en fonction des réponses.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-04 — Un seul interviewer par tour

- **Exigence** : avec plusieurs interviewers, un seul parle et pose une
  question par tour de parole, sauf si le format de l'entretien l'impose.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-05 — Lignes de rôle en italique

- **Exigence** : chaque sortie du rôle d'interviewer et chaque retour sont
  marqués par une courte ligne en italique, hors du jeu de rôle (retour :
  *Je reprends le rôle des interviewers.*).
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-SIM-06 — Pas de coaching pendant le jeu

- **Exigence** : pendant le jeu de rôle, le coach ne fait ni coaching, ni
  explication de la compétence évaluée, ni mise à jour de statut qui
  interrompe la simulation.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-07 — Première simulation sans renvoi à la préparation

- **Exigence** : pour la première simulation d'un tour, le coach ne dit rien de
  ce que les interviewers ignoreront et ne présente pas la préparation comme
  une simulation.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-08 — Simulations indépendantes

- **Exigence** : chaque simulation est un entretien indépendant : les
  interviewers commencent comme pour une première rencontre et ne font jamais
  référence à une simulation précédente (pas de « rebonjour », pas de « on
  reprend »), sauf demande explicite d'un entretien de suite ; le coach le dit
  en une phrase à partir de la deuxième simulation du tour.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-09 — Numérotation des simulations

- **Exigence** : chaque simulation reçoit le répertoire `simulations/NN/`
  suivant du tour, sans réutiliser, renuméroter ni modifier une simulation
  précédente.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-10 — Nouvelle simulation : profondeur et cas redemandés

- **Exigence** : pour une nouvelle simulation, le coach redemande la
  profondeur et demande s'il faut rejouer le même cas ou un autre, en tenant
  compte des priorités du dernier débrief.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-11 — Confirmation d'un mot-clé d'arrêt

- **Exigence** : à un mot-clé d'arrêt, le coach sort du rôle et demande une
  courte confirmation qui rappelle que l'arrêt est définitif.
- **Origine** : #5, D-009, #12
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-12 — Reprise après un arrêt non confirmé

- **Exigence** : si le candidat refuse l'arrêt ou répond simplement à la
  question de l'entretien, le coach dit en italique qu'il reprend le rôle et
  la simulation repart où elle en était, en tenant compte de la réponse
  donnée.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-13 — Chaque demande d'arrêt confirmée

- **Exigence** : chaque nouvelle demande d'arrêt est confirmée de la même
  façon, même juste après une reprise du rôle ; le jeu de rôle ne s'arrête
  jamais sur une demande non confirmée.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-14 — « stop » dans une réponse

- **Exigence** : un mot-clé d'arrêt ne compte que seul ou quand le message nomme
  la simulation ou l'entretien ; un « stop » à l'intérieur d'une réponse ne
  déclenche rien.
- **Origine** : #5, D-009
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-15 — Demande d'arrêt sans mot-clé ou ambiguë

- **Exigence** : quand le candidat veut clairement s'arrêter sans mot-clé, ou
  que son message est ambigu, le coach demande la même confirmation au lieu de
  deviner.
- **Origine** : #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-SIM-16 — Pause non prise en charge

- **Exigence** : une simulation ne se met jamais en pause : à une demande de
  pause, le coach dit que ce n'est pas possible et propose d'arrêter ou de
  continuer.
- **Origine** : #5, D-009
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-17 — Arrêt confirmé

- **Exigence** : une fois l'arrêt confirmé, le coach termine immédiatement le
  jeu de rôle, dit qu'il s'arrête à la demande du candidat, sort du rôle,
  propose éventuellement de recueillir les questions que le candidat voulait
  poser, puis enchaîne sur le débrief ou le note comme prochaine action, sans
  commenter la raison de l'arrêt.
- **Origine** : #5, D-009, #12
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-SIM-18 — Transcript de la simulation

- **Exigence** : après le jeu de rôle, `transcript.md` est écrit quand une
  transcription fiable est possible : factuel, sans coaching, limité à ce qui
  a été joué, l'arrêt anticipé noté sans interprétation ; sans transcript, un
  point d'étape dans le `current-status.md` de l'opportunité dit que la
  simulation s'est arrêtée avant son terme.
- **Origine** : #5, D-009
- **Statut** : ✅ Active
- **Message** : aucun
