# Référentiel d'exigences

Ce répertoire décrit **ce que le produit doit faire** : une exigence par règle
vérifiable, rangée par domaine. Il est l'une des quatre couches de test du
projet :

| Couche | Rôle | Emplacement |
| --- | --- | --- |
| Exigences | Règles du produit, par domaine | `docs/requirements/` (ce répertoire) |
| Tests | Manière de vérifier ces règles | [`test-kit/scenario.md`](../../test-kit/scenario.md) pour le coach, [`docs/checks.md`](../checks.md) pour le build, le dépôt et la documentation |
| Historique | Exécutions réelles, jamais réécrites | [`docs/test-history/`](../test-history/) |
| Tableau de bord | État courant de chaque exigence | [`docs/test-log.md`](../test-log.md) |

Quand et comment tester : [`docs/test-plan.md`](../test-plan.md).

## Domaines

| Domaine | Identifiant | Fichier | Périmètre |
| --- | --- | --- | --- |
| Démarrage de session | `REQ-SES` | [session.md](session.md) | Ligne de lancement, détection de la première session, accueil, prénom, salutations, fichiers obligatoires, ligne de statut du dossier, reprise depuis le workspace, `data/current-status.md` |
| Configuration | `REQ-CONF` | [configuration.md](configuration.md) | `workspace.yaml` : clé manquante, valeur invalide, langues par défaut |
| Sources du dossier | `REQ-SRC` | [sources.md](sources.md) | Dépôt des sources, copies inchangées, transcription (règles communes aux sources des opportunités), source volumineuse, références externes |
| Dossier professionnel | `REQ-PROF` | [professional-profile.md](professional-profile.md) | Validation avant écriture, statut, version, historique, perte du dossier |
| Opportunités | `REQ-OPP` | [opportunities.md](opportunities.md) | Création, numérotation, sources, analyse, messages stratégiques, statut de l'opportunité, travail avec un dossier non prêt (refus, dérogation, nouvelle passe) |
| Entretiens | `REQ-ITW` | [interviews.md](interviews.md) | Tours d'entretien, préparation, questions à poser, fiche de préparation, entretien réel |
| Simulation d'entretien | `REQ-SIM` | [simulation.md](simulation.md) | Profondeurs, tours de parole, lignes de rôle, arrêt, transcript, simulations indépendantes |
| Joker | `REQ-JOK` | [joker.md](joker.md) | Conseil et réponse proposée pendant une simulation |
| Debrief | `REQ-DEB` | [debrief.md](debrief.md) | Debrief avec ou sans transcript, dans la même conversation ou une nouvelle |
| Confidentialité et navigation web | `REQ-PRIV` | [privacy.md](privacy.md) | Rappel de confidentialité, navigation web et ses exceptions |
| Feedback produit | `REQ-FB` | [product-feedback.md](product-feedback.md) | Journal local, notes, génération et anonymisation du feedback |
| Règles transversales du coach | `REQ-COACH` | [coaching.md](coaching.md) | Aucun fait inventé, vocabulaire, langue de coaching, apprentissages durables, dates, question laissée sans réponse |
| Mise à jour du workspace | `REQ-UPD` | [workspace-update.md](workspace-update.md) | Remplacement du moteur sans perte de `data/`, retour arrière |
| Build | `REQ-BLD` | [build.md](build.md) | `build.bat`, ZIP du workspace et du kit, `ENGINE-VERSION`, script de démo |
| Dépôt | `REQ-REPO` | [repository.md](repository.md) | Aucune donnée réelle, exemples fictifs, noms obsolètes absents, historiques non réécrits, version |
| Kit de test | `REQ-KIT` | [test-kit.md](test-kit.md) | Sources fictives, scénario maître, exemple fictif |
| Référentiel de tests | `REQ-QA` | [test-process.md](test-process.md) | Exigences, tests, historique et tableau de bord |

