# Kit de test et de démo

Ce répertoire contient le matériel nécessaire pour tester le toolkit et le montrer en démo **sans aucune donnée personnelle**. Tout y est fictif : la candidate, ses employeurs, ses écoles, les organismes de certification, les entreprises qui recrutent et les personnes citées. Toute ressemblance avec des personnes ou des sociétés réelles serait fortuite.

Le kit n'est jamais inclus dans le ZIP de MyCareer Workspace distribué. Le build en produit un ZIP séparé, destiné aux testeurs et aux présentateurs.

## Contenu

| Chemin | Rôle |
| --- | --- |
| `sources/profile/` | Sources fictives du dossier professionnel de la candidate : CV, export de profil LinkedIn, certificat et notes complémentaires, plus un livret de formation d'une cinquantaine de pages pour tester une source très volumineuse (seule sa première page apporte des faits utiles). |
| `sources/opportunities/` | Sources fictives des opportunités : deux offres d'emploi et des notes d'appel. |
| `scenario.md` | Scénario maître : la liste ordonnée des étapes à jouer, avec les fichiers à injecter, les prompts, les mots-clés, les résultats attendus et les items du plan de test correspondants. |
| `guide-testeur.md` | Guide du testeur : comment dérouler le scénario, noter les résultats (y compris à la voix avec un assistant scribe, prompt fourni) et préparer le journal de test et le rapport. |
| `tools/` | Outils du kit : génération des PDF et DOCX à partir des sources Markdown, extraction du script de démo, et mod Claude Code `/test-coverage` qui affiche la couverture des tests. Voir [`tools/README.md`](tools/README.md). |

Les sources Markdown sont la référence. Les PDF, DOCX et TXT sont les fichiers que l'on dépose réellement dans le workspace pendant un test ou une démo ; les PDF et DOCX sont générés depuis le Markdown puis commités, pour que le build n'ait aucune dépendance.

## La candidate fictive

**Nadia Berkani**, développeuse backend senior Java/Spring à Lyon, sept ans d'expérience, en poste chez un éditeur de solutions de paiement fictif. Elle cherche un poste senior ou de tech lead, veut rester développeuse et se prépare à deux opportunités :

1. **Lumen Pay** (fictive), fintech lyonnaise, offre en français, processus en trois entretiens sans exercice de code.
2. **Northwind Ledger** (fictive), scale-up européenne en télétravail, offre en anglais, processus en cinq étapes dont un entretien de system design au tableau, qu'elle redoute.

La deuxième opportunité sert à montrer le traitement de deux dossiers en parallèle avec changement de session.

## Langues

Les sources fictives et les documents de travail du kit sont en français, langue du pilote. L'offre de la deuxième opportunité est en anglais pour tester une source dans une autre langue. Les chemins, noms de fichiers et tags du scénario sont en anglais.

## Règle de projet

Tout nouveau développement du toolkit vérifie que ce kit permet de tester et de démontrer la nouveauté, le complète si besoin et met à jour `scenario.md` dans le même changement. Voir `AGENTS.md` à la racine du dépôt.
