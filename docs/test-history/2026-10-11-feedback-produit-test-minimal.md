# 2026-10-11 — Test minimal du feedback produit (issue #17, avant clôture)

Session consignée dans le journal des tests ([`docs/test-log.md`](../test-log.md)).

- **Testeur** : Jérôme Jurbert (auteur), Claude Code (scribe et consignation). Les verdicts sont ceux du testeur ; rien n'a été déduit.
- **Plan joué** : `plans/issue-17-test-minimal.md` (étapes M1 à M7), attendus détaillés dans `test-kit/scenario.md`.
- **Version** : `0.4.0-dev` (valeur de `ENGINE-VERSION` donnée par le testeur). Commit et ZIP utilisés : non relevés (la préparation, dont `build.bat`, a été faite avant la session).
- **Outil et modèle du coach** : Claude Code, Claude Sonnet 5.5 (`claude-sonnet-5-5`), d'après le fichier de feedback généré.
- **Données** : kit de test fictif. Deux workspaces, sous `C:\Temp\mycareer\Test-2026-10-11-issue-17\` (emplacement et noms différents de ceux du plan) :
  - **A** : `mycareer-workspace-testA`, workspace neuf ;
  - **B** : `mycareer-workspace-testB`, workspace d'avant #17 (exemple fictif copié dans `data/`).
- **Langue de coaching** : français uniquement.
- **Heures** : début du déroulé à 17:46, pause de 17:55 à 18:30 (35 min), fin à 19:31. Durée totale : 1 h 45 min avec la pause, 1 h 10 min hors pause. Heures de début, fin et durée par étape : non relevées (choix du testeur). Les horodatages du journal (17:55 à 19:00) sont ceux écrits par le coach.
- **Périmètre** : test minimal. Tout ce qui n'est pas listé ci-dessous est « non joué » et n'est déduit d'aucun autre résultat.
- **Écriture dans le journal** : voir la synthèse en fin de fichier.

## Résultats

Verdicts donnés par le testeur : OK pour M1 à M7, aucun écart déclaré.

## M1
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : nouvelle (première conversation du répertoire), workspace A
- Observé : « Bonjour, on peut commencer la première session », question du prénom, « Oui, Nadia », accusé de réception, phrase « J'ai préparé votre espace… » (configuration, dossier professionnel vide, références externes, état courant), rappel de confidentialité, puis message sur le feedback produit, puis proposition de construire le dossier. `workspace.yaml` : `address_by_first_name: yes`, `first_name: "Nadia"`, `product_feedback.user_id: "a656a9cf"`. `data/feedback/feedback-log.md` présent depuis le modèle, sans entrée. Pas de `pilot-feedback.md`.
- Écart : aucun
- Notes : aucune écriture dans le journal (fichier seulement initialisé depuis le modèle).
- Extrait : « Pendant la phase pilote, je tiens localement des notes sur les difficultés d'usage afin d'améliorer le produit. Pour dicter une note, commencez votre message par « suggestion d'amélioration : » ; pour obtenir un feedback produit, demandez-moi simplement de le générer. Rien n'est envoyé automatiquement. »

## M2
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : suite de M1 pour la note ; nouvelle conversation pour « On reprend. » (B2). Workspace A.
- Observé : la note dictée (« suggestion d'amélioration : le message d'accueil pourrait dire combien de temps prend la mise en place. ») est acquittée par « Note de retour produit prise en compte. » (en italique selon le testeur), puis le coach reprend (« Pour reprendre là où nous en étions : souhaitez-vous construire votre dossier professionnel… »). Journal : une ligne ajoutée, `2026-10-11 17:55 | explicite | non traitée | première session, message d'accueil | <texte brut>`. B2 : « Lancement de la session… / Bonjour Nadia. / Dossier professionnel : ⚪ vide (version 0.1). », proposition de commencer le dossier ; rien sur le feedback produit.
- Écart : aucun
- Notes : la note a été jouée avant la pause de 17:55, B2 après la reprise de 18:30. Écriture : une commande PowerShell (`[IO.File]::AppendAllText`, UTF-8 sans BOM, `Get-Date -Format 'yyyy-MM-dd HH:mm'`), sans sortie ; pas de lecture préalable ; pas de demande d'autorisation.
- Extrait : « Note de retour produit prise en compte. »

