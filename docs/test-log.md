# Journal des tests réalisés

Ce journal conserve la trace de ce qui a **réellement été testé**, par qui et avec quel résultat. [`test-plan.md`](test-plan.md) dit ce qu'il faut tester ; ce journal dit ce qui l'a été.

Règles :

- Ne consigner que des tests effectivement réalisés. Ne jamais déduire un résultat : un comportement non essayé reste « Non testé ».
- Aucune donnée réelle : pas de contenu de CV, de nom, d'employeur ni de coordonnées. Décrire le résultat, pas les données utilisées.
- Une modification du comportement du coach après un test rend ce test **à revalider** tant que la nouvelle version n'a pas été rejouée.
- Renseigner pour chaque zone la date du **premier test** (elle ne change plus) et celle du **dernier test** (elle change à chaque rejeu).
- **Non-régression ciblée** : quand le développement d'une issue peut avoir impacté une zone déjà ✅ Validé, repasser cette zone en ⚠️ À revalider et écrire dans les remarques « Non-régression : impacté par #N » (avec une courte raison). Après rejeu réussi, la zone redevient ✅ Validé et sa date de dernier test est mise à jour.
- Ajouter une session en tête de la section « Sessions », puis mettre à jour la synthèse.

Statuts : ✅ Validé · ⚠️ À revalider · 🐞 Problème constaté · ⬜ Non testé

## Synthèse de la couverture

| Zone | Statut | Premier test | Dernier test | Remarques |
| --- | --- | --- | --- | --- |
| Build et contenu du ZIP (`data/` limité aux README, échecs de `build.bat`) | ✅ Validé | 2026-09-30 | 2026-09-30 | Échecs vérifiés par le développeur sur trois cas négatifs. |
| Déploiement et initialisation au premier lancement | ✅ Validé | 2026-09-30 | 2026-09-30 | Fichiers obligatoires créés depuis les modèles. |
| Mise à jour du workspace (moteur remplacé, `data/` conservé) | ✅ Validé | 2026-09-30 | 2026-09-30 | Fonctionne sans perte constatée. Anticipe une partie des tests de l'issue #7 ; le retour arrière (rollback) reste à tester. |
| Clé de configuration manquante : ajout et signalement | ✅ Validé | 2026-09-30 | 2026-09-30 | Rejoué avec le texte consolidé : le fichier est réécrit avec les clés manquantes et leurs valeurs par défaut, et la personne en est informée. |
| Valeur de configuration invalide : signalement sans réécriture | ✅ Validé | 2026-09-30 | 2026-09-30 | Signalée sans réécriture. À la session suivante, après correction par l'utilisateur, le coach constate que le problème noté précédemment est corrigé. |
| Transcription Markdown des sources ajoutées | ✅ Validé | 2026-09-30 | 2026-09-30 | Rejoué avec les règles consolidées, y compris lors d'un réimport complet des sources après suppression du dossier professionnel. |
| Source très volumineuse : confirmation avant transcription | ⬜ Non testé | — | — | Seuil « très volumineux » non chiffré (voir D-011). |
| Mise à jour de `external-references.md` depuis une source | ✅ Validé | 2026-09-30 | 2026-09-30 | Corrigé par la règle ajoutée : le lien LinkedIn est renseigné directement, sans demander, et signalé. |
| Mise à jour du dossier professionnel uniquement après validation | ✅ Validé | 2026-09-30 | 2026-09-30 | Essayé à plusieurs reprises : le coach demande à chaque fois la validation avant d'appliquer. |
| Reprise dans une nouvelle conversation à partir du workspace (`current-status.md`) | ✅ Validé | 2026-09-30 | 2026-09-30 | Validé dans le scénario de réinitialisation du dossier professionnel : le coach retrouve ce qu'il était en train de faire. Non couvert pour un flux d'opportunité complet. |
| Incohérence entre données et statut (dossier professionnel supprimé, sources et statut conservés) | ✅ Validé | 2026-09-30 | 2026-09-30 | Le coach signale l'incohérence, envisage une perte de fichier (par exemple synchronisation) et ne réécrit pas le dossier avant d'avoir traité le problème. |
| Retour arrière (rollback) d'une mise à jour | ⬜ Non testé | — | — | À tester avec l'issue #7, avant de le présenter comme une garantie (D-004). |

### Zones du plan de test sans test consigné

