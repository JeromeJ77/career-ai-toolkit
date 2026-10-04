# Performance du workspace : caractériser les lenteurs des opérations déterministes

Document de travail (français), ouvert le 2026-10-04. Il rassemble le constat,
la première analyse de traces, les hypothèses et le cadrage de l'investigation
à mener. Le travail est suivi dans l'issue #16 ; les décisions qui en
sortiront iront dans `docs/design/decision-log.md`.

- **Type** : investigation / enabler
- **Priorité proposée** : High. Le problème est critique pour la trajectoire
  d'adoption, mais le travail à planifier reste une investigation ; « Critical »
  désigne un blocage complet et fausserait la sémantique des priorités.
- **Statut** : engagée dans le milestone v0.4.0 (issue #16)

## 1. Constat

L'utilisation de My Career Workspace sous Claude Code Desktop présente des
temps d'attente importants, notamment lors :

- du démarrage ou de la reprise d'une session ;
- de l'initialisation du workspace ;
- de l'ajout et du classement de nouvelles sources ;
- de la transcription de fichiers PDF et DOCX en Markdown ;
- de la création d'une opportunité ;
- de la création d'un entretien ou d'une simulation ;
- de la lecture et de la mise à jour des fichiers de statut.

Ces opérations combinent des traitements déterministes sur les fichiers, la
reconstruction du contexte du workspace et des traitements sémantiques réalisés
par l'agent. Leur coût respectif n'est ni visible ni mesuré. L'utilisateur ne
sait pas ce que fait l'agent pendant ces attentes.

Cette latence nuit à l'utilisation personnelle du produit et constitue un
risque significatif pour son adoption par les utilisateurs pilotes. Risque
dérivé, relevé au premier déroulé complet (2026-10-02, étape D12) : que la
candidate réutilise une conversation existante plutôt que d'en ouvrir une par
séance, d'où un contexte très long (réponses moins pertinentes) et un conflit
avec l'objectif de fermer régulièrement les conversations et de faire un
commit Git pour la traçabilité.

Hors de cause : l'emplacement du workspace (répertoire local, hors OneDrive
lors des tests).

## 2. Première analyse de traces (démo à blanc du 2026-10-03)

Claude Code enregistre chaque conversation en JSONL horodaté sous
`~/.claude/projects/<slug du workspace>/`. Dans Claude Code Desktop, les lignes
repliées sous chaque réponse sont les appels d'outils, dépliables. Ces fichiers
sont la matière première de l'investigation.

Trois conversations de la démo à blanc, 24 tours, ont été analysées avec un
prototype de script (non versionné) qui, pour chaque tour, calcule la durée
totale, le temps d'attente des outils, le temps modèle, le nombre et la nature
des appels, et liste les commandes shell, lectures et écritures.

| Mesure | Valeur |
|---|---|
| Temps agent cumulé sur une démo de 41 min | ~11,5 min |
| Tour conversationnel (préparation, simulation, debrief oral) | 2 à 15 s |
| Tour avec manipulation de fichiers | 30 à 97 s |
| Démarrage d'une conversation | 6 à 10 lectures séquentielles, 30 à 40 s |
| Temps modèle au démarrage d'une reprise | ~1 s |
| Création d'opportunité avec sources | 14 à 15 appels d'outils par tour |
| Écriture du dossier professionnel (7 400 caractères) | 28 s |
| Écriture d'`opportunity.md` (7 500 caractères) | 30 s |
| Transcription d'une source (~3 000 caractères) | 6 à 10 s |

Observations détaillées :

- **Démarrage** : lectures une par une d'`AGENTS.md`, des deux `SKILL.md`, de
  `workspace.yaml` et de son modèle, du statut racine, du dossier, des statuts
  d'opportunité. Le temps est presque entièrement du temps d'outil.
- **Création d'opportunité ou de round** : relecture des guidelines et des
  modèles, copie des originaux, extraction, puis 4 à 6 écritures séquentielles
  (transcription, `opportunity.md`, `interview.md`, statut d'opportunité,
  statut racine).
- **Transcription** : les PDF sont lus nativement par l'outil `Read`, puis la
  transcription est produite par le modèle. Pour le DOCX, l'agent a improvisé
  une extraction PowerShell du `document.xml`. Pour un PDF, après la lecture
  native, il a enchaîné trois tentatives Python (`pypdf` absent, décompression
  brute des flux, décodage ASCII85), soit une trentaine de secondes d'outils
  supplémentaires.
- **Génération de contenu long** : coût légitime pour le contenu de coaching,
  pas pour les copies de modèles ni les statuts réécrits deux fois.
- **Appels triviaux anormalement longs** : un `mkdir` prend 15 à 21 s, ce qui
  ressemble à une attente d'approbation de permission. À confirmer, car
  l'approbation n'apparaît pas dans la trace.
