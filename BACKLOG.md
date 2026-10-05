# Backlog

This backlog preserves ideas discussed during the design of Career AI Toolkit. Items are not commitments; priorities will be driven by pilot feedback.

Work that is committed or being prepared is tracked in [GitHub Issues](https://github.com/JeromeJ77/career-ai-toolkit/issues), prioritized on the project board and grouped by milestone. This file keeps the ideas that are not yet engaged.

Follow the staged workflow in [CONTRIBUTING.md](CONTRIBUTING.md): first normalize,
review and commit new ideas here without grooming them; then analyze and select
the release scope and commit the confirmed candidate-issue table; finally review
and create each issue before removing only its covered backlog content in a
third cleanup commit.

## New ideas (grooming necessary)

### Supprimer `language.coaching` : la langue de la session suit la conversation

Écart constaté lors des tests de #14 (2026-10-04) : le coach répond dans la
langue utilisée par le candidat et ne tient pas compte de `language.coaching`,
même quand elle diffère de la langue de début de conversation. Les consignes
n'indiquent pas laquelle l'emporte (`interview-coach/SKILL.md`, règle « Coach in
the configured coaching language »). La clé n'est lue que pour rédiger
`opportunity.md` (D-014).

Constat complémentaire (2026-10-04) : après une première conversation en
français, une seconde conversation commencée en anglais (« Let's resume ») a
reçu une réponse en français. La règle doit donc être renforcée : la langue
du premier message de la conversation fixe la langue de coaching de la session,
y compris à la reprise, et ne change que sur demande explicite du candidat.
Cette demande explicite fonctionne déjà : « Let's switch in English » a bien
été prise en compte et la conversation a continué en anglais.

Constat complémentaire (tests manuels de #15, 2026-10-04) : une première
session commencée en anglais (accueil, question du prénom et compte rendu en
anglais) est passée au français sans demande du candidat, après la
transcription des sources et l'extraction des informations pour le dossier
professionnel : « Merci, Nadia. J'ai corrigé votre prénom dans la
configuration. », puis tout le reste en français. La configuration créée par
défaut (`language.coaching` et `language.profile` en `fr-FR`) semble l'avoir
emporté sur la langue de la conversation. Il faut des règles de langue claires
pour le dossier comme pour les conversations. Le candidat a continué en
anglais (« Validate the profile as proposed, keep salary out of it ») : le
coach est resté en français. Traiter des données en français tout en
conversant en anglais semble le perturber.

L'auteur souhaite traiter dans une même issue cette idée et « Langue du
dossier professionnel à la première session ».

- Supprimer la clé `language.coaching` de `workspace.yaml` et de son modèle.
- Langue de coaching de la session : celle du début de la conversation, modifiable
  à la demande du candidat.
- `opportunity.md` rédigé dans `language.profile` (au lieu de `language.coaching`),
  avec traduction fidèle des sources et langue d'origine indiquée ; les
  transcriptions gardent la langue de l'original. Mettre à jour D-014 (statut,
  décision, conséquences) ou la remplacer par une nouvelle entrée ; son point
  sur le candidat qui coache dans une autre langue que celle de son dossier est
  déjà inscrit dans ses conditions de réévaluation.
- Compatibilité : si l'entrée dépréciée `language.coaching` est présente dans un
  `workspace.yaml` existant, le coach l'ignore et affiche un avertissement ; à la
  demande du candidat, il la retire pour supprimer l'avertissement. La
  synchronisation des clés ne supprime jamais rien d'elle-même.
- Point à trancher (repris dans les conditions de réévaluation de D-014) : un
  candidat qui travaille en anglais avec un `language.profile` en français lira
  ses `opportunity.md` en français.
- Fichiers concernés : modèle `workspace.yaml`, `workspace/AGENTS.md`, règle de
  langue de `interview-coach/SKILL.md`, gestion des clés invalides ou dépréciées
  de `init-workspace`, README de config, test-plan, scénario maître du kit de
  test, `CHANGELOG.md`.

### Langue du dossier professionnel à la première session

Relevé pendant les tests manuels de #15 (2026-10-04), lors d'une première
session en anglais : `workspace.yaml` est créé avec les valeurs par défaut du
modèle (`language.profile: "fr-FR"`), sans que le coach ne demande ni ne
signale la langue du dossier professionnel. Un candidat qui travaille en
anglais obtient donc un dossier rédigé en français sans l'avoir choisi.

- À la première session, le coach signale la langue du dossier professionnel,
  ou la demande, avant de construire le dossier.
- À rapprocher de « Supprimer `language.coaching` » (même sujet de langue en
  première session et à la reprise) et de l'issue n° 10 (entretien
  d'initialisation du dossier professionnel).

### Signaler un écart entre l'identité du candidat et celle des sources

Relevé pendant les tests manuels de #15 (2026-10-04) : le testeur a donné un
prénom différent de celui des sources fictives. Au dépôt des sources, le coach
a relevé que tous les documents étaient au nom d'une autre personne, n'a rien
copié ni transcrit, et a demandé de choisir : documents du candidat sous un
autre nom (jeu de test ou données pseudonymisées), documents d'un tiers
(confirmer l'autorisation de les conserver dans l'espace carrière), ou mauvais
fichiers. Ce comportement est émergent, non prescrit par les consignes : il
n'est donc pas garanti.

- Ajouter une règle : avant de traiter des sources, signaler tout écart entre
  l'identité du candidat (prénom configuré, dossier professionnel) et celle des
  sources, ne rien copier ni transcrire, et demander comment procéder.
- Après la réponse, corriger le prénom à utiliser si le candidat le demande.

### Auditer le skill du coach avant le pilote

Proposé pendant la deuxième passe de #15 et #18 (2026-10-05) : auditer les
consignes du coach (`workspace/AGENTS.md`, `CLAUDE.md` et les skills, en
particulier `interview-coach`) au regard de l'état de l'art et des bonnes
pratiques de rédaction d'instructions et de skills pour agents.

- Objectif : détecter les risques potentiels avant le début de la phase
  pilote.
- Piste : confier l'analyse à un modèle de réflexion supérieure, par exemple
  Fable 5.1.
- Si rien de critique n'est trouvé, tant mieux ; noter alors au backlog les
  évolutions possibles, à prévoir plus tard.
- Constats des tests de #15 et #18 qui pourraient l'alimenter : règles lues
  seulement en début de session et oubliées ensuite (prénom), commentaires du
  coach sur ses propres consignes ou étapes (« comme demandé par le CLAUDE.md »,
  « Step 2: check existence only… »), ajouts non prescrits (avertissement après
  une réponse proposée).
- À rapprocher de « Tests automatiques du coach par sous-agent » et des
  recommandations de raisonnement selon les tâches (section « Immediately
  after the end-to-end test »).

### Renommer le dépôt en `mycareer-toolkit`

Réflexion du 2026-10-05, née du travail sur le logo (image partagée en
conversation, non versionnée : « MyCareer » en grand sur une ligne,
« Workspace » en dessous). Sur le logo, l'œil lit « MyCareer / Workspace » :
« MyCareer » fonctionne comme une marque. Le nom du produit en a été tranché
le jour même dans #15 : **MyCareer Workspace**, nom technique
`mycareer-workspace` (D-017 précisée). Reste le dépôt, sans urgence.

- **Orientation émergente** : marque **MyCareer**, produit MyCareer Workspace,
  dépôt `mycareer-toolkit` (à étudier).
- **Pourquoi renommer le dépôt** : il ne contient plus seulement un workspace,
  mais aussi les skills, le coach, les modèles, les mécanismes de génération,
  les connaissances, les décisions et les outils de capitalisation. « Workspace »
  décrit bien l'expérience utilisateur, moins bien le contenu du dépôt.
- **Pourquoi « toolkit »** : le mot couvre l'ensemble (MyCareer Workspace,
  skills, coach, modèles, base de connaissances, utilitaires) sans privilégier
  un composant. Il ne s'agit pas d'aligner le dépôt sur le nom du produit.
- **Pourquoi retirer « AI »** : l'IA est une technologie de mise en œuvre, pas
  l'objectif ; l'utilisateur cherche une aide à sa carrière, une mémoire
  professionnelle et un espace de travail personnel.
- **État** : aucune décision prise ; piste jugée plus cohérente avec
  l'évolution du produit.

Points à examiner au grooming :

- D-017 a étudié et rejeté le renommage du dépôt (« `career-ai-toolkit` reste
  adapté au projet global… fondés sur l'IA ») ; l'argument « l'IA n'est pas
  l'objectif » était alors appliqué au seul produit. Le reprendre signifie
  réévaluer D-017.
- Disponibilité du nom « MyCareer » (marques, homonymes, par exemple le mode
  carrière de NBA 2K), à vérifier avant une diffusion publique.
- Impacts d'un renommage du dépôt GitHub : URL et liens (redirigés par GitHub),
  badges, projet, répertoire local, entrée « Career AI Toolkit » du glossaire.

L'idée suivante est issue du debriefing de la démo enregistrée (2026-10-03),
mené avec Copilot. Les autres idées de ce debriefing sont devenues les issues
#13 (modèle du journal des décisions), #14 (abandon du mode standalone) et #15
(recentrage sur MyCareer Workspace).

### Rendre le coaching et les simulations plus vivants

Regroupe quatre constats : progression du coach, ton conversationnel, prénoms
des interviewers et prénom de l'utilisateur dans la conversation.

- Progression pendant les traitements longs : relevé lors des tests de #14
  (2026-10-04), le coach parle peu quand il travaille, par exemple quand on lui
  demande de commencer à préparer une offre, et le candidat attend sans savoir
  ce qui se passe.
  - Le coach dit ce qu'il fait : « Je fais le point sur les informations à ma
    disposition », « J'analyse ces informations au regard de votre dossier
    professionnel », etc.
  - Quand son plan comporte plusieurs étapes, il numérote la progression :
    « 1/4 - Je fais le point… », puis « 2/4 - J'analyse… ».
- Ton conversationnel : relevé lors des tests de #14 (2026-10-04), le coach
  s'exprime de façon technique, par exemple « le message 5 n'est pas supprimé,
  il est déplacé dans la section retirée ou invalidée de `analysis.md` avec
  votre raison ».
  - Par défaut, rester au niveau fonctionnel et tenir une vraie conversation
    (« D'accord, c'est noté »), sans détailler les fichiers ni les règles
    internes.
  - Conserver un mode développeur/test, activable, qui garde ces détails pour
    comprendre ce qui se passe et valider le comportement attendu.
  - Le début de session est traité dans #15 (corrections R6 à R8, tests
    manuels du 2026-10-04) : ligne fixe *Lancement de la session…*, puis
    directement l'accueil ou la salutation, sans citer les fichiers
    d'instructions ni la procédure. Reste à faire : le reste de la
    conversation et le mode développeur/test.
- Prénoms des interviewers en simulation : relevé à la démo à blanc
  (2026-10-03, étape D5) puis aux tests de #14 (2026-10-04) : « Interviewer 1 »
  évoque une autre personne alors qu'aucun interviewer ne porte de nom. Donner
  un prénom à chaque interviewer, cohérent d'un tour à l'autre de la
  simulation, plutôt que « interviewer 1 », « interviewer 2 ». Non implémenté à
  ce jour.
- Prénom de l'utilisateur dans la conversation : proposé pendant le cadrage de
  #15 (2026-10-04). La question posée après le message d'accueil, la
  configuration du prénom et son usage en début et en fin de session sont
  traités dans #15. Reste à faire : employer le prénom de temps en temps
  pendant la conversation, de manière naturelle, sans le répéter à chaque
  message. Plus délicat à régler (fréquence, moments opportuns). Constat des
  tests manuels de #18 (2026-10-04) : sans règle dans `interview-coach`, le
  prénom revenait dans quatre messages rapprochés. Pour v0.4.0, #15 (R9)
  limite le prénom à la salutation, à l'accusé de réception du choix et à la
  prise de congé ; l'usage occasionnel est à réintroduire ici, avec mesure.
- À rapprocher de « Ton et emojis paramétrables » et de « Tutoiement ou
  vouvoiement constant et paramétrable ».

### Cas de test mesurable pour l'analyse orientée action

- Relevé lors des tests de #14 (2026-10-04) : la règle « synthèse orientée
  action, pas audit exhaustif » ne peut pas être validée sans critère mesurable.
- Définir un cas de test avec des données précises (offre et dossier fictifs du
  kit) et un résultat attendu qui distingue une synthèse orientée action d'un
  audit : par exemple longueur maximale, nombre de priorités, présence d'actions
  concrètes et absence de recensement exhaustif.

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

### Proposer un feedback produit lors d'une mise à jour du moteur

- Lors d'une mise à jour du moteur (issue #7), si le journal de feedback
  produit (issue #17) contient des entrées non traitées, proposer de générer
  d'abord un feedback sur la version précédente. À creuser.

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

### Génération de la lettre de motivation dans le workspace

- Relevé lors de l'abandon du mode standalone (#14, 2026-10-04) : le standalone
  proposait, seulement si c'était pertinent et en fin de préparation, de générer
  ou réviser une lettre de motivation concise, sans détourner la séance vers ce
  livrable. Le workspace n'a pas de workflow équivalent : le modèle
  `cover-letter.template.md` existe mais n'est référencé nulle part, et
  l'emplacement de la lettre dans l'arborescence n'est pas défini.
- Voir aussi la section « Cover letters » ci-dessous.

### Explorations ultérieures

- Évaluer si un RAG serait utile, notamment dans le cadre de feedbacks
  d'entretiens réels anonymisés.
- Identifier d'autres parallèles pertinents entre un coach dans la vraie vie et
  le coach du toolkit, afin d'affiner le modèle comportemental et le workflow
  utilisateur.
- Envisager un skill dédié pour préparer un entretien technique, par exemple
  avec un entraînement rapide en questions/réponses ou QCM.

## Pilot validation

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
  - Hypothèse du développeur (tests manuels de #18, 2026-10-04, Sonnet 5.5),
    à vérifier à l'usage : les simulations et le joker demandent un modèle de
    réflexion supérieure (type Opus 5.5). Rejouer D5 avec ce modèle pour
    comparer la qualité des conseils, des réponses proposées et du débrief.

## English version of the workspace

- Provide an English version of the workspace (READMEs, workspace-facing
  documentation and templates) after the French pilot behavior has stabilized.
- Define how French and English versions remain aligned.

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
