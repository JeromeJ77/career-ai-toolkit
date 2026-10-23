# Journal des tests réalisés

Ce tableau de bord donne l'état courant des tests de chaque exigence suivie (🔵 Proposée ou ✅ Active) du [référentiel d'exigences](requirements/README.md), une table par domaine. Les règles de consignation et la stratégie de test sont dans [`test-plan.md`](test-plan.md) ; chaque session est consignée dans [`test-history/`](test-history/). Le journal antérieur au référentiel (synthèse par zone et tables par issue, avec leurs remarques) reste lisible au commit `846a271` : `git show 846a271:docs/test-log.md`.

Statuts : ✅ Validé · ⚠️ À revalider · 🐞 Problème constaté · ⬜ Non testé

Colonnes :

- **Résumé** : titre court de l'exigence, suivi au besoin d'une remarque d'une ligne entre parenthèses. Les écarts et les impacts vont dans « Écarts ouverts » et « À revalider ».
- **Dernier test** et **Session** : date de la session qui fonde le statut et lien vers elle ; « — » pour ⬜. Quand la seule preuve est une remarque de l'ancien journal, sans session qui la consigne, la Session porte le texte « journal antérieur », sans lien, avec la date de la remarque.
- **Version** : commit court donné par la session, sinon `ENGINE-VERSION` indiqué dans la session, sinon « — ».
- **Tests** : identifiants, séparés par des virgules, des tests de cette session qui citent l'exigence (étape `B2`, invite `C4.2`, contrôle `CHK-BLD-03`), jamais de texte libre ; « — » si aucun. Sur une ligne déjà testée, « — » signale une preuve antérieure au référentiel, sans test actuel qui cite l'exigence : le prochain rejeu passe par les tests qui la citent.

## Tableau de bord

### Démarrage de session (`REQ-SES`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-SES-01 | Consignes du workspace appliquées dès l'ouverture | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-02 | Ligne de lancement | ✅ Validé | 2026-10-11 | affa1f0 | B1.1, B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-03 | Aucun préambule | 🐞 Problème constaté | 2026-10-11 | affa1f0 | B1.1, B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-04 | Aucune phrase d'état quand rien n'a changé | ✅ Validé | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-05 | Détection de la première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-06 | Perte possible de `data/current-status.md` | ⬜ Non testé | — | — | — | — |
| REQ-SES-07 | Accueil de première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-08 | Accueil avant tout examen des données | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-09 | Attente de la réponse au prénom | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-10 | Pas d'accueil hors première session | ⚠️ À revalider | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-11 | Fichiers obligatoires créés à la première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-12 | Compte rendu de création en une phrase | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-13 | Proposition de la première étape | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-14 | Session suivante sans création ni réécriture | ✅ Validé | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-15 | Fichier obligatoire manquant recréé seul | ⚠️ À revalider | 2026-10-05 | 3dec49c | B3 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-SES-16 | Fichier personnalisé laissé intact | ⚠️ À revalider | 2026-10-05 | 3dec49c | B3 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-SES-17 | Prénom accepté | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-18 | « Oui » sans prénom | ✅ Validé | 2026-10-05 | 0.4.0-dev | B7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-19 | Prénom refusé | ✅ Validé | 2026-10-05 | 0.4.0-dev | B7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-20 | Question du prénom ignorée | ✅ Validé | 2026-10-05 | 0.4.0-dev | B7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-21 | Question du prénom sans accueil | ✅ Validé | 2026-10-11 | 0.4.0-dev | B7 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-SES-22 | Salutation de début de conversation | ✅ Validé | 2026-10-11 | affa1f0 | B2, C4.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-23 | Au revoir | ✅ Validé | 2026-10-05 | 0.4.0-dev | B7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-24 | Prénom limité à la salutation (une occurrence naturelle jugée bonne : règle à assouplir, backlog) | ✅ Validé | 2026-10-05 | 0.4.0-dev | B2 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-25 | Aucune ligne de statut en première session | ✅ Validé | 2026-10-09 | 5c3f748 | — | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-SES-26 | Ligne de statut du dossier | ✅ Validé | 2026-10-11 | affa1f0 | B2, C4.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-27 | Ligne de statut en anglais | ⬜ Non testé | — | — | — | — |
| REQ-SES-28 | Démarrage de session en anglais | ⚠️ À revalider | 2026-10-05 | 3dec49c | B9 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-SES-29 | Dossier professionnel lu avant de répondre | ✅ Validé | 2026-10-11 | affa1f0 | C1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-30 | État courant périmé corrigé | 🐞 Problème constaté | 2026-10-05 | 0.4.0-dev | — | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SES-31 | Reprise depuis l'espace carrière | ✅ Validé | 2026-10-11 | affa1f0 | — | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SES-32 | État courant minimal | ✅ Validé | 2026-10-05 | 3dec49c | E1.2 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-SES-33 | Salutation et au revoir en anglais | ⬜ Non testé | — | — | — | — |

### Configuration (`REQ-CONF`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-CONF-01 | Clé manquante ajoutée à sa place | ⚠️ À revalider | 2026-10-11 | 0.4.0-dev | B7 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-CONF-02 | Clé ajoutée signalée | ✅ Validé | 2026-10-11 | 0.4.0-dev | B7 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-CONF-03 | Aucun ajout quand rien ne manque | ✅ Validé | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-CONF-04 | Valeur invalide signalée sans réécriture | ✅ Validé | 2026-10-05 | 3dec49c | B5 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-CONF-05 | Langues par défaut | ✅ Validé | 2026-10-02 | 0.4.0-dev | B6 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |

