# Préparation de la démonstration et des slides de MyCareer Workspace

## Objet du document

Ce document rassemble les enseignements et orientations pour préparer la présentation de **MyCareer Workspace** à l'équipe : slides et démonstration live. Il est volontairement séparé des décisions produit et techniques afin de pouvoir être repris dans une conversation ou une session de travail dédiée.

- **Base** : la démo commentée enregistrée le 2026-10-03 ([session](../test-history/2026-10-03-demo-enregistree-teams.md)), jouée en `0.4.0-dev` : environ 38 minutes de A1 à E1, 41 minutes avec la reprise, commentaires et apartés de test compris.
- **Version à démontrer** : v0.4.0 (2026-10-12). Depuis la démo enregistrée, elle a ajouté l'accueil et le prénom, le rappel de confidentialité, le statut et la version du dossier professionnel, le joker en simulation et le feedback produit local (voir `CHANGELOG.md`). Plusieurs écarts relevés pendant la démo ont été corrigés depuis (« dossier professionnel » au lieu de « profil professionnel », préparation distincte de la simulation, confirmation de chaque demande d'arrêt, une question à la fois).
- **Format retenu** : un live d'environ 20 minutes, première session jouée à l'avance, avec un script épuré et des prompts prêts à coller : [script live](mycareer-workspace-demo-live-script.md).
- **Scripts de référence** : le script de démo généré par le build depuis les étapes `[demo]` de `test-kit/scenario.md` (ZIP du kit de test), environ 45 minutes, reste la référence des tests ; le script live en est une version resserrée.

## 1. Diagnostic de la démo enregistrée

La démo a montré un parcours fonctionnel cohérent :

1. partir de sources dispersées ;
2. construire un dossier professionnel ;
3. créer et analyser une opportunité ;
4. définir des messages stratégiques ;
5. préparer un entretien ;
6. réaliser une simulation et un debrief ;
7. reprendre le travail plus tard sans perdre le contexte.

Le principal problème observé n'est pas le fond mais la focalisation de la présentation :

- trop de temps est consacré aux fichiers, dossiers, transcriptions et statuts ;
- les commentaires de test et notes de correction interrompent le récit, ce qui était normal dans une répétition individuelle ;
- la navigation et la pensée à voix haute ralentissent le rythme ;
- la valeur utilisateur est parfois expliquée après le mécanisme qui la produit ;
- le public risque de percevoir un outil technique de préparation d'entretien plutôt qu'un espace carrière persistant.

Le script de démo hérite en partie de ce biais : il est extrait du scénario maître, qui sert aussi aux tests. Certaines étapes enchaînent des gestes utiles au test plus qu'au récit, notamment D5 (deux jokers, un arrêt refusé, une note de feedback dictée, un arrêt confirmé). Pour la démo à l'équipe, il faut choisir ce qu'on en garde (section 7).

Principe retenu :

> La technique sert à répondre aux questions ; elle ne doit pas conduire la démonstration.

Même devant une équipe technique, l'objectif principal est de faire comprendre le fonctionnement, la valeur et les principes du produit. Les détails d'implémentation restent disponibles pour les questions-réponses.

## 2. Message central

La démonstration ne doit pas présenter uniquement un coach d'entretien.

Le produit transforme des sources, expériences et réflexions dispersées en un capital professionnel structuré, validé et réutilisable.

Le dossier professionnel est :

- la mémoire centrale de l'espace carrière ;
- la source de vérité validée par l'utilisateur ;
- le point de départ du travail sur les opportunités ;
- un actif vivant qui s'enrichit à mesure qu'il est utilisé.

Le message distinctif est :

> Le travail réalisé pour chaque opportunité n'est jamais perdu : il enrichit le dossier professionnel et bénéficie aux opportunités suivantes.

Cette boucle de capitalisation est plus importante que la technologie IA elle-même et doit être immédiatement visible dans la présentation.

### Point d'attention : la boucle n'est pas encore montrée par le script

Le coach sait capitaliser : le skill `interview-coach` propose des mises à jour durables du dossier, appliquées seulement après validation, et garde le contenu propre à une offre dans l'opportunité. Mais aucune étape `[demo]` ne le montre après le travail sur une opportunité : le seul enrichissement visible est en C4, **avant** la première opportunité (le découpage en six services ajouté au dossier). La retombée d'un debrief ou d'un entretien réel vers le dossier n'est ni dans le script, ni testée en tant que telle.

