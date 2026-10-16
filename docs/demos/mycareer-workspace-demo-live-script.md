# Script live — MyCareer Workspace (environ 20 minutes)

Script épuré de la démo à l'équipe. Les orientations et le discours sont dans la [fiche de préparation](mycareer-workspace-demo-and-slides.md) ; les attendus détaillés de chaque étape sont dans `test-kit/scenario.md` (étapes entre parenthèses).

Ce script s'écarte du script de démo généré par le build : première session jouée à l'avance, une seule conversation en live, prompts regroupés, simulation réduite aux deux jokers, moment de capitalisation ajouté. **Tout est à valider en répétition** avant la séance ; les écarts sont signalés par ⚠️.

## Avant la séance

1. Extraire le workspace v0.4.0 hors du dépôt (`C:\Temp\mycareer-workspace-demo-AA-MM-JJ`), l'ouvrir dans VS Code avec Claude Code, mode d'autorisation automatique.
2. **Copier le workspace vierge** dans un répertoire `…-vierge` : c'est le point de départ de chaque répétition.
3. Ouvrir une conversation et jouer hors public la première session (B1) :
   - « Bonjour, on peut commencer la première session. »
   - « Oui, Nadia. »
   Le coach a créé les fichiers, donné le rappel de confidentialité et propose de construire le dossier. **Laisser cette conversation ouverte** : c'est celle du live.
4. Préparer pour le glisser-déposer : les quatre fichiers de `sources/profile/` du kit (CV PDF, export LinkedIn PDF, certificat PDF, notes DOCX) et `sources/opportunities/001-lumen-pay-offre-developpeuse-backend-senior.pdf`.
5. Garder ce fichier ouvert à côté pour copier les prompts.

## Déroulé

| Temps | Séquence | Étapes |
| --- | --- | --- |
| 0:00 | Le contexte : Nadia, exemple fictif | état après B1 |
| 1:00 | Initialiser le dossier avec les documents | C1 |
| 5:00 | Valider le dossier | C2 |
| 7:00 | Le dossier devient « prêt » | C4 ⚠️ même conversation |
| 10:00 | Une opportunité | D1 ⚠️ prompt regroupé |
| 12:00 | Analyse et messages stratégiques | D2 |
| 15:00 | Préparer l'entretien technique | D3, D4 |
| 18:00 | Simulation : les deux jokers | D5 réduite ⚠️ |
| 20:00 | Debrief | D6 |
| 21:00 | Fiche de préparation à emporter | D11 ⚠️ |
| 23:00 | Capitalisation | nouvelle ⚠️ |
| 24:30 | Nouvelle conversation : reprise | E3 |
| ~26:30 | Fin | |

Les temps sont estimés et dépendent surtout du temps de réponse du coach. Avec l'initialisation du dossier en live, le déroulé complet atteint environ 26 minutes : les « Raccourcis » en fin de script permettent de revenir vers 20 minutes.

### 1. Le contexte (1 min)

À dire :

- « Tout ce que vous allez voir utilise **un exemple fictif : Nadia Berkani**, développeuse backend. Ses CV, export LinkedIn, certificat et notes personnelles sont inventés pour le kit de test ; aucune donnée réelle. »
- « J'ai déjà ouvert son espace carrière pour la première fois », en remontant brièvement l'accueil et le rappel de confidentialité dans la conversation.
- « Tout ce qui appartient à Nadia sera sous `data/` ; le reste, c'est le moteur. Une nouvelle version du moteur peut remplacer le reste sans toucher à ses données. »

### 2. Initialiser le dossier avec les documents (C1, 4 min)

```text
J'aimerais initialiser mon dossier professionnel.
```

Joindre les quatre fichiers du profil avec :

```text
Les voici : mon CV, mon export LinkedIn, mon certificat et des notes personnelles.
```

Montrer : les originaux rangés et une transcription `.md` à côté, puis surtout la proposition de dossier, les contradictions et les points à trancher. À dire : « il propose, il n'écrit rien sans validation ».

