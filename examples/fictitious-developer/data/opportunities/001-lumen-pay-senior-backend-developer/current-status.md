# État courant de l'opportunité

Dernière mise à jour : 2026-10-02

## État

- Statut : active
- Entretien courant : 02-technical passé le 2026-10-02 (Karim, lead, et Sofia, ingénieure senior). Retour de Lumen Pay attendu sous une semaine ; si positif, étape avec le Head of Engineering (03).
- Simulation 01 (courte, en français) de 02-technical terminée par un arrêt anticipé de la candidate ; seule la partie architecture a été jouée (3 réponses). Débrief fait (`debrief.md`).
- Simulation 02 (standard, en français) de 02-technical arrêtée par la candidate après la première question, sans réponse : rien à débriefer. Cas posé : double consommation d'une décision Kafka et double paiement (idempotence).
- Simulation 03 (hors coach, avec un ami développeur, orale, sans enregistrement) : débrief fait à partir du souvenir de la candidate (`debrief.md`). Priorités : justifier le découpage de la migration et les alternatives écartées ; « j'ai décidé » au lieu de « on » ; préparer des questions pour les interviewers.
- Phase courante : retour après l'entretien technique (02) fait ; en attente du retour de Lumen Pay ; préparation possible du 03 avec le Head of Engineering

## Décisions validées

- 2026-10-02 : messages stratégiques 1 à 4 validés (le message 5 a été retiré).

## Travail terminé

- Offre intégrée dans `opportunity.md` et original conservé dans `sources/`.
- Échange RH avec Camille (01-screening) passé.

## Focus courant

- Entretien technique : discussion d'architecture sur un cas concret, sans code en direct. Point de vigilance de la candidate : jamais fait de system design formel au tableau.

## Contexte utile à reprendre

- Aucun pour le moment.

## Artefacts pertinents

- `opportunity.md` : offre convertie (réf. LP-2026-ENG-014).
- `sources/001-lumen-pay-offre-developpeuse-backend-senior.pdf` : original inchangé.
- `analysis.md` : analyse initiale, messages stratégiques 1 à 4 validés.
- `interviews/01-screening/interview.md`, `interviews/02-technical/interview.md` et `interviews/03-head-of-engineering/interview.md` (non planifié).
- `interviews/02-technical/simulations/01/transcript.md` : transcript factuel de la simulation 01 (arrêt anticipé).
- `interviews/02-technical/simulations/02/transcript.md` : simulation 02, arrêt immédiat, une seule question posée.
- `interviews/02-technical/simulations/01/debrief.md` : priorités = recommandation avant renvoi au produit ; ancrage dans l'expérience ; réponses plus structurées.

- `interviews/02-technical/simulations/03/debrief.md` : simulation orale avec un ami, sans transcript (souvenir de la candidate).
- `interviews/02-technical/preparation.md` : fiche générée le 2026-10-02 à la demande de la candidate. Questions pour les interviewers validées le 2026-10-02 (prioritaires : dette technique, décisions d'architecture entre équipes, traçabilité ; complémentaires : passage à l'échelle, astreinte). Exemples migration, idempotence, incidents à compléter par la candidate. Pistes à garder pour le round 03 (Julien) : roadmap contre plateforme, évolution tech lead ou staff.

- `interviews/02-technical/actual/notes.md` et `review.md` : entretien réel du 2026-10-02. Points : question ACPR (traçabilité) non anticipée ; désaccord perdu (Kafka contre file simple) trouvé après ~20 s ; migration en « j'ai » réussie selon la candidate. Propositions d'ajout au profil en attente de validation.

## Prochaine action

- Préciser avec la candidate l'exemple Kafka (son côté du désaccord, qui a tranché, ce qui en est ressorti), constituer 3 à 4 exemples de difficulté, structurer la réponse traçabilité / ACPR après vérification des exigences par ses propres sources. Puis préparer le round 03 (Head of Engineering) si Lumen Pay confirme.