**Décision** : montrer la capitalisation dans le live, par un court moment après le debrief : « Qu'est-ce qui, dans ce travail, mérite d'entrer dans mon dossier professionnel ? », puis la validation de la proposition et l'historique du dossier.

Ce moment n'a jamais été joué. Il faut :

- le répéter pour voir ce que le coach propose réellement et l'effet sur la version du dossier : elle ne monte au plus qu'une fois par session, et dans le live elle vient de passer à 1.0 en C4 ;
- l'ajouter ensuite au scénario maître, avec ses attendus, comme étape `[demo]` qui cite ses exigences, dans un changement à part.

Si la répétition n'est pas concluante, repli : montrer C4 comme l'exemple d'enrichissement et présenter la boucle sur la slide comme le principe du produit, sans affirmer qu'on la voit en entier. Dans tous les cas, ne pas annoncer pendant le live un comportement qui n'est pas montré.

## 3. Structure générale proposée

La présentation peut rester courte avant le live :

1. slide de titre ;
2. slide sur la valeur et le problème résolu ;
3. slide sur le workflow et la boucle de capitalisation ;
4. slide de transition vers la démonstration : signal de bascule pour le présentateur et aide-mémoire du parcours pour les participants (exemple fictif, sept étapes) ;
5. démonstration live (hors deck) ;
6. slide finale sur les capacités actuelles, les limites et les évolutions envisagées ;
7. questions-réponses.

Le contenu exact des slides est dans le [brief de génération du deck](mycareer-workspace-deck-brief.md).

Il n'est pas nécessaire d'ajouter de nombreuses slides explicatives avant la démonstration. Leur rôle est uniquement d'installer le bon modèle mental.

## 4. Slide de titre

### Titre

**MyCareer Workspace** (nom officiel, D-017 ; le logo est dans `docs/assets/brand/`).

### Sous-titre possible

> Un espace carrière personnel pour construire et exploiter son dossier professionnel dans la durée.

La formulation reprend celle de l'accueil du coach (« Cet espace vous permet de construire et d'enrichir votre dossier professionnel, puis de l'exploiter au fil de vos opportunités et de vos entretiens. »). Elle doit mettre l'accent sur la finalité utilisateur et non sur l'IA ou l'implémentation.

## 5. Slide sur la valeur du produit

### Problème utilisateur

Dans une recherche d'emploi traditionnelle, le candidat :

- disperse ses informations entre CV, LinkedIn, notes et souvenirs ;
- repart en partie de zéro pour chaque opportunité ;
- prépare les entretiens de manière isolée ;
- reformule plusieurs fois les mêmes expériences ;
- perd une partie du travail et des apprentissages produits au fil des préparations.

### Réponse proposée

> Construire un dossier professionnel vivant, puis l'exploiter et l'enrichir au fil des opportunités et des entretiens.

Les bénéfices à mettre en avant sont :

- mémoire professionnelle persistante, portée par les fichiers et non par la conversation ;
- capitalisation dans la durée ;
- coaching contextualisé, qui fait réfléchir plutôt que de répondre à la place ;
- contrôle et validation par l'utilisateur, qui décide notamment quand son dossier est prêt ;
- continuité entre opportunités et entretiens ;
- confidentialité : données locales, pas de navigation web sans accord explicite ;
- pérennité : les données de l'utilisateur sont séparées du moteur, qui peut évoluer sans les toucher ;
- traçabilité des informations et décisions importantes.

## 6. Slide sur le workflow et la boucle de capitalisation

Le schéma ne doit pas être présenté comme un pipeline qui se termine après un entretien.

Le dossier professionnel doit être visuellement placé au centre et la rétroaction doit être explicite.

### Représentation conceptuelle

```text
Sources
CV, LinkedIn, certifications,
notes, réalisations, échanges
             │
             ▼
┌────────────────────────────┐
│   Dossier professionnel    │
│ mémoire et source de vérité│
│   en construction → prêt   │
└────────────────────────────┘
             │
             ▼
       Opportunités
             │
             ▼
 Analyse et positionnement
             │
             ▼
 Préparation des entretiens
             │
             ▼
 Simulations, entretiens réels
         et debriefs
             │
             ▼
 Capitalisation des acquis
 messages validés, exemples,
 réalisations et apprentissages
             │
             └───────────────↺
        Dossier professionnel enrichi
```

