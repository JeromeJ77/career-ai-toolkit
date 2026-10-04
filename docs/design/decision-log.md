# Journal des décisions de conception

Ce document conserve les décisions et intentions qui expliquent la conception
technique et comportementale de Career AI Toolkit. Il complète la
[référence de conception du workflow](01-career-ai-toolkit-workflow-design.md),
qui décrit l'état canonique du produit, sans la remplacer.

L'objectif est de préserver le « pourquoi » afin qu'une évolution future ne
supprime pas accidentellement une propriété importante du toolkit.

## Modèle d'entrée

Le journal reste un fichier unique, avec des entrées `D-XXX` numérotées à la
suite. Chaque entrée suit ce modèle ; la rigueur attendue est proportionnée à
l'importance du choix.

```markdown
## D-XXX — Titre

- **Type** : ARCH | PRODUCT | UX | COACHING | PROCESS
- **Statut** : ✅ Adoptée
- **Date** : AAAA-MM-JJ
- **Issue** : #N (facultatif)

### Contexte
### Options considérées
### Décision et intention
### Conséquences
### Conditions de réévaluation
```

- **Date** : date de la décision, éventuellement complétée par les dates où
  elle a été confirmée ou précisée. Une entrée migrée vers ce modèle garde sa
  date de décision et ajoute une ligne `- **Migrée au modèle le** : AAAA-MM-JJ
  (#N)`.
- **Contexte** : la situation et le problème qui appellent une décision.
- **Options considérées** : les alternatives significatives et la raison
  synthétique de leur rejet. Une entrée migrée ne reconstruit jamais après coup
  des alternatives qui n'ont pas été réellement étudiées : elle indique
  « Non documentées à l'époque ».
- **Décision et intention** : ce qui est décidé et pourquoi.
- **Conséquences** : effets attendus ou constatés sur le produit, les documents
  et le processus.
- **Conditions de réévaluation** : les circonstances qui justifieraient de
  revoir la décision. La section peut rester vide, mais la question est
  toujours examinée : l'absence de condition s'écrit « Aucune identifiée ».
- Une section facultative **Questions ouvertes** peut être ajoutée tant que des
  points restent à trancher ; elle disparaît quand ils le sont.

Une alternative rejetée n'a pas sa propre entrée, sauf si elle a été étudiée en
détail, expérimentée, mise en œuvre pendant un temps ou a eu un impact
significatif. Dans ce cas, l'entrée porte le statut ❌ Rejetée ou ⚪ Remplacée.

### Types

La liste est volontairement courte. Les codes sont en anglais, comme
métadonnées techniques. Elle ne s'enrichit que face à un besoin récurrent et
réel.

- **ARCH** : architecture et choix techniques structurants.
- **PRODUCT** : vision, périmètre et comportement du produit.
- **UX** : expérience utilisateur et interactions.
- **COACHING** : principes et comportements de coaching.
- **PROCESS** : développement, validation, gouvernance.

## Statuts

- **✅ Adoptée** : décision appliquée et considérée comme une contrainte actuelle.
- **🟡 Comportement actuel, intention à confirmer** : comportement déjà présent,
  mais justification ou portée encore à valider.
- **🔵 Envisagée** : orientation conservée pour le grooming ; elle ne constitue pas
  encore un engagement de mise en œuvre.
- **⚪ Remplacée** : décision historique conservée, avec un lien vers celle qui la
  remplace.
- **❌ Rejetée** : orientation étudiée puis écartée sans être remplacée par une
  autre décision ; l'entrée conserve la raison du rejet.

## D-001 — Utiliser le workspace comme mémoire durable

- **Type** : ARCH
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Les conversations avec un assistant sont temporaires, peuvent être interrompues
et ne sont pas toujours accessibles depuis une nouvelle session.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Le workspace porte la continuité durable du travail. Les conversations restent
ciblées sur un objectif courant et le coach maintient les fichiers nécessaires
pour qu'une autre conversation puisse reprendre sans historique de chat.

Cette décision vise la portabilité, l'auditabilité et l'indépendance vis-à-vis
d'un fournisseur ou d'une fonctionnalité de mémoire conversationnelle.