Écart relevé le 2026-09-30 entre `test-plan.md` et ce journal. « Non testé » signifie ici qu'aucun test n'est consigné : ces zones ont pu être essayées avant l'existence du journal, à confirmer par le testeur.

| Section du plan | Zone | Statut | Premier test | Dernier test | Remarques |
| --- | --- | --- | --- | --- | --- |
| Repository privacy | Recherche de données réelles, exemple fictif, `dist/` et `build/` ignorés | ⬜ Non testé | — | — | Vérification à refaire avant la release. |
| Standalone coach | Scénarios de démarrage, langues FR/EN, types d'entretien, débrief succinct, aucun fait inventé | ⬜ Non testé | — | — |  |
| Standalone coach | Profondeurs de simulation (Court, Standard, Approfondi) et mots-clés d'arrêt | ⬜ Non testé | — | — | Fonction ajoutée dans le commit 83eb165. |
| Workspace | Création des opportunités (numérotation `max + 1`, statut, sources intactes) | ⬜ Non testé | — | — |  |
| Workspace | Tours d'entretien, préparation, simulation, débrief, retour d'entretien réel | ⬜ Non testé | — | — |  |
| Workspace | Arrêt anticipé d'une simulation et simulation suivante | ⬜ Non testé | — | — |  |
| Regression | Scénarios essentiels standalone et workspace après changement du coach | ⬜ Non testé | — | — | À rejouer après les modifications de #5. |

## Sessions

### 2026-09-30 — Rejeu après consolidation des règles (issue #5)

- **Testeur** : développeur du toolkit.
- **Version** : `0.4.0-dev`.
- **Données** : workspace privé du testeur ; rien de réel n'est consigné ici.

Résultats :

- ✅ Clé de configuration manquante : réécriture du fichier avec les valeurs par défaut et signalement.
- ✅ Valeur invalide : signalée sans réécriture ; à la session suivante, le coach remarque que l'utilisateur l'a corrigée.
- ✅ Transcription des sources : fonctionne ; réimport complet réussi après suppression du dossier professionnel.
- ✅ `external-references.md` : le lien LinkedIn est renseigné directement, sans demande.
- ✅ Mise à jour du dossier professionnel : validation demandée à chaque fois.
- ✅ Incohérence détectée entre le statut conservé et le dossier professionnel supprimé ; pas de réécriture immédiate.
- ✅ Reprise via `current-status.md` dans ce même scénario.
- ⬜ Source très volumineuse : toujours non testée.
- ⬜ Retour arrière d'une mise à jour : reporté à l'issue #7.

### 2026-09-30 — Déploiement, initialisation, mise à jour et sources (issue #5)

- **Testeur** : développeur du toolkit, avec un collègue pour une partie des essais.
- **Version** : build de travail de la v0.3.0 incluant la séparation `data/` (non publiée).
- **Données** : workspace privé du testeur ; rien de réel n'est consigné ici.

Résultats :

- ✅ Build, déploiement du ZIP et initialisation au premier lancement : le workspace démarre et les fichiers obligatoires manquants sont créés.
- ✅ Mise à jour du workspace : avec les données d'un côté et le moteur (skills, instructions) de l'autre, la mise à jour se passe très bien.
- 🐞→✅ Paramètre de configuration manquant : le coach utilisait le défaut sans écrire la clé dans `workspace.yaml`, ce qui manquait de clarté. Après correction, il ajoute les clés manquantes dans l'ordre du modèle et indique le problème de démarrage et ce qu'il a ajouté. Comportement confirmé puis consolidé dans le toolkit (⚠️ à revalider sur le texte consolidé).
- ✅ Transcription des sources : les nouvelles sources ajoutées sont transcrites en `.md` ; le comportement convient.
- 🐞 `external-references.md` non mis à jour malgré un export PDF LinkedIn fourni comme CV historique. Règle ajoutée au toolkit ; à rejouer.
- ⬜ Fichiers volumineux : non essayés. À valider.

Suites à donner :

- Rejouer après la consolidation : clé manquante, valeur invalide, transcription (en-tête, illisible, non-écrasement), `external-references.md`.
- Tester une source très volumineuse et décider si un seuil chiffré est nécessaire.
- Tester la validation explicite avant toute modification du dossier professionnel.
- Tester un retour arrière de mise à jour (issue #7).
