# Debrief de simulation

## Contexte

- Opportunité : 001-lumen-pay-senior-backend-developer (Lumen Pay, développeuse backend senior)
- Entretien : 02-technical (discussion d'architecture, deux membres de la squad)
- Simulation : 01, profondeur courte, en français, rôles joués par le coach (Marc, Léa)
- Modalité : conversation écrite. La simulation a été arrêtée par la candidate (« stop ») pendant la 4e question ; elle couvre la partie architecture (3 réponses). Le motif de l'arrêt n'a pas été donné et n'est pas interprété.

## Sources utilisées et limites

- Sources persistantes analysées : `simulations/01/transcript.md`, `interview.md` du round 02, `opportunity.md`, `analysis.md` (messages 1 à 4 validés), `data/profile/professional-profile.md`, `current-status.md`.
- Éléments indisponibles ou incertains : `preparation.md` n'existe pas encore. L'échange est écrit : le débit, le ton et le non-verbal ne sont pas évaluables. La question de Léa (incident en production) est restée sans réponse et n'est pas évaluée. Aucune question de la candidate aux interviewers. Le cas est inventé et peut différer du cas réel.

## Synthèse

Sur le cas, la candidate a repéré la contradiction entre la cible de 300 ms au 99e centile et le fournisseur lent, a demandé des données précises, a changé d'approche quand l'hypothèse du cache a été invalidée, et a placé la traçabilité au cœur de sa réponse. Ce qui manque, d'après le transcript : une position tranchée, des références à son expérience, et des réponses plus ramassées.

## Points solides observés

- **Bon réflexe de départ :** elle relève l'incohérence entre 300 ms au p99 et un fournisseur qui dépasse parfois 400 ms, et demande à quel centile ce dépassement se produit (« si c'est 400 millisecondes au 99,9e centile, bon »).
- **Traçabilité intégrée dès la première réponse :** table d'audit avec les sources utilisées et la manière dont elles ont été obtenues (cache ou requête directe).
- **Adaptation :** une fois informée que les données sont propres à chaque client, elle abandonne le cache et propose une réponse sous 300 ms avec identifiant de requête, plus un traitement en arrière-plan qui alimente aussi l'analyse des dépassements.
- **Bonne question en retour :** « Est-ce qu'on peut vraiment, avec notre algorithme, faire quelque chose sans cette donnée ? » Elle pointe l'hypothèse structurante, et l'interviewer a confirmé que oui.
- **Pas d'attente infinie :** elle pose un délai maximal et une limite dure à 300 ms.

## Priorités d'amélioration

1. **Prendre position avant de renvoyer au produit.** Dans les deux dernières réponses, la décision est renvoyée à l'équipe produit (« à valider avec le produit », « à voir avec l'équipe produit », « à déterminer »). Le sujet relève bien du produit, mais un panel technique attend votre recommandation, puis la dépendance. Évitez d'arriver sans option par défaut.
2. **Faire entrer votre expérience dans le raisonnement.** Aucune des trois réponses ne s'appuie sur Payflow ou Kiwano (webhooks à traitement unique, tests de contrat, observabilité). Les messages 2 et 3 validés ne sont pas visibles dans ce transcript.
3. **Resserrer et annoncer un plan.** La première réponse enchaîne cache, asynchrone, audit et provenance sans annonce de structure, avec des phrases inachevées et un « Euh, » final. Annoncez le nombre de points que vous allez traiter, puis finissez chaque réponse par une phrase de conclusion.

## Réponses à revisiter

- **Question 2 et 3 (fournisseur lent ou muet).** Vous avez décrit un mécanisme asynchrone avec identifiant de requête, sans parler de ce qui arrive si le client rappelle plusieurs fois, ni du comportement dégradé. Ce sont des sujets que vous connaissez (idempotence, pannes partielles). À reprendre en commençant par votre recommandation.
- **Question de Léa (incident en production).** Non jouée ; à travailler séparément, elle porte le message 1.

## Messages stratégiques visibles ou manquants

- **1. Fiabilité de production :** non évalué (question non jouée).
- **2. Architecture distribuée menée dans la durée :** raisonnement visible, mais sans appui sur votre migration ni sur l'idempotence que vous connaissez.
- **3. Qualité comme pratique d'équipe :** absent (par exemple comment vous testeriez le comportement dégradé).
- **4. Mentorat et influence sans titre :** non évalué.

## Qualité des questions du candidat

Aucune question posée dans cette simulation : non évaluable.

## Prochaine action recommandée

Refaire à l'oral, en 90 secondes, la réponse sur le fournisseur lent : votre recommandation d'abord, puis une situation vécue qui la justifie, puis ce que vous ne savez pas encore et qu'il faudrait valider.

Propositions de suite, à décider séparément : travailler le récit d'incident (question de Léa) ; générer `preparation.md` ; proposer, après validation, des ajouts au dossier (l'approche de découpage de la migration et ses alternatives écartées).