### Conséquences

- Les états courants indiquent le périmètre, le point de reprise et la prochaine
  action, sans devenir des journaux détaillés.
- Les informations nécessaires à une reprise doivent exister sur disque avant
  la fin d'une session productive.
- Un workflow qui dépend uniquement d'un échange passé est incomplet.

### Conditions de réévaluation

Aucune identifiée.

## D-002 — Conserver les skills à la racine du workspace

- **Type** : ARCH
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-29
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Le coach doit pouvoir découvrir et utiliser directement ses instructions,
références et modèles depuis le répertoire ouvert par l'agent.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Conserver `skills/` à la racine du workspace comme partie générique du moteur.
Cet emplacement explicite correspond à l'usage direct des skills par l'agent et
à une organisation réutilisable par les outils compatibles avec ce type de
workflow.

### Conséquences

- Les skills peuvent être lus sans dépendre des données privées du parcours.
- Leur emplacement doit rester stable ou faire l'objet d'une migration
  documentée.
- La future procédure de mise à jour doit pouvoir remplacer les composants
  génériques sans écraser les données utilisateur.

### Conditions de réévaluation

Revoir l'emplacement si les outils pilotes cessent de découvrir directement les
skills à la racine du workspace, ou si un mode de distribution impose une autre
structure.

## D-003 — Désactiver la navigation web par défaut

- **Type** : PRODUCT
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-29, confirmée le 2026-09-30
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

`data/config/workspace.yaml` définit actuellement
`privacy.allow_external_web_search: false`. Des références externes peuvent
néanmoins être utiles pour initialiser ou enrichir le dossier professionnel.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Le coach ne consulte pas le web par défaut. L'intention est de préserver un
travail en huis clos, de limiter les informations manipulées et de garantir la
traçabilité des sources effectivement utilisées.

L'utilisateur peut activer la navigation de façon permanente en passant le
paramètre à `true`. Lorsqu'elle est désactivée, le coach peut faire une
exception ponctuelle uniquement si l'utilisateur la demande explicitement, par
exemple pour compléter une référence utile au dossier professionnel, ou pour
extraire directement les informations d'une offre d'emploi à partir de son lien
afin de gérer une opportunité. Cela évite à l'utilisateur de copier-coller
l'offre : il fournit le lien et le coach récupère les informations pertinentes.

### Conséquences

- Les références publiques ne sont consultées que sur demande explicite ou après
  activation du paramètre.

### Conditions de réévaluation

Revoir le défaut si les retours pilotes montrent que la désactivation freine
l'usage plus qu'elle ne protège, ou si une navigation avec traçabilité des
sources devient fiable.

### Questions ouvertes

- Vérifier si cette préférence est seulement une instruction comportementale ou
  si les outils pilotes permettent aussi de la faire respecter techniquement.
- Définir comment importer LinkedIn, GitHub ou d'autres références publiques
  sans laisser croire qu'une ressource inaccessible a été consultée.
- L'import web automatique du dossier professionnel reste hors de la v0.4.0.

## D-004 — Séparer le moteur des données sous `data/`

- **Type** : ARCH
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-29, précisée le 2026-09-30
- **Issue** : #5
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

La structure précédente mélangeait, à la racine du workspace, les composants
génériques distribués par le toolkit et les emplacements qui reçoivent les
données privées. Copier une nouvelle version du toolkit pouvait donc entrer en
conflit avec des fichiers utilisateur.

### Options considérées

- **Conserver la structure précédente** (composants génériques et données à la
  racine) : rejetée, car une mise à jour par copie entrait en conflit avec les
  fichiers utilisateur.
- **Placer les modèles sous un `skills/assets/` partagé**, comme envisagé au
  départ : rejetée, car l'initialisation est un workflow à part entière,
  propriétaire de ses modèles (voir ci-dessous).

### Décision et intention

Regrouper toutes les données utilisateur sous `data/` et conserver le moteur
(`skills/`, instructions, README) en dehors. Le périmètre de `data/` comprend :
`config/`, `profile/` (dossier professionnel et sources), `cv/`,
`opportunities/`, `archives/`, `feedback/` et `current-status.md`.

