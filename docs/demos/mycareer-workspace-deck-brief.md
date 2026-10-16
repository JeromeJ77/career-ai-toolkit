# Brief de génération du deck — MyCareer Workspace

Ce fichier est un input pour un agent de génération de slides (Claude Design ou autre). Il contient les consignes et le contenu exact de chaque slide. Il est autoportant : ne rien déduire d'autre du projet.

## Consignes

- **Audience** : une équipe d'ingénieurs et de collègues, à l'oral, en visioconférence avec partage d'écran. Ce n'est pas un document à lire seul.
- **Langue** : français. Garder les noms propres et termes techniques tels quels (MyCareer Workspace, Markdown, Git, `data/`).
- **Rôle du deck** : trois slides courtes pour installer le modèle mental, une slide de transition qui annonce la démonstration live d'environ 20 minutes, une slide finale, une slide de questions, puis des slides cachées pour les questions-réponses. Le live lui-même n'est pas une slide : le présentateur bascule sur l'outil depuis la slide de transition (slide 4) et revient à la slide 5 ensuite.
- **Principe** : installer le bon modèle mental, pas expliquer. Peu de texte par slide, un message par slide. Le présentateur développe à l'oral.
- **Style** : sobre, lisible à distance, fort contraste, texte large. Pas de capture d'écran, pas de visuel d'IA générique (cerveau, robot, étincelles). Le produit n'est pas « une IA » : l'IA est un moyen, la proposition de valeur est le dossier professionnel.
- **Identité** : logo `docs/assets/brand/mycareer-workspace-logo-large.png`, à utiliser tel quel sur la slide de titre ; reprendre ses couleurs pour le deck et ne pas le redessiner.
- **Schéma de la slide 3** : à dessiner vraiment (formes et flèches), pas en texte. Le dossier professionnel est au centre et la flèche de retour vers lui est la chose la plus visible.
- **À ne pas faire** : ne pas ajouter de chiffres, de gains de temps, de comparaisons avec des concurrents ni de dates de feuille de route ; ne pas présenter les évolutions comme engagées ; ne pas citer de données de personne réelle. La seule personne citée est la candidate fictive Nadia Berkani, uniquement pour dire que l'exemple est fictif (slides 1 et 4) ; ne pas inventer d'autres noms, de photo ni de contenu de son dossier.
- **Notes du présentateur** : si l'outil le permet, mettre dans les notes de chaque slide le texte « À dire » ci-dessous.
- **Terminologie** : « espace carrière » (le produit vu par l'utilisateur), « dossier professionnel » (jamais « profil professionnel »), « opportunité », « message stratégique », « simulation d'entretien », « debrief ». Ne pas écrire « workspace » en texte courant de slide, sauf dans le nom MyCareer Workspace.

## Slide 1 — Titre

- **Titre** : MyCareer Workspace
- **Sous-titre** : Un espace carrière personnel pour construire et exploiter son dossier professionnel dans la durée.
- **Visuel** : le logo.
- **À dire** : en une phrase, un espace local et persistant dont le cœur est un dossier professionnel que l'utilisateur possède. Préciser que la démonstration utilise un exemple entièrement fictif, Nadia Berkani, développeuse backend, sans donnée réelle.

## Slide 2 — Le problème et la réponse

- **Titre** : Chaque recherche d'emploi repart de zéro
- **Colonne « Aujourd'hui »** :
  - Informations dispersées : CV, LinkedIn, notes, souvenirs
  - Chaque opportunité repart en partie de zéro
  - Entretiens préparés de façon isolée
  - Mêmes expériences reformulées à chaque fois
  - Apprentissages perdus d'une préparation à l'autre
- **Colonne « Avec MyCareer Workspace »** :
  - Un dossier professionnel vivant, validé par vous
  - Chaque opportunité l'exploite et l'enrichit
  - Une mémoire qui dure, dans vos fichiers
- **Phrase de conclusion** : Construire un dossier professionnel vivant, puis l'exploiter et l'enrichir au fil des opportunités et des entretiens.
- **À dire** : ce n'est pas un énième générateur de réponses. Ce qui compte, c'est que le travail ne soit pas perdu.

## Slide 3 — La boucle de capitalisation

- **Titre** : Le dossier professionnel est le point de départ et le résultat
- **Schéma** : un cycle (pas un pipeline linéaire). Au centre, un bloc **Dossier professionnel**, avec en sous-titre « mémoire et source de vérité » et une mention « en construction → prêt ». Autour, dans l'ordre :
  1. **Sources** (CV, LinkedIn, certifications, notes), flèche entrante vers le dossier
  2. **Opportunités**
  3. **Analyse et positionnement**
  4. **Préparation des entretiens**
  5. **Simulations, entretiens réels, debriefs**
  6. **Capitalisation** (messages validés, exemples, réalisations, apprentissages), avec une flèche de retour bien visible vers le dossier, étiquetée « Dossier enrichi »
- **Branches futures** (tracé pointillé, estompées, étiquette « envisagé ») : CV ciblés, lettres de motivation adaptées. Elles partent du dossier ou d'une opportunité, et ne sont pas au même niveau que les étapes.
- **Légende en bas** : Vous validez ce qui entre dans le dossier.
- **À dire** : le dossier est à la fois l'entrée et la sortie. Chaque préparation précise des expériences, valide des messages, documente de nouveaux exemples réutilisables. Le statut « prêt » est décidé avec l'utilisateur : c'est un seuil de travail, pas un état final.

## Slide 4 — Transition : démonstration live

Elle sert de signal au présentateur pour passer au live et d'aide-mémoire aux participants pendant la démonstration. Elle reste affichée au début du live, puis le présentateur bascule sur l'outil.

- **Titre** : Démonstration
- **Bandeau visible** : Exemple entièrement fictif : Nadia Berkani, développeuse backend. Aucune donnée réelle.
- **Parcours en sept étapes**, en frise horizontale ou liste numérotée, chaque étape avec un mot-clé et une phrase courte :
  1. **Construire le dossier** : à partir de ses documents (CV, LinkedIn, certificat, notes), proposé puis validé par elle.
  2. **Décider qu'il est prêt** : le coach explique pourquoi, c'est Nadia qui tranche.
  3. **Une opportunité** : une offre d'emploi ; le coach crée la structure, compare avec le dossier, propose des messages stratégiques que Nadia valide ou retire.
  4. **Préparer l'entretien technique** : thèmes probables, points de vigilance.
  5. **S'entraîner** : simulation courte, joker (conseil, puis réponse proposée), debrief.
  6. **Repartir avec sa fiche** : l'aide-mémoire de la candidate juste avant et pendant l'entretien.
  7. **Capitaliser et reprendre** : ce qui mérite d'entrer dans le dossier, puis reprise dans une nouvelle conversation.
- **Fil rouge** (sous la frise, en petit) : tout ce qui est durable revient au dossier professionnel.
- **Consigne de mise en page** : texte assez gros pour être lu en partage d'écran ; pas plus d'une ligne par étape (sept étapes : rester lisible, au besoin sans la phrase courte). La frise doit rappeler visuellement le cycle de la slide 3 sans le répéter. Elle doit se lire en quelques secondes : c'est le signal de bascule vers le live.
- **À dire** : ce que vous allez voir est entièrement fictif ; je me concentre sur ce que l'utilisateur obtient, pas sur les fichiers. Si je vais vite sur une étape, cette slide est là pour suivre le fil. À la fin du live, je reviens à la slide suivante pour les limites et les évolutions.

## Slide 5 — Aujourd'hui, limites, évolutions

- **Titre** : Où en est-on ?
- **Trois colonnes**
  - **Déjà là (v0.4.0)**
    - Dossier professionnel vivant, avec statut et version décidés avec vous
    - Sources transcrites puis validées avant d'entrer dans le dossier
    - Plusieurs opportunités, y compris dans une autre langue
    - Analyse et messages stratégiques validés
    - Préparation d'entretiens, fiche de préparation (aide-mémoire avant et pendant l'entretien)
    - Simulations (trois profondeurs, arrêt anticipé, joker) et debriefs
    - Retour après un entretien réel
    - Reprise du contexte dans une nouvelle conversation
    - Local, sans navigation web sans accord explicite
    - Données séparées du moteur : une mise à jour du moteur ne touche pas les données
    - Capitalisation contrôlée vers le dossier
  - **Limites**
    - Testé sur un candidat fictif, pas encore sur un pilote réel
    - Comportement dépendant du modèle, vérifié par des passes manuelles, pas encore par des tests automatisés
    - Certaines opérations sur les fichiers et la lecture des PDF sont lentes
    - Usage confortable avec un mode d'autorisation automatique de l'outil IA
    - Mise à jour du moteur préparée mais pas encore outillée (procédure, détection, migrations)
    - Fiche de préparation conçue pour être imprimée, mais pas encore d'export PDF
  - **Évolutions envisagées**
    - CV ciblés par opportunité
    - Lettres de motivation adaptées
    - Export PDF de la fiche de préparation
    - Entretien d'initialisation du dossier
    - Mise à jour guidée du moteur, avec historique Git local
    - Accompagnement de carrière au-delà d'une recherche ponctuelle
    - Développement et suivi des compétences
