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
- **Ne contraindre que ce qui doit être garanti** (D-022). Pour le reste,
  décrire l'intention et le résultat attendu ; un écart de forme qui ne gêne
  pas le candidat va au backlog, et une règle qui exclut un bon comportement
  non prévu est assouplie (L-010).
- **Figer seulement les repères.** Une formulation exacte est réservée à ce que
  le candidat reconnaît d'une session à l'autre (ligne de lancement, ligne de
  statut, lignes de rôle) ; une phrase de conversation se décrit par son
  contenu obligatoire. Toute formulation figée doit exister dans chaque langue
  de coaching. Dès l'analyse, le plan justifie chaque message figé (L-012).
- **Formulations fermées et positives, là où une contrainte est nécessaire.**
  Dire ce qui est permis, mot pour mot pour un repère, plutôt qu'une
  interdiction vague ou partielle (« sans la reposer en entier ») (L-003,
  L-005, L-007). Même fermée, une formulation peut être paraphrasée (L-002,
  L-007).
- **Exemples à éviter.** Quand « ne rien dire » ne suffit pas, citer les phrases
  à éviter (L-002).
- **Règles transversales dans `workspace/AGENTS.md`.** Une règle de
  comportement valable toute la session ne reste pas dans le skill où elle est
  née (L-003).
- **Renvoyer à la règle générique, pas à un cas particulier.** Un renvoi
  « comme pour… » importe les textes exacts et les effets de la règle citée
  (L-011).
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
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05 ; vérifiée le 2026-10-05
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

B1, B2, B3, B7 et B9 rejoués le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : ligne de lancement,
puis directement l'accueil ou la salutation, sans citer les consignes ni la
procédure. En cours de session, une mention isolée des consignes (« l'une des
deux clés que je suis autorisé à modifier », B1), notée au backlog.

## L-002 — Phrase d'état quand rien n'a changé

- **Type** : STEERING
- **Statut** : 🔴 Ouverte
- **Ajoutée le** : 2026-10-05 ; parade insuffisante le 2026-10-05
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

B2 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : « Votre espace carrière est en place,
mais votre dossier professionnel est encore vide… », variante de la phrase
exclue ; B3 sans phrase d'état. Écart mineur, reporté au backlog sans nouvelle
parade (D-022, L-010) ; piste notée : dire ce qui est attendu après la
salutation plutôt qu'allonger la liste des phrases à éviter.

## L-003 — Prénom répété hors salutation

- **Type** : STEERING
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05 ; vérifiée le 2026-10-05
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

Session complète D1 à D6 du 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : aucun prénom hors
salutation ; au revoir « À bientôt, Nadia. » (B7). Une occurrence naturelle en
B7 (« Vous avez raison, Nadia. »), jugée bonne par le testeur : la règle est à
assouplir (backlog, L-010).

## L-004 — Un principe appliqué comme une consigne

- **Type** : STEERING
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05 ; vérifiée le 2026-10-05
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

D5 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : réponse proposée étiquetée, sans
avertissement ni commentaire ; ligne des suppositions limitée à ce qui a été
supposé.

## L-005 — Question reposée après un joker

- **Type** : STEERING
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05 ; vérifiée le 2026-10-05
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

D5 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : après chaque retour dans le rôle,
« Je vous écoute. » seul, sans reposer la question.

## L-006 — Le débrief sur-interprète un mot

- **Type** : STEERING
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05 ; vérifiée le 2026-10-05
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

D6 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : « Jokers : 2 (1 conseil, 1 réponse
proposée) », d'après les seuls marqueurs ; jokers annulés non mentionnés ;
« joker » et « stoppé » glissés dans les réponses traités comme du contenu, sans
anomalie signalée. D8 (debrief dans une nouvelle conversation) non rejoué.

## L-007 — Annonces de rôle en double

- **Type** : STEERING
- **Statut** : 🔴 Ouverte
- **Ajoutée le** : 2026-10-05 ; parade insuffisante le 2026-10-05
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

D5 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : plus d'annonce « Je reprendrai le
rôle… », mais la ligne de sortie est encore répétée entre la question de
clarification et la réponse proposée. Écart mineur, reporté au backlog sans
nouvelle parade (D-022, L-010). Cause probable : la réponse du candidat à la
clarification arrive dans un nouveau tour, et le coach réapplique « joker →
ligne de sortie ».

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

B9 rejoué le 2026-10-05 ([session du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md)) : sans règle, le coach signale de
lui-même que la configuration fixe le français alors que la conversation est en
anglais et propose de basculer ; sur demande, il passe le dossier et le coaching
en anglais, en dehors de la règle des clés modifiables (backlog).

## L-010 — Trop contraindre le modèle ferme des portes

- **Type** : STEERING
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-05
- **Issues** : #15, #18
- **Décisions** : D-022
- **Liens** : L-002, L-003, L-007, L-009
- **Modèle** : Sonnet 5.5

### Constat

Aux [tests du 2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md),
plusieurs comportements non prévus se sont révélés meilleurs que la règle,
parfois en la contredisant : alerte sur la langue configurée et passage à
l'anglais sur demande (B9, hors des seules clés `user.*` modifiables), écart
d'identité entre le prénom et les sources (B1), question plutôt que supposition
sur « oker » et « top » (D5), prénoms et rôles des interviewers (D5), « Vous
avez raison, Nadia. » (B7, hors des trois messages permis). À l'inverse, des
règles fermées ont été paraphrasées ou contournées (L-002, L-007). Le testeur
avait reçu la même recommandation en formation : ne pas trop contraindre un
modèle.