Le statut du dossier (en construction, prêt) peut figurer dans le bloc central : il matérialise que le travail sur les opportunités part d'un dossier que l'utilisateur a jugé suffisant, et que ce seuil est décidé ensemble, pas un état final.

### Message oral associé

> Le dossier professionnel est à la fois le point de départ et le résultat du processus. Chaque préparation permet de préciser des expériences, de valider des messages et de documenter de nouveaux exemples qui seront réutilisables par la suite.

Le live le montre deux fois : en C4, un fait apporté en conversation entre dans le dossier ; après le debrief, le moment de capitalisation (section 2).

### Capacités futures

Les capacités futures doivent apparaître comme des usages dérivés du dossier professionnel, sans détourner l'attention du cœur du système :

- génération de CV ciblés ;
- génération de lettres de motivation adaptées.

Elles peuvent être représentées comme des branches futures partant du dossier professionnel ou d'une opportunité, et non comme la finalité principale du workflow. Elles sont dans le backlog, pas encore dans une release.

## 7. Démonstration live recentrée (environ 20 minutes)

Le détail, avec les prompts prêts à coller, est dans le [script live](mycareer-workspace-demo-live-script.md).

### Format

Le script de démo v0.4.0 compte 13 étapes pour 45 minutes indicatives. Pour viser 20 minutes :

- **préparé à l'avance** : extraction et première session (A1, B1) sont jouées avant la séance ; une copie du workspace vierge permet de repartir du même état à chaque répétition ;
- **une seule conversation en live**, celle de la première session, laissée ouverte, le démarrage d'une session prenant du temps ; la seule nouvelle conversation montrée est la reprise finale, qui est justement la preuve de continuité ;
- **initialisation du dossier en live** (C1, C2) : c'est le point de départ de la boucle, il doit être vu ;
- **prompts collés**, jamais tapés ;
- **étapes regroupées ou allégées** : création de l'opportunité et offre en un seul prompt, D3 et D4 enchaînés, D5 réduite aux deux jokers sur la même question, puis l'arrêt, fiche de préparation (D11) jouée sans D7 à D10 ;
- **E1 retirée** : la reprise ne porte que sur Lumen Pay ;
- **capitalisation ajoutée** après le debrief (section 2).

| Temps | Séquence | Étapes | Durée estimée |
| --- | --- | --- | --- |
| 0:00 | Le contexte : Nadia, exemple fictif | état après B1 | 1 min |
| 1:00 | Initialiser le dossier avec les documents | C1 | 4 min |
| 5:00 | Valider le dossier | C2 | 2 min |
| 7:00 | Le dossier devient « prêt » | C4 | 3 min |
| 10:00 | Une opportunité | D1 | 2 min |
| 12:00 | Analyse et messages stratégiques | D2 | 3 min |
| 15:00 | Préparer l'entretien technique | D3, D4 | 3 min |
| 18:00 | Simulation : les deux jokers | D5 réduite | 2 min |
| 20:00 | Debrief | D6 | 1 min |
| 21:00 | Fiche de préparation à emporter | D11 | 2 min |
| 23:00 | Capitalisation | nouvelle | 1 min 30 |
| 24:30 | Reprise dans une nouvelle conversation | E3 | 2 min |
| | **Total** | | **~26 min** |

Ces durées sont des estimations : elles dépendent surtout du temps de réponse du coach, à mesurer en répétition. Avec l'initialisation en live et la fiche de préparation, le déroulé complet atteint environ 26 minutes ; le script live liste des raccourcis pour y revenir. C4 dans la même conversation, les prompts regroupés, la simulation réduite et la capitalisation s'écartent du scénario testé : à valider en répétition.

### Ouverture — Un exemple fictif

Dire d'emblée que tout ce qui est montré utilise **Nadia Berkani, une candidate fictive** du kit de test : CV, export LinkedIn, certificat et notes personnelles inventés, aucune donnée réelle. Cela évite toute ambiguïté sur des informations personnelles visibles à l'écran, et rappelle une règle du projet.

Remonter brièvement l'accueil de la première session, déjà jouée, et le rappel de confidentialité. Une phrase suffit sur la séparation entre les données de Nadia (`data/`) et le moteur, qu'une nouvelle version peut remplacer sans toucher aux données (section 8).

### Acte 1 — Construire le dossier, source de vérité (C1, C2, C4)

Montrer :

