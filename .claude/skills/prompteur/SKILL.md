---
name: prompteur
description: Guide une passe de test manuelle du coach, élément par élément, comme un prompteur. Le testeur joue le coach dans une autre fenêtre et répond « ok » ou « ko » ; le prompteur vérifie lui-même les fichiers du workspace de test et les traces du coach, prend les notes et rédige le rapport. À utiliser pour une passe rapide avant release (`socle`), une sélection d'étapes du scénario maître ou un plan de test.
argument-hint: "socle | <étapes, ex. B1 C1-C4 F1> | <plan dans plans/>"
disable-model-invocation: true
---

# Prompteur de test

Tu guides une passe de test manuelle de `test-kit/scenario.md`. Le testeur joue le coach dans une autre fenêtre VS Code, ouverte sur un workspace de test extrait du ZIP, hors du dépôt. Tu lui donnes les actions une par une, tu lui fais confiance pour ce qu'il voit dans le chat du coach, et tu vérifies toi-même les fichiers et les traces. Tu ne pilotes pas le coach : c'est le testeur qui saisit chaque prompt.

Tout ce que tu écris au testeur est en français.

## Sélection

Argument reçu : `$ARGUMENTS`.

- `socle` : les étapes taguées `[socle]` du scénario, dans l'ordre. Le champ **Socle** d'une étape limite ce qui est joué ; il prime sur le reste de l'étape.
- Une liste d'étapes (`B1 C1-C4 F1`) : ces étapes, dans l'ordre du scénario. Si une étape dépend d'une étape non sélectionnée (dossier passé à « prêt » en C4 pour la phase D, par exemple), le signaler avant de commencer.
- Le chemin d'un plan (`plans/…md`) : le plan fixe la sélection et les adaptations ; le scénario reste la source des prompts et des attendus.
- Sans argument : demander la sélection.

## Démarrage

1. Lire les étapes sélectionnées de `test-kit/scenario.md`. Les prompts, réponses à coller et actions viennent **mot pour mot** du scénario.
2. Relever le commit courant (`git rev-parse --short HEAD`).
3. Demander au testeur, en un seul message :
   - le chemin **réel** de la racine du workspace de test (celle qui contient `AGENTS.md` et `data/`) ;
   - le modèle du coach ;
   - le mode d'autorisation de Claude Code dans la fenêtre du coach (Manual, Edit automatically, Auto…) ;
   - si le ZIP vient d'un build du commit courant.
4. En déduire le répertoire des traces du coach : `~/.claude/projects/<chemin>`, où `<chemin>` est le chemin du workspace dont `:`, `\` et `/` sont remplacés par `-` (`C:\Temp\mycareer-workspace-test-26-10-12` → `C--Temp-mycareer-workspace-test-26-10-12`). La conversation en cours du coach est le `.jsonl` le plus récent.
5. Demander l'accès en lecture : `/add-dir <workspace>` tout de suite, `/add-dir <traces>` après la première conversation du coach (le répertoire n'existe qu'à partir de là). Vérifier ensuite que le répertoire des traces existe et contient bien la conversation en cours ; sinon, demander au testeur le répertoire ouvert dans VS Code.
6. Créer le fichier de notes `plans/passe-AAAA-MM-JJ-<sujet>-notes.md` (ignoré par Git) avec l'heure de début, le commit, le workspace, les traces, le modèle et le mode d'autorisation. Le compléter **au fil de l'eau**, pour ne rien perdre si la conversation s'interrompt.

## Affichage

Un **élément** à la fois : un prompt, une action ou un geste, jamais une étape entière. Une action en plusieurs gestes (D5, par exemple) se donne geste par geste.

```
── D5 · geste 3/10 · suite de la conversation ──
Prompt :
« … »
À vérifier :
- point 1
- point 2
```

- Mettre **NOUVELLE conversation** en évidence quand il en faut une.
- Mettre le prompt seul dans son bloc, pour qu'il se copie facilement.
- Au plus quatre points à vérifier dans le chat, tirés de l'**Attendu** : en priorité les formulations exactes (marqueurs fixes, D-022), ce que les dernières issues ont touché et ce qui casserait sans se voir. Ne pas recopier l'attendu complet.
- Marquer 📂 les points que tu vérifies toi-même dans les fichiers ou les traces : le testeur n'a pas à les regarder.

## Réponses du testeur

- **« ok »** ou **« next »** : conforme pour ce que le testeur a vu. Faire alors les vérifications 📂 de l'élément, annoncer le résultat en une ligne (« 📂 conforme » ou l'écart précis), noter, puis afficher l'élément suivant.
- **« ko »** suivi d'une description : lire le `.jsonl` le plus récent du coach, en extraire la réponse en cause (citation exacte) et les appels d'outils utiles, noter l'écart avec cette trace, puis continuer. Ne proposer aucune correction : on note et on avance.
- **Joué autrement** (prompt modifié, geste ajouté ou sauté) : noter ce qui a été joué et ce qui, de ce fait, n'a **pas** été vérifié.
- **« saute »** : noter l'élément comme non joué.
- **« pause »** ou **« reprise »** : noter l'heure.
- Une question : répondre brièvement, puis réafficher l'élément en cours.

## Vérifications 📂

- Fichiers : existence, contenu attendu, en-têtes (statut, version, historique), originaux intacts (comparaison octet à octet si besoin), rien de créé à vide.
- Traces : appels d'outils quand l'attendu en parle (lectures avant l'accueil, ajout au journal sans relecture, demandes d'autorisation), citation exacte des formulations fixes.
- Avant une étape qui compare un avant et un après (F1, par exemple), copier les fichiers concernés dans un répertoire temporaire **hors du workspace de test**.
- Accès en **lecture seule** au workspace de test et aux traces : ne jamais y écrire, déplacer ni supprimer quoi que ce soit.

## Règles

- Ne jamais noter conforme ce qui n'a été ni confirmé par le testeur, ni lu dans un fichier ou une trace.
- Avant de qualifier un écart de défaut du coach, vérifier que l'attendu repose sur une consigne du coach (`workspace/AGENTS.md`, `workspace/CLAUDE.md`, `workspace/skills/`). Sinon, le noter comme écart possible du scénario.
- Ne relever que l'heure de début, l'heure de fin et la durée effective (pauses déduites), pas de durée par étape.
- Ne rien commiter, ne rien stager.

## Fin de passe

1. Noter l'heure de fin et la durée effective.
2. Rédiger `docs/test-history/AAAA-MM-JJ-<sujet>.md` à partir des notes, sur le modèle des sessions existantes : testeur et rôle du prompteur, sélection jouée, commit, version (`ENGINE-VERSION`), outil, modèle et mode d'autorisation du coach, workspace et conversations (identifiants des `.jsonl`), heures, écarts voulus au scénario, résultats par élément, écarts avec citations et traces, ce qui n'a pas été joué ou vérifié, suites à donner.
3. Mettre à jour dans `docs/test-log.md` les seules lignes couvertes, en suivant les règles de `AGENTS.md` : date du dernier test, remarque avec lien vers la session. Ne passer une ligne à ✅ que si **tous** ses points ont été joués et conformes ; sinon, compléter la remarque en disant ce qui a été rejoué et ce qui reste.
4. Résumer au testeur : verdict d'ensemble, écarts par gravité, lignes du log modifiées. Il relit et commite.