### Cause probable

Chaque correction ferme une règle pour supprimer un écart observé ; la
contrainte exclut aussi des comportements utiles qu'on n'avait pas imaginés, et
elle reste fragile face à la paraphrase. Plus les modèles progressent, plus le
coût d'une contrainte inutile augmente.

### Parade

D-022 : contraindre seulement ce qui doit être garanti (données du candidat,
absence d'invention, validations, rôle de coach, mécanismes que le candidat
doit reconnaître) ; décrire l'intention et le résultat attendu pour le reste ;
reporter au backlog les écarts de forme qui ne gênent pas ; assouplir une règle
qui exclut un bon comportement. Règles à assouplir et défauts mineurs notés au
backlog.

### Vérification

Au prochain changement des consignes du coach : vérifier que les nouvelles
contraintes portent sur ce qui doit être garanti, puis, au pilote, que les
comportements laissés libres ne gênent pas les candidats.

## L-011 — Un renvoi « comme pour… » importe les textes exacts de l'autre règle

- **Type** : ANALYSIS
- **Statut** : ✅ Parade vérifiée
- **Ajoutée le** : 2026-10-05
- **Issues** : #8, #18
- **Liens** : L-003, L-006
- **Modèle** : Opus 5.5 (analyse), Sonnet 5.5 (implémentation)

### Constat

À la revue de l'implémentation de #8, la règle de navigation web pendant une
simulation demandait de sortir du rôle « as for the joker ». La consigne venait
du plan d'analyse (« sortie de rôle comme pour le joker »). Or la sortie du
joker a un texte exact qui nomme le joker, et le débrief compte les jokers à
partir des seuls marqueurs du transcript. Aucun test n'a encore été joué.

### Cause probable

Le renvoi visait un mécanisme (sortir du rôle en italique, puis y revenir),
mais le coach applique la règle citée telle qu'elle est écrite, avec ses
messages exacts et ses effets (marqueur, décompte). Dans l'analyse, le joker
était l'exemple le plus récent de sortie de rôle, ce qui a masqué la règle
générique de changement de rôle, plus ancienne.

### Parade

R1 de #8 : renvoyer à la règle générique de changement de rôle de
`interview-simulation-guidelines.md`, avec ses lignes génériques, et dire
explicitement que la demande de navigation n'est pas un joker (ni marqueur, ni
décompte).

### Vérification

D13 du scénario maître : lignes génériques de sortie et de retour, aucun joker
dans `transcript.md` ni au débrief.

Joué le 2026-10-05 (une seule exécution) : lignes génériques *Je sors du rôle
des interviewers.* et *Je reprends le rôle des interviewers.* en italique,
aucun marqueur de joker dans `transcript.md`, aucun joker compté au débrief
en dehors des jokers d'indice réellement joués. Voir la
[session du 2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md).

## L-012 — Une décision de méthode non appliquée à l'analyse suivante

- **Type** : PROCESS
- **Statut** : 🟡 Parade à vérifier
- **Ajoutée le** : 2026-10-08
- **Issues** : #9
- **Décisions** : D-010, D-022
- **Liens** : L-002, L-007, L-010
- **Modèle** : Opus 5.5 (analyse)

### Constat

À la revue de #9 (commit 3bc6b1f), le développeur a relevé que la section
« Professional profile status » de `workspace/AGENTS.md` impose une dizaine de
messages mot pour mot, chacun en français et en anglais : refus et ses deux
suites, proposition de passage à « prêt », mise en garde après création,
insistance, rappel, nouvelle passe d'analyse. Ces messages venaient du plan
d'analyse (section « Messages exacts »), rédigé le 2026-10-07, deux jours après
l'adoption de D-022. La plupart sont des phrases de conversation, que D-022
demande de décrire par leur contenu. Aucun test n'a encore été joué.

### Cause probable

D-022 et l'enseignement « Ne contraindre que ce qui doit être garanti » sont
écrits pour la rédaction des consignes du coach, pas pour l'analyse d'un
ticket : rien dans le rôle de la conversation d'analyse ne demandait de
justifier chaque formulation exacte. L'enseignement voisin « Formulations
fermées et positives » a pris le dessus, et chaque message figé appelait sa
version anglaise, ce qui a multiplié le texte sans qu'on mesure le coût.

### Parade

- R10 de #9 : seuls la ligne de statut et le rappel de dérogation restent
  figés (repères reconnus d'une session à l'autre) ; les autres messages sont
  décrits par leur contenu obligatoire, avec les invariants gardés fermes.
- D-022 précisée le 2026-10-08 : critère des repères, coût bilingue, point de
  contrôle à l'analyse.
- Point de contrôle ajouté au rôle de la conversation d'analyse dans le
  `AGENTS.md` racine et aux « Enseignements » ci-dessus.

### Vérification

Au prochain ticket qui ajoute des messages au candidat : le plan indique, pour
chaque message, s'il est figé ou décrit par son contenu, avec la raison au
regard de D-022.