Dans le ZIP distribué, `data/` ne contient que des `README.md` : aucun fichier de
travail initialisé. Les fichiers obligatoires (`config/workspace.yaml`,
`profile/professional-profile.md`, `profile/sources/external-references.md`,
`current-status.md`) sont créés lors de la première utilisation à partir des
modèles conservés sous `skills/init-workspace/assets/`. Le modèle du
questionnaire de retour pilote y vit aussi, en source unique ; le fichier
`data/feedback/pilot-feedback.md` n'est créé qu'à la demande de l'utilisateur.

Les modèles vivent sous `skills/init-workspace/assets/` (et non sous un
`skills/assets/` partagé, comme envisagé au départ) : l'initialisation est un
workflow à part entière, propriétaire de ses modèles, et le futur entretien
d'initialisation pourra s'y rattacher. Les modèles de livrables (opportunité,
entretien, débrief, etc.) restent sous `skills/interview-coach/assets/`.

Le « premier lancement » n'est pas détecté par un marqueur : le coach crée
chaque fichier obligatoire absent, sans jamais écraser un fichier existant.
Une initialisation partielle est ainsi réparée à la session suivante. Une clé
absente de `workspace.yaml` (par exemple ajoutée au modèle par une mise à jour)
est ajoutée au fichier avec sa valeur par défaut, à sa place dans la structure
du modèle, puis signalée à l'utilisateur ; les clés, valeurs et commentaires
existants ne sont jamais modifiés. Une clé existante dont la valeur est invalide (ou un
fichier mal formé) n'est jamais réécrite : le coach utilise le défaut du modèle
pour la session, signale la clé, la valeur rencontrée et le défaut utilisé, et
laisse l'utilisateur corriger. Constaté lors d'un test de déploiement : appliquer seulement le
défaut en mémoire laissait le fichier opaque pour l'utilisateur. Question
ouverte : proposer l'ajout et demander confirmation plutôt que l'écrire
directement.

`build.bat` vérifie la séparation : il échoue si `data/` contient autre chose que
des `README.md` ou si le moteur contient un fichier de travail initialisé.

### Conséquences

- Une mise à jour peut copier le ZIP entier par-dessus un workspace existant
  sans écraser de donnée utilisateur (procédure détaillée : issue #7, reportée
  à la v0.5.0).
- Le doublon entre `workspace/feedback/pilot-feedback.md` et
  `docs/pilot-feedback.template.md` disparaît.
- Tous les chemins du workspace, des instructions et de la documentation
  utilisent le préfixe `data/`.

### Conditions de réévaluation

