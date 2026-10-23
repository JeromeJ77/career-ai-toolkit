# Outils du kit de test

| Fichier | Rôle | Appelé par le build |
| --- | --- | --- |
| `generate_sources.py` | Génère les PDF et DOCX depuis les sources Markdown. Outil de développement, dépendances Python dans un venv local. | Non |
| `make_demo_script.ps1` | Extrait le script de démo (`demo-script.md`) du scénario maître en ne gardant que les étapes `[demo]`. Windows PowerShell seul, aucune dépendance. | Oui |
| `demo-script-header.md` | En-tête UTF-8 du script de démo, avec le marqueur `{version}`. Séparé du `.ps1` parce que Windows PowerShell 5.1 lit un `.ps1` sans BOM en ANSI : le script reste en ASCII pur. | Oui (lu par le script) |
| `check_traceability.ps1` | Vérifie la traçabilité entre les exigences de `docs/requirements/`, les tests qui les citent (`test-kit/scenario.md`, `docs/checks.md`) et le tableau de bord de `docs/test-log.md`. Outil de développement, Windows PowerShell seul, jamais livré. | Non |
| `test-coverage/` | Mod Claude Code qui affiche sous forme de barre la couverture des exigences du tableau de bord de `docs/test-log.md`, une ligne par exigence (commande `/test-coverage`). Outil de développement, jamais livré. | Non |
| `.claude/skills/prompteur/` (racine du dépôt) | Skill Claude Code `/prompteur` qui guide une passe de test manuelle élément par élément (`/prompteur socle` pour les étapes `[socle]`), vérifie les fichiers du workspace de test et les traces du coach, rédige la session de test et met à jour le tableau de bord. Outil de développement, jamais livré. | Non |

Les PDF et DOCX générés sont commités à côté de leur source Markdown ; le build se contente de les zipper.

## `make_demo_script.ps1`

Règles d'extraction :

- le titre de niveau 1 du scénario est remplacé par l'en-tête (`demo-script-header.md`, avec la version) ; l'introduction et le mode d'emploi sont retirés ;
- une étape `###` d'une phase est conservée si son titre contient `[demo]` et pas `[todo` ; les tags `[demo]` et `[socle]` sont retirés de son titre ;
- dans une étape conservée, les champs **Attendu** (numérotés ou non), **Exigences** et **Socle** sont retirés avec leurs lignes de suite indentées ; **Mots-clés** devient **À montrer** ; le reste est gardé tel quel ;
- du récapitulatif, seul le tableau est gardé, sans ses lignes `[todo]` ;
- une section `##` n'apparaît que si elle garde au moins une ligne.

Le script échoue si aucune étape `[demo]` n'est trouvée.

## `check_traceability.ps1`

Depuis la racine du dépôt, avant un commit qui touche le référentiel d'exigences, le scénario maître, les contrôles ou le tableau de bord, et avant une release :

```
powershell -NoProfile -ExecutionPolicy Bypass -File test-kit\tools\check_traceability.ps1
```

Le paramètre facultatif `-Root <répertoire>` vérifie une autre copie du dépôt (par défaut, le dépôt qui contient le script).

Le script lit les exigences de `docs/requirements/` (sauf `README.md`), les étapes de `test-kit/scenario.md` et les contrôles de `docs/checks.md` avec leur ligne « Exigences », et les lignes `| REQ-…` du tableau de bord ; les blocs de code sont ignorés. Une exigence est dite suivie quand elle est 🔵 Proposée ou ✅ Active.

- **Erreurs** (code de sortie 1) : identifiant d'exigence, de contrôle ou d'étape en double ou mal formé ; statut d'exigence absent ou inconnu ; exigence citée (scénario, contrôles, tableau de bord, remplaçante) inexistante ; exigence suivie sans ligne au tableau de bord ; ligne du tableau de bord en double, pour une exigence inexistante ou non suivie, ou avec un statut de test inconnu ; test de la colonne Tests inexistant (code d'étape, sous-identifiant `C4.2` d'une étape existante, ou `CHK-…`), ou dont la ligne « Exigences » ne cite pas l'exigence de la ligne du tableau de bord (pour `C4.2`, celle de l'étape `C4`) ; ligne « Exigences » hors d'une étape ou d'un contrôle.
- **Avertissements** (code 0) : exigence suivie citée par aucun test ; exigence ⚪ Remplacée ou ❌ Abandonnée encore citée par un test.

Chaque problème est donné sur une ligne (`ERROR` ou `WARNING`, fichier et ligne, identifiant, nature), puis un résumé : nombre d'exigences par statut, d'étapes, de contrôles et de lignes du tableau de bord, d'erreurs et d'avertissements. Le script est en ASCII pur, comme `make_demo_script.ps1`.

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

Mod Claude Code (plugin de hooks) qui lit le statut de test de chaque exigence du tableau de bord de `docs/test-log.md`, une ligne de tableau par exigence, et affiche la répartition en barre : vert « Validé », jaune « À revalider », rouge « Problème constaté », gris « Non testé ». Seules les lignes de tableau qui ont une cellule de statut sont comptées : la légende et les sections en liste (« Écarts ouverts », « À revalider », « Index par issue », « Sessions ») ne le sont pas. Une catégorie non vide garde au moins une case.

```
Tests 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟨🟥⬜⬜⬜⬜⬜   – 283 au total
🟩 Validé 157 (56 %)   🟨 À revalider 52 (18 %)   🟥 Problème 7 (2 %)   ⬜ Non testé 67 (24 %)
```

Avec `-v`, un tableau par domaine suit la barre. Chaque ligne donne le nombre d'exigences du domaine, puis le nombre de chaque statut à côté de sa couleur, puis le titre de la table du domaine, sans l'identifiant entre parenthèses (extrait, une ligne par domaine) :

```
Lignes · 🟩 Validé · 🟨 À revalider · 🟥 Problème · ⬜ Non testé · Section

 33    🟩 24    🟨  4    🟥  2    ⬜  3    Démarrage de session
  5    🟩  4    🟨  1    🟥  0    ⬜  0    Configuration
 11    🟩  8    🟨  1    🟥  1    ⬜  1    Sources du dossier
…
 13    🟩  0    🟨  0    🟥  0    ⬜ 13    Référentiel de tests

283    🟩157    🟨 52    🟥  7    ⬜ 67    Total
```

Les nombres sont alignés à droite et séparés par des espaces de la largeur d'un chiffre (U+2007), et le titre vient en dernier. Les colonnes restent ainsi alignées dans la police proportionnelle de VS Code, qui fusionne en outre les espaces ordinaires consécutifs et supprime les lignes vides.

### Affichage

- `/test-coverage` affiche la barre dans la conversation, quelle que soit l'interface. Avec `-v` (ou `--verbose`), elle ajoute un tableau par domaine du tableau de bord avec le nombre d'exigences par statut et le total.
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
