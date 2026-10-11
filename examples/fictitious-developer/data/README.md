# Données utilisateur

Ce répertoire regroupe toutes vos données privées : profil, opportunités, CV, archives, configuration, statut et feedback produit. Le moteur du toolkit (`skills/`, `AGENTS.md`, `CLAUDE.md`, les README à la racine) reste en dehors : il peut être remplacé sans toucher à vos données.

Le ZIP distribué ne contient ici que des `README.md`. Au premier lancement, le coach crée les fichiers obligatoires manquants à partir des modèles de `skills/init-workspace/assets/` :

- `config/workspace.yaml` ;
- `profile/professional-profile.md` ;
- `profile/sources/external-references.md` ;
- `current-status.md`.

`feedback/feedback-log.md` (journal du feedback produit) est créé à l'initialisation. Le coach n'écrase jamais un fichier existant.

Ne publiez jamais ce répertoire sans avoir retiré les données personnelles.
