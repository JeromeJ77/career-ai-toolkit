# Journal des décisions de conception

Ce document conserve les décisions et intentions qui expliquent la conception
technique et comportementale de Career AI Toolkit. Il complète la
[référence de conception du workflow](01-career-ai-toolkit-workflow-design.md),
qui décrit l'état canonique du produit, sans la remplacer.

L'objectif est de préserver le « pourquoi » afin qu'une évolution future ne
supprime pas accidentellement une propriété importante du toolkit.

## Statuts

- **✅ Adoptée** : décision appliquée et considérée comme une contrainte actuelle.
- **🟡 Comportement actuel, intention à confirmer** : comportement déjà présent,
  mais justification ou portée encore à valider.
- **🔵 Envisagée** : orientation conservée pour le grooming ; elle ne constitue pas
  encore un engagement de mise en œuvre.
- **⚪ Remplacée** : décision historique conservée, avec un lien vers celle qui la
  remplace.

## D-001 — Utiliser le workspace comme mémoire durable

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27

### Contexte

Les conversations avec un assistant sont temporaires, peuvent être interrompues
et ne sont pas toujours accessibles depuis une nouvelle session.

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

## D-002 — Conserver les skills à la racine du workspace

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-29

### Contexte

Le coach doit pouvoir découvrir et utiliser directement ses instructions,
références et modèles depuis le répertoire ouvert par l'agent.

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

## D-003 — Désactiver la navigation web par défaut

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-29, confirmée le 2026-09-30

### Contexte

`config/workspace.yaml` définit actuellement
`privacy.allow_external_web_search: false`. Des références externes peuvent
néanmoins être utiles pour initialiser ou enrichir le dossier professionnel.

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

### Points à confirmer

- Vérifier si cette préférence est seulement une instruction comportementale ou
  si les outils pilotes permettent aussi de la faire respecter techniquement.
- Définir comment importer LinkedIn, GitHub ou d'autres références publiques
  sans laisser croire qu'une ressource inaccessible a été consultée.
- L'import web automatique du dossier professionnel reste hors de la v0.4.0.

## D-004 — Séparer le moteur des données sous un futur répertoire `data/`

- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-29

### Contexte

La structure actuelle mélange, à la racine du workspace, les composants
génériques distribués par le toolkit et les emplacements qui reçoivent les
données privées. Copier une nouvelle version du toolkit pourrait donc entrer en
conflit avec des fichiers utilisateur.

### Orientation et intention

Regrouper les données utilisateur sous `data/` et conserver le moteur,
notamment `skills/`, en dehors. Dans le ZIP distribué, les répertoires de données
ne contiendraient que leurs `README.md`. Les fichiers de travail obligatoires
seraient initialisés à partir des modèles du moteur lors de la première
utilisation.

Cette séparation doit permettre une mise à jour initialement simple par copie
du nouveau toolkit, sans écraser le dossier professionnel, les opportunités ni
les autres artefacts privés.

### Points à confirmer

- Valider le périmètre exact de `data/`, notamment pour `config/` et `feedback/`.
- Définir le manifest, les versions de schéma et les migrations nécessaires.
- Vérifier par le build qu'aucune donnée personnelle ou fichier initialisé ne se
  retrouve dans la partie générique à remplacer.
- Tester réellement la mise à jour et le rollback avant de la présenter comme
  une garantie utilisateur.

## D-005 — Séparer sources, représentation canonique et analyse

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27

### Contexte

Une offre originale, sa transcription exploitable et l'analyse du coach n'ont
pas le même niveau de preuve. Les mélanger rendrait les faits difficiles à
distinguer des hypothèses ou du positionnement proposé.

### Décision et intention

Préserver les sources originales autorisées sans modification, maintenir leur
représentation textuelle canonique dans `opportunity.md` et conserver l'analyse
dérivée dans `analysis.md`.

Cette séparation rend la provenance visible, limite les inventions et permet de
réviser l'analyse sans réécrire la source.

## D-006 — Créer les artefacts progressivement

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-27

### Contexte

Une arborescence préremplie de fichiers vides ajoute du bruit et peut faire
croire qu'une étape du workflow a été réalisée.

### Décision et intention

