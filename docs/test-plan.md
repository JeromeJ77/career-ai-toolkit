# Stratégie de test

Ce document dit **quoi tester et quand**. Il ne liste pas les cas de test : les règles du produit sont dans le référentiel d'exigences, et chaque test cite les exigences qu'il vérifie. L'ancien plan de test, qui listait les cas par zone et par issue, reste lisible au commit `846a271` (`git show 846a271:docs/test-plan.md`).

## Quatre couches

| Couche | Rôle | Emplacement |
| --- | --- | --- |
| Exigences | Ce que le produit doit faire : une règle vérifiable par exigence, rangée par domaine, avec un identifiant stable (`REQ-SES-02`) | [`requirements/`](requirements/README.md) |
| Tests | Comment vérifier ces règles : étapes du scénario maître, jouées avec le coach, et contrôles sans coach (build, dépôt, documentation, kit de test). Chaque test cite les exigences qu'il vérifie par sa ligne « Exigences » | [`test-kit/scenario.md`](../test-kit/scenario.md), [`checks.md`](checks.md) |
| Historique | Ce qui a réellement été joué : une session par fichier, jamais réécrite | [`test-history/`](test-history/) |
| Tableau de bord | État courant de chaque exigence suivie : statut de test, dernier test, version, tests et session qui le fondent | [`test-log.md`](test-log.md) |

Le lien va dans un seul sens : un test cite ses exigences, une exigence ne liste pas ses tests. La correspondance inverse se lit au tableau de bord ou par recherche de l'identifiant. Un test est désigné par le code de son étape (`B2`), au besoin avec le numéro de l'invite (`C4.2` pour le prompt 2 de C4), ou par l'identifiant d'un contrôle (`CHK-BLD-03`).

## Quand tester

### À l'ouverture d'une issue

En tests d'acceptation écrits d'abord :

1. Relever au tableau de bord les exigences des domaines touchés qui sont ⚠️ À revalider, 🐞 Problème constaté ou ⬜ Non testé, et les signaler.
2. Ajouter les nouvelles règles en exigences 🔵 Proposée, ou modifier les exigences actives, avec l'origine `#N` (modèle et règles dans [`requirements/README.md`](requirements/README.md)). Une exigence n'est jamais supprimée ni renumérotée : une règle remplacée ou abandonnée passe en ⚪ Remplacée par REQ-… ou ❌ Abandonnée.
3. Ajouter ou ajuster les étapes du scénario et les contrôles qui les citent, et leurs lignes au tableau de bord : ⬜ Non testé pour une nouvelle exigence, ⚠️ À revalider pour une exigence modifiée.
4. Relire exigences et tests avec le mainteneur avant le développement.

Les contrôles propres à la livraison de l'issue (entrée de décision, documentation, `CHANGELOG.md`, issue GitHub) ne sont pas des exigences : ils vont dans la checklist du plan d'implémentation.

### Pendant le développement

Revenir sur les exigences et les tests pour y ajouter les cas oubliés. Le plan d'implémentation nomme par leur identifiant les exigences que le changement peut impacter.

### À la livraison d'une issue

Les exigences 🔵 Proposée de l'issue passent en ✅ Active (ou en ❌ Abandonnée si l'issue l'est). Les tests manuels de l'issue sont consignés dans une session, puis au tableau de bord.

### Non-régression ciblée

Après tout changement des consignes du coach (`workspace/AGENTS.md`, `workspace/CLAUDE.md`, `workspace/skills/`) ou de ce qui les entoure (build, modèles, kit), les exigences impactées passent au tableau de bord en ⚠️ À revalider, avec « impacté par #N » et une raison courte dans la section « À revalider ». Les rejouer, c'est jouer les tests qui les citent, trouvés au tableau de bord ou par recherche de l'identifiant dans le scénario et les contrôles. Ce rejeu se fait avant la release, pas forcément avant chaque commit. Aucun tag `[regression]` n'est ajouté au scénario.

### Passe de release

1. Jouer les étapes `[socle]` du scénario, le parcours essentiel d'un pilote francophone sur une installation neuve, de préférence avec le prompteur (`/prompteur socle`).
2. Jouer les contrôles du build (`CHK-BLD`) et du dépôt (`CHK-REPO`) de [`checks.md`](checks.md).
3. Lancer le script de traçabilité (ci-dessous).
4. Revoir avec le mainteneur toutes les exigences qui ne sont pas ✅ Validé, en priorité les ⚠️ et les 🐞, et le laisser décider de les rejouer ou de publier quand même. Ne jamais les marquer validées sans test.

## Consigner les tests

- Ne consigner que des tests effectivement réalisés. Ne jamais déduire un résultat : un comportement non essayé reste ⬜ Non testé. Aucun comportement n'est validé par une simple migration de documentation.
- Aucune donnée réelle : pas de contenu de CV, de nom, d'employeur ni de coordonnées. Décrire le résultat, pas les données utilisées.
- Une session par fichier de [`test-history/`](test-history/), nommé `AAAA-MM-JJ-sujet-court.md` (date en tête, sujet en minuscules sans accents, séparé par des tirets). Si le même test est refait le même jour, la première session garde le nom de base et les suivantes reçoivent `-2`, `-3`, etc. Pas d'heure dans le nom.
- La session indique la date, le testeur, la version (commit et `ENGINE-VERSION`), les données utilisées, les résultats en citant les tests joués par leur identifiant, ce qui n'a pas été joué et les suites à donner. Les heures de début et de fin y figurent quand elles ont été relevées, jamais estimées.
- Ajouter le lien de la session en tête de la section « Sessions » du tableau de bord.
- Une session n'est plus modifiée après coup, sauf pour corriger une erreur de consignation. Un rejeu donne une nouvelle session.

## Mettre à jour le tableau de bord

Pour chaque exigence citée par les tests joués (ligne « Exigences » de l'étape ou du contrôle, en tenant compte des sous-identifiants) :

- ✅ Validé seulement si **tous** les tests qui citent l'exigence sont passés sur une version postérieure à son dernier changement ;
- 🐞 Problème constaté si l'un d'eux a échoué ; l'écart va dans la section « Écarts ouverts », avec un renvoi au backlog ou à l'issue ;
- ⚠️ À revalider si un changement l'a impactée depuis son dernier test ;
- ⬜ Non testé en l'absence de test consigné.

Mettre à jour Dernier test, Version, Tests (identifiants des tests joués qui citent l'exigence) et Session. Une remarque tient en une ligne au plus, entre parenthèses à la fin du Résumé.

## Contrôler la traçabilité

Lancer, depuis la racine du dépôt, avant un commit qui touche le référentiel, le scénario, les contrôles ou le tableau de bord, et avant une release :

```
powershell -NoProfile -ExecutionPolicy Bypass -File test-kit\tools\check_traceability.ps1
```

Aucune erreur ne doit rester. Les avertissements (exigences qu'aucun test ne cite) sont relus avec le mainteneur. Détail des contrôles : [`test-kit/tools/README.md`](../test-kit/tools/README.md).

## Outils

- `/prompteur` (`.claude/skills/prompteur/`) guide une passe manuelle élément par élément, vérifie les fichiers et les traces du coach, rédige la session et met à jour le tableau de bord.
- `/test-coverage` (`test-kit/tools/test-coverage/`) affiche la répartition des statuts du tableau de bord.
- Les tests du coach sont manuels. Les tests automatisés restent une idée du backlog.