### Sources du dossier (`REQ-SRC`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-SRC-01 | Trois façons de fournir les sources | ✅ Validé | 2026-10-11 | affa1f0 | C1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SRC-02 | Pièce jointe rangée au bon endroit | ✅ Validé | 2026-10-11 | affa1f0 | C1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SRC-03 | Transcription Markdown à côté de l'original | ✅ Validé | 2026-10-11 | affa1f0 | C1.2, D1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SRC-04 | Original inchangé | ✅ Validé | 2026-10-11 | affa1f0 | C1.2, D1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SRC-05 | Pas de transcription d'une source déjà en texte | ⬜ Non testé | — | — | — | — |
| REQ-SRC-06 | Passages illisibles marqués | 🐞 Problème constaté | 2026-10-11 | 5159d42 | — | [2026-10-11](test-history/2026-10-11-tests-manuels-9-corrections.md) |
| REQ-SRC-07 | Transcription existante jamais écrasée | ✅ Validé | 2026-10-02 | 0.4.0-dev | C5 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-SRC-08 | Source très volumineuse | ✅ Validé | 2026-10-03 | 5ad0ce8 | C6 | [2026-10-03](test-history/2026-10-03-demo-a-blanc-et-rejeu-cible.md) |
| REQ-SRC-09 | Références externes notées | ✅ Validé | 2026-10-11 | affa1f0 | C1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SRC-10 | Aucune référence dupliquée | ✅ Validé | 2026-10-02 | 0.4.0-dev | C5 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-SRC-11 | Réimport complet (attendu de C7 à corriger : retranscription contraire à REQ-SRC-07) | ⚠️ À revalider | 2026-09-30 | 0.4.0-dev | — | [2026-09-30](test-history/2026-09-30-rejeu-apres-consolidation-des-regles.md) |

### Dossier professionnel (`REQ-PROF`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-PROF-01 | Squelette vide à la création | ✅ Validé | 2026-10-11 | affa1f0 | B1.2, B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-02 | Validation avant toute écriture | ✅ Validé | 2026-10-11 | affa1f0 | C1.2, C2, C4.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-03 | Dossier initial proposé à partir des sources | ⚠️ À revalider | 2026-10-11 | affa1f0 | C1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-04 | Première modification validée | ✅ Validé | 2026-10-11 | affa1f0 | C2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-05 | Une seule incrémentation de version par session | ⬜ Non testé | — | — | — | — |
| REQ-PROF-06 | Passage à « prêt » proposé par le coach | ⬜ Non testé | — | — | — | — |
| REQ-PROF-07 | Informations ajoutées avant « prêt » | ✅ Validé | 2026-10-11 | affa1f0 | C4.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-08 | Passage à « prêt » validé | ✅ Validé | 2026-10-11 | affa1f0 | C4.3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-09 | « Prêt » demandé par le candidat | ✅ Validé | 2026-10-11 | affa1f0 | C4.3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-10 | Proposition de « prêt » refusée | ⬜ Non testé | — | — | — | — |
| REQ-PROF-11 | Historique de chaque changement de statut ou de version | ⚠️ À revalider | 2026-10-11 | affa1f0 | C2, C4.3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PROF-12 | Statut inconnu | ⚠️ À revalider | 2026-10-09 | 5c3f748 | C10 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-PROF-13 | Statut absent | ⬜ Non testé | — | — | — | — |
| REQ-PROF-14 | Version illisible ou en-tête incohérent | ⬜ Non testé | — | — | — | — |
| REQ-PROF-15 | Retour en construction | ✅ Validé | 2026-10-11 | 5159d42 | C11.1 | [2026-10-11](test-history/2026-10-11-tests-manuels-9-corrections.md) |
| REQ-PROF-16 | Mises à jour courantes d'un dossier prêt | ⬜ Non testé | — | — | — | — |
| REQ-PROF-17 | Dossier supprimé | ⚠️ À revalider | 2026-10-03 | 5ad0ce8 | C7 | [2026-10-03](test-history/2026-10-03-demo-a-blanc-et-rejeu-cible.md) |

### Opportunités (`REQ-OPP`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-OPP-01 | Opportunité créée par le coach | ✅ Validé | 2026-10-11 | affa1f0 | D1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-02 | Numérotation stable des opportunités | ⚠️ À revalider | 2026-10-02 | 0.4.0-dev | E1.1 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-OPP-03 | Structure créée avec l'opportunité | ✅ Validé | 2026-10-11 | affa1f0 | D1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-04 | Trois façons de fournir l'offre | ✅ Validé | 2026-10-11 | affa1f0 | D1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-05 | Texte collé enregistré | ⬜ Non testé | — | — | — | — |
| REQ-OPP-06 | Transcription dans la langue de la source | ✅ Validé | 2026-10-09 | 5c3f748 | — | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-07 | `opportunity.md` dans la langue de coaching | ⚠️ À revalider | 2026-10-09 | 5c3f748 | — | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-08 | `opportunity.md` limité aux faits sourcés | ✅ Validé | 2026-10-11 | affa1f0 | D1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-09 | Analyse séparée | ⚠️ À revalider | 2026-10-11 | affa1f0 | D2.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-10 | Synthèse orientée action (critère mesurable à définir) | ⬜ Non testé | — | — | — | — |
| REQ-OPP-11 | Messages stratégiques proposés | ✅ Validé | 2026-10-11 | affa1f0 | D2.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-12 | Message retiré conservé | ✅ Validé | 2026-10-11 | affa1f0 | D2.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-13 | Statut de l'opportunité tenu à jour | 🐞 Problème constaté | 2026-10-05 | 0.4.0-dev | D6 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-OPP-14 | Refus bienveillant avec un dossier non prêt | ✅ Validé | 2026-10-11 | affa1f0 | C4.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-15 | Suite du refus | ✅ Validé | 2026-10-11 | affa1f0 | C4.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-16 | Travaux soumis au statut | ⚠️ À revalider | 2026-10-11 | affa1f0 | C4.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-17 | Travaux toujours disponibles | ⚠️ À revalider | 2026-10-09 | 5c3f748 | C9.1 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-18 | Retour au dossier proposé après création | ✅ Validé | 2026-10-09 | 5c3f748 | C9.1 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-19 | Création et analyse dans le même message | ⬜ Non testé | — | — | — | — |
| REQ-OPP-20 | Mise en garde une fois par opportunité et par conversation | ⚠️ À revalider | 2026-10-09 | 5c3f748 | C9.2 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-21 | Insistance et dérogation | ✅ Validé | 2026-10-09 | 5c3f748 | C9.2 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-22 | Dérogation limitée à l'opportunité | ⬜ Non testé | — | — | — | — |
| REQ-OPP-23 | Rappel de dérogation | ✅ Validé | 2026-10-09 | 5c3f748 | C9.3 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-24 | Rappel de dérogation en anglais | ⬜ Non testé | — | — | — | — |
| REQ-OPP-25 | Dossier prêt : travail sans mise en garde | ✅ Validé | 2026-10-11 | affa1f0 | — | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-26 | Passes d'analyse tracées | ✅ Validé | 2026-10-11 | affa1f0 | D2.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-OPP-27 | Nouvelle passe proposée quand le dossier devient prêt | ✅ Validé | 2026-10-09 | 5c3f748 | C9.6 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-28 | Refus définitif d'une nouvelle passe | ⬜ Non testé | — | — | — | — |
| REQ-OPP-29 | Nouvelle passe à tout moment | ✅ Validé | 2026-10-09 | 5c3f748 | C9.8 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-30 | Dérogation close par une passe avec un dossier prêt | ⚠️ À revalider | 2026-10-09 | 5c3f748 | C9.8 | [2026-10-09](test-history/2026-10-09-tests-manuels-9-statut-dossier.md) |
| REQ-OPP-31 | Opportunités actives alignées sur le statut du dossier | 🐞 Problème constaté | 2026-10-11 | 5159d42 | C11.1 | [2026-10-11](test-history/2026-10-11-tests-manuels-9-corrections.md) |
| REQ-OPP-32 | Prochaine action alignée sur l'état de l'opportunité | ⬜ Non testé | — | — | — | — |

