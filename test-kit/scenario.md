# Scénario maître

Liste ordonnée des étapes à jouer avec le coach sur les données fictives du kit. Il sert à trois usages : dérouler le plan de test (`docs/test-plan.md`) sans donnée personnelle, faire la démo du toolkit, et plus tard servir de base à des tests automatiques.

Le build extrait de ce fichier le **script de démo** : il ne garde que les étapes taguées `[demo]`, réduites aux champs utiles au présentateur (durée, conversation, fichiers, actions, prompts, mots-clés présentés comme « À montrer »), et le tableau récapitulatif. Les attendus et les renvois au plan de test restent dans ce fichier. Les autres étapes ne servent qu'aux tests. Pour qu'une consigne figure dans le script de démo, la mettre dans **Action** ou **Mots-clés**, jamais seulement dans **Attendu**.

## Mode d'emploi

- Jouer le scénario dans un workspace **extrait du ZIP, hors du dépôt**, jamais dans `workspace/` ni dans un workspace personnel.
- Les fichiers à déposer viennent du ZIP du kit (`sources/profile/`, `sources/opportunities/`). Les chemins de destination sont relatifs à la racine du workspace extrait.
- Dans la conversation, parler **au nom de Nadia Berkani**, la candidate fictive. Ses motivations, contraintes et points faibles sont dans `sources/profile/notes-complementaires-carriere.md` : s'en inspirer pour répondre de façon crédible pendant les simulations.
- Chaque étape indique le résultat attendu et l'item de `docs/test-plan.md` qu'elle couvre. Consigner le résultat réel dans `docs/test-log.md` et dans un fichier de session de `docs/test-history/`, jamais par déduction.
- Le champ **Conversation** de chaque étape dit s'il faut ouvrir une nouvelle conversation ou rester dans celle de l'étape précédente (« suite de D3 »). « Nouvelle » signifie fermer la conversation en cours et en ouvrir une autre dans le même workspace, pour vérifier que le contexte vient des fichiers et non de l'historique. Les étapes `[manual]` sans prompt n'en ont pas.

### Tags

| Tag | Sens |
| --- | --- |
| `[demo]` | Étape retenue pour la démo de 35 à 40 minutes. La durée indicative est notée dans l'étape. |
| `[todo #N]` | Étape qui dépend de l'issue #N, non livrée. À jouer et à compléter quand l'issue sera livrée. Son titre est en italique pour être repéré facilement. Le script de démo ne la reprend pas : la démo ne montre que ce qui est livré. |
| `[manual]` | Étape hors conversation : manipulation de fichiers ou de l'outil. |

## Phase A — Préparation

### A1 — Extraire et ouvrir le workspace [demo] [manual]

- **Durée démo** : 2 min
- **Fichiers** : `career-ai-workspace-v<version>.zip` → un répertoire hors du dépôt, par exemple `C:\Temp\career-ai-workspace-demo-26-10-03\`.
- **Action** : extraire le ZIP hors du dépôt, puis renommer le répertoire extrait avec un suffixe `-demo` ou `-test` suivi de la date du jour au format `AA-MM-JJ` (par exemple `career-ai-workspace-demo-26-10-03`), jamais le nom de base : il ne doit pas être confondu avec un workspace personnel ou de bêta-test ouvert ailleurs, et la date confirme dans l'outil IA qu'on travaille bien dans le workspace du jour. Garder les workspaces des passes précédentes dans `C:\Temp\` plutôt que les supprimer : on peut ainsi comparer les résultats de plusieurs tests ou démos. Ouvrir ce répertoire comme projet dans VS Code avec Claude Code (ou l'outil IA équivalent). Montrer l'arborescence : moteur à la racine, `data/` ne contenant que des `README.md`.
- **Attendu** : le ZIP contient un seul répertoire racine `career-ai-workspace/` ; `data/` ne contient aucun fichier de travail.
- **Plan de test** : Workspace — « Extract the ZIP outside the repository », « Open it as a new VS Code/Claude Code project » ; Build — « Confirm the ZIP tree matches `docs/architecture.md#workspace-tree` ».

## Phase B — Initialisation du workspace

### B1 — Première session [demo]