- **Non confirmé** : l'hypothèse « l'agent passe son temps à écrire des scripts
  et à fouiller l'arborescence ». Un à trois `Glob` au démarrage seulement ;
  les scripts se limitent à l'extraction des sources.

Limites : une seule exécution, sur le kit de test fictif, avec un testeur qui
commentait en parallèle ; le mode de permissions n'a pas été noté ; le temps
d'attente d'outils inclut, pour les appels parallèles, du temps de génération.

## 3. Hypothèses à tester

Issues de l'analyse ci-dessus et de l'analyse menée en parallèle :

1. Une partie significative du temps est consacrée à des opérations
   déterministes plutôt qu'au coaching ou à l'analyse.
2. Le nombre d'allers-retours d'outils séquentiels, demandes de permission
   comprises, est la cause principale sur les étapes fichiers.
3. L'agent génère par le modèle du contenu qui n'en a pas besoin (copies de
   modèles, statuts réécrits).
4. Les conversions PDF et DOCX constituent un poste de latence spécifique,
   avec des commandes improvisées plutôt qu'un outillage stable.
5. L'agent relit à chaque session les mêmes guidelines et modèles ; la
   reconstruction du contexte au démarrage (environ 7 400 mots d'instructions
   pour le moteur) contribue à la latence et ne sera pas entièrement résolue
   par l'automatisation des fichiers.
6. Une couche limitée de scripts ciblés pourrait apporter un gain sensible sans
   nécessiter immédiatement une application ou une CLI complète.

## 4. Questions auxquelles l'investigation doit répondre

1. Où le temps est-il réellement consommé ?
2. Quelles opérations sont répétées sans valeur ajoutée d'une session à
   l'autre ?
3. L'agent crée-t-il régulièrement des scripts équivalents ?
4. Quelles recherches dans l'arborescence pourraient être évitées ou
   remplacées par un index ?
5. Quelle est la part de la conversion PDF/DOCX ?
6. Quelle est la part des demandes de permission ?
7. Quelles opérations déterministes peuvent être extraites sans dégrader la
   portabilité ?
8. Quels gains peut-on obtenir avec quelques scripts ciblés ?
9. À partir de quel point une CLI ou un runtime dédié deviendrait-il justifié ?
10. Le fallback agentique reste-t-il acceptable en durée, fiabilité et
    traçabilité ?
11. Quelles données de diagnostic peuvent être recueillies pendant le pilote
    sans compromettre la confidentialité ?

## 5. Objectif et périmètre de la première livraison

Mettre en place un dispositif léger d'observation et réaliser un test de
performance permettant de caractériser la latence des principales opérations,
d'identifier les traitements déterministes répétitifs, de comprendre les
stratégies et outils employés par l'agent, de confirmer ou d'infirmer les
hypothèses, de distinguer le court terme des évolutions architecturales, et de
réutiliser l'instrumentation pendant le pilote si c'est approprié.

Scénarios à instrumenter au minimum, sur un workspace neuf, à partir du kit de
test fictif et des étapes du scénario maître (B1, C1, D1, D3, D5, E1, E3) :

1. initialisation d'un nouveau workspace ;
2. démarrage et reprise sur un workspace existant, à partir des fichiers de
   statut ;
3. ajout d'une source texte ;
4. ajout et transcription d'un fichier PDF ;
5. ajout et transcription d'un fichier DOCX ;
6. création d'une opportunité ;
7. création d'un entretien ;
8. création d'une simulation.

Informations à collecter par scénario ou opération : heures de début et de
fin, durée totale, sous-étapes identifiables, commandes exécutées, scripts
existants utilisés, scripts temporaires créés ou adaptés, outils de conversion
employés, fichiers et répertoires consultés, fichiers créés, copiés ou
modifiés, erreurs, tentatives ou stratégies abandonnées, fallback utilisé,
durée approximative des phases déterministes et des phases d'analyse
sémantique, mode de permissions, informations d'environnement nécessaires à
l'interprétation.

Métriques attendues : temps avant la première réponse d'une nouvelle
conversation ; temps par source transcrite selon le format ; temps de création
d'une opportunité et d'un round ; part du temps due aux outils, au modèle et
aux permissions ; appels redondants.

## 6. Principes d'outillage

- Fournir au minimum un chemin d'exécution compatible avec l'environnement
  Windows ciblé ; PowerShell est le candidat naturel, sans en faire encore une
  décision architecturale.
- Privilégier des opérations déterministes, simples et observables.
- Ne pas imposer Python ; l'utiliser comme capacité optionnelle, détectée, pas
  présumée.
- Prévoir un fallback lorsque l'outillage nominal ne peut pas être utilisé, et
  lui demander de journaliser la stratégie alternative employée au lieu
  d'improviser silencieusement.
- Garder l'instrumentation légère et désactivable ; ne jamais bloquer le
  workflow utilisateur en cas d'échec.
- Ne pas mélanger les données de diagnostic avec les artefacts fonctionnels du
  dossier professionnel.
