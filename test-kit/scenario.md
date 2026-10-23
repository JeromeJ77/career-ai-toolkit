# Scénario maître

Liste ordonnée des étapes à jouer avec le coach sur les données fictives du kit. Il sert à trois usages : vérifier les exigences du produit (`docs/requirements/`) sans donnée personnelle, faire la démo du toolkit, et plus tard servir de base à des tests automatiques.

Le build extrait de ce fichier le **script de démo** : il ne garde que les étapes taguées `[demo]`, réduites aux champs utiles au présentateur (durée, conversation, fichiers, actions, prompts, mots-clés présentés comme « À montrer »), et le tableau récapitulatif. Les attendus et les lignes **Exigences** restent dans ce fichier. Les autres étapes ne servent qu'aux tests. Pour qu'une consigne figure dans le script de démo, la mettre dans **Action** ou **Mots-clés**, jamais seulement dans **Attendu**.

## Mode d'emploi

- Jouer le scénario dans un workspace **extrait du ZIP, hors du dépôt**, jamais dans `workspace/` ni dans un workspace personnel.
- Les fichiers à déposer viennent du ZIP du kit (`sources/profile/`, `sources/opportunities/`). Les chemins de destination sont relatifs à la racine du workspace extrait.
- Dans la conversation, parler **au nom de Nadia Berkani**, la candidate fictive. Ses motivations, contraintes et points faibles sont dans `sources/profile/notes-complementaires-carriere.md` : s'en inspirer pour répondre de façon crédible pendant les simulations.
- Chaque étape indique le résultat attendu et, par sa ligne **Exigences**, les exigences de `docs/requirements/` qu'elle vérifie. Les groupes d'exigences y sont séparés par « ; » ; un groupe suivi d'une parenthèse est vérifié par l'invite qu'elle nomme (`C4.2` pour le prompt 2 de C4), un groupe sans parenthèse par l'étape entière. Consigner le résultat réel dans un fichier de session de `docs/test-history/` qui cite les tests joués par ces identifiants, puis dans le tableau de bord de `docs/test-log.md`, jamais par déduction.
- Le champ **Conversation** de chaque étape dit s'il faut ouvrir une nouvelle conversation ou rester dans celle de l'étape précédente (« suite de D3 »). « Nouvelle » signifie fermer la conversation en cours et en ouvrir une autre dans le même workspace, pour vérifier que le contexte vient des fichiers et non de l'historique. Les étapes `[manual]` sans prompt n'en ont pas.

### Tags

| Tag | Sens |
| --- | --- |
| `[demo]` | Étape retenue pour la démo de 35 à 40 minutes. La durée indicative est notée dans l'étape. |
| `[todo #N]` | Étape qui dépend de l'issue #N, non livrée. À jouer et à compléter quand l'issue sera livrée. Son titre est en italique pour être repéré facilement. Le script de démo ne la reprend pas : la démo ne montre que ce qui est livré. |
| `[manual]` | Étape hors conversation : manipulation de fichiers ou de l'outil. |
| `[socle]` | Étape du parcours essentiel d'un pilote francophone sur une installation neuve, rejoué en passe rapide avant une release (environ 1 h 20 avec le prompteur, `/prompteur socle`). Le champ **Socle** d'une étape limite au besoin ce qui est joué. Le script de démo retire ce tag et ce champ. |

## Phase A — Préparation

### A1 — Extraire et ouvrir le workspace [demo] [socle] [manual]

