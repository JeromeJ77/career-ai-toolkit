# 2026-10-12 — Préparation de la release v0.4.0 : build et confidentialité du dépôt

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Claude Code (Sonnet 5.5) à la demande de Jérôme Jurbert (auteur) ; les verdicts sont ceux de l'agent, à confirmer par le développeur.
- **Version** : `0.4.0` (suffixe `-dev` retiré de `VERSION` le même jour), arbre de travail après la préparation du `CHANGELOG.md`. Commit de base : `161bc55`.
- **Données** : dépôt lui-même ; build exécuté sur l'arbre de travail (`cmd /c .\build.bat`).
- **Heures** : non relevées.

## Résultats

- ✅ `build.bat` réussit et produit `mycareer-workspace-v0.4.0.zip` et `mycareer-workspace-test-kit-v0.4.0.zip` ; script de démo : 13 étapes conservées.
- ✅ ZIP du workspace : racine unique `mycareer-workspace/`, 46 fichiers ; `data/` ne contient que des `README.md` ; aucun fichier de l'exemple fictif ni du kit de test ; aucun marqueur `{{VERSION}}` ni `0.4.0-dev` restant dans les deux archives.
- ✅ `ENGINE-VERSION` contient `0.4.0`, égal à `VERSION` (la valeur se termine par une fin de ligne CRLF, produite par `echo` de `build.bat`, comme avant).
- ✅ ZIP du kit : racine unique `mycareer-workspace-test-kit/`, 12 fichiers ; l'en-tête du script de démo indique la version `0.4.0`.
- ✅ `dist/` et `build/` ignorés par Git (`.gitignore`) et aucun fichier suivi dedans.
- ✅ Recherche de données personnelles hors `dist/`, `plans/` et `.git/` : adresses électroniques uniquement en `.example` ou `example.net`, téléphone fictif `06 00 00 00 01`, URL LinkedIn `-example`. Les occurrences du nom de l'auteur concernent la licence, les README, le backlog et les fiches de test (attribution, pas de donnée de candidat). Les deux motifs d'adresse trouvés dans un PDF du kit sont du bruit binaire, pas des adresses.
- ✅ Exemple fictif : le développeur confirme qu'il l'a construit uniquement à partir des données du kit de test (après une passe de non-régression) et qu'il ne contient aucune donnée sensible ou personnelle. Verdict du développeur, non déduit par l'agent.
- ⚠️ Non vérifié : conformité de l'exemple fictif à la structure canonique (opportunité, entretien, simulation, entretien réel). Aucun nom réel n'a pu être recherché par liste, faute de liste de référence : la recherche porte sur les motifs d'adresse, de téléphone et de chemins locaux.
- ✅ Contenu du ZIP du kit relu en entier : README, scénario, guide testeur, script de démo, 8 sources (PDF, DOCX, TXT), aucun `.md` dans `sources/`.
- ⬜ Cas négatifs de `build.bat` (fichier requis manquant, `data/` non conforme) non rejoués.

## Suites

- Le développeur confirme ou non les verdicts, puis décide de la release avec les zones encore non « Validé ».
- Release publiée sous le tag `v0.4.0-pilot`, comme la v0.3.0.
