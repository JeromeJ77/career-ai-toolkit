# 2026-10-04 — Tests manuels de la première session et du prénom (issue #15)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit.
- **Version** : `0.4.0-dev`, ZIP construit après les corrections R1 à R5 de #15 (commit et outil IA à préciser).
- **Données** : sources fictives du kit de test (Nadia Berkani).

## Résultats

- 🐞 **B9 — Première session en anglais** : l'accueil anglais, la question du prénom et l'attente de la réponse sont conformes, mais le coach les fait précéder d'un préambule technique (« First session, so here is the welcome message. »). Correction R6 prévue.
- ✅ **Changement de prénom à la demande** : le testeur a d'abord donné un prénom différent de celui des sources, puis a demandé de le corriger ; le coach a mis à jour la configuration (« Merci, Nadia. J'ai corrigé votre prénom dans la configuration. »).
- ✅ **B2 — Deuxième session en français** (nouvelle conversation, « Bonjour ») : « Bonjour Nadia. » en première ligne, sans accueil ni question sur le prénom, « espace carrière » employé, reprise proposée depuis `data/current-status.md`. Écart mineur : phrase « Votre espace carrière est prêt, et la configuration est complète. » alors que rien n'a été créé (correction R7 prévue).
- Une première opportunité a été ajoutée ; la suite du scénario n'est pas jouée, en attendant le joker (#18).

## Observations

- Au dépôt des sources, avec un prénom configuré différent du nom des sources, le coach a relevé que tous les documents étaient au nom d'une autre personne, n'a rien copié ni transcrit, et a demandé s'il s'agissait d'un jeu de test, de documents d'un tiers (autorisation à confirmer) ou de mauvais fichiers. Comportement non prescrit : idée de règle ajoutée au backlog.
- La session commencée en anglais est passée au français après la transcription des sources et l'extraction pour le dossier professionnel, et y est restée alors que le testeur écrivait en anglais (« Validate the profile as proposed, keep salary out of it »). `workspace.yaml` a été créé avec les valeurs par défaut du modèle (`language.profile` et `language.coaching` en `fr-FR`), non modifiées par le testeur : la langue de coaching configurée semble l'avoir emporté sur celle de la conversation. Hors périmètre de #15 : constat ajouté au backlog (règles de langue du dossier et des conversations).

## Non testé

- B1 (première session en français), B7 (réponses au prénom, version antérieure), B8 (garde-fou), salutation de fin de session.
- La suite du scénario maître (phases D et E).

## Suites à donner

- Corrections R6 et R7 dans `plans/issue-15.md`, à traiter après #18.
- Idées du backlog : langue du dossier à la première session, langue de la session, écart d'identité entre le candidat et les sources.
- Reprise après #18 : mise à niveau du workspace de test avec le nouveau ZIP, en conservant le dossier professionnel, l'opportunité et l'état courant, puis suite du scénario avec le joker.