- **Durée démo** : 2 min
- **Conversation** : nouvelle (la première du workspace)
- **Prompt** : « Bonjour, on peut commencer la première session. »
- **Attendu** : le coach crée les quatre fichiers obligatoires (`data/config/workspace.yaml`, `data/current-status.md`, `data/profile/professional-profile.md`, `data/profile/sources/external-references.md`) depuis les modèles, le dit en une phrase par fichier, et ne remplit pas le dossier professionnel. `data/feedback/pilot-feedback.md` n'est pas créé.
- **Mots-clés** : faire remarquer que le dossier professionnel est un squelette vide et que rien n'y sera écrit sans validation.
- **Plan de test** : Workspace — « On the first session in the extracted workspace, confirm the coach creates the four missing mandatory files… », « Confirm the created profile is an empty skeleton… », « Confirm `data/feedback/pilot-feedback.md` is created only on request ».

### B2 — Deuxième session sans changement

- **Conversation** : nouvelle
- **Prompt** : « Bonjour, on reprend. »
- **Attendu** : rien n'est créé ni réécrit, le coach ne signale aucune création.
- **Plan de test** : Workspace — « Confirm a second session creates nothing and overwrites nothing… ».

### B3 — Fichier supprimé, fichier personnalisé [manual]

- **Action** : supprimer `data/profile/sources/external-references.md` ; ajouter un commentaire personnel dans `data/current-status.md`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : seul le fichier supprimé est recréé ; le fichier personnalisé reste intact.
- **Plan de test** : Workspace — « …a file deleted by the user is recreated alone, and an existing file with custom content is left untouched ».

### B4 — Clé de configuration manquante [manual]

- **Action** : retirer la clé `allow_external_web_search` de `data/config/workspace.yaml`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : la clé est ajoutée à sa place avec sa valeur par défaut, le coach dit quelle clé et quelle valeur ont été ajoutées, le reste du fichier est inchangé. Une session suivante n'ajoute rien.
- **Plan de test** : Workspace — « Remove a key from `data/config/workspace.yaml`… ».

### B5 — Valeur de configuration invalide [manual]

- **Action** : mettre `allow_external_web_search: peut-être`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour. »
- **Attendu** : le fichier n'est pas réécrit ; le coach indique la clé, la valeur trouvée et la valeur par défaut utilisée pour la session, et laisse la correction à la candidate. Remettre `false` ensuite.
- **Plan de test** : Workspace — « Give a key an invalid value… ».

### B6 — Langue du dossier [manual]

- **Action** : vérifier dans `data/config/workspace.yaml` que `language.profile` et `language.coaching` valent `"fr-FR"` et que `language.deliverables` contient `"fr-FR"` (les modifier sinon).
- **Attendu** : les valeurs sont celles du modèle ; aucune modification n'est nécessaire sur un workspace neuf.
- **Plan de test** : Workspace — « Set the profile language in `data/config/workspace.yaml` ».

## Phase C — Sources et dossier professionnel

### C1 — Déposer les sources et les faire transcrire [demo]

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
- **Plan de test** : Workspace — « Ask to initialize the profile without providing sources… », « Add a synthetic PDF CV… », « Add a synthetic LinkedIn PDF export… », « Confirm the coach then proposes profile updates from the new source and applies none before validation », « Add sample authorized sources and initialize the profile ».

### C2 — Valider le dossier professionnel initial [demo]

- **Durée démo** : 2 min
- **Conversation** : suite de C1
- **Prompt** : « D'accord pour l'ensemble, sauf : ne mets pas mon salaire actuel dans le dossier. Applique. »
- **Attendu** : `professional-profile.md` est rempli selon la proposition amendée, la version et la date sont mises à jour, le salaire n'y figure pas, les durées et chiffres sont ceux des sources (sept ans d'expérience), `data/current-status.md` note où on en est.
- **Mots-clés** : ouvrir `professional-profile.md` : ce n'est plus un squelette vide, on y retrouve les informations validées par la candidate, sans le salaire actuel.
- **Plan de test** : Workspace — « Confirm profile changes are proposed before application ».

### *C3 — Entretien d'initialisation du dossier* [demo] [todo #10]

- **Durée démo** : à estimer à la livraison de #10
- **Prompt** : à définir avec #10.
- **Attendu** : le coach conduit un premier entretien pour compléter les sections du dossier que les sources ne couvrent pas (motivations, préférences, messages récurrents), puis propose les ajouts.

### *C4 — Rappel tant que le dossier n'est pas prêt, opportunité trop tôt* [demo] [todo #9]

