# 2026-10-11 — Tests manuels minimaux des corrections de #9 (troisième passe)

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Jérôme Jurbert (auteur), Claude Code (accompagnement et consignation).
- **Version** : `0.4.0-dev`, dépôt au commit `5159d42` (corrections R12, R13, K1 à K4). ZIP construit par `build.bat` le 2026-10-10 ; seul `BACKLOG.md`, hors ZIP, était modifié dans l'arbre de travail.
- **Données** : kit de test fictif (`test-kit/`). Un seul workspace neuf, `C:\Temp\mycareer\Test-2026-10-11\mycareer-workspace-test1` (le suffixe `-test-26-10-10` prévu n'a pas été utilisé). Langue de coaching : français uniquement. Aucune heure relevée.
- **Périmètre** : session minimale, vérification des corrections de la troisième passe (C4 reformulé, D1 à part entière, R12). Tout ce qui n'est pas listé ci-dessous est « non joué » et n'est déduit d'aucun autre résultat.

## Résultats

Légende : ✅ conforme · ⚠️ conforme avec réserve ou partiel · 🐞 écart · « non joué ».

### Initialisation (A1, B1, C1, C2)

- ✅ A1 : extraction et ouverture faites par le testeur, déclarées conformes (pas de détail transmis).
- ✅ B1 prompt 1 : *Lancement de la session…*, accueil exact, question du prénom, attente de la réponse ; « espace carrière », jamais « workspace ».
- ✅ B1 prompt 2 : accusé de réception exact, phrase « J'ai préparé votre espace… » exacte, rappel de confidentialité exact et unique, proposition de construire le dossier sans le remplir ; quatre fichiers créés ; `workspace.yaml` contient `address_by_first_name: yes` et `first_name: "Nadia"`.
- ✅ C1 prompt 1 : trois façons de fournir les documents, transcription et proposition à valider annoncées, pas de questionnaire.
- ✅ C1 prompt 2 : copies dans `historical-resumes/`, `certifications/`, `coaching-notes/`, transcription à côté de chaque original, URL LinkedIn notée sans prétendre l'avoir ouverte, dossier proposé sans écriture, points flous signalés (ancienneté, titre de tech lead, React). En-têtes des transcriptions : non vérifiés.
- ✅ C2 : `draft (en construction)`, version 0.2, date du jour, entrée « empty 0.1 → draft 0.2 … Validé. » (R13 vérifié : plus de « Validé par le candidat ») ; aucune rémunération dans le dossier ; « sept ans » conservé. `data/current-status.md` : non vu.

### C4 (nouvelle conversation)

- ✅ Prompt 1 (« J'aimerais préparer mes entretiens… ») : « Bonjour Nadia. », ligne « Dossier professionnel : 🟠 en construction (version 0.2). ». Refus fondé sur le statut (« pas encore marqué "prêt" »), nommant « la préparation d'entretiens », sans sanction. Suite **« insuffisant »** : principales lacunes nommées (exemples STAR, arbitrages de la migration, post-mortems, juniors, échecs et désaccords, section 14), compléter d'abord proposé, « continuer sans attendre » possible. Pas de proposition de `ready` mêlée. Aucune opportunité créée : `data/opportunities/` ne contient que le `README.md`.
- ✅ Prompt 2 : ajout proposé, effet annoncé (statut inchangé, 0.2 → 0.3, une seule incrémentation dans la session), rien appliqué avant « Oui, je valide cette modification. ».
- ✅ Prompt 3, joué en trois messages (variante d'exécution) : « Oui, je valide cette modification. », puis « on peut passer le dossier en prêt », puis « Oui, je confirme le passage à prêt ». Ajout appliqué en 0.3 ; demande de `ready` accueillie par une réserve citant les lacunes et une demande de confirmation ; après confirmation, `ready (prêt)` 1.0, entrée d'historique mentionnant la réserve ; ligne 🟢 1.0 affichée. Trois entrées d'historique, une par transition. `data/current-status.md` : annoncé mis à jour, non vu.

### D1 (nouvelle conversation)

- ✅ Prompt 1 : ligne 🟢 1.0 ; `001-lumen-pay-senior-backend-developer/` créé avec `opportunity.md`, `current-status.md` (et un `.gitkeep` dans `sources/`, supprimé ensuite, selon le coach) ; `data/current-status.md` mis à jour ; offre demandée en premier avec les trois façons de la fournir ; accord demandé avant d'ouvrir un éventuel lien.
- ✅ Prompt 2 : PDF copié inchangé dans `sources/`, transcription `.md` à côté, `opportunity.md` complété avec les faits et leur provenance (poste, squad Scoring & Décision, quatre étapes, 62–72 k€), sans analyse d'adéquation ; une seule opportunité. Analyse proposée ensuite, le dossier étant prêt.
- 🐞 Transcription de l'offre : les « € » de « 62 à 72 k€ » et « 2 000 € » sont absents du texte extrait (`out.txt` : « 62 à 72 k brut », « 2 000  par an ») et ont été rétablis d'après le contexte, sans marque. L'en-tête dit « Transcription fidèle ; la mise en page n'est pas reproduite. », sans limite d'extraction. Le coach ne l'a signalé que sur question du testeur.
- État de référence pour R12 (`current-status.md` de 001 après D1) : « Focus courant » : « Préciser l'état de la candidature, puis analyser l'adéquation avec le dossier professionnel (prêt, version 1.0). » ; « Prochaine action » : « Indiquer où en est la candidature (déjà postulé ? premier échange fixé ?), puis lancer l'analyse de l'opportunité. ».

### C11 (nouvelle conversation, sans remise en état)

- ✅ Prompt 1 (« J'envisage de me réorienter vers un poste de staff engineer… ») : ligne 🟢 1.0, retour à « en construction » proposé sans application, versions annoncées (1.1, prochain « prêt » en 2.0), deux questions (validation du retour, point de départ de la refonte). Aucune pause proposée : le coach affirme que Lumen Pay « resterait en attente de la nouvelle version du dossier pour son analyse ». Après « Oui » : `draft (en construction)` 1.1, entrée « ready 1.0 → draft 1.1 … Validé. ».
- ✅ R12, question sans réponse : le coach rattache le « Oui » à la première question, le dit (« Votre "oui" répond à la première question… ») et repose la seconde. Rien n'est consigné comme décidé : le point de reprise de `data/current-status.md` dit « Choisir le point de départ de la refonte » ; le statut de 001 reste « active ». Le cas de la pause n'a pas pu être rejoué (pas de question de pause).
- 🐞 R12, prochaine action : le `current-status.md` de 001 est identique à l'état relevé après D1. « Prochaine action » (« …puis lancer l'analyse de l'opportunité ») et « Focus courant » (« …analyser l'adéquation avec le dossier professionnel (prêt, version 1.0) ») ne tiennent pas compte du dossier repassé en `draft`, alors que le coach a dit lui-même que l'analyse attendait la nouvelle version et l'a noté dans `data/current-status.md` (« Opportunité 001 (Lumen Pay) en attente… Rappel : l'analyse de l'opportunité 001 n'a pas encore été faite. »).
- ✅ Prompt 2 (facultatif), après « Commençons par le point 1 : staff engineer est ma cible principale. » (variante : aucune modification validée entre les deux, le coach ayant posé cinq questions de positionnement restées sans réponse) : « On peut repasser le dossier en prêt » reçoit une réserve (positionnement non reflété aux sections 1, 2 et 10, réalisations à reformuler, section 13) et une demande de confirmation ; après « Je confirme » : `ready (prêt)` **2.0**, entrée « draft 1.1 → ready 2.0 » mentionnant la réserve. Les cinq questions sans réponse n'ont rien fait écrire dans le dossier (cohérent avec R12). `current-status.md` de 001 après le passage à 2.0 : non relevé.

### Écarts

**Moteur (skills et `workspace/AGENTS.md`)**

- 🐞 R12, prochaine action non mise à jour quand le statut du dossier change (C11). Cause probable : le changement vient du dossier, pas de l'opportunité ; la parenthèse « (pause, resumption, waiver, profile status) » de la règle de la ligne 47 de `workspace/AGENTS.md` n'a pas conduit le coach à relire les opportunités actives. Impact limité : à la reprise de 001, le refus ou la mise en garde liés au statut s'appliqueraient quand même ; mais le point de reprise de l'opportunité contredit l'état réel.
- 🐞 Transcription de l'offre Lumen Pay (D1) : symboles perdus rétablis sans marque et limite absente de l'en-tête. La règle existe (`workspace/skills/interview-coach/references/professional-profile-guidelines.md`, lignes 27 et 28 : marquer les passages illisibles ou ambigus au lieu de deviner, ne pas ajouter de faits, noter toute limite dans l'en-tête) ; elle n'a pas été appliquée. Les valeurs rétablies sont justes, le risque est de principe.
- Observations de forme (D-022, aucun correctif proposé) : `data/current-status.md` qualifie 001 d'« en attente » (description cohérente avec le message du coach, pas une pause décidée) ; le coach annonce dès C11 prompt 1 que le prochain « prêt » donnera 2.0, ce qui affaiblit encore la vérification du calcul ; plusieurs questions dans le même message (C2, C11) ; ligne de statut 🟢 répétée en tête de la réponse qui applique `ready` (C4).

**Kit (scénario, sources, prompts)**

- Aucun défaut. Variantes d'exécution : C4 prompt 3 découpé en trois messages ; C11 prompt 2 joué sans modification validée intermédiaire. Nom du workspace différent du suffixe prévu.

**Backlog**

- Narration technique en anglais visible par la candidate (déjà noté) : « Step 2: check existence only. » avant *Lancement de la session…* (D1, C11), « Not a first session. Reading config, status and profile header. » (C11), « ASCII85 + Flate. Decoding. », « Octal escapes for accents; fixing the decoder. », « Now the canonical opportunity.md and the statuses. » (D1).
- Lecture des PDF lente et fragile (relevé par le testeur, à inscrire dans les prochaines optimisations). Détail donné par le coach et vérifié sur ses scripts (dans le scratchpad de la session, rien dans l'espace carrière) : l'outil de lecture renvoie « PDF lu » sans contenu, puis échoue faute de `pdftoppm` (poppler) ; ni `pdftotext` ni `pypdf` disponibles ; décodage manuel des flux (ASCII85 puis Flate) et extraction par expressions régulières ; premier script cassé par l'échappement des antislashs dans le shell, réécrit avec l'outil d'écriture ; opérateurs PDF résiduels (`) Tj T* (`, `/F2 10 Tf`, `-0.015308 Tw`) et phrases coupées nettoyés à la main ; « € » perdus. Cause probable de la perte des « € » : les échappements octaux sont convertis par `chr(int(…, 8))` (Latin-1) au lieu d'un décodage cp1252 de l'octet ; `\200` donne U+0080 et non « € ». Pistes du coach : outil d'extraction disponible dans l'environnement, contrôle des symboles et accents perdus dans les consignes de transcription, offres en `.docx` ou en texte quand c'est possible.

## Notes pour l'automatisation

- **Lignes de statut** (C4, D1, C11) : comparaison exacte de chaîne. Déterministe.
- **En-tête du dossier** après chaque étape (0.2, 0.3, 1.0, 1.1, 2.0) et une entrée d'historique de plus par transition : lecture du fichier. Déterministe.
- **C4 prompt 1** : absence de répertoire sous `data/opportunities/` et absence de changement de l'en-tête : déterministe. Refus fondé sur le statut et travail nommé : jugement.
- **R12, prochaine action** : comparer le `current-status.md` de chaque opportunité active avant et après un changement de statut du dossier ; un fichier inchangé est un signal. Déterministe sur le changement, jugement sur la cohérence du contenu.
- **R12, question sans réponse** : comparer les fichiers avant et après la réponse à un message qui pose plusieurs questions ; toute écriture liée à une question sans réponse est un écart. Déterministe sur l'écriture, jugement sur le rattachement à la question.
- **Transcription** : comparer les montants et symboles de la transcription au texte extrait par un outil de référence ; un symbole présent dans la transcription et absent de l'extraction sans marque est un écart. Déterministe avec un outil d'extraction fiable.
- **Calcul de la version 2.0** : vérifiable seulement si ni le point de reprise ni la conversation n'annoncent déjà la valeur.

## Non testé

- B2 et E3 (rejoués le 2026-10-09), E1.
- Suite « suffisant » de C4 (dépend du jugement du coach) ; nouvelle offre avec demande directe d'analyse sur dossier non `ready` (C9 prompt 4).
- Proposition de `ready` par le coach, informations ajoutées avant cette proposition, proposition refusée sans raison.
- R12 avec une question de pause sans réponse (pas de question de pause en C11) ; prochaine action après pause, reprise ou dérogation ; `current-status.md` de 001 après le passage à `ready` 2.0.
- Mises à jour courantes en `1.x` ou `2.x`.
- Anglais ; documentation.

## Suites

- Débrief dans la conversation d'analyse : R12 (prochaine action) et transcription de l'offre (symboles rétablis sans marque).
- Correctifs proposés, non appliqués : (1) moteur, section « Professional profile status » de `workspace/AGENTS.md` : quand le statut du dossier change, relire le `current-status.md` de chaque opportunité active et mettre à jour sa « Prochaine action » et son « Focus courant » dans le même temps ; (2) moteur, règles de transcription : après une extraction automatique, vérifier symboles et accents, marquer un caractère perdu au lieu de le rétablir (par exemple `[symbole illisible]`) et citer la limite dans l'en-tête, la confirmation du contexte allant dans `opportunity.md` avec sa provenance.
- Backlog : outillage de lecture des PDF et narration en anglais, sans modification de `BACKLOG.md` sans accord.
