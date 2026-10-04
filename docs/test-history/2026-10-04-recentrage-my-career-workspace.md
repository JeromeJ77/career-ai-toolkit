# 2026-10-04 — Recentrage sur My Career Workspace : build et recherches (issue #15)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : agent de développement ; à confirmer par le développeur du toolkit.
- **Version** : `0.4.0-dev`, build local sur une copie propre du dépôt hors OneDrive (`C:\Temp`), comparée à un build de `HEAD`.
- **Données** : aucune ; seuls le contenu des archives et des fichiers du dépôt sont examinés.

## Résultats

- ✅ `build.bat` réussit et produit `my-career-workspace-v0.4.0-dev.zip` (racine unique `my-career-workspace/`), `my-career-workspace-test-kit-v0.4.0-dev.zip` (racine unique `my-career-workspace-test-kit/`) et `my-career-workspace-pilot-feedback-v0.4.0-dev.md`. Aucun artefact `career-ai-*`.
- ✅ La liste des 42 fichiers du ZIP du workspace est identique à celle du build de `HEAD`, hors nom de la racine ; il en va de même pour le kit de test. `ENGINE-VERSION` contient `0.4.0-dev`.
- ✅ Marqueur `{{VERSION}}` : présent dans la source sous `workspace/`, remplacé par `0.4.0-dev` dans la copie du ZIP et dans le fichier de `dist/` (identiques, accents UTF-8 conservés, sans BOM, fins de ligne LF), aucun marqueur restant.
- ✅ Cas négatif : sans marqueur dans la source, le build échoue avec « The pilot feedback template does not contain the {{VERSION}} placeholder. ».
- ✅ Le script de démo généré montre B1 (deux prompts, durée 3 min), le total de 42 min et l'en-tête « My Career Workspace ».
- ✅ Recherche de « Career AI Workspace », `career-ai-workspace`, `career-ai-test-kit` et `workspace-mode` : il ne reste que les historiques (`docs/test-history/`, remarques de ce journal), l'entrée D-017, les consignes du plan de test et la phrase sur les workspaces existants.
- ✅ Build rejoué après l'ajout des guides utilisateur (R1) : le ZIP du workspace contient 44 fichiers (les 42 précédents, plus `USER-GUIDE.md` et `USER-GUIDE.fr.md` à la racine). Sans `USER-GUIDE.fr.md`, le build échoue avec « Required file missing ». Aucun lien des guides ne pointe vers `docs/` ou le dépôt.

## Non testé

- Tous les scénarios conversationnels (accueil, prénom, salutations, anglais, garde-fou) : à jouer à la main avec le kit (B1, B2, B7, B8, B9).
- Le cas négatif « marqueur subsistant » (non déclenchable sans modifier le build) et le build sur un clone avec fins de ligne CRLF.

## Suites à donner

- Le premier build sur `C:\Users\...\scratchpad` (chemin long, cause probable) échoue avec « Mémoire insuffisante » à la copie `xcopy` ; le build réussit depuis un chemin court. Sans suite pour l'instant.