- **Durée démo** : à estimer à la livraison de #9
- **Prompt** : à définir avec #9 ; inclure une tentative d'ajouter une opportunité avant que le dossier soit marqué prêt.
- **Attendu** : rappel du statut du dossier en début de session, suggestion de le finaliser avant d'ouvrir une opportunité, sans bloquer.

### C5 — Réimport après non-écrasement

- **Conversation** : nouvelle
- **Prompt** : « Peux-tu revérifier mes sources ? »
- **Attendu** : aucune transcription existante n'est réécrite ; aucune entrée dupliquée dans `external-references.md`.
- **Plan de test** : Workspace — « …does not overwrite an existing transcription », « …does not duplicate the entry on a second pass ».

### C6 — Source très volumineuse

- **Fichiers** : `sources/profile/livret-formation-architecture-systemes-distribues.pdf` (49 pages) → `data/profile/sources/certifications/`.
- **Conversation** : nouvelle
- **Prompt** : « J'ai ajouté une nouvelle source dans `data/profile/sources/`. » (ne pas annoncer la taille : c'est au coach de la constater)
- **Attendu** : le coach trouve le nouveau fichier, en indique la taille et demande confirmation avant de transcrire, en proposant de ne transcrire que les parties utiles (ici l'attestation de la première page : formation de 70 h en 2023, projet final 16/20, appréciation du formateur). Il ne transcrit rien avant l'accord. Une fois la transcription faite, il propose d'ajouter la formation au dossier, sans l'écrire avant validation. Le seuil n'est pas chiffré (D-011) : noter le comportement observé.
- **Plan de test** : Workspace — « Add a very long synthetic source… ».

### C7 — Dossier professionnel supprimé, statut conservé [manual]

- **Action** : supprimer `data/profile/professional-profile.md`, garder les sources et `data/current-status.md`.
- **Conversation** : nouvelle
- **Prompt** : « Bonjour, on continue. »
- **Attendu** : le coach signale l'incohérence, évoque une perte de fichier possible, **ne recrée pas le squelette** et ne réécrit pas le dossier avant décision ; il propose de reconstruire depuis les sources, de restaurer une copie ou de vérifier une synchronisation. Demander alors : « Réimporte tout et reconstruis le dossier. » Les sources sont retranscrites et le dossier reconstruit via le workflow validé.
- **Plan de test** : Workspace — « Delete `data/profile/professional-profile.md` but keep the sources… ».

## Phase D — Première opportunité : Lumen Pay

### D1 — Créer l'opportunité [demo]

- **Durée démo** : 4 min
- **Conversation** : nouvelle
- **Prompt 1** : « J'ai une nouvelle opportunité : développeuse backend senior chez Lumen Pay, une fintech lyonnaise. »
- **Attendu 1** : le coach crée `data/opportunities/001-lumen-pay-<rôle>/` avec `opportunity.md` (encore minimal), `current-status.md` et un répertoire `sources/`, demande ce qui manque et recommande en premier de fournir l'offre d'emploi, en indiquant les trois façons de le faire : la copier dans `sources/` et le dire, la joindre à la conversation, ou coller son texte. Il ne demande pas à la candidate de créer quoi que ce soit.
- **Fichiers** : joindre à la conversation `sources/opportunities/001-lumen-pay-offre-developpeuse-backend-senior.pdf`.
- **Prompt 2** : « La voici. »
- **Attendu 2** : une copie inchangée de l'offre est rangée dans `data/opportunities/001-lumen-pay-<rôle>/sources/` ; sa transcription `.md` est créée à côté, avec son en-tête ; `opportunity.md` est complété avec les faits et leur provenance (poste, squad, processus en quatre étapes, fourchette 62–72 k€), sans analyse d'adéquation ; le statut de l'opportunité est mis à jour.
- **Mots-clés** : insister sur « la structure est gérée par le coach » ; montrer la transcription `.md` de l'offre dans `sources/` (copie figée, consultable plus tard sans rouvrir le PDF, comme pour le profil), puis `opportunity.md` : les faits seulement, l'analyse vient à l'étape suivante (`analysis.md`).
- **Plan de test** : Workspace — « Give the coach source material for two opportunities without creating their directories manually » (première moitié), « Confirm each opportunity has a canonical `opportunity.md` and `current-status.md`, and that retained original files under `sources/` remain unchanged ».

### D2 — Préparer l'opportunité [demo]

- **Durée démo** : 4 min
- **Conversation** : suite de D1
- **Prompt 1** : « J'aimerais commencer à préparer cette opportunité. »
- **Attendu 1** : `analysis.md` créé, séparant faits, hypothèses, écarts et contradictions ; trois à cinq messages stratégiques proposés pour cette offre, avec un rappel de ce qu'est un message stratégique ; invitation à ajuster. Les écarts attendus : secteur régulé (ACPR) non pratiqué, scoring et données peu couverts, tendance à dire « on » plutôt que « je ».
- **Prompt 2** : « Retire le dernier message stratégique, il ne me ressemble pas. Je valide les autres. »
- **Attendu 2** : la section des messages proposés est conservée ; le message retiré passe dans une section « retirés ou invalidés par la candidate », avec la raison donnée ; les autres sont marqués validés. Si la correction est incohérente avec le profil ou l'offre, le coach le dit.
- **Mots-clés** : sans qu'on le lui détaille, le coach analyse l'adéquation (`analysis.md` : faits, hypothèses, écarts) et propose des messages stratégiques à valider ; puis montrer qu'il accepte la correction sans effacer l'historique.
- **Plan de test** : Workspace — « Confirm derived analysis is separate from the canonical source representation and uncertain information is explicit » ; Standalone — « Confirm the coach proposes strategic messages and allows adjustment ».

### D3 — Créer l'étape d'entretien technique [demo]

- **Durée démo** : 2 min
- **Conversation** : suite de D2
- **Prompt** : « J'ai passé l'échange RH. La semaine prochaine, c'est l'entretien technique de 1 h 15 avec deux membres de la squad, discussion d'architecture sur un cas concret. J'aimerais préparer cet entretien. »
- **Attendu** : deux rounds créés, `interviews/01-screening/interview.md` (échange RH réalisé, sans détail inventé) et `interviews/02-technical/interview.md` (ou libellés équivalents) avec les métadonnées connues ; pas de `preparation.md`, `simulations/` ni `actual/` créés à vide ; le statut de l'opportunité pointe sur l'entretien technique. Le coach enchaîne sur des questions de préparation (D4).
- **Mots-clés** : montrer les deux répertoires d'entretien créés par le coach, `01-…` pour l'échange RH et `02-…` pour l'entretien technique ; l'`interview.md` de l'échange RH ne contient presque rien, mais l'entretien passé est tracé, sans détail inventé.
- **Plan de test** : Workspace — « Create a first and second interview round… » (premier round), « Confirm preparation, simulation and `actual/` artifacts are created only when their workflow phase is reached ».

### D4 — Préparer l'entretien ensemble [demo]

- **Durée démo** : 3 min
- **Conversation** : suite de D3
- **Prompt** (si le coach n'a pas déjà enchaîné en D3) : « Préparons cet entretien ensemble avant de simuler. Quelles questions risquent de tomber et qu'est-ce que je dois avoir en tête ? »
- **Réponse à coller** quand le coach demande de raconter la migration (adapter si sa question diffère) :

  > Chez Payflow, on avait un monolithe de règlement qui bloquait tout le monde : un déploiement par semaine, et la moindre modification touchait trois équipes. On l'a découpé en six services sur dix-huit mois. Euh, en fait c'est moi qui ai proposé le plan et qui l'ai négocié avec le CTO, mais on a tous travaillé dessus. À la fin, le temps de déploiement avait baissé de 40 %.

- **Attendu** : le coach s'appuie sur `analysis.md` et les messages stratégiques pour cibler l'entretien technique (discussion d'architecture avec deux membres de la squad) : il propose les thèmes probables (migration du monolithe, idempotence des paiements, observabilité, incident de prod), pose deux ou trois questions à Nadia pour l'aider à retrouver des preuves et des exemples concrets, et relève les points de vigilance connus (dire « je » plutôt que « on », secteur régulé non pratiqué). Sur la réponse collée, il relève l'hésitation entre « on » et « j'ai », l'absence de critère de découpage et d'alternative écartée, et un résultat sans valeur de départ, sans compléter à la place de la candidate. Il n'écrit pas encore la fiche de préparation ; `interview.md` du round indique que la préparation a commencé ; ce qui est validé est consigné dans l'analyse ou le statut, sans fait inventé.
- **Mots-clés** : montrer qu'il reformule et propose une preuve plus précise. Ne pas mener l'échange au bout en démo.
- **Plan de test** : Standalone — « Confirm no facts are invented » ; Workspace — « Confirm preparation, simulation and `actual/` artifacts are created only when their workflow phase is reached » (pas de `preparation.md` à ce stade), « Confirm the opportunity receives a `current-status.md` and that it is updated after phase changes, important validations… ».

### D5 — Simulation courte avec arrêt anticipé [demo]

- **Durée démo** : 8 min
- **Conversation** : suite de D4
- **Prompt** : « Lançons une simulation de cet entretien technique. »
- **Attendu** : le coach propose les profondeurs Court, Standard, Approfondi avec durée et nombre de questions indicatifs, et rappelle les mots-clés d'arrêt. Première simulation du round : il ne commente pas ce que les interlocuteurs ignoreront et ne présente pas la préparation de D4 comme une simulation. Il entre dans le rôle des deux ingénieurs, pose une question à la fois, relance naturellement, ne fait pas de coaching pendant le jeu.
- **Action** : choisir « Court » ; répondre à deux ou trois questions des interviewers en se mettant à la place de Nadia, la candidate, en phrases complètes et sans chercher la perfection (le transcript peut servir d'exemple) ; glisser « on a dû stopper le déploiement » dans une réponse ; écrire « stop » seul, puis refuser l'arrêt (« Non, on continue. ») ; répondre à une question de plus, écrire de nouveau « stop » et confirmer l'arrêt.
- **Mots-clés** : un « stop » dans une réponse n'arrête rien ; à « stop », le coach sort du rôle en italique et demande confirmation, l'arrêt étant définitif ; on peut revenir en arrière : après le refus, il reprend le rôle en italique ; au second « stop » confirmé, la simulation s'arrête vraiment.
- **Attendu après le premier « stop »** : le coach signale en italique qu'il sort du rôle et demande de confirmer l'arrêt, l'arrêt étant définitif ; après « Non, on continue. », il signale en italique qu'il reprend le rôle et la simulation repart là où elle en était.
- **Attendu après le second « stop »** : même demande de confirmation ; après confirmation, il dit qu'il s'arrête à la demande de la candidate, quitte le rôle, propose éventuellement de recueillir ses questions, et enchaîne sur le debrief ou le note comme prochaine action. `simulations/01/transcript.md` ne couvre que ce qui a été joué ; `interview.md` du round mentionne la simulation.
- **Plan de test** : Standalone — « Confirm the coach offers the Court, Standard and Approfondi depths… », « Confirm each stop keyword ends a simulation, that a « stop » inside an answer does not… », « Write « stop » mid-simulation… » ; Workspace — « Stop a simulation early with « stop »… », « Confirm simulation asks one question at a time », « Confirm status updates do not interrupt the interview simulation itself ».

### D6 — Debrief [demo]

- **Durée démo** : 2 min
- **Conversation** : suite de D5
- **Prompt** (si le coach n'a pas enchaîné) : « Fais-moi le debrief. »
- **Attendu** : `simulations/01/debrief.md` séparant observations et interprétations, les points forts précis d'abord, puis une à trois priorités à travailler, mention de l'arrêt anticipé et des limites des preuves ; pas d'évaluation des parties non jouées ; `current-status.md` de l'opportunité et `interview.md` du round mis à jour ; proposition d'une nouvelle simulation avec la question de la profondeur.
- **Mots-clés** : montrer que le coach présente d'abord les bons points, puis les points à travailler ; la distinction observations / interprétations ; le ton « bienveillant mais exigeant ».
- **Plan de test** : Workspace — « Confirm each simulation debrief separates observations from interpretation, limits priorities to one through three, and updates the opportunity status » ; Standalone — « Confirm the first debrief is succinct and evidence-based ».

### D7 — Deuxième simulation

- **Conversation** : suite de D6
- **Prompt 1** : « On refait une simulation, Standard cette fois. »
- **Attendu 1** : le coach demande s'il faut rejouer le même cas ou un autre. La simulation est indépendante de la première : les interlocuteurs ne font pas référence à une session précédente (pas de « rebonjour », pas de « on reprend »).
- **Action** : après deux ou trois questions, écrire « stop », puis ne pas répondre à la demande de confirmation et répondre directement à la dernière question de l'entretien (le refus explicite, « Non, on continue. », est joué en D5).
- **Attendu** : le coach signale en italique qu'il sort du rôle et demande confirmation ; en voyant que la candidate répond à la question de l'entretien, il comprend que la simulation continue, signale en italique qu'il reprend le rôle et la simulation repart là où elle en était, en tenant compte de la réponse donnée.
- **Action** : jouer la simulation **jusqu'au bout**, sans arrêt et sans demander de debrief.
- **Prompt 2** : « Prépare l'étape suivante : entretien avec le Head of Engineering. »
- **Attendu 2** : `simulations/02/transcript.md` complet, `simulations/01/` inchangé ; `interviews/03-…/interview.md` créé, sans basculer dessus ; `interview.md` du round 02 mentionne la simulation 02. Aucun debrief de la simulation 02 n'est écrit.
- **Action** : fermer la conversation.
- **Plan de test** : Workspace — « For the same opportunity, run at least two simulation/debrief/improvement loops… », « Create a first and second interview round… » (second round).

### D8 — Debrief dans une nouvelle conversation

- **Conversation** : nouvelle (la simulation 02 n'a pas été débriefée en D7)
- **Prompt** : « Débriefe ma dernière simulation Lumen Pay. »
- **Attendu** : le coach retrouve l'opportunité, le round et la simulation depuis les fichiers seulement, et écrit `simulations/02/debrief.md` à partir du transcript, en reliant les observations aux priorités du debrief 01 ; les faits cités sont attribués au bon employeur ; `interview.md` du round et le statut sont mis à jour.
- **Plan de test** : Workspace — « End one conversation after persisting a simulation transcript… ».

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
- **Plan de test** : Workspace — « Repeat an independent debrief without a transcript using candidate notes… ».

### D10 — Travailler les questions à poser

- **Conversation** : suite de D9
- **Prompt** : « Avant la fiche, je voudrais qu'on regarde les questions que je vais leur poser. »
- **Attendu** : le coach retrouve les trois idées de questions déjà présentes dans le dossier professionnel (issues des notes complémentaires : astreinte, part de dette technique, décisions d'architecture inter-équipes) et ne demande pas de les ressaisir ; il donne son avis sur chacune (pertinence pour un entretien technique avec deux membres de la squad, formulation, ce qu'elle révèle de la candidate), propose d'en reformuler certaines (par exemple ne pas ouvrir sur la rémunération de l'astreinte à ce stade) et d'en ajouter une ou deux spécifiques à Lumen Pay (moteur de décision de crédit en temps réel, contraintes ACPR sur la livraison, montée à 2 millions d'opérations par jour), en les présentant comme ses suggestions, distinctes des idées de la candidate. Il distingue les questions pour ce round de celles à garder pour le Head of Engineering. Les questions retenues sont validées par la candidate avant d'être consignées.
- **Variante à tester** (jouer D11 avant D10, dans la même conversation) : si la candidate demande directement la fiche sans être passée par cette étape, le coach doit relever qu'aucune question à poser n'a été travaillée pour ce round et demander si elle veut le faire d'abord ; répondre « non, génère quand même » et vérifier que la fiche est produite avec les sections de questions laissées vides, sans question inventée.
- **Plan de test** : Workspace — « Confirm the coach reviews the candidate's questions for the interviewers… » ; Standalone — « Confirm no facts are invented ».

### D11 — Fiche de préparation pour l'entretien réel

- **Conversation** : suite de D10
- **Prompt** : « Je me sens prête. Génère ma fiche de préparation pour l'entretien technique. »
- **Attendu** : `interviews/02-technical/preparation.md` consolidant le positionnement, les messages stratégiques, les questions probables, les questions à poser validées en D10 (prioritaires en première page, complémentaires ensuite) et les améliorations issues des debriefs (simulations 01 et 02, debrief sans transcript) ; première page autonome, lisible par les interlocuteurs, sans points de vigilance personnels ; deuxième page réservée aux notes ; détail à partir de la troisième page, qui commence par les points de vigilance et rappels de communication ; aucun fait nouveau. Le statut de l'opportunité et `interview.md` passent à « prête pour l'entretien ».
- **Plan de test** : Workspace — « Complete preparation, sheet generation… », « Confirm first-page sheet density and note area remain usable ».

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
- **Plan de test** : Workspace — « Confirm an actual-interview review works from candidate notes without requiring a transcript », « Confirm durable learnings are separated from opportunity-specific content ».

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
- **Plan de test** : Workspace — « Confirm it creates stable `001-...` and `002-...` directories, then uses `max + 1`… », « Provide a job posting in a language other than the coaching language… », « Confirm `data/current-status.md` is read and remains a minimal routing snapshot rather than an opportunity index ».

### *E2 — Changement de périmètre en cours de conversation* [demo] [todo #11]

- **Durée démo** : à estimer à la livraison de #11
- **Conversation** : suite de E1
- **Prompt** : « Au fait, pour Lumen Pay, tu peux me préparer l'entretien avec le Head of Engineering ? »
- **Attendu** : le coach recommande d'ouvrir une nouvelle conversation pour l'autre opportunité, en expliquant pourquoi, sans refuser.

### *E3 — Reprise depuis le workspace* [demo] [todo #11]

- **Durée démo** : à estimer à la livraison de #11 (l'étape revient sur l'opportunité quittée en E2)
- **Conversation** : nouvelle
- **Prompt** : « Où en sommes-nous ? »
- **Attendu** : le coach lit `data/current-status.md`, puis le statut de chaque opportunité, résume l'état de Lumen Pay (entretien technique passé et revu, entretien avec le Head of Engineering créé mais pas encore préparé ; en démo, où D7 à D12 ne sont pas joués : entretien technique simulé et débriefé) et de Northwind Ledger (opportunité créée, entretien manager à planifier, system design à préparer), et propose un point de reprise sans choisir à la place de la candidate.
- **Mots-clés** : c'est le point clé de la démo, « le workspace porte le contexte, pas la conversation ».
- **Plan de test** : Workspace — « Start a new conversation for a later coaching session and confirm work can be resumed from the workspace without prior conversation history ».

### *E4 — Fonctionnement avec Git* [demo] [todo #6]

- **Durée démo** : à estimer à la livraison de #6
- **Attendu** : à définir avec #6.

## Phase F — Clôture

### F1 — Retour pilote sur demande

- **Conversation** : nouvelle
- **Prompt** : « Je voudrais remplir le formulaire de retour pilote. »
- **Attendu** : `data/feedback/pilot-feedback.md` créé depuis le modèle, seulement maintenant.
- **Plan de test** : Workspace — « Confirm `data/feedback/pilot-feedback.md` is created only on request ».

### F2 — Produire l'exemple du dépôt [manual]

- **Action** : à la demande du mainteneur seulement, après un déroulé complet jugé représentatif, copier le répertoire `data/` du workspace de test vers `examples/fictitious-developer/data/` dans le dépôt, puis relire le contenu avant de le commiter (aucune donnée réelle, pas de chemin absolu local).
- **Attendu** : l'exemple reflète l'arborescence `data/` du workspace et uniquement elle.
- **Plan de test** : Test kit — « Confirm `examples/fictitious-developer/data/` mirrors the workspace `data/` tree… » ; Repository privacy.

## Récapitulatif des étapes `[demo]`

| Étape | Durée indicative |
| --- | --- |
| A1 Extraire et ouvrir | 2 min |
| B1 Première session | 2 min |
| C1 Sources et transcription | 5 min |
| C2 Validation du dossier | 2 min |
| *C3 Entretien d'initialisation* | *`[todo #10]`* |
| *C4 Rappel dossier non prêt* | *`[todo #9]`* |
| D1 Créer l'opportunité | 4 min |
| D2 Préparer l'opportunité | 4 min |
| D3 Créer l'étape d'entretien | 2 min |
| D4 Préparer l'entretien ensemble | 3 min |
| D5 Simulation courte et arrêt | 8 min |
| D6 Debrief | 2 min |
| E1 Deuxième opportunité | 5 min |
| *E2 Changement de périmètre* | *`[todo #11]`* |
| *E3 Reprise depuis le workspace* | *`[todo #11]`* |
| *E4 Git* | *`[todo #6]`* |
| **Total disponible** | **39 min** |

La démo vise 35 à 40 minutes. Les durées ci-dessus sont révisées d'après la démo à blanc du 2026-10-03 : environ 45 minutes mesurées pour ces étapes, avec dictée des heures au scribe ; enchaînées sans prise de notes, elles devraient tenir en 35 à 40 minutes. Le premier déroulé complet (2026-10-02, environ 1 h 29) mêlait test, consignation et étapes hors démo et ne mesure pas une vraie démo. C2 et D3 restent dans la démo : C2 est rapide, et D3 montre un entretien passé sans préparation avant l'entretien technique. D5 gagne une minute pour montrer un arrêt refusé puis confirmé. Quand les issues `[todo]` seront livrées, il faudra arbitrer pour rester dans la cible.