### Entretiens (`REQ-ITW`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-ITW-01 | Tours d'entretien numérotés | ✅ Validé | 2026-10-11 | affa1f0 | D3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-02 | Artefacts créés à l'étape atteinte | ✅ Validé | 2026-10-11 | affa1f0 | D3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-03 | Entretien passé tracé sans détail inventé | ✅ Validé | 2026-10-11 | affa1f0 | D3 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-04 | Préparation sans jeu de rôle | ✅ Validé | 2026-10-11 | affa1f0 | D4 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-05 | Préparation commencée notée dans `interview.md` | ✅ Validé | 2026-10-11 | affa1f0 | D4 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-06 | `interview.md` à jour après chaque étape | ⚠️ À revalider | 2026-10-11 | affa1f0 | D5, D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-07 | Revue des questions à poser | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D10 | [2026-10-04](test-history/2026-10-04-controles-generiques-coach.md) |
| REQ-ITW-08 | Fiche demandée sans questions travaillées | ✅ Validé | 2026-10-11 | affa1f0 | D11 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-09 | Structure de la fiche de préparation | ✅ Validé | 2026-10-11 | affa1f0 | D11 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-ITW-10 | Retour après l'entretien réel | ⚠️ À revalider | 2026-10-02 | 0.4.0-dev | D12 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |

### Simulation d'entretien (`REQ-SIM`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-SIM-01 | Profondeurs proposées | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-02 | Rappel des mots-clés d'arrêt (ordre du rappel à revérifier) | ⚠️ À revalider | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-03 | Une question à la fois | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-04 | Un seul interviewer par tour | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-05 | Lignes de rôle en italique | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-06 | Pas de coaching pendant le jeu | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-07 | Première simulation sans renvoi à la préparation | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-08 | Simulations indépendantes | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D7.1 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-SIM-09 | Numérotation des simulations | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D7.2 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-SIM-10 | Nouvelle simulation : profondeur et cas redemandés | ⚠️ À revalider | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-11 | Confirmation d'un mot-clé d'arrêt | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-12 | Reprise après un arrêt non confirmé | ⚠️ À revalider | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-13 | Chaque demande d'arrêt confirmée | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-14 | « stop » dans une réponse | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-15 | Demande d'arrêt sans mot-clé ou ambiguë | ⚠️ À revalider | 2026-10-05 | 0.4.0-dev | D5 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-SIM-16 | Pause non prise en charge | ⬜ Non testé | — | — | — | — |
| REQ-SIM-17 | Arrêt confirmé | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-SIM-18 | Transcript de la simulation | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |

### Joker (`REQ-JOK`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-JOK-01 | Rappel du joker au début de la simulation (ordre du rappel à revérifier) | ⚠️ À revalider | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-02 | Déclenchement | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-03 | Formulation équivalente | ⬜ Non testé | — | — | — | — |
| REQ-JOK-04 | Joker de conseil | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-05 | Question non reposée après le retour | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-06 | Une ligne de sortie et une ligne de retour | 🐞 Problème constaté | 2026-10-05 | 0.4.0-dev | D5, D7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-JOK-07 | Demande de précision | ⚠️ À revalider | 2026-10-05 | 0.4.0-dev | D7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-JOK-08 | Joker annulé : reprise du rôle | ⚠️ À revalider | 2026-10-05 | 0.4.0-dev | D7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-JOK-09 | Joker annulé ignoré | ⚠️ À revalider | 2026-10-05 | 0.4.0-dev | D7.2 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-JOK-10 | Réponse proposée étiquetée | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-11 | Réponse proposée sans fait inventé | 🐞 Problème constaté | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-12 | Réaction de l'interviewer à la réponse proposée | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-13 | Jokers dans le transcript | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-14 | Décompte des jokers au débrief | ✅ Validé | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-15 | Réponse proposée non évaluée | ✅ Validé | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-16 | Réponse après conseil évaluée | ✅ Validé | 2026-10-04 | 0.4.0-dev | D6 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-JOK-17 | Joker hors simulation | ✅ Validé | 2026-10-04 | 0.4.0-dev | D4 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-JOK-18 | « joker » dans une réponse | ✅ Validé | 2026-10-05 | 0.4.0-dev | D7 | [2026-10-05](test-history/2026-10-05-tests-manuels-corrections-15-18.md) |
| REQ-JOK-19 | Jokers sans limite | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D7, D8 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-JOK-20 | Arrêt juste après un joker | ✅ Validé | 2026-10-11 | affa1f0 | — | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-JOK-21 | Joker en anglais | ⬜ Non testé | — | — | — | — |

### Debrief (`REQ-DEB`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-DEB-01 | Débrief succinct fondé sur les preuves | ✅ Validé | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-DEB-02 | Débrief dans une nouvelle conversation | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D8 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |
| REQ-DEB-03 | Débrief sans transcript | ⚠️ À revalider | 2026-10-02 | 0.4.0-dev | D9 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-DEB-04 | Débrief après un arrêt anticipé | ✅ Validé | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-DEB-05 | Suite du débrief | ✅ Validé | 2026-10-11 | affa1f0 | D6 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-DEB-06 | Débrief relié aux priorités précédentes | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | D8 | [2026-10-04](test-history/2026-10-04-tests-manuels-joker.md) |

