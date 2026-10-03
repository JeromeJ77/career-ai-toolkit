# 2026-10-04 — Marqueur de version du moteur `ENGINE-VERSION`

Session consignée dans le [journal des tests](../test-log.md).

- **Testeur** : agent de développement, résultat vérifié ensuite par le développeur du toolkit.
- **Version** : `0.4.0-dev`, build local.
- **Données** : aucune ; seul le contenu du ZIP est examiné.

## Résultats

- ✅ Build nominal : `build.bat` réussit et le ZIP du workspace contient `career-ai-workspace/ENGINE-VERSION`, dont le contenu est exactement `0.4.0-dev` (une seule ligne, sans espace final), identique à `VERSION`.
- ✅ Cas négatif : un fichier `workspace/ENGINE-VERSION` ajouté dans les sources fait échouer le build (« Unexpected entry at the workspace root… »). Le fichier de test a été supprimé ensuite.

## Suites à donner

- Le message d'erreur du cas négatif évoque les données utilisateur, ce qui est un peu trompeur pour un fichier du moteur ; le refus reste correct. Sans suite pour l'instant.
