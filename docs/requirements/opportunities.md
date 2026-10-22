# Exigences — Opportunités

Création et tenue d'une opportunité sous `data/opportunities/` : structure,
numérotation, sources, `opportunity.md`, analyse et messages stratégiques,
statut de l'opportunité, travail avec un dossier professionnel qui n'est pas
encore prêt (refus, insistance, dérogation, nouvelle passe d'analyse).

### REQ-OPP-01 — Opportunité créée par le coach

- **Exigence** : à partir des documents ou du contexte fournis, le coach crée
  lui-même le répertoire de l'opportunité ; il ne demande pas au candidat de
  créer un répertoire ou un fichier, et ne demande que l'identifiant manquant
  (organisation, poste) quand il ne peut pas former un nom stable.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-02 — Numérotation stable des opportunités

- **Exigence** : chaque nouvelle opportunité reçoit le plus grand identifiant
  numérique existant plus un, sur au moins trois chiffres (`001-…`, `002-…`),
  sans combler de trou ni renuméroter une opportunité existante.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-03 — Structure créée avec l'opportunité

- **Exigence** : l'opportunité est créée avec `opportunity.md`,
  `current-status.md` et un répertoire `sources/`.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-04 — Trois façons de fournir l'offre

- **Exigence** : quand les documents de l'opportunité manquent, le coach
  recommande d'abord de fournir l'offre et indique les trois façons de le
  faire : la copier dans `sources/` et le dire, la joindre à la conversation,
  ou coller son texte.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-05 — Texte collé enregistré

- **Exigence** : un texte collé dans la conversation pour une opportunité est
  enregistré tel quel en Markdown sous `sources/`, avec un court en-tête qui
  dit qu'il a été collé dans la conversation et quand.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-06 — Transcription dans la langue de la source

- **Exigence** : la transcription d'une source d'opportunité garde la langue
  de l'original, mot pour mot ; elle n'est jamais traduite.
- **Origine** : #12, D-014
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-07 — `opportunity.md` dans la langue de coaching

- **Exigence** : `opportunity.md` est rédigé dans la langue de coaching, même
  quand la source est dans une autre langue ; la section Sources indique la
  langue d'origine, et les noms propres, l'intitulé officiel du poste et les
  termes techniques établis restent tels que dans la source.
- **Origine** : #12, D-014
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-08 — `opportunity.md` limité aux faits sourcés

- **Exigence** : `opportunity.md` reprend les faits utiles des sources avec
  leur provenance, distingue l'information manquante ou incertaine, et ne
  contient ni analyse d'adéquation, ni positionnement, ni interprétation.
- **Origine** : avant #5, D-005
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-09 — Analyse séparée

- **Exigence** : l'analyse de l'opportunité est écrite dans `analysis.md`, qui
  sépare faits, hypothèses, écarts et contradictions entre le dossier
  professionnel et l'offre ; l'information incertaine y est explicite.
- **Origine** : avant #5, D-005
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-10 — Synthèse orientée action

- **Exigence** : l'analyse de l'opportunité donne une synthèse orientée vers
  l'action, pas un audit exhaustif.
- **Origine** : #14
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-11 — Messages stratégiques proposés

- **Exigence** : le coach propose trois à cinq messages stratégiques pour
  l'opportunité, présentés comme des hypothèses de travail que le candidat
  peut modifier, retirer, compléter ou réordonner ; la première fois, il
  rappelle en une phrase ce qu'est un message stratégique.
- **Origine** : avant #5, #12, #14
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-12 — Message retiré conservé

- **Exigence** : dans `analysis.md`, les messages proposés restent tels
  qu'écrits, les messages validés sont notés à part, et un message retiré ou
  invalidé par le candidat passe dans « Retirés ou invalidés » avec la raison
  donnée, sans jamais être supprimé.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-13 — Statut de l'opportunité tenu à jour

- **Exigence** : le `current-status.md` de l'opportunité est mis à jour après
  chaque changement de phase, validation importante ou nouvel artefact utile ;
  il reste compact, sans état périmé, et renvoie à l'`interview.md` du tour
  pour le détail d'un entretien.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-14 — Refus bienveillant avec un dossier non prêt

- **Exigence** : tant que le dossier n'est pas `ready`, une demande directe
  d'un travail soumis au statut reçoit un refus bienveillant, fondé sur le
  statut et jamais présenté comme une sanction : le dossier n'est pas encore
  marqué prêt, le travail demandé (nommé) serait moins fiable.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-15 — Suite du refus

- **Exigence** : après le refus, le coach donne son avis sur le dossier avec
  une seule des deux suites : dossier jugé suffisant, proposition de passage à
  « prêt » (REQ-PROF-06) ; dossier jugé insuffisant, principales lacunes
  nommées, proposition de compléter d'abord le dossier et possibilité de
  continuer quand même.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-16 — Travaux soumis au statut

- **Exigence** : le refus et la mise en garde s'appliquent à l'analyse d'une
  opportunité, aux messages stratégiques, à la préparation d'un entretien, à
  la simulation, au débrief d'une simulation, à la fiche de préparation et à
  tout document dérivé qui compare le dossier à une opportunité.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-17 — Travaux toujours disponibles

- **Exigence** : quel que soit le statut du dossier, sans refus ni mise en
  garde, le candidat peut créer une opportunité, enregistrer et faire
  transcrire ses sources, compléter `opportunity.md`, créer un tour
  d'entretien, documenter un entretien déjà passé et revenir sur un entretien
  réel, tant que rien n'est analysé au regard du dossier.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-18 — Retour au dossier proposé après création

- **Exigence** : avec un dossier non prêt, après la création d'une
  opportunité, le coach propose comme étape suivante de revenir au dossier
  plutôt que l'analyse, en disant pourquoi : l'analyse serait sinon moins
  fiable.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-19 — Création et analyse dans le même message

- **Exigence** : quand le même message crée une opportunité et en demande
  l'analyse, le coach donne le refus et sa suite (REQ-OPP-14, REQ-OPP-15), pas
  la mise en garde d'après création.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-20 — Mise en garde une fois par opportunité et par conversation

- **Exigence** : le refus ou la mise en garde n'est donné qu'une fois par
  opportunité dans une même conversation ; une nouvelle demande explicite sur
  la même opportunité, plus loin dans la conversation, vaut insistance. Dans
  une conversation ultérieure, une opportunité sans dérogation ouverte reçoit
  de nouveau le refus ou la mise en garde.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-21 — Insistance et dérogation

- **Exigence** : quand le candidat insiste, le coach accepte de continuer en
  rappelant que le résultat sera moins fiable qu'avec un dossier prêt, sans
  jamais prétendre qu'il l'est autant, et consigne la dérogation (version et
  statut du dossier, date) dans le `current-status.md` de l'opportunité, en
  l'appelant « dérogation » en français.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-22 — Dérogation limitée à l'opportunité

- **Exigence** : une dérogation ne vaut que pour son opportunité : une autre
  opportunité reçoit le refus ou la mise en garde.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-23 — Rappel de dérogation

- **Exigence** : en français, à la reprise d'une opportunité dont la dérogation
  est ouverte, la réponse qui la reprend commence (après la ligne de statut
  quand il y en a une) par le rappel exact des consignes (« Rappel : cette
  opportunité est travaillée avec un dossier encore en construction ;
  l'analyse est moins fiable. »), sans bloquer le travail.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-OPP-24 — Rappel de dérogation en anglais

- **Exigence** : en anglais, le rappel de dérogation est la formulation
  anglaise exacte des consignes (« Reminder: this opportunity is being worked
  on with a profile still in progress; the analysis is less reliable. »).
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-OPP-25 — Dossier prêt : travail sans mise en garde

- **Exigence** : avec un dossier `ready`, le travail sur une opportunité se
  fait sans refus ni mise en garde liés au statut.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-26 — Passes d'analyse tracées

- **Exigence** : chaque passe d'analyse est inscrite dans la section « Passes
  d'analyse » d'`analysis.md`, avec sa date, la version et le statut du dossier
  utilisés, quel que soit ce statut.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-27 — Nouvelle passe proposée quand le dossier devient prêt

- **Exigence** : une fois le dossier `ready`, à la reprise d'une opportunité
  dont la dérogation est ouverte, le coach rappelle qu'elle a été analysée avec
  un dossier encore en construction et demande si le candidat veut une
  nouvelle passe, de sorte qu'il puisse répondre oui, plus tard ou non ; « plus
  tard » laisse la dérogation ouverte et la proposition revient à la reprise
  suivante.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-OPP-28 — Refus définitif d'une nouvelle passe

- **Exigence** : un refus définitif de la nouvelle passe est consigné dans le
  `current-status.md` de l'opportunité, et la passe n'est plus jamais proposée
  pour cette opportunité.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-29 — Nouvelle passe à tout moment

- **Exigence** : une nouvelle passe d'analyse peut être demandée à tout moment,
  quels que soient le statut et les passes précédentes ; elle conserve la
  passe précédente et son contenu.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-30 — Dérogation close par une passe avec un dossier prêt

- **Exigence** : toute passe d'analyse faite avec un dossier `ready`, proposée
  ou demandée, même après un refus définitif, clôt la dérogation, marquée close
  dans le `current-status.md` de l'opportunité.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-31 — Opportunités actives alignées sur le statut du dossier

- **Exigence** : quand le statut du dossier change (passage à `ready`, retour
  à `draft`, statut corrigé), le coach met à jour dans le même temps
  « Focus courant » et « Prochaine action » de chaque opportunité active qui
  en dépend, sans toucher aux mentions datées de version (passes,
  dérogations).
- **Origine** : #9
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-OPP-32 — Prochaine action alignée sur l'état de l'opportunité

- **Exigence** : quand l'état d'une opportunité change (pause, reprise,
  dérogation), sa « Prochaine action » est mise à jour dans le même temps et
  reste cohérente avec cet état.
- **Origine** : #9
- **Statut** : ✅ Active
- **Message** : aucun