### 3. Valider le dossier (C2, 2 min)

```text
D'accord pour l'ensemble, sauf : ne mets pas mon salaire actuel dans le dossier. Applique.
```

Montrer : l'en-tête de `professional-profile.md` (en construction, version 0.2) et une section remplie, sans le salaire.

### 4. Le dossier devient « prêt » (C4, 3 min) ⚠️ même conversation

Le scénario joue C4 dans une nouvelle conversation ; ici on reste dans la même.

```text
J'aimerais préparer mes entretiens pour un poste de développeuse backend senior.
```

Montrer : le coach ne refuse pas par principe, il explique que la préparation serait moins fiable avec un dossier en construction.

```text
Oui, avant : c'est moi qui ai conçu le découpage en six services et écrit le plan de migration validé par le CTO.
```

```text
D'accord, applique, et on peut passer le dossier en prêt.
```

S'il exprime une réserve :

```text
Oui, je confirme.
```

Montrer : l'en-tête du dossier, « prêt », version 1.0. À dire : « C'est Nadia qui décide que son dossier est prêt. »

### 5. Une opportunité (D1, 2 min) ⚠️ prompt regroupé

Joindre `001-lumen-pay-offre-developpeuse-backend-senior.pdf` avec :

```text
J'ai une nouvelle opportunité : développeuse backend senior chez Lumen Pay, une fintech lyonnaise. Voici l'offre.
```

Montrer : le répertoire `001-lumen-pay-…` créé par le coach, `opportunity.md` (les faits seulement).

### 6. Analyse et messages stratégiques (D2, 3 min)

```text
J'aimerais commencer à préparer cette opportunité.
```

Montrer : les écarts relevés et les messages stratégiques proposés.

```text
Retire le dernier message stratégique, il ne me ressemble pas. Je valide les autres.
```

Montrer : dans `analysis.md`, le message retiré conservé avec sa raison. À dire : « proposé, challengé, validé ».

### 7. Préparer l'entretien technique (D3, D4, 3 min)

```text
J'ai passé l'échange RH. La semaine prochaine, c'est l'entretien technique de 1 h 15 avec deux membres de la squad, discussion d'architecture sur un cas concret. J'aimerais préparer cet entretien.
```

Quand le coach demande de raconter la migration (adapter si sa question diffère) :

```text
Chez Payflow, on avait un monolithe de règlement qui bloquait tout le monde : un déploiement par semaine, et la moindre modification touchait trois équipes. On l'a découpé en six services sur dix-huit mois. Euh, en fait c'est moi qui ai proposé le plan et qui l'ai négocié avec le CTO, mais on a tous travaillé dessus. À la fin, le temps de déploiement avait baissé de 40 %.
```

Montrer : il relève le « on » au lieu du « je » et ce qui manque, sans répondre à la place de Nadia. Ne pas mener l'échange au bout.

### 8. Simulation : les deux jokers (D5 réduite, 2 min) ⚠️

```text
Lançons une simulation courte de cet entretien technique.
```

Si le coach demande la profondeur : « Court. »

À dire avant les jokers : « Pour la démo, je vais enchaîner les deux jokers sur la même question. Ce n'est pas l'usage prévu : le coach est là pour faire réfléchir, pas pour répondre à la place. Le joker est une aide ponctuelle quand on est vraiment coincé, et la réponse proposée est la seule exception à ce principe. »

À la première question :

```text
joker, donne-moi un indice
```

Montrer : la sortie du rôle en italique, un conseil sans réponse rédigée, le retour au rôle.

Puis, sur la même question :

```text
joker, propose une réponse à ma place
```

Montrer : la réponse étiquetée « Réponse proposée (joker) », fondée sur le dossier de Nadia.

Puis :

```text
stop
```

```text
Oui, je confirme.
```

### 9. Debrief (D6, 1 min)