## M3
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : nouvelle, workspace B
- Observé : « Bonjour » : le coach affiche d'abord « Not a first session. Reading the config, status and profile header. », puis « Lancement de la session… », « Bonjour. », « Dossier professionnel : 🟢 prêt (version 1.0). ». Un seul message signale l'ajout des deux sections et la création du journal (voir l'extrait). Question du prénom ensuite, puis point de reprise (opportunité 002 Northwind Ledger ; 001 Lumen Pay en pause). Réponse du testeur « Oui, Nadia. » (réponse du coach non transmise). `workspace.yaml` de B après la question du prénom : `user.address_by_first_name: yes`, `first_name: "Nadia"`, `product_feedback.user_id: "f55bc0e8"`. Avant (exemple) : ni `user` ni `product_feedback` ; `language`, `privacy`, `documents` identiques avant et après. Journal de B : modèle, sans entrée.
- Écart : aucun
- Notes : deux fichiers de A ont d'abord été collés par erreur pour B (`a656a9cf`, entrée de 17:55) ; ils sont écartés. Le texte anglais « Not a first session… » précède « Lancement de la session… » (relevé tel quel).
- Extrait : « J'ai ajouté deux sections à votre configuration : user (address_by_first_name: unset, first_name vide) et product_feedback (user_id vide au départ). J'ai ensuite généré l'identifiant anonyme f55bc0e8 et recréé le journal de feedback produit. »

## M4
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : suite de M3, workspace B
- Observé : « Travaillons l'entretien technique Lumen Pay » : cinq pistes proposées, la 1 recommandée. Phrase 1 (Lumen Pay, Karim, chemin `C:\Users\nadia.berkani\Documents\Candidatures`) : « Note de retour produit prise en compte. », puis le choix des pistes est reposé. Phrase 2 (« J'ai une suggestion pour améliorer l'outil : ce serait bien de voir la liste des fichiers créés à la fin de chaque étape. ») : même acquittement, choix reposé. Phrase 3 (« J'ai une suggestion pour améliorer ma réponse sur la migration : je pourrais commencer par le résultat ») : pas d'acquittement, réponse de coaching avec trois questions. Journal : deux lignes explicites (`18:45`, contexte « opportunité 001-lumen-pay, ajout de l'offre (sources/) », texte brut avec chemin et Karim ; `18:46`, contexte « session en cours, choix du scope Lumen Pay 02-technical »), aucune pour la phrase 3.
- Écart : aucun
- Notes : écriture par deux commandes PowerShell (`AppendAllText`, UTF-8 sans BOM) ; la première écrit `` `n$line`n `` (saut de ligne avant la ligne), la seconde `` $line`n `` ; pas de lecture préalable ; pas de demande d'autorisation.
- Extrait : « Note de retour produit prise en compte. »

## M5
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : suite de M4, workspace B
- Observé : simulation courte (04, `001-lumen-pay-senior-backend-developer`, `02-technical`). Après la note « suggestion d'amélioration : les questions des interviewers sont longues à lire à l'écran », acquittement « Note de retour produit prise en compte. » sans sortie du rôle (selon le testeur). « stop » seul : « Je sors du rôle des interviewers. / Souhaitez-vous arrêter la simulation ? Elle ne pourra pas être reprise ensuite. » ; réponse « non » : « Je reprends le rôle des interviewers. / Je vous écoute. ». Arrêt : « stop », même demande de confirmation, réponse « oui, je n'ai plus le temps de terminer » (réponse du coach après la confirmation non transmise). Journal : quatre lignes, `18:54 silencieuse joker : conseil`, `18:56 silencieuse joker : réponse proposée`, `18:58 explicite` (note), `19:00 silencieuse` (arrêt, raison « je n'ai plus le temps de terminer »), toutes « non traitée », même contexte (simulation 04 …). Aucune ligne pour le « stop » refusé. `transcript.md` collé : jokers signalés en italique, pas de texte de la note ; fin « arrêt à la demande de la candidate pendant la quatrième question (manque de temps) ».
- Écart : aucun
- Notes : le testeur a adapté ses réponses aux questions posées par la simulation (la phrase « on a dû stopper le déploiement » de l'Action de D5 n'apparaît pas dans le transcript collé). Écriture : quatre commandes PowerShell, une par ajout (`AppendAllText`, UTF-8 sans BOM), sans lecture préalable ; pas de demande d'autorisation, y compris pendant la simulation.
- Extrait : « Note de retour produit prise en compte. »

## M6
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : deux nouvelles conversations, workspace B
- Observé : relevé avant l'étape (testeur) : 2 opportunités, 5 entretiens ; journal copié avant l'étape (six lignes « non traitée »). 1re conversation : « Lu 9 fichiers, trouvé fichiers », trois notes dictées retenues telles quelles, difficultés silencieuses A (arrêt), B (joker conseil), C (joker réponse proposée), statistique possible des jokers ; après « Finalement on arrête, je le ferai plus tard » : « Je n'ai écrit aucun fichier et le journal reste inchangé : toutes les entrées sont toujours « non traitées ». » Journal inchangé selon le testeur. 2e conversation : six entrées non traitées annoncées (3 notes, 3 silencieuses à retenir ou écarter) ; le testeur retient 2 et 3, le coach écarte la 1 ; trois questions ; réponses du testeur ; statistique des jokers acceptée (1 simulation, 0 conseil, 1 réponse proposée) ; fichier `feedback-f55bc0e8-2026-10-11.md` écrit. Métadonnées : identifiant f55bc0e8, version 0.4.0-dev, date 2026-10-11, « Claude Code, Claude Sonnet 5.5 (claude-sonnet-5-5) », fr-FR, 2 opportunités, 5 entretiens ; section jokers présente ; pas de ligne « (facultatif …) ». Nadia, Karim, Lumen Pay et le chemin absents du fichier (remplacés par [Entreprise A], [Personne 1], [chemin local]) ; liste des remplacements dans la conversation seulement ; « L'anonymisation n'est pas garantie. Relisez le fichier… ». Journal après la génération : les six lignes sont « traitée ».
- Écart : aucun
- Notes : la ligne de 18:54 (joker : conseil), écartée du rapport, est passée à « traitée » ; le testeur la juge correcte. La commande d'écriture du fichier et du passage à « traitée » n'est pas disponible ; pas de demande d'autorisation.
- Extrait : « Les 6 entrées du journal sont passées à « traitée ». Rien n'a été envoyé. »

## M7
- Verdict : OK
- Début : non relevée
- Fin : non relevée
- Durée : non relevée
- Conversation : nouvelle, workspace B
- Observé : « Génère mon feedback produit » : le coach indique que toutes les entrées sont déjà « traitée » et qu'il n'y a « rien de nouveau à relire », propose de générer quand même un feedback à partir des seules réponses (suffixe `-2`, sans toucher à l'existant) et pose les trois questions. Réponse du testeur : « Rien de nouveau, je n'ai pas d'autres points à ajouter. » Le coach : « sans nouvelle entrée ni réponse, je ne crée aucun fichier et je ne modifie pas le journal », puis propose le débrief de la simulation 04.
- Écart : aucun
- Notes : la réponse du testeur diffère de la formulation « Rien à ajouter. » du plan. Absence de fichier `-2` dans `data/feedback/` : non vérifiée par le testeur (affirmée par le coach).
- Extrait : « Toutes les entrées de votre journal de retour produit sont déjà marquées « traitée » […] Il n'y a donc rien de nouveau à relire. »

## Synthèse : écriture dans le journal (point ouvert du plan)

- **Outil** : commande shell PowerShell, une par ajout (`[IO.File]::AppendAllText` en UTF-8 sans BOM, horodatage `Get-Date -Format 'yyyy-MM-dd HH:mm'`), sortie « PowerShell completed with no output ». Constaté en M2, M4 et M5. Pas d'édition de fichier.
- **Lecture préalable du journal** : aucune avant les écritures (M2, M4, M5).
- **Demande d'autorisation** : aucune. Le testeur demande de considérer qu'il n'y en aura pas pour la suite sauf mention explicite ; cela reflète sa consigne, pas une observation de chaque étape.
- **Constat de forme** : une des deux commandes de M4 écrit un saut de ligne avant la ligne ; dans le journal de B collé après M4, une ligne vide sépare le bloc de format de la première entrée.

## Non joué

- Session en anglais (B9, E5), journal supprimé seul (seconde partie de B10), joker annulé et autres cas de D7, feedback retravaillé et second fichier `-2` (F1, prompts 3 et 4), documentation, build, non-régression B1 à B4 et B9, D5, D6, D7, E5.
- Durées par étape : non relevées (seule la durée totale est connue, voir l'en-tête).
- Non vérifiés : `data/current-status.md`, `transcript.md` hors extrait collé, absence de fichier `-2`.