Revoir la séparation si le test réel de mise à jour et de rollback (issue #7)
montre que la copie du ZIP par-dessus un workspace existant ne protège pas les
données utilisateur.

### Questions ouvertes

- Définir le manifest, les versions de schéma et les migrations nécessaires.
- Tester réellement la mise à jour et le rollback avant de la présenter comme
  une garantie utilisateur (issue #7).
- La procédure de mise à jour, le marqueur de version du moteur et la détection
  de mise à jour par le coach (issue #7) sont reportés à la v0.5.0, avec
  l'intégration de Git local (issue #6) : les pilotes partent d'une
  installation neuve en v0.4.0. Seul un marqueur côté moteur est livré dès la
  v0.4.0 : `ENGINE-VERSION` à la racine du ZIP, généré par le build depuis
  `VERSION`, pour identifier la version installée (une v0.3.0 n'en a pas). Il
  n'est ni recopié dans les données ni lu par le coach ; sa forme pourra être
  revue par l'issue #7. La détection devra traiter un workspace sans marqueur
  dans ses données comme issu d'une version antérieure ou égale à la v0.4.0.

## D-005 — Séparer sources, représentation canonique et analyse

- **Type** : ARCH
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Une offre originale, sa transcription exploitable et l'analyse du coach n'ont
pas le même niveau de preuve. Les mélanger rendrait les faits difficiles à
distinguer des hypothèses ou du positionnement proposé.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Préserver les sources originales autorisées sans modification, maintenir leur
représentation textuelle canonique dans `opportunity.md` et conserver l'analyse
dérivée dans `analysis.md`.

Cette séparation rend la provenance visible, limite les inventions et permet de
réviser l'analyse sans réécrire la source.

### Conséquences

Non documentées à l'époque ; voir D-011 et D-014 pour les extensions.

### Conditions de réévaluation

Aucune identifiée.

## D-006 — Créer les artefacts progressivement

- **Type** : PRODUCT
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Une arborescence préremplie de fichiers vides ajoute du bruit et peut faire
croire qu'une étape du workflow a été réalisée.

### Options considérées

- **Préremplir une arborescence de fichiers vides** : rejetée, car elle ajoute du
  bruit et peut faire croire qu'une étape a été réalisée.

### Décision et intention

Le coach crée les opportunités, étapes d'entretien, simulations et artefacts
uniquement lorsque le workflow les atteint. Le candidat fournit le contenu et
valide les décisions métier ; il n'a pas à maintenir lui-même la structure
technique.

### Conséquences

Non documentées à l'époque.

### Conditions de réévaluation

Aucune identifiée.

## D-007 — Recommander une nouvelle conversation lors d'un changement de périmètre

- **Type** : COACHING
- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-29
- **Issue** : #11
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Une conversation longue qui mélange plusieurs opportunités ou tâches transverses
dégrade la lisibilité du contexte et augmente le risque de confondre les
artefacts concernés.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Orientation, non encore un engagement : lorsque l'utilisateur change
manifestement de périmètre, le coach proposerait de clôturer proprement le
travail courant, d'enregistrer son état sur disque, puis de poursuivre dans une
nouvelle conversation. Un commit Git pourrait servir de checkpoint lorsqu'un
dépôt local est disponible et après validation de l'utilisateur.

Cette orientation vise à optimiser le contexte actif sans perdre la continuité,
qui reste portée par le workspace.

### Conséquences

Non documentées à l'époque.

### Conditions de réévaluation

Renoncer à l'orientation si les pilotes jugent les propositions de changement de
conversation intrusives ou trop fréquentes.

### Questions ouvertes

- Définir le seuil entre une demande connexe et un véritable changement de
  périmètre.
- Définir la consigne de reprise transmise à la nouvelle conversation.
- Éviter de multiplier inutilement les conversations pour des tâches brèves.

## D-008 — Séparer la capture des idées de leur grooming

- **Type** : PROCESS
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-30
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Les nouvelles idées peuvent arriver sous une forme libre, textuelle ou visuelle.
Leur reformulation, leur analyse et leur transformation immédiate en issues dans
une même passe risqueraient de perdre une nuance, d'effacer une piste différée
ou de rendre difficile la comparaison avec l'intention initiale.

### Options considérées

- **Reformuler, analyser et créer les issues en une seule passe** : rejetée,
  car elle risquait de perdre une nuance, d'effacer une piste différée ou de
  rendre difficile la comparaison avec l'intention initiale.

### Décision et intention

Le cycle distingue trois points de contrôle Git :

1. un commit de capture conserve dans le backlog une version française
   structurée, fidèle et relue de toutes les nouvelles idées avant grooming ;
2. un commit de planification conserve la table synthétique validée des issues
   candidates, leur périmètre, leur priorité, leur taille et leurs dépendances ;
3. un commit séparé nettoie le backlog après la création validée des issues
   GitHub correspondantes.

Entre le premier et le deuxième checkpoint, l'ensemble du backlog et les issues
existantes sont analysés pour détecter les recouvrements, contradictions,
questions de faisabilité et dépendances. Le périmètre de release est décidé avec
l'auteur et seuls les éléments retenus sont découpés en issues candidates. Entre
le deuxième et le troisième checkpoint, chaque issue est revue et approuvée
individuellement avant sa création.

### Conséquences

- Une idée claire passe malgré tout par le backlog afin de préserver un point de
  comparaison commun et auditable.
- Le premier commit conserve l'intention proposée ; il ne signifie pas que
  l'idée est priorisée ou acceptée pour une release.
- Le deuxième commit conserve le découpage et l'ordre de mise en œuvre validés,
  même après la suppression de la table temporaire du backlog.
- Les images ou scans servent de sources d'entrée, mais le checkpoint versionné
  est leur transcription textuelle validée. Aucun contenu personnel ou
  confidentiel ne doit être ajouté au dépôt.
- Les idées différées ou non résolues restent dans le backlog après création des
  issues sélectionnées.
- La création des issues GitHub se déroule entre les deuxième et troisième
  commits et nécessite une validation explicite, issue par issue.

### Conditions de réévaluation

Alléger le cycle si les trois checkpoints deviennent disproportionnés pour de
petites évolutions.

## D-009 — Trois profondeurs de simulation et arrêt anticipé par mot-clé

- **Type** : COACHING
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-30
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Le standalone parlait de format « court, standard ou approfondi » alors que le
backlog évoquait « short, medium, deep », sans durée, nombre de questions ni
moyen documenté d'interrompre une simulation.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Trois profondeurs françaises, avec équivalent anglais : Court (short),
Standard (standard, par défaut) et Approfondi (deep), décrites par une durée et
un nombre de questions indicatifs. Les mots-clés « stop », « arrête la
simulation », « arrêtons l'interview » et « end the simulation » arrêtent la
simulation ; le coach débriefe alors uniquement ce qui a été joué et propose une
nouvelle simulation.

Pour limiter les faux déclenchements, un mot-clé compte comme message à part ou
lorsqu'il nomme la simulation ou l'interview. Si l'intention d'arrêter est claire
sans mot-clé, ou si le message est ambigu, le coach demande confirmation. Les
formulations évoquant une pause sont exclues et réservées à l'issue n° 3 ; le
coach indique que la pause n'est pas encore prise en charge.

### Conséquences

- Les durées et nombres de questions sont des ordres de grandeur, à ajuster
  après les retours du pilote.
- Un débrief après arrêt n'évalue pas ce qui n'a pas été joué et n'interprète
  pas la raison de l'arrêt.

### Conditions de réévaluation

Ajuster les durées et nombres de questions après les retours du pilote ; revoir
les mots-clés d'arrêt s'ils provoquent des faux déclenchements ou des arrêts
manqués.

### Questions ouvertes

- Durées et nombres de questions : ordres de grandeur validés par l'auteur, à
  ajuster après le pilote.
- Lors de l'issue n° 3, choisir des formulations de pause distinctes des
  mots-clés d'arrêt.
- Après un arrêt, le coach propose de façon facultative de recueillir les
  questions du candidat pour le débrief ; il écrit le transcript s'il est
  disponible, sinon un checkpoint dans `current-status.md`.

## D-010 — Statut et version du dossier professionnel décidés avec le candidat

- **Type** : PRODUCT
- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-30
- **Issue** : #9
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Traiter une opportunité avec un dossier professionnel trop pauvre dégrade les
analyses et le coaching, et peut faire percevoir l'outil comme
contreproductif avant même d'avoir travaillé avec des données de qualité.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Orientation, non encore un engagement : le dossier porte un statut (`empty` ou
`initial`, `draft`, `ready`, valeurs à confirmer) et une version : `0.1`, `0.2`,
`0.3`… au fil des sessions de construction, puis `1.0` au passage à `ready`. Ce
passage est une décision prise d'un commun accord : le coach estime que les
informations sont suffisantes et le propose, sauf si le candidat a d'autres
informations à ajouter, et le candidat valide. `ready` marque un seuil
opérationnel, non un état final.

Tant que le dossier n'est pas `ready`, le coach refuse gentiment de traiter une
opportunité. Si le candidat insiste, il continue en gardant le statut explicite
et en prévenant que la qualité sera dégradée, avec un rappel au début de chaque
nouvelle session.

### Conséquences

Non documentées à l'époque.

### Conditions de réévaluation

Revoir le refus de traiter une opportunité si les pilotes le perçoivent comme
bloquant, ou si le seuil `ready` s'avère trop difficile ou trop facile à
atteindre.

### Questions ouvertes

- Valeurs exactes du statut.
- Règle d'incrément des versions `0.x` : à chaque session qui modifie le dossier
  ou seulement à un jalon validé.
- Le score de complétion en pourcentage est différé à la v0.5.0.

## D-011 — Transcrire chaque source du dossier en Markdown

- **Type** : PRODUCT
- **Statut** : ✅ Adoptée
- **Date** : 2026-09-30
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Lors d'un test de déploiement avec un collègue, le coach qui transcrivait chaque
source en Markdown à côté de l'original donnait de bons résultats : les sessions
suivantes n'avaient plus à rouvrir les PDF ou DOCX, et les informations étaient
plus faciles à retrouver.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Étendre aux sources du dossier professionnel le principe de D-005 : l'original
reste intact, sa représentation textuelle (`<même-nom>.md`, même répertoire) est
fidèle, sans résumé ni interprétation, avec un en-tête de provenance et des
passages illisibles signalés. Le coach s'appuie ensuite sur cette transcription.

La transcription est faite directement, sans confirmation préalable. La mise à
jour du dossier professionnel reste contrôlée (confirmé le 2026-09-30) : le coach
propose les apports de la nouvelle source et ne les applique qu'après validation
explicite, pour que l'utilisateur garde la maîtrise de son dossier.

Une source très volumineuse fait exception à la transcription directe (confirmé
le 2026-09-30) : le coach indique sa taille et demande confirmation avant de
transcrire, en proposant de ne transcrire que les parties utiles.

### Conséquences

- Plus de fichiers dans `data/profile/sources/`, à côté des originaux.
- La qualité de la transcription dépend de la capacité de lecture de l'agent ;
  ses limites sont déclarées dans l'en-tête.

### Conditions de réévaluation

Revoir la transcription directe si les tests pilotes montrent des sources
sensibles ou très volumineuses mal gérées, ou une transcription trop infidèle.

### Questions ouvertes

- Conduite à tenir quand l'original est modifié après sa transcription
  (actuellement : signaler et proposer une nouvelle transcription datée).
- Seuil à partir duquel une source est « très volumineuse » : laissé à
  l'appréciation du coach (par exemple plusieurs dizaines de pages) ; à chiffrer
  si les tests pilotes montrent un besoin.
- Sources sensibles : faut-il aussi une confirmation avant transcription ?

## D-012 — Définir une règle de langue pour les documents de `docs/`

- **Type** : PROCESS
- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-30
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

`docs/` mélange les langues. Le glossaire, le journal des décisions et la
référence de conception sont en français ; l'architecture, les cas d'usage, le
mode workspace, la confidentialité, le plan de test et `CONTRIBUTING.md` sont en
anglais. `docs/test-log.md` a été rédigé en français car c'est un fichier de
travail. Il se lit avec `docs/test-plan.md`, qui est resté en anglais : le
couple plan / journal n'est donc pas dans la même langue.

### Options considérées

Non documentées à l'époque.

### Décision et intention

Orientation, non encore un engagement : passer `docs/test-plan.md` en français,
sans changement de contenu, dans un commit isolé. Profiter de ce changement
pour fixer une règle écrite dans `AGENTS.md` plutôt que décider fichier par
fichier, par exemple : documents de travail en français, documents de référence
publics en anglais.

Non urgent : à traiter après la livraison de l'issue #5.

### Conséquences

Non documentées à l'époque.

### Conditions de réévaluation

Revoir la règle si le projet s'ouvre à des contributeurs non francophones.

### Questions ouvertes

- Quels documents sont des « documents de travail » et lesquels sont des
  références publiques ?
- Faut-il maintenir des versions anglaises si le projet s'ouvre à des
  contributeurs non francophones ?
- Les références croisées depuis `AGENTS.md` et `CONTRIBUTING.md` (en anglais)
  vers des documents en français sont-elles acceptables ?
- Risque de traduction : préserver la précision des scénarios de test, par
  exemple les mots-clés d'arrêt des simulations.

## D-013 — Un kit de test fictif et un scénario maître commun aux tests et à la démo

- **Type** : PROCESS
- **Statut** : ✅ Adoptée
- **Date** : 2026-10-01
- **Issue** : #12
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Les tests du coach se faisaient sur les données personnelles du développeur, et
la démo du toolkit restait théorique. L'exemple fictif d'architecte principal
était peu représentatif de l'équipe et antérieur à la séparation moteur /
données (#5). Il fallait un matériel fictif unique qui serve à tester, à
démontrer, et plus tard à automatiser.

### Options considérées

- **Adapter l'ancien exemple d'architecte principal** : rejetée ; il est supprimé
  plutôt qu'adapté.
- **Générer les PDF et DOCX dans le build** : différée au backlog ; ils sont
  générés par un script de développement et commités, pour que le build n'ait
  aucune dépendance.

### Décision et intention

- Un répertoire `test-kit/` regroupe les sources fictives (références Markdown
  et leurs PDF, DOCX, TXT générés) d'une développeuse fictive et de deux
  opportunités, un **scénario maître** `scenario.md` et les outils de
  génération. Le scénario est la liste ordonnée des étapes à jouer avec le
  coach, chacune avec fichiers, prompt, mots-clés, résultat attendu et item du
  plan de test. Les étapes retenues pour la démo portent le tag `[demo]`, celles
  qui attendent une issue le tag `[todo #N]`.
- Le build produit un **ZIP du kit** séparé du ZIP du workspace, contenant les
  sources fictives et le **script de démo** filtré sur les étapes `[demo]`. Le
  ZIP du workspace ne contient jamais de donnée fictive.
- Les PDF et DOCX sont générés par un script de développement (Python,
  `test-kit/tools/`) et commités : le build n'acquiert aucune dépendance.
- `examples/` devient l'arborescence `data/` d'un workspace fictif, copiée **à
  la demande** depuis un déroulé du scénario, car le résultat n'est pas
  déterministe. L'ancien exemple est supprimé plutôt qu'adapté.
- Règle de projet (`AGENTS.md`, `CONTRIBUTING.md`) : tout nouveau développement
  vérifie et complète le kit et le scénario dans le même changement, et signale
  explicitement une fonction non démontrable.
- Langue : données fictives et documents de travail du kit en français (langue
  du pilote), une offre en anglais pour tester une source étrangère ; chemins,
  noms de fichiers et tags en anglais.

### Conséquences

- Les scénarios de `docs/test-plan.md` peuvent être rejoués sans donnée
  personnelle et consignés dans `docs/test-log.md`.
- Chaque issue suivante (#6, #9, #10, #11) enrichit le kit au lieu d'un gros
  chantier de démo final.
- Le format du scénario est pensé pour être exécuté plus tard par un sous-agent
  (idée au backlog), sans que cela soit engagé.

### Conditions de réévaluation

Revoir le kit si le modèle de données du workspace change en profondeur, ou
quand l'exécution du scénario par un sous-agent sera engagée.

### Questions ouvertes

- Nom du répertoire (`test-kit/`) retenu provisoirement ; il couvre le test et
  la démo.
- Génération des PDF et DOCX dans le build : différée au backlog.
- Déplacement de `build.bat` dans un sous-répertoire : au backlog.

## D-014 — `opportunity.md` dans la langue de coaching, transcriptions dans la langue de la source

- **Type** : COACHING
- **Statut** : ✅ Adoptée
- **Date** : 2026-10-03
- **Issue** : #12
- **Migrée au modèle le** : 2026-10-04 (#13)

### Contexte

Les règles du coach demandaient de conserver la langue de la source dans
`opportunity.md`, sauf demande de traduction. Lors des déroulés du scénario
(E1, offre Northwind Ledger en anglais), le coach a pourtant rédigé
`opportunity.md` en français, ce que le testeur a jugé préférable. Le
comportement observé contredisait donc la règle écrite, et restait aléatoire.
Depuis #12, chaque offre est aussi transcrite en `.md` à côté de l'original.

### Options considérées

- **Conserver la langue de la source dans `opportunity.md`** (règle écrite
  jusque-là) : rejetée, car le comportement observé la contredisait, et le
  testeur jugeait préférable la rédaction en français.

### Décision et intention

- La transcription `.md` d'une source reste à l'identique, dans la langue de
  l'original : c'est la preuve, consultable sans rouvrir le PDF.
- `opportunity.md` est rédigé dans la langue de coaching
  (`language.coaching` de `workspace.yaml`), quelle que soit la langue des
  sources. Une source dans une autre langue y est traduite fidèlement ; les noms
  propres, l'intitulé officiel du poste et les termes techniques établis restent
  tels quels, et la section Sources indique la langue d'origine.
- La candidate travaille ainsi dans sa langue sans perte de traçabilité : le
  texte original reste disponible mot pour mot dans la transcription. Une autre
  langue n'est utilisée que sur sa demande.

### Conséquences

- Règle écrite dans les guidelines de structure des opportunités, le skill
  `interview-coach`, `workspace/AGENTS.md`, le modèle d'`opportunity.md` et la
  référence de conception.
- Testée par l'étape E1 du scénario maître et un item du plan de test.

### Conditions de réévaluation

Revoir la règle si les retours pilotes montrent que la traduction fait perdre
des nuances de l'offre, ou si des candidats travaillent dans plusieurs langues.

## D-015 — Un journal unique au modèle enrichi plutôt que des ADR séparés

- **Type** : PROCESS
- **Statut** : ✅ Adoptée
- **Date** : 2026-10-04
- **Issue** : #13

### Contexte

Le débriefing de la démo enregistrée du 2026-10-03 a montré deux manques du
journal : les alternatives étudiées et rejetées n'étaient pas tracées, et les
circonstances qui justifieraient de revoir une décision n'étaient pas
explicitées. Plusieurs décisions de la v0.4.0, dont l'abandon du mode
standalone et le recentrage sur My Career Workspace, en ont besoin.

### Options considérées

- **Un fichier ADR par décision** : rejetée pour l'instant, car prématurée ; le
  coût documentaire doit rester faible.
- **Conserver le modèle d'alors** (contexte, décision et intention,
  conséquences) : rejetée, car il ne répond pas aux deux manques constatés.

### Décision et intention

Conserver un fichier unique avec des entrées `D-XXX` à la suite, et enrichir le
modèle de trois champs : **Type**, **Options considérées** et **Conditions de
réévaluation**. Les statuts restent en français avec emoji, complétés par
❌ Rejetée. Les entrées D-001 à D-014 sont migrées pour que le journal n'ait
qu'un seul format avant les décisions de la v0.4.0.

À la migration, les options considérées sont reprises uniquement du contexte
existant, sans reconstruction d'alternatives qui n'ont pas été réellement
étudiées. Les conditions de réévaluation sont proposées par l'agent et validées
par l'auteur.

### Conséquences

- `AGENTS.md` et `CONTRIBUTING.md` exigent le modèle pour toute nouvelle entrée.
- Les décisions de l'abandon du mode standalone (#14) et du recentrage sur My
  Career Workspace (#15) sont rédigées au nouveau format.
- Une alternative rejetée n'a pas sa propre entrée, sauf cas documenté dans le
  modèle.

### Conditions de réévaluation

Passer à des fichiers ADR séparés si le journal devient trop volumineux pour
être lu ou revu en un seul fichier, ou si un outillage de génération le justifie.

## Évolution du journal

- Ajouter une entrée au modèle ci-dessus lorsqu'un choix structurel ou
  comportemental nécessite de préserver son intention au-delà de son
  implémentation immédiate. Renseigner toujours le Type, les options
  considérées et la question des conditions de réévaluation.
- Mettre à jour le statut et les conséquences lorsqu'une décision est validée,
  remplacée, rejetée ou abandonnée.
- Relier les issues et pull requests concernées lorsque les idées du backlog
  deviennent du travail engagé.
- Ne jamais inclure de données réelles de candidat ou de testeur pilote.