- **Consigne de mise en page** : trop dense pour une seule slide à l'oral. Réduire à 5 à 6 puces par colonne en regroupant, ou répartir en deux slides (« Déjà là » seul, puis « Limites et évolutions »). Ne pas supprimer les limites : elles ne se masquent pas.
- **À dire** : parler d'« évolutions envisagées », pas de feuille de route : les priorités ne sont pas stabilisées. Pour la mise à jour du moteur, dire « conçue pour » plutôt que « garantie » : elle n'a pas encore été testée de bout en bout.

## Slide 6 — Questions

- **Texte** : Questions
- **Visuel** : le logo, petit.

## Slides cachées (après la slide 6, hors présentation)

À placer en annexe, marquées comme masquées, pour répondre à une question précise.

### Annexe A — Données et moteur séparés

- **Titre** : Vos données ne bougent pas quand le moteur évolue
- **Schéma** : deux blocs côte à côte.
  - **Moteur** (remplaçable) : instructions du coach, skills, modèles, README
  - **`data/`** (à vous) : configuration, dossier professionnel et sources, opportunités, CV, archives, état courant, feedback produit
- **Points**
  - Une nouvelle version remplace le moteur ; `data/` n'en contient que des README dans la distribution
  - Les fichiers obligatoires sont créés depuis des modèles, sans jamais écraser un fichier existant
  - Une clé de configuration ajoutée par une version est complétée avec sa valeur par défaut
  - Prévu ensuite : procédure de mise à jour, détection par le coach, nettoyage des fichiers obsolètes, migrations
