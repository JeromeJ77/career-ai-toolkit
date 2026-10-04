# 2026-10-04 — Contrôles génériques du coach repris du standalone (issue #14)

Session consignée dans le [journal des tests](../test-log.md). Suite de la [session du même jour](2026-10-04-abandon-mode-standalone.md), qui annonçait ces contrôles comme à rejouer.

- **Testeur** : développeur du toolkit, avec le coach dans le workspace.
- **Version** : `0.4.0-dev`, après le commit de #14.
- **Données** : sources fictives du kit de test ; aucune donnée réelle.
- **Périmètre** : choix du développeur, jugé suffisant pour valider #14 ; les cas les plus longs sont reportés à une passe ultérieure.

## Résultats

- ✅ Messages stratégiques : proposés comme à ajuster, un message retiré est conservé dans `analysis.md` avec sa raison. Réserve : le coach l'explique de façon trop technique (« le message 5 est déplacé dans la section retirée ou invalidée de `analysis.md` »), voir le backlog.
- ✅ Préparation d'un tour : contenu et structure conformes aux règles reprises du standalone.
- ✅ Questions pour les interviewers : présentées comme suggestions du coach, distinctes de celles du candidat ; le coach rappelle aussi les questions que le candidat avait déjà.
- ✅ Profondeurs de simulation : durées et nombres de questions explicités.
- ✅ Une seule question par tour avec deux interviewers.
- ✅ Mot-clé d'arrêt : un « stop » suivi d'une reprise par une réponse est interprété comme une reprise, et le coach le note dans la transcription (aucune confirmation n'avait été demandée). L'arrêt définitif ensuite est bien confirmé, y compris la deuxième fois, ce qui ne fonctionnait pas avant la correction.
- ✅ Débrief succinct : points solides, priorités et prochaines étapes, limité à ce qui a été joué.
- ✅ Vocabulaire : « dossier professionnel » utilisé correctement.
- 🐞 Langue de la session : première conversation en français avec quelques sources, puis seconde conversation commencée en anglais (« Let's resume ») : le coach répond en français. La langue du début de la conversation n'est pas suivie. En revanche, la demande explicite « Let's switch in English » a été prise en compte et la conversation a continué en anglais. Complète l'entrée du backlog sur `language.coaching`.
- 🐞 Interviewers sans prénom : « Interviewer 1 » mentionne une autre personne sans qu'aucun interviewer ne porte de nom. Complète l'entrée du backlog sur les prénoms.
- 🐞 Peu de communication pendant les traitements longs (par exemple au début de la préparation d'une offre) : l'utilisateur attend sans savoir ce que fait le coach. Inscrit au backlog.
- ⬜ Analyse orientée action et non audit : pas de moyen de la vérifier sans cas de test à données précises et résultat attendu mesurable ; mis de côté.
- ✅ Fichiers du workspace vérifiés après la séance : `interview.md` à jour pendant la préparation (« en cours »), fiche de préparation non générée sans demande, simulation 01 indiquée comme arrêtée à la demande de la candidate après deux échanges, avec transcript et débrief court.
- ⬜ Non rejoués : types d'entretien, reconstruction de l'entretien réel, règles transversales (critères internes, compétences transférables, données inutiles), deuxième simulation (`simulations/02/`) et son indépendance de la première.

## Suites à donner

- Ajouter au plan un cas de test de l'analyse avec des données précises et un résultat attendu mesurable, si on veut la valider (inscrit au backlog).
- Rejouer les cas non couverts lors d'une passe ultérieure.
