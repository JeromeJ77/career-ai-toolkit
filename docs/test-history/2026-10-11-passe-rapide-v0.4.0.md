# 2026-10-11 — Passe rapide avant la v0.4.0 (mode prompteur)

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Jérôme Jurbert (auteur), qui joue le coach dans une fenêtre VS Code ouverte sur le workspace de test. Claude Code (Sonnet 5.5) tient le rôle de prompteur : il donne les éléments un par un, lit les fichiers du workspace et les traces du coach, et consigne. Les verdicts « ok » sont ceux du testeur ; les vérifications de fichiers et de traces sont celles du prompteur.
- **Plan joué** : `plans/v0.4.0-passe-rapide.md` (P0 à P14, plan ignoré par Git), attendus détaillés dans `test-kit/scenario.md`. Notes brutes : `plans/v0.4.0-passe-rapide-notes.md` (ignoré par Git).
- **Version** : `0.4.0-dev` (`ENGINE-VERSION` lu dans le workspace). Commit : `affa1f0`. `build.bat` et l'extraction ont été faits par le testeur avant la passe, non rejoués par le prompteur.
- **Outil et modèle du coach** : Claude Code, Claude Sonnet 5.5 (confirmé par le testeur et par le fichier de feedback généré).
- **Mode d'autorisation du coach** : **Auto** (choix du testeur, pour aller plus vite). Conséquence : les demandes d'autorisation sur le journal du feedback produit (point ouvert de #17) **n'ont pas été observées**. Aucune demande n'a donc été relevée. À couvrir par un test ciblé sans autorisation automatique. Le testeur note que le pilote devra pouvoir utiliser les mêmes autorisations, sinon l'usage devient insupportable.
- **Données** : kit de test fictif. Workspace `C:\Temp\mycareer\Test-2026-10-11-non-reg\mycareer-workspace-non-reg` (sous-répertoire du répertoire de test, nom hors convention A1). Cinq conversations du coach (traces du répertoire `C--Temp-mycareer-Test-2026-10-11-non-reg-mycareer-workspace-non-reg`) : `4699fafe` (P1), `d1a26157` (P2 à P4), `3d85e809` (P5), `4a44fed9` (P6 à P12), `c01338cd` (P13).
- **Langue de coaching** : français uniquement.
- **Heures** : début 21:07, fin 22:25, soit **1 h 18 min**. Aucune pause relevée, donc aucune déduite. Les horodatages écrits par le coach (journal du feedback produit 21:46 à 22:05, fiche de préparation 22:13, feedback 22:22) sont fiables ; les heures des premières lignes des notes de travail étaient estimées et ne sont pas reprises ici. Pas de durée par étape.
- **Périmètre** : socle d'un pilote francophone sur une installation neuve : A1 (contenu du ZIP), B1, B2, C1, C2, C4, D1 à D6, D11, F1 (prompt 2 seulement). Tout le reste (anglais, étapes `[todo]`, D7 à D10, D12, F1 prompts 1, 3, 4 et 5, E1 à E5) est « non joué » et n'est déduit d'aucun résultat.
- **Écarts au scénario, voulus** : pas de D7 ni de D10 (la statistique de jokers ne porte que sur D5 ; la fiche de D11 est générée sans questions à poser) ; première variante seulement de la note de feedback en D4 ; prompts de B1, C4 et F1 adaptés par le testeur (« Oui, appelez-moi Nadia » ; « Oui, passe en prêt, on complétera ensuite » ; « Celle-ci est sans intérêt »).

## Résultats

Verdict d'ensemble : toutes les étapes jouées sont conformes sur le fond, avec les écarts ci-dessous (aucun ne bloque). Aucune ligne n'est passée en échec par le testeur.

| Élément | Verdict | Remarque |
|---|---|---|
| P0 : ZIP (racine unique `mycareer-workspace/`, `data/` limité à 15 `README.md`, `ENGINE-VERSION` = `0.4.0-dev`) | Conforme | Vérifié sur l'extraction par le prompteur. |
| P1 : B1 (2 prompts) | Conforme | Seul le contrôle de première session précède l'accueil (trace). `workspace.yaml` : prénom, `user_id` de 8 caractères ; journal sans entrée ; pas de `pilot-feedback.md`. |
| P2 : B2 | Conforme | Ligne « Dossier professionnel : ⚪ vide (version 0.1). », aucune écriture. |
| P3 : C1 (2 prompts) | Conforme, 2 réserves | Originaux identiques octet à octet, transcriptions avec en-tête, URL LinkedIn dans `external-references.md`, dossier encore vide. Points flous partiels ; livret listé hors workspace. |
| P4 : C2 | Conforme | Dossier `draft` 0.2, sans salaire, historique à jour. |
| P5 : C4 (3 prompts) | Conforme | Refus bienveillant branche « insuffisant », aucune opportunité créée ; ajout proposé puis appliqué (0.3) ; `ready` 1.0 après réserve et confirmation. |
| P6 : D1 (2 prompts) | Conforme | `001-lumen-pay-senior-backend-developer/` avec `opportunity.md`, `current-status.md`, `sources/` (offre identique et transcription), sans analyse d'adéquation. |
| P7 : D2 (2 prompts) | Conforme, 1 réserve | Passe tracée (1.0, prêt), message retiré conservé. Le secteur régulé (ACPR) n'est pas posé comme écart. |
| P8 : D3 | Conforme | Deux tours, rien créé à vide. |
| P9 : D4 + première variante de note | Conforme, 1 réserve | Coach sans jeu de rôle ; note : « *Note de retour produit prise en compte.* », reprise de la préparation, entrée « explicite » au texte brut. Résultat « −40 % » sans valeur de départ non relevé. |
| P10 : D5 (dix gestes) | Conforme, 3 écarts mineurs | Voir écarts. Journal : quatre entrées attendues, rien pour le « stop » refusé ; `transcript.md` sans la note. |
| P11 : D6 | Conforme, 1 remarque | « Jokers : 2 (1 conseil, 1 réponse proposée) », réponse proposée non évaluée. |
| P12 : D11 (2 prompts) | Conforme, 1 réserve | Absence de questions à poser signalée, fiche générée avec sections vides ; structure en trois parties conforme. Voir écarts. |
| P13 : F1 prompt 2 | Conforme, 2 remarques | Revue de la seule entrée silencieuse, écartée ; trois réponses ; statistique acceptée ; remplacements listés dans le chat, anonymisation non garantie. |
| P14 : contrôle du feedback et du journal | Conforme | Voir ci-dessous. |

### Contrôle du feedback (P14)

- `feedback-79042317-2026-10-11.md` : identifiant (= `workspace.yaml`), version `0.4.0-dev` (= `ENGINE-VERSION`), date, « Claude Code, Claude Sonnet 5.5 », « français (fr-FR) », 1 opportunité et 2 entretiens (= relevé avant F1), trois réponses mot pour mot, deux notes anonymisées (« [Entreprise A] », « [Personne 1] », « [chemin local] »), statistique des jokers : 1 simulation, 1 conseil, 1 réponse proposée (les deux jokers de D5, et eux seuls). Nadia, Karim, Lumen Pay et le chemin local : aucune occurrence ; l'entrée d'arrêt écartée absente.
- Journal comparé à la copie faite avant F1 : seul l'état a changé, les cinq entrées sont passées de « non traitée » à « traitée » (l'entrée écartée comprise, conformément au scénario). Aucune date d'envoi consignée dans `current-status.md`.

