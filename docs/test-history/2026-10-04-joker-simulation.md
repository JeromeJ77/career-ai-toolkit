# 2026-10-04 — Joker pendant une simulation d'entretien (issue #18)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : agent de développement (implémentation), résultat à relire par le développeur.
- **Version** : `0.4.0-dev`, build local sur une copie propre hors OneDrive (`C:\Temp`).
- **Données** : aucune ; seuls des fichiers du dépôt et le contenu des ZIP sont examinés.

## Résultats

- ✅ Cohérence des textes : la sortie de rôle du joker (FR/EN) n'existe que dans `interview-simulation-guidelines.md`, source unique ; les autres fichiers y renvoient. Le principe « coach, pas générateur de réponses » porte l'exception du joker dans `workspace/AGENTS.md`, `SKILL.md`, les guides utilisateur FR/EN, `README.md`, `README.fr.md`, la référence de conception et le glossaire.
- ✅ Build : `build.bat` réussit sur la copie propre ; le ZIP du workspace contient 44 fichiers (liste inchangée) ; le script de démo extrait du kit contient 12 étapes et les jokers de D5 et D6.
- ✅ Documentation : D-020 consignée dans le journal des décisions, entrée « Joker » du glossaire, `CHANGELOG.md`, guides utilisateur FR/EN, scénario maître (D4, D5, D6, D7, D8, nouvelle étape E5).

## Non testé

- Aucun scénario conversationnel n'a été joué avec un coach : comportement du joker (conseil, réponse proposée, joker annulé, hors simulation, anglais), transcription, débrief, non-régression de l'arrêt anticipé. Ils restent « Non testé » dans le journal.
- Durée de la démo avec les jokers : non mesurée.

## Suites à donner

- Rejouer D4 (variante), D5, D6, D7, D8 et E5 avec un coach, puis les zones « À revalider » du journal.
