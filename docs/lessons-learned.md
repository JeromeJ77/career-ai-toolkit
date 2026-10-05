# Journal des difficultés

Ce document recense, au fil du projet, les difficultés propres au développement
d'un produit dont le « programme » est un ensemble de consignes exécutées par un
agent IA : faire dire ou faire précisément ce qu'on veut au coach, analyser ses
résultats, conduire le processus. Il complète le
[journal des décisions](design/decision-log.md) et le
[journal des tests](test-log.md). Son format est décidé par D-021.

L'objectif est double : mesurer le coût de ces détails, triviaux dans un
programme classique, et ne pas refaire les mêmes erreurs en écrivant les
consignes du coach.

## Enseignements

Synthèse à relire avant d'écrire ou de modifier les consignes du coach. Chaque
enseignement renvoie aux entrées qui le fondent ; il est revu quand une entrée
le contredit.

- **Toute phrase est une consigne.** Une phrase de principe écrite pour un
  lecteur humain est appliquée à la lettre ; une consigne d'action peut être
  annoncée au candidat. Relire chaque phrase comme ce que le coach en fera
  (L-001, L-004).
- **Formulations fermées et positives.** Dire ce qui est permis, mot pour mot
  quand c'est possible, plutôt qu'une interdiction vague ou partielle (« sans la
  reposer en entier ») (L-003, L-005, L-007).
- **Exemples à éviter.** Quand « ne rien dire » ne suffit pas, citer les phrases
  à éviter (L-002).
- **Règles transversales dans `workspace/AGENTS.md`.** Une règle de
  comportement valable toute la session ne reste pas dans le skill où elle est
  née (L-003).
- **Source unique explicite.** Pour un décompte ou un constat du débrief,
  désigner la seule source à utiliser (L-006).
- **Vérifier l'origine d'un fait** dans le transcript avant de conclure à une
  invention du coach (L-008).

## Modèle d'entrée

Le journal est un fichier unique, avec des entrées `L-XXX` numérotées à la
suite, jamais renumérotées. Une entrée est référencée depuis les plans, le
journal des tests, le backlog, une décision ou une autre entrée.

```markdown
## L-XXX — Titre

- **Type** : STEERING | ANALYSIS | PROCESS
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : AAAA-MM-JJ
- **Issues** : #N (facultatif)
- **Décisions** : D-XXX (facultatif)
- **Liens** : L-XXX (facultatif)
- **Modèle** : modèle IA en cause, ou « Non consigné »
- **Coût** : passes de correction ou tests supplémentaires (facultatif)

### Constat
### Cause probable
### Parade
### Vérification
```

- **Ajoutée le** : date de l'entrée, complétée par la date de chaque changement
  de statut.
- **Constat** : ce qui a été observé, avec les citations exactes et la session
  de test (`docs/test-history/`).
- **Cause probable** : l'hypothèse, présentée comme telle.
- **Parade** : la correction retenue (référence de correction du plan, par
  exemple « R8 de #15 ») et les fichiers modifiés.
- **Vérification** : le test qui confirmera la parade (étape du scénario maître,
  ligne de `docs/test-log.md`) et son résultat.

### Types

- **STEERING** : faire dire ou faire au coach exactement ce qui est voulu.
- **ANALYSIS** : erreur ou difficulté dans l'analyse des tests ou des résultats.
- **PROCESS** : processus de développement, de test ou d'outillage.

### Statuts

- **🔴 Ouverte** : difficulté constatée, sans parade décidée.
- **🟡 Parade à vérifier** : parade appliquée, pas encore confirmée par un test
  rejoué.
- **✅ Parade vérifiée** : test rejoué et validé, ou méthode appliquée avec
  succès depuis.
- **⚪ Obsolète** : difficulté disparue avec le changement du produit ou du
  modèle ; l'entrée est conservée.

## L-001 — Le coach commente sa propre procédure

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #15
- **Décisions** : D-019
- **Liens** : L-004
- **Modèle** : Sonnet 5.5
- **Coût** : deux passes de correction (R6, puis R8)

### Constat

En début de session, le coach annonce ce qu'il fait au lieu de le faire :
« First session, so here is the welcome message. » (B9), « Je commence par
l'initialisation du workspace, comme demandé par le CLAUDE.md du projet. »
(après mise à niveau), « Step 2: check existence only, without reading the
files. » (reprise). Voir les
[tests de la première session](test-history/2026-10-04-tests-manuels-premiere-session.md)
et les [tests du joker](test-history/2026-10-04-tests-manuels-joker.md).

### Cause probable

`workspace/CLAUDE.md` demandait d'exécuter `init-workspace` en début de
session : la consigne d'action est lue comme une action à annoncer. Les étapes
numérotées du skill sont recopiées telles quelles.

### Parade

R6 puis R8 de #15 : ligne fixe en italique *Lancement de la session…*
(*Starting the session…*), puis directement l'accueil ou la salutation ;
interdiction de citer les fichiers de consignes, la procédure ou ses étapes.
Fichiers : `workspace/AGENTS.md`, `workspace/CLAUDE.md`,
`init-workspace/SKILL.md`.

### Vérification

B1, B2 et B9 du scénario maître, à rejouer.

## L-002 — Phrase d'état quand rien n'a changé

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #15
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R7)

### Constat

« Votre espace carrière est prêt, et la configuration est complète. » (B2), puis
« la configuration et les fichiers obligatoires sont présents, et il ne manque
aucune clé » (reprise), alors que rien n'a été créé ni ajouté.