## Écarts relevés

Aucune correction n'est proposée ici : ils sont débriefés dans la conversation d'analyse.

1. **Narration intermédiaire en anglais** avant la réponse finale (P2, P5, P6, P13), par exemple « Not a first session. Reading the config, status and profile header. » (récurrent, déjà au backlog depuis la session du 2026-10-09).
2. **P3 (C1)** : points flous incomplets (rôle exact sur la migration et niveau de React non posés comme à trancher) ; le coach cite un livret « dans le même dossier source » absent du workspace, qui est dans le dossier du kit d'où venaient les pièces jointes (artefact du test).
3. **P7 (D2)** : le secteur régulé (ACPR) non pratiqué n'est pas posé comme écart, seulement « à vérifier ».
4. **P10 (D5)** :
   - Premier message de la simulation : les mots-clés d'arrêt et le joker ne sont pas rappelés avant l'entrée en rôle (« Dès votre réponse, je rappelle les règles ») ; question supplémentaire sur la langue. Le rappel vient au message suivant.
   - Réponse proposée (joker) longue ; elle cite un « cache de type Redis » absent du dossier, non listé dans la ligne « Supposé faute d'information ».
   - Arrêt avec raison : le prompt de D5 (« Non, finalement, je veux terminer l'entretien : … ») ne contient pas de mot-clé d'arrêt, ce qui est voulu (une demande d'arrêt claire sans mot-clé doit recevoir la même confirmation). Joué avec « stop. » en tête : ce cas sans mot-clé n'a donc pas été vérifié. La demande de confirmation est dans la trace. Le premier tour de l'interviewer, très long, est la source de la note de feedback dictée en simulation.
   - Observation (point ouvert de #17) : la commande PowerShell d'ajout au journal contient un `[IO.File]::ReadAllBytes` pour tester le saut de ligne final, sans exploiter le contenu ; aucune autre lecture du journal avant l'ajout.
5. **P11 (D6)** : dans le chat, « Les questions des interviewers y seront plus brèves, puisque c'est la raison de votre arrêt » interprète la raison d'arrêt, alors que `debrief.md` dit qu'elle n'est pas interprétée. Les questions de fin du candidat n'ont pas été redemandées.
6. **P12 (D11)** :
   - Statut non passé à « prête pour l'entretien » (`interview.md` : « en préparation » ; `current-status.md` : phase « préparation de l'entretien technique »). Comportement cohérent, le coach proposant de retravailler le cas d'architecture. Aucune consigne du coach ne définit ce statut : l'attendu de D11 dans `test-kit/scenario.md` a été corrigé au débrief.
   - Le coach annonce n'avoir pas généré de PDF ; mention d'un prénom (« Julien ») non vérifiée dans le dossier.
7. **P13 (F1)** : les trois questions sont posées en même temps que la revue de l'entrée silencieuse ; elles pourraient attendre (reposées ensuite, acceptable ; à raffiner).

## Écarts écartés à la relecture

Relus le 2026-10-11 contre les consignes du coach, ils sont conformes :

- **Lectures avant l'accueil en B1** : le coach lit `skills/init-workspace/SKILL.md` et `AGENTS.md`, teste l'existence de `data/current-status.md` et du dossier professionnel, et liste `data/opportunities` avant l'accueil. C'est exactement le contrôle de première session (`skills/init-workspace/SKILL.md`, détection d'une perte possible) ; les deux autres lectures sont des consignes, pas des données.
- **« Pitch : repères » en première page de la fiche** : prévu par les consignes de la fiche (« pitch cues, not a script ») ; ce que #12 a retiré de la première page, ce sont les points de vigilance et les rappels de communication, présents ici à partir de la troisième page.

## Demandes d'autorisation observées

Aucune : la passe a été jouée en mode Auto (voir l'en-tête). Le point ouvert de #17 sur les demandes d'autorisation pour l'ajout au journal reste à tester en mode par défaut.

## Non joué ou non vérifié

- Mode d'autorisation par défaut (test ciblé à faire).
- Anglais, D7 à D10, D12, E1 à E5, F1 prompts 1, 3, 4 et 5.
- Joker annulé, « suggested improvement: », entrées silencieuses hors jokers et raison d'arrêt (allers-retours, copie, instruction mal comprise).
- Refus de la statistique des jokers en F1.
- Ordre écriture du fichier de feedback / passage à « traitée » : non vérifié dans la trace.
- Question 2 du coach en C4 (conçu seule ou avec d'autres) restée sans réponse du testeur.

## Suites à donner

- Écarts restants : mineurs, aucun ne bloque la release ; à traiter après la v0.4.0. Le plus sérieux est le fait non signalé comme supposé dans la réponse proposée par le joker (cache Redis).
- `test-kit/scenario.md` : passage à « prête pour l'entretien » retiré de l'attendu de D11 (fait au débrief).
- Guides utilisateur : indiquer le mode d'autorisation à choisir (décidé au débrief du 2026-10-11). Le test ciblé en mode par défaut reste utile, sans bloquer la release.