- **À dire** : c'est la base de la persistance dans la durée. Conçu pour, à tester de bout en bout avant d'en faire une garantie.

### Annexe B — Le coach, pas un générateur de réponses

- **Titre** : Faire réfléchir avant de répondre
- **Points**
  - Le coach pose des questions, relève ce qui manque, ne complète pas à la place de la personne
  - Le joker, en simulation seulement : un conseil, ou une réponse proposée clairement étiquetée, fondée sur le dossier. C'est la seule exception
  - Rien n'est écrit dans le dossier sans validation
  - Aucune navigation web sans accord explicite
- **À dire** : le joker est une aide ponctuelle quand on est vraiment coincé, tracée dans le transcript et comptée au debrief.

### Annexe C — Comment on fait évoluer le coach

- **Titre** : Les instructions du coach sont du code source
- **Schéma** : une chaîne horizontale : issue → scénarios de test → plan d'implémentation → implémentation → revue → tests manuels → journal des tests.
- **Points**
  - Les instructions et skills sont versionnés et testés comme du code
  - Un kit de test fictif et un scénario maître servent aux tests et à la démo
  - Comportement vérifié par des passes manuelles guidées ; tests automatisés envisagés
  - Les difficultés pour obtenir exactement le comportement voulu sont consignées
- **À dire** : utile si l'équipe pose des questions sur la fiabilité et le test d'un système piloté par des instructions.

### Annexe D — Choix techniques

- **Titre** : Pourquoi des fichiers Markdown
- **Points**
  - Lisible, versionnable avec Git, portable, sous le contrôle de l'utilisateur
  - Aucune base de données ni service externe
  - Choix à challenger : SQLite ou une approche hybride restent à comparer, la décision n'est pas encore formalisée (ne pas dire que ces alternatives ont été étudiées)
  - Fonctionnement local : les données restent sur le poste
- **À dire** : à utiliser seulement si la question est posée.
