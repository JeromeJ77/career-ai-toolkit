# 2026-10-03 — Démo commentée enregistrée avec la transcription Teams (issue #12)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit, seul, en démo commentée à voix haute pendant un appel Teams, avec transcription Teams activée (pas d'assistant scribe).
- **Version** : `0.4.0-dev`, build du working tree après la relecture du script de démo (11 étapes, 39 min prévues) ; workspace neuf extrait du ZIP.
- **Données** : kit de test fictif uniquement (`test-kit/`).
- **Périmètre** : script de démo (A1, B1, C1, C2, D1 à D6, E1), puis une reprise dans une nouvelle conversation, hors script. Non joués : D7 à D11 (hors script de démo, trop longs pour une démo), étapes `[todo]`.
- **Trace** : transcription Teams (VTT) de la démo, commentaires et remarques en aparté du testeur compris, complétée après coup par le testeur sur D5 et E1. Les heures sont le temps écoulé depuis le début de l'enregistrement, lues dans la transcription ; les bornes d'étape sont repérées par les propos du testeur, à la minute près. Le testeur a aussi vérifié qu'un appel Teams en cours n'empêche pas d'utiliser le micro de Claude.

## Vue d'ensemble

| Étape | Verdict | Début | Fin | Durée | Prévu | Conversation |
| --- | --- | --- | --- | --- | --- | --- |
| A1 + B1 Ouvrir le workspace, première session | ✅ OK | 00:00:07 | ~00:03 | ~3 min | 4 min | nouvelle |
| C1 Sources jointes et transcrites | ✅ OK | ~00:03 | ~00:07 | ~4 min | — | suite de B1 |
| C2 Validation du dossier | ✅ OK | ~00:07 | ~00:09:40 | ~3 min | — | suite de B1 |
| D1 Créer l'opportunité | ✅ OK | ~00:09:40 | ~00:13 | ~3 min 30 s | — | suite de B1 |
| D2 Préparer l'opportunité | ✅ OK | ~00:13 | ~00:17 | ~4 min | — | suite de B1 |
| D3 Étapes d'entretien | ✅ OK | ~00:17 | ~00:20:50 | ~4 min | — | suite de B1 |
| D4 Préparer l'entretien ensemble | ⚠️ Écart | ~00:20:50 | ~00:24:30 | ~4 min | — | suite de B1 |
| D5 Simulation courte et arrêt | ⚠️ Écart | ~00:24:30 | ~00:30:50 | ~6 min | 8 min | suite de B1 |
| D6 Debrief | ✅ OK | ~00:30:50 | ~00:33 | ~2 min 30 s | — | suite de B1 |
| E1 Deuxième opportunité | ✅ OK | ~00:33 | ~00:38:20 | ~5 min | — | même conversation (testeur hésitant) |
| Reprise après une pause (hors script) | ✅ OK, petit écart | ~00:38:20 | 00:41:30 | ~3 min | hors démo | nouvelle |

Le minutage par étape n'est pas comparé aux durées prévues étape par étape : les bornes ne sont repérées qu'à la minute près, et le testeur commentait en continu.

**Durée de la démo** : environ 38 minutes de A1 à la fin de E1 (00:00:07 à ~00:38:20), commentaires compris, pour 39 minutes prévues ; environ 41 minutes avec la reprise ajoutée. Première démo enchaînée dans la cible de 35 à 40 minutes.

## Détail par étape

**A1, B1** — ✅ OK. Workspace décompressé depuis la dernière version, ouvert dans Claude ; au démarrage, le coach crée les fichiers à partir des modèles (`current-status.md`, `workspace.yaml`, dossier professionnel vide). Il propose d'initialiser le dossier soit à partir de sources transcrites puis validées, soit par un entretien de questions, soit les deux.

**C1** — ✅ OK. Quatre fichiers du kit joints par glisser-déposer. Originaux copiés dans le bon sous-répertoire : certificat dans `certifications/`, CV et LinkedIn dans `historical-resumes/`, DOCX dans `coaching-notes/` ; transcriptions `.md` créées à côté de chaque original. Proposition de contenu pour le dossier : synthèse, réalisations, compétences, certifications, motivations, points de vigilance tirés des notes, contradictions et points à trancher (salaire actuel et visé, préavis, déception liée au poste de lead, recommandations LinkedIn). *Démo* : le coach dit « profil professionnel » en français ; le terme du projet est « dossier professionnel ».

**C2** — ✅ OK. Réponse « d'accord pour l'ensemble, sauf mon salaire actuel », sans répondre aux questions. Dossier mis à jour : version et date changées, statut « initialisé, validé par la candidate », salaire absent, questions sans réponse gardées en section 13, banque d'exemples marquée « à enrichir par le coaching ». Le coach propose ensuite de trancher la section 13, de créer une opportunité ou de construire un message.

