# Backlog

This backlog preserves ideas discussed during the design of Career AI Toolkit. Items are not commitments; priorities will be driven by pilot feedback.

Work that is committed or being prepared is tracked in [GitHub Issues](https://github.com/JeromeJ77/career-ai-toolkit/issues), prioritized on the project board and grouped by milestone. This file keeps the ideas that are not yet engaged.

Follow the staged workflow in [CONTRIBUTING.md](CONTRIBUTING.md): first normalize,
review and commit new ideas here without grooming them; then analyze and select
the release scope and commit the confirmed candidate-issue table; finally review
and create each issue before removing only its covered backlog content in a
third cleanup commit.

## New ideas (grooming necessary)

### Installation, confidentialité et premier lancement

- Préciser dans la documentation et à la première session de coaching qu'il faut
  bien configurer son outil, surtout sur un compte personnel, pour assurer la
  confidentialité des échanges et ne pas entraîner les modèles avec les
  informations personnelles du dossier professionnel, des sources et des
  séances.
- Documenter le fait que la navigation web est désactivée par défaut dans le
  workspace. Confirmer l'intention de conception, a priori le huis clos et la
  traçabilité des sources d'information, puis la mettre noir sur blanc avant de
  décider s'il faut changer ce comportement.

### Phase initiale après installation

- Créer un vrai use case incontournable après la première installation :
  constituer une première version exploitable du dossier professionnel
  (`professional profile`) avant de traiter une opportunité.
- Prévoir un entretien initial avec le coach, si possible en vocal, car c'est
  plus rapide et cela sert déjà de premier entraînement à un entretien. Le coach
  doit avoir une liste de sujets précis à aborder, dont certains facultatifs :
  historique, compétences, envies, besoins, contraintes, valeurs, priorités,
  préférences et autres informations utiles.
- Ne pas faire de debrief à ce stade, surtout en mode vocal. Le but est de
  récolter le plus d'informations fiables possible pour constituer la v1 du
  dossier professionnel.
- Traiter cette phase comme un use case à part entière avant d'accepter de
  travailler sur une offre. Sinon les résultats du coaching et de l'analyse des
  offres d'emploi seraient biaisés, peu adaptés, voire médiocres, et l'outil
  pourrait être perçu comme contreproductif avant même d'avoir travaillé avec
  des données de qualité.
- Poser les questions une par une, attendre la réponse, et indiquer où on en
  est, par exemple `3/10`.
- Évaluer la possibilité de demander des références publiques LinkedIn, GitHub,
  CV ou PDF, puis de laisser le coach récupérer et extraire les informations.
  Ce point entre en tension avec la navigation web désactivée par défaut :
  clarifier le design attendu, par exemple option de configuration du workspace
  à `false` par défaut, activation explicite ou autre flux d'import maîtrisé.
- Vérifier si l'utilisateur peut donner un PDF et si le coach peut le classer
  automatiquement dans le bon répertoire de sources. Un premier test avec
  Claude dans VS Code laisse penser que ce n'est pas possible : confirmer le
  comportement avec d'autres outils, notamment ChatGPT Desktop, et prévoir un
  flux alternatif si nécessaire.
- Demander à l'utilisateur de mettre tous les documents utiles dans
  `profile/sources/`, puis faire systématiquement une conversion en Markdown
  quand c'est pertinent.
- Vérifier que toutes les informations utiles sont bien extraites des sources
  pendant leur conversion en Markdown, puis les faire valider par l'utilisateur
  avant de les intégrer au dossier professionnel.
- Résultat attendu : le coach commence par cette étape obligée, puis ne propose
  ni n'accepte de traiter une première opportunité que lorsqu'il dispose de
  suffisamment de matière validée.

### Versionnage et statut du dossier professionnel

- Évaluer s'il faut versionner le dossier professionnel comme un livrable, par
  exemple en `0.1` pendant l'initialisation puis en `1.0` lorsque le coach estime
  avoir suffisamment d'informations pour traiter la première opportunité.
- Définir un statut du dossier professionnel, à confirmer, par exemple
  `empty`/`initial`, `draft`, `ready`. Ne pas retenir un état final comme
  `complete` : le dossier continue d'évoluer au fil du parcours professionnel.
  `ready` indiquerait seulement qu'il contient assez de matière validée pour
  traiter des opportunités dans de bonnes conditions.
- Ajouter un score de complétion en pourcentage pour rendre la maturité du
  dossier visible et plus explicite.
- Le coach devrait refuser gentiment de continuer vers le traitement d'une
  opportunité tant que cette étape essentielle n'est pas complétée. Si
  l'utilisateur insiste, le coach peut continuer, mais doit garder le statut du
  dossier explicite et prévenir que la qualité sera dégradée. Tant que le
  dossier n'est pas `ready`, rappeler cette mise en garde au début de chaque
  nouvelle session de travail.

### Arborescence, updates et cycle de vie du workspace

- Séparer plus clairement les données utilisateur des skills du toolkit.
- Tout ce qui serait sous une future zone `data/` ne devrait contenir que des
  données utilisateur et des `README.md` locaux. Cette zone pourrait regrouper
  `archives/`, `config/`, `cv/`, `opportunities/` et `profile/` ; confirmer si
  `feedback/` doit également en faire partie.
- Initialiser les fichiers obligatoires à partir de modèles conservés sous
  `skills/assets/`, par exemple `professional-profile.md`,
  `external-references.md` et `workspace.yaml`.
- Ajouter au build une vérification explicite de cette séparation entre moteur
  générique et données utilisateur.
- Cette séparation doit permettre une mise à jour simple du toolkit en copiant
  le contenu du nouveau ZIP dans le workspace, tout en préservant les données
  personnelles et les artefacts de l'utilisateur.
- Avant cette opération, demander dans la documentation d'installation de
  vérifier `git status` afin de tracer la mise à jour et de permettre un
  rollback facile. Ce point dépend du workflow Git décrit ci-dessous.
- À la session suivante, détecter et signaler que la mise à jour a eu lieu. Si
  Git est disponible, proposer après validation de l'utilisateur un commit
  dédié, par exemple `chore: update Career AI Toolkit from v0.4.0 to v0.5.0`,
  avant toute nouvelle séance de coaching.
- Définir un mécanisme déterministe permettant de comparer la version du moteur
  avec l'état des données et d'identifier les migrations nécessaires. Articuler
  ce mécanisme avec le futur manifest et la stratégie de migration déjà présents
  dans le backlog.

### Sessions de coaching et changements de périmètre

- Encourager des conversations ciblées sur un périmètre de travail cohérent afin
  de limiter le bruit dans le contexte et de faciliter la reprise ultérieure.
- Lorsque l'utilisateur passe manifestement à un autre périmètre, le coach doit
  proposer, voire recommander explicitement, de démarrer une nouvelle
  conversation. Exemples : passer d'une opportunité à une autre, ou quitter le
  travail sur une opportunité pour une tâche transverse comme le CV.
- Avant le changement de conversation, enregistrer sur disque les artefacts et
  états courants du périmètre quitté, rendre sa prochaine action explicite et,
  si Git est disponible, proposer le checkpoint ou commit correspondant avec
  validation de l'utilisateur.
- Donner à l'utilisateur une consigne de reprise concise pour la nouvelle
  conversation et vérifier que le workspace contient tout le contexte durable
  nécessaire. Ne pas imposer ce changement pour une demande courte qui reste
  directement liée au périmètre courant.

### Git et historique local

- Encourager à versionner localement le workspace et proposer l'initialisation
  Git quand c'est pertinent.
- Si Git est présent, intégrer Git au workflow nominal ; sinon, ignorer les
  comportements spécifiques à Git.
- Si l'utilisateur quitte explicitement une conversation ou une session de
  coaching avec une expression comme « au revoir », proposer un commit Git avec
  validation de l'utilisateur et un message qui résume la session. Confirmer
  les expressions de fin de session reconnues et les documenter dans le
  glossaire.
- Si une nouvelle conversation démarre avec un `git status` non clean, inviter
  l'utilisateur à fermer proprement la session précédente. Si la session a été
  perdue, aider à créer le checkpoint manquant avant de continuer. Ce mécanisme
  doit assurer la traçabilité des modifications du dossier et de la progression
  des sessions de coaching ; il pourra également faciliter les tests du toolkit.

### Feedback d'entretiens réels et anonymisation

- Anonymiser les résultats suite à un debrief d'entretien réel avant tout
  partage ou réutilisation hors du workspace privé.
- Définir où et comment stocker, organiser et valider les feedbacks
  anonymisés afin qu'ils puissent être utilisés par le coach.
- Évaluer si l'équipe pilote peut contribuer des feedbacks anonymisés par pull
  request sur le projet GitHub, et définir comment vérifier automatiquement
  l'anonymisation avant d'accepter ces contributions.

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
