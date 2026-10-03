# 2026-10-03 — Démo à blanc chronométrée et rejeu ciblé après corrections (issue #12)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit, avec un assistant scribe pour le chronométrage (prompt du `guide-testeur.md`).
- **Version** : `0.4.0-dev`, build après le commit `5ad0ce8` (corrections issues du premier déroulé complet) ; workspace neuf extrait du ZIP.
- **Données** : kit de test fictif uniquement (`test-kit/`).
- **Périmètre** : démo à blanc avec le script de démo (A1, B1, C1, C2, D1 à D6, E1), puis étapes hors démo C6 et C7. Non joués : C3, C4, E2, E4 (`[todo]`), D7 à D11 (choix du testeur), E3. Heures dictées par le testeur depuis l'horloge du poste, jamais estimées.
- **Trace** : rapport du scribe, complété après coup par le testeur sur D1, D2, D4 à D6, E1 et la sortie de rôle en D5.

## Vue d'ensemble

| Étape | Verdict | Début | Fin | Durée | Prévu | Conversation |
| --- | --- | --- | --- | --- | --- | --- |
| A1 Extraire et ouvrir | ✅ OK | 00:43:50 | 00:45:32 | 1 min 42 s | 2 min | — |
| B1 Première session | ✅ OK | non relevée | 00:49:28 | non relevée | 2 min | nouvelle |
| C1 + C2 Sources, transcription et validation | ✅ OK | 00:51:57 | 00:58:36 | 6 min 39 s (chrono commun) | 7 min | suite de B1 |
| D1 Créer l'opportunité | ✅ OK | 01:01:42 | 01:06:18 | 4 min 36 s | 3 min | nouvelle |
| D2 Préparer l'opportunité | ✅ OK | 01:07:25 | 01:12:54 | 5 min 29 s | 3 min | suite de D1 |
| D3 Créer l'étape d'entretien | ✅ OK | 01:13:24 | 01:17:05 | 3 min 41 s | 1 min | suite de D1 |
| D4 Préparer l'entretien ensemble | ✅ OK | 01:19:00 | 01:21:57 | 2 min 57 s | 3 min | suite de D1 |
| D5 Simulation courte et arrêt | ✅ OK, petit écart | 01:25:45 | 01:33:12 | 7 min 27 s | 6 min | suite de D1 |
| D6 Debrief | ✅ OK | 01:33:12 | 01:35:16 | 2 min 4 s | 2 min | suite de D1 |
| E1 Deuxième opportunité | ✅ OK | 01:41:32 | 01:48:38 | 7 min 6 s | 3 min | nouvelle |
| C6 Source très volumineuse | ✅ OK | 01:50:57 | 01:56:20 | 5 min 23 s | hors démo | nouvelle |
| C7 Dossier supprimé, statut conservé | ✅ OK | 02:00:57 | 02:04:25 | 3 min 28 s | hors démo | nouvelle |
| C3, C4, E2, E4 | ⬜ non joués (`[todo]`) | — | — | — | — | — |
| D7 à D11 | ⬜ non joués (choix du testeur) | — | — | — | hors démo | — |
| E3 Reprise depuis le workspace | ⬜ non joué (dépend de E2, #11) | — | — | — | 2 min (avant passage en `[todo #11]`) | — |

**Durée de la démo à blanc** : environ 42 minutes pour les étapes chronométrées (A1, C1 + C2, D1 à D6, E1), pour 30 minutes prévues sur les mêmes étapes. Avec B1 (au plus 4 minutes entre la fin de A1 et la fin de B1), environ 45 minutes contre 32 prévues, hors transitions entre étapes et sans E3. De 00:43:50 (début de A1) à 01:35:16 (fin de D6), il s'est écoulé 51 minutes. Les plus gros dépassements : E1 (+ 4 min), D3 (+ 2 min 41 s), D2 (+ 2 min 29 s), D1 (+ 1 min 36 s), D5 (+ 1 min 27 s). C'est nettement mieux que le premier déroulé (1 h 29), mais toujours au-dessus de la cible.

## Détail par étape

**A1** — ✅ OK.

**B1** — ✅ OK, nouvelle conversation. *Scénario* : le prompt « je démarre mon workspace, que vois-tu ? » est une formulation de testeur, pas de candidate. Prompt utilisé : « Bonjour, on peut commencer la première session ».

**C1, C2** — ✅ OK, chronométrées ensemble, suite de B1. *Scénario* : la nouvelle conversation prévue en C1 n'est pas logique juste après l'initialisation de B1 ; il est plus naturel de continuer dans la même conversation.

**D1** — ✅ OK. `sources/` est créé dès la création de l'opportunité, le coach annonce les trois voies de dépôt et l'offre est bien transcrite en `.md`. Les heures de D1 et D2, d'abord dictées « minuit », ont été corrigées par le testeur.

**D2** — ✅ OK. Messages stratégiques proposés puis validés. `analysis.md` garde l'historique : messages proposés initialement par le coach, messages approuvés, message retiré (« il ne me ressemble pas ») et reformulations de la candidate.

**D3, D4** — ✅ OK. Détail non consigné, hors mise à jour d'`interview.md` (voir D6).

**D5** — ✅ OK, petit écart. À la demande de simulation, le coach propose les profondeurs en les adaptant à la durée de l'entretien réel. Il précise que chaque simulation est indépendante. À « stop », le coach signale **en italique qu'il sort du rôle**, puis demande la confirmation ; après confirmation, l'arrêt est effectué. *Bon point* : ce marquage explicite de la sortie de rôle est apprécié ; il serait utile aussi au retour dans le rôle (arrêt non confirmé, et plus tard sortie de pause). Le scénario ne teste pas la reprise après un arrêt non confirmé.
*Écart* : propos trop verbeux. Pour une première simulation, le coach annonce qu'il ne tiendra pas compte de l'échange de préparation (D4), comme s'il s'agissait d'une simulation précédente : « Chaque simulation est un entretien indépendant : les interviewers ne feront pas référence à notre échange sur la migration. Je garderai une trace de la simulation dans le dossier du round, puis nous ferons le débrief. »
Préparation et simulation doivent rester distinctes : l'indépendance n'est à annoncer qu'à partir de la deuxième simulation du round.
*Amélioration* : donner des prénoms aux interviewers plutôt que « interviewer 1 », « interviewer 2 », pour une simulation plus vivante.

**D6** — ✅ OK. Debrief de la simulation arrêtée avant son terme, établi à partir de ce qui était solide : trois priorités, une réponse à revisiter, une proposition de questions. `interview.md` du round est à jour : simulation 01 (courte, arrêtée) et son debrief y figurent.

**E1** — ✅ OK, nouvelle conversation. Deuxième opportunité créée, sans statut périmé. Le « profil toujours vide » du premier déroulé venait de l'ordre de jeu : C7 (suppression du dossier) avait été jouée avant E1. Cette fois, C7 est jouée en fin de passe et le dossier restauré ensuite, sans effet sur le reste du déroulé.

**C6** — ✅ OK, nouvelle conversation. Le coach constate que la source est très volumineuse, propose de n'en garder que le contenu pertinent et non générique, puis propose de mettre à jour le dossier professionnel avec ces informations.

**C7** — ✅ OK, nouvelle conversation. Le coach **ne recrée pas** le fichier manquant. Il propose de le restaurer depuis la corbeille si possible (ce qui a été fait) ou de le reconstruire entièrement à partir des sources. La régression du 2026-10-02 est corrigée.
*Amélioration* : enregistrer la version du dossier professionnel dans `current-status.md` pour signaler qu'une copie restaurée ne correspond pas à la version attendue. Si la candidate valide la différence, le statut reprend la version du fichier ; sinon, il faut investiguer. Un checksum a été évoqué puis écarté, jugé trop compliqué pour l'instant.

**D7 à D11** — ⬜ non joués, choix du testeur : même problème qu'en D5, la première simulation ne doit pas être traitée comme un contexte distinct de la préparation (voir D5).

**E3** — ⬜ non joué. L'étape dépend de E2 (changement de périmètre, #11) : sans changement de périmètre en cours de conversation, il n'y a pas d'opportunité quittée à reprendre depuis le workspace. *Scénario* : taguer E3 `[todo #11]`.

## Suites à donner

### Moteur

1. D5 : n'annoncer l'indépendance qu'à partir de la deuxième simulation du round et ne jamais présenter la préparation comme une simulation ; marquer en italique chaque sortie du rôle et chaque retour dans le rôle. **Appliqué** (guidelines de simulation, skill, standalone ; plan de test, D5 et D7 du scénario).

### Kit de test et scénario

1. B1 : prompt « Bonjour, on peut commencer la première session ». **Appliqué.**
2. C1 : suite de la conversation précédente plutôt que nouvelle. **Appliqué.**
3. Prompt du scribe : une appréciation explicite (« ça s'est bien passé ») vaut verdict OK. **Appliqué.**
4. D7 : tester la reprise après un arrêt non confirmé (retour dans le rôle en italique), en deux variantes : refus explicite (« Non, on continue. ») et réponse directe à la question de l'entretien sans répondre à la confirmation. **Appliqué**, avec la précision correspondante dans les guidelines de simulation et le standalone.
5. Durée de la démo : environ 45 minutes pour 32 prévues. Décision du testeur : garder C2 (rapide) et D3 (montre un entretien passé sans préparation avant l'entretien technique), revoir les durées indicatives à la hausse ; cible de 35 à 40 minutes en enchaînant sans prise de notes. **Appliqué** (38 min au total).
6. E3 : taguer `[todo #11]`. **Appliqué.**

### Backlog

- Version du dossier professionnel enregistrée dans `current-status.md` pour détecter une restauration non conforme (C7).
- Prénoms des interviewers en simulation (D5).

### À rejouer

D5 (après la correction ci-dessus) et D7 à D11. E3 attend #11.
