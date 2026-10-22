# Exigences — Feedback produit

Pendant le pilote, toujours actif : journal local des difficultés d'usage et
des notes dictées par le candidat, identifiant anonyme, et génération d'un
feedback anonymisé à la demande. Rien n'est envoyé.

### REQ-FB-01 — Message d'information de première session

- **Exigence** : à la première session, après le rappel de confidentialité et
  avant la proposition de la première étape, le coach donne en deux ou trois
  phrases, sans question : pendant le pilote, il tient des notes locales sur
  les difficultés d'usage pour améliorer le produit ; on dicte une note en
  commençant par le mot-clé exact « suggestion d'amélioration : » ; on lui
  demande de générer un feedback ; rien n'est envoyé automatiquement.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-02 — Identifiant anonyme généré

- **Exigence** : quand `product_feedback.user_id` est vide dans
  `data/config/workspace.yaml`, le coach y écrit un identifiant de
  8 caractères `[a-z0-9]` sans lien avec l'identité du candidat (ni nom, ni
  prénom, ni date de naissance).
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-03 — Identifiant jamais modifié

- **Exigence** : un `product_feedback.user_id` déjà renseigné n'est jamais
  modifié.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-04 — Journal créé à la première session

- **Exigence** : à la première session, `data/feedback/feedback-log.md` est
  créé depuis le modèle du skill du feedback produit, sans entrée ; aucun
  autre fichier de retour (formulaire `pilot-feedback.md`) n'est créé.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-05 — Rien au démarrage des sessions suivantes

- **Exigence** : après la première session, le coach ne dit rien du feedback
  produit au démarrage d'une session.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-06 — Workspace antérieur au feedback produit

- **Exigence** : dans un workspace créé avant le feedback produit (sans
  section `product_feedback` ni journal), le coach ajoute la section avec un
  identifiant généré et crée le journal depuis le modèle, sans y voir une
  perte possible de données ni demander comment procéder.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-07 — Identifiant et journal recréé signalés

- **Exigence** : hors première session, le coach signale l'identifiant généré
  et le journal recréé, chacun en une phrase courte ; la section ajoutée est
  signalée une seule fois, comme toute clé manquante.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-08 — Journal supprimé recréé sans alerte de perte

- **Exigence** : quand seul le journal manque dans un workspace déjà utilisé,
  le coach le recrée depuis le modèle sans parler de perte possible ni
  demander comment procéder.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-09 — Format d'une entrée

- **Exigence** : chaque entrée du journal tient sur une ligne : date et heure,
  type (`silencieuse` ou `explicite`), état `non traitée`, contexte court
  (étape, opportunité, entretien, simulation ou fichier), puis le texte : les
  mots du candidat pour une entrée explicite, une description factuelle de la
  difficulté pour une entrée silencieuse, `joker : conseil` ou
  `joker : réponse proposée` pour un joker.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-10 — Ajout en fin de journal sans lecture

- **Exigence** : une entrée est ajoutée à la fin du journal sans lire ni
  réorganiser le journal.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-11 — Difficultés d'usage consignées

- **Exigence** : une difficulté d'usage manifeste (allers-retours répétés sur
  un même point, problème de copie, de fichier ou de pièce jointe, consigne
  mal comprise par le coach puis corrigée par le candidat) donne une entrée
  silencieuse, ajoutée sans l'annoncer ni la commenter.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-12 — Raison d'arrêt d'une simulation consignée

- **Exigence** : la raison donnée par le candidat pour arrêter une simulation
  donne une entrée silencieuse qui la cite, ajoutée sans l'annoncer ni la
  commenter.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-13 — Une entrée par joker utilisé

- **Exigence** : chaque joker utilisé pendant une simulation donne une entrée
  silencieuse limitée au type de joker et au contexte minimal, sans la
  question ni la réponse, ajoutée sans interrompre ni commenter la
  simulation.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-14 — Aucune entrée pour un joker annulé

- **Exigence** : un joker annulé ne donne aucune entrée dans le journal.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-15 — Note dictée par mot-clé

- **Exigence** : un message commençant par « suggestion d'amélioration : »
  donne une entrée explicite dont le texte est celui du candidat.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-16 — Phrase naturelle visant l'outil

- **Exigence** : une phrase naturelle visant l'outil (« J'ai une suggestion
  pour améliorer l'outil… ») est enregistrée comme une note explicite, de la
  même façon qu'avec le mot-clé.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-17 — Phrase sur son propre travail

- **Exigence** : une phrase sur le travail du candidat (« J'ai une suggestion
  pour améliorer ma réponse… ») n'est jamais une note : rien n'est enregistré
  et le message est traité comme un message ordinaire.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-18 — Mention de prise en compte

- **Exigence** : une note est acquittée par la seule ligne en italique des
  consignes (*Note de retour produit prise en compte.*), puis le coach reprend
  exactement où il en était.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-FB-19 — Note pendant une simulation

- **Exigence** : pendant une simulation, une note n'interrompt ni ne termine
  la simulation : la mention seule, sans ligne de sortie ni de retour de rôle,
  puis l'interviewer attend la réponse à la même question sans la reposer (au
  plus « Je vous écoute. »).
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-FB-20 — Note absente du transcript

- **Exigence** : aucune note ni entrée du journal n'est écrite dans
  `transcript.md`.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-21 — Note distincte des mots-clés d'arrêt

