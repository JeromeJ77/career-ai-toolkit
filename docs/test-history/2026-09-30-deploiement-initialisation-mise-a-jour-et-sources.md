# 2026-09-30 — Déploiement, initialisation, mise à jour et sources (issue #5)

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : développeur du toolkit, avec un collègue pour une partie des essais.
- **Version** : build de travail de la v0.3.0 incluant la séparation `data/` (non publiée).
- **Données** : workspace privé du testeur ; rien de réel n'est consigné ici.

## Résultats

- ✅ Build, déploiement du ZIP et initialisation au premier lancement : le workspace démarre et les fichiers obligatoires manquants sont créés.
- ✅ Mise à jour du workspace : avec les données d'un côté et le moteur (skills, instructions) de l'autre, la mise à jour se passe très bien.
- 🐞→✅ Paramètre de configuration manquant : le coach utilisait le défaut sans écrire la clé dans `workspace.yaml`, ce qui manquait de clarté. Après correction, il ajoute les clés manquantes dans l'ordre du modèle et indique le problème de démarrage et ce qu'il a ajouté. Comportement confirmé puis consolidé dans le toolkit (⚠️ à revalider sur le texte consolidé).
- ✅ Transcription des sources : les nouvelles sources ajoutées sont transcrites en `.md` ; le comportement convient.
- 🐞 `external-references.md` non mis à jour malgré un export PDF LinkedIn fourni comme CV historique. Règle ajoutée au toolkit ; à rejouer.
- ⬜ Fichiers volumineux : non essayés. À valider.

## Suites à donner

- Rejouer après la consolidation : clé manquante, valeur invalide, transcription (en-tête, illisible, non-écrasement), `external-references.md`.
- Tester une source très volumineuse et décider si un seuil chiffré est nécessaire.
- Tester la validation explicite avant toute modification du dossier professionnel.
- Tester un retour arrière de mise à jour (issue #7).
