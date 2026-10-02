# 2026-10-02 — Premier déroulé complet du scénario maître (issue #12)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit, avec un assistant scribe en push-to-talk pour la prise de notes (prompt du `guide-testeur.md`).
- **Version** : `0.4.0-dev`, build du 2026-10-02 ; workspace extrait du ZIP et renommé avec le suffixe `-test`, ouvert dans Claude Desktop.
- **Données** : kit de test fictif uniquement (`test-kit/`). Le répertoire `data/` obtenu a été copié dans `examples/fictitious-developer/data/` pour servir d'exemple après nettoyage.
- **Périmètre** : phases A à E du scénario ; phase F non jouée. Heures de début et de fin de la session non relevées ; heures des étapes dictées par le testeur depuis l'horloge du poste, jamais estimées.
- **Trace** : les retours du coach sont résumés ; les transcripts et fichiers produits dans `examples/` servent de détail.

## Vue d'ensemble

| Étape | Verdict | Durée | Conversation |
| --- | --- | --- | --- |
| A1 Extraire et ouvrir | ✅ OK | non chronométrée | — |
| B1 Première session | ✅ OK | ≈ 1 min (chrono testeur) | première |
| B2 Deuxième session | ✅ OK | 53 s | non relevée |
| B3 Fichier supprimé, fichier personnalisé | ✅ OK | 1 min 55 s | non relevée |
| B4 Clé manquante | ✅ OK | 1 min 48 s | nouvelle |
| B5 Valeur invalide | ✅ OK | 1 min 57 s | nouvelle |
| B6 Langue du dossier | ✅ OK | 1 min 4 s | — |
| C1 Sources et transcription | ✅ OK | 10 min 44 s | non relevée |
| C2 Validation du dossier | ✅ OK sous réserve | 3 min 35 s | non relevée |
| C3 Entretien d'initialisation | ⬜ non joué (`[todo #10]`) | — | — |
| C4 Rappel dossier non prêt | ⬜ non joué (`[todo #9]`) | — | — |
| C5 Réimport après non-écrasement | ✅ OK | 4 min 3 s | nouvelle |
| C6 Source très volumineuse | ⬜ non joué (pas de source dans le kit) | — | — |
| C7 Dossier supprimé, statut conservé | 🐞 écart | 6 min 56 s | nouvelle |
| D1 Créer l'opportunité | ✅ OK | 8 min 8 s | non relevée |
| D2 Préparer l'opportunité | ⚠️ petit écart | 13 min 5 s | non relevée |
| D3 Créer l'étape d'entretien | ✅ OK | 5 min 37 s | suite de D2 |
| D4 Préparer l'entretien ensemble | ✅ OK | 5 min 39 s | non relevée |
| D5 Simulation courte et arrêt | ✅ OK | 17 min 51 s | non relevée |
| D6 Debrief | 🐞 écart | 12 min 0 s | non relevée |
| D7 Deuxième simulation | 🐞 écart | 14 min 17 s | non relevée |
| D8 Debrief dans une nouvelle conversation | ✅ OK (test incomplet) | ≈ 5 min 51 s (début approximatif) | nouvelle |
| D9 Debrief sans transcript | 🐞 écart | 10 min 5 s | nouvelle |
| D10 Questions à poser | ✅ OK | 8 min 9 s | non relevée |
| D11 Fiche de préparation (variante sans questions, jouée avant D10) | ✅ OK | 11 min 15 s | non relevée |
| D12 Retour après l'entretien réel | ✅ OK | 5 min 37 s | nouvelle |
| E1 Deuxième opportunité | ✅ OK | 10 min 51 s | nouvelle |
| E2 Changement de périmètre | ⬜ non joué (`[todo #11]`) | — | — |
| E3 Reprise depuis le workspace | ⬜ non joué (sans objet à cet endroit) | — | — |
| E4 Git | ⬜ non joué (`[todo #6]`) | — | — |
| F1 Retour pilote | ⬜ non joué | — | — |
| F2 Copie vers `examples/` | ⬜ fait hors déroulé, à nettoyer | — | — |

Durée cumulée des étapes `[demo]` chronométrées (B1, C1, C2, D1 à D6, E1) : **environ 1 h 29**, pour 34 minutes prévues. Les durées incluent les hésitations du testeur et les réponses rédigées à la volée ; elles restent très au-dessus de la cible.

## Détail par étape

### Phase A — Préparation

