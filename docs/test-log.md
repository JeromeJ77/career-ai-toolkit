# Journal des tests réalisés

Ce journal conserve la trace de ce qui a **réellement été testé**, par qui et avec quel résultat. [`test-plan.md`](test-plan.md) dit ce qu'il faut tester ; ce journal dit ce qui l'a été.

Règles :

- Ne consigner que des tests effectivement réalisés. Ne jamais déduire un résultat : un comportement non essayé reste « Non testé ».
- Aucune donnée réelle : pas de contenu de CV, de nom, d'employeur ni de coordonnées. Décrire le résultat, pas les données utilisées.
- Une modification du comportement du coach après un test rend ce test **à revalider** tant que la nouvelle version n'a pas été rejouée.
- Renseigner pour chaque zone la date du **premier test** (elle ne change plus) et celle du **dernier test** (elle change à chaque rejeu).
- **Non-régression ciblée** : quand le développement d'une issue peut avoir impacté une zone déjà ✅ Validé, repasser cette zone en ⚠️ À revalider et écrire dans les remarques « Non-régression : impacté par #N » (avec une courte raison). Après rejeu réussi, la zone redevient ✅ Validé et sa date de dernier test est mise à jour.
- Consigner chaque session dans son propre fichier de [`test-history/`](test-history/), nommé `AAAA-MM-JJ-sujet-court.md` (date en tête pour le tri chronologique, sujet en minuscules sans accents, séparé par des tirets). Pas d'heure dans le nom : si le même test est refait le même jour, la première session garde le nom de base et les suivantes reçoivent un indice `-2`, `-3`, etc. avant l'extension. Le fichier indique obligatoirement la **date**, le testeur, la version, les données utilisées, les résultats et les suites à donner ; les heures de début et de fin (de la session ou de chaque étape) y figurent quand elles ont été relevées, jamais estimées. Ajouter ensuite le lien en tête de la section « Sessions » ci-dessous, puis mettre à jour la synthèse.
- Un fichier de `test-history/` n'est plus modifié après coup, sauf pour corriger une erreur de consignation. Un rejeu donne une nouvelle session.

Statuts : ✅ Validé · ⚠️ À revalider · 🐞 Problème constaté · ⬜ Non testé

## Synthèse de la couverture

| Zone | Statut | Premier test | Dernier test | Remarques |
| --- | --- | --- | --- | --- |
| Build et contenu du ZIP (`data/` limité aux README, échecs de `build.bat`) | ✅ Validé | 2026-09-30 | 2026-09-30 | Échecs vérifiés par le développeur sur trois cas négatifs. |
| Déploiement et initialisation au premier lancement | ✅ Validé | 2026-09-30 | 2026-10-02 | Fichiers obligatoires créés depuis les modèles ; rejoué le 2026-10-02 dans le déroulé complet (B1, B2, B3). |
| Mise à jour du workspace (moteur remplacé, `data/` conservé) | ✅ Validé | 2026-09-30 | 2026-09-30 | Fonctionne sans perte constatée. Anticipe une partie des tests de l'issue #7 ; le retour arrière (rollback) reste à tester. |
| Clé de configuration manquante : ajout et signalement | ✅ Validé | 2026-09-30 | 2026-10-02 | Rejoué avec le texte consolidé : le fichier est réécrit avec les clés manquantes et leurs valeurs par défaut, et la personne en est informée. Confirmé le 2026-10-02 (B4). |
| Valeur de configuration invalide : signalement sans réécriture | ✅ Validé | 2026-09-30 | 2026-10-02 | Signalée sans réécriture, valeur par défaut utilisée pour la session. Confirmé le 2026-10-02 (B5). |
| Transcription Markdown des sources ajoutées | ✅ Validé | 2026-09-30 | 2026-10-02 | Rejoué le 2026-10-02 avec les PDF, DOCX et TXT du kit (C1, C5) : transcriptions fidèles ; réserve sur un tableau de PDF extrait dans le désordre, signalée par le coach. Les PDF d'offre n'ont pas reçu de transcription `.md` à côté de l'original (voir #12). |
| Source très volumineuse : confirmation avant transcription | ⬜ Non testé | — | — | Seuil « très volumineux » non chiffré (voir D-011). |
| Mise à jour de `external-references.md` depuis une source | ✅ Validé | 2026-09-30 | 2026-09-30 | Corrigé par la règle ajoutée : le lien LinkedIn est renseigné directement, sans demander, et signalé. |
| Mise à jour du dossier professionnel uniquement après validation | ✅ Validé | 2026-09-30 | 2026-10-02 | Le coach demande à chaque fois la validation avant d'appliquer ; confirmé le 2026-10-02 (C1, C2, D12). |
| Reprise dans une nouvelle conversation à partir du workspace (`current-status.md`) | ⚠️ À revalider | 2026-09-30 | 2026-10-02 | Couvert le 2026-10-02 sur un flux d'opportunité (D8, D9, D12, E1) : le coach retrouve l'opportunité et l'étape en cours. Écart : il ne relit pas le dossier professionnel au démarrage et répète un statut périmé (« profil vide », C1 et E1). Démarrage d'une nouvelle conversation supérieur à une minute. |
| Incohérence entre données et statut (dossier professionnel supprimé, sources et statut conservés) | 🐞 Problème constaté | 2026-09-30 | 2026-10-02 | Régression le 2026-10-02 (C7) : le coach recrée le squelette vide depuis le modèle avant de signaler l'incohérence, au lieu de demander de clarifier. Le passage de `allow_external_web_search` à `true` n'est pas signalé comme sensible. |
| Retour arrière (rollback) d'une mise à jour | ⬜ Non testé | — | — | À tester avec l'issue #7, avant de le présenter comme une garantie (D-004). |

