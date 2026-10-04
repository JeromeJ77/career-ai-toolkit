# My Career Workspace

My Career Workspace fait partie de Career AI Toolkit,
créé par Jérôme Jurbert et distribué sous licence MIT.

Votre **espace carrière** est un espace privé, local et durable : vous y construisez un dossier professionnel vivant, dont vous gardez la propriété et que vous validez, puis vous l'exploitez au fil de vos opportunités et de vos entretiens. Chaque opportunité, préparation, simulation et débriefing peut l'enrichir : votre travail devient un capital professionnel réutilisable. Le coach IA vous aide à l'analyser, à le synthétiser et à vous préparer ; il ne remplace pas votre validation.

## Structure

Le moteur (`skills/`, `AGENTS.md`, `CLAUDE.md`, les README, `ENGINE-VERSION` qui indique sa version) est générique et remplaçable. Toutes vos données sont sous `data/`, qui ne contient que des `README.md` dans le ZIP distribué. Au premier lancement, le coach crée les fichiers obligatoires manquants depuis les modèles de `skills/init-workspace/assets/`, sans jamais écraser un fichier existant.

## Démarrage

1. Ouvrez ce répertoire racine dans VS Code, Claude Code ou un autre agent local.
2. Écrivez un premier message. Lors de la première session, le coach vous accueille, vous demande si vous souhaitez être appelé par votre prénom, puis prépare votre espace carrière (`data/config/workspace.yaml` et les autres fichiers obligatoires).
3. Choisissez dans `data/config/workspace.yaml` la langue du profil et du coaching.
4. Lisez `data/profile/sources/README.md`, puis déposez uniquement les documents que vous êtes autorisé à conserver.
5. Demandez : « Constitue une première version de mon dossier professionnel à partir des sources disponibles. Propose-la avant toute modification. »
6. Relisez et validez `data/profile/professional-profile.md`.
7. Pour une candidature, fournissez au coach l'offre et le contexte disponibles, puis demandez-lui d'ajouter l'opportunité. Il crée son répertoire numéroté, sa représentation Markdown et son `current-status.md`.
8. Laissez le coach ajouter les entretiens, simulations et retours au fur et à mesure du processus. Les sources originales autorisées restent inchangées.
9. Utilisez chaque conversation comme une session de coaching ciblée et relativement courte. Votre espace carrière et ses fichiers `current-status.md` portent la continuité entre les conversations.
10. Au début d'une nouvelle session, indiquez son objectif. Pour reprendre, vous pouvez simplement demander : « Où en étions-nous ? » ; le coach relit alors l'état persistant de votre espace carrière.
11. Après l'entretien, faites un retour d'expérience et validez les enrichissements durables du profil.

## Confidentialité

Le répertoire `data/` contient des données personnelles. Stockez-le sur un appareil personnel ou un espace privé et durable que vous contrôlez. N'y ajoutez aucun secret commercial, document employeur non autorisé, code source, donnée client ou donnée personnelle inutile d'un tiers.

## Retour pilote

Le fichier `data/feedback/pilot-feedback.md` est facultatif et n'est créé qu'à votre demande, depuis un modèle. Il sert à décrire l'expérience produit, sans inclure votre CV, vos réponses ou les informations de l'entreprise ciblée.
