# Exigences — Mise à jour du workspace

Remplacement du moteur d'un workspace existant par une nouvelle version, et
retour à la version précédente.

### REQ-UPD-01 — Mise à jour du moteur sans perte de données

- **Exigence** : remplacer le moteur d'un workspace existant par celui d'une
  nouvelle version, en copiant le contenu du ZIP par-dessus, conserve `data/`
  intact, et le coach reprend le travail à partir de ces données.
- **Origine** : #5, D-004
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-UPD-02 — Retour à la version précédente

- **Exigence** : après une mise à jour, l'utilisateur peut revenir au moteur
  de la version précédente sans perte de `data/`.
- **Origine** : #7, D-004
- **Statut** : 🔵 Proposée
- **Message** : aucun
