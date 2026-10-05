# Outils du kit de test

| Fichier | Rôle | Appelé par le build |
| --- | --- | --- |
| `generate_sources.py` | Génère les PDF et DOCX depuis les sources Markdown. Outil de développement, dépendances Python dans un venv local. | Non |
| `make_demo_script.ps1` | Extrait le script de démo (`demo-script.md`) du scénario maître en ne gardant que les étapes `[demo]`. Windows PowerShell seul, aucune dépendance. | Oui |
| `demo-script-header.md` | En-tête UTF-8 du script de démo, avec le marqueur `{version}`. Séparé du `.ps1` parce que Windows PowerShell 5.1 lit un `.ps1` sans BOM en ANSI : le script reste en ASCII pur. | Oui (lu par le script) |
| `test-coverage/` | Mod Claude Code qui affiche la couverture des tests de `docs/test-log.md` sous forme de barre (commande `/test-coverage`). Outil de développement, jamais livré. | Non |

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

## `test-coverage/`

Mod Claude Code (plugin de hooks) qui lit le statut de chaque ligne de tableau de `docs/test-log.md` et affiche la répartition en barre : vert « Validé », jaune « À revalider », rouge « Problème constaté », gris « Non testé ». La ligne de légende et les remarques ne sont pas comptées ; une catégorie non vide garde au moins une case.

```
Tests 🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟨🟥⬜⬜⬜⬜⬜⬜   88 zones
🟩 Validé 39 (44 %)   🟨 À revalider 20 (23 %)   🟥 Problème 1 (1 %)   ⬜ Non testé 28 (32 %)
```

Avec `-v`, un tableau par section suit la barre. Chaque ligne donne le nombre total de lignes, puis le nombre de lignes de chaque statut à côté de sa couleur, puis le titre de la section :

```
Lignes · 🟩 Validé · 🟨 À revalider · 🟥 Problème · ⬜ Non testé · Section

13    🟩 7    🟨 5    🟥 0    ⬜ 1    Synthèse de la couverture
 6    🟩 0    🟨 4    🟥 0    ⬜ 2    Zones du plan de test sans test consigné
11    🟩10    🟨 0    🟥 0    ⬜ 1    Scénarios #14

88    🟩39    🟨20    🟥 1    ⬜28    Total
```

Les nombres sont alignés à droite et séparés par des espaces de la largeur d'un chiffre (U+2007), et le titre vient en dernier. Les colonnes restent ainsi alignées dans la police proportionnelle de VS Code, qui fusionne en outre les espaces ordinaires consécutifs et supprime les lignes vides.

### Affichage

- `/test-coverage` affiche la barre dans la conversation, quelle que soit l'interface. Avec `-v` (ou `--verbose`), elle ajoute un tableau par section du journal (synthèse, zones du plan, scénarios de chaque issue) avec le nombre de lignes par statut et le total.
- Dans le terminal (et l'application desktop), une barre colorée est aussi dessinée au-dessus du prompt et `/test-coverage` ouvre un panneau. L'extension VS Code n'affiche pas encore ces éléments.
- Dans VS Code, `/test-coverage` n'apparaît pas dans le menu des commandes : tapez-la en entier, elle fonctionne.
- Le fichier est relu toutes les 3 secondes s'il a changé, et à la fin de chaque tour. Dans un projet sans `docs/test-log.md`, rien n'est affiché.

### Chargement

Claude Code ne charge pas un plugin depuis les réglages du projet : la variable placée dans `.claude/settings.json` ou `.claude/settings.local.json` du dépôt est ignorée. Déclarez le dossier dans le bloc `env` de votre `~/.claude/settings.json` (chemin absolu, plusieurs dossiers séparés par `;` sous Windows), puis démarrez une nouvelle session : dans VS Code, ouvrez une nouvelle conversation, la conversation en cours ne charge pas le mod.

```json
{
  "env": {
    "CLAUDE_CODE_PLUGIN_DIRS": "C:/chemin/vers/career-ai-toolkit/test-kit/tools/test-coverage"
  }
}
```

Pour une seule session : `claude --plugin-dir test-kit/tools/test-coverage`. Dans le terminal, une modification du mod le recharge à chaud ; dans VS Code, ouvrez une nouvelle conversation pour la prendre en compte.

### Vérification

```
claude plugin validate test-kit/tools/test-coverage
claude plugin test test-kit/tools/test-coverage
```

Le comptage et la répartition sont dans `hooks/coverage.ts`, couverts par `tests/coverage.test.ts` ; l'affichage est dans `hooks/register.tsx`. Le dossier `.claude-plugin/types/` est généré par Claude Code au chargement et s'ignore lui-même dans Git.