- **Exigence** : une note ne déclenche pas la confirmation d'arrêt d'une
  simulation, et un mot-clé d'arrêt ne crée pas de note.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-22 — Rien nettoyé à l'écriture

- **Exigence** : le texte d'une entrée est écrit tel quel : noms, entreprises
  et chemins locaux ne sont ni retirés ni remplacés dans le journal.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-23 — Message d'information en anglais

- **Exigence** : avec l'anglais comme langue de coaching, le message
  d'information de la première session est en anglais, avec le même contenu
  et le mot-clé exact « suggested improvement: ».
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-24 — Note en anglais

- **Exigence** : un message commençant par « suggested improvement: » donne
  une entrée explicite, acquittée par la ligne anglaise exacte des consignes
  (*Product feedback note recorded.*).
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : formulation fixe

### REQ-FB-25 — Entrées non traitées seulement

- **Exigence** : à la demande du candidat, la génération d'un feedback ne
  reprend que les entrées du journal à l'état « non traitée ».
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-26 — Revue des entrées silencieuses

- **Exigence** : le coach revoit une à une avec le candidat les entrées
  silencieuses hors jokers, chacune confirmée ou écartée ; les entrées
  explicites et les entrées de joker ne sont pas revues.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-27 — Trois questions dans l'ordre

- **Exigence** : le coach pose trois questions, dans cet ordre : ce qui
  fonctionne bien, les points importants à corriger rapidement, les idées
  d'évolution à long terme.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-28 — Statistique des jokers sur toutes les entrées de joker

- **Exigence** : la statistique d'usage des jokers (simulations concernées,
  conseils, réponses proposées) est calculée sur toutes les entrées de joker
  « non traitée », et sur elles seules.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-29 — Statistique incluse seulement si acceptée

- **Exigence** : la statistique est proposée au candidat et n'est incluse que
  s'il l'accepte ; sinon le fichier n'a pas de section sur les jokers.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-30 — Métadonnées et comptages

- **Exigence** : le feedback indique `product_feedback.user_id`, la version lue
  dans `ENGINE-VERSION`, la date, l'outil IA et le modèle, la langue de
  coaching, et le nombre total de répertoires d'opportunités et de
  répertoires d'entretiens, comptés au moment de la génération.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-31 — Fichier de feedback indépendant

- **Exigence** : le feedback est écrit dans un fichier distinct
  `data/feedback/feedback-<user_id>-AAAA-MM-JJ.md`.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-32 — Anonymisation du contenu

- **Exigence** : le contenu du feedback remplace par des valeurs génériques au
  moins les noms de personnes, d'entreprises et d'organisations, les
  intitulés de poste identifiants, les chemins locaux, les adresses
  électroniques, les numéros de téléphone et les liens de profil.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-33 — Remplacements listés, anonymisation non garantie

- **Exigence** : le coach donne dans la conversation, jamais dans le fichier,
  la liste des remplacements faits ; il ne présente pas le résultat comme
  garanti anonyme et demande au candidat de le relire avant tout partage.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-34 — Entrées prises en compte passées à « traitée »

- **Exigence** : après la génération, les entrées prises en compte (entrées
  explicites, entrées silencieuses revues, retenues ou écartées, et entrées de
  joker, statistique acceptée ou non) passent à l'état « traitée » ; rien
  d'autre n'est modifié dans le journal.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-35 — Passage à « traitée » après l'écriture du fichier

- **Exigence** : l'état des entrées ne change qu'une fois le fichier de
  feedback effectivement écrit.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-36 — Génération interrompue

- **Exigence** : quand la génération est interrompue ou échoue avant
  l'écriture du fichier, aucun fichier n'est écrit et le journal est
  inchangé : toutes les entrées restent « non traitée ».
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-37 — Rien envoyé, aucune date d'envoi

- **Exigence** : rien n'est envoyé automatiquement, et le coach ne consigne
  aucune date d'envoi, ni dans un `current-status.md` ni ailleurs.
- **Origine** : #17, D-023
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-38 — Feedback retravaillé

- **Exigence** : quand le candidat demande de retravailler un feedback
  généré, le coach ne modifie que ce fichier, jamais le journal.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-39 — Second feedback du même jour

- **Exigence** : un second feedback le même jour est écrit dans un nouveau
  fichier suffixé `-2` (puis `-3`…), sans jamais écraser un fichier
  existant.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-40 — Génération sans nouvelle entrée

- **Exigence** : quand le journal ne contient aucune entrée « non traitée »,
  le coach le dit, puis pose quand même les trois questions.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-41 — Sans nouvelle entrée ni réponse, aucun fichier

- **Exigence** : sans entrée « non traitée » et sans réponse aux questions, le
  coach n'écrit aucun fichier et le dit.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : contenu requis

### REQ-FB-42 — Sans nouvelle entrée, feedback des seules réponses

- **Exigence** : sans entrée « non traitée », avec au moins une réponse aux
  questions, le feedback généré ne contient que ces réponses.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-FB-43 — Journal long

- **Exigence** : avec un journal de nombreuses entrées, la génération le lit,
  ne reprend que les entrées « non traitée » et reste utilisable.
- **Origine** : #17
- **Statut** : ✅ Active
- **Message** : aucun