**A1** — ✅ OK. Workspace extrait du build, kit extrait, répertoire renommé `-test`. Deux répertoires à la racine (`data`, `skills`), `data/` ne contient que des README. Ouvert dans Claude Desktop. Au prochain test, chronométrer la phase A.

### Phase B — Initialisation

**B1** — ✅ OK. Le coach lit `AGENTS.md` et le skill d'initialisation, crée `workspace.yaml` (profil et coaching `fr-FR`, livrables `fr-FR` et `en-GB`, recherche web externe désactivée, confirmation avant modification du profil), `professional-profile.md` (squelette de 15 sections), `external-references.md`, `current-status.md` (« non initialisé »). Il propose d'initialiser le profil ou de démarrer une opportunité et recommande le profil.

**B2** — ✅ OK. Rien créé ni réécrit ; propositions de suite.

**B3** — ✅ OK. `external-references.md` supprimé puis recréé seul ; le commentaire ajouté dans `current-status.md` est laissé tel quel.

**B4** — ✅ OK. Clé `privacy.allow_external_web_search` ajoutée avec `false` (défaut du modèle), annoncée.

**B5** — ✅ OK. Valeur invalide signalée (booléen attendu), `false` utilisé pour la session, correction demandée à la candidate, fichier non réécrit.

**B6** — ✅ OK. *Scénario imprécis* : il demande de vérifier `language` = `fr`, alors que le fichier contient `profile: "fr-FR"`, `coaching: "fr-FR"`, `deliverables: ["fr-FR", "en-GB"]`.

### Phase C — Sources et dossier professionnel

**C1** — ✅ OK. Le coach retire le commentaire de `current-status.md` après confirmation, propose documents (A, recommandé) ou entretien oral (B). Quatre fichiers déposés, tous transcrits en `.md`. Cinq points à trancher relevés : niveau React, « organisation » ou « co-organisatrice » du meetup, rôle réel sur la migration, données sensibles des notes (salaire, poste de lead non obtenu, préavis), chiffres du CV à confirmer. Brouillon proposé, profil non écrit. Retour jugé très bon.
*Amélioration* : au démarrage, le coach déclare « Je n'ai pas lu `data/profile/professional-profile.md` en détail. Je ne sais donc pas s'il est vide ou déjà rempli », ce qui l'empêche d'orienter. Il doit lire le dossier et corriger les statuts périmés.
L'étape a été allongée par le choix entre options A et B.

**C2** — ✅ OK sous réserve. Profil écrit (version 0.2) sans le salaire actuel ; rémunération visée en section 10, marquée confidentielle. Relecture détaillée faite après coup sur la copie fournie : contenu fidèle aux sources, à l'exception de « environ 8 ans d'expérience (alternance incluse) » alors que le CV et LinkedIn disent sept ans (relevé aussi par le coach en C5).

**C3**, **C4** — ⬜ non joués, dépendent de #10 et #9.

**C5** — ✅ OK. Transcriptions conformes aux originaux. Réserve du coach sur le tableau « Domaines évalués » du certificat (extraction texte désordonnée, `pdftoppm` absent) : pondération non reprise dans le dossier. Contrôle de cohérence du dossier avec les sources, six points relevés sans rien modifier : années d'expérience (8 vs 7), formulation LinkedIn « référente technique de la squad Règlement », attribution des sources en section 7, React, références externes, données confidentielles.

**C6** — ⬜ non joué. *Kit* : aucune source très volumineuse disponible. À prévoir : un fichier long (certificat de formation détaillé ou notes de coaching) avec beaucoup de remplissage et quelques données utiles au début ; prompt neutre « J'ai ajouté une nouvelle source » sans mentionner la taille ; attendu : le coach détecte le volume et demande confirmation ou n'extrait que l'utile.

**C7** — 🐞 écart. Après suppression de `professional-profile.md`, le coach **recrée le squelette vide** depuis le modèle, puis signale la contradiction avec `current-status.md` et propose de reconstruire, restaurer une copie ou passer à une opportunité. Attendu : ne rien créer, demander de clarifier (reconstruire, redonner la copie, vérifier une synchronisation). Le 2026-09-30 le comportement attendu avait été observé : **régression**.
Le coach relève `allow_external_web_search` passé à `true` (défaut `false`), le juge valide et n'y touche pas. *Améliorations* : avertir explicitement d'un passage à `true` avec demande de confirmation ; mémoriser dans `current-status.md` les valeurs de la session précédente pour signaler les changements de clés critiques.

### Phase D — Lumen Pay