- **Durée démo** : 2 min
- **Fichiers** : `mycareer-workspace-v<version>.zip` → un répertoire hors du dépôt, par exemple `C:\Temp\mycareer-workspace-demo-26-10-03\`.
- **Action** : extraire le ZIP hors du dépôt, puis renommer le répertoire extrait avec un suffixe `-demo` ou `-test` suivi de la date du jour au format `AA-MM-JJ` (par exemple `mycareer-workspace-demo-26-10-03`), jamais le nom de base : il ne doit pas être confondu avec un workspace personnel ou de bêta-test ouvert ailleurs, et la date confirme dans l'outil IA qu'on travaille bien dans le workspace du jour. Garder les workspaces des passes précédentes dans `C:\Temp\` plutôt que les supprimer : on peut ainsi comparer les résultats de plusieurs tests ou démos. Ouvrir ce répertoire comme projet dans VS Code avec Claude Code (ou l'outil IA équivalent). Montrer l'arborescence : moteur à la racine, `data/` ne contenant que des `README.md`.
- **Attendu** : le ZIP contient un seul répertoire racine `mycareer-workspace/` ; `data/` ne contient aucun fichier de travail.
- **Exigences** : REQ-BLD-03, REQ-BLD-06

## Phase B — Initialisation du workspace

### B1 — Première session [demo] [socle]

- **Durée démo** : 3 min
- **Conversation** : nouvelle (la première du workspace)
- **Prompt 1** : « Bonjour, on peut commencer la première session. »
- **Attendu 1** : la réponse commence par la seule ligne fixe en italique *Lancement de la session…*, sans autre préambule (aucune mention du CLAUDE.md, des consignes, d'une procédure ou d'étapes, ni du fait qu'il s'agit d'une première session), puis le coach affiche immédiatement l'accueil exact (« Bienvenue dans votre **espace carrière** ! », phrase de présentation, question sur le prénom) et attend la réponse, sans créer de fichier ni lire de données avant. Il parle d'« espace carrière », jamais de « workspace ».
- **Prompt 2** : « Oui, Nadia. »
- **Attendu 2** : le coach accuse réception (« Entendu, Nadia. Vous pourrez changer cela à tout moment, en me le demandant ou dans votre configuration. »), crée les quatre fichiers obligatoires (`data/config/workspace.yaml`, `data/current-status.md`, `data/profile/professional-profile.md`, `data/profile/sources/external-references.md`) depuis les modèles, le dit en une seule phrase fonctionnelle (« J'ai préparé votre espace : configuration, dossier professionnel (vide pour l'instant), références externes et état courant. »), donne ensuite, une seule fois, le rappel de confidentialité exact (« Un mot sur la confidentialité : vos échanges avec l'outil IA contiennent des informations personnelles. Vérifiez dans les paramètres de votre outil que vos conversations ne servent pas à entraîner des modèles lorsque c'est possible, et comment l'historique et les fichiers joints sont conservés, en particulier avec un compte personnel. Je ne peux pas le vérifier à votre place. Par ailleurs, je ne consulte pas le web sans votre accord explicite. »), sans attendre de réponse ni donner de procédure propre à un outil, puis un court message sur le feedback produit, sans question : pendant le pilote, le coach tient des notes locales sur les difficultés d'usage pour améliorer le produit ; on peut lui dicter une note en commençant par « suggestion d'amélioration : » et lui demander de générer un feedback ; rien n'est envoyé automatiquement. Il propose ensuite de construire le dossier professionnel à partir des documents de la candidate, et ne remplit pas le dossier professionnel. `data/config/workspace.yaml` contient `user.address_by_first_name: yes`, `first_name: "Nadia"` et un `product_feedback.user_id` rempli, sans lien avec le nom de la candidate ; le journal du feedback produit existe sous `data/feedback/`, sans entrée ; aucun `pilot-feedback.md` n'est créé.
- **Mots-clés** : montrer l'accueil et la question du prénom, puis le fait que le coach attend la réponse avant de préparer l'espace ; faire remarquer le rappel de confidentialité (une quinzaine de secondes) et le message sur le feedback produit (local, rien n'est envoyé) ; faire remarquer que le dossier professionnel est un squelette vide et que rien n'y sera écrit sans validation.
- **Exigences** : REQ-SES-01, REQ-SES-02, REQ-SES-03, REQ-SES-05, REQ-SES-07, REQ-SES-08, REQ-SES-09, REQ-COACH-03 (B1.1) ; REQ-SES-11, REQ-SES-12, REQ-SES-13, REQ-SES-17, REQ-PROF-01, REQ-PRIV-01, REQ-PRIV-02, REQ-FB-01, REQ-FB-02, REQ-FB-04 (B1.2)

### B2 — Deuxième session sans changement [socle]

- **Conversation** : nouvelle
- **Prompt** : « On reprend. »
- **Attendu** : la réponse commence par la ligne fixe en italique *Lancement de la session…*, puis le coach salue par « Bonjour Nadia. », suivi de la ligne de statut du dossier « Dossier professionnel : ⚪ vide (version 0.1). », sans message d'accueil ni question sur le prénom ; rien n'est créé ni réécrit, il ne signale aucune création et ne dit rien de l'état de l'initialisation ou de la configuration (pas de « Votre espace carrière est prêt… »), ni ne cite le CLAUDE.md, une procédure ou une étape (ni « Step 2… »). Aucun rappel de confidentialité, rien sur le feedback produit. Le prénom n'est ensuite employé que dans la salutation, l'accusé de réception du choix et l'au revoir.
- **Exigences** : REQ-SES-02, REQ-SES-03, REQ-SES-04, REQ-SES-10, REQ-SES-14, REQ-SES-22, REQ-SES-24, REQ-SES-26, REQ-CONF-03, REQ-PROF-01, REQ-PRIV-03, REQ-FB-05

### B3 — Fichier supprimé, fichier personnalisé [manual]

- **Action** : supprimer `data/profile/sources/external-references.md` ; ajouter un commentaire personnel dans `data/current-status.md`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : seul le fichier supprimé est recréé ; le fichier personnalisé reste intact.
- **Exigences** : REQ-SES-15, REQ-SES-16

### B4 — Clé de configuration manquante [manual]

- **Action** : retirer la clé `allow_external_web_search` de `data/config/workspace.yaml`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : la clé est ajoutée à sa place avec sa valeur par défaut, le coach dit quelle clé et quelle valeur ont été ajoutées, le reste du fichier est inchangé. Une session suivante n'ajoute rien.
- **Exigences** : REQ-CONF-01, REQ-CONF-02, REQ-CONF-03, REQ-PRIV-05

### B5 — Valeur de configuration invalide [manual]

- **Action** : mettre `allow_external_web_search: peut-être`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : le fichier n'est pas réécrit ; le coach indique la clé, la valeur trouvée et la valeur par défaut utilisée pour la session, et laisse la correction à la candidate. Aucune navigation n'a lieu (la valeur par défaut `false` s'applique). Remettre `false` ensuite.
- **Exigences** : REQ-CONF-04, REQ-PRIV-05, REQ-PRIV-06

### B6 — Langue du dossier [manual]

- **Action** : vérifier dans `data/config/workspace.yaml` que `language.profile` et `language.coaching` valent `"fr-FR"` et que `language.deliverables` contient `"fr-FR"` (les modifier sinon).
- **Attendu** : les valeurs sont celles du modèle ; aucune modification n'est nécessaire sur un workspace neuf.
- **Exigences** : REQ-CONF-05

### B7 — Prénom : réponses et version antérieure [manual]

- **Action** : dans `data/config/workspace.yaml`, supprimer la section `user`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour, on reprend. »
- **Attendu** : les clés `user.address_by_first_name: unset` et `user.first_name: ""` sont ajoutées et signalées ; le coach pose la question du prénom **sans** message d'accueil.
- **Prompt (suite)** : ignorer la question, par exemple « Rappelle-moi où en est mon dossier. »
- **Attendu** : le coach ne insiste pas et traite la demande ; la valeur est `ask_again`.
- **Conversation** : nouvelle, prompt « Bonjour. » : la question est reposée une dernière fois ; l'ignorer à nouveau → la valeur devient `no`.
- **Action** : remettre `unset`. Nouvelle conversation, prompt « Bonjour. », répondre « Oui » sans prénom : le coach demande « Quel prénom dois-je utiliser ? » et n'écrit rien tant qu'il n'est pas donné.
- **Action** : remettre `unset`. Nouvelle conversation, prompt « Bonjour. », répondre « Non » : valeur `no`, accusé de réception conforme ; à la conversation suivante, « Bonjour. » sans prénom et sans question.
- **Action** : remettre `yes` et `"Nadia"`. Nouvelle conversation, puis écrire « Merci, au revoir. » : le coach répond « À bientôt, Nadia. » Le prénom n'est pas répété à chaque message.
- **Attendu** : à la fin, `yes` et `"Nadia"` sont rétablis pour la suite du scénario.
- **Exigences** : REQ-SES-18, REQ-SES-19, REQ-SES-20, REQ-SES-21, REQ-SES-22, REQ-SES-23, REQ-CONF-01, REQ-CONF-02

### B8 — Garde-fou de première session [manual]

- **Action** : dans un workspace déjà utilisé (dossier professionnel rempli), supprimer `data/current-status.md`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : pas de message d'accueil ; le coach signale une perte possible de `current-status.md` et demande comment procéder, sans recréer le fichier avant la réponse.
- **Exigences** : REQ-SES-06

### B9 — Première session en anglais [manual]

- **Fichiers** : extraire une seconde fois le ZIP, dans un autre répertoire (par exemple `mycareer-workspace-test-en-26-10-03`).
- **Conversation** : nouvelle (la première de ce second workspace)
- **Prompt** : « Hello, let's start. »
- **Attendu** : la réponse commence par la seule ligne fixe en italique *Starting the session…*, sans autre préambule ni mention des consignes ou d'une procédure, puis le coach affiche l'accueil anglais exact (« Welcome to your **career workspace**! »…) et la question du prénom, attend la réponse, puis accuse réception en anglais (« Got it, … »), rend compte en une phrase en anglais, donne le rappel de confidentialité et le message sur le feedback produit en anglais (le mot-clé cité est « suggested improvement: ») et propose de construire le dossier. Il dit « career workspace », jamais « workspace » seul pour désigner le produit.
- **Prompt 2** : « suggested improvement: the welcome message could say how long the setup takes. »
- **Attendu 2** : la ligne exacte en italique *Product feedback note recorded.*, puis le coach reprend où il en était ; une entrée « explicite » est ajoutée au journal, avec ce texte brut.
- **Exigences** : REQ-SES-03, REQ-SES-28, REQ-PRIV-04, REQ-FB-23, REQ-COACH-04 ; REQ-FB-24 (B9.2)

### B10 — Feedback produit : workspace antérieur et journal supprimé [manual]

- **Action** : dans le workspace principal (pas celui de B9), dans `data/config/workspace.yaml`, supprimer toute la section `product_feedback` ; supprimer le journal du feedback produit sous `data/feedback/`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : la section `product_feedback` est ajoutée avec un `user_id` généré, différent de l'ancien, et le journal est recréé depuis le modèle ; le coach le signale en une phrase courte pour chacun, sans parler de perte possible de données ni demander comment procéder ; le reste de la configuration est inchangé.
- **Action** : supprimer seulement le journal, sans toucher à la configuration ; nouvelle conversation, prompt « Bonjour. »
- **Attendu** : le journal est recréé et signalé en une phrase, sans alerte de perte ; `product_feedback.user_id` n'est pas modifié.
- **Exigences** : REQ-FB-03, REQ-FB-06, REQ-FB-07, REQ-FB-08

## Phase C — Sources et dossier professionnel

### C1 — Déposer les sources et les faire transcrire [demo] [socle]

- **Durée démo** : 5 min
- **Conversation** : suite de la dernière conversation (B1 en démo)
- **Prompt 1** : « J'aimerais initialiser mon dossier professionnel. »
- **Attendu 1** : le coach demande les documents disponibles et indique les trois façons de les fournir : les copier dans `data/profile/sources/` (bon sous-répertoire) et le dire, les joindre à la conversation, ou coller leur texte. Il ne demande pas à la candidate de connaître l'arborescence et ne lance pas un long questionnaire avant d'avoir les documents.
- **Fichiers** : joindre à la conversation (glisser-déposer dans la zone de saisie) les quatre fichiers du kit :
  - `sources/profile/cv-nadia-berkani.pdf`
  - `sources/profile/linkedin-nadia-berkani.pdf`
  - `sources/profile/certification-cloud-platform-associate.pdf`
  - `sources/profile/notes-complementaires-carriere.docx`
- **Prompt 2** : « Les voici : mon CV, mon export LinkedIn, mon certificat et des notes personnelles. »
- **Attendu 2** :
  - le coach range une copie inchangée de chaque fichier au bon endroit et l'indique : CV et export LinkedIn dans `data/profile/sources/historical-resumes/`, certificat dans `certifications/`, notes dans `coaching-notes/` ;
  - une transcription `.md` de même nom est créée à côté de chaque original, avec un en-tête (nom d'origine, date, limites) ; les originaux sont intacts ;
  - l'URL `linkedin.com/in/nadia-berkani-example` et le fichier source sont notés dans `external-references.md`, sans date de vérification, sans prétendre avoir ouvert le lien ;
  - le coach **propose** un dossier professionnel initial et n'écrit rien dans `professional-profile.md` avant validation ;
  - il signale ce qui est encore flou ou contradictoire, par exemple le rôle réel sur la migration (piloté sans en avoir le titre) ou le niveau actuel en React ;
  - il a lu le dossier professionnel existant (squelette vide) avant de répondre et ne dit pas qu'il ignore son contenu.
- **Mots-clés** : montrer où le coach a rangé les originaux, puis une transcription et son en-tête ; insister sur « proposer, pas appliquer ».
- **Exigences** : REQ-SRC-01 (C1.1) ; REQ-SES-29, REQ-SRC-02, REQ-SRC-03, REQ-SRC-04, REQ-SRC-09, REQ-PROF-02, REQ-PROF-03 (C1.2)

### C2 — Valider le dossier professionnel initial [demo] [socle]

- **Durée démo** : 2 min
- **Conversation** : suite de C1
- **Prompt** : « D'accord pour l'ensemble, sauf : ne mets pas mon salaire actuel dans le dossier. Applique. »
- **Attendu** : `professional-profile.md` est rempli selon la proposition amendée ; son en-tête passe au statut `draft` (en construction) et à la version 0.2, avec la date du jour et une entrée d'historique ; le salaire n'y figure pas, les durées et chiffres sont ceux des sources (sept ans d'expérience), `data/current-status.md` note où on en est.
- **Mots-clés** : ouvrir `professional-profile.md` : ce n'est plus un squelette vide, on y retrouve les informations validées par la candidate, sans le salaire actuel.
- **Exigences** : REQ-PROF-02, REQ-PROF-04, REQ-PROF-11

### *C3 — Entretien d'initialisation du dossier* [demo] [todo #10]

- **Durée démo** : à estimer à la livraison de #10
- **Prompt** : à définir avec #10.
- **Attendu** : le coach conduit un premier entretien pour compléter les sections du dossier que les sources ne couvrent pas (motivations, préférences, messages récurrents), puis propose les ajouts.

### C4 — Dossier en construction : préparation trop tôt, puis passage à « prêt » [demo] [socle]

- **Durée démo** : 3 min
- **Conversation** : nouvelle (après C2)
- **Prompt 1** : « Bonjour. J'aimerais préparer mes entretiens pour un poste de développeuse backend senior. »
- **Attendu 1** : après « Bonjour Nadia. », la ligne « Dossier professionnel : 🟠 en construction (version 0.2). ». Le coach refuse gentiment en partant du statut : il dit que le dossier n'est pas encore marqué prêt et que le travail demandé (ici la préparation des entretiens) serait moins fiable. Il ne présente pas ce refus comme une sanction et ne crée pas d'opportunité. Il donne ensuite son avis sur le dossier, avec l'une des deux suites selon son jugement (pas de critère mesuré, D-010) : « suffisant », il propose directement le passage à « prêt » (le dossier lui semble suffisant pour travailler sur des opportunités, version 1.0, reste-t-il des informations à ajouter avant ?), en citant au besoin les lacunes qui restent sans en faire une condition (par exemple le system design au tableau, l'impact personnel dans la migration), sans proposer en même temps de compléter le dossier d'abord ; « insuffisant », il nomme les principales lacunes, propose de compléter d'abord le dossier et dit que la candidate peut continuer quand même.
- **Prompt 2** : « Oui, avant : c'est moi qui ai conçu le découpage en six services et écrit le plan de migration validé par le CTO. »
- **Attendu 2** : quelle que soit la suite donnée, le coach propose l'ajout et n'applique rien avant validation ; le statut reste `draft`.
- **Prompt 3** : « D'accord, applique, et on peut passer le dossier en prêt. » Si le coach exprime une réserve en citant des lacunes, répondre « Oui, je confirme. »
- **Attendu 3** : l'ajout est appliqué ; l'en-tête passe à `ready` (prêt), version 1.0, date du jour, entrée d'historique sur le passage à « prêt » ; `data/current-status.md` est mis à jour.
- **Mots-clés** : le coach ne bloque pas par principe, il explique pourquoi la préparation serait moins bonne ; la suite (proposition de « prêt » ou lacunes à compléter) dépend de son jugement sur le dossier ; « prêt » est un seuil opérationnel décidé ensemble, pas un état final ; montrer l'en-tête du dossier (statut, version 1.0).
- **Exigences** : REQ-SES-22, REQ-SES-26, REQ-PROF-06, REQ-OPP-14, REQ-OPP-15, REQ-OPP-16 (C4.1) ; REQ-PROF-02, REQ-PROF-07 (C4.2) ; REQ-PROF-08, REQ-PROF-09, REQ-PROF-11 (C4.3)

### C5 — Réimport après non-écrasement

- **Conversation** : nouvelle
- **Prompt** : « Peux-tu revérifier mes sources ? »
- **Attendu** : aucune transcription existante n'est réécrite ; aucune entrée dupliquée dans `external-references.md`.
- **Exigences** : REQ-SRC-07, REQ-SRC-10

### C6 — Source très volumineuse

- **Fichiers** : `sources/profile/livret-formation-architecture-systemes-distribues.pdf` (49 pages) → `data/profile/sources/certifications/`.
- **Conversation** : nouvelle
- **Prompt** : « J'ai ajouté une nouvelle source dans `data/profile/sources/`. » (ne pas annoncer la taille : c'est au coach de la constater)
- **Attendu** : le coach trouve le nouveau fichier, en indique la taille et demande confirmation avant de transcrire, en proposant de ne transcrire que les parties utiles (ici l'attestation de la première page : formation de 70 h en 2023, projet final 16/20, appréciation du formateur). Il ne transcrit rien avant l'accord. Une fois la transcription faite, il propose d'ajouter la formation au dossier, sans l'écrire avant validation. Le seuil n'est pas chiffré (D-011) : noter le comportement observé.
- **Exigences** : REQ-SRC-08, REQ-PROF-02

### C7 — Dossier professionnel supprimé, statut conservé [manual]

- **Action** : supprimer `data/profile/professional-profile.md`, garder les sources et `data/current-status.md`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour, on continue. »
- **Attendu** : le coach signale l'incohérence, évoque une perte de fichier possible, **ne recrée pas le squelette** et ne réécrit pas le dossier avant décision ; il propose de reconstruire depuis les sources, de restaurer une copie ou de vérifier une synchronisation. Demander alors : « Réimporte tout et reconstruis le dossier. » Les sources sont retranscrites et le dossier reconstruit via le workflow validé.
- **Exigences** : REQ-SRC-11, REQ-PROF-17

### C8 — Navigation web : exceptions ponctuelles [manual]

Le workspace doit être dans l'état de la phase C (dossier professionnel `ready`, après C4), avec `allow_external_web_search: false`.

- **Conversation** : nouvelle
- **Prompt 1** : « Bonjour, j'ai une offre chez Orion Retail, voici le lien : https://jobs.example/orion-retail/senior-backend »
- **Attendu 1** : le coach ne navigue pas de lui-même ; il demande l'accord pour ce lien seulement, avec la question exacte (« Je peux ouvrir https://jobs.example/orion-retail/senior-backend pour lire l'offre. Êtes-vous d'accord, pour cette fois ? »).
- **Prompt 2** : « Oui, d'accord. » **Attendu 2** : le lien fictif n'est pas résolvable : le coach le dit avec le message exact (« Je n'ai pas pu ouvrir https://jobs.example/orion-retail/senior-backend. Vous pouvez coller son contenu ici ou me fournir le fichier correspondant. »), n'affirme jamais avoir consulté l'offre et n'invente rien.
- **Prompt 3** : « Non, je vais coller l'offre. » (après avoir rejoué le prompt 1 dans une nouvelle conversation) **Attendu 3** : aucune navigation ; le coach retombe sur la voie habituelle (coller l'offre ou fournir le fichier).
- **Prompt 4** (nouvelle conversation) : « Peux-tu lire cette offre en ligne ? https://example.com/ » ; si le coach demande l'opportunité visée (l'état de la phase C n'en contient aucune), répondre « Orion Retail, Senior Backend Engineer ». **Attendu 4** : la demande est explicite, le coach n'a pas besoin de reposer la question ; si la navigation est disponible, l'information est présentée pour validation avant d'être écrite dans `opportunity.md`, la page est conservée en transcription datée sous `sources/` (lien et date de consultation) et citée dans la section Sources. La page est neutre : aucune offre réelle n'en est extraite, le coach dit ce qu'il y a trouvé.
- **Prompt 5** (nouvelle conversation) : « Voici le site de l'entreprise : https://example.com/ » **Attendu 5** : fournir un lien n'est pas un accord, le coach demande l'accord pour ce lien et ce besoin ; après « Oui », il ouvre la page (si possible). Après la consultation, écrire : « Et voici aussi leur page carrière : https://example.org/ » ; le coach doit de nouveau demander l'accord : l'accord n'était pas permanent.
- **Action** : mettre `allow_external_web_search: true`, nouvelle conversation. **Prompt 6** : « Voici le site de l'entreprise : https://example.com/ » **Attendu 6** : navigation sans demande d'accord, information présentée pour validation, provenance (lien, date) tracée, rien écrit dans le dossier ou l'opportunité sans validation. Remettre `false` ensuite.
- **Limites du kit** : aucun lien d'offre fictif n'est résolvable, la transcription datée d'une page d'offre (lien et date de consultation) ne peut donc pas être jouée ici. L'outil de test peut demander sa propre autorisation de navigation, distincte de la question d'accord du coach : seule cette dernière est évaluée. Pour une consultation réelle, un site public peut être utilisé, sans rien enregistrer de personnel.
- **Extension D13** : jouer la demande de navigation pendant une simulation (voir D13), puis arrêter la simulation et lire le débrief pour vérifier qu'aucun joker n'est compté.
- **Exigences** : REQ-PRIV-06, REQ-PRIV-07, REQ-PRIV-08 (C8.1) ; REQ-PRIV-13 (C8.2) ; REQ-PRIV-11 (C8.3) ; REQ-PRIV-09, REQ-PRIV-15, REQ-PRIV-16, REQ-PRIV-17 (C8.4) ; REQ-PRIV-07, REQ-PRIV-08, REQ-PRIV-10 (C8.5) ; REQ-PRIV-12, REQ-PRIV-15, REQ-PRIV-16 (C8.6)

### C9 — Dossier non prêt : mise en garde, dérogation et nouvelle passe d'analyse [manual]

- **Action** : dans un nouveau workspace extrait (suffixe `-c9`), jouer B1, puis C1 et C2 en ne joignant **que le CV** (`sources/profile/cv-nadia-berkani.pdf`) : le dossier est en `draft` 0.2, nettement plus mince que celui du workspace principal (une seule source).
- **Ordre** : jouer les invites dans l'ordre ; l'attendu 8 dépend de l'invite 7.
- **Conversation** : nouvelle
- **Fichiers** : joindre `sources/opportunities/002-northwind-ledger-senior-software-engineer.pdf`.
- **Prompt 1** : « J'ai une opportunité chez Northwind Ledger, voici l'offre. »
- **Attendu 1** : l'opportunité est créée, l'offre rangée et transcrite, `opportunity.md` complété, sans refus ni analyse d'adéquation. Comme suite, le coach ne propose pas l'analyse mais le retour au dossier, en disant pourquoi : le dossier n'est pas encore marqué prêt et l'analyse serait sinon moins fiable.
- **Prompt 2** : « Analyse-la quand même. » **Attendu 2** : la mise en garde a déjà été donnée, la demande vaut insistance : pas de nouveau refus. Le coach accepte de continuer en rappelant que le résultat sera moins fiable qu'avec un dossier prêt, ne prétend jamais que l'analyse est aussi fiable, consigne la dérogation dans le `current-status.md` de l'opportunité (statut et version du dossier, date) et note dans `analysis.md` la passe d'analyse avec la version et le statut du dossier utilisés (0.2, en construction).
- **Prompt 3** (nouvelle conversation) : « On reprend Northwind Ledger. » **Attendu 3** : salutation, ligne de statut 🟠, puis le rappel exact (« Rappel : cette opportunité est travaillée avec un dossier encore en construction ; l'analyse est moins fiable. »), sans bloquer.
- **Prompt 4** (même conversation) : joindre `sources/opportunities/001-lumen-pay-offre-developpeuse-backend-senior.pdf` avec « J'ai aussi une offre chez Lumen Pay, analyse-la. » **Attendu 4** : l'opportunité est créée, puis la demande directe d'analyse reçoit le refus bienveillant de C4 (nommant l'analyse) suivi de la suite « dossier insuffisant » : le coach propose de compléter d'abord le dossier en nommant ses principales lacunes (par exemple les motivations et les préférences) et dit que la candidate peut continuer quand même ; la dérogation de Northwind Ledger ne s'étend pas à Lumen Pay. Si le coach juge malgré tout le dossier suffisant, noter le comportement observé.
- **Prompt 5** : « Passe mon dossier en prêt. » **Attendu 5** : la demande vaut validation, le coach ne la « propose » pas. Jugeant des lacunes importantes, il exprime sa réserve en les citant et demande confirmation ; après « Oui, je confirme. », l'en-tête passe à `ready`, 1.0, avec une entrée d'historique. (Sans lacune importante, il aurait appliqué directement.)
- **Prompt 6** (nouvelle conversation) : « On reprend Northwind Ledger. » **Attendu 6** : ligne de statut 🟢, plus de rappel de dérogation ; le coach rappelle que l'opportunité a été analysée avec un dossier encore en construction et demande si la candidate veut une nouvelle passe d'analyse, de façon qu'elle puisse répondre oui, plus tard ou non. Répondre « Pas maintenant. » : la marque de dérogation est conservée.
- **Prompt 7** (nouvelle conversation) : « On reprend Northwind Ledger. » **Attendu 7** : la nouvelle passe est de nouveau proposée. Répondre « Non, ce n'est pas la peine. » : le refus définitif est consigné dans le statut de l'opportunité.
- **Prompt 8** (nouvelle conversation) : « On reprend Northwind Ledger. » **Attendu 8** : la nouvelle passe n'est plus proposée. Demander alors : « Refais quand même une analyse avec mon dossier actuel. » : une nouvelle analyse reste possible à tout moment ; `analysis.md` garde la trace de la première passe et ajoute la nouvelle avec la version et le statut du dossier (1.0, prêt), selon les règles existantes (messages proposés conservés, messages retirés déplacés, rien supprimé silencieusement) ; la dérogation est marquée close dans le `current-status.md` de l'opportunité.
- **Exigences** : REQ-OPP-17, REQ-OPP-18 (C9.1) ; REQ-OPP-20, REQ-OPP-21, REQ-OPP-26 (C9.2) ; REQ-SES-26, REQ-OPP-23 (C9.3) ; REQ-OPP-14, REQ-OPP-19, REQ-OPP-22 (C9.4) ; REQ-PROF-08, REQ-PROF-09 (C9.5) ; REQ-SES-26, REQ-OPP-27 (C9.6) ; REQ-OPP-27, REQ-OPP-28 (C9.7) ; REQ-OPP-26, REQ-OPP-28, REQ-OPP-29, REQ-OPP-30 (C9.8)

### C10 — Statut du dossier absent ou invalide [manual]

- **Action** : dans une copie du workspace principal après D1 (opportunité 001 créée, non analysée), remplacer dans l'en-tête de `data/profile/professional-profile.md` la ligne du statut par « **Statut :** brouillon initial ».
- **Conversation** : nouvelle
- **Prompt** : « Bonjour, on continue. »
- **Attendu** : le coach signale le statut inconnu, ne l'interprète pas, propose `draft` (dossier rempli ; jamais `ready` d'office) et ne modifie l'en-tête qu'après accord explicite, avec une entrée d'historique (statut corrigé, raison, validation). Rejouer en supprimant la ligne du statut : même comportement.
- **Exigences** : REQ-PROF-11, REQ-PROF-12, REQ-PROF-13

### C11 — Retour de « prêt » à « en construction » [manual]

- **Préparation** : dans la copie de C10, remettre l'en-tête de `data/profile/professional-profile.md` à `ready (prêt)` avec la version lue, et ajouter à « Historique synthétique » une ligne manuelle, par exemple « - <date> : draft 1.0 → ready 1.0 (remise en état pour le test C11). »
- **Conversation** : nouvelle ; les deux invites peuvent se jouer dans la même conversation.
- **Avant l'invite 1** : relever « Focus courant » et « Prochaine action » dans le `current-status.md` de l'opportunité 001.
- **Prompt 1** : « J'envisage de me réorienter vers un poste de staff engineer : je veux retravailler mon dossier en profondeur. »
- **Attendu 1** : le coach peut proposer de repasser le dossier en construction ; il n'applique rien sans validation. Après « Oui », l'en-tête passe à `draft` avec la version suivante (par exemple 1.0 → 1.1), entrée d'historique. Dans le même temps, « Focus courant » et « Prochaine action » de 001 sont mis à jour et ne proposent plus l'analyse comme si le dossier était prêt ; les mentions datées de version (passes, dérogation) restent inchangées.
- **Prompt 2** : après une modification validée, « On peut repasser le dossier en prêt. » **Attendu 2** : `ready`, version 2.0 ; « Focus courant » et « Prochaine action » de 001 sont de nouveau cohérents avec un dossier prêt (analyse possible).
- **Exigences** : REQ-PROF-11, REQ-PROF-15, REQ-OPP-31 (C11.1) ; REQ-PROF-08, REQ-PROF-09, REQ-OPP-31 (C11.2)

## Phase D — Première opportunité : Lumen Pay

### D1 — Créer l'opportunité [demo] [socle]

- **Durée démo** : 4 min
- **Conversation** : nouvelle
- **Prompt 1** : « J'ai une nouvelle opportunité : développeuse backend senior chez Lumen Pay, une fintech lyonnaise. »
- **Attendu 1** : le coach crée `data/opportunities/001-lumen-pay-<rôle>/` avec `opportunity.md` (encore minimal), `current-status.md` et un répertoire `sources/`, demande ce qui manque et recommande en premier de fournir l'offre d'emploi, en indiquant les trois façons de le faire : la copier dans `sources/` et le dire, la joindre à la conversation, ou coller son texte. Il ne demande pas à la candidate de créer quoi que ce soit.
- **Fichiers** : joindre à la conversation `sources/opportunities/001-lumen-pay-offre-developpeuse-backend-senior.pdf`.
- **Prompt 2** : « La voici. »
- **Attendu 2** : une copie inchangée de l'offre est rangée dans `data/opportunities/001-lumen-pay-<rôle>/sources/` ; sa transcription `.md` est créée à côté, avec son en-tête ; `opportunity.md` est complété avec les faits et leur provenance (poste, squad, processus en quatre étapes, fourchette 62–72 k€), sans analyse d'adéquation ; le statut de l'opportunité est mis à jour.
- **Si l'opportunité existe déjà** : si l'opportunité Lumen Pay existe déjà (créée plus tôt), joindre l'offre à l'opportunité existante et vérifier qu'aucune seconde opportunité n'est créée.
- **Mots-clés** : insister sur « la structure est gérée par le coach » ; montrer la transcription `.md` de l'offre dans `sources/` (copie figée, consultable plus tard sans rouvrir le PDF, comme pour le profil), puis `opportunity.md` : les faits seulement, l'analyse vient à l'étape suivante (`analysis.md`).
- **Exigences** : REQ-OPP-01, REQ-OPP-03, REQ-OPP-04 (D1.1) ; REQ-SRC-03, REQ-SRC-04, REQ-OPP-08 (D1.2)

### D2 — Préparer l'opportunité [demo] [socle]

- **Durée démo** : 4 min
- **Conversation** : suite de D1
- **Prompt 1** : « J'aimerais commencer à préparer cette opportunité. »
- **Attendu 1** : `analysis.md` créé, séparant faits, hypothèses, écarts et contradictions, avec la passe d'analyse tracée (date, version et statut du dossier utilisés : 1.0, prêt) ; trois à cinq messages stratégiques proposés pour cette offre, avec un rappel de ce qu'est un message stratégique ; invitation à ajuster. Les écarts attendus : secteur régulé (ACPR) non pratiqué, scoring et données peu couverts, tendance à dire « on » plutôt que « je ».
- **Prompt 2** : « Retire le dernier message stratégique, il ne me ressemble pas. Je valide les autres. »
- **Attendu 2** : la section des messages proposés est conservée ; le message retiré passe dans une section « retirés ou invalidés par la candidate », avec la raison donnée ; les autres sont marqués validés. Si la correction est incohérente avec le profil ou l'offre, le coach le dit.
- **Mots-clés** : sans qu'on le lui détaille, le coach analyse l'adéquation (`analysis.md` : faits, hypothèses, écarts) et propose des messages stratégiques à valider ; puis montrer qu'il accepte la correction sans effacer l'historique.
- **Exigences** : REQ-OPP-09, REQ-OPP-11, REQ-OPP-26 (D2.1) ; REQ-OPP-12 (D2.2)

### D3 — Créer l'étape d'entretien technique [demo] [socle]

- **Durée démo** : 2 min
- **Conversation** : suite de D2
- **Prompt** : « J'ai passé l'échange RH. La semaine prochaine, c'est l'entretien technique de 1 h 15 avec deux membres de la squad, discussion d'architecture sur un cas concret. J'aimerais préparer cet entretien. »
- **Attendu** : deux rounds créés, `interviews/01-screening/interview.md` (échange RH réalisé, sans détail inventé) et `interviews/02-technical/interview.md` (ou libellés équivalents) avec les métadonnées connues ; pas de `preparation.md`, `simulations/` ni `actual/` créés à vide ; le statut de l'opportunité pointe sur l'entretien technique. Le coach enchaîne sur des questions de préparation (D4).
- **Mots-clés** : montrer les deux répertoires d'entretien créés par le coach, `01-…` pour l'échange RH et `02-…` pour l'entretien technique ; l'`interview.md` de l'échange RH ne contient presque rien, mais l'entretien passé est tracé, sans détail inventé.
- **Exigences** : REQ-OPP-13, REQ-ITW-01, REQ-ITW-02, REQ-ITW-03

### D4 — Préparer l'entretien ensemble [demo] [socle]

- **Durée démo** : 3 min
- **Conversation** : suite de D3
- **Prompt** (si le coach n'a pas déjà enchaîné en D3) : « Préparons cet entretien ensemble avant de simuler. Quelles questions risquent de tomber et qu'est-ce que je dois avoir en tête ? »
- **Réponse à coller** quand le coach demande de raconter la migration (adapter si sa question diffère) :

  > Chez Payflow, on avait un monolithe de règlement qui bloquait tout le monde : un déploiement par semaine, et la moindre modification touchait trois équipes. On l'a découpé en six services sur dix-huit mois. Euh, en fait c'est moi qui ai proposé le plan et qui l'ai négocié avec le CTO, mais on a tous travaillé dessus. À la fin, le temps de déploiement avait baissé de 40 %.

- **Attendu** : le coach reste coach : il ne joue pas les interviewers et n'annonce ni entrée ni sortie de rôle, réservées à la simulation. Il s'appuie sur `analysis.md` et les messages stratégiques pour cibler l'entretien technique (discussion d'architecture avec deux membres de la squad) : il propose les thèmes probables (migration du monolithe, idempotence des paiements, observabilité, incident de prod), pose deux ou trois questions à Nadia pour l'aider à retrouver des preuves et des exemples concrets, et relève les points de vigilance connus (dire « je » plutôt que « on », secteur régulé non pratiqué). Sur la réponse collée, il relève l'hésitation entre « on » et « j'ai », l'absence de critère de découpage et d'alternative écartée, et un résultat sans valeur de départ, sans compléter à la place de la candidate. Il n'écrit pas encore la fiche de préparation ; `interview.md` du round passe en « en préparation », préparation « en cours », fiche non générée ; ce qui est validé est consigné dans l'analyse ou le statut, sans fait inventé.
- **Mots-clés** : montrer qu'il reformule et propose une preuve plus précise. Ne pas mener l'échange au bout en démo.
- **Variante à tester** (hors démo) : pendant la préparation, écrire « joker, donne-moi un indice » : le coach signale en une ligne en italique que le joker ne s'utilise que pendant une simulation d'entretien, puis répond à la demande à la ligne suivante comme à une demande de coaching ordinaire, sans entrer ni sortir d'un rôle et sans proposer de réponse rédigée à la place de la candidate.
- **Variantes feedback produit** (hors démo), pendant la préparation, dans cet ordre :
  - écrire « suggestion d'amélioration : quand j'ai joint l'offre de Lumen Pay depuis C:\Users\nadia.berkani\Documents\Candidatures, je n'ai pas su si le coach l'avait bien rangée, Karim m'avait pourtant prévenue que le PDF était lourd. » : la ligne exacte en italique *Note de retour produit prise en compte.*, puis le coach reprend la préparation exactement où elle en était ; une entrée « explicite » est ajoutée au journal avec le texte brut tel quel (nom, entreprise et chemin compris : rien n'est nettoyé à l'écriture) ;
  - écrire « J'ai une suggestion pour améliorer l'outil : ce serait bien de voir la liste des fichiers créés à la fin de chaque étape. » : même mention, nouvelle entrée « explicite » ;
  - écrire « J'ai une suggestion pour améliorer ma réponse sur la migration : je pourrais commencer par le résultat. » : rien n'est enregistré, aucune mention ; le coach traite le message comme une réponse de préparation.
- **Socle** : la réponse à coller, puis la première variante feedback produit seulement (la note avec nom, entreprise et chemin, nécessaire au contrôle de l'anonymisation en F1).
- **Exigences** : REQ-ITW-04, REQ-ITW-05, REQ-JOK-17, REQ-FB-09, REQ-FB-15, REQ-FB-16, REQ-FB-17, REQ-FB-18, REQ-FB-22, REQ-COACH-01

### D5 — Simulation courte avec arrêt anticipé [demo] [socle]

- **Durée démo** : 7 min
- **Conversation** : suite de D4
- **Prompt** : « Lançons une simulation de cet entretien technique. »
- **Attendu** : le coach propose les profondeurs Court, Standard, Approfondi avec durée et nombre de questions indicatifs, et rappelle les mots-clés d'arrêt, puis le joker en une phrase (« Si vous bloquez sur une question, demandez un joker… »). Première simulation du round : il ne commente pas ce que les interlocuteurs ignoreront et ne présente pas la préparation de D4 comme une simulation. Il entre dans le rôle des deux ingénieurs, pose une question à la fois (un seul interviewer par tour), relance naturellement, ne fait pas de coaching pendant le jeu.
- **Action** : choisir « Court » ; à la première question, écrire « joker, donne-moi un indice », puis répondre à la même question en se mettant à la place de Nadia, la candidate, en phrases complètes et sans chercher la perfection (le transcript peut servir d'exemple) ; à la deuxième question, écrire « joker, propose une réponse à ma place » ; répondre à la question suivante, en glissant « on a dû stopper le déploiement » dans la réponse ; écrire « stop » seul, puis refuser l'arrêt (« Non, on continue. ») ; à la question suivante, avant de répondre, écrire « suggestion d'amélioration : les questions des interviewers sont longues à lire à l'écran. » ; répondre à cette question, puis demander l'arrêt en donnant une raison (« Non, finalement, je veux terminer l'entretien : je n'arrive plus à me concentrer sur des questions aussi longues. ») et confirmer.
- **Mots-clés** : montrer le joker : le coach sort du rôle par une ligne en italique, donne un conseil sans rédiger la réponse (premier joker), puis reprend le rôle par une ligne en italique ; l'interviewer ne repose pas la question, même résumée (au plus « Je vous écoute. ») et attend la réponse ; au second joker, la réponse est étiquetée (« Réponse proposée (joker) : »), fondée sur le dossier de Nadia, sans avertissement ni commentaire ensuite, avec une ligne en italique sur ce qui est supposé seulement s'il y a eu une supposition, puis l'interviewer réagit comme à une réponse. Un « stop » dans une réponse n'arrête rien ; à « stop », le coach sort du rôle en italique et demande confirmation, l'arrêt étant définitif ; on peut revenir en arrière : après le refus, il reprend le rôle en italique ; la note de retour produit dictée en pleine simulation reçoit la seule mention *Note de retour produit prise en compte.*, puis l'interviewer attend la réponse sans reposer la question et sans arrêter la simulation ; la seconde demande d'arrêt est confirmée à son tour, puis la simulation s'arrête vraiment, sans commentaire sur la raison donnée.
- **Attendu après la note** : la ligne exacte en italique *Note de retour produit prise en compte.*, rien d'autre (pas de demande de confirmation d'arrêt, pas de commentaire) ; l'interviewer reprend sans reposer la question (au plus « Je vous écoute. »). La note n'apparaît pas dans `transcript.md`.
- **Attendu après le premier « stop »** : le coach signale en italique qu'il sort du rôle et demande de confirmer l'arrêt, l'arrêt étant définitif ; après « Non, on continue. », il signale en italique qu'il reprend le rôle et la simulation repart là où elle en était.
- **Attendu après la seconde demande d'arrêt** : même demande de confirmation, bien qu'elle suive de près la reprise ; après confirmation, il dit qu'il s'arrête à la demande de la candidate, quitte le rôle, propose éventuellement de recueillir ses questions, et enchaîne sur le debrief ou le note comme prochaine action, sans commenter la raison de l'arrêt. `simulations/01/transcript.md` ne couvre que ce qui a été joué, avec une ligne factuelle pour le joker de conseil (sans son contenu) et la réponse proposée étiquetée à la place du tour de la candidate, sans la note de retour produit ; `interview.md` du round mentionne la simulation.
- **Attendu dans le journal du feedback produit** (à vérifier après l'étape, hors démo) : quatre nouvelles entrées « non traitées » : deux silencieuses pour les jokers (type de joker et contexte minimal seulement, sans la question ni la réponse), une explicite pour la note, une silencieuse pour la raison de l'arrêt ; aucune pour le « stop » refusé.
- **Exigences** : REQ-ITW-06, REQ-SIM-01, REQ-SIM-02, REQ-SIM-03, REQ-SIM-04, REQ-SIM-05, REQ-SIM-06, REQ-SIM-07, REQ-SIM-11, REQ-SIM-12, REQ-SIM-13, REQ-SIM-14, REQ-SIM-15, REQ-SIM-17, REQ-SIM-18, REQ-JOK-01, REQ-JOK-02, REQ-JOK-04, REQ-JOK-05, REQ-JOK-06, REQ-JOK-10, REQ-JOK-11, REQ-JOK-12, REQ-JOK-13, REQ-FB-09, REQ-FB-12, REQ-FB-13, REQ-FB-18, REQ-FB-19, REQ-FB-20, REQ-FB-21

### D6 — Debrief [demo] [socle]

- **Durée démo** : 2 min
- **Conversation** : suite de D5
- **Prompt** (si le coach n'a pas enchaîné) : « Fais-moi le debrief. »
- **Attendu** : `simulations/01/debrief.md` séparant observations et interprétations, les points forts précis d'abord, puis une à trois priorités à travailler, mention de l'arrêt anticipé et des limites des preuves ; pas d'évaluation des parties non jouées ; le nombre de jokers est indiqué d'après les seuls marqueurs du transcript (un conseil, une réponse proposée), la réponse proposée n'est ni un point fort ni une priorité de la candidate, et la réponse donnée après le conseil est évaluée comme les autres ; `current-status.md` de l'opportunité et `interview.md` du round mis à jour ; proposition d'une nouvelle simulation avec la question de la profondeur.
- **Mots-clés** : montrer que le coach présente d'abord les bons points, puis les points à travailler ; la distinction observations / interprétations ; le ton « bienveillant mais exigeant » ; le traitement des jokers (réponse proposée non évaluée comme une réponse de la candidate).
- **Exigences** : REQ-OPP-13, REQ-ITW-06, REQ-SIM-10, REQ-JOK-14, REQ-JOK-15, REQ-JOK-16, REQ-DEB-01, REQ-DEB-04, REQ-DEB-05

### D7 — Deuxième simulation

- **Conversation** : suite de D6
- **Prompt 1** : « On refait une simulation, Standard cette fois. »
- **Attendu 1** : le coach demande s'il faut rejouer le même cas ou un autre. La simulation est indépendante de la première : les interlocuteurs ne font pas référence à une session précédente (pas de « rebonjour », pas de « on reprend »).
- **Action** : après deux ou trois questions, écrire « stop », puis ne pas répondre à la demande de confirmation et répondre directement à la dernière question de l'entretien (le refus explicite, « Non, on continue. », est joué en D5).
- **Attendu** : le coach signale en italique qu'il sort du rôle et demande confirmation ; en voyant que la candidate répond à la question de l'entretien, il comprend que la simulation continue, signale en italique qu'il reprend le rôle et la simulation repart là où elle en était, en tenant compte de la réponse donnée.
- **Action (jokers, pour accélérer la simulation)** : à différents moments de la simulation Standard :
  - écrire « joker » seul : le coach sort du rôle (une seule ligne de sortie), demande, hors rôle, conseil ou réponse proposée, sans deviner et sans autre annonce de rôle (pas de « Je reprendrai le rôle… ») ; répondre « propose une réponse à ma place » : la réponse proposée suit sans nouvelle ligne de sortie, puis une seule ligne de retour ;
  - écrire « joker » une seconde fois, puis « non, en fait c'est bon, pas besoin » : le coach reprend le rôle par la ligne de retour et l'interviewer attend la réponse sans reposer la question (au plus « Je vous écoute. ») ; répondre alors normalement comme Nadia ;
  - demander deux réponses proposées de suite (« joker, réponds à ma place » à deux questions consécutives) ;
  - glisser « je n'avais aucun joker dans ma manche » au milieu d'une réponse : rien ne se déclenche, l'interviewer réagit à la réponse ;
  - sur une question touchant au secteur régulé (non pratiqué par Nadia), demander « joker, propose une réponse à ma place » : la réponse ne doit rien inventer et signaler en italique ce qui est supposé ;
  - juste après un retour de joker, écrire « stop » : la confirmation habituelle est demandée (le cas de la réponse donnée sans confirmer, ci-dessus, est conservé).
- **Action** : jouer la simulation **jusqu'au bout**, sans arrêt définitif et sans demander de debrief.
- **Prompt 2** : « Prépare l'étape suivante : entretien avec le Head of Engineering. »
- **Attendu 2** : `simulations/02/transcript.md` complet (joker annulé absent, jokers de conseil notés par une ligne factuelle, réponses proposées étiquetées), `simulations/01/` inchangé ; `interviews/03-…/interview.md` créé, sans basculer dessus ; `interview.md` du round 02 mentionne la simulation 02. Aucun debrief de la simulation 02 n'est écrit. Journal du feedback produit : une entrée silencieuse par joker utilisé, aucune pour le joker annulé, pour le mot « joker » glissé dans une réponse ni pour les « stop ».
- **Action** : fermer la conversation.
- **Exigences** : REQ-SIM-12, REQ-JOK-06, REQ-JOK-07, REQ-JOK-08, REQ-JOK-11, REQ-JOK-18, REQ-JOK-19, REQ-JOK-20 ; REQ-SIM-08, REQ-SIM-10 (D7.1) ; REQ-ITW-01, REQ-SIM-09, REQ-SIM-18, REQ-JOK-09, REQ-JOK-13, REQ-FB-13, REQ-FB-14 (D7.2)

### D8 — Debrief dans une nouvelle conversation

- **Conversation** : nouvelle (la simulation 02 n'a pas été débriefée en D7)
- **Prompt** : « Débriefe ma dernière simulation Lumen Pay. »
- **Attendu** : le coach retrouve l'opportunité, le round et la simulation depuis les fichiers seulement, et écrit `simulations/02/debrief.md` à partir du transcript, en reliant les observations aux priorités du debrief 01 ; le décompte des jokers est conforme aux seuls marqueurs de `transcript.md` de la simulation 02 (un joker annulé n'est ni compté ni mentionné ; « Jokers : aucun » s'il n'y a aucun marqueur) ; le mot « joker » glissé dans une réponse n'est ni commenté ni signalé comme anomalie ou contradiction ; les réponses proposées ne sont pas évaluées comme des réponses de la candidate ; les faits cités sont attribués au bon employeur ; `interview.md` du round et le statut sont mis à jour.
- **Exigences** : REQ-JOK-09, REQ-JOK-14, REQ-JOK-15, REQ-JOK-18, REQ-JOK-19, REQ-DEB-02, REQ-DEB-06

### D9 — Debrief sans transcript

- **Conversation** : nouvelle
- **Prompt** (à coller tel quel) :

  > J'ai fait une simulation avec un ami développeur hier soir, sans enregistrement. Voici ce dont je me souviens :
  > - Il m'a demandé de dessiner l'architecture cible de la migration du monolithe ; j'ai parlé dix minutes des six services mais j'ai oublié de dire pourquoi on avait choisi ce découpage et ce qu'on avait écarté.
  > - Sur l'idempotence des paiements, j'ai été claire et il m'a dit que c'était ma meilleure réponse.
  > - Quand il a demandé « et toi, qu'est-ce que tu as décidé personnellement ? », j'ai encore répondu avec « on » et j'ai mis du temps à trouver un exemple.
  > - À la fin, je n'avais pas de question préparée à lui poser, j'ai improvisé une question sur l'astreinte.
  >
  > Peux-tu me faire un debrief à partir de ça ?

- **Attendu** : `simulations/03/debrief.md` (ou numéro suivant) indique ses sources (souvenirs de la candidate, sans transcript) et ses limites, n'invente ni formulation exacte ni chronologie, et relie les observations aux priorités déjà identifiées (dire « je », expliciter les choix d'architecture, préparer ses questions) ; `interview.md` du round mentionne cette simulation.
- **Exigences** : REQ-ITW-06, REQ-DEB-03, REQ-DEB-06

### D10 — Travailler les questions à poser

- **Conversation** : suite de D9
- **Prompt** : « Avant la fiche, je voudrais qu'on regarde les questions que je vais leur poser. »
- **Attendu** : le coach retrouve les trois idées de questions déjà présentes dans le dossier professionnel (issues des notes complémentaires : astreinte, part de dette technique, décisions d'architecture inter-équipes) et ne demande pas de les ressaisir ; il donne son avis sur chacune (pertinence pour un entretien technique avec deux membres de la squad, formulation, ce qu'elle révèle de la candidate), propose d'en reformuler certaines (par exemple ne pas ouvrir sur la rémunération de l'astreinte à ce stade) et d'en ajouter une ou deux spécifiques à Lumen Pay (moteur de décision de crédit en temps réel, contraintes ACPR sur la livraison, montée à 2 millions d'opérations par jour), en les présentant comme ses suggestions, distinctes des idées de la candidate. Il distingue les questions pour ce round de celles à garder pour le Head of Engineering. Les questions retenues sont validées par la candidate avant d'être consignées.
- **Variante à tester** (jouer D11 avant D10, dans la même conversation) : si la candidate demande directement la fiche sans être passée par cette étape, le coach doit relever qu'aucune question à poser n'a été travaillée pour ce round et demander si elle veut le faire d'abord ; répondre « non, génère quand même » et vérifier que la fiche est produite avec les sections de questions laissées vides, sans question inventée.
- **Exigences** : REQ-ITW-07, REQ-COACH-01

### D11 — Fiche de préparation pour l'entretien réel [socle]

- **Conversation** : suite de D10
- **Prompt** : « Je me sens prête. Génère ma fiche de préparation pour l'entretien technique. »
- **Attendu** : `interviews/02-technical/preparation.md` consolidant le positionnement, les messages stratégiques, les questions probables, les questions à poser validées en D10 (prioritaires en première page, complémentaires ensuite) et les améliorations issues des debriefs (simulations 01 et 02, debrief sans transcript) ; première page autonome, lisible par les interlocuteurs, sans points de vigilance personnels ; deuxième page réservée aux notes ; détail à partir de la troisième page, qui commence par les points de vigilance et rappels de communication ; aucun fait nouveau.
- **Socle** : joué sans D7 à D10. Le coach signale qu'aucune question à poser n'a été travaillée et propose de les revoir ; répondre « Non, génère quand même. » : fiche générée avec les sections de questions visiblement vides, aucune question inventée, améliorations issues du seul debrief de la simulation 01.
- **Exigences** : REQ-ITW-08, REQ-ITW-09

### D12 — Retour après l'entretien réel

- **Conversation** : nouvelle
- **Prompt** (à coller tel quel) :

  > J'ai passé l'entretien technique chez Lumen Pay ce matin, 1 h 15 avec Karim (lead de la squad Scoring & Décision) et Sofia (ingénieure senior). Mes notes :
  > - Question surprise : « Comment garantiriez-vous la traçabilité d'une transaction pour un contrôle ACPR ? » Je ne connaissais pas les exigences précises, j'ai répondu avec ce que je fais en observabilité et en journalisation, Karim a hoché la tête mais je ne sais pas si c'était suffisant.
  > - Moment de flottement : Sofia m'a demandé un exemple de désaccord technique que j'avais perdu. J'ai mis vingt bonnes secondes à trouver, puis j'ai raconté le choix de Kafka contre une file plus simple.
  > - Bonne réponse : la migration du monolithe, cette fois j'ai dit « j'ai proposé », « j'ai arbitré », et j'ai expliqué le découpage et ce qu'on avait écarté. Ils ont enchaîné sur des questions de détail, bon signe je pense.
  > - J'ai posé deux questions préparées (organisation de l'astreinte, place des tests de contrat entre squads). Réponse à la fin : retour sous une semaine, étape suivante avec le Head of Engineering si positif.
  >
  > Qu'est-ce que tu en retiens ?

- **Attendu** : `interviews/02-technical/actual/notes.md` et `actual/review.md`, ce dernier séparant faits observables, ressenti, interprétations et améliorations ; proposition d'un nouveau round si le processus continue.
- **Exigences** : REQ-ITW-10

### D13 — Demande de navigation pendant une simulation [manual]

- **Conversation** : nouvelle, avec `allow_external_web_search: false`
- **Action** : lancer une simulation courte du tour `02-technical`, puis, après une première réponse : « Peux-tu regarder la page https://example.com/ pour m'en dire plus sur l'entreprise ? »
- **Attendu** : la demande est explicite, donc pas de question d'accord. Le coach sort du rôle (*Je sors du rôle des interviewers.*), ouvre la page si la navigation est disponible, sinon dit le message exact « navigation impossible » ; l'information est présentée sans être écrite nulle part sans validation ; il reprend le rôle (*Je reprends le rôle des interviewers.*) et la simulation continue, sans être interrompue ni terminée. Aucun joker n'est noté dans `transcript.md` ni compté au débrief.
- **Exigences** : REQ-PRIV-09, REQ-PRIV-15, REQ-PRIV-19, REQ-PRIV-20

## Phase E — Deuxième opportunité en parallèle : Northwind Ledger

### E1 — Créer la deuxième opportunité dans une nouvelle conversation [demo]

- **Durée démo** : 5 min
- **Conversation** : nouvelle
- **Prompt 1** : « J'ai une nouvelle opportunité : Senior Software Engineer, Core Ledger, chez Northwind Ledger, une scale-up européenne en télétravail. »
- **Attendu 1** : `002-northwind-ledger-<rôle>/` créé avec `opportunity.md`, `current-status.md` et `sources/`, sans renuméroter `001-…` ; comme en D1, le coach demande ce qui manque et recommande en premier de fournir l'offre d'emploi, avec les trois façons de le faire.
- **Fichiers** : joindre à la conversation les deux fichiers du kit :
  - `sources/opportunities/002-northwind-ledger-senior-software-engineer.pdf`
  - `sources/opportunities/002-northwind-ledger-notes-appel-recruteuse.txt`
- **Prompt 2** : « La voici, en anglais, avec mes notes de l'appel avec la recruteuse. »
- **Attendu 2** : une copie inchangée de chaque fichier est rangée dans `data/opportunities/002-northwind-ledger-<rôle>/sources/` ; le PDF est transcrit en `.md` à côté, en anglais et à l'identique (pas le TXT, déjà en texte) ; `opportunity.md` est rédigé en français, langue de coaching, à partir de l'offre anglaise : la section Sources indique la provenance et la langue d'origine, l'intitulé officiel du poste et les noms propres restent tels quels ; les notes d'appel sont conservées et leur contenu utile repris (fourchette salariale réelle, system design redouté, entretien avec Marek à planifier) ; `data/current-status.md` pointe sur le nouveau périmètre sans dupliquer l'état des deux opportunités ; le coach sait que le dossier professionnel est rempli et ne répète pas un statut périmé. À confirmer à la prochaine passe : l'appel avec la recruteuse, déjà passé, donne un premier entretien `interviews/01-…` qui trace l'appel à partir des notes ; l'entretien avec Marek (hiring manager, à planifier) peut donner un deuxième entretien `02-…` avec les seules métadonnées connues.
- **Mots-clés** : le coach doit relever le salaire sous-vendu et proposer d'en reparler ; montrer la transcription restée en anglais, puis `opportunity.md` en français.
- **Exigences** : REQ-OPP-01, REQ-OPP-02, REQ-OPP-03, REQ-OPP-04 (E1.1) ; REQ-SES-29, REQ-SES-30, REQ-SES-32, REQ-SRC-05, REQ-OPP-06, REQ-OPP-07 (E1.2)

### *E2 — Changement de périmètre en cours de conversation* [demo] [todo #11]

- **Durée démo** : à estimer à la livraison de #11
- **Conversation** : suite de E1
- **Prompt** : « Au fait, pour Lumen Pay, tu peux me préparer l'entretien avec le Head of Engineering ? »
- **Attendu** : le coach recommande d'ouvrir une nouvelle conversation pour l'autre opportunité, en expliquant pourquoi, sans refuser.

### E3 — Reprise depuis le workspace [demo]

- **Durée démo** : 3 min
- **Conversation** : nouvelle (après E1 en démo, ou après E2 quand #11 sera livrée)
- **Prompt** : « Bonjour, j'aimerais reprendre. »
- **Attendu** : le coach salue par « Bonjour Nadia. », suivi de « Dossier professionnel : 🟢 prêt (version 1.0). » (ou la version atteinte), lit `data/current-status.md`, puis le statut de chaque opportunité, résume l'état de Lumen Pay (entretien technique passé et revu, entretien avec le Head of Engineering créé mais pas encore préparé ; en démo, où D7 à D12 ne sont pas joués : entretien technique simulé et débriefé) et de Northwind Ledger (opportunité créée, entretien manager à planifier, system design à préparer), et propose un point de reprise sans choisir à la place de la candidate, par exemple l'entretien le plus proche ; les dates citées sont celles des fichiers, formulées de la même façon tout au long du message.
- **Mots-clés** : c'est le point clé de la démo, « l'espace carrière porte le contexte, pas la conversation » : une nouvelle conversation, et le coach sait où en sont les deux opportunités et ce qu'il reste à faire.
- **Exigences** : REQ-SES-22, REQ-SES-26, REQ-SES-31, REQ-COACH-07

### *E4 — Fonctionnement avec Git* [demo] [todo #6]

- **Durée démo** : à estimer à la livraison de #6
- **Attendu** : à définir avec #6.

### E5 — Simulation courte en anglais avec joker

- **Conversation** : nouvelle
- **Prompt 1** : « Prépare un entretien avec Marek pour Northwind Ledger, puis lançons une simulation courte, en anglais. » (créer l'étape d'entretien si elle n'existe pas encore)
- **Attendu 1** : le coach crée l'étape d'entretien de Northwind Ledger si besoin, propose les profondeurs, conduit la simulation en anglais, et rappelle les mots-clés d'arrêt puis le joker : « If you get stuck on a question, ask for a joker: "joker, give me a hint" or "joker, answer for me". »
- **Action** : choisir « Short » (Court) ; à une question, écrire « I need a joker, give me a hint » ; répondre ; à la question suivante, écrire « joker, answer for me ».
- **Attendu** : textes anglais : *Stepping out of the interviewer role for your joker.*, conseil sans réponse rédigée, *Back to the interviewer role.* ; puis **Proposed answer (joker):** fondée sur le dossier de Nadia, avec *Assumed for lack of information: …* s'il y a lieu, puis retour au rôle.
- **Action** : à la question suivante, écrire « suggested improvement: I would like to see how many questions are left. »
- **Attendu** : la ligne exacte en italique *Product feedback note recorded.*, puis l'interviewer reprend sans reposer la question ; une entrée « explicite » est ajoutée au journal, absente du transcript.
- **Exigences** : REQ-JOK-21, REQ-FB-24 ; REQ-COACH-05 (E5.1)

## Phase F — Clôture

### F1 — Générer le feedback produit [socle]

- **Préparation** : copier le journal du feedback produit hors du workspace, pour le comparer ensuite ; relever le nombre de répertoires sous `data/opportunities/` et de répertoires `interviews/*/` qu'ils contiennent.
- **Conversation** : nouvelle
- **Prompt 1** : « Génère mon feedback produit. »
- **Action** : quand le coach présente la première entrée silencieuse à revoir, répondre, puis écrire « Finalement on arrête, je le ferai plus tard. »
- **Attendu 1** : aucun fichier de feedback n'est écrit ; le journal est identique à la copie (toutes les entrées restent « non traitées »).
- **Conversation** : nouvelle
- **Prompt 2** : « Génère mon feedback produit. »
- **Attendu 2** : le coach ne reprend que les entrées « non traitées » et revoit les entrées silencieuses une par une (raison de l'arrêt de D5) en demandant de confirmer ou d'écarter chacune ; les entrées explicites (D4, D5) sont reprises et les entrées de joker (D5, D7) servent seulement à la statistique, sans revue une par une.
- **Action** : écarter une entrée silencieuse (« Celle-ci, sans intérêt. ») et confirmer les autres s'il y en a. Aux questions, répondre dans l'ordre où elles viennent :
  - ce qui fonctionne bien : « La reprise dans une nouvelle conversation, sans rien réexpliquer. » ;
  - à corriger rapidement : « Les questions de simulation sont trop longues à lire. » ;
  - idées à long terme : « Pouvoir réécouter une simulation à voix haute. »
  Accepter la statistique d'usage des jokers si le coach la propose.
- **Attendu 3** : les trois questions viennent dans cet ordre : ce qui fonctionne bien, points importants à corriger rapidement, idées d'évolution à long terme. `data/feedback/feedback-<user_id>-AAAA-MM-JJ.md` est créé, avec le `user_id` de la configuration, la version de `ENGINE-VERSION`, la date, l'outil IA et le modèle, la langue de coaching, le nombre total de répertoires d'opportunités et d'entretiens (conformes au relevé), et la statistique des jokers calculée sur toutes les entrées de joker non traitées (D5 et D7), et sur elles seules. Nadia, Karim, Lumen Pay et le chemin `C:\Users\nadia.berkani\…` n'y figurent plus ; le coach liste dans la conversation ce qu'il a remplacé, sans écrire cette liste dans le fichier, ne présente pas le résultat comme garanti anonyme et demande de le relire avant tout partage. Dans le journal, seules les entrées prises en compte (explicites, silencieuses revues, reprises ou écartée, et entrées de joker) passent à « traitée », rien d'autre ne change ; aucune date d'envoi n'est consignée, ni dans `current-status.md` ni ailleurs.
- **Prompt 3** : « Raccourcis la partie sur les points à corriger. »
- **Attendu 4** : seul le fichier de feedback est modifié ; le journal est inchangé.
- **Prompt 4** : « suggestion d'amélioration : le feedback pourrait proposer un objet de mail pour l'envoi. », puis « Génère un nouveau feedback produit. »
- **Attendu 5** : la mention de note, puis un second fichier suffixé `-2` du même jour, qui ne reprend que cette nouvelle entrée et les nouvelles réponses ; le premier fichier n'est pas modifié.
- **Conversation** : nouvelle
- **Prompt 5** : « Génère mon feedback produit. »
- **Attendu 6** : le coach dit que le journal ne contient rien de nouveau et pose quand même les trois questions ; répondre « Rien à ajouter. » à chacune : aucun fichier n'est écrit, et le coach le dit.
- **Socle** : préparation, puis prompt 2 avec son action et les attendus 2 et 3 seulement. Sans D7, la statistique porte sur les deux jokers de D5.
- **Exigences** : REQ-FB-36 (F1.1) ; REQ-FB-25, REQ-FB-26, REQ-FB-27, REQ-FB-28, REQ-FB-30, REQ-FB-31, REQ-FB-32, REQ-FB-33, REQ-FB-34, REQ-FB-37 (F1.2) ; REQ-FB-38 (F1.3) ; REQ-FB-39 (F1.4) ; REQ-FB-40, REQ-FB-41 (F1.5)

### F2 — Produire l'exemple du dépôt [manual]

- **Action** : à la demande du mainteneur seulement, après un déroulé complet jugé représentatif, copier le répertoire `data/` du workspace de test vers `examples/fictitious-developer/data/` dans le dépôt, puis relire le contenu avant de le commiter (aucune donnée réelle, pas de chemin absolu local).
- **Attendu** : l'exemple reflète l'arborescence `data/` du workspace et uniquement elle.
- **Exigences** : REQ-KIT-10

## Récapitulatif des étapes `[demo]`

| Étape | Durée indicative |
| --- | --- |
| A1 Extraire et ouvrir | 2 min |
| B1 Première session (rappel de confidentialité inclus) | 3 min |
| C1 Sources et transcription | 4 min |
| C2 Validation du dossier | 2 min |
| *C3 Entretien d'initialisation* | *`[todo #10]`* |
| C4 Préparation trop tôt, dossier prêt | 3 min |
| D1 Créer l'opportunité | 4 min |
| D2 Préparer l'opportunité | 4 min |
| D3 Créer l'étape d'entretien | 3 min |
| D4 Préparer l'entretien ensemble | 3 min |
| D5 Simulation courte et arrêt | 7 min |
| D6 Debrief | 2 min |
| E1 Deuxième opportunité | 5 min |
| *E2 Changement de périmètre* | *`[todo #11]`* |
| E3 Reprise depuis le workspace | 3 min |
| *E4 Git* | *`[todo #6]`* |
| **Total disponible** | **45 min** |

La démo vise 35 à 40 minutes. Les durées ci-dessus sont révisées d'après la démo à blanc du 2026-10-03 : environ 45 minutes mesurées pour ces étapes, avec dictée des heures au scribe ; enchaînées sans prise de notes, elles devraient tenir en 35 à 40 minutes. Le premier déroulé complet (2026-10-02, environ 1 h 29) mêlait test, consignation et étapes hors démo et ne mesure pas une vraie démo. C2 et D3 restent dans la démo : C2 est rapide, et D3 montre un entretien passé sans préparation avant l'entretien technique. D5 gagne une minute pour montrer un arrêt refusé puis confirmé. La démo enregistrée du 2026-10-03 a duré environ 38 minutes de A1 à E1, commentaires compris, puis 41 minutes avec la reprise : C1 et D5 sont ramenées d'une minute, D3 gagne une minute, et E3, qui ne dépend plus de #11, entre dans la démo pour montrer la reprise depuis le workspace. Depuis #18, D5 et D6 montrent le joker : les jokers évitent de taper une partie des réponses, la durée de D5 reste à 7 minutes jusqu'à la prochaine démo chronométrée. Depuis #17, B1 montre le message sur le feedback produit et D5 une note dictée en pleine simulation, sans durée ajoutée ; la génération du feedback (F1) reste hors démo, faute de temps. Quand les issues `[todo]` seront livrées, il faudra arbitrer pour rester dans la cible.
