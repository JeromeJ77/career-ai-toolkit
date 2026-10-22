# Exigences — Dossier professionnel

Écriture contrôlée de `data/profile/professional-profile.md` : validation avant
écriture, statut et version de l'en-tête, historique synthétique, statut
invalide et perte du dossier.

### REQ-PROF-01 — Squelette vide à la création

- **Exigence** : le dossier créé depuis le modèle est un squelette vide, au
  statut `empty` et à la version `0.1` ; le coach ne le remplit qu'au travers
  du workflow d'initialisation du dossier, avec la validation du candidat.
- **Origine** : #5, #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-02 — Validation avant toute écriture

- **Exigence** : aucune modification n'est appliquée au dossier sans
  validation explicite du candidat ; le coach présente d'abord les ajouts,
  corrections, remplacements et retraits proposés, avec leur effet sur le
  statut et la version.
- **Origine** : avant #5, #9
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-03 — Dossier initial proposé à partir des sources

- **Exigence** : à l'initialisation, le coach présente un dossier initial
  complet tiré des sources et signale ce qui est flou ou contradictoire
  (dates, chevauchements, rôle réel, niveau d'une compétence) au lieu de le
  trancher lui-même.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-04 — Première modification validée

- **Exigence** : la première modification validée d'un dossier `empty` le
  passe à `draft` (en construction), version `0.2`, avec la date du jour et
  une entrée d'historique.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-05 — Une seule incrémentation de version par session

- **Exigence** : une session qui applique au moins une modification validée
  augmente la version de 0.1 une seule fois, quel que soit le nombre de
  modifications ; la numérotation continue `0.9` → `0.10`.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-06 — Passage à « prêt » proposé par le coach

- **Exigence** : quand le coach juge le dossier suffisant pour travailler sur
  des opportunités après une mise à jour validée, il propose le passage à
  `ready` : il dit que le dossier lui semble suffisant, donne la version qu'il
  prendra et demande si le candidat a d'autres informations à ajouter
  d'abord ; il peut citer les lacunes restantes sans en faire une condition.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-07 — Informations ajoutées avant « prêt »

- **Exigence** : tant que le passage à `ready` n'est pas validé, une
  modification validée laisse le dossier en `draft`.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-08 — Passage à « prêt » validé

- **Exigence** : le passage à `ready`, appliqué seulement avec la validation du
  candidat, donne la version majeure suivante en `.0` (`1.0` la première fois,
  `2.0` après un retour en construction depuis `1.x`), même si la session a
  déjà augmenté la version, et il est inscrit dans l'en-tête et l'historique.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-09 — « Prêt » demandé par le candidat

- **Exigence** : quand le candidat demande lui-même le passage à `ready`, la
  demande vaut validation ; si le coach juge que des lacunes importantes
  restent, il exprime d'abord sa réserve, cite les lacunes et demande
  confirmation ; la décision du candidat s'applique.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-10 — Proposition de « prêt » refusée

- **Exigence** : une proposition de passage à `ready` refusée, même sans
  raison, ne change rien et n'ajoute aucune entrée d'historique ; le coach ne
  la renouvelle pas dans la même session.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-11 — Historique de chaque changement de statut ou de version

- **Exigence** : chaque changement de statut ou de version, correction d'un
  statut invalide et retour en construction compris, ajoute une entrée à
  « Historique synthétique » : date, statut et version avant et après, raison
  en une ligne, validation du candidat.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-12 — Statut inconnu

- **Exigence** : quand la ligne « Statut » de l'en-tête contient une valeur
  hors de la liste (par exemple « brouillon initial »), le coach remplace la
  ligne de statut par un court signalement, ne l'interprète pas, propose une
  valeur déduite du contenu (`empty` pour le squelette, `draft` pour un
  dossier rempli, jamais `ready`), garde la version lue, et ne corrige
  l'en-tête qu'après accord explicite, avant tout travail qui demande un
  dossier `ready` ; jusque-là, le dossier est traité comme non prêt.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-13 — Statut absent

- **Exigence** : quand la ligne « Statut » manque, le coach applique la même
  règle qu'à un statut inconnu (REQ-PROF-12).
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-14 — Version illisible ou en-tête incohérent

- **Exigence** : une version illisible ou un en-tête incohérent (`empty` avec
  un dossier rempli, `ready` avec une version `0.x`) suit la même règle qu'un
  statut inconnu (REQ-PROF-12) ; pour une version illisible, le coach propose
  `0.1` pour le squelette ou une version pour un dossier rempli.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-PROF-15 — Retour en construction

- **Exigence** : le retour de `ready` à `draft`, demandé par le candidat ou
  proposé par le coach (réorientation, refonte importante), n'est appliqué
  qu'après validation ; la version continue (`1.0` → `1.1`, `1.3` → `1.4`).
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-16 — Mises à jour courantes d'un dossier prêt

- **Exigence** : une mise à jour validée d'un dossier `ready` augmente la
  version mineure (`1.0` → `1.1`) sans changer le statut.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-PROF-17 — Dossier supprimé

- **Exigence** : quand `data/profile/professional-profile.md` manque alors que
  des sources ou l'état courant montrent qu'il existait, le coach signale
  l'incohérence et une perte possible à la place de la ligne de statut, ne
  recrée pas le squelette et ne réécrit rien avant la décision du candidat ; il
  propose de reconstruire le dossier depuis les sources, de restaurer une
  copie ou de vérifier un outil de synchronisation.
- **Origine** : #5, #12, #9
- **Statut** : ✅ Active
- **Message** : contenu requis