Le coach crée les opportunités, étapes d'entretien, simulations et artefacts
uniquement lorsque le workflow les atteint. Le candidat fournit le contenu et
valide les décisions métier ; il n'a pas à maintenir lui-même la structure
technique.

## D-007 — Recommander une nouvelle conversation lors d'un changement de périmètre

- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-29

### Contexte

Une conversation longue qui mélange plusieurs opportunités ou tâches transverses
dégrade la lisibilité du contexte et augmente le risque de confondre les
artefacts concernés.

### Orientation et intention

Lorsque l'utilisateur change manifestement de périmètre, le coach proposerait de
clôturer proprement le travail courant, d'enregistrer son état sur disque, puis
de poursuivre dans une nouvelle conversation. Un commit Git pourrait servir de
checkpoint lorsqu'un dépôt local est disponible et après validation de
l'utilisateur.

Cette orientation vise à optimiser le contexte actif sans perdre la continuité,
qui reste portée par le workspace.

### Points à confirmer

- Définir le seuil entre une demande connexe et un véritable changement de
  périmètre.
- Définir la consigne de reprise transmise à la nouvelle conversation.
- Éviter de multiplier inutilement les conversations pour des tâches brèves.

## D-008 — Séparer la capture des idées de leur grooming

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-30

### Contexte

Les nouvelles idées peuvent arriver sous une forme libre, textuelle ou visuelle.
Leur reformulation, leur analyse et leur transformation immédiate en issues dans
une même passe risqueraient de perdre une nuance, d'effacer une piste différée
ou de rendre difficile la comparaison avec l'intention initiale.

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

## D-009 — Trois profondeurs de simulation et arrêt anticipé par mot-clé

- **Statut** : ✅ Adoptée
- **Date** : 2026-09-30

### Contexte

Le standalone parlait de format « court, standard ou approfondi » alors que le
backlog évoquait « short, medium, deep », sans durée, nombre de questions ni
moyen documenté d'interrompre une simulation.

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

### Points à confirmer

- Durées et nombres de questions : ordres de grandeur validés par l'auteur, à
  ajuster après le pilote.
- Lors de l'issue n° 3, choisir des formulations de pause distinctes des
  mots-clés d'arrêt.
- Après un arrêt, le coach propose de façon facultative de recueillir les
  questions du candidat pour le débrief ; il écrit le transcript s'il est
  disponible, sinon un checkpoint dans `current-status.md`.

## D-010 — Statut et version du dossier professionnel décidés avec le candidat

- **Statut** : 🔵 Envisagée
- **Date** : 2026-09-30

### Contexte

Traiter une opportunité avec un dossier professionnel trop pauvre dégrade les
analyses et le coaching, et peut faire percevoir l'outil comme
contreproductif avant même d'avoir travaillé avec des données de qualité.

### Orientation et intention

Le dossier porte un statut (`empty` ou `initial`, `draft`, `ready`, valeurs à
confirmer) et une version : `0.1`, `0.2`, `0.3`… au fil des sessions de
construction, puis `1.0` au passage à `ready`. Ce passage est une décision prise
d'un commun accord : le coach estime que les informations sont suffisantes et le
propose, sauf si le candidat a d'autres informations à ajouter, et le candidat
valide. `ready` marque un seuil opérationnel, non un état final.

Tant que le dossier n'est pas `ready`, le coach refuse gentiment de traiter une
opportunité. Si le candidat insiste, il continue en gardant le statut explicite
et en prévenant que la qualité sera dégradée, avec un rappel au début de chaque
nouvelle session.

### Points à confirmer

- Valeurs exactes du statut.
- Règle d'incrément des versions `0.x` : à chaque session qui modifie le dossier
  ou seulement à un jalon validé.
- Le score de complétion en pourcentage est différé à la v0.5.0.

## Évolution du journal

- Ajouter une entrée lorsqu'un choix structurel ou comportemental nécessite de
  préserver son intention au-delà de son implémentation immédiate.
- Mettre à jour le statut et les conséquences lorsqu'une décision est validée,
  remplacée ou abandonnée.
- Relier les issues et pull requests concernées lorsque les idées du backlog
  deviennent du travail engagé.
- Ne jamais inclure de données réelles de candidat ou de testeur pilote.
