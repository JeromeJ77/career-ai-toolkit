# 2026-10-01 — Kit de test, génération des sources et build (issue #12)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : agent de développement, sur le poste du développeur du toolkit.
- **Version** : `0.4.0-dev`.
- **Données** : kit de test fictif uniquement (`test-kit/`).

## Résultats

- ✅ Génération des PDF et DOCX : six fichiers produits par `generate_sources.py` ; rendu des PDF du CV et du certificat vérifié (titres, puces, tableau, filets), styles du DOCX vérifiés.
- ✅ Build : deux ZIP produits ; le ZIP du kit contient README, scénario, script de démo et les sept sources (PDF, DOCX, TXT) sans les références Markdown.
- ✅ ZIP du workspace : aucune entrée liée au kit, à l'exemple ou à la candidate fictive.
- 🐞→✅ Script de démo : première version laissait passer le corps d'une étape non `[demo]` quand elle était la seule de sa phase ; corrigé, toutes les étapes `[demo]` conservées (16 après la relecture du scénario), phase F absente.
- 🐞→✅ `make_demo_script.ps1` : échec de parsing sous Windows PowerShell 5.1 à cause d'un caractère non ASCII ; script passé en ASCII pur, en-tête déplacé dans `demo-script-header.md`.
- ✅ Échec clair du build quand `scenario.md` manque.
- ⬜ Échec quand une source PDF manque : non testé, fichier verrouillé par OneDrive.
- ✅ Aucune donnée réelle dans `test-kit/` (recherche d'adresses, téléphones, URL).
- ⬜ Déroulé du scénario avec le coach dans un workspace extrait : non fait ; à jouer par le développeur, avec consignation étape par étape.

## Suites à donner

- Jouer le scénario maître (étapes A1 à F1) dans un workspace extrait et consigner les résultats, notamment la création de `sources/` par le coach avant le dépôt de l'offre (D1, E1).
- Produire `examples/fictitious-developer/data/` à partir de ce déroulé (étape F2).
- Rejouer l'échec du build avec une source PDF manquante.