**D1** — ✅ OK. Dossier créé ; quand le PDF est fourni dans la conversation, le coach crée lui-même `sources/` et y range le PDF. Il détecte que le profil est un squelette vide (erreur de manipulation du testeur après C7) et propose de le reconstruire avant l'analyse.
*Amélioration* : créer systématiquement `sources/` à la création de l'opportunité et proposer trois voies : copier le fichier dans `sources/` puis le dire ; fournir le fichier dans la conversation ; coller le texte dans le chat (le coach crée alors un `.md`).
*Kit* : le répertoire `sources/opportunity/` est au singulier, à renommer `opportunities`.
*Observation hors notes* : aucune transcription `.md` n'a été créée à côté des PDF d'offre (001 et 002) ; le contenu est allé directement dans `opportunity.md`. Le scénario attendait la transcription à côté de l'original.

**D2** — ⚠️ petit écart. `analysis.md` créé (ce qui ressort, écarts et risques, cinq messages stratégiques proposés), cinq questions posées. À la demande de retrait du message 5, le coach le retire et redemande l'avis sur les messages 1 à 4.
*Écart* : en retirant le message, le coach **supprime la section « messages proposés »** au lieu de la conserver et d'ajouter une section « retirés ou invalidés par la candidate ». Le plan de test ne le précisait pas.
*Améliorations* : libeller « messages stratégiques proposés pour cette offre » et rappeler ce qu'est un message stratégique à la première occurrence. *Scénario* : D2 devient « retirer un message proposé et valider les autres ».

**D3** — ✅ OK, même conversation que D2. Deux rounds créés : `01-screening` (réalisé, sans détail) et `02-technical` (planifié, semaine du 5 octobre, 1 h 15). Statut de l'opportunité sur l'entretien technique. `interview.md` cohérent. Le coach enchaîne sur trois questions (nature du cas, récit de la migration, latence et audit) sans réponse toute faite. Prompt utilisé : « Je valide les messages 1 à 4. J'ai passé l'échange RH. La semaine prochaine, c'est l'entretien technique de 1 h 15 avec deux membres de la squad, discussion d'architecture sur un cas concret. J'aimerais préparer cet entretien. » *Scénario* : aligner le prompt.

**D4** — ✅ OK. Le coach capte l'hésitation « j'ai » / « on », structure sa réponse (ce qui fonctionne, ce qui dessert, à travailler), relève : critère de découpage et gestion des données non expliqués, résultat sans valeurs de départ et d'arrivée, pas d'échec ni de surprise ; questions pour consolider l'exemple, proposé au dossier après consolidation. Échange volontairement non mené au bout. *Scénario* : fournir un prompt illustratif pour le récit d'architecture (celui utilisé a été improvisé avec des détails inventés).

**D5** — ✅ OK. Le coach propose la profondeur (recommande Approfondi pour 1 h 15), demande la langue, présente les interlocuteurs (Marc et Léa, squad Scoring & Décision), rappelle les règles d'arrêt. Simulation courte en français. Cas : moteur de décision de crédit, 300 ms au p99, fournisseur externe parfois à 400 ms, décisions rejouables pour le régulateur. « stop » arrête la simulation ; transcript `simulations/01/transcript.md`, statut mis à jour, debrief rapide proposé.
*Amélioration* : demander confirmation avant d'arrêter, l'arrêt étant définitif. *Scénario* : reprendre la formulation du testeur. *Exemple* : les réponses rapides et approximatives du testeur ne doivent pas rester telles quelles.

**D6** — 🐞 écart. Debrief rapide conforme (points solides, trois priorités : prendre position, s'appuyer sur l'expérience, resserrer ; prochaine action). Transcript et `debrief.md` présents, `current-status.md` de l'opportunité à jour.
*Écart* : **`interviews/02-technical/interview.md` non mis à jour** (préparation non indiquée comme commencée, simulation non signalée).

