# Données utilisateur

Ce répertoire regroupe toutes vos données privées : profil, opportunités, CV, archives, configuration, statut et retour pilote. Le moteur du toolkit (`skills/`, `AGENTS.md`, `CLAUDE.md`, les README à la racine) reste en dehors : il peut être remplacé sans toucher à vos données.

Le ZIP distribué ne contient ici que des `README.md`. Au premier lancement, le coach crée les fichiers obligatoires manquants à partir des modèles de `skills/init-workspace/assets/` :

- `config/workspace.yaml` ;
- `profile/professional-profile.md` ;
- `profile/sources/external-references.md` ;
- `current-status.md`.

`feedback/pilot-feedback.md` est facultatif et n'est créé qu'à votre demande. Le coach n'écrase jamais un fichier existant. Dans `config/workspace.yaml`, il n'ajoute que les clés manquantes et met à jour les deux clés de la section `user` (prénom) à partir de votre réponse ou de votre demande.

Ne publiez jamais ce répertoire sans avoir retiré les données personnelles.
