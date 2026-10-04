# 2026-10-04 — Tests manuels du joker (issue #18)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit.
- **Version** : `0.4.0-dev`, ZIP de #18 copié par-dessus le workspace de test des [tests manuels de #15](2026-10-04-tests-manuels-premiere-session.md).
- **Données** : sources fictives du kit de test (Nadia Berkani), opportunité 001 Lumen Pay analysée, messages stratégiques validés.

## Résultats

- ✅ **D4, variante hors simulation** : pendant la préparation au format STAR de l'exemple de la migration, « Joker - donne-moi un indice » : ligne en italique « Le joker ne s'utilise que pendant une simulation d'entretien ; voici ma réponse à votre demande. », puis indice de coaching à la ligne suivante, sans entrer ni sortir d'un rôle et sans réponse rédigée à la place de la candidate (un seul moment précis à raconter en trois points, réponse en « je »).
- 🐞 **D5, joker de conseil** : sur une relance du développeur senior de la squad (« comment avez-vous convaincu le CTO de renoncer au big bang ? »), « joker, donne-moi un indice » : *Je sors du rôle des interviewers pour votre joker.*, indice sans réponse rédigée (angle du risque, structure tension puis argument puis réaction, preuves à chercher dans le dossier sans rien inventer, « j'ai » plutôt que « on »), puis *Je reprends le rôle des interviewers.*, lignes en italique. Écart : l'interviewer repose la question en entier (« Je répète ma question : quels arguments… »), alors que la règle prévoit d'attendre la réponse sans la reposer en entier.
- 🐞 **D7, « joker » seul puis réponse proposée** (joué pendant D5) : sortie du rôle en italique, puis demande de précision conforme (« Souhaitez-vous un conseil pour répondre à cette question, ou une réponse proposée à votre place ? »). Sur « propose moi une réponse possible, je bloque » : **Réponse proposée (joker) :** en « je », structurée (risque de la bascule, découpage progressif, plan défendu auprès du CTO, résultat), puis ligne *Supposé faute d'information : …* qui signale que les arguments et objections ne figurent pas dans le dossier, puis retour au rôle ; l'interviewer suivant réagit comme à une réponse (relance sur la cohabitation monolithe / services et le double traitement d'un paiement). Écarts :
  - ligne non prévue après la question de précision : « Je reprendrai le rôle des interviewers dès que vous aurez répondu. » ;
  - ligne de sortie du rôle répétée après la réponse à la question de précision, alors que le coach était déjà hors rôle ;
  - avertissement ajouté après la réponse proposée : « C'est un exemple à analyser (structure : tension, apport personnel, résultat), pas à mémoriser. », et la ligne des suppositions se prolonge par une consigne (« Corrigez ce qui est faux : seul ce qui est vrai pour vous a de la valeur. ») ; l'étiquette devait suffire.
  - Faits repris : « un déploiement par semaine » et « trois équipes » touchées à chaque modification, absents des sources du kit, viennent de la première réponse de la candidate dans la simulation, collée depuis le script de D4 (vérifié dans `transcript.md`) ; aucun fait inventé. Le conseil les situait à tort « dans votre dossier ».

- ✅ **D7, deux réponses proposées de suite** : à la relance sur la cohabitation monolithe / services, seconde réponse proposée sans fait inventé (« je préfère être précise plutôt que d'enjoliver »), appuyée sur un fait du dossier (traitement unique des webhooks chez Kiwano Digital), avec une ligne de suppositions qui signale ce que le dossier ne documente pas.
- ✅ **D5, arrêt refusé puis confirmé** : « stop », refus, reprise du rôle, puis second « stop » confirmé ; fin de simulation, dernière question restée sans réponse. L'interviewer reformule sa question à la reprise (« Je reformule ma question : … »), à rapprocher de R4.
- ✅ **Transcription** (`simulations/01/transcript.md`) : ligne factuelle `Joker : conseil demandé.` sans le contenu du conseil, réponses proposées étiquetées à la place du tour de la candidate, lignes de suppositions reprises, sans le commentaire ajouté dans la conversation ; arrêt non confirmé puis confirmé noté factuellement, sans interprétation.
- ✅ **D6, débrief** : ligne « Jokers : 3 au total (1 conseil, 2 réponses proposées), pour information », conforme au transcript ; seules les deux réponses de la candidate sont évaluées ; les réponses proposées ne sont ni des points forts ni des priorités et sont citées comme exemples ; arrêt anticipé et limites mentionnés. La candidate n'ayant pas répondu après le conseil (joker suivant demandé), le cas « réponse après conseil évaluée » n'est pas couvert.

- ✅ **Deuxième simulation (02), même cas, courte** : interviewers sans référence à la simulation 01 (« Bonjour Nadia, merci de votre venue »).
  - Joker de conseil, puis réponse de la candidate : le débrief l'évalue comme sa réponse, en mentionnant le conseil suivi (« la réponse qui en a découlé est bien la sienne »). Après le retour au rôle, l'interviewer reprend la question sous une forme abrégée (« Je vous écoute sur sa position de départ… »), mieux qu'en simulation 01 mais encore une reformulation (R4).
  - Joker annulé : retour au rôle, puis « Je vous écoute. » sans reposer la question ; ni compté ni noté dans `transcript.md`. Écart mineur : le débrief le mentionne dans la ligne « Jokers » (« Un second joker a été annulé… »), information qui ne vient que de la conversation.
  - « stop » juste après le joker annulé : confirmation demandée, puis arrêt ; noté factuellement.
  - Débrief : ligne « Jokers : 1 au total (1 conseil, 0 réponse proposée) », conforme au transcript ; priorités reliées au débrief 01. Observation : il affirme que la réponse d'ouverture est « identique mot pour mot » à celle de la simulation 01 sans lister `simulations/01/transcript.md` parmi ses sources (débrief fait dans la même conversation).

- ✅ **« joker » au milieu d'une réponse** (simulation 03) : « J'ai joué mon joker sur ce coup-là ! » ne déclenche rien ; l'interviewer relance sur le problème d'observabilité.
- ✅ **Reprise dans une nouvelle conversation** : le coach retrouve depuis les fichiers que les simulations 01 et 02 sont débriefées et que la 03 ne l'est pas, et propose d'abord son débrief. Écarts de #15 au début de la réponse : étape interne recopiée en anglais, « Step 2: check existence only, without reading the files. », avant « Bonjour Nadia. » (R8) ; phrase technique sur l'état du workspace, « la configuration et les fichiers obligatoires sont présents, et il ne manque aucune clé » (R7).

- 🐞 **D8, débrief de la simulation 03 dans une nouvelle conversation** : sources lues depuis les fichiers et listées (transcript 03, débriefs 01 et 02, `interview.md`, statut, analyse, opportunité, dossier), priorités reliées aux débriefs précédents, réponses de la candidate seules évaluées, arrêt anticipé non interprété. Écart : le « joker » glissé dans une réponse est traité comme une anomalie : « Jokers : 0 marqué dans la transcription… (voir la limite ci-dessous) » et « Contradiction signalée, non tranchée » dans les limites. Correction R8 de #18.

## Observations

- Modèle utilisé : Sonnet 5.5. Hypothèse du testeur, à vérifier à l'usage : un modèle de réflexion supérieure (type Opus 5.5) conviendrait mieux aux simulations et au joker ; idée rattachée au backlog (recommandations de raisonnement selon les tâches).
- 🐞 Prénom trop fréquent (#15) : employé hors salutation dans quatre messages rapprochés (« Nadia, je propose de commencer par… », « Nadia, la simulation est terminée. », « Voici le débrief de la simulation 01, Nadia… », « Très bien, Nadia. »). La règle « sans répéter le prénom à chaque message » n'est portée que par `init-workspace`. Correction R9 de #15 proposée.

## Non testé

- Réponse proposée sur le secteur régulé (non pratiqué) ; simulation Standard jouée jusqu'au bout ; E5 (en anglais).