Si le coach n'enchaîne pas :

```text
Fais-moi le debrief.
```

Montrer : les deux jokers comptés, et la réponse proposée non évaluée comme celle de Nadia. ⚠️ Sans réponse de Nadia dans la simulation, le debrief aura peu de matière : ne pas s'y attarder, il sert surtout à montrer le traitement des jokers.

### 10. La fiche de préparation (D11, 2 min) ⚠️ jouée sans D7 à D10

```text
Je me sens prête. Génère ma fiche de préparation pour l'entretien technique.
```

Le coach signale qu'aucune question à poser n'a été travaillée et propose de les revoir. Répondre :

```text
Non, génère quand même.
```

Ouvrir `interviews/02-technical/preparation.md` (aperçu Markdown). Montrer : la première page autonome, qu'on peut remettre aux interlocuteurs (positionnement, messages stratégiques validés, questions probables), une page réservée aux notes, puis le détail à partir de la troisième page, qui commence par les points de vigilance personnels. À dire : « c'est l'aide-mémoire de Nadia juste avant et pendant l'entretien ; tout vient de ce qu'on a validé, rien n'est inventé ».

À dire aussi : la fiche est conçue pour être imprimée (première page remise aux interlocuteurs, notes à la main), mais il n'y a pas encore d'export PDF : on montre l'aperçu Markdown, et l'export fait partie des évolutions envisagées.

À dire aussi, car les sections de questions à poser sont vides : « Je n'ai pas travaillé ces questions dans la démo ; elles sont vides, le coach n'en invente pas. »

⚠️ La mise en page n'a été vérifiée qu'en passe rapide, avec ces sections vides ; le statut de l'étape reste « en préparation », sans passer à « prête ». Ne pas annoncer l'inverse. Ne pas promettre d'export PDF ni de date : il n'existe pas.

### 11. Capitalisation (1 min 30) ⚠️ jamais jouée

```text
Qu'est-ce qui, dans ce travail, mérite d'entrer dans mon dossier professionnel ?
```

```text
D'accord, applique.
```

Montrer : la proposition (ce qui est durable va au dossier, ce qui est propre à Lumen Pay reste dans l'opportunité), puis l'historique du dossier. À dire : « le travail sur cette opportunité servira aux suivantes ».

À vérifier en répétition : ce que le coach propose réellement, alors que la simulation ne contient pas de réponse de Nadia (la matière vient surtout de l'analyse et de la préparation), et l'effet sur la version du dossier (elle ne monte au plus qu'une fois par session, et elle vient de passer à 1.0).

### 12. Reprise dans une nouvelle conversation (E3, 2 min)

Fermer la conversation, en ouvrir une nouvelle.

```text
Bonjour, j'aimerais reprendre.
```

Montrer : statut du dossier, état de Lumen Pay, prochaine action proposée sans choisir à la place de Nadia. À dire : « l'espace carrière porte le contexte, pas la conversation ».

## Raccourcis si ça déborde

- Séquence 7 : ne pas coller la réponse sur la migration ; montrer seulement les thèmes et questions proposés (−1 min 30).
- Séquence 9 : sauter le debrief, enchaîner directement sur la fiche (−1 min).
- Séquence 10 : ne montrer que la première page de la fiche (−30 s).
- Séquence 2 : ne pas ouvrir de transcription, rester sur la proposition de dossier (−1 min).
- Séquence 4 : si le temps manque vraiment, la remplacer par « Passe mon dossier en prêt. » juste après la validation (−2 min), au prix du refus bienveillant, qui ne sera plus montré.

## Points de repli

- Coach trop lent ou hors sujet : le dire simplement, puis repartir d'une copie de workspace préparée en répétition, dans une nouvelle conversation.
- Copies à préparer : `…-vierge` (départ), `…-etat-c4` (dossier prêt), `…-etat-d2` (opportunité analysée), `…-etat-d6` (après le debrief), `…-etat-d11` (fiche générée).