- Aucune dépendance ajoutée au build. Les scripts éventuels livrés avec le
  moteur sont du « code source IA » au sens d'`AGENTS.md`.

## 7. Confidentialité et pilote

Les traces peuvent révéler des noms de fichiers, des chemins locaux, des
intitulés d'opportunités, des métadonnées de documents et des extraits de
commandes contenant des informations personnelles. Par conséquent :

- la collecte reste locale par défaut ;
- aucun contenu documentaire n'est collecté si de simples métadonnées suffisent
  (durées, types d'appels, noms de fichiers du moteur) ;
- les chemins et noms sensibles doivent pouvoir être anonymisés ;
- le partage de traces par les pilotes est explicite, après inspection par
  l'utilisateur ;
- les traces ne sont pas ajoutées au dépôt Git par défaut ; seules celles du
  kit de test fictif peuvent être conservées.

Les logs du pilote ne doivent pas devenir une télémétrie implicite, ce qui
contredirait le positionnement local, privé et contrôlé du workspace.

## 8. Livrables et critères d'acceptation

Livrables :

1. un mécanisme initial d'instrumentation (au minimum, le script d'analyse des
   JSONL industrialisé sous `test-kit/tools/`) ;
2. un ou plusieurs scénarios de test reproductibles ;
3. des traces exploitables issues d'au moins une exécution de référence ;
4. une synthèse des principaux postes de latence ;
5. la liste des hypothèses confirmées, infirmées ou ouvertes ;
6. une séparation quick wins / améliorations intermédiaires / évolutions
   architecturales ;
7. une recommandation sur la conservation ou l'extension de l'instrumentation
   pour le pilote.

Critères d'acceptation :

- [ ] Les principales opérations du workspace peuvent être observées séparément.
- [ ] La durée totale et les principales sous-étapes sont consignées.
- [ ] Les commandes, scripts et outils de conversion employés sont identifiables.
- [ ] Les stratégies nominales et de fallback sont distinguées.
- [ ] L'instrumentation fonctionne sur l'environnement Windows ciblé.
- [ ] L'absence d'une dépendance optionnelle, notamment Python, ne bloque pas le
      workflow.
- [ ] Un premier test complet est exécuté sur le kit de test fictif.
- [ ] Les résultats identifient les principaux postes de latence ou, à défaut,
      les mesures supplémentaires nécessaires.
- [ ] Les traces ne contiennent pas inutilement le contenu des documents traités.
- [ ] L'instrumentation peut être désactivée.
- [ ] Une première recommandation court terme / long terme est documentée.

## 9. Pistes à instruire selon les résultats (non décidées)

Court terme :

- copier les modèles plutôt que les régénérer ;
- regrouper les écritures de statut ;
- alléger la séquence de démarrage (section de bootstrap compacte, références
  lues seulement quand le workflow les atteint) ;
- prescrire une méthode d'extraction PDF/DOCX plutôt que la laisser improviser ;
- vérifier le réglage des permissions recommandé dans le guide de démarrage ;
- rendre visible à la candidate ce que fait l'agent pendant une attente longue
  (message d'étape du coach, ou consigne du guide pour déplier les appels
  d'outils).

Plus long terme :

- fournir des scripts déterministes avec le moteur : contrôle d'initialisation
  en un appel, conversion PDF/DOCX en Markdown avec l'en-tête prévu par D-011,
  création du squelette d'opportunité ou de round ; scripts Windows a minima et
  repli explicite où l'agent improvise s'il ne peut pas les exécuter ;
- lien avec l'idée de CLI Python distribuée via pipx (backlog, section
  « Distribution and maintenance »).

## 10. Hors périmètre de la première livraison

- développer immédiatement une CLI complète ;
- réécrire l'ensemble du workflow ;
- imposer un runtime unique à tous les utilisateurs ;
- garantir dès cette entrée une amélioration chiffrée des performances ;
- mettre en place une télémétrie centralisée ;
- choisir définitivement PowerShell, Python ou une autre technologie pour
  toutes les opérations futures.

## 11. Recommandation de décision

1. Entrée prioritaire au backlog.
2. Première livraison limitée à l'instrumentation et à la caractérisation.
3. Support Windows obligatoire pour l'investigation initiale.
4. PowerShell comme candidat naturel, pas encore comme décision architecturale.
5. Python optionnel et détecté, pas présumé.
6. Fallback agentique conservé, mais observé et journalisé.
7. Aucune collecte centralisée pendant cette première étape.
8. Décision d'industrialisation prise seulement après analyse des traces.

Ne pas surconcevoir avant d'avoir des preuves, sans attendre qu'un problème
d'adoption soit devenu structurel pour commencer à le mesurer.

## À clarifier

- Durées cibles par étape, et intégration d'une zone « performance » dans
  `docs/test-plan.md` avec sa règle de non-régression.
- Place de ce répertoire `docs/non-functional/` dans la règle de langue D-012
  (document de travail en français).
