# Backlog

This backlog preserves ideas discussed during the design of Career AI Toolkit. Items are not commitments; priorities will be driven by pilot feedback.

Work that is committed or being prepared is tracked in [GitHub Issues](https://github.com/JeromeJ77/career-ai-toolkit/issues), prioritized on the project board and grouped by milestone. This file keeps the ideas that are not yet engaged.

Follow the staged workflow in [CONTRIBUTING.md](CONTRIBUTING.md): first normalize,
review and commit new ideas here without grooming them; then analyze and select
the release scope and commit the confirmed candidate-issue table; finally review
and create each issue before removing only its covered backlog content in a
third cleanup commit.

## New ideas (grooming necessary)

L'idée suivante est issue du debriefing de la démo enregistrée (2026-10-03),
mené avec Copilot. Les autres idées de ce debriefing sont devenues les issues
#13 (modèle du journal des décisions), #14 (abandon du mode standalone) et #15
(recentrage sur My Career Workspace).

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
- Dépend du nouveau modèle du journal des décisions (issue #13).

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

### Feedback produit construit au fil de l'eau par le coach

- Constat : aujourd'hui `data/feedback/pilot-feedback.md` est créé à la
  demande depuis un questionnaire et rempli en une fois ; la personne doit
  noter elle-même ses remarques pendant l'utilisation. Faciliter ces retours
  est jugé essentiel pour les premières utilisations, d'où une cible
  envisagée en v0.4.0 (à confirmer au grooming).
- Portée : un **feedback produit**, pas seulement pilote, pour ne pas
  retravailler le mécanisme à la sortie de la phase pilote (envisagée jusqu'à
  fin 2026). Message à faire passer : contribuer par des retours constructifs
  à l'amélioration continue de l'outil par son concepteur.
- **Activation** : option de feedback produit stockée dans `workspace.yaml`.
  Au premier démarrage, le coach demande à la personne si elle souhaite
  participer activement à la co-construction du produit, et active le mode si
  elle accepte. Valeur par défaut à décider : désactivé par défaut, ou activé
  pendant la phase pilote puis désactivé ensuite, puisqu'on cherche vraiment
  des retours.
- **Journal de notes brutes** (`data/feedback/`, nom à définir, par exemple
  `feedback-log.md`), écrit au fil de l'eau avec le moins de traitement
  possible pour limiter le coût (lien avec l'issue #16). Deux types
  d'entrées :
  - **silencieuses** : le coach consigne discrètement une difficulté d'usage
    manifeste (allers-retours répétés, problème de copie ou de fichier,
    instruction mal comprise), sans interrompre ni commenter auprès de la
    personne ;
  - **explicites** : la personne dicte une note par un mot-clé ou une
    expression, utilisable à tout moment, quelle que soit l'étape, y compris
    pendant une simulation, sans attendre sa fin ni la casser. Le coach
    l'acquitte par une mention très simple en italique, sur le modèle des
    marqueurs de sortie et de retour en simulation (par exemple « *Note de
    retour produit prise en compte.* »), puis reprend où il en était.
  - Chaque entrée porte la date, le type, le contexte (étape, opportunité,
    fichier concerné) et un état volontairement simple : **non traitée** ou
    **traitée**. Une entrée devient traitée lorsqu'elle a été examinée lors
    d'une génération de feedback, qu'elle y ait été reprise ou écartée, et
    seulement une fois le fichier de feedback effectivement écrit ; le journal
    ne trace pas la suite donnée. Les notes brutes peuvent contenir des
    données personnelles ; le nettoyage se fait à la génération du feedback,
    pas à l'écriture.
- **Génération d'un feedback formel** à la demande, par une commande ou une
  expression :
  - fichier indépendant dans `data/feedback/`, nommé avec l'identifiant
    utilisateur anonyme et la date, par exemple
    `feedback-<identifiant>-AAAA-MM-JJ.md`, avec un suffixe `-2`, `-3`… si
    plusieurs feedbacks sont générés le même jour (convention à confirmer) ;
  - reprend uniquement les entrées non traitées du journal ; il ne les marque
    comme traitées qu'après l'écriture effective du fichier de feedback, jamais
    au moment de leur lecture ou de leur analyse : une génération interrompue
    ou échouée laisse le journal inchangé. Le feedback suivant ne contient que
    les nouvelles entrées ; le journal lui-même n'est jamais réécrit
    autrement ;
  - revue spécifique des entrées silencieuses avec la personne avant de les
    reprendre : elle confirme ou écarte chacune (problème corrigé, non avéré
    ou sans intérêt) ; les entrées écartées sont aussi marquées traitées, à
    la même étape ;
  - le fichier généré appartient ensuite à la personne : elle peut le
    retravailler seule ou avec le coach, supprimer ou garder des entrées ;
  - anonymise le contenu (périmètre à définir : noms, entreprises,
    interviewers, intitulés de poste, chemins locaux…), liste ce qui a été
    remplacé et ne présente jamais le résultat comme garanti anonyme ;
  - pose au moment de la génération quelques questions rapides pour enrichir
    le retour sans perturber le workflow au quotidien, en commençant par le
    positif comme le coach le fait dans ses propres débriefs : ce qui
    fonctionne bien, puis les points importants à corriger rapidement, puis
    les idées d'évolution à long terme ;
  - métadonnées : au minimum la version du moteur (`ENGINE-VERSION`) et
    l'identifiant utilisateur anonyme (voir ci-dessous), repris dans le
    fichier et dans son nom ; autres métadonnées à définir.
  - Le fichier reste local : aucune télémétrie ni envoi automatique. La
    personne le relit, le nettoie si elle le souhaite et l'envoie elle-même.
- **Identifiant utilisateur anonyme** : numéro unique déterminé à
  l'installation et stocké dans `workspace.yaml`. Les retours restent
  anonymes, mais plusieurs feedbacks d'une même personne peuvent être
  corrélés : cohérence, suivi d'un manque signalé puis corrigé, enrichissement
  d'un nouveau feedback par rapport à un ancien. Côté concepteur, les
  feedbacks reçus peuvent ainsi être classés par identifiant.
- **Conservation des feedbacks reçus** : à décider, par exemple les verser au
  dépôt Git une fois l'anonymisation vérifiée, ou les garder hors du projet.
- **Suivi des envois** : à évaluer, par exemple les dates d'envoi dans
  `current-status.md` (« feedback envoyé le … »), sachant que l'envoi est fait
  par la personne hors du coach.
- **Modèles** dans `skills/init-workspace/assets/` : un modèle du journal et un
  modèle du feedback formel avec ses sections ; l'actuel
  `pilot-feedback.template.md` (questionnaire par étape) est à reprendre ou à
  intégrer (lien avec l'issue #7, modèle source unique, et l'issue #14, choix
  du mode testé à retirer).
- Piste liée à la mise à jour du moteur (issue #7) : lors d'une mise à jour,
  proposer d'envoyer d'abord un feedback sur la version précédente s'il
  existe des notes non remontées. À creuser.
- Cas relevé au premier déroulé complet (2026-10-02, étape D7) : quand la
  candidate arrête une simulation et donne la raison de l'arrêt, la consigner
  discrètement dans le journal plutôt que de la commenter.
- **Porteur de la fonction** : skill dédié à la gestion des feedbacks, ou
  compétence du skill `interview-coach` ; à trancher au grooming.
- À raffiner : forme exacte du mot-clé, distincte des mots-clés d'arrêt de
  simulation ; critères de détection des entrées silencieuses ; valeur par
  défaut de l'activation ; périmètre de l'anonymisation ; convention de nommage
  des feedbacks ; métadonnées ; suivi des envois ; conservation des feedbacks
  reçus ; skill dédié ou non ; signalement dans le scénario maître du kit de
  test (étape F1).

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
