# Backlog

This backlog preserves ideas discussed during the design of Career AI Toolkit. Items are not commitments; priorities will be driven by pilot feedback.

Work that is committed or being prepared is tracked in [GitHub Issues](https://github.com/JeromeJ77/career-ai-toolkit/issues), prioritized on the project board and grouped by milestone. This file keeps the ideas that are not yet engaged.

Follow the staged workflow in [CONTRIBUTING.md](CONTRIBUTING.md): first normalize,
review and commit new ideas here without grooming them; then analyze and select
the release scope and commit the confirmed candidate-issue table; finally review
and create each issue before removing only its covered backlog content in a
third cleanup commit.

## New ideas (grooming necessary)

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
