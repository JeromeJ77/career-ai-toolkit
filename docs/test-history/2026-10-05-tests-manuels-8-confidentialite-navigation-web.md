# 2026-10-05 — Tests manuels de #8 (rappel de confidentialité et navigation web)

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Jérôme Jurbert (auteur), Claude Code (outil de test avec volet de navigation intégré).
- **Version** : `0.4.0-dev`, dépôt au commit `3dec49c`.
- **Données** : kit de test fictif (`test-kit/`). Workspaces : W1 (français), copie de W1 pour C8, W2 (anglais). Un site public réel a servi à l'étape C8 (un lien fourni par le testeur), sans être nommé ici. Aucune heure relevée.

## Résultats

- ✅ B1 : rappel de confidentialité donné une seule fois, après le compte rendu et avant la première étape, au texte et au format attendus.
- ✅ B2 : pas de rappel en deuxième session ni dans les nouvelles conversations suivantes.
- ✅ B3 : fichiers manquants recréés.
- ✅ B4 : clés manquantes recréées avec leurs valeurs par défaut (`false` pour la navigation web), commentaires de `current-status.md` conservés, correction signalée par le coach.
- ✅ B5 : erreur de configuration signalée sans correction, `false` appliqué ; demande d'accord avant d'ouvrir `https://example.com/`, valeur remise à `false` ensuite.
- ✅ C1, C2 : trois propositions, dossier professionnel vide avant validation, transcription à côté des originaux, références externes conformes, aucun salaire dans le dossier professionnel, environ 7 ans d'expérience, version et date à jour, `current-status.md` indiquant la situation et les prochaines étapes.
- ✅ C8 prompts 1 et 2 (paramètre à `false`) : aucune navigation de la propre initiative du coach ; question d'accord exacte pour le lien d'offre fictif ; message d'échec exact (domaine non résolvable) ; aucune opportunité créée faute d'information.
- ✅ C8 prompt 3 (refus) : pas de navigation, invitation à coller le contenu ou à fournir le fichier.
- ✅ C8 prompt 5 (autre lien, fourni par le testeur) : accord demandé pour ce lien, accord ponctuel : la page carrières suivante est de nouveau soumise à accord. Aucune consultation hors accord dans les traces d'outils.
- ✅ C8 : rien n'est intégré à l'opportunité sans validation ; la transcription de la page consultée est écrite à côté de l'opportunité après validation.
- ✅ C8 prompt 6 (paramètre à `true` passé à la main) : pas de demande d'accord à chaque consultation, validation avant intégration maintenue.
- ✅ D1 (non-régression) : répertoire de l'opportunité créé, puis transcription de l'offre déposée en pièce jointe ; analyse seulement sur demande.
- ✅ D3 (non-régression) : les deux entretiens créés, statut sur l'entretien technique.
- ✅ D13 (nouvelle conversation) : en simulation, la demande explicite de consultation d'un site produit la ligne de sortie *Je sors du rôle des interviewers.* puis la ligne de retour *Je reprends le rôle des interviewers.*, en italique. Aucun joker dans `transcript.md`, aucun joker compté au débrief (les jokers d'indice joués juste avant sont les seuls comptés).
- ✅ E1 (non-régression) : offre en pièce jointe copiée, transcription en anglais, `opportunity.md` en français, `current-status.md` de l'opportunité et `data/current-status.md` conformes.
- ✅ B9 (anglais, W2) : ligne *Starting the session…*, accueil exact, « career workspace » en gras, rappel de confidentialité anglais exact ; la session anglaise suivante n'affiche pas le rappel.

## Observations

- Latence : la ligne *Lancement de la session…* apparaît au bout d'environ 1 minute (B1, B2). Déjà connue et au backlog ; à surveiller.
- Outil de test : l'outil demande aussi sa propre autorisation de navigation, distincte de la question d'accord du coach. Le test ne valide que la question du coach.
- C8 prompt 6 : la date de consultation n'a pas été affichée et rien n'a été écrit pendant ce prompt ; la provenance (lien et date) n'est donc pas vérifiée dans ce cas.
- Hors scénario : en C8 prompt 4, un préambule (« Je commence par lire les consignes du workspace, puis je m'occupe de l'offre. ») précède la ligne fixe de lancement, de façon intermittente ; reporté au backlog (rendre le coach plus vivant).
- Hors scénario : en B1, « c'est l'une des deux clés que je suis autorisé à modifier » expose un détail des consignes (déjà noté au backlog).
- Hors scénario : l'échec d'une commande en B9 correspondait à la recherche des fichiers `current-status.md` encore inexistants à la première session ; sans conséquence.

## Non testé

- Transcription datée d'une page d'offre lue depuis un lien (provenance : lien et date) : aucun lien d'offre fictif résolvable dans le kit.
- Navigation indisponible dans l'outil (aucune consultation affirmée à tort) : seul le cas d'un lien inaccessible a été joué.
- « Repository privacy » (recherche de données réelles) et non-régression générale : hors de cette session.

## Suites

- Compléter `test-kit/scenario.md` (cible de l'opportunité au prompt 4, second besoin scripté au prompt 5, absence de page d'offre résolvable).
- Backlog : préambule avant la ligne fixe de lancement.
