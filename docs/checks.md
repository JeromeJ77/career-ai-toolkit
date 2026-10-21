# Contrôles du build, du dépôt et de la documentation

Tests qui ne se jouent pas avec le coach. Les tests joués avec le coach sont les
étapes de [`test-kit/scenario.md`](../test-kit/scenario.md). Chaque contrôle
cite les exigences de [`docs/requirements/`](requirements/) qu'il couvre ;
son résultat est consigné dans une session de
[`docs/test-history/`](test-history/) et reporté au tableau de bord
[`docs/test-log.md`](test-log.md).

## Référentiel de tests

### CHK-QA-01 — Traçabilité sans erreur

- **Procédure** : lancer le script de contrôle de la traçabilité depuis la
  racine du dépôt.
- **Attendu** : aucune erreur. La liste des exigences sans test,
  donnée en avertissement, est relue avec le mainteneur.
- **Exigences** : REQ-QA-02, REQ-QA-03, REQ-QA-05, REQ-QA-10

### CHK-QA-02 — Cas négatifs du script de traçabilité

- **Procédure** : sur une copie temporaire du dépôt, hors du dépôt, introduire
  tour à tour un identifiant d'exigence en double, un statut d'exigence
  inconnu, une exigence citée inexistante, une exigence remplaçante
  inexistante, une exigence active sans ligne au tableau de bord et, dans la
  colonne Tests d'une ligne du tableau de bord, un test existant qui ne cite
  pas l'exigence de la ligne, puis lancer le script.
- **Attendu** : chaque cas fait échouer le script avec un message qui nomme le
  fichier et l'identifiant en cause.
- **Exigences** : REQ-QA-02, REQ-QA-10

### CHK-QA-03 — Script de démo

- **Procédure** : lancer `build.bat`, puis ouvrir le script de démo du ZIP du
  kit de test.
- **Attendu** : aucune ligne « Exigences » ni « Plan de test » ; le nombre
  d'étapes `[demo]` est celui du build précédant la migration.
- **Exigences** : REQ-QA-11

### CHK-QA-04 — Couverture affichée par le mod

- **Procédure** : charger le mod `test-coverage`, lancer `/test-coverage`
  puis `/test-coverage -v`.
- **Attendu** : le total est égal au nombre d'exigences proposées ou actives ; le détail donne une ligne par domaine ; les sections annexes ne sont
  pas comptées.
- **Exigences** : REQ-QA-05, REQ-QA-12

### CHK-QA-05 — Table de migration complète

- **Procédure** : parcourir la table de migration de l'issue #20.
- **Attendu** : chaque puce de l'ancien plan de test et chaque ligne de
  l'ancien journal a une destination : une ou plusieurs exigences, ou « non
  migré » avec sa raison (contrôle ponctuel de livraison, doublon). Les règles
  remplacées gardent leur origine. Le mainteneur relit un domaine complet.
- **Exigences** : REQ-QA-01, REQ-QA-09

### CHK-QA-06 — Statuts justifiés par les sessions

- **Procédure** : tirer un échantillon d'exigences ✅ Validé, dans plusieurs
  domaines, et ouvrir la session citée pour chacune.
- **Attendu** : la session joue exactement ce que dit l'exigence, avec un
  résultat conforme, sur une version postérieure au dernier changement de
  l'exigence.
- **Exigences** : REQ-QA-06

### CHK-QA-07 — Plus de renvoi à l'ancien plan

- **Procédure** : rechercher « Plan de test » dans `test-kit/scenario.md`, et
  les renvois à `docs/test-plan.md` dans `AGENTS.md`, `CONTRIBUTING.md`,
  `test-kit/` et `.claude/skills/prompteur/`.
- **Attendu** : chaque étape du scénario cite ses exigences par une ligne
  « Exigences » ; `docs/test-plan.md` n'est plus cité comme liste de
  vérifications, seulement comme stratégie de test.
- **Exigences** : REQ-QA-03, REQ-QA-04, REQ-QA-08

### CHK-QA-08 — Historique inchangé

- **Procédure** : comparer `docs/test-history/` avec son état avant la
  migration (`git diff` sur les fichiers existants).
- **Attendu** : aucune session existante n'est modifiée.
- **Exigences** : REQ-QA-07

### CHK-QA-09 — Passe courte avec le prompteur

- **Procédure** : jouer B2 avec `/prompteur B2` dans un workspace de test.
- **Attendu** : la session rédigée cite les tests joués (B2) ; seules les
  exigences citées par B2 sont mises à jour au tableau de bord, selon
  REQ-QA-06.
- **Exigences** : REQ-QA-04, REQ-QA-07, REQ-QA-13
