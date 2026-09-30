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

### Synthèse temporaire : issue candidate des données fictives et de la démo

Table de travail issue du grooming, à supprimer lors du nettoyage du backlog.
Périmètre confirmé : une seule issue dans le milestone v0.4.0, à traiter juste
avant la prochaine issue (#6), puis à enrichir de façon incrémentale à chaque
issue suivante plutôt qu'en un gros chantier final. Différé : le mode voix,
qui anticipe des issues non encore développées. La priorité et la taille sont
indicatives ; l'auteur les positionne sur le board.

| Ordre | Titre provisoire | Objectif | Éléments couverts | Priorité | Taille | Dépendances |
| --- | --- | --- | --- | --- | --- | --- |
| J1 | Préparer des données fictives et un script pour démontrer et tester le toolkit | Fournir un profil fictif réaliste (par défaut un développeur, profil le plus courant dans l'équipe), ses sources à déposer (CV, profil LinkedIn, certification en PDF, éventuellement un DOCX) et des opportunités fictives, utilisables pour dérouler le plan de test complet et pour une démo d'environ 30 minutes. Fournir un script de démo (prompts, mots-clés, fichiers par étape) complété au fil des issues suivantes (#6, #9, #10, #11). Aucune donnée réelle, exclusion du build | Données fictives, sources de démonstration, script de démo | P1 | M | Aucune (enrichie par #6, #9, #10, #11) |

Questions laissées ouvertes pour le traitement de l'issue : remplacer l'exemple
fictif actuel (`examples/fictitious-principal-architect`) par un exemple plus
simple de développeur, ou l'étoffer (penchant de l'auteur : le remplacer) ;
emplacement du script de démo et lien éventuel avec un quick start.

### Préparer des données fictives pour une démo réelle du toolkit

- Préparer, dans le projet, de vraies données fictives permettant de faire une
  démo concrète du toolkit. L'objectif principal est de montrer comment il
  fonctionne afin d'embarquer plus facilement de nouveaux utilisateurs,
  notamment pour lancer le pilote. Jusqu'ici, la présentation du toolkit est
  restée plutôt théorique, même si elle s'appuyait sur le dépôt.
- Ces données alimenteraient l'exemple fictif actuel : soit en le remplaçant,
  soit en l'étoffant, pour qu'il soit directement exploitable en démo. Elles
  serviraient aussi aux tests, à la place des données personnelles du
  développeur. Elles devraient permettre de dérouler le plan de test complet,
  sans nécessairement tout démontrer.
- Ne probablement pas les utiliser dans le build : elles ne doivent pas se
  retrouver dans l'artefact distribué.
- Fournir des fichiers fictifs à déposer dans les sources pendant la démo, pour
  montrer leur transcription puis leur insertion dans le dossier professionnel :
  par exemple un CV au format PDF, un profil LinkedIn au format PDF, un fichier
  de certification au format PDF, peut-être un fichier DOCX avec d'autres
  informations.
- Prévoir, dans le cadre de cet élément, un petit script de démo qui simplifie
  son déroulement. Il noterait, pour chaque étape, les prompts à copier-coller,
  les mots-clés à dire dans une conversation et les fichiers fictifs à utiliser.
- Étapes cibles envisagées, à organiser en une démo d'environ 30 minutes suivie
  d'environ 30 minutes de questions-réponses. Lister tout ce qui peut être
  démontré assez vite :
  - initialisation du dossier : confirmation de la configuration, copie des
    sources, transcription des sources ;
  - démarrage et complétion du dossier professionnel par un premier entretien,
    si possible avec un mode voix, même non interactif (anticipe des issues non
    encore développées) ;
  - rappel au début de chaque nouvelle session, tant que le dossier n'est pas
    prêt, pour avertir que les résultats peuvent ne pas être optimaux ; montrer
    aussi le cas où l'on tente d'ajouter une opportunité trop tôt ;
  - ajout d'une opportunité, préparation de l'entretien, simulation de
    l'entretien, puis débrief ;
  - ajout d'une deuxième opportunité en parallèle, avec changement de session
    pour la traiter, afin de montrer comment les sessions s'enchaînent en
    retrouvant l'état du workspace (point important) ;
  - fonctionnement avec Git (prochaine issue à traiter, issue #6).
- Le script de démo pourrait aussi servir de base à un quick start pour les
  utilisateurs, ou à une version plus légère tirée d'un plan de test de démo. À
  voir si ce contenu relève de la documentation du projet.
- Décision de l'auteur : cet élément entre dans la v0.4.0, en une seule issue
  enrichie de façon incrémentale (voir la synthèse temporaire ci-dessus).

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