### Confidentialité et navigation web (`REQ-PRIV`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-PRIV-01 | Rappel de confidentialité en première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PRIV-02 | Rappel non bloquant | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PRIV-03 | Rappel absent des sessions suivantes | ✅ Validé | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-PRIV-04 | Rappel de confidentialité en anglais | ⚠️ À revalider | 2026-10-05 | 3dec49c | B9 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-05 | Navigation désactivée si le paramètre manque ou est illisible | ✅ Validé | 2026-10-05 | 3dec49c | B4, B5 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-06 | Aucune navigation de la propre initiative du coach | ✅ Validé | 2026-10-05 | 3dec49c | B5, C8.1 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-07 | Accord explicite pour une exception ponctuelle | ✅ Validé | 2026-10-05 | 3dec49c | C8.1, C8.5 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-08 | Lien fourni sans accord | ✅ Validé | 2026-10-05 | 3dec49c | C8.1, C8.5 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-09 | Demande explicite d'ouverture | ✅ Validé | 2026-10-05 | 3dec49c | D13 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-10 | Accord non permanent | ✅ Validé | 2026-10-05 | 3dec49c | C8.5 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-11 | Exception refusée | ✅ Validé | 2026-10-05 | 3dec49c | C8.3 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-12 | Navigation autorisée par le paramètre | ✅ Validé | 2026-10-05 | 3dec49c | C8.6 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-13 | Lien impossible à ouvrir | ✅ Validé | 2026-10-05 | 3dec49c | C8.2 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-14 | Navigation indisponible dans l'outil | ⬜ Non testé | — | — | — | — |
| REQ-PRIV-15 | Information récupérée validée avant intégration | ✅ Validé | 2026-10-05 | 3dec49c | C8.4, C8.6 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-16 | Provenance de l'information récupérée | ⬜ Non testé | — | — | — | — |
| REQ-PRIV-17 | Offre lue en ligne conservée en transcription | ⬜ Non testé | — | — | — | — |
| REQ-PRIV-18 | Référence externe consultée pour le dossier | ⬜ Non testé | — | — | — | — |
| REQ-PRIV-19 | Navigation demandée pendant une simulation | ✅ Validé | 2026-10-05 | 3dec49c | D13 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-20 | Navigation en simulation distincte du joker | ✅ Validé | 2026-10-05 | 3dec49c | D13 | [2026-10-05](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md) |
| REQ-PRIV-21 | Messages de navigation en anglais | ⬜ Non testé | — | — | — | — |

### Feedback produit (`REQ-FB`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-FB-01 | Message d'information de première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-02 | Identifiant anonyme généré | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-03 | Identifiant jamais modifié | ⬜ Non testé | — | — | — | — |
| REQ-FB-04 | Journal créé à la première session | ✅ Validé | 2026-10-11 | affa1f0 | B1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-05 | Rien au démarrage des sessions suivantes | ✅ Validé | 2026-10-11 | affa1f0 | B2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-06 | Workspace antérieur au feedback produit | ✅ Validé | 2026-10-11 | 0.4.0-dev | B10 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-07 | Identifiant et journal recréé signalés (signalés ensemble en une phrase : règle à assouplir, backlog) | ✅ Validé | 2026-10-11 | 0.4.0-dev | B10 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-08 | Journal supprimé recréé sans alerte de perte | ⬜ Non testé | — | — | — | — |
| REQ-FB-09 | Format d'une entrée | ✅ Validé | 2026-10-11 | affa1f0 | D4, D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-10 | Ajout en fin de journal sans lecture (test du dernier octet dans la commande, contenu non lu) | ✅ Validé | 2026-10-11 | affa1f0 | — | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-11 | Difficultés d'usage consignées | ⬜ Non testé | — | — | — | — |
| REQ-FB-12 | Raison d'arrêt d'une simulation consignée | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-13 | Une entrée par joker utilisé | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-14 | Aucune entrée pour un joker annulé | ⬜ Non testé | — | — | — | — |
| REQ-FB-15 | Note dictée par mot-clé | ✅ Validé | 2026-10-11 | affa1f0 | D4 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-16 | Phrase naturelle visant l'outil | ✅ Validé | 2026-10-11 | 0.4.0-dev | D4 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-17 | Phrase sur son propre travail | ✅ Validé | 2026-10-11 | 0.4.0-dev | D4 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-18 | Mention de prise en compte | ✅ Validé | 2026-10-11 | affa1f0 | D4, D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-19 | Note pendant une simulation | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-20 | Note absente du transcript | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-21 | Note distincte des mots-clés d'arrêt | ✅ Validé | 2026-10-11 | affa1f0 | D5 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-22 | Rien nettoyé à l'écriture | ✅ Validé | 2026-10-11 | affa1f0 | D4 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-23 | Message d'information en anglais | ⬜ Non testé | — | — | — | — |
| REQ-FB-24 | Note en anglais | ⬜ Non testé | — | — | — | — |
| REQ-FB-25 | Entrées non traitées seulement | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-26 | Revue des entrées silencieuses | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-27 | Trois questions dans l'ordre | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-28 | Statistique des jokers sur toutes les entrées de joker | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-29 | Statistique incluse seulement si acceptée | ⬜ Non testé | — | — | — | — |
| REQ-FB-30 | Métadonnées et comptages | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-31 | Fichier de feedback indépendant | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-32 | Anonymisation du contenu | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-33 | Remplacements listés, anonymisation non garantie | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-34 | Entrées prises en compte passées à « traitée » | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-35 | Passage à « traitée » après l'écriture du fichier | ⬜ Non testé | — | — | — | — |
| REQ-FB-36 | Génération interrompue | ✅ Validé | 2026-10-11 | 0.4.0-dev | F1.1 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-37 | Rien envoyé, aucune date d'envoi | ✅ Validé | 2026-10-11 | affa1f0 | F1.2 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-FB-38 | Feedback retravaillé | ⬜ Non testé | — | — | — | — |
| REQ-FB-39 | Second feedback du même jour | ⬜ Non testé | — | — | — | — |
| REQ-FB-40 | Génération sans nouvelle entrée | ✅ Validé | 2026-10-11 | 0.4.0-dev | F1.5 | [2026-10-11](test-history/2026-10-11-feedback-produit-test-minimal.md) |
| REQ-FB-41 | Sans nouvelle entrée ni réponse, aucun fichier | ⬜ Non testé | — | — | — | — |
| REQ-FB-42 | Sans nouvelle entrée, feedback des seules réponses | ⬜ Non testé | — | — | — | — |
| REQ-FB-43 | Journal long | ⬜ Non testé | — | — | — | — |