**D7** — 🐞 écart. Deuxième simulation (Standard) lancée puis arrêtée volontairement (« arrête la simulation » fonctionne). Réponse cohérente après l'arrêt : pas d'interprétation, transcript `simulations/02/`, statut à jour, question facultative sur la raison de l'arrêt. Le coach crée ensuite `03-head-of-engineering` (Julien, 45 min, non planifié), le référence sans basculer dessus, pose trois questions de préparation.
*Écarts* : la simulation 2 s'ouvre par « Marc : Rebonjour Nadia. On reprend, avec un autre cas cette fois » : **les simulations ne sont pas indépendantes** ; `interview.md` toujours non mis à jour.
*Bon point* : le coach liste à chaque réponse les fichiers modifiés. *Améliorations* : avant une nouvelle simulation, demander si l'on rejoue le même cas ou un autre ; alléger le `current-status.md` de l'opportunité et déplacer le détail (simulations, debriefs) dans `interview.md`. *Scénario* : retirer le debrief de l'attendu de D7 (il relève de D8) ; D7 = simulation 2 jusqu'au bout, puis préparation de l'étape suivante, puis fermeture de la conversation. *Exemple* : la simulation 2 n'a pas été jouée au bout, à corriger.

**D8** — ✅ OK, test incomplet. Nouvelle conversation : le coach retrouve l'opportunité seul, constate qu'il n'y a rien à debriefer (simulation 02 arrêtée après la première question), rappelle les trois priorités du debrief 01, propose trois options et un `debrief.md` sans interprétation ; ne modifie rien.
*À rejouer* avec une simulation réellement jouée. *Observations* : passage du vouvoiement au tutoiement en cours de session ; incohérence dans une option du coach (« webhooks à traitement unique chez Payflow », alors que c'était chez Kiwano).

**D9** — 🐞 écart. Prompt du scénario collé tel quel. Le coach reprend au bon endroit, debriefe à partir du souvenir avec une limite de preuve explicite, demande de valider le rattachement à Lumen Pay, crée `simulations/03/debrief.md` (« souvenir de la candidate, sans transcript »), met à jour les deux `current-status.md`.
*Écart* : `interview.md` de `02-technical` toujours « préparation : à créer », « simulation : aucune pour le moment ».

**D10** — ✅ OK (joué après D11). Le coach reprend les idées du dossier et de `analysis.md`, donne un avis et une reformulation pour chacune, propose deux questions propres à Lumen Pay (traçabilité, passage à l'échelle), n'écrit rien avant validation. Trois prioritaires retenues (dette technique, décisions d'architecture inter-équipes, traçabilité), deux complémentaires (passage à l'échelle, astreinte). La fiche est régénérée avec ces choix.
*Amélioration* : présenter les questions propres à l'offre comme suggestions du coach, distinctes des idées de la candidate. Ambiguïté sur le nombre de questions en réserve (« quatre » puis « trois »).

**D11** — ✅ OK (variante : fiche demandée sans avoir travaillé les questions). Le coach le signale, recommande de les revoir, ne bloque pas ; rappelle deux questions du debrief restées sans réponse. `preparation.md` généré en Markdown (pas de PDF), avec récapitulatif de ce qui reste vide et invitation à s'approprier les formulations. Prompts : « Je me sens prête. Génère ma fiche de préparation pour l'entretien technique » puis « Génère-moi déjà la fiche pour que je me l'approprie, je reviendrai vers toi pour les questions. »
*Amélioration* : première page trop dense ; les points de vigilance ne doivent pas figurer en première page (visible des interlocuteurs) ; regrouper message / pitch / exemple ; deuxième page de notes ; détail à partir de la page 3. À juger sur le PDF.

**D12** — ✅ OK, nouvelle conversation. Retour oral de l'entretien réel. Analyse pertinente (progrès : migration en « j'ai », ACPR sans rien inventer, questions posées ; fragile : désaccord perdu, traçabilité ; deux points à clarifier ; prochaines étapes). Le coach relève que les trois questions prioritaires n'ont pas été posées. `actual/notes.md` et `actual/review.md` créés dans `02-technical` ; `interview.md` et les deux `current-status.md` mis à jour (date planifiée remplacée par la date du jour, avec mention). Profil non touché, deux ajouts proposés à validation.
*Observations* : `interview.md` est bien mis à jour ici, contrairement à D6, D7, D9. Le démarrage d'une nouvelle conversation dépasse une minute (lecture d'`AGENTS.md`, du skill d'initialisation, du statut).

### Phase E — Northwind Ledger

**E1** — ✅ OK, nouvelle conversation. Le coach demande de confirmer le titre. PDF fourni dans la conversation ; `sources/` créé avec le PDF, offre transcrite dans `opportunity.md`, `current-status.md` créé. Notes d'appel TXT rangées sans modification dans `sources/`. Statut du workspace mis à jour (002 à reprendre, 001 en pause). Rounds `01-recruiter` (appel du 30/09 avec Sanne, notes) et `02-hiring-manager` (Marek, semaine du 6 octobre, à confirmer). Propos de Sanne rapportés comme non vérifiés. Trois points relevés (écart de salaire 70–75 / 75–82 / 75–90 k€, message pour Marek, system design en anglais), quatre options proposées sans trancher.
*Observations* : « points de reprise potentiels » à mettre au pluriel ; le coach vouvoie ici (il tutoyait de D8 à D12) ; il dit le profil « toujours vide » alors qu'il est rempli — hypothèse non vérifiée : statut du workspace périmé (même point qu'en C1).

