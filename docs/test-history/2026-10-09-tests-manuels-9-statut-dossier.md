# 2026-10-09 — Tests manuels minimaux de #9 (statut et version du dossier professionnel)

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Jérôme Jurbert (auteur), Claude Code (accompagnement et consignation).
- **Version** : `0.4.0-dev`, dépôt au commit `5c3f748`.
- **Données** : kit de test fictif (`test-kit/`). Trois workspaces extraits hors du dépôt : principal (parcours A1 à E3), `-c9` (CV seul) et `-c10-c11` (copie prise après C4, dossier `ready` 1.0, avant l'analyse). Langue de coaching : français uniquement. Aucune heure relevée.
- **Périmètre** : session minimale. Tout ce qui n'est pas listé ci-dessous est « non joué » et n'est déduit d'aucun autre résultat.

## Résultats

Légende : ✅ conforme · ⚠️ conforme avec réserve ou partiel · 🐞 écart · « non joué ».

### Parcours principal (workspace neuf)

- A1 : extraction du ZIP faite par le testeur ; aucun résultat consigné, pas de contrôle à noter.
- ✅ B1 : accueil, prénom, accusé de réception, compte rendu, rappel de confidentialité exact ; aucune ligne de statut en première session.
- B2 : ligne ⚪ « vide » (version 0.1) attendue, texte non relevé : **non consigné, à rejouer**.
- ✅ C1, C2 : dossier `draft` 0.2, historique, salaire absent du dossier (constaté sur les fichiers ; la forme du premier échange de C1 n'est pas relevée).
- 🐞 C4 prompt 1 (« préparer une candidature ») : pas de refus. Le coach répond « Avec plaisir. Je peux créer l'opportunité dès maintenant… », nomme « l'analyse de l'adéquation avec l'offre, le CV ciblé et la lettre de motivation » et non la préparation de la candidature, suit la branche « insuffisant » (finaliser les points ouverts) sans dire que la candidate peut continuer quand même. La ligne 🟠 0.2 était bien présente à l'ouverture. Cause probable, confirmée par le contenu du fichier : le point de reprise écrit en C2 (« compléter la section 13 puis envisager le passage à prêt ») préjuge du statut.
- ✅ C4 prompt 2 : modification proposée, validation demandée avant écriture, `draft` 0.2 → 0.3 après « Je valide… ».
- ✅ C4 prompt 3 (variante : « passe mon dossier en prêt » malgré les lacunes) : réserve (quatre lacunes), choix proposé, puis `ready` 1.0 avec entrée d'historique ; `current-status.md` conforme.
- ⚠️ D1 : non joué à part entière. L'opportunité 001 avait déjà été créée en C4 (source copiée, transcrite, `opportunity.md` rédigé) ; le testeur a choisi de garder cet état.
- ✅ D2 (variante « Oui, lance l'analyse ») : `analysis.md` trace « 2026-10-09 : dossier professionnel version 1.0 (prêt) », faits, hypothèses et écarts séparés, cinq messages stratégiques, aucune mise en garde. Messages : quatre validés, le cinquième déplacé dans « Retirés » sans raison précisée. Observation : le secteur régulé est classé en adéquation, pas en écart.
- ✅ E3 : « Bonjour Nadia. » puis « Dossier professionnel : 🟢 prêt (version 1.0). », reprise de Lumen Pay depuis les fichiers, point de reprise proposé sans choisir.

### C9 (workspace `-c9`, CV seul)

Préparation : B1, C1 et C2 en CV seul, deux prompts fusionnés (variante) ; dossier `draft` 0.2.

- ✅ Prompt 1 : ligne 🟠 0.2 ; opportunité `001-northwind-ledger-senior-software-engineer` créée sans refus ; offre copiée sous `sources/job-posting.pdf` (taille et date identiques, seul le nom normalisé a changé), transcription en anglais, `opportunity.md` en français ; retour au dossier recommandé, en gras.
- ✅ Prompt 2 (« Analyse-la quand même ») : pas de nouveau refus, résultat « moins fiable », dérogation consignée dans `current-status.md` de l'opportunité avec la version 0.2 et « en construction », passe tracée dans `analysis.md`.
- ✅ Prompt 3 (nouvelle conversation) : ligne 🟠, rappel exact de dérogation, reprise sans blocage.
- ✅ Prompt 5 : réserve, confirmation demandée (« 0.2 → 1.0 »), puis `ready` 1.0 avec historique ; la dérogation reste ouverte ; nouvelle passe proposée immédiatement.
- ✅ Prompt 6 (nouvelle conversation) : ligne 🟢 sans rappel, nouvelle passe proposée (oui / plus tard / non) ; « Pas maintenant » : dérogation toujours ouverte dans le fichier.
- ⚠️ Prompt 8 : reproposition à la reprise suivante, puis « Refais quand même une analyse avec mon dossier actuel » : seconde passe tracée « version 1.0 (prêt) », première passe et cinq messages conservés, « Dérogation close le 2026-10-09 » dans `current-status.md`. Le refus définitif (« n'est plus proposée ») dépend du prompt 7 et n'est pas jouable.
- Prompts 4 et 7 : **non joués** (reportés).

### C10 et C11 (workspace `-c10-c11`)

- ✅ C10, première variante (statut remplacé par « **Statut :** brouillon initial », dossier `ready` 1.0) : le coach signale « Ce n'est pas une valeur reconnue », relève l'incohérence avec la version et l'historique, ne l'interprète pas, propose `draft` en gardant 1.0, traite le dossier comme non prêt, attend l'accord. Après « garde en construction » : en-tête `draft (en construction)`, version 1.0 inchangée, entrée d'historique « correction du statut de l'en-tête (« brouillon initial », valeur invalide) → draft 1.0 (version inchangée). Validé par la candidate. », ligne « 🟠 en construction (version 1.0) ».
- C10, deuxième variante (ligne de statut supprimée) : **non jouée**.
- Préparation de C11 : en-tête remis à `ready (prêt)` 1.0 à la main, avec une ligne d'historique manuelle « draft 1.0 → ready 1.0 (remise en état pour le test C11) ».
- ✅ C11 prompt 1 (« J'envisage de me réorienter vers un poste de staff engineer… ») : ligne 🟢 après la salutation ; retour à « en construction » proposé sans rien appliquer ; version annoncée « de 1.0 à 1.1 », prochain « prêt » en 2.0 ; entrée d'historique annoncée. Après « Oui. Pour l'intitulé de la section 13, retiens "développeuse backend senior" » : en-tête `draft`, version **1.1**, entrée « ready 1.0 → draft 1.1 » avec raison et validation, intitulé en section 14 et retiré de la section 13.
- ✅ C11 prompt 2 (« On peut repasser le dossier en prêt. ») : réserve (cible staff non reformulée, banque d'exemples et messages récurrents vides, trois points ouverts), confirmation demandée avec « 2.0 ». Après « Oui, je confirme » : `ready (prêt)`, version **2.0** (et non 1.2), entrée « draft 1.1 → ready 2.0 » citant les réserves.
- Le coach n'a pas recopié « 1.0 » depuis l'exemple de `workspace/AGENTS.md`. Réserve de méthode : le point de reprise de l'espace anticipait déjà « version 2.0 » avant la confirmation, donc la valeur pourrait être lue au lieu d'être calculée.

### Écarts

**Moteur (skills et `workspace/AGENTS.md`)**

- 🐞 C4 prompt 1 : pas de refus bienveillant, travail demandé non nommé, jugement « insuffisant » figé par le point de reprise de C2 au lieu d'être refait à partir de l'en-tête.
- ⚠️ Mise en pause de Lumen Pay en C11 : le coach a demandé « Voulez-vous la laisser en pause pendant le remaniement ? », la candidate n'a pas répondu à cette question (son « Oui » portait sur le retour en construction), et la pause a été écrite dans `current-status.md` de l'opportunité et de l'espace. Sa « Prochaine action » est restée « Analyser l'adéquation avec l'offre (dossier professionnel prêt, version 1.0) ».
- ⚠️ C10 : le coach propose `ready` comme alternative à `draft` (« Si vous le confirmez, je mets "prêt" (ready) à la place. »). La règle écrite dit « jamais `ready` ». Avis du testeur : sans gravité, l'historique du dossier le justifie et la candidate décide ; **point à trancher au débrief**.
- Observations de forme (D-022, aucun correctif proposé) : « Le dérogation » (genre) et « à rouvrir » dans le message du prompt 5 de C9 ; nouvelle passe proposée dès la confirmation, avant la reprise ; aucune trace du report (« Pas maintenant ») dans le fichier de l'opportunité ; marqueur de clôture de la dérogation en phrase libre ; ordre de l'historique différent d'un workspace à l'autre (récent en tête dans `-c9`, en queue dans le principal) ; « candidat » générique dans les entrées d'historique, « candidate » ailleurs ; numéros de section cités à la candidate (13, 8, 15) ; plusieurs demandes dans le même message en C11 (accord, question d'influence, choix de méthode, pause) ; point de reprise de l'espace périmé après le passage à `ready` 2.0 ; ligne « Dossier professionnel : … » répétée en cours de message après une correction.

**Kit (scénario, sources, prompts)**

- C4 prompt 1 ambigu : « préparer une candidature » peut se lire comme une création d'opportunité ; l'attendu (refus nommant la préparation) n'est pas discriminant.
- C9 : la précondition « motivations et préférences vides » n'est pas satisfaite, le coach remplit les sections 9 et 10 à partir du CV ; la course à pied est rangée en section 15.
- C9 prompt 8 dépend du prompt 7 pour son attendu « n'est plus proposée ».
- D1 est impossible quand C4 a déjà créé l'opportunité 001 ; le prompt de D1 est à reformuler.
- C10 → C11 : la remise à `ready` à la main et la ligne d'historique manuelle ne sont pas décrites ; un second prompt de C11 peut être joué dans la même conversation.
- C11 : le point de reprise de l'espace peut déjà contenir « version 2.0 », ce qui affaiblit la vérification du calcul.

**Backlog**

- Préambule en anglais avant la ligne *Lancement de la session…* (déjà noté) ; deux phrases observées : « Step 2: check only existence of files, without reading them. » (C11) et un préambule analogue en E3.

## Notes pour l'automatisation

- **B1, E3, C9 prompts 1, 3 et 6, C11** : la ligne de statut et le rappel de dérogation se vérifient par une comparaison exacte de chaîne. Déterministe.
- **En-tête du dossier** (statut, version) après chaque étape : lecture du fichier, comparaison à la valeur attendue (0.2, 0.3, 1.0, 1.1, 2.0). Déterministe.
- **Historique** : une entrée de plus par changement de statut ou de version, avec date, avant, après. Déterministe ; la raison et la validation demandent un jugement.
- **`analysis.md` et `current-status.md` de l'opportunité** : présence de la version et du statut de la passe, de la dérogation et de sa clôture. Déterministe sur la présence, jugement sur la formulation libre de la clôture.
- **Refus bienveillant (C4 prompt 1)** : jugement. Critères possibles : absence de lancement de l'analyse, travail demandé nommé, possibilité de continuer annoncée.
- **Réserve en cas de lacunes (C4 prompt 3, C9 prompt 5, C11 prompt 2)** : jugement sur la pertinence des lacunes citées ; la présence d'une demande de confirmation est vérifiable.
- **C10** : le signalement sans interprétation et l'absence de `ready` proposé demandent un jugement ; l'absence d'écriture avant l'accord et la version inchangée sont vérifiables.
- **Pause de Lumen Pay et autres écritures de `current-status.md`** : comparer les fichiers avant et après chaque réponse pour détecter une écriture non demandée. Déterministe.
- **Version non recopiée de l'exemple** : vérifiable seulement si le point de reprise ne contient pas déjà la valeur attendue.

## Non testé

- Anglais : ligne de statut et rappel de dérogation, autres messages (ligne #9 dédiée).
- B2 (ligne ⚪ 0.1), D1 à part entière, E1, C3, C5 à C8.
- C9 prompts 4 et 7 (deuxième opportunité, refus définitif) ; « n'est plus proposée » du prompt 8.
- C10 deuxième variante (statut absent), version illisible, `empty` avec dossier rempli, `ready` en `0.x`.
- `ready` proposé par le coach, informations ajoutées avant validation, proposition refusée sans raison ; mises à jour courantes en `1.x` ; sources, entretien déjà passé et fiche de préparation sur un dossier non `ready`.
- Documentation (`docs/professional-profile.md`, glossaire, guides, D-010, `CHANGELOG.md`, exemple fictif).

## Suites

- Débrief dans la conversation d'analyse : écarts moteur (C4 prompt 1, pause non confirmée, `ready` proposé en C10) et choix de ne pas imposer `draft`.
- Correctifs proposés, non appliqués : (1) moteur, relire le statut dans l'en-tête avant de juger de la suffisance, sans se fier au point de reprise, et nommer le travail demandé dans le refus ; (2) moteur, n'écrire la pause d'une opportunité qu'après réponse explicite, et mettre à jour sa « Prochaine action » ; (3) kit, reformuler le prompt 1 de C4, décrire la remise à `ready` de C11, corriger les préconditions de C9 et D1.
- Lessons learned à rédiger au débrief (point de reprise qui préjuge d'un statut ; question posée dans un message traitée comme acceptée).
- Backlog : préambule en anglais (déjà noté), sans modification sans accord.
