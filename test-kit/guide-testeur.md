# Guide du testeur

Ce guide aide à dérouler `scenario.md` et à garder une trace exploitable des résultats, pour en tirer un journal de test et un rapport. Il s'applique aussi bien à un déroulé manuel complet qu'à une démonstration.

## Avant de commencer

- Extraire le ZIP du workspace **hors du dépôt**, l'ouvrir comme projet dans VS Code avec Claude Code (ou l'outil IA équivalent).
- Les fichiers à déposer viennent du ZIP du kit (`sources/profile/`, `sources/opportunity/`). Le scénario indique pour chaque étape où les copier.
- Préparer un fichier de notes **en dehors du workspace et du dépôt** (par exemple à côté du workspace extrait).
- Les données sont fictives : aucune précaution de confidentialité particulière n'est nécessaire pour les notes ou pour un assistant de prise de notes externe. N'y mélangez jamais de vraies données.

## Pendant le déroulé

- **Une entrée par étape**, identifiée par son code dans le scénario (A1, B1, C1, D1…). Cela permet de relier chaque résultat au scénario et au plan de test.
- **Distinguer deux origines d'écart** : le coach ne fait pas ce que le scénario attend (défaut du moteur), ou le scénario est mal formulé ou incomplet (défaut du kit).
- **Noter la durée réelle** des étapes `[demo]` : elle sert à ajuster la durée totale de la démo.
- **Ne rien corriger en cours de route.** Noter l'écart et continuer, sinon l'état réel est perdu.
- **Conserver le texte réel du coach** (copier-coller) quand il décide entre un défaut du moteur et un défaut du scénario ; une reformulation de mémoire suffit rarement.
- **Garder une trace des fichiers produits** : un `ls -R` (ou une capture de l'arborescence) de `data/` après les étapes qui créent des fichiers (par exemple D1, D4, D10, E1). C'est plus fiable qu'une description orale.
- Ne jouer que ce qui est demandé : une étape non jouée est notée « non jouée », jamais déduite.

### Modèle d'entrée

```
## D4
- Verdict : OK / écart / KO / non joué
- Début : 10:42:05
- Fin : 10:45:45
- Durée : 3 min 40 s
- Conversation : nouvelle / suite de D3 / non relevée
- Observé : ce que le coach a fait (fichiers créés, questions posées), résumé
- Écart : différences avec l'attendu seulement, ou « aucun »
- Notes : remarques, bons points, améliorations, corrections de scénario
- Extrait : citation du coach si elle est révélatrice
```

Les retours du coach sont **résumés** : les transcripts et les fichiers produits suffisent comme trace. Ne garder le texte intégral que pour un écart où la formulation exacte compte.

## Prise de notes à la voix avec un assistant

On peut ouvrir en parallèle une conversation avec un assistant (Copilot, Claude web ou autre) qui joue le scribe, pour noter à voix haute sans casser le rythme du déroulé.

### Prompt à coller au début de la conversation

> Tu es mon scribe pendant un test logiciel. Je vais te parler à voix haute en déroulant un scénario dont les étapes ont des identifiants (A1, B1, C1, D1…). Ne commente pas, ne me conseille pas, ne réponds que « noté » ou « noté, étape D4 ouverte ».
>
> Quand je dis le code d'une étape suivi de « début », ouvre une entrée et relève l'heure au format HH:MM:SS, secondes comprises ; quand je dis « terminé », relève l'heure de fin de la même façon et calcule la durée à la seconde près (« 3 min 40 s »). Utilise l'horloge réelle si tu y as accès. Si tu n'y as pas accès, dis-le-moi tout de suite, une seule fois, et je te dicterai l'heure affichée par mon poste, secondes comprises, à chaque début et fin (« D4, début, dix heures quarante-deux minutes cinq secondes ») : calcule alors la durée à partir de ces heures. N'estime ou ne devine jamais une heure ni une durée ; si une heure manque, écris « non relevée ».
>
> Pour chaque étape, retiens aussi : le verdict (OK, écart, KO, non joué) ; si je change de conversation avec le coach (« nouvelle conversation ») ou si je reste dans la même (« suite de D3 »), sinon « non relevée » ; ce que le coach a fait, en résumé, sans reproduire ses réponses en entier ; l'écart avec l'attendu, et seulement l'écart ; mes remarques, bons points, idées d'amélioration et corrections de scénario, quand je dis « note » suivi de la remarque ; les citations que je te dicte entre guillemets, sans les reformuler. Ne déduis jamais un verdict : si je ferme une étape sans l'avoir donné, demande-le-moi.
>
> Si je dis « note transversale » suivi d'une remarque, garde-la à part, hors des étapes.
>
> Quand je dis « récap », donne-moi les entrées de la phase en cours dans ce format, une section par étape, sans rien ajouter ni déduire :
> `## D4` / `- Verdict :` / `- Début :` / `- Fin :` / `- Durée :` / `- Conversation :` / `- Observé :` / `- Écart :` / `- Notes :` / `- Extrait :`
>
> Quand je dis « fin du déroulé » ou « export », produis un fichier Markdown téléchargeable (ou, à défaut, un seul bloc de texte à copier) contenant : la date, les étapes jouées et non jouées, toutes les entrées dans le format ci-dessus, puis une section « Notes transversales » avec les remarques gardées à part.

### Habitudes qui évitent les mauvaises surprises

- **Annoncer l'étape avant de parler** : « D4, début », puis « D4, terminé ». Sans cela, les remarques sont rattachées à la mauvaise étape, et l'assistant ne peut pas chronométrer.
- **Vérifier dès le début que l'assistant sait relever l'heure.** Beaucoup d'assistants conversationnels n'ont pas d'horloge fiable : demandez-lui l'heure au tout début et comparez avec votre poste. S'il se trompe ou ne sait pas, dictez l'heure, secondes comprises, à chaque début et fin d'étape ; il calcule la durée, ce qui reste plus fiable que son estimation.
- **Épeler les noms de fichiers et de répertoires** qui comptent (`001-lumen-pay-…`, `sources/`) : la reconnaissance vocale les déforme souvent.
- **Demander un « récap » à la fin de chaque phase** (A à C, D, E, F), pas seulement à la fin du déroulé. Une conversation vocale longue peut perdre des détails, et les erreurs de compréhension se corrigent tout de suite.
- **Dire « nouvelle conversation » ou « même conversation »** en ouvrant une étape : le scénario distingue les deux, et c'est ce qui prouve que le coach repart des fichiers.
- **Donner le verdict en fermant l'étape**, sinon le scribe doit le demander.
- **Ne pas dicter les citations du coach ni les sorties `ls -R`** : les coller à la main dans le fichier de notes.
- **Travailler dans un workspace renommé**, par exemple avec le suffixe `-test`, pour ne jamais confondre avec un workspace personnel ou avec `workspace/` du dépôt.

## Après le déroulé

1. Rassembler l'export final de l'assistant (« fin du déroulé »), les citations collées et les arborescences.
2. Dans le dépôt, demander à l'assistant de développement de consigner les résultats : mise à jour du tableau de synthèse de `docs/test-log.md` (statuts ✅ Validé, ⚠️ À revalider, 🐞 Problème constaté, ⬜ Non testé, avec les dates) et création d'un fichier de session daté dans `docs/test-history/` (`AAAA-MM-JJ-sujet-court.md`, avec un indice `-2`, `-3` si le même test est refait le même jour), lié depuis l'index du journal. Les heures relevées figurent dans le fichier de session, jamais dans son nom. Seul ce qui a réellement été joué y figure. Le récap de l'assistant scribe peut servir de base à ce fichier.
3. Demander un rapport court qui classe les écarts par origine : à corriger dans le moteur (skills, guidelines, standalone), à corriger dans le kit (scénario, sources, prompts), ou à mettre au backlog.
4. Relire les correctifs proposés avant tout commit : ils vont dans un second commit, après les résultats.