### Zones du plan de test sans test consigné

Écart relevé le 2026-09-30 entre `test-plan.md` et ce journal. « Non testé » signifie ici qu'aucun test n'est consigné : ces zones ont pu être essayées avant l'existence du journal, à confirmer par le testeur.

| Section du plan | Zone | Statut | Premier test | Dernier test | Remarques |
| --- | --- | --- | --- | --- | --- |
| Repository privacy | Recherche de données réelles, exemple fictif, `dist/` et `build/` ignorés | ⬜ Non testé | — | — | Vérification à refaire avant la release. |
| Standalone coach | Scénarios de démarrage, langues FR/EN, types d'entretien, débrief succinct, aucun fait inventé | ⬜ Non testé | — | — |  |
| Standalone coach | Profondeurs de simulation (Court, Standard, Approfondi) et mots-clés d'arrêt | ⬜ Non testé | — | — | Fonction ajoutée dans le commit 83eb165. Le comportement partagé a été observé côté workspace le 2026-10-02 (D5, D7), pas en standalone. |
| Workspace | Création des opportunités (numérotation `max + 1`, statut, sources intactes) | ✅ Validé | 2026-10-02 | 2026-10-02 | D1 et E1 : `001` puis `002`, `sources/` créé par le coach quand le fichier est fourni dans la conversation, originaux intacts, statuts mis à jour. Pas de transcription `.md` des PDF d'offre (à trancher dans #12). |
| Workspace | Tours d'entretien, préparation, simulation, débrief, retour d'entretien réel | 🐞 Problème constaté | 2026-10-02 | 2026-10-02 | D3 à D12 : flux complet joué. Écarts : `interview.md` du tour non mis à jour pendant préparation, simulations et debriefs (D6, D7, D9 ; mis à jour seulement au retour d'entretien réel D12) ; la deuxième simulation fait référence à la première (« Rebonjour… on reprend ») ; retrait d'un message stratégique supprime la section (D2). |
| Workspace | Vérification des questions à poser avant la fiche de préparation ; refus accepté, fiche avec sections vides | ✅ Validé | 2026-10-02 | 2026-10-02 | D11 (fiche demandée sans questions : le coach le signale et génère quand même) puis D10 (questions travaillées, fiche régénérée). Mise en page de la fiche à revoir. |
| Workspace | Arrêt anticipé d'une simulation et simulation suivante | ✅ Validé | 2026-10-02 | 2026-10-02 | « stop » et « arrête la simulation » arrêtent immédiatement ; transcript et statut écrits, pas d'interprétation (D5, D7). Amélioration souhaitée : confirmation avant l'arrêt. |
| Regression | Scénarios essentiels standalone et workspace après changement du coach | ⬜ Non testé | — | — | À rejouer après les modifications de #5. |

### Scénarios à satisfaire pour l'issue #12 (kit de test, script de démo, exemple fictif)

Définis le 2026-10-01 et adaptés au périmètre révisé de l'issue. Premier déroulé complet le 2026-10-02 (phases A à E).

| Section du plan | Scénario | Statut | Premier test | Dernier test | Remarques |
| --- | --- | --- | --- | --- | --- |
| Kit de test | Sources Markdown du profil de développeur fictif, réalistes et cohérentes (`sources/profile/`) | ✅ Validé | 2026-10-02 | 2026-10-02 | Dossier professionnel construit par le coach fidèle aux quatre sources, points à trancher pertinents (C1, C2, C5). Un écart mineur : « environ 8 ans » au lieu de sept. |
| Kit de test | Au moins deux opportunités fictives (`sources/opportunity/`) | ✅ Validé | 2026-10-02 | 2026-10-02 | Lumen Pay et Northwind Ledger exploitées jusqu'au bout (D1, E1). Répertoire du kit à renommer `opportunities/`. |
| Kit de test | Génération des PDF et DOCX par le script à part ; fichiers commités conformes | ✅ Validé | 2026-10-01 | 2026-10-01 | Six fichiers générés ; rendu des PDF (titres, puces, tableau) et styles du DOCX vérifiés. |
| Scénario maître | Fichiers, destination, prompt, mots-clés, résultat attendu et item du plan pour chaque étape | ⚠️ À revalider | 2026-10-02 | 2026-10-02 | Déroulable de bout en bout, mais douze corrections relevées (clés de langue en B6, source volumineuse absente pour C6, prompts à aligner en D2 à D5 et D8, D7 à redécouper, champ Conversation à expliciter). Voir la session du 2026-10-02. |
| Build | ZIP du kit de démo et de test avec sources et script de démo limité aux étapes `[demo]` | ✅ Validé | 2026-10-01 | 2026-10-01 | `career-ai-test-kit-v0.4.0-dev.zip` : README, scénario, script de démo (16 étapes après ajout de D4), 7 sources sans les `.md`. |
| Script de démo | Étapes `[demo]` tenant en environ 30 minutes | 🐞 Problème constaté | 2026-10-02 | 2026-10-02 | Environ 1 h 29 mesurée pour les étapes `[demo]` chronométrées, contre 34 min prévues (D1 8 min, D2 13 min, D5 18 min, D6 12 min, D7 14 min). Durées et découpage à revoir. |
| Scénario maître | Déroulé complet dans un workspace neuf, sources fictives uniquement | ⚠️ À revalider | 2026-10-02 | 2026-10-02 | Phases A à E jouées (C3, C4, C6, E2, E3, E4 non jouées), F non jouée. Cinq écarts moteur (C7, D2, D6, D7, D9) à corriger puis rejouer de façon ciblée. |
| Exemple fictif | `examples/fictitious-developer/data/` issu du déroulé, arborescence `data/` seule | ⬜ Non testé | — | — | Copie brute du déroulé relue le 2026-10-02 ; à nettoyer (chemins locaux, traces du scénario, transcript 01, simulation 02, `interview.md` périmé) avant d'être considérée comme l'exemple. |
| Scénario maître | Étapes dépendant de #6, #9, #10, #11 taguées `[todo #N]` | ✅ Validé | 2026-10-02 | 2026-10-02 | C3, C4, E2, E4 identifiées et sautées comme prévu. |
| Kit de test | Transcription des PDF, DOCX et TXT fictifs par le coach | ✅ Validé | 2026-10-02 | 2026-10-02 | Quatre sources de profil transcrites fidèlement (C1, C5) ; tableau du certificat extrait dans le désordre, signalé par le coach. PDF d'offre : contenu repris dans `opportunity.md` sans `.md` à côté de l'original ; TXT rangé dans `sources/` puis repris dans `actual/notes.md` (E1). |
| Build | Script de génération jamais appelé, aucune nouvelle dépendance | ✅ Validé | 2026-10-01 | 2026-10-01 | `build.bat` n'appelle que PowerShell ; le script Python n'y figure pas. |
| Build | Échec clair si `scenario.md` ou une source requise du kit manque | ⚠️ À revalider | 2026-10-01 | 2026-10-01 | `scenario.md` retiré : échec clair. Source PDF retirée : non testé, fichier verrouillé par OneDrive pendant l'essai (même boucle de vérification). |
| Build | ZIP du workspace sans donnée fictive, kit de test ni exemple | ✅ Validé | 2026-10-01 | 2026-10-01 | Aucune entrée du ZIP ne correspond à `test-kit`, `example`, `berkani` ou `lumen`. |
| Confidentialité | Aucune donnée réelle dans `test-kit/` et `examples/` ; plus de référence à l'ancien exemple | ✅ Validé | 2026-10-01 | 2026-10-01 | Adresses en `.example`, téléphone `06 00 00 00 01`, URL LinkedIn `-example`. Les slugs `001-acme-principal-architect` des guidelines sont des exemples de nommage, pas des renvois. |
| Règle de projet | `AGENTS.md` et `CONTRIBUTING.md` cohérents sur la règle kit de test et démo | ⬜ Non testé | — | — | Documentation. |

## Sessions

Le détail de chaque session est dans [`test-history/`](test-history/), un fichier par session, du plus récent au plus ancien :

- [2026-10-02 — Premier déroulé complet du scénario maître (issue #12)](test-history/2026-10-02-deroule-complet-scenario-maitre.md)
- [2026-10-01 — Kit de test, génération des sources et build (issue #12)](test-history/2026-10-01-kit-de-test-generation-et-build.md)
- [2026-09-30 — Rejeu après consolidation des règles (issue #5)](test-history/2026-09-30-rejeu-apres-consolidation-des-regles.md)
- [2026-09-30 — Déploiement, initialisation, mise à jour et sources (issue #5)](test-history/2026-09-30-deploiement-initialisation-mise-a-jour-et-sources.md)
