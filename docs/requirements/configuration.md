# Exigences — Configuration

Tenue de `data/config/workspace.yaml` par le coach : clé manquante, valeur
invalide et langues par défaut. Les clés `user` relèvent du démarrage de
session (prénom, [session.md](session.md)), la section `product_feedback` du
feedback produit.

### REQ-CONF-01 — Clé manquante ajoutée à sa place

- **Exigence** : au démarrage d'une session, chaque clé du modèle absente de
  `data/config/workspace.yaml` est ajoutée avec sa valeur par défaut, à sa
  place dans la structure du modèle ; les clés, valeurs et commentaires
  existants ne sont ni modifiés, ni réordonnés, ni supprimés.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-CONF-02 — Clé ajoutée signalée

- **Exigence** : le coach dit au candidat quelles clés il a ajoutées et avec
  quelles valeurs par défaut, en une phrase courte.
- **Origine** : #5
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-CONF-03 — Aucun ajout quand rien ne manque

- **Exigence** : quand la configuration contient toutes les clés du modèle, le
  coach ne la modifie pas et ne signale aucun ajout.
- **Origine** : #5
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-CONF-04 — Valeur invalide signalée sans réécriture

- **Exigence** : quand une clé a une valeur invalide (par exemple un non-booléen
  pour `privacy.allow_external_web_search`) ou que le fichier est mal formé, le
  coach ne réécrit pas le fichier, utilise la valeur par défaut du modèle pour
  la session, indique au candidat la clé, la valeur trouvée et la valeur
  utilisée, et lui laisse la correction.
- **Origine** : #5
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-CONF-05 — Langues par défaut

- **Exigence** : le modèle de `workspace.yaml` définit la langue du dossier
  (`language.profile`), la langue de coaching (`language.coaching`) et les
  langues des livrables (`language.deliverables`), toutes en français
  (`fr-FR`) par défaut ; un workspace neuf les reçoit sans modification.
- **Origine** : avant #5
- **Statut** : ✅ Active
- **Message** : aucun