Un nouveau domaine s'ajoute à ce tableau, avec un identifiant de deux à cinq
lettres majuscules et un fichier en anglais, en minuscules, séparé par des
tirets.

## Modèle d'exigence

Chaque fichier de domaine commence par un titre `# Exigences — <Domaine>` et
une phrase de périmètre, puis contient les exigences dans l'ordre de leur
numéro :

```markdown
### REQ-PROF-04 — Une seule incrémentation de version par session

- **Exigence** : la version augmente de 0.1 au plus une fois par session qui
  applique au moins une modification validée.
- **Origine** : #9, D-010
- **Statut** : ✅ Active
- **Message** : aucun
```

- **Titre** : identifiant `REQ-<DOMAINE>-NN`, numéroté à deux chiffres à la
  suite dans le domaine, puis un titre court.
- **Exigence** : une seule règle, formulée pour qu'un test puisse la faire
  passer ou échouer. Elle dit ce qui est attendu, pas comment le vérifier.
- **Origine** : issues et décisions qui ont créé ou modifié la règle, dans
  l'ordre chronologique (« #12, #9, D-010 »).
- **Statut** : voir ci-dessous.
- **Message**, pour une règle qui fait parler le coach au candidat, selon
  [D-022](../design/decision-log.md#d-022--ne-contraindre-le-coach-que-là-où-cest-nécessaire) :
  « aucun » ; « formulation fixe » pour un repère que le candidat reconnaît
  d'une session à l'autre, donné dans chaque langue de coaching supportée ;
  « contenu requis » quand seul le contenu du message est imposé. La
  formulation fixe elle-même reste dans les consignes du coach et dans le
  scénario : l'exigence y renvoie sans en créer une troisième copie.

## Statuts

- **🔵 Proposée** : ajoutée à l'ouverture d'une issue, avant le
  développement. Elle passe à ✅ Active à la livraison de l'issue, ou à
  ❌ Abandonnée si l'issue l'est.
- **✅ Active** : règle livrée, que le produit doit respecter.
- **⚪ Remplacée par REQ-…** : règle remplacée par une autre exigence, dont le
  statut cite l'identifiant (« ⚪ Remplacée par REQ-FB-09 (#21) »).
- **❌ Abandonnée** : règle retirée sans remplacement ; le statut cite l'issue
  et la raison (« ❌ Abandonnée (#21 : option supprimée) »).

Le statut d'une exigence dit si la règle est en vigueur ; le résultat de ses
tests (✅ Validé, ⚠️ À revalider, 🐞 Problème constaté, ⬜ Non testé) est
au tableau de bord. Seules les exigences 🔵 Proposée et ✅ Active y figurent.

## Règles

- **Identifiants stables** : un identifiant n'est jamais supprimé, réutilisé
  ni renuméroté. Une exigence remplacée ou abandonnée garde son entrée, avec
  son statut.
- **Modification** : une issue qui modifie une exigence active réécrit son
  texte, ajoute son numéro à l'Origine et la passe au tableau de bord en
  ⚠️ À revalider, « impacté par #N ». L'état antérieur reste dans Git.
- **Lien à sens unique** : chaque test cite les exigences qu'il couvre par une
  ligne « Exigences » ; une exigence ne liste pas ses tests. La correspondance
  inverse se lit au tableau de bord ou par recherche de l'identifiant.
- **Contrôles ponctuels** : un contrôle propre à la livraison d'une issue
  (entrée de décision, documentation, `CHANGELOG.md`, issue GitHub) n'est pas
  une exigence ; il va dans la checklist du plan de l'issue.
- **Exigences non fonctionnelles** : elles ont leur place ici, dans un domaine
  dédié. [`docs/non-functional/`](../non-functional/) garde les études et
  investigations.
- **Cohérence** : `test-kit/tools/check_traceability.ps1` vérifie les
  identifiants, les références et le tableau de bord.