**D1** — ✅ OK. Opportunité créée avec le prompt naturel : statut actif, entretien courant à définir, prochaine action « obtenir l'annonce ». PDF joint : copié dans `sources/`, transcrit en `.md`, `opportunity.md` complété. Le coach relève dans l'annonce l'échange de 30 min avec Camille (talent acquisition) et le processus, demande où en est la candidature et annonce l'analyse comme étape suivante.

**D2** — ✅ OK. `analysis.md` créé (adéquation, écarts, hypothèses, positionnement, cinq messages stratégiques). Retrait du cinquième message : `analysis.md` garde les messages validés (1 à 4) et le message retiré avec sa raison. Le coach enchaîne sur une première question de préparation (migration vers les microservices) en invitant à parler à la première personne, ce qui reprend un point faible des notes de la candidate.

**D3** — ✅ OK. Entretien `01-…` pour l'échange RH (passé, date inconnue, sans détail inventé) et `02-…` pour l'entretien technique (format 1 h 15, incertitudes à clarifier, préparation « à créer »). Le coach demande les modalités (langue, visio ou sur place, date) et propose une méthode et un premier exercice de system design, sans réponse toute faite.

**D4** — ⚠️ Écart. Questions probables listées, chacune rattachée aux messages stratégiques. Pendant le travail sur la migration, le coach écrit qu'il « sort du rôle d'interviewer » et que « la suite est une relance, pas une correction » : la préparation est traitée comme une simulation. Deuxième écart : la section préparation de l'`interview.md` de l'entretien technique dit toujours « à créer lorsque la préparation commence » alors que la préparation est en cours.

**D5** — ⚠️ Écart mineur. Le coach propose la profondeur Approfondi au vu de l'entretien d'1 h 15 ; Court choisi. Règles annoncées (une question à la fois, mots d'arrêt, marquage des changements de rôle). Interviewers fictifs prénommés (Antoine, Léa). À « stop », sortie de rôle, demande de confirmation en rappelant que l'arrêt est définitif et qu'on peut simplement répondre à la question d'Antoine ; après « non », reprise du rôle. La candidate change ensuite d'avis (« non, finalement, je veux terminer l'entretien ») : le coach termine la simulation sans redemander de confirmation. Transcript avec sorties et reprises de rôle tracées. *Écart* : chaque demande d'arrêt devrait être confirmée, même juste après une reprise ; sans être bloquant, c'est plus sûr. *Écart* : deux questions arrivent souvent ensemble, une par interviewer ; une seule question à la fois serait plus naturelle, sauf exception, pour savoir à quoi répondre.

**D6** — ✅ OK. Debrief court : points forts d'abord, puis priorités (cohérence, structure, fluidité, nombreux « euh »). Le coach précise que les quatre messages n'ont pas été testés par ce cas. Prochaine étape proposée : reprendre à froid la question difficile, puis une deuxième simulation courte, sur le même cas ou un autre. Statut mis à jour.

**E1** — ✅ OK. PDF en anglais et notes TXT joints avec « La voici, en anglais, avec mes notes de l'appel avec la recruteuse. » Offre transcrite en anglais mot pour mot ; `opportunity.md` rédigé en français, langue d'origine annoncée par le coach, informations de l'appel reprises, incertitudes listées. Points à trancher : rémunération, rythme sur site, date de l'entretien. Le coach demande s'il faut commencer par la rémunération ou par l'analyse. Entretien `01-…` (recruiter) créé pour l'appel avec la recruteuse, constaté par le testeur dans le workspace.

**Reprise (hors script)** — ✅ OK, petit écart. Nouvelle conversation : « Bonjour… j'aimerais reprendre ». Le coach vérifie le workspace, résume les deux opportunités actives (Lumen Pay : entretien technique cette semaine, quatre messages validés, prochaine étape « reprendre la réponse 2 puis simulation 2 courte » ; Northwind : entretien hiring manager, rémunération à clarifier, system design en anglais éliminatoire) et les points de la section 13, puis suggère l'entretien le plus proche et enchaîne sur la reprise à froid. *Écart* : formulation des dates incohérente, « la semaine du 5 au 6 octobre est chargée » puis « la semaine du 6 ».

## Suites à donner

- **Moteur** :
  - le français dit « dossier professionnel », jamais « profil professionnel » (C1) ;
  - la préparation n'est pas une simulation : pas de rôle d'interviewer ni de marqueur de rôle pendant la préparation (D4) ;
  - `interview.md` doit passer en « préparation en cours » dès que la préparation commence (D4, écart déjà relevé le 2026-10-02 et toujours présent) ;
  - un seul interviewer pose une question à la fois, sauf exception (D5) ;
  - toute nouvelle demande d'arrêt est confirmée, y compris après une reprise du rôle (D5) ;
  - dates de reprise données de façon cohérente avec les statuts.
- **Kit** :
  - une étape de reprise indépendante de #11 pourrait entrer dans la démo, le flux observé étant court et parlant ;
  - recommander la transcription Teams comme alternative au scribe dans `guide-testeur.md`.
- **À rejouer** : D5 après correction de la confirmation d'arrêt ; D7 à D11 hors démo, lors d'un déroulé de test complet.
