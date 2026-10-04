# Backlog

This backlog preserves ideas discussed during the design of Career AI Toolkit. Items are not commitments; priorities will be driven by pilot feedback.

Work that is committed or being prepared is tracked in [GitHub Issues](https://github.com/JeromeJ77/career-ai-toolkit/issues), prioritized on the project board and grouped by milestone. This file keeps the ideas that are not yet engaged.

Follow the staged workflow in [CONTRIBUTING.md](CONTRIBUTING.md): first normalize,
review and commit new ideas here without grooming them; then analyze and select
the release scope and commit the confirmed candidate-issue table; finally review
and create each issue before removing only its covered backlog content in a
third cleanup commit.

## New ideas (grooming necessary)

Les quatre idées suivantes sont issues du debriefing de la démo enregistrée
(2026-10-03), mené avec Copilot. Les éléments relatifs à la préparation de la
démo et des slides sont traités à part et ne figurent pas ici. Elles sont
présentées dans l'ordre de traitement envisagé : le nouveau modèle de décision
d'abord, pour que les décisions suivantes y soient rédigées directement ;
l'abandon du standalone avant le renommage, pour ne pas mettre à jour des
références appelées à disparaître ; la revue des choix technologiques en
dernier, car plus ouverte.

### Faire évoluer le modèle du journal des décisions

- Conserver un fichier unique `docs/design/decision-log.md` avec des entrées
  `D-XXX` à la suite, pour garder un coût documentaire faible et éviter une
  organisation en fichiers ADR séparés jugée prématurée.
- Conserver les champs actuels (identifiant, statut, date, contexte, décision
  et intention, conséquences) et ajouter :
  - **Type**, parmi une liste initiale volontairement limitée : `ARCH`
    (architecture et choix techniques structurants), `PRODUCT` (vision,
    périmètre et comportement du produit), `UX` (expérience utilisateur et
    interactions), `COACHING` (principes et comportements de coaching),
    `PROCESS` (développement, validation, gouvernance). La liste ne s'enrichit
    que lorsqu'un besoin récurrent et réel apparaît, pas par anticipation ;
  - **Options considérées** : alternatives significatives étudiées, rejetées
    comprises, avec la raison synthétique du rejet, proportionnée à
    l'importance du choix ; peut rester courte ;
  - **Conditions de réévaluation** : circonstances dans lesquelles la décision
    devra être reconsidérée. Le champ peut rester vide, mais la question doit
    toujours être examinée.
- Une alternative rejetée n'a pas sa propre entrée par défaut. Une entrée
  distincte se justifie lorsqu'une orientation importante a été étudiée en
  détail, expérimentée, mise en œuvre pendant un temps ou a eu un impact
  significatif sur le projet (cas du standalone).
- Modèle cible proposé :

  ```markdown
  ## D-XXX — Titre de la décision

  **Type:** ARCH | PRODUCT | UX | COACHING | PROCESS
  **Statut:** Proposed | Accepted | Superseded | Rejected
  **Date:** YYYY-MM-DD

  ### Contexte
  ### Options considérées
  ### Décision et intention
  ### Conséquences
  ### Conditions de réévaluation
  ```

- À clarifier : le modèle proposé utilise des statuts anglais (`Proposed`,
  `Accepted`, `Superseded`, `Rejected`) et une présentation en gras, alors que
  le journal actuel utilise des statuts français avec emoji (✅ Adoptée,
  🟡 Comportement actuel, intention à confirmer, 🔵 Envisagée, ⚪ Remplacée) en
  liste. Faut-il ajouter « Rejetée » à la liste existante ? Faut-il compléter
  les entrées D-001 à D-014 existantes avec les nouveaux champs ?
- Décision à créer dans le journal des décisions (maintien d'un journal unique
  avec un modèle enrichi mais simple).

### Abandonner le mode standalone

- Constat : le standalone correspond à une première orientation du projet,
  explorée à partir d'un cas d'utilisation concret au sein de l'équipe. Depuis,
  le travail s'est presque exclusivement concentré sur le workspace, y compris
  le plan de test, ce qui reflète une clarification progressive de la vision
  produit.
- Limites identifiées : expérience plus limitée que le workspace local ;
  dépendance accrue au fournisseur d'agent pour la mémoire professionnelle ;
  persistance moins explicite et moins maîtrisable ; portabilité, transparence
  et traçabilité réduites ; seconde expérience utilisateur et second modèle de
  mémoire ; coûts de développement, de documentation et de maintenance accrus ;
  risque de faire percevoir le produit comme un simple assistant
  conversationnel ; confusion avec la cible centrée sur l'espace carrière
  personnel, local et persistant. Ces limites touchent directement les
  principes structurants du produit, pas seulement un écart fonctionnel mineur.
- Proposition : abandonner le standalone comme cible produit et comme livrable
  distribué. À court terme :
  - inscrire la décision et ses justifications dans le journal des décisions,
    dans une entrée dédiée (orientation mise en œuvre pendant un temps) ;
  - ne plus produire le livrable standalone ;
  - ne pas l'intégrer au plan de test ;
  - retirer ou mettre à jour ses références actives dans la documentation, le
    build et les tests ;
  - récupérer avant suppression les éléments génériques éventuellement utiles,
    sans maintenir de compatibilité spécifique.
- Condition de réévaluation : uniquement si un besoin utilisateur fort et
  validé apparaît pour une expérience sans installation, avec des limitations
  explicitement acceptées en matière de persistance, de portabilité et de
  propriété des données.
- Points de contact relevés dans le dépôt : les sections « Pilot validation »
  (« Validate the standalone coach with real users ») et « Standalone interview
  coach in English » de ce backlog, `AGENTS.md` (instructions standalone,
  version dans l'en-tête standalone, cohérence standalone/skills),
  `build.bat`, et la décision D-009 qui cite le standalone.

### Recentrer le produit sur My Career Workspace

**Vision**

- Le produit principal évolue d'un coach centré sur la préparation d'entretien
  vers un espace carrière personnel, persistant et exploitable dans la durée.
- Le dossier professionnel vivant en est le cœur. Il est à la fois une mémoire
  professionnelle structurée, une source de vérité validée par l'utilisateur,
  le point de départ du travail sur les opportunités et les entretiens, et le
  résultat enrichi du travail réalisé au fil du temps.
- Chaque opportunité, préparation, simulation, débriefing et retour
  d'expérience doit pouvoir consolider ce dossier : le travail effectué n'est
  pas consommé par un usage ponctuel mais constitue progressivement un capital
  professionnel réutilisable.
- L'IA reste essentielle au fonctionnement (analyse, synthèse, coaching,
  exploitation des connaissances), mais ne constitue plus la proposition de
  valeur différenciante à mettre au premier plan.
- Principes structurants : propriété et contrôle des données par
  l'utilisateur, confidentialité, persistance et continuité dans le temps,
  portabilité, transparence et traçabilité, validation par l'utilisateur des
  informations capitalisées.

**Renommage du produit**

- Le dépôt GitHub et le projet générique conservent le nom
  `career-ai-toolkit` : il rassemble plusieurs composants, skills, modèles,
  outils et livrables fondés sur l'IA.
- Le produit principal est renommé **My Career Workspace**, nom qui renforce
  les notions de propriété, de personnalisation et de confidentialité. Nom
  technique : `my-career-workspace`, retenu aussi comme nom du répertoire local
  personnel (aujourd'hui `career-ai-workspace`).
- Le livrable distribué reste une archive ZIP, dont le nom doit rester cohérent
  avec `my-career-workspace` et avec les conventions de versionnement et de
  génération existantes (aujourd'hui `career-ai-workspace-v<version>.zip`).
- L'analyse d'impact doit dépasser un simple remplacement textuel et vérifier
  le sens de chaque occurrence. Les occurrences génériques de « workspace » qui
  décrivent un concept technique et non le produit ne doivent pas être
  remplacées mécaniquement.
- Zones à examiner au minimum : noms et descriptions du produit, répertoire par
  défaut, archives et livrables générés, scripts d'initialisation, de build et
  de packaging, templates, skills et instructions destinées aux agents, chemins
  codés en dur, tests, fixtures et résultats attendus, kit de test, README et
  guides de démarrage, documentation d'architecture, glossaire, exemples,
  diagrammes et captures, journal des décisions, contenus de première session
  et messages d'accueil, références au mode standalone, règles de build, de
  distribution et d'exclusion.

**Kit de test**

- Renommer le plan et le kit de test en `my-career-workspace-test-kit`, et
  mettre à jour ses chemins, scénarios, jeux de données, résultats attendus et
  documentation.
- Le mode standalone n'étant plus une cible produit, il sort du périmètre de
  test.
- À clarifier : le kit s'appelle aujourd'hui `test-kit/` dans le dépôt et
  `career-ai-test-kit-v<version>.zip` dans `dist/`. Le renommage vise-t-il le
  ZIP seulement, le répertoire source aussi, et le « plan de test »
  (`docs/test-plan.md`) est-il concerné ?

**Terminologie et glossaire**

- Le nom propre du produit reste **My Career Workspace** ; le terme fonctionnel
  recommandé en français est **espace carrière**, plus naturel que « espace de
  travail de carrière » et de même portée.
- Le glossaire doit distinguer clairement :
  - **Career AI Toolkit** : le projet générique et son dépôt ;
  - **My Career Workspace** : le produit principal ;
  - **espace carrière** : le terme fonctionnel français ;
  - **dossier professionnel** : la mémoire professionnelle structurée et
    vivante contenue dans l'espace carrière ;
  - **workspace** : le concept technique générique, lorsque ce terme ne désigne
    pas le produit ;
  - **opportunité** : un poste ou un processus de recrutement suivi dans
    l'espace carrière.

**Message d'accueil de la première session**

- Introduire en première session : « Bienvenue dans votre espace carrière. »
- Le faire suivre d'un court paragraphe d'introduction, proposition :
  « Cet espace vous permet de construire et d'enrichir votre dossier
  professionnel, puis de l'exploiter au fil de vos opportunités et de vos
  entretiens. »
- La version définitive de l'introduction reste à confirmer lors de la mise à
  jour des contenus de démarrage.
- Lien : la proposition utilise le vouvoiement, cohérent avec l'idée
  « Tutoiement ou vouvoiement constant et paramétrable ».

**Décisions à créer**

- Renommage du produit principal en **My Career Workspace** et du répertoire
  en `my-career-workspace`.
- Adoption d'**espace carrière** comme terme fonctionnel français.

### Documenter les choix technologiques du projet

- Revoir les choix technologiques structurants et vérifier qu'ils sont
  correctement documentés dans le journal des décisions :
  - identifier les décisions architecturales importantes déjà prises
    implicitement et ajouter celles qui manquent ;
  - documenter les options étudiées et rejetées ;
  - expliciter les conséquences et conditions de réévaluation ;
  - relier les choix techniques aux forces recherchées du produit :
    transparence, portabilité, fonctionnement local, lisibilité humaine,
    compatibilité avec les agents, traçabilité ;
  - challenger le choix du stockage en Markdown/texte brut face à SQLite, à une
    base documentaire ou à une approche hybride.
- Décisions à créer ou vérifier en priorité :
  - choix actuel de Markdown/texte brut comme mécanisme principal de
    persistance, et conditions de réévaluation ;
  - principes de fonctionnement local, de propriété des données, de validation
    utilisateur et de traçabilité, s'ils ne sont pas déjà formalisés (D-001,
    D-004, D-005, D-010 et D-011 en couvrent une partie).
- Dépend du nouveau modèle du journal des décisions.

### Import web automatique des références publiques

- Évaluer la possibilité de demander des références publiques (LinkedIn,
  GitHub, portfolio, CV en ligne) puis de laisser le coach les récupérer et en
  extraire les informations pour constituer le dossier professionnel.
- Ce point entre en tension avec la navigation web désactivée par défaut
  (D-003, issue #8) : clarifier le design attendu, par exemple activation
  explicite ou autre flux d'import maîtrisé, et définir comment ne pas laisser
  croire qu'une ressource inaccessible a été consultée.
- Les informations récupérées devront être validées par l'utilisateur avant
  d'être intégrées au dossier professionnel. L'entretien d'initialisation
  (issue #10) n'en dépend pas : les références externes y sont seulement notées
  comme des liens.

### Score de complétion du dossier professionnel

- Ajouter un score de complétion en pourcentage pour rendre la maturité du
  dossier professionnel visible et plus explicite, en complément de son statut
  et de sa version (D-010, issue #9).
- Différé à la v0.5.0 : définir comment mesurer la complétion sans en faire le
  critère de passage à `ready`, qui reste une décision prise d'un commun accord
  avec le candidat.

### Feedback d'entretiens réels et anonymisation

- Anonymiser les résultats suite à un debrief d'entretien réel avant tout
  partage ou réutilisation hors du workspace privé.
- Définir où et comment stocker, organiser et valider les feedbacks
  anonymisés afin qu'ils puissent être utilisés par le coach.
- Évaluer si l'équipe pilote peut contribuer des feedbacks anonymisés par pull
  request sur le projet GitHub, et définir comment vérifier automatiquement
  l'anonymisation avant d'accepter ces contributions.

### Feedback pilote construit au fil de l'eau par le coach

- Aujourd'hui `data/feedback/pilot-feedback.md` est créé à la demande et rempli
  en une fois ; l'idée est de le construire progressivement, au fil des
  conversations, pendant la phase pilote.
- Deux déclencheurs à prévoir :
  - **Détection discrète par le coach** : quand il constate une difficulté
    d'usage manifeste (allers-retours répétés, problème de copie ou de fichier,
    instruction mal comprise), il en prend note dans une section « au fil de
    l'eau » du fichier de feedback, sans interrompre ni commenter auprès de la
    personne.
  - **Mot-clé ou expression de la personne** (par exemple « note pour le
    pilote : … »), qui consigne la remarque à sa demande.
- Chaque note porte la date et le contexte (étape, opportunité, fichier
  concerné) pour qu'à la fin du pilote le coach puisse mettre ces notes au
  propre dans le modèle de feedback et en faire un retour structuré.
- À raffiner : forme exacte du mot-clé, critères de détection, place de la
  section dans le template actuel, et comment le signaler dans le scénario
  maître du kit de test (étape F1).
- Cas relevé au premier déroulé complet (2026-10-02, étape D7) : quand la
  candidate arrête une simulation et donne la raison de l'arrêt, la consigner
  discrètement dans ces notes plutôt que de la commenter.

### Reprendre l'historique d'opportunités déjà vécues

- Au démarrage du pilote, des candidats auront déjà des candidatures en cours
  ou terminées, avec des entretiens passés sans le coach. Les scénarios actuels
  supposent toujours une opportunité nouvelle (offre → préparation →
  simulations → entretien réel).
- Permettre, à l'initialisation du workspace comme à tout moment, de déclarer
  une opportunité **a posteriori** : « j'ai déjà eu deux offres », « j'ai passé
  deux entretiens chez X, pas retenue », « processus clôturé sans suite ».
- Le coach crée alors la structure canonique (`00N-…`, `opportunity.md`,
  `current-status.md`, `sources/` si des documents existent) et consigne
  l'historique connu : rounds d'entretien déjà passés avec leurs métadonnées,
  issue (refus, abandon, sans suite, en attente), ressenti et enseignements de
  la candidate, sans inventer de transcript ni de simulation.
- Les rounds passés pourraient être enregistrés directement en `actual/` à
  partir des souvenirs de la candidate (cf. workflow « Reflect after the real
  interview » sans transcript), pour alimenter les enseignements durables et la
  préparation des opportunités suivantes.
- À raffiner : statut « clôturée » dans le modèle de `current-status.md`,
  arborescence pour les opportunités terminées (archives ?), et ajout d'une
  étape correspondante dans le scénario maître du kit de test.

### Mode voix pour l'entretien d'initialisation et la démo

- Évaluer un mode voix, même non interactif, pour conduire le premier
  entretien de complétion du dossier professionnel et le montrer en démo.
- Différé : il anticipe des issues non encore développées (issue #10 pour
  l'entretien d'initialisation, issue #12 pour les données fictives et la démo).

### Tests automatiques du coach par sous-agent

- Après le build (avec lui ou indépendamment), dérouler automatiquement un
  ensemble de tests : décompresser le ZIP du workspace dans un répertoire
  temporaire ignoré par Git localement, y copier les sources de référence du
  kit de test (`test-kit/`), puis lancer un sous-agent dont ce répertoire est le
  contexte.
- Le sous-agent déclenche des conversations avec le coach pour reprendre toutes
  les étapes et conversations possibles, dont l'initialisation du dossier
  professionnel, en suivant le scénario maître du kit de test.
- Le déroulé n'est pas déterministe : il reste a priori hors du build.
- À la demande seulement, un script copie la partie `data/` du workspace
  temporaire obtenu dans `examples/`, ce qui donne un exemple illustratif que
  l'on peut commiter sans le changer à chaque exécution.
- Dépend du kit de test et du scénario maître de l'issue #12.

### Génération des sources fictives dans le build

- Pour l'instant, les PDF et DOCX fictifs du kit de test sont produits par un
  script à part et commités, pour ne pas ajouter de dépendance au build.
- Évaluer plus tard l'intégration de cette génération au build.

### Déplacer `build.bat` dans un sous-répertoire

- Se demander s'il ne serait pas plus propre de placer `build.bat` dans un
  sous-répertoire plutôt qu'à la racine du dépôt.
- Point d'attention : `build/` est aujourd'hui ignoré par Git comme répertoire
  d'artefacts ; le nom du sous-répertoire est à choisir en conséquence.

### Alerte sur les changements de configuration sensibles

- Relevé au premier déroulé complet (2026-10-02, étape C7) : le coach a vu
  `allow_external_web_search` passer à `true` (défaut `false`), l'a jugé valide
  et n'y a pas touché.
- Avertir explicitement d'un passage à `true` et demander confirmation.
- Mémoriser dans `data/current-status.md` les valeurs des clés critiques de la
  session précédente, pour pouvoir signaler leurs changements.

### Tutoiement ou vouvoiement constant et paramétrable

- Relevé au premier déroulé complet (2026-10-02) : le coach est passé du
  vouvoiement au tutoiement en cours de session (de D8 à D12), puis est revenu
  au vouvoiement (E1).
- Garder une forme d'adresse constante, avec une option dans
  `data/config/workspace.yaml`, vouvoiement par défaut.

### Ton et emojis paramétrables

- Rendre le ton et l'usage des emojis paramétrables dans
  `data/config/workspace.yaml`, sobre et sans emoji par défaut.

### Lenteur des opérations déterministes : test de performance et instrumentation

- Constat (2026-10-04) : le workspace sous Claude Code Desktop est perçu comme
  très lent au démarrage d'une conversation, à l'ajout de sources, à la
  création d'opportunités et de rounds, et à la transcription des PDF et DOCX ;
  l'utilisateur ne voit pas ce que fait l'agent. Jugé critique pour l'adoption,
  pilote compris. Reprend « Démarrage lent d'une nouvelle conversation »
  (relevé du 2026-10-02, étape D12, et risque de réutilisation d'une même
  conversation).
- Première analyse des traces JSONL de la démo à blanc du 2026-10-03 : les
  tours conversationnels prennent 2 à 15 s, les tours qui manipulent des
  fichiers 30 à 97 s ; le démarrage enchaîne 6 à 10 lectures séquentielles
  (30 à 40 s) ; la création d'opportunité fait 14 à 15 appels d'outils ;
  l'extraction DOCX et parfois PDF est improvisée ; des appels triviaux longs
  suggèrent des attentes de permission. L'hypothèse d'un agent qui fouille
  l'arborescence et écrit des scripts n'est pas confirmée.
- Proposition : une première livraison limitée à l'instrumentation et à la
  caractérisation (type investigation / enabler, priorité High) : outillage
  d'analyse des traces, scénarios reproductibles sur le kit de test fictif,
  synthèse des postes de latence, hypothèses confirmées ou infirmées, et
  séparation quick wins / évolutions de fond. Scripts Windows a minima, Python
  optionnel et détecté, fallback agentique journalisé, collecte locale sans
  contenu documentaire, réutilisable pendant le pilote à la demande.
- Détail (constat, mesures, hypothèses, questions, périmètre, principes
  d'outillage, confidentialité, livrables, critères d'acceptation, pistes,
  recommandation) : `docs/non-functional/performance-investigation.md`.

### Traçabilité des informations du profil données en conversation

- Constat : toute source fournie en fichier (PDF, DOCX…) est conservée dans
  `sources/` avec sa transcription `.md`, pour le dossier professionnel comme
  pour une opportunité. Pour une opportunité, le texte collé dans la
  conversation est aussi enregistré en `.md` dans `sources/`. Rien d'équivalent
  n'est prévu pour le dossier professionnel : une information donnée
  directement dans un échange n'est pas conservée comme source.
- Proposition : enregistrer ces informations dans un répertoire dédié, par
  exemple `data/profile/sources/conversations/`, un fichier `.md` par échange,
  nommé avec la date et le contexte en quelques mots, suffixé `-2`, `-3`, `-4`
  s'il y a eu plusieurs échanges sur le même sujet le même jour.
- Objectif : pouvoir reconstituer autant que possible le dossier
  professionnel à partir de toutes les sources et de leurs transcriptions, en
  cas de doute, de perte du fichier ou pour corroborer des faits.
- Point jugé important pour la traçabilité.

### Version du dossier professionnel dans le statut

- Relevé à la démo à blanc (2026-10-03, étape C7) : après restauration du
  dossier professionnel depuis la corbeille, rien ne permet de vérifier que la
  copie restaurée est bien la dernière version.
- Proposition : enregistrer la version du dossier professionnel dans
  `current-status.md` et alerter si la version du fichier ne correspond pas.
  Si la candidate valide la différence, le statut reprend la version du
  fichier ; sinon, investiguer et résoudre.
- Un checksum a été évoqué, jugé trop compliqué pour l'instant.

### Prénoms des interviewers en simulation

- Relevé à la démo à blanc (2026-10-03, étape D5) : donner des prénoms aux
  interviewers plutôt que « interviewer 1 », « interviewer 2 », pour rendre la
  simulation plus vivante.

### Explorations ultérieures

- Évaluer si un RAG serait utile, notamment dans le cadre de feedbacks
  d'entretiens réels anonymisés.
- Identifier d'autres parallèles pertinents entre un coach dans la vraie vie et
  le coach du toolkit, afin d'affiner le modèle comportemental et le workflow
  utilisateur.
- Envisager un skill dédié pour préparer un entretien technique, par exemple
  avec un entraînement rapide en questions/réponses ou QCM.

## Pilot validation

- Validate the standalone coach with real users.
- Validate the workspace with at least one complete real opportunity.
- Test professional-profile initialization from CVs, certifications, skills assessments and human-coaching notes.
- Test whether users maintain the professional profile over time.
- Test the progressive interview sheet, including note-taking during interviews.
- Compare French and English coaching workflows.
- Record friction, redundant questions, misunderstandings and missing guidance.

## Immediately after the end-to-end test

- Define a deterministic workspace manifest that distinguishes toolkit version,
  workspace schema version and last applied migration.
- Design non-destructive, sequential and resumable workspace migrations.
- Implement one testable migration before distributing automatic workspace
  updates or widening the beta.
- Decide how provider-agnostic reasoning recommendations should be represented
  in skills based on observed pilot needs.

## Standalone interview coach in English

- Create and maintain an English standalone version after the French
  pilot behavior has stabilized.
- Define how French and English standalone instructions remain aligned.
- Potential target tree structure:
````
standalone/
├── interview-coach-standalone.fr.md
└── interview-coach-standalone.en.md
````

## Option supplémentaire : CITATION.cff

Pas indispensable pour la version actuelle, mais pertinent si le projet devient public et réutilisé.

Un fichier CITATION.cff à la racine permet d’indiquer de façon structurée comment créditer le projet. GitHub décrit ce format comme un fichier texte lisible par les humains et les machines afin que les utilisateurs sachent comment citer un logiciel.

````
cff-version: 1.2.0
title: Career AI Toolkit
message: "If you use this toolkit, please credit the project."
type: software
authors:
  - family-names: Jurbert
    given-names: Jérôme
version: 0.3.0
date-released: 2026-09-27
license: MIT
````

## Interview coach

- Refine strategic-message identification and candidate adjustment.
- Improve role-specific simulations and interviewer personas without configuration overload.
- Improve post-interview reviews and next-round preparation.
- Evaluate whether cover-letter work becomes a separate skill.
- Add reusable behavioral test scenarios and expected outcomes.
- Support retrospective import of historical opportunities and interviews while
  preserving the distinction between sourced facts, reconstructed information
  and uncertain chronology.

## Professional profile

- Evaluate splitting a large profile into career stories, preferences and certifications.
- Add source, confidence and last-verified metadata where useful.
- Improve duplicate and contradiction detection.
- Support validated multilingual formulations.
- Add a periodic maintenance workflow.
- Design controlled schema migrations only if real updates require them.

## CV generation

- Create a dedicated CV-generation skill.
- Separate generic generation rules from candidate-specific configuration.
- Support stable CV, per-offer targeted CV, generic cover-letter and mixed strategies.
- Generate French and English content.
- Produce Markdown content, HTML/CSS rendering and PDF output.
- Provide ATS-oriented, technical, architecture, management and executive variants.
- Keep traceability to professional-profile facts.
- Prevent facts from existing only in generated CVs.

## Cover letters

- Support generic, lightly adapted and fully targeted strategies.
- Generate Markdown and PDF; evaluate HTML as the rendering layer.
- Reuse validated motivations and examples without copying the whole preparation.
- Keep offer-specific content out of the permanent profile.

## Document rendering

- Evaluate a portable Markdown-to-HTML pipeline.
- Evaluate reliable HTML-to-PDF generation on Windows, macOS and Linux.
- Support explicit page breaks and a printable interview-sheet layout.
- Keep the first page autonomous and provide note-taking areas.
- Decide whether HTML is a visible deliverable or an internal format.

## Distribution and updates

- Evaluate a Python CLI and pipx distribution.
- Add workspace health checks only if needed.
- Design non-destructive toolkit updates using the post-test manifest and
  migration decisions.
- Reconsider a managed `_core/` directory if repeated updates justify it.
- Preserve personal data during every update or migration.

## Platform compatibility

- Validate Claude Code and VS Code workflows.
- Validate generic AGENTS.md-aware tools.
- Document ChatGPT, Claude web and Microsoft Copilot setup.
- Add platform adapters only when a real compatibility issue exists.
- Avoid duplicate skill sources.

## Privacy and security

- Add an optional pre-release privacy checklist.
- Evaluate local sensitive-data checks.
- Add OneDrive, encrypted-local-storage, backup and recovery guidance.
- Warn about employer-owned storage.
- Add source-anonymization workflows.

## Long-term possibilities

- Job-opportunity comparison and pipeline tracking.
- Networking and recruiter-conversation preparation.
- Portfolio and LinkedIn assistance.
- Certification planning and skills-gap analysis.
- Optional privacy-conscious integrations with external job-search tools.
