# Exigences — Référentiel de tests

Règles du référentiel qui relie les exigences du produit, les tests qui les
vérifient, l'historique des exécutions et le tableau de bord de
[`docs/test-log.md`](../test-log.md).

### REQ-QA-01 — Exigences rangées par domaine selon un modèle commun

- **Exigence** : les exigences du produit sont rangées par domaine dans
  `docs/requirements/<domaine>.md`, chacune énonçant une seule règle
  vérifiable, selon le modèle de [`README.md`](README.md) (champs Exigence,
  Origine, Statut, Message). Le README liste tous les domaines avec leur
  identifiant et un lien vers leur fichier ; les fichiers de domaine ne
  répètent pas le modèle.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-02 — Identifiants stables et statuts d'exigence

- **Exigence** : un identifiant `REQ-<DOMAINE>-NN` n'est jamais supprimé,
  réutilisé ni renuméroté. Le statut d'une exigence est 🔵 Proposée,
  ✅ Active, ⚪ Remplacée par REQ-… ou ❌ Abandonnée ; une exigence remplacée
  ou abandonnée garde son entrée.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-03 — Lien de couverture à sens unique

- **Exigence** : chaque test cite les exigences qu'il couvre par une ligne
  « Exigences ». Une exigence ne maintient pas la liste de ses tests ; la
  correspondance inverse se lit dans le tableau de bord ou par recherche.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-04 — Identifiants de tests

- **Exigence** : un test est identifié par le code de son étape dans
  `test-kit/scenario.md` (`C4`), complété au besoin par le numéro de l'invite
  (`C4.2`), ou par l'identifiant `CHK-<DOMAINE>-NN` d'un contrôle de
  [`docs/checks.md`](../checks.md). Les sessions de `docs/test-history/` et le
  tableau de bord emploient ces identifiants.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-05 — Tableau de bord par domaine

- **Exigence** : `docs/test-log.md` présente une table par domaine, avec une
  ligne par exigence 🔵 Proposée ou ✅ Active (Exigence, Résumé, Statut,
  Dernier test, Version, Tests, Session) et une remarque d'une ligne au plus
  sur l'état courant. Il ajoute les sections « Écarts ouverts » (🐞, avec
  renvoi vers l'issue ou le backlog), « À revalider » (« impacté par #N »),
  « Index par issue » et « Sessions », qui ne contiennent aucun tableau à
  colonne de statut.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-06 — Statut de test déduit des tests consignés

- **Exigence** : le statut de test d'une exigence, au tableau de bord, se
  déduit des tests effectivement consignés : ✅ Validé si tous ses tests sont
  passés sur une version postérieure à son dernier changement ; 🐞 Problème
  constaté si l'un a échoué ; ⚠️ À revalider si un changement l'a impactée
  depuis son dernier test ; ⬜ Non testé en l'absence de test consigné. Aucun
  comportement n'est validé par simple migration documentaire.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-07 — Historique conservé, sessions citant les tests

- **Exigence** : les sessions de `docs/test-history/` ne sont pas réécrites,
  y compris celles antérieures au référentiel. Toute nouvelle session cite les
  identifiants des tests joués.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-08 — Stratégie de test

- **Exigence** : `docs/test-plan.md` décrit quoi tester et quand : à
  l'ouverture d'une issue (exigences ajoutées en 🔵 Proposée ou modifiées,
  avec l'origine `#N`, et tests correspondants ⬜ ou ⚠️ au tableau de bord),
  à sa livraison (exigences proposées passées en ✅ Active), en
  non-régression ciblée (tests qui citent les exigences impactées, nommées
  par identifiant dans le plan d'implémentation) et en passe de release
  (étapes `[socle]`, puis revue des exigences ⚠️ et 🐞). Aucun tag
  `[regression]` n'est ajouté au scénario.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-09 — Contrôles ponctuels de livraison hors du référentiel

- **Exigence** : un contrôle propre à la livraison d'une issue (entrée de
  décision créée, documentation ou `CHANGELOG.md` mis à jour, issue GitHub
  corrigée) n'est pas une exigence. Il figure dans la checklist du plan de
  l'issue et est vérifié à la revue.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-10 — Contrôle automatique de la traçabilité

- **Exigence** : un script PowerShell sous `test-kit/tools/`, sans autre
  dépendance et jamais appelé par `build.bat`, vérifie la traçabilité. Il
  échoue sur un identifiant d'exigence, de contrôle ou d'étape en double ou
  mal formé, un statut d'exigence hors des quatre valeurs, une exigence citée
  qui n'existe pas, une exigence remplaçante qui n'existe pas, une exigence
  proposée ou active absente du tableau de bord, une ligne du tableau de bord
  en double, sans exigence proposée ou active, ou avec un statut de test
  inconnu, et un test de la colonne Tests qui n'existe pas ou ne cite pas
  l'exigence de sa ligne. Il signale en avertissement, sans échouer, toute
  exigence proposée ou active qu'aucun test ne cite.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-11 — Script de démo sans renvoi aux exigences

- **Exigence** : le script de démo généré par le build retire le champ
  « Exigences » des étapes, comme les attendus.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-12 — Mod de couverture compté par exigence

- **Exigence** : le mod `/test-coverage` (#19) compte une ligne par exigence
  du tableau de bord et ne compte pas les sections annexes.
- **Origine** : #19, #20
- **Statut** : 🔵 Proposée
- **Message** : aucun

### REQ-QA-13 — Prompteur aligné sur le référentiel

- **Exigence** : en fin de passe, le skill `/prompteur` rédige une session qui
  cite les tests joués et met à jour au tableau de bord les exigences citées
  par ces tests, en appliquant REQ-QA-06.
- **Origine** : #20
- **Statut** : 🔵 Proposée
- **Message** : aucun