### Cause probable

La règle « ne rien dire quand rien n'est créé » visait les créations ; le coach
a compensé par un compte rendu global de l'état.

### Parade

R7 de #15 : aucune phrase sur l'état de l'initialisation ou de la configuration
quand rien n'a changé, avec les phrases à éviter citées en exemple
(`init-workspace/SKILL.md`, étape 6 ; `workspace/AGENTS.md`).

### Vérification

B2 du scénario maître, à rejouer.

## L-003 — Prénom répété hors salutation

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #15
- **Décisions** : D-019
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R9)

### Constat

Prénom employé dans quatre messages rapprochés pendant les simulations
(« Nadia, la simulation est terminée. », « Très bien, Nadia. »…).

### Cause probable

La règle « sans répéter le prénom à chaque message » n'était écrite que dans
`init-workspace` et n'était plus appliquée une fois le skill du coach actif ;
sa forme négative et vague laissait le coach juge de la fréquence.

### Parade

R9 de #15 : prénom permis seulement dans la salutation, l'accusé de réception du
choix et l'au revoir, règle reprise dans `workspace/AGENTS.md` et
`interview-coach/SKILL.md`. Un usage occasionnel reste une idée du backlog.

### Vérification

Ligne « Réponses à la question du prénom » de `docs/test-log.md`, sur une
session complète.

## L-004 — Un principe appliqué comme une consigne

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #18
- **Décisions** : D-020
- **Liens** : L-001
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R6)

### Constat

Après une réponse proposée, avertissement ajouté : « C'est un exemple à
analyser…, pas à mémoriser. », et la ligne des suppositions prolongée par
« Corrigez ce qui est faux… ».

### Cause probable

La phrase de principe « toujours signalée comme un exemple à analyser, jamais à
mémoriser », écrite pour situer l'exception, a été exécutée comme un message à
produire.

### Parade

R6 de #18 : « clairement étiquetée comme réponse proposée », l'étiquette
suffit, sans avertissement ni commentaire ; suppositions limitées à ce qui a été
supposé (R1).

### Vérification

D5 à D7 du scénario maître, à rejouer.

## L-005 — Question reposée après un joker

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #18
- **Décisions** : D-020
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R4)

### Constat

Au retour dans le rôle, l'interviewer repose la question en entier
(simulation 01), puis la résume (simulation 02).

### Cause probable

La règle « sans la reposer en entier » laissait la reformulation et le résumé
permis.

### Parade

R4 de #18 : la question n'est ni répétée ni reformulée, même résumée ; au plus
« Je vous écoute. » / « Go ahead. ».

### Vérification

D5 du scénario maître, à rejouer.

## L-006 — Le débrief sur-interprète un mot

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #18
- **Décisions** : D-020
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R8)

### Constat

Le mot « joker » glissé dans une réponse, qui n'a rien déclenché, est signalé
dans le débrief D8 : « Jokers : 0 marqué dans la transcription… » et
« Contradiction signalée, non tranchée ». Un joker annulé est mentionné dans le
débrief de la simulation 02.

### Cause probable

Le débrief n'avait pas de source désignée pour le décompte : il a croisé le
transcript et la conversation.

### Parade

R5 et R8 de #18 : décompte d'après les seuls marqueurs du transcript, « joker »
dans une réponse ni commenté ni signalé, joker annulé jamais mentionné,
« Jokers : aucun » sinon.

### Vérification

D6 et D8 du scénario maître, à rejouer.

## L-007 — Annonces de rôle en double

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #18
- **Décisions** : D-020
- **Modèle** : Sonnet 5.5
- **Coût** : une passe de correction (R5)

### Constat

Après un « joker » seul : ligne non prévue « Je reprendrai le rôle des
interviewers dès que vous aurez répondu. », puis ligne de sortie répétée alors
que le coach était déjà hors rôle.

### Cause probable

La règle décrivait les lignes de sortie et de retour sans en fixer le nombre ni
interdire d'autres annonces.

### Parade

R5 de #18 : une seule ligne de sortie et une seule de retour par joker, sans
autre annonce de rôle.

### Vérification

D7 du scénario maître, à rejouer.

## L-008 — Invention attribuée à tort au coach

- **Type** : ANALYSIS
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05
- **Issues** : #18
- **Modèle** : Opus 5.5 (conversation d'analyse)
- **Coût** : une correction prévue (R7 de #18) puis annulée

### Constat

Des faits absents des sources du kit (« un déploiement par semaine », « trois
équipes ») ont été attribués à une invention du coach. Ils venaient de la
première réponse de la candidate, collée par le testeur depuis le script de D4.

### Cause probable

Comparaison avec les seules sources du kit, sans relire le transcript.

### Parade

Vérifier dans `transcript.md` l'origine d'un fait avant de conclure à une
invention.

### Vérification

Appliquée dès la relecture du transcript ; R7 annulée.

## L-009 — Langue de la session

- **Type** : STEERING
- **Statut** : 🔴 Ouverte
- **Ajoutée le** : 2026-10-05
- **Issues** : aucune (idée du backlog « Supprimer `language.coaching` »)
- **Modèle** : Sonnet 5.5

### Constat

Une session commencée en anglais passe au français après la transcription des
sources et y reste alors que le testeur écrit en anglais ; `language.coaching`
valait `fr-FR` par défaut.

### Cause probable

La langue de coaching configurée l'emporte sur celle de la conversation.

### Parade

À décider pendant le grooming de l'idée du backlog.

### Vérification

Aucune pour l'instant.