- le dépôt des documents (CV, export LinkedIn, certificat, notes personnelles) ;
- les informations extraites, les contradictions et les points à trancher ;
- la validation par l'utilisateur, avec une exception (« sauf mon salaire actuel ») ;
- le dossier obtenu, encore « en construction » ;
- la demande de préparation trop tôt : le coach explique pourquoi elle serait moins fiable, sans bloquer par principe ;
- un fait apporté dans la conversation (« c'est moi qui ai conçu le découpage en six services ») proposé, puis ajouté au dossier ;
- le passage à « prêt » (version 1.0), d'un commun accord.

Message à faire passer :

> Le système ne se contente pas de résumer des documents. Il confronte les sources et demande à l'utilisateur de valider ce qui devient sa mémoire professionnelle. C'est l'utilisateur qui décide quand ce dossier est assez solide pour travailler ses opportunités.

À ne pas détailler spontanément : chaque fichier généré, l'arborescence, la mécanique de transcription (une transcription ouverte suffit), chaque changement de statut interne.

### Acte 2 — Exploiter le dossier pour une opportunité (D1, D2)

Montrer :

- l'ajout d'une offre (Lumen Pay) : le coach crée la structure lui-même ;
- la comparaison avec le dossier professionnel : correspondances, écarts, risques et points à clarifier ;
- la proposition de messages stratégiques ;
- la validation, et le retrait d'un message (« il ne me ressemble pas ») conservé avec sa raison.

Message à faire passer :

> Le positionnement n'est pas généré comme une vérité à accepter. Il est proposé, challengé et validé afin que la personne puisse réellement le défendre.

Ce passage constitue l'un des éléments les plus différenciants de la démonstration.

### Acte 3 — Préparer un entretien (D3 à D6)

Montrer de manière sélective :

- les thèmes probables de l'entretien technique et les points de vigilance de Nadia, par exemple dire « je » plutôt que « on », sans mener l'échange au bout ;
- une simulation courte réduite aux deux jokers sur la même question : le conseil, puis la réponse proposée, puis « stop » confirmé ;
- le debrief, surtout pour le traitement des jokers : comptés, et la réponse proposée non évaluée comme celle de Nadia.

Annoncer que l'enchaînement des deux jokers est un raccourci de démo, pas l'usage prévu : le coach est là pour faire réfléchir, pas pour répondre à la place ; le joker est une aide ponctuelle quand on est vraiment coincé, et la réponse proposée est la seule exception, assumée et tracée, à ce principe. L'arrêt refusé puis repris et la note de feedback dictée en pleine simulation sont des cas de test : à garder pour les questions-réponses.

Sans réponse de Nadia dans la simulation, le debrief a peu de matière : la qualité du retour est surtout montrée pendant la préparation (D4). L'objectif n'est pas de jouer un entretien complet mais de démontrer l'adaptation au poste et à la personne.

### Acte 4 — Repartir avec sa fiche de préparation (D11)

Générer la fiche de préparation de l'entretien technique et l'ouvrir : c'est l'aide-mémoire du candidat juste avant et pendant l'entretien, et le livrable le plus concret du produit. Montrer la première page autonome, qu'on peut remettre aux interlocuteurs, la page de notes, puis le détail avec les points de vigilance personnels. Tout y vient de ce qui a été validé (positionnement, messages stratégiques, questions probables, améliorations issues des debriefs), sans fait nouveau.

Limite à assumer : la fiche est conçue pour être imprimée, mais il n'y a pas encore d'export PDF ; on montre l'aperçu Markdown et on présente l'export comme une évolution envisagée, sans date. Dans le live, les questions à poser n'ont pas été travaillées (D7 à D10 non jouées) ; leurs sections sont vides et le coach n'invente rien. Le statut de l'étape reste « en préparation ».

### Acte 5 — Capitaliser

Demander au coach ce qui, dans ce travail, mérite d'entrer dans le dossier, valider sa proposition, montrer l'historique du dossier. C'est le moment où la boucle de la slide devient visible : ce qui est durable va au dossier, ce qui est propre à Lumen Pay reste dans l'opportunité.

### Acte 6 — Démontrer la continuité (E3)

Terminer par une reprise dans une **nouvelle conversation** :

> Bonjour, j'aimerais reprendre.

Montrer que le coach retrouve le statut du dossier, l'opportunité active, les messages validés, le point à retravailler et la prochaine action, sans choisir à la place de la candidate.

Ce passage matérialise la promesse de mémoire persistante (« l'espace carrière porte le contexte, pas la conversation ») et constitue une bonne conclusion fonctionnelle. La reprise jouée hors script le 2026-10-03 a été jugée « courte et parlante ».

## 8. Ce qui doit rester pour les questions-réponses

Les sujets suivants peuvent être préparés mais ne doivent pas conduire le live :

- choix du Markdown et des fichiers plutôt qu'une base ;
- séparation du moteur et des données (`data/`), structure des dossiers, et ce qu'elle prépare pour les mises à jour (voir ci-dessous) ;
- fichiers de statut et reprise ;
- fonctionnement des skills, instructions du coach traitées comme du code source ;
- orchestration par l'agent, outil et modèle utilisés pour la démo ;
- fonctionnement local et confidentialité, navigation web désactivée par défaut (D-003) ;
- statut et version du dossier, dérogation quand on insiste avec un dossier non prêt (D-010) ;
- joker et principe « coach, pas générateur de réponses » (D-020) ;
- feedback produit local pendant le pilote, anonymisé et jamais envoyé automatiquement (D-023) ;
- versionnement Git ;
- traçabilité technique ;
- kit de test fictif, scénario maître commun aux tests et à la démo, skill `/prompteur` pour les passes manuelles ;
- difficultés pour faire dire ou faire au coach précisément ce qu'on veut (`docs/lessons-learned.md`, D-022) ;
- limites connues ;
- alternatives comme SQLite ou une architecture hybride.

### Mise à jour du moteur et persistance des données

Point fort à faire valoir, une phrase dans le live (ouverture) et le détail en questions-réponses :

- toutes les données de l'utilisateur vivent sous `data/` ; le moteur (instructions, skills, modèles, README) est à part (D-004) ;
- dans le ZIP, `data/` ne contient que des `README.md` : copier une nouvelle version par-dessus un espace existant remplace le moteur sans toucher au dossier, aux opportunités ni aux autres données ; le build échoue si cette séparation n'est pas respectée ;
- les fichiers obligatoires sont créés depuis des modèles, sans jamais écraser un fichier existant, et une clé de configuration ajoutée par une nouvelle version est complétée avec sa valeur par défaut ;
- la v0.4.0 livre déjà un marqueur `ENGINE-VERSION` à la racine du workspace.

Ce qui reste à faire (issue #7, prévue en v0.5.0, avec l'intégration de Git local, #6) : la procédure documentée de mise à jour, la détection de la mise à jour par le coach, le nettoyage des fichiers du moteur devenus obsolètes et les migrations éventuelles. D-004 demande de tester réellement la mise à jour et le retour arrière avant de les présenter comme une garantie : dire « conçu pour », pas « garanti ».

### Slides cachées

Une ou deux slides techniques cachées peuvent être ajoutées après la fin du deck pour répondre à des questions précises, sans être présentées spontanément. Candidats naturels : l'arborescence moteur / `data/`, et la boucle « issue → scénarios → plan → implémentation → revue → tests manuels ».

## 9. Slide finale

La slide finale peut distinguer :

### Capacités livrées (v0.4.0)

- dossier professionnel vivant, avec statut et version décidés avec l'utilisateur ;
- sources transcrites et validées avant d'entrer dans le dossier ;
- gestion de plusieurs opportunités, y compris dans une autre langue ;
- analyse et messages stratégiques validés ;
- préparation d'entretiens, fiche de préparation ;
- simulations (trois profondeurs, arrêt anticipé, joker) et debriefs ;
- retour après un entretien réel ;
- reprise du contexte dans une nouvelle conversation ;
- confidentialité : local, pas de navigation web sans accord ;
- données séparées du moteur, prêtes pour des mises à jour qui ne les touchent pas ;
- capitalisation contrôlée vers le dossier.

### Limites à expliciter

À choisir parmi les suivantes, avec un niveau de détail proportionné à l'audience. Elles ne doivent pas être masquées.

- Pas encore de pilote réel : le produit a été testé sur un candidat fictif.
- Le comportement dépend du modèle et de la formulation des instructions ; il est vérifié par des passes manuelles, pas encore par des tests automatisés.
- Lenteur de certaines opérations sur les fichiers et de la lecture des PDF (#16).
- Usage confortable seulement avec un mode d'autorisation automatique de l'outil IA, sinon chaque écriture de fichier demande une confirmation.
- Pas encore d'entretien guidé pour compléter le dossier sans sources (#10), de pause dans une simulation (#3), ni d'intégration Git par le coach (#6).
- Mise à jour du moteur préparée mais pas encore outillée : procédure, détection par le coach et migrations à venir (#7).

### Évolutions envisagées

- CV ciblés par opportunité ;
- lettres de motivation adaptées ;
- entretien d'initialisation du dossier ;
- mise à jour guidée du moteur, avec historique Git local ;
- accompagnement de carrière au-delà d'une recherche d'emploi ponctuelle ;
- développement et suivi des compétences.

Il est préférable de parler d'« évolutions envisagées » plutôt que de présenter une roadmap ferme tant que les priorités ne sont pas stabilisées.

## 10. Principes de présentation

- Montrer la valeur avant l'implémentation.
- Montrer le résultat avant de détailler comment il est produit.
- Limiter la navigation exploratoire et préparer les écrans ou checkpoints.
- Éviter les explications anticipées de questions que le public n'a pas encore posées.
- Réserver les commentaires de test et les anomalies à une prise de notes séparée.
- Utiliser des transitions qui rappellent le message à retenir.
- Ne pas chercher à démontrer toutes les fonctionnalités.
- Préférer un parcours court, cohérent et mémorable.
- Ne rien affirmer pendant le live que la démo ne montre pas.

## 11. Préparation pratique

### Avant la séance

- Préparer le workspace selon le [script live](mycareer-workspace-demo-live-script.md) : v0.4.0 extraite hors du dépôt, suffixée `-demo` et datée (convention de A1), copie du workspace vierge, première session (B1) jouée dans la conversation du live, laissée ouverte.
- Régler l'outil en mode d'autorisation automatique pour éviter les confirmations d'écriture en direct (voir le guide utilisateur).
- Choisir et noter le modèle utilisé : la passe rapide du 2026-10-11 a été jouée avec Claude Sonnet 5.5.
- Garder les quatre fichiers du profil et l'offre Lumen Pay prêts à glisser-déposer et le script live ouvert pour copier les prompts.
- Vérifier que le micro et le partage d'écran fonctionnent ; un appel Teams en cours n'empêche pas d'utiliser le micro de Claude (vérifié le 2026-10-03).

### Points de repli

- Préparer en répétition des copies du workspace à des états clés (workspace vierge, après C4, après D2, après D6) pour sauter une étape en cas de lenteur ou de comportement inattendu.
- Garder les workspaces des passes précédentes (sous `C:\Temp\`) comme réserve, après avoir vérifié leur version.
- `examples/fictitious-developer/data/` date du premier déroulé complet (2026-10-02), avant la v0.4.0 : son dossier n'a pas de statut. Ne pas l'utiliser comme repli sans vérification.
- Prévoir une phrase de transition si le coach s'écarte (par exemple « c'est précisément ce que les tests manuels servent à rattraper »), puis passer au point de repli suivant.

## 12. Travail restant

1. Répéter le script live et le chronométrer, par exemple avec la transcription Teams comme le 2026-10-03, en vérifiant en priorité les points marqués ⚠️ : C4 dans la même conversation, prompt regroupé de D1, simulation réduite aux jokers, fiche de préparation sans D7 à D10, capitalisation.
2. Ajuster le script live d'après la répétition, et préparer les copies de workspace de repli.
3. Ajouter ensuite la capitalisation, et éventuellement la fiche de préparation (D11, aujourd'hui `[socle]`), au scénario maître et aux exigences (changement à part). Évoquer l'export PDF de la fiche comme évolution envisagée, sans date.
4. Finaliser les textes des slides de titre, de valeur, de workflow et de transition (voir le brief du deck).
5. Concevoir visuellement la boucle de rétroaction vers le dossier professionnel.
6. Choisir les limites présentées sur la slide finale.
7. Préparer les éventuelles slides techniques cachées pour les questions-réponses, dont la séparation moteur / données.
8. Vérifier que chaque séquence démontre un bénéfice utilisateur identifiable.

## 13. Synthèse

La démonstration doit faire comprendre que **MyCareer Workspace** n'est pas seulement un coach d'entretien ni une collection de fichiers pilotée par une IA.

C'est un espace carrière personnel dans lequel le travail effectué au fil des opportunités consolide un dossier professionnel vivant.

La présentation doit donc être structurée autour d'un cercle vertueux :

> sources → dossier professionnel → opportunités → préparation → entretiens et debriefs → capitalisation → dossier professionnel enrichi.

Les détails techniques restent importants pour une audience d'ingénieurs, mais ils doivent intervenir à la demande, principalement pendant les questions-réponses.
