# Exigences — Kit de test

Règles du kit de test (`test-kit/`) : sources fictives et leur génération,
format du scénario maître, démo, exemple fictif du dépôt (`examples/`).

### REQ-KIT-01 — Profil fictif réaliste et cohérent

- **Exigence** : `test-kit/sources/profile/` contient le profil explicitement
  fictif d'un développeur (CV, profil LinkedIn, certification, informations
  complémentaires), réaliste, dont les sources Markdown sont cohérentes entre
  elles.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-02 — Deux opportunités fictives

- **Exigence** : `test-kit/sources/opportunities/` contient au moins deux
  opportunités fictives ; la seconde permet de montrer le travail en
  parallèle avec un changement de session.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-03 — Source très volumineuse

- **Exigence** : le kit contient une source de profil synthétique très longue,
  générée depuis une référence Markdown, utilisable pour le scénario de source
  volumineuse.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-04 — Génération des PDF et DOCX

- **Exigence** : `test-kit/tools/generate_sources.py` produit les PDF et DOCX
  du kit depuis leurs sources Markdown, et les fichiers commités correspondent
  à une génération fraîche.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-05 — Champs d'une étape du scénario

- **Exigence** : chaque étape de `test-kit/scenario.md` indique, quand ils
  s'appliquent, les fichiers à déposer et leur destination sous `data/`, le ou
  les prompts, les mots-clés, le résultat attendu et, par une ligne
  « Exigences », les exigences qu'elle couvre.
- **Origine** : #12, #20
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-06 — Conversation de chaque étape

- **Exigence** : chaque étape du scénario qui comporte un prompt indique si
  elle se joue dans une nouvelle conversation ou dans celle d'une étape
  précédente.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-07 — Étapes d'une issue non livrée

- **Exigence** : une étape qui dépend d'une issue non livrée est taguée
  `[todo #N]` et son titre est en italique.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-08 — Durée de la démo

- **Exigence** : les étapes `[demo]`, jouées depuis le seul script de démo
  lors d'une démo minutée, tiennent dans la durée cible indiquée au scénario.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-09 — Scénario jouable avec le seul kit

- **Exigence** : le scénario maître se joue de bout en bout dans un workspace
  neuf extrait du ZIP, avec les seules sources fictives du kit : chaque fichier
  qu'une étape fait déposer est fourni par le ZIP du kit.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-10 — Exemple fictif issu d'un déroulé

- **Exigence** : `examples/fictitious-developer/data/` reproduit
  l'arborescence `data/` d'un workspace, ne contient aucun fichier du moteur et
  provient d'un déroulé du scénario maître.
- **Origine** : #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-11 — Exemple fictif conforme à la structure canonique

- **Exigence** : l'exemple fictif suit la structure canonique d'une
  opportunité, de ses entretiens, de leurs simulations et de l'entretien réel.
- **Origine** : avant #5, #12
- **Statut** : ✅ Active
- **Message** : aucun

### REQ-KIT-12 — Formulations fixes identiques dans les consignes et le scénario

- **Exigence** : chaque formulation fixe d'une exigence (champ Message) est
  écrite à l'identique dans les consignes du coach et dans le scénario maître,
  pour chaque langue de coaching supportée.
- **Origine** : #8, #9, #17, D-022
- **Statut** : ✅ Active
- **Message** : aucun