### Règles transversales du coach (`REQ-COACH`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-COACH-01 | Aucun fait inventé | ⚠️ À revalider | 2026-10-11 | affa1f0 | D4 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-COACH-02 | « Dossier professionnel » | ✅ Validé | 2026-10-04 | 0.4.0-dev | — | [2026-10-04](test-history/2026-10-04-controles-generiques-coach.md) |
| REQ-COACH-03 | « Espace carrière » | ✅ Validé | 2026-10-11 | affa1f0 | B1.1 | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-COACH-04 | « Career workspace » | ⬜ Non testé | — | — | — | — |
| REQ-COACH-05 | Langue de coaching | ⬜ Non testé | — | — | — | — |
| REQ-COACH-06 | Apprentissages durables séparés | ⬜ Non testé | — | — | — | — |
| REQ-COACH-07 | Dates citées telles qu'enregistrées | ⚠️ À revalider | 2026-10-03 | 0.4.0-dev | E3 | [2026-10-03](test-history/2026-10-03-demo-enregistree-teams.md) |
| REQ-COACH-08 | Question laissée sans réponse | ✅ Validé | 2026-10-11 | 5159d42 | — | [2026-10-11](test-history/2026-10-11-tests-manuels-9-corrections.md) |

### Mise à jour du workspace (`REQ-UPD`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-UPD-01 | Mise à jour du moteur sans perte de `data/` | ⚠️ À revalider | 2026-09-30 | — | — | [2026-09-30](test-history/2026-09-30-deploiement-initialisation-mise-a-jour-et-sources.md) |
| REQ-UPD-02 | Retour à la version précédente | ⬜ Non testé | — | — | — | — |

### Build (`REQ-BLD`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-BLD-01 | Build limité à l'empaquetage | ⬜ Non testé | — | — | — | — |
| REQ-BLD-02 | Deux artefacts dans `dist/` | ⚠️ À revalider | 2026-10-12 | 161bc55 | CHK-BLD-01 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-03 | Racine unique du ZIP du workspace | ✅ Validé | 2026-10-12 | 161bc55 | CHK-BLD-02 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-04 | `ENGINE-VERSION` égal à `VERSION` | ✅ Validé | 2026-10-12 | 161bc55 | CHK-BLD-02 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-05 | Racine de `workspace/` limitée au moteur et à `data/` | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | CHK-BLD-03 | [2026-10-04](test-history/2026-10-04-marqueur-engine-version.md) |
| REQ-BLD-06 | `data/` du ZIP limité aux `README.md` | ✅ Validé | 2026-10-12 | 161bc55 | CHK-BLD-02 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-07 | Arborescence conforme à l'architecture | ⬜ Non testé | — | — | — | — |
| REQ-BLD-08 | Échec sur un fichier source obligatoire manquant | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | CHK-BLD-03 | [2026-10-04](test-history/2026-10-04-recentrage-my-career-workspace.md) |
| REQ-BLD-09 | Fichiers obligatoires présents dans le ZIP | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | CHK-BLD-02 | [2026-10-04](test-history/2026-10-04-recentrage-my-career-workspace.md) |
| REQ-BLD-10 | Échec sur un fichier de données dans `workspace/data/` | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | CHK-BLD-03 | [2026-10-04](test-history/2026-10-04-abandon-mode-standalone.md) |
| REQ-BLD-11 | Échec sur un fichier de travail dans le moteur | ⬜ Non testé | — | — | — | — |
| REQ-BLD-12 | ZIP du workspace sans contenu de démonstration | ✅ Validé | 2026-10-12 | 161bc55 | CHK-BLD-02 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-13 | Artefacts précédents remplacés | ⬜ Non testé | — | — | — | — |
| REQ-BLD-14 | Contenu du ZIP du kit de test | ✅ Validé | 2026-10-12 | 161bc55 | CHK-BLD-04 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-15 | Contenu du script de démo | ⚠️ À revalider | 2026-10-12 | 161bc55 | CHK-BLD-04 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-BLD-16 | Aucune génération ni dépendance au build | ✅ Validé | 2026-10-01 | 0.4.0-dev | CHK-BLD-05 | [2026-10-01](test-history/2026-10-01-kit-de-test-generation-et-build.md) |
| REQ-BLD-17 | Échec sur un scénario maître manquant | ⚠️ À revalider | 2026-10-01 | 0.4.0-dev | CHK-BLD-03 | [2026-10-01](test-history/2026-10-01-kit-de-test-generation-et-build.md) |
| REQ-BLD-18 | Échec sur une source du kit manquante | ⬜ Non testé | — | — | — | — |
| REQ-BLD-19 | Liens du ZIP valides hors du dépôt | ⚠️ À revalider | 2026-10-04 | 0.4.0-dev | CHK-BLD-02 | [2026-10-04](test-history/2026-10-04-recentrage-my-career-workspace.md) |

