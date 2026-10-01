# Outils du kit de test

| Fichier | Rôle | Appelé par le build |
| --- | --- | --- |
| `generate_sources.py` | Génère les PDF et DOCX depuis les sources Markdown. Outil de développement, dépendances Python dans un venv local. | Non |
| `make_demo_script.ps1` | Extrait le script de démo (`demo-script.md`) du scénario maître en ne gardant que les étapes `[demo]`. Windows PowerShell seul, aucune dépendance. | Oui |
| `demo-script-header.md` | En-tête UTF-8 du script de démo, avec le marqueur `{version}`. Séparé du `.ps1` parce que Windows PowerShell 5.1 lit un `.ps1` sans BOM en ANSI : le script reste en ASCII pur. | Oui (lu par le script) |

Les PDF et DOCX générés sont commités à côté de leur source Markdown ; le build se contente de les zipper.

## `make_demo_script.ps1`

Règles d'extraction : le titre de niveau 1 du scénario est remplacé par l'en-tête ; les sections `##` sont conservées si elles contiennent encore quelque chose ; une étape `###` est conservée si et seulement si son titre contient `[demo]`, avec tout son corps ; le texte de section hors étape (mode d'emploi, récapitulatif) est conservé. Le script échoue si aucune étape `[demo]` n'est trouvée.

## `generate_sources.py`

Génère les PDF et DOCX de `test-kit/sources/` à partir de leurs références Markdown. La correspondance source → format est déclarée dans le dictionnaire `MANIFEST` du script. Les fichiers `.txt` sont utilisés tels quels.

### Installation (une fois)

Depuis la racine du dépôt, avec Python 3.12 ou plus récent :

```
python -m venv test-kit/tools/.venv
test-kit/tools/.venv/Scripts/python -m pip install python-docx reportlab
```

Le répertoire `.venv/` est ignoré par Git.

### Exécution

```
test-kit/tools/.venv/Scripts/python test-kit/tools/generate_sources.py
```

Le script écrase les fichiers générés existants. Relancez-le après toute modification d'une source Markdown, puis vérifiez le rendu avant de commiter.

### Limites

Le script ne traite qu'un sous-ensemble de Markdown : titres, paragraphes, listes à puces et numérotées, tableaux, filets horizontaux, gras et italique. Les liens restent en texte brut. C'est suffisant pour des CV, offres et certificats fictifs ; ce n'est pas un convertisseur général.
