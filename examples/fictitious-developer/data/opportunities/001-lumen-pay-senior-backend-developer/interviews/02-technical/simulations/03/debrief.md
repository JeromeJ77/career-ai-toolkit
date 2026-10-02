# Debrief de simulation

## Contexte

- Opportunité : 001-lumen-pay-senior-backend-developer (Lumen Pay, développeuse backend senior)
- Entretien : 02-technical (discussion d'architecture)
- Simulation : 03, menée hors coach avec un ami développeur, la veille du 2026-10-02 ; durée et profondeur inconnues
- Modalité : simulation orale, sans enregistrement ni transcript. Pas de `transcript.md` pour cette simulation.

## Sources utilisées et limites

- Sources persistantes analysées : `data/profile/professional-profile.md`, `analysis.md` (messages 1 à 4 validés), `interview.md` du round 02, `simulations/01/debrief.md`, `current-status.md` de l'opportunité.
- Éléments indisponibles ou incertains : tout le contenu de la simulation repose sur le souvenir de la candidate. La chronologie, le débit, le ton, la formulation exacte des réponses et des questions ne sont pas connus. L'appréciation de l'ami (« meilleure réponse » sur l'idempotence) est rapportée, non vérifiable. La question posée sur l'astreinte n'est pas connue dans sa formulation.

## Synthèse

D'après la candidate, elle a tenu une présentation d'architecture d'environ dix minutes sur la migration du monolithe vers six services et a été claire sur l'idempotence des paiements. Trois manques ressortent : le raisonnement derrière le découpage et les alternatives écartées, l'appropriation personnelle des décisions (usage de « on »), et l'absence de questions préparées pour l'interviewer.

## Points solides observés

*Rapportés par la candidate.*

- **Idempotence des paiements :** réponse claire, jugée par l'ami comme sa meilleure. Sujet en lien direct avec son expérience (webhooks à traitement unique chez Kiwano).
- **Architecture cible :** présentation de la cible de migration en dix minutes, malgré son point de vigilance sur le system design formel.

## Priorités d'amélioration

1. **Justifier le découpage.** Les six services ont été décrits sans expliquer les critères du découpage ni ce qui a été écarté. Préparer : critères retenus, alternatives envisagées, raisons du rejet.
2. **Passer du « on » au « j'ai décidé ».** Face à la question « qu'as-tu décidé personnellement ? », la candidate a répondu avec « on » et a mis du temps à trouver un exemple. Le point est déjà dans le profil (section 12). Identifier une ou deux décisions personnelles de la migration, avec contexte, risque et résultat.
3. **Préparer des questions pour l'interviewer.** Question improvisée sur l'astreinte, alors que l'offre précise déjà son rythme (1 semaine sur 7, rémunérée). Des pistes existent dans `analysis.md` (dette technique et outillage, décisions d'architecture entre équipes, équilibre roadmap et plateforme).

## Réponses à revisiter

- **Architecture cible de la migration :** ajouter le pourquoi du découpage et les alternatives écartées.
- **« Qu'as-tu décidé personnellement ? » :** à reprendre avec un exemple prêt, en « j'ai ».

## Messages stratégiques visibles ou manquants

- **1. Fiabilité de production :** non évalué.
- **2. Architecture distribuée menée dans la durée :** visible via l'idempotence et la migration, mais sans les arbitrages avec le CTO.
- **3. Qualité comme pratique d'équipe :** non évalué.
- **4. Mentorat et influence sans titre :** non évalué.

## Qualité des questions du candidat

Une seule question, improvisée, sur l'astreinte. Elle risque de porter sur un point déjà couvert par l'offre ; la formulation exacte n'est pas connue, donc l'évaluation reste prudente.

## Prochaine action recommandée

Répondre, sans chercher la formule parfaite, à deux questions : pourquoi six services et qu'est-ce qui a été écarté ; quelle décision a été prise personnellement dans la migration, contre un avis ou avec un risque. Puis construire ensemble la justification du découpage et un exemple en « j'ai ».

Le schéma « peu d'appui sur l'expérience personnelle » apparaît aussi dans la simulation 01. Les propositions d'ajout au dossier professionnel (banque d'exemples) seront présentées séparément et ne seront appliquées qu'après validation.