### Dépôt (`REQ-REPO`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-REPO-01 | Aucune coordonnée personnelle | ✅ Validé | 2026-10-12 | 161bc55 | CHK-REPO-01 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-REPO-02 | Aucun nom réel ni contenu d'employeur | ✅ Validé | 2026-10-04 | — | CHK-REPO-02 | journal antérieur |
| REQ-REPO-03 | Données d'exemple explicitement fictives | ✅ Validé | 2026-10-12 | 161bc55 | CHK-REPO-01 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-REPO-04 | Artefacts de build ignorés | ✅ Validé | 2026-10-12 | 161bc55 | CHK-REPO-03 | [2026-10-12](test-history/2026-10-12-preparation-release-v0.4.0.md) |
| REQ-REPO-05 | Chemins racine obsolètes absents | ⬜ Non testé | — | — | — | — |
| REQ-REPO-06 | Anciens noms du produit absents | ✅ Validé | 2026-10-05 | — | CHK-REPO-04 | journal antérieur |
| REQ-REPO-07 | Mode standalone absent | ✅ Validé | 2026-10-04 | 0.4.0-dev | CHK-REPO-04 | [2026-10-04](test-history/2026-10-04-abandon-mode-standalone.md) |
| REQ-REPO-08 | Ancien exemple fictif absent | ✅ Validé | 2026-10-01 | 0.4.0-dev | CHK-REPO-04 | [2026-10-01](test-history/2026-10-01-kit-de-test-generation-et-build.md) |
| REQ-REPO-09 | Entrées publiées du `CHANGELOG.md` non réécrites | ✅ Validé | 2026-10-04 | 0.4.0-dev | CHK-REPO-05 | [2026-10-04](test-history/2026-10-04-abandon-mode-standalone.md) |
| REQ-REPO-10 | Entrées du journal des décisions non réécrites | ⬜ Non testé | — | — | — | — |
| REQ-REPO-11 | Pas de numéro de version superflu dans la documentation | ⬜ Non testé | — | — | — | — |
| REQ-REPO-12 | Version de développement | ⬜ Non testé | — | — | — | — |

### Kit de test (`REQ-KIT`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-KIT-01 | Profil fictif réaliste et cohérent | ✅ Validé | 2026-10-02 | 0.4.0-dev | — | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-KIT-02 | Deux opportunités fictives | ✅ Validé | 2026-10-02 | 0.4.0-dev | — | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-KIT-03 | Source très volumineuse | ✅ Validé | 2026-10-03 | 5ad0ce8 | — | [2026-10-03](test-history/2026-10-03-demo-a-blanc-et-rejeu-cible.md) |
| REQ-KIT-04 | Génération des PDF et DOCX | ⚠️ À revalider | 2026-10-01 | 0.4.0-dev | CHK-KIT-02 | [2026-10-01](test-history/2026-10-01-kit-de-test-generation-et-build.md) |
| REQ-KIT-05 | Champs d'une étape du scénario | ⚠️ À revalider | 2026-10-02 | 0.4.0-dev | CHK-KIT-03 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-KIT-06 | Conversation de chaque étape | ⚠️ À revalider | 2026-10-02 | 0.4.0-dev | CHK-KIT-03 | [2026-10-02](test-history/2026-10-02-deroule-complet-scenario-maitre.md) |
| REQ-KIT-07 | Étapes d'une issue non livrée | ⚠️ À revalider | 2026-10-03 | 5ad0ce8 | CHK-KIT-03 | [2026-10-03](test-history/2026-10-03-demo-a-blanc-et-rejeu-cible.md) |
| REQ-KIT-08 | Durée de la démo | ⚠️ À revalider | 2026-10-03 | 0.4.0-dev | CHK-KIT-04 | [2026-10-03](test-history/2026-10-03-demo-enregistree-teams.md) |
| REQ-KIT-09 | Scénario jouable avec le seul kit | ⚠️ À revalider | 2026-10-11 | affa1f0 | — | [2026-10-11](test-history/2026-10-11-passe-rapide-v0.4.0.md) |
| REQ-KIT-10 | Exemple fictif issu d'un déroulé | ⬜ Non testé | — | — | — | — |
| REQ-KIT-11 | Exemple fictif conforme à la structure canonique | ⬜ Non testé | — | — | — | — |
| REQ-KIT-12 | Formulations fixes identiques dans les consignes et le scénario | ⬜ Non testé | — | — | — | — |

### Référentiel de tests (`REQ-QA`)

| Exigence | Résumé | Statut | Dernier test | Version | Tests | Session |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-QA-01 | Exigences rangées par domaine selon un modèle commun | ⬜ Non testé | — | — | — | — |
| REQ-QA-02 | Identifiants stables et statuts d'exigence | ⬜ Non testé | — | — | — | — |
| REQ-QA-03 | Lien de couverture à sens unique | ⬜ Non testé | — | — | — | — |
| REQ-QA-04 | Identifiants de tests | ⬜ Non testé | — | — | — | — |
| REQ-QA-05 | Tableau de bord par domaine | ⬜ Non testé | — | — | — | — |
| REQ-QA-06 | Statut de test déduit des tests consignés | ⬜ Non testé | — | — | — | — |
| REQ-QA-07 | Historique conservé, sessions citant les tests | ⬜ Non testé | — | — | — | — |
| REQ-QA-08 | Stratégie de test | ⬜ Non testé | — | — | — | — |
| REQ-QA-09 | Contrôles ponctuels de livraison hors du référentiel | ⬜ Non testé | — | — | — | — |
| REQ-QA-10 | Contrôle automatique de la traçabilité | ⬜ Non testé | — | — | — | — |
| REQ-QA-11 | Script de démo sans renvoi aux exigences | ⬜ Non testé | — | — | — | — |
| REQ-QA-12 | Mod de couverture compté par exigence | ⬜ Non testé | — | — | — | — |
| REQ-QA-13 | Prompteur aligné sur le référentiel | ⬜ Non testé | — | — | — | — |

## Écarts ouverts

- REQ-SES-03 — narration technique en anglais avant la ligne de lancement (« Not a first session. Reading the config… »), relevée depuis le 2026-10-09 ; backlog.
- REQ-SES-30 — point de reprise périmé non corrigé en début de session (B3 et B7 du 2026-10-05) ; backlog (tenue des `current-status.md`).
- REQ-SRC-06 — « € » perdus à l'extraction de l'offre et rétablis sans marque, limite absente de l'en-tête (D1, 2026-10-11) ; correctif proposé, non appliqué.
- REQ-OPP-13 — `current-status.md` de l'opportunité avec des restes périmés (2026-10-05) ; backlog (tenue des `current-status.md`).
- REQ-OPP-31 — « Focus courant » et « Prochaine action » inchangés après le retour du dossier en `draft` (C11, 2026-10-11) ; correctif R14 de #9 (`03eeb7e`) non vérifié depuis.
- REQ-JOK-06 — ligne de sortie répétée avant la réponse proposée, après une demande de précision (2026-10-05, L-007) ; backlog.
- REQ-JOK-11 — fait absent du dossier (« cache de type Redis ») non signalé comme supposé dans une réponse proposée (D5, 2026-10-11).

## À revalider

