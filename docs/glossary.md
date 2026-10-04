# Glossaire métier

Ce glossaire fixe le vocabulaire français et anglais utilisé dans Career AI
Toolkit. Les définitions décrivent le sens propre au projet ; elles ne cherchent
pas à couvrir tous les usages possibles de ces termes.

Les chemins de fichiers et les métadonnées techniques restent en anglais. Les
interfaces, instructions et échanges du pilote sont d'abord rédigés en français.

## Vocabulaire actuel

| Terme français | Terme anglais | Définition |
| --- | --- | --- |
| Career AI Toolkit | Career AI Toolkit | Projet générique et dépôt : ensemble publiable des instructions, skills, modèles, outils et documents fondés sur l'IA qui produisent My Career Workspace. Il se distingue du produit. Le toolkit ne contient aucune donnée réelle de candidat. |
| My Career Workspace | My Career Workspace | Produit principal, nom technique `my-career-workspace` : l'espace carrière local, personnel et persistant de l'utilisateur, construit autour d'un dossier professionnel vivant. Principes structurants : propriété et contrôle des données par l'utilisateur, confidentialité, persistance et continuité, portabilité, transparence et traçabilité, validation par l'utilisateur des informations capitalisées. L'IA en est un moyen, pas la proposition de valeur. Remplace l'ancien « Mode workspace » (voir [D-017](design/decision-log.md#d-017--renommer-le-produit-my-career-workspace)). |
| Espace carrière | Career workspace | Terme fonctionnel français (anglais : « career workspace ») que le coach emploie avec l'utilisateur pour désigner son My Career Workspace, jamais « workspace » ni « espace de travail » (voir [D-018](design/decision-log.md#d-018--espace-carrière-comme-terme-fonctionnel-français)). |
| Dépôt du toolkit | Toolkit repository | Dépôt Git du projet. Il contient les sources génériques, la documentation et des exemples fictifs, mais jamais le workspace privé d'un utilisateur. |
| Workspace | Workspace | Concept technique : répertoire de fichiers avec un moteur et un répertoire `data/`, employé lorsqu'il ne désigne pas le produit (répertoire source `workspace/`, skill `init-workspace`, `workspace.yaml`). Pour l'utilisateur, c'est son espace carrière. Il regroupe le dossier professionnel, ses sources, les opportunités, les artefacts d'entretien, la configuration et les états courants. |
| Moteur | Engine | Partie générique et remplaçable du workspace : `skills/`, `AGENTS.md`, `CLAUDE.md`, les README et les modèles. Elle ne contient aucune donnée utilisateur et peut être remplacée par une nouvelle version du toolkit. |
| Données utilisateur | User data | Tout ce qui appartient à l'utilisateur et vit sous `data/` : configuration, dossier professionnel et sources, opportunités, CV, archives, état courant et retour pilote. Le moteur ne les écrase jamais ; le ZIP n'y contient que des `README.md`. |
| Initialisation au premier lancement | First-use initialization | Création par le coach, depuis les modèles de `skills/init-workspace/assets/`, des fichiers obligatoires absents sous `data/`. Un fichier existant n'est jamais écrasé ; l'absence d'un fichier suffit à le recréer. |
| Mode standalone (abandonné) | Standalone mode (abandoned) | Ancien mode d'utilisation fondé sur une instruction autonome copiée dans un assistant IA, l'utilisateur fournissant les documents à chaque conversation. Abandonné en v0.4.0 au profit du seul workspace local (voir [D-016](design/decision-log.md#d-016--abandonner-le-mode-standalone)). Le terme ne subsiste que dans les documents historiques. |
| Candidat | Candidate | Terme actuellement utilisé pour la personne qui mobilise le toolkit pour son propre parcours. Elle reste propriétaire de ses données, valide les faits durables et décide des informations réutilisables. La pertinence de ce terme au-delà d'une recherche d'opportunité reste à confirmer. |
| Coach | Coach | Rôle tenu par l'assistant IA lorsqu'il suit les workflows du toolkit pour structurer les informations, préparer les entretiens, conduire les simulations et proposer des améliorations. |
| Principe de coaching | Coaching principle | Principe fondateur du projet : le toolkit est un coach, pas un générateur de réponses. Il aide le candidat à réfléchir, s'entraîner, progresser et s'approprier son histoire professionnelle, plutôt qu'à mémoriser des réponses toutes faites. Sa formulation est reprise à l'identique dans les points d'entrée. Seule exception : le joker (D-020). |
| Mainteneur du toolkit | Toolkit maintainer | Personne qui fait évoluer les contenus génériques du projet sans collecter ni introduire de données professionnelles privées. |
| Capture d'idées | Idea intake | Première phase du traitement d'une nouvelle idée. Elle transforme un contenu textuel ou visuel en une formulation française structurée et fidèle dans le backlog, sans encore l'analyser, la prioriser ni la convertir en issue. |
| Idée normalisée | Normalized idea | Transcription relue d'une idée brute, clarifiée pour être compréhensible tout en conservant son intention, ses nuances et ses incertitudes. Son commit constitue le point de traçabilité précédant le grooming. |
| Grooming | Backlog grooming | Analyse d'idées déjà capturées afin d'identifier recouvrements, contradictions, faisabilité, dépendances et périmètre de release avant toute création d'issue. |
| Issue candidate | Candidate issue | Regroupement provisoire et cohérent d'éléments sélectionnés pour une release. La table synthétique des issues candidates est validée et versionnée avant leur rédaction détaillée. Une candidate ne devient une issue GitHub qu'après revue et validation explicite de son titre et de son contenu. |
| Testeur pilote | Pilot tester | Utilisateur qui expérimente le toolkit sur un parcours réaliste et peut partager un retour produit anonymisé. Le terme remplace, en français, « beta-testeur » lorsque le contexte est le pilote. |
| Dossier professionnel | Professional profile | Mémoire professionnelle structurée et vivante contenue dans l'espace carrière : source consolidée de référence appartenant au candidat. Il rassemble les faits stables, compétences, intentions, préférences, expériences, exemples validés et apprentissages durables qui dépassent le contenu d'un CV. |
| Compétence professionnelle | Professional skill | Savoir, savoir-faire ou comportement maîtrisé par le candidat et étayé, lorsque c'est possible, par des expériences ou des résultats observables. Ce terme ne désigne pas les `skills` techniques de l'agent. |
| Source professionnelle | Career source | Document ou information autorisé utilisé pour constituer ou vérifier le dossier professionnel : CV historique, certification, bilan de compétences, notes de coaching, recommandation, portfolio ou référence externe. |
| Source originale autorisée | Authorized original source | Fichier original que le candidat a le droit de conserver et accepte de placer dans son workspace. Il est préservé sans modification lorsqu'une copie est conservée. |
| Fait validé | Validated fact | Information confirmée par une source fiable ou explicitement validée par le candidat. Seuls les faits validés peuvent devenir des éléments durables du dossier professionnel. |
| Opportunité | Opportunity | Poste ou processus de recrutement suivi dans l'espace carrière : candidature, poste ou piste professionnelle étudiée. Elle possède un identifiant stable, ses sources, une représentation canonique, une analyse, un état courant et, le cas échéant, plusieurs entretiens. |
| Représentation textuelle canonique | Canonical textual representation | Version Markdown structurée des informations issues des sources d'une opportunité. `opportunity.md` conserve les faits et leur provenance, sans y mélanger l'analyse d'adéquation ou le positionnement. |
| Analyse de l'opportunité | Opportunity analysis | Travail dérivé qui confronte le dossier professionnel aux exigences de l'opportunité afin d'identifier l'adéquation, les écarts, les risques, les hypothèses et les questions ouvertes. |
| Positionnement | Positioning | Manière cohérente et validée de présenter le profil du candidat pour une opportunité précise, sans inventer de faits ni transformer une hypothèse en certitude. |
| Message stratégique | Strategic message | Idée prioritaire que le candidat veut rendre claire pendant le processus de recrutement, accompagnée de preuves ou d'exemples validés. |
| Étape d'entretien (round) | Interview round | Étape identifiée du processus de recrutement pour une opportunité, avec son type, ses interlocuteurs, ses objectifs, sa préparation, ses simulations et son éventuel entretien réel. Les fichiers utilisent un identifiant stable comme `01-screening`. |
| Simulation d'entretien | Interview simulation | Jeu de rôle dans lequel le coach tient la posture d'un interlocuteur de recrutement et pose les questions une par une pour entraîner le candidat sur une étape donnée. |
| Profondeur de simulation | Simulation depth | Ampleur d'une simulation : Court (short), Standard (standard) ou Approfondi (deep). Les durées et nombres de questions associés sont indicatifs. |
| Arrêt anticipé | Early stop | Fin volontaire d'une simulation avant son terme, demandée par le candidat. Le coach l'annonce, quitte le rôle, peut proposer de recueillir les questions du candidat, puis débriefe ce qui a été joué. Ce n'est pas une pause (voir l'idée de pause et reprise, issue n° 3). |
| Joker | Joker | Aide ponctuelle demandée par le candidat pendant une simulation, sans l'arrêter : un conseil sur la question posée, ou une réponse proposée à sa place, clairement étiquetée comme réponse proposée, sans avertissement ajouté. Le coach sort du rôle par une ligne en italique, puis le reprend. Le nombre de jokers n'est pas limité ; le débrief l'indique. Hors simulation, le joker ne déclenche rien de particulier. Le mot « joker » au milieu d'une réponse ne le déclenche pas. |
| Mot-clé d'arrêt | Stop keyword | Mot ou expression déclenchant l'arrêt anticipé , en français « stop », « arrête la simulation » ou « arrêtons l'interview », en anglais « stop » ou « end the simulation ». Il compte comme message à part ou lorsqu'il nomme la simulation ou l'interview. Une intention d'arrêt exprimée autrement, ou ambiguë, entraîne une demande de confirmation. Les termes évoquant une pause sont volontairement exclus. |
| Transcription de source | Source transcription | Fichier Markdown créé par le coach à côté d'un document source (PDF, DOCX, image, export), de même nom, qui en reprend fidèlement le contenu pour que les sessions suivantes s'appuient sur lui. Il ne modifie pas l'original, ne contient ni résumé ni interprétation et signale les passages illisibles. Le dossier professionnel n'est mis à jour qu'après validation du candidat. |
| Transcription | Transcript | Trace factuelle d'un échange, lorsqu'elle est techniquement disponible et que sa conservation est autorisée. Elle ne contient pas l'analyse du coach. |
| Debrief de simulation | Simulation debrief | Analyse d'une simulation fondée sur ses traces persistantes ou, à défaut, sur les souvenirs explicitement fournis par le candidat. Il distingue les observations, les limites des preuves et les améliorations proposées. |
| Fiche de préparation à l'entretien | Interview preparation sheet | Document synthétique propre à une étape d'entretien. Il rassemble le cadrage, les messages, les preuves, les exemples, les questions et les points de vigilance déjà travaillés et validés. |
| Retour après entretien réel | Real interview review | Relecture structurée d'un entretien effectivement passé. Elle sépare les faits observables, le ressenti, les interprétations possibles, les apprentissages et les actions suivantes. |
| Capitalisation | Knowledge capture | Intégration contrôlée d'un apprentissage durable, validé et réutilisable dans le dossier professionnel. Les éléments propres à une seule opportunité restent dans son répertoire. |
| Session de coaching | Coaching session | Unité de travail ciblée, généralement contenue dans une conversation : initialiser le dossier, analyser une opportunité, préparer un entretien, conduire une simulation ou réaliser un debrief. |
| Conversation | Conversation | Fil d'échange temporaire avec l'assistant. Elle ne constitue pas la mémoire durable du projet ; cette continuité est portée par les fichiers du workspace. |
| Périmètre de travail | Work scope | Objet précis traité pendant une session, par exemple le dossier professionnel, une opportunité, une étape d'entretien ou une simulation. |
| État courant | Current status | Instantané compact de la situation de travail et de la prochaine action. Un fichier `current-status.md` sert à reprendre une session ; il ne remplace ni les sources ni l'historique détaillé. |
| Point de reprise | Resumption point | Indication courte permettant à une nouvelle conversation de poursuivre le travail utile sans dépendre de l'historique du chat précédent. |
| Point de contrôle (checkpoint) | Checkpoint | Mise à jour explicite des fichiers persistants à un moment significatif du workflow, notamment après une validation, un changement de phase ou la création d'un artefact utile. |
| Artefact | Artifact | Fichier persistant créé ou maintenu pendant le workflow, par exemple une analyse, une préparation, une transcription, un debrief ou un retour d'entretien. |
| Livrable | Deliverable | Document destiné à être utilisé ou partagé par le candidat, tel qu'un CV, une lettre de motivation ou une fiche de préparation. Un livrable est un type d'artefact, mais tous les artefacts ne sont pas des livrables. |
| Skill de l'agent | Agent skill | Ensemble réutilisable d'instructions, de références et de modèles qui décrit un rôle et les workflows que l'agent doit suivre. Dans les chemins techniques, le terme court `skill` est conservé. |
| Modèle | Template | Structure de document générique utilisée par le coach pour créer un nouvel artefact cohérent sans préremplir de données personnelles. |
| Retour produit anonymisé | Sanitized product feedback | Retour sur l'expérience d'utilisation dont ont été retirées les données personnelles, les réponses d'entretien et les informations permettant d'identifier une organisation ou un tiers. |
| Kit de test | Test kit | Matériel fictif du dépôt (`test-kit/`) qui permet de tester et de démontrer le toolkit sans donnée personnelle : sources fictives d'un candidat et d'opportunités, scénario maître et outils de génération. Le build le distribue dans un ZIP distinct du workspace, `my-career-workspace-test-kit-v<version>.zip`. |
| Scénario maître | Master scenario | Liste ordonnée des étapes à jouer avec le coach sur les données du kit de test (`test-kit/scenario.md`). Chaque étape indique les fichiers à déposer, le prompt, les mots-clés, le résultat attendu et l'item du plan de test couvert. Les tags `[demo]` et `[todo #N]` marquent respectivement les étapes retenues pour la démo et celles qui attendent une issue. |
| Script de démo | Demo script | Extrait allégé du scénario maître : étapes `[demo]` réduites aux manipulations, prompts et points à montrer, sans les attendus. Généré par le build dans le ZIP du kit de test. Il vise une démo de 35 à 40 minutes. |
| Exemple fictif | Fictional example | Arborescence `data/` d'un workspace fictif publiée sous `examples/` à titre illustratif. Elle est copiée à la demande depuis un déroulé du scénario maître, puis relue et commitée ; elle n'est pas régénérée à chaque build. |

## Vocabulaire en cours de grooming

Ces termes apparaissent dans les nouvelles idées du backlog. Leur définition
permet d'en discuter sans les considérer comme des fonctionnalités ou des
contrats déjà validés.

| Terme français | Terme anglais | Définition provisoire |
| --- | --- | --- |
| Entretien initial | Initial profile interview | Séance structurée menée après l'installation pour recueillir les informations nécessaires à une première version exploitable du dossier professionnel. |
| Utilisateur / personne coachée | User / coachee | Termes envisagés pour remplacer ou compléter « candidat ». « Utilisateur » décrit la relation au produit de façon générique ; « personne coachée » décrit la relation avec le coach. Il reste à décider s'il faut retenir un seul terme ou les employer selon le contexte. |
| Statut du dossier professionnel | Professional profile status | Indicateur de maturité envisagé pour signaler si le dossier est vide, en cours de constitution ou suffisamment prêt pour traiter des opportunités. Le statut `ready` représente un seuil opérationnel et non un état final, puisque le dossier continue d'évoluer. Il est décidé avec le candidat (voir D-010). Les valeurs envisagées sont `empty` ou `initial`, `draft` et `ready` ; elles restent à confirmer. |
| Version du dossier professionnel | Professional profile version | Numéro du dossier : `0.1`, `0.2`, `0.3`… pendant sa construction, puis `1.0` lorsque le candidat et le coach passent le statut à `ready`. La règle d'incrément des versions `0.x` reste à définir. |
| Marqueur de version du moteur | Engine version marker | Version du moteur générique, livrée dans le fichier `ENGINE-VERSION` à la racine du workspace depuis la v0.4.0. À partir de la v0.5.0 (issue #7), elle sera aussi recopiée dans les données : un écart entre les deux signalera qu'une mise à jour a eu lieu. Le manifest complet et les migrations de modèles restent hors périmètre de la v0.4.0. |
| Score de complétion | Completion score | Indicateur envisagé pour rendre visibles les informations déjà couvertes et les lacunes importantes du dossier professionnel. Différé à la v0.5.0 ; son calcul et son usage restent à définir. |
| Mise à jour du toolkit | Toolkit update | Remplacement des composants génériques du toolkit dans un workspace existant tout en préservant les données personnelles et les artefacts créés par l'utilisateur. |
| Feedback d'entretien anonymisé | Anonymized interview feedback | Enseignement issu d'un entretien réel dont toutes les informations identifiantes ou confidentielles ont été retirées avant un éventuel partage hors du workspace privé. |
| Expression de fin de session | Session-closing expression | Formulation explicite, par exemple « au revoir », indiquant que l'utilisateur souhaite terminer la session. Les expressions reconnues et les actions déclenchées, notamment la proposition d'un commit Git, restent à définir. |
| RAG | Retrieval-augmented generation (RAG) | Technique envisagée pour rechercher des informations pertinentes dans un corpus autorisé avant de produire une réponse. Son utilité, son périmètre et ses contraintes de confidentialité restent à évaluer. |
| Préparation à l'entretien technique | Technical interview preparation | Workflow spécialisé envisagé pour préparer et entraîner le candidat à des questions techniques, notamment sous forme de questions-réponses rapides ou de QCM. |

## Règles d'évolution

- Ajouter un terme lorsqu'il porte un sens métier propre au projet ou évite une
  ambiguïté récurrente.
- Préférer le terme français dans les contenus destinés au pilote et conserver
  le terme anglais dans les chemins, métadonnées et noms techniques existants.
- Déplacer un terme provisoire dans le vocabulaire actuel lorsque son design et
  son usage ont été validés.
- Mettre à jour les documents concernés lorsqu'une décision modifie une
  définition canonique.