**E2**, **E3**, **E4** — ⬜ non joués. E3 jugé sans objet à cet endroit : la reprise a déjà été testée (D8, D9, D12, E1) et rouvrir le workspace ne permet pas de rebasculer sur l'autre opportunité.

### Phase F — Clôture

**F1** — ⬜ non joué, des améliorations étant prévues avant. Idées : prise de notes silencieuse par le coach au fil des sessions (incohérences, difficultés, fichiers manquants), complétée par des mots-clés dictés par la candidate (déjà au backlog).

**F2** — ⬜ fait hors déroulé : `data/` copié dans `examples/fictitious-developer/data/`, à relire et nettoyer avant commit (réponses de D5, simulation 2 de D7, profil).

## Suites à donner

### Moteur (skills, guidelines, standalone)

1. Au démarrage, lire le dossier professionnel et corriger les statuts périmés (C1, E1).
2. Ne pas recréer un fichier dont le statut dit qu'il était initialisé ; demander de clarifier (C7, régression).
3. Avertir explicitement d'un passage de `allow_external_web_search` à `true` ; mémoriser les valeurs de configuration de la session précédente (C7).
4. Créer `sources/` à la création d'une opportunité et proposer les trois voies de dépôt (D1).
5. Conserver la section des messages stratégiques proposés et ajouter « retirés ou invalidés » ; rappeler la définition d'un message stratégique (D2).
6. Simulations : confirmation avant arrêt (D5) ; indépendance de chaque simulation, pas de « rebonjour » (D7) ; proposer de rejouer le même cas ou un autre (D7).
7. Mettre à jour `interview.md` pendant la préparation et les simulations (D6, D7, D9) ; alléger le `current-status.md` de l'opportunité et y pointer sur `interview.md` pour le détail.
8. Tutoiement / vouvoiement constant, option dans `workspace.yaml`, vouvoiement par défaut (D8 à E1).
9. Ton et emojis paramétrables dans `workspace.yaml`, sobre et sans emoji par défaut.
10. Présenter les questions propres à l'offre comme suggestions du coach (D10).
11. Fiche de préparation : points de vigilance hors première page, page de notes, détail à partir de la page 3 (D11).
12. « Points de reprise potentiels » au pluriel (E1).

### Kit de test et scénario

1. Champ **Conversation** (`nouvelle` / `suite de Dx`) dans chaque étape, hors parenthèses ; envisager préconditions et postconditions.
2. B6 : préciser les clés de langue réelles.
3. C6 : ajouter une source volumineuse au kit, prompt neutre, attendu reformulé.
4. D2 : « retirer un message et valider les autres ».
5. D3, D5 : reprendre les prompts utilisés.
6. D4 : prompt illustratif pour le récit d'architecture.
7. D7 : retirer le debrief, simulation jusqu'au bout, fermer la conversation ensuite.
8. D8 : nouvelle conversation, prompt « débriefe ma dernière simulation Lumen Pay » ; à rejouer avec une simulation réellement jouée.
9. D1, E1 : trancher si la transcription `.md` à côté du PDF d'offre est attendue, ou si `opportunity.md` suffit.
10. Renommer `test-kit/sources/opportunity/` en `opportunities/`.
11. A1 : chronométrer la phase A.
12. Durées `[demo]` : 1 h 29 mesurée pour 34 min prévues ; revoir les durées indicatives et le découpage de la démo.

### Exemple (`examples/fictitious-developer/data/`)

- Relire et nettoyer avant commit : réponses rapides de D5 dans `simulations/01/transcript.md`, simulation 2 non menée au bout, incohérence Payflow / Kiwano, mentions de test, tutoiement.

### Backlog

- Consigner silencieusement la raison d'un arrêt de simulation dans le feedback (D7).
- Feedback pilote construit au fil de l'eau (F1, déjà au backlog).
- Démarrage d'une nouvelle conversation lent (> 1 min) : risque de réutilisation des conversations (D12).