- REQ-SES-10 — impacté par #9 et #17 : cas du fichier recréé (B3) non rejoué depuis le 2026-10-05.
- REQ-SES-15, REQ-SES-16 — impactés par #9 et #17 (modèle du dossier, journal du feedback créé au démarrage) : B3 non rejoué depuis le 2026-10-05.
- REQ-SES-28 — impacté par #17 (message du feedback produit après le rappel) : B9 non rejoué depuis le 2026-10-05.
- REQ-CONF-01 — ajout rejoué après #17 ; place de la clé dans la structure du modèle non nommée depuis le 2026-09-30.
- REQ-SRC-11 — impacté par #9 : réimport joué le 2026-09-30 seulement.
- REQ-PROF-03 — points flous signalés en partie le 2026-10-11.
- REQ-PROF-11 — entrée d'une correction de statut (C10) non rejouée depuis R13 de #9.
- REQ-PROF-12 — impacté par les corrections de #9 (R13, `03eeb7e`) ; « prêt » proposé en alternative le 2026-10-09, à revoir si l'écart se reproduit.
- REQ-PROF-17 — impacté par #9 (signalement de perte à la place de la ligne de statut) : C7 non rejoué depuis le 2026-10-03.
- REQ-OPP-02 — numérotation `max + 1` non rejouée depuis le 2026-10-02.
- REQ-OPP-07 — langue d'origine et intitulé conservé non nommés depuis le 2026-10-03.
- REQ-OPP-09 — secteur régulé (ACPR) non posé comme écart en D2.1 (2026-10-09, 2026-10-11).
- REQ-OPP-16 — seule la préparation des entretiens a été refusée (C4.1).
- REQ-OPP-17 — entretien déjà passé et retour d'entretien réel avec un dossier non prêt non joués.
- REQ-OPP-20 — nouvelle mise en garde dans une conversation ultérieure (C9.4) non jouée.
- REQ-OPP-30 — clôture après un refus définitif (C9.7) non jouée.
- REQ-ITW-06 — D9 et D12 non rejoués depuis le 2026-10-02.
- REQ-ITW-07 — impacté par #9 (fiche soumise au statut du dossier) : D10 non rejoué depuis le 2026-10-02.
- REQ-ITW-10 — impacté par #12, #14 et #9 : D12 joué le 2026-10-02 seulement.
- REQ-SIM-02, REQ-JOK-01 — ordre du rappel avant le jeu de rôle à revérifier en D5 (2026-10-11).
- REQ-SIM-08, REQ-SIM-09 — impactés par les corrections de #18 et par #17 : D7 non rejoué depuis le 2026-10-04.
- REQ-SIM-10 — « même cas ou un autre » nommé pour la dernière fois le 2026-10-03.
- REQ-SIM-12 — reprise sur une réponse directe (D7) jouée le 2026-10-04 seulement.
- REQ-SIM-15 — demande d'arrêt claire sans mot-clé jamais vérifiée (D5 joué avec « stop. » le 2026-10-11).
- REQ-JOK-07 — impacté par #17 : demande de précision non rejouée depuis le 2026-10-05.
- REQ-JOK-08, REQ-JOK-09 — impactés par #17 (aucune entrée pour un joker annulé) : joker annulé non rejoué depuis le 2026-10-05.
- REQ-JOK-19 — impacté par #17 : plusieurs jokers, dont deux de suite, non rejoués depuis le 2026-10-04.
- REQ-DEB-02 — impacté par #18 et #17 : D8 non rejoué depuis le 2026-10-04.
- REQ-DEB-03 — impacté par #12 : D9 joué le 2026-10-02 seulement.
- REQ-DEB-06 — D8 et D9 non rejoués depuis le 2026-10-04.
- REQ-PRIV-04 — impacté par #17 (message du feedback produit après le rappel) : B9 non rejoué depuis le 2026-10-05.
- REQ-COACH-01 — D10 non rejoué depuis le 2026-10-02.
- REQ-COACH-07 — consigne ajoutée après l'écart du 2026-10-03 (`42386b2`), non vérifiée depuis.
- REQ-UPD-01 — impacté par #9, #15 et #17 : seul test le 2026-09-30, sur une version 0.3.0 de travail ; depuis, en-tête du dossier, racine du ZIP, clés de configuration et journal du feedback produit.
- REQ-BLD-02 — impacté par #17 (formulaire de retour pilote retiré) : la session du 2026-10-12 ne dit pas que `dist/` ne contient rien d'autre.
- REQ-BLD-05, REQ-BLD-08, REQ-BLD-10, REQ-BLD-17 — impactés par #15 et #17 : `build.bat` modifié depuis le dernier cas négatif, non rejoué le 2026-10-12.
- REQ-BLD-09, REQ-BLD-19 — impactés par #17 (modèles du feedback déplacés, guides modifiés) : contenu du ZIP non détaillé depuis.
- REQ-BLD-15 — impacté par #20 : motif de `make_demo_script.ps1` modifié (vérifié par l'agent, non consigné en session).
- REQ-KIT-04 — livret de 49 pages ajouté le 2026-10-03, rendu non relu.
- REQ-KIT-05 — impacté par #18 (étapes D4 à D8, E5) et #20 (ligne « Exigences »).
- REQ-KIT-06 — impacté par #18 : étapes modifiées depuis le dernier contrôle.
- REQ-KIT-07 — impacté par #9 : C4 n'est plus `[todo]`.
- REQ-KIT-08 — impacté par #18 (jokers en D5, D6) et #9 (C4 ajoutée) ; écart entre la cible du scénario (35 à 40 minutes) et la durée prévue de la démo (45 minutes, acceptée après #9), à trancher à la prochaine démo minutée.
- REQ-KIT-09 — dernier déroulé partiel (passe rapide du 2026-10-11).

## Index par issue

Exigences dont l'origine cite l'issue (champ Origine) ; une exigence créée ou modifiée par plusieurs issues figure sous chacune.

- #5 : REQ-SES-01, REQ-SES-05, REQ-SES-11, REQ-SES-14 à REQ-SES-16, REQ-SES-31, REQ-SES-32, REQ-CONF-01 à REQ-CONF-05, REQ-SRC-03 à REQ-SRC-11, REQ-PROF-01 à REQ-PROF-03, REQ-PROF-17, REQ-OPP-01 à REQ-OPP-03, REQ-OPP-08, REQ-OPP-09, REQ-OPP-11, REQ-OPP-13, REQ-ITW-01 à REQ-ITW-03, REQ-ITW-09, REQ-ITW-10, REQ-SIM-01 à REQ-SIM-03, REQ-SIM-06, REQ-SIM-08, REQ-SIM-09, REQ-SIM-11, REQ-SIM-14 à REQ-SIM-18, REQ-DEB-01 à REQ-DEB-06, REQ-COACH-01, REQ-COACH-06, REQ-UPD-01, REQ-BLD-01 à REQ-BLD-03, REQ-BLD-05 à REQ-BLD-13, REQ-REPO-01 à REQ-REPO-05, REQ-REPO-12, REQ-KIT-11.
- #7 : REQ-UPD-02.
- #8 : REQ-PRIV-01 à REQ-PRIV-21, REQ-KIT-12.
- #9 : REQ-SES-25 à REQ-SES-27, REQ-PROF-01, REQ-PROF-02, REQ-PROF-04 à REQ-PROF-17, REQ-OPP-14 à REQ-OPP-32, REQ-COACH-08, REQ-KIT-12.
- #12 : REQ-SES-29, REQ-SES-30, REQ-SRC-01, REQ-SRC-02, REQ-PROF-17, REQ-OPP-03 à REQ-OPP-07, REQ-OPP-11 à REQ-OPP-13, REQ-ITW-04 à REQ-ITW-09, REQ-SIM-04, REQ-SIM-05, REQ-SIM-07, REQ-SIM-08, REQ-SIM-10 à REQ-SIM-13, REQ-SIM-15, REQ-SIM-17, REQ-DEB-06, REQ-COACH-02, REQ-COACH-07, REQ-BLD-02, REQ-BLD-12, REQ-BLD-14 à REQ-BLD-18, REQ-REPO-01 à REQ-REPO-03, REQ-REPO-08, REQ-KIT-01 à REQ-KIT-11.
- #14 : REQ-OPP-10, REQ-OPP-11, REQ-ITW-04, REQ-ITW-07, REQ-COACH-05, REQ-BLD-02, REQ-REPO-07, REQ-REPO-09, REQ-REPO-10.
- #15 : REQ-SES-02 à REQ-SES-13, REQ-SES-17 à REQ-SES-24, REQ-SES-28, REQ-SES-33, REQ-COACH-03, REQ-COACH-04, REQ-BLD-02, REQ-BLD-03, REQ-BLD-08, REQ-BLD-09, REQ-BLD-14, REQ-BLD-19, REQ-REPO-06, REQ-REPO-09 à REQ-REPO-11.
- #17 : REQ-PRIV-01, REQ-PRIV-04, REQ-FB-01 à REQ-FB-43, REQ-BLD-02, REQ-BLD-06, REQ-BLD-08, REQ-BLD-09, REQ-BLD-11, REQ-KIT-12.
- #18 : REQ-JOK-01 à REQ-JOK-21.
- #19 : REQ-QA-12.
- #20 : REQ-KIT-05, REQ-QA-01 à REQ-QA-13.
- Sans issue : REQ-BLD-04 (D-004).

## Sessions

Le détail de chaque session est dans [`test-history/`](test-history/), un fichier par session, du plus récent au plus ancien :

- [2026-10-12 — Préparation de la release v0.4.0 : build et confidentialité du dépôt](test-history/2026-10-12-preparation-release-v0.4.0.md)
- [2026-10-11 — Passe rapide avant la v0.4.0 (mode prompteur)](test-history/2026-10-11-passe-rapide-v0.4.0.md)
- [2026-10-11 — Test minimal du feedback produit (issue #17, avant clôture)](test-history/2026-10-11-feedback-produit-test-minimal.md)
- [2026-10-11 — Tests manuels minimaux des corrections de #9 (troisième passe)](test-history/2026-10-11-tests-manuels-9-corrections.md)
- [2026-10-09 — Tests manuels minimaux de #9 (statut et version du dossier professionnel)](test-history/2026-10-09-tests-manuels-9-statut-dossier.md)
- [2026-10-05 — Tests manuels de #8 (rappel de confidentialité et navigation web)](test-history/2026-10-05-tests-manuels-8-confidentialite-navigation-web.md)
- [2026-10-05 — Tests manuels des corrections de #15 et #18](test-history/2026-10-05-tests-manuels-corrections-15-18.md)
- [2026-10-04 — Tests manuels du joker (issue #18)](test-history/2026-10-04-tests-manuels-joker.md)
- [2026-10-04 — Tests manuels de la première session et du prénom (issue #15)](test-history/2026-10-04-tests-manuels-premiere-session.md)
- [2026-10-04 — Joker pendant une simulation d'entretien : cohérence, build, documentation (issue #18)](test-history/2026-10-04-joker-simulation.md)
- [2026-10-04 — Recentrage sur My Career Workspace : build et recherches (issue #15)](test-history/2026-10-04-recentrage-my-career-workspace.md)
- [2026-10-04 — Contrôles génériques du coach repris du standalone (issue #14)](test-history/2026-10-04-controles-generiques-coach.md)
- [2026-10-04 — Abandon du mode standalone (issue #14)](test-history/2026-10-04-abandon-mode-standalone.md)
- [2026-10-04 — Marqueur de version du moteur `ENGINE-VERSION`](test-history/2026-10-04-marqueur-engine-version.md)
- [2026-10-03 — Démo commentée enregistrée avec la transcription Teams (issue #12)](test-history/2026-10-03-demo-enregistree-teams.md)
- [2026-10-03 — Démo à blanc chronométrée et rejeu ciblé après corrections (issue #12)](test-history/2026-10-03-demo-a-blanc-et-rejeu-cible.md)
- [2026-10-02 — Premier déroulé complet du scénario maître (issue #12)](test-history/2026-10-02-deroule-complet-scenario-maitre.md)
- [2026-10-01 — Kit de test, génération des sources et build (issue #12)](test-history/2026-10-01-kit-de-test-generation-et-build.md)
- [2026-09-30 — Rejeu après consolidation des règles (issue #5)](test-history/2026-09-30-rejeu-apres-consolidation-des-regles.md)
- [2026-09-30 — Déploiement, initialisation, mise à jour et sources (issue #5)](test-history/2026-09-30-deploiement-initialisation-mise-a-jour-et-sources.md)
