# Institut Rhône Numérique

*Organisme de formation fictif*

---

## Livret de formation et attestation de fin de formation

# Architecture des systèmes distribués

**Stagiaire :** Nadia Berkani
**Employeur :** Payflow Solutions (Lyon), dans le cadre du plan de développement des compétences
**Session :** du 9 janvier au 17 mars 2023, dix jours répartis sur dix semaines
**Durée :** 70 heures, en présentiel à Lyon
**Référence de session :** IRN-ASD-2023-01

---

### Attestation

L'Institut Rhône Numérique atteste que Nadia Berkani a suivi l'intégralité de la formation « Architecture des systèmes distribués » (assiduité : 100 %) et l'a **validée**.

| Évaluation | Résultat |
| --- | --- |
| Quiz des modules 1 à 12 | 11 modules sur 12 validés au premier passage |
| Étude de cas intermédiaire (module 6) | Acquis |
| Projet final | 16 / 20, mention « très bien » |

**Projet final :** conception d'un service de règlement idempotent avec reprise sur incident, présenté devant un jury de deux formateurs.

**Appréciation du formateur référent :** « Argumente clairement ses choix de découpage et connaît bien les contraintes d'un système de paiement. Gagnerait à formaliser ses compromis par écrit, par exemple sous forme d'ADR, et à chiffrer l'état de départ avant de présenter un gain. »

Fait à Lyon, le 24 mars 2023. Signé : Thomas Vidal, responsable pédagogique (fictif).
Institut Rhône Numérique · 8 quai Imaginaire, 69002 Lyon · formation@rhone-numerique.example

---

## Présentation du livret

Ce livret rassemble le programme détaillé remis aux stagiaires : objectifs, déroulé des séances, exercices, critères d'évaluation et lectures conseillées de chacun des douze modules, suivis des annexes. Il sert de support pendant la formation et de référence après celle-ci. Les exemples sont génériques et ne décrivent aucun système réel.


## Module 1 — Fondamentaux des systèmes distribués

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde la latence, les pannes partielles, les horloges et les modèles de cohérence. Les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer la latence avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la latence.
- Expliquer les pannes partielles avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les pannes partielles.
- Expliquer les horloges avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les horloges.
- Expliquer les modèles de cohérence avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les modèles de cohérence.

### Déroulé des séances

#### Séance 1.1 — Atelier : la latence

Par groupes de trois, les stagiaires étudient la latence sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 42 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.2 — Étude de cas : la latence

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (la latence) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 53 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.3 — Démonstration : les pannes partielles

Le formateur montre les pannes partielles en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 64 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.4 — Discussion : les pannes partielles

Discussion guidée autour de les pannes partielles : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 45 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.5 — Synthèse : les horloges

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les horloges (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 56 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.6 — Exposé : les horloges

Le formateur présente les horloges et situe la notion dans l'ensemble du module « Fondamentaux des systèmes distribués ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 37 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.7 — Atelier : les modèles de cohérence

Par groupes de trois, les stagiaires étudient les modèles de cohérence sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 48 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 1.8 — Étude de cas : les modèles de cohérence

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les modèles de cohérence) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 59 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 1.1 | Décrire en cinq lignes un incident plausible en lien avec la latence, et la première action à mener. | 15 min |
| 1.2 | Comparer deux options de mise en œuvre pour la latence selon trois critères : coût, risque, réversibilité. | 20 min |
| 1.3 | Rédiger la question qu'un relecteur poserait sur la latence lors d'une revue d'architecture. | 25 min |
| 1.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la latence. | 10 min |
| 1.5 | Décrire en cinq lignes un incident plausible en lien avec les pannes partielles, et la première action à mener. | 15 min |
| 1.6 | Comparer deux options de mise en œuvre pour les pannes partielles selon trois critères : coût, risque, réversibilité. | 20 min |
| 1.7 | Rédiger la question qu'un relecteur poserait sur les pannes partielles lors d'une revue d'architecture. | 25 min |
| 1.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les pannes partielles. | 10 min |
| 1.9 | Décrire en cinq lignes un incident plausible en lien avec les horloges, et la première action à mener. | 15 min |
| 1.10 | Comparer deux options de mise en œuvre pour les horloges selon trois critères : coût, risque, réversibilité. | 20 min |
| 1.11 | Rédiger la question qu'un relecteur poserait sur les horloges lors d'une revue d'architecture. | 25 min |
| 1.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les horloges. | 10 min |
| 1.13 | Décrire en cinq lignes un incident plausible en lien avec les modèles de cohérence, et la première action à mener. | 15 min |
| 1.14 | Comparer deux options de mise en œuvre pour les modèles de cohérence selon trois critères : coût, risque, réversibilité. | 20 min |
| 1.15 | Rédiger la question qu'un relecteur poserait sur les modèles de cohérence lors d'une revue d'architecture. | 25 min |
| 1.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les modèles de cohérence. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « La latence », avec ses exercices corrigés.
- Article de synthèse fictif « La latence en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La latence », deux pages.
- Support de cours, chapitre « Les pannes partielles », avec ses exercices corrigés.
- Article de synthèse fictif « Les pannes partielles en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les pannes partielles », deux pages.
- Support de cours, chapitre « Les horloges », avec ses exercices corrigés.
- Article de synthèse fictif « Les horloges en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les horloges », deux pages.
- Support de cours, chapitre « Les modèles de cohérence », avec ses exercices corrigés.
- Article de synthèse fictif « Les modèles de cohérence en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les modèles de cohérence », deux pages.


## Module 2 — Découpage en services

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les contextes bornés, le couplage, la cohésion et les frontières de données. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les contextes bornés avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les contextes bornés.
- Expliquer le couplage avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : le couplage.
- Expliquer la cohésion avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la cohésion.
- Expliquer les frontières de données avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les frontières de données.

### Déroulé des séances

#### Séance 2.1 — Étude de cas : les contextes bornés

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les contextes bornés) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 49 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.2 — Démonstration : les contextes bornés

Le formateur montre les contextes bornés en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 60 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.3 — Discussion : le couplage

Discussion guidée autour de le couplage : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 41 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.4 — Synthèse : le couplage

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur le couplage (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 52 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.5 — Exposé : la cohésion

Le formateur présente la cohésion et situe la notion dans l'ensemble du module « Découpage en services ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 63 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.6 — Atelier : la cohésion

Par groupes de trois, les stagiaires étudient la cohésion sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 44 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.7 — Étude de cas : les frontières de données

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les frontières de données) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 55 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 2.8 — Démonstration : les frontières de données

Le formateur montre les frontières de données en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 36 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 2.1 | Décrire en cinq lignes un incident plausible en lien avec les contextes bornés, et la première action à mener. | 15 min |
| 2.2 | Comparer deux options de mise en œuvre pour les contextes bornés selon trois critères : coût, risque, réversibilité. | 20 min |
| 2.3 | Rédiger la question qu'un relecteur poserait sur les contextes bornés lors d'une revue d'architecture. | 25 min |
| 2.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les contextes bornés. | 10 min |
| 2.5 | Décrire en cinq lignes un incident plausible en lien avec le couplage, et la première action à mener. | 15 min |
| 2.6 | Comparer deux options de mise en œuvre pour le couplage selon trois critères : coût, risque, réversibilité. | 20 min |
| 2.7 | Rédiger la question qu'un relecteur poserait sur le couplage lors d'une revue d'architecture. | 25 min |
| 2.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : le couplage. | 10 min |
| 2.9 | Décrire en cinq lignes un incident plausible en lien avec la cohésion, et la première action à mener. | 15 min |
| 2.10 | Comparer deux options de mise en œuvre pour la cohésion selon trois critères : coût, risque, réversibilité. | 20 min |
| 2.11 | Rédiger la question qu'un relecteur poserait sur la cohésion lors d'une revue d'architecture. | 25 min |
| 2.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la cohésion. | 10 min |
| 2.13 | Décrire en cinq lignes un incident plausible en lien avec les frontières de données, et la première action à mener. | 15 min |
| 2.14 | Comparer deux options de mise en œuvre pour les frontières de données selon trois critères : coût, risque, réversibilité. | 20 min |
| 2.15 | Rédiger la question qu'un relecteur poserait sur les frontières de données lors d'une revue d'architecture. | 25 min |
| 2.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les frontières de données. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les contextes bornés », avec ses exercices corrigés.
- Article de synthèse fictif « Les contextes bornés en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les contextes bornés », deux pages.
- Support de cours, chapitre « Le couplage », avec ses exercices corrigés.
- Article de synthèse fictif « Le couplage en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Le couplage », deux pages.
- Support de cours, chapitre « La cohésion », avec ses exercices corrigés.
- Article de synthèse fictif « La cohésion en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La cohésion », deux pages.
- Support de cours, chapitre « Les frontières de données », avec ses exercices corrigés.
- Article de synthèse fictif « Les frontières de données en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les frontières de données », deux pages.


## Module 3 — Communication synchrone

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les API REST, les appels gRPC, les délais d'expiration et la rétropression. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les API REST avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les API REST.
- Expliquer les appels gRPC avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les appels gRPC.
- Expliquer les délais d'expiration avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les délais d'expiration.
- Expliquer la rétropression avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la rétropression.

### Déroulé des séances

#### Séance 3.1 — Démonstration : les API REST

Le formateur montre les API REST en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 56 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.2 — Discussion : les API REST

Discussion guidée autour de les API REST : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 37 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.3 — Synthèse : les appels gRPC

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les appels gRPC (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 48 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.4 — Exposé : les appels gRPC

Le formateur présente les appels gRPC et situe la notion dans l'ensemble du module « Communication synchrone ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 59 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.5 — Atelier : les délais d'expiration

Par groupes de trois, les stagiaires étudient les délais d'expiration sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 40 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.6 — Étude de cas : les délais d'expiration

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les délais d'expiration) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 51 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.7 — Démonstration : la rétropression

Le formateur montre la rétropression en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 62 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 3.8 — Discussion : la rétropression

Discussion guidée autour de la rétropression : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 43 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 3.1 | Décrire en cinq lignes un incident plausible en lien avec les API REST, et la première action à mener. | 15 min |
| 3.2 | Comparer deux options de mise en œuvre pour les API REST selon trois critères : coût, risque, réversibilité. | 20 min |
| 3.3 | Rédiger la question qu'un relecteur poserait sur les API REST lors d'une revue d'architecture. | 25 min |
| 3.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les API REST. | 10 min |
| 3.5 | Décrire en cinq lignes un incident plausible en lien avec les appels gRPC, et la première action à mener. | 15 min |
| 3.6 | Comparer deux options de mise en œuvre pour les appels gRPC selon trois critères : coût, risque, réversibilité. | 20 min |
| 3.7 | Rédiger la question qu'un relecteur poserait sur les appels gRPC lors d'une revue d'architecture. | 25 min |
| 3.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les appels gRPC. | 10 min |
| 3.9 | Décrire en cinq lignes un incident plausible en lien avec les délais d'expiration, et la première action à mener. | 15 min |
| 3.10 | Comparer deux options de mise en œuvre pour les délais d'expiration selon trois critères : coût, risque, réversibilité. | 20 min |
| 3.11 | Rédiger la question qu'un relecteur poserait sur les délais d'expiration lors d'une revue d'architecture. | 25 min |
| 3.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les délais d'expiration. | 10 min |
| 3.13 | Décrire en cinq lignes un incident plausible en lien avec la rétropression, et la première action à mener. | 15 min |
| 3.14 | Comparer deux options de mise en œuvre pour la rétropression selon trois critères : coût, risque, réversibilité. | 20 min |
| 3.15 | Rédiger la question qu'un relecteur poserait sur la rétropression lors d'une revue d'architecture. | 25 min |
| 3.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la rétropression. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les API REST », avec ses exercices corrigés.
- Article de synthèse fictif « Les API REST en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les API REST », deux pages.
- Support de cours, chapitre « Les appels gRPC », avec ses exercices corrigés.
- Article de synthèse fictif « Les appels gRPC en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les appels gRPC », deux pages.
- Support de cours, chapitre « Les délais d'expiration », avec ses exercices corrigés.
- Article de synthèse fictif « Les délais d'expiration en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les délais d'expiration », deux pages.
- Support de cours, chapitre « La rétropression », avec ses exercices corrigés.
- Article de synthèse fictif « La rétropression en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La rétropression », deux pages.


## Module 4 — Messagerie et événements

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les files de messages, les journaux d'événements, l'ordre de livraison et les consommateurs idempotents. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les files de messages avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les files de messages.
- Expliquer les journaux d'événements avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les journaux d'événements.
- Expliquer l'ordre de livraison avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'ordre de livraison.
- Expliquer les consommateurs idempotents avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les consommateurs idempotents.

### Déroulé des séances

#### Séance 4.1 — Discussion : les files de messages

Discussion guidée autour de les files de messages : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 63 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.2 — Synthèse : les files de messages

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les files de messages (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 44 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.3 — Exposé : les journaux d'événements

Le formateur présente les journaux d'événements et situe la notion dans l'ensemble du module « Messagerie et événements ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 55 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.4 — Atelier : les journaux d'événements

Par groupes de trois, les stagiaires étudient les journaux d'événements sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 36 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.5 — Étude de cas : l'ordre de livraison

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (l'ordre de livraison) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 47 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.6 — Démonstration : l'ordre de livraison

Le formateur montre l'ordre de livraison en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 58 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.7 — Discussion : les consommateurs idempotents

Discussion guidée autour de les consommateurs idempotents : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 39 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 4.8 — Synthèse : les consommateurs idempotents

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les consommateurs idempotents (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 50 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 4.1 | Décrire en cinq lignes un incident plausible en lien avec les files de messages, et la première action à mener. | 15 min |
| 4.2 | Comparer deux options de mise en œuvre pour les files de messages selon trois critères : coût, risque, réversibilité. | 20 min |
| 4.3 | Rédiger la question qu'un relecteur poserait sur les files de messages lors d'une revue d'architecture. | 25 min |
| 4.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les files de messages. | 10 min |
| 4.5 | Décrire en cinq lignes un incident plausible en lien avec les journaux d'événements, et la première action à mener. | 15 min |
| 4.6 | Comparer deux options de mise en œuvre pour les journaux d'événements selon trois critères : coût, risque, réversibilité. | 20 min |
| 4.7 | Rédiger la question qu'un relecteur poserait sur les journaux d'événements lors d'une revue d'architecture. | 25 min |
| 4.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les journaux d'événements. | 10 min |
| 4.9 | Décrire en cinq lignes un incident plausible en lien avec l'ordre de livraison, et la première action à mener. | 15 min |
| 4.10 | Comparer deux options de mise en œuvre pour l'ordre de livraison selon trois critères : coût, risque, réversibilité. | 20 min |
| 4.11 | Rédiger la question qu'un relecteur poserait sur l'ordre de livraison lors d'une revue d'architecture. | 25 min |
| 4.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'ordre de livraison. | 10 min |
| 4.13 | Décrire en cinq lignes un incident plausible en lien avec les consommateurs idempotents, et la première action à mener. | 15 min |
| 4.14 | Comparer deux options de mise en œuvre pour les consommateurs idempotents selon trois critères : coût, risque, réversibilité. | 20 min |
| 4.15 | Rédiger la question qu'un relecteur poserait sur les consommateurs idempotents lors d'une revue d'architecture. | 25 min |
| 4.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les consommateurs idempotents. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les files de messages », avec ses exercices corrigés.
- Article de synthèse fictif « Les files de messages en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les files de messages », deux pages.
- Support de cours, chapitre « Les journaux d'événements », avec ses exercices corrigés.
- Article de synthèse fictif « Les journaux d'événements en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les journaux d'événements », deux pages.
- Support de cours, chapitre « L'ordre de livraison », avec ses exercices corrigés.
- Article de synthèse fictif « L'ordre de livraison en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'ordre de livraison », deux pages.
- Support de cours, chapitre « Les consommateurs idempotents », avec ses exercices corrigés.
- Article de synthèse fictif « Les consommateurs idempotents en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les consommateurs idempotents », deux pages.


## Module 5 — Gestion des données distribuées

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde la base de données par service, la réplication, le partitionnement et les migrations de schéma. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer la base de données par service avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la base de données par service.
- Expliquer la réplication avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la réplication.
- Expliquer le partitionnement avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : le partitionnement.
- Expliquer les migrations de schéma avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les migrations de schéma.

### Déroulé des séances

#### Séance 5.1 — Synthèse : la base de données par service

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur la base de données par service (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 40 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.2 — Exposé : la base de données par service

Le formateur présente la base de données par service et situe la notion dans l'ensemble du module « Gestion des données distribuées ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 51 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.3 — Atelier : la réplication

Par groupes de trois, les stagiaires étudient la réplication sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 62 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.4 — Étude de cas : la réplication

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (la réplication) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 43 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.5 — Démonstration : le partitionnement

Le formateur montre le partitionnement en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 54 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.6 — Discussion : le partitionnement

Discussion guidée autour de le partitionnement : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 35 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.7 — Synthèse : les migrations de schéma

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les migrations de schéma (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 46 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 5.8 — Exposé : les migrations de schéma

Le formateur présente les migrations de schéma et situe la notion dans l'ensemble du module « Gestion des données distribuées ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 57 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 5.1 | Décrire en cinq lignes un incident plausible en lien avec la base de données par service, et la première action à mener. | 15 min |
| 5.2 | Comparer deux options de mise en œuvre pour la base de données par service selon trois critères : coût, risque, réversibilité. | 20 min |
| 5.3 | Rédiger la question qu'un relecteur poserait sur la base de données par service lors d'une revue d'architecture. | 25 min |
| 5.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la base de données par service. | 10 min |
| 5.5 | Décrire en cinq lignes un incident plausible en lien avec la réplication, et la première action à mener. | 15 min |
| 5.6 | Comparer deux options de mise en œuvre pour la réplication selon trois critères : coût, risque, réversibilité. | 20 min |
| 5.7 | Rédiger la question qu'un relecteur poserait sur la réplication lors d'une revue d'architecture. | 25 min |
| 5.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la réplication. | 10 min |
| 5.9 | Décrire en cinq lignes un incident plausible en lien avec le partitionnement, et la première action à mener. | 15 min |
| 5.10 | Comparer deux options de mise en œuvre pour le partitionnement selon trois critères : coût, risque, réversibilité. | 20 min |
| 5.11 | Rédiger la question qu'un relecteur poserait sur le partitionnement lors d'une revue d'architecture. | 25 min |
| 5.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : le partitionnement. | 10 min |
| 5.13 | Décrire en cinq lignes un incident plausible en lien avec les migrations de schéma, et la première action à mener. | 15 min |
| 5.14 | Comparer deux options de mise en œuvre pour les migrations de schéma selon trois critères : coût, risque, réversibilité. | 20 min |
| 5.15 | Rédiger la question qu'un relecteur poserait sur les migrations de schéma lors d'une revue d'architecture. | 25 min |
| 5.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les migrations de schéma. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « La base de données par service », avec ses exercices corrigés.
- Article de synthèse fictif « La base de données par service en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La base de données par service », deux pages.
- Support de cours, chapitre « La réplication », avec ses exercices corrigés.
- Article de synthèse fictif « La réplication en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La réplication », deux pages.
- Support de cours, chapitre « Le partitionnement », avec ses exercices corrigés.
- Article de synthèse fictif « Le partitionnement en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Le partitionnement », deux pages.
- Support de cours, chapitre « Les migrations de schéma », avec ses exercices corrigés.
- Article de synthèse fictif « Les migrations de schéma en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les migrations de schéma », deux pages.


## Module 6 — Transactions et cohérence

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les sagas, la compensation, la boîte d'envoi transactionnelle et la cohérence à terme. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les sagas avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les sagas.
- Expliquer la compensation avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la compensation.
- Expliquer la boîte d'envoi transactionnelle avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la boîte d'envoi transactionnelle.
- Expliquer la cohérence à terme avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la cohérence à terme.

### Déroulé des séances

#### Séance 6.1 — Exposé : les sagas

Le formateur présente les sagas et situe la notion dans l'ensemble du module « Transactions et cohérence ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 47 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.2 — Atelier : les sagas

Par groupes de trois, les stagiaires étudient les sagas sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 58 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.3 — Étude de cas : la compensation

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (la compensation) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 39 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.4 — Démonstration : la compensation

Le formateur montre la compensation en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 50 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.5 — Discussion : la boîte d'envoi transactionnelle

Discussion guidée autour de la boîte d'envoi transactionnelle : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 61 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.6 — Synthèse : la boîte d'envoi transactionnelle

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur la boîte d'envoi transactionnelle (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 42 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.7 — Exposé : la cohérence à terme

Le formateur présente la cohérence à terme et situe la notion dans l'ensemble du module « Transactions et cohérence ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 53 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 6.8 — Atelier : la cohérence à terme

Par groupes de trois, les stagiaires étudient la cohérence à terme sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 64 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 6.1 | Décrire en cinq lignes un incident plausible en lien avec les sagas, et la première action à mener. | 15 min |
| 6.2 | Comparer deux options de mise en œuvre pour les sagas selon trois critères : coût, risque, réversibilité. | 20 min |
| 6.3 | Rédiger la question qu'un relecteur poserait sur les sagas lors d'une revue d'architecture. | 25 min |
| 6.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les sagas. | 10 min |
| 6.5 | Décrire en cinq lignes un incident plausible en lien avec la compensation, et la première action à mener. | 15 min |
| 6.6 | Comparer deux options de mise en œuvre pour la compensation selon trois critères : coût, risque, réversibilité. | 20 min |
| 6.7 | Rédiger la question qu'un relecteur poserait sur la compensation lors d'une revue d'architecture. | 25 min |
| 6.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la compensation. | 10 min |
| 6.9 | Décrire en cinq lignes un incident plausible en lien avec la boîte d'envoi transactionnelle, et la première action à mener. | 15 min |
| 6.10 | Comparer deux options de mise en œuvre pour la boîte d'envoi transactionnelle selon trois critères : coût, risque, réversibilité. | 20 min |
| 6.11 | Rédiger la question qu'un relecteur poserait sur la boîte d'envoi transactionnelle lors d'une revue d'architecture. | 25 min |
| 6.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la boîte d'envoi transactionnelle. | 10 min |
| 6.13 | Décrire en cinq lignes un incident plausible en lien avec la cohérence à terme, et la première action à mener. | 15 min |
| 6.14 | Comparer deux options de mise en œuvre pour la cohérence à terme selon trois critères : coût, risque, réversibilité. | 20 min |
| 6.15 | Rédiger la question qu'un relecteur poserait sur la cohérence à terme lors d'une revue d'architecture. | 25 min |
| 6.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la cohérence à terme. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les sagas », avec ses exercices corrigés.
- Article de synthèse fictif « Les sagas en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les sagas », deux pages.
- Support de cours, chapitre « La compensation », avec ses exercices corrigés.
- Article de synthèse fictif « La compensation en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La compensation », deux pages.
- Support de cours, chapitre « La boîte d'envoi transactionnelle », avec ses exercices corrigés.
- Article de synthèse fictif « La boîte d'envoi transactionnelle en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La boîte d'envoi transactionnelle », deux pages.
- Support de cours, chapitre « La cohérence à terme », avec ses exercices corrigés.
- Article de synthèse fictif « La cohérence à terme en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La cohérence à terme », deux pages.


## Module 7 — Résilience

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les disjoncteurs, les nouvelles tentatives, l'isolation des ressources et la dégradation maîtrisée. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les disjoncteurs avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les disjoncteurs.
- Expliquer les nouvelles tentatives avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les nouvelles tentatives.
- Expliquer l'isolation des ressources avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'isolation des ressources.
- Expliquer la dégradation maîtrisée avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la dégradation maîtrisée.

### Déroulé des séances

#### Séance 7.1 — Atelier : les disjoncteurs

Par groupes de trois, les stagiaires étudient les disjoncteurs sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 54 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.2 — Étude de cas : les disjoncteurs

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les disjoncteurs) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 35 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.3 — Démonstration : les nouvelles tentatives

Le formateur montre les nouvelles tentatives en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 46 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.4 — Discussion : les nouvelles tentatives

Discussion guidée autour de les nouvelles tentatives : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 57 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.5 — Synthèse : l'isolation des ressources

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur l'isolation des ressources (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 38 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.6 — Exposé : l'isolation des ressources

Le formateur présente l'isolation des ressources et situe la notion dans l'ensemble du module « Résilience ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 49 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.7 — Atelier : la dégradation maîtrisée

Par groupes de trois, les stagiaires étudient la dégradation maîtrisée sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 60 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 7.8 — Étude de cas : la dégradation maîtrisée

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (la dégradation maîtrisée) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 41 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 7.1 | Décrire en cinq lignes un incident plausible en lien avec les disjoncteurs, et la première action à mener. | 15 min |
| 7.2 | Comparer deux options de mise en œuvre pour les disjoncteurs selon trois critères : coût, risque, réversibilité. | 20 min |
| 7.3 | Rédiger la question qu'un relecteur poserait sur les disjoncteurs lors d'une revue d'architecture. | 25 min |
| 7.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les disjoncteurs. | 10 min |
| 7.5 | Décrire en cinq lignes un incident plausible en lien avec les nouvelles tentatives, et la première action à mener. | 15 min |
| 7.6 | Comparer deux options de mise en œuvre pour les nouvelles tentatives selon trois critères : coût, risque, réversibilité. | 20 min |
| 7.7 | Rédiger la question qu'un relecteur poserait sur les nouvelles tentatives lors d'une revue d'architecture. | 25 min |
| 7.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les nouvelles tentatives. | 10 min |
| 7.9 | Décrire en cinq lignes un incident plausible en lien avec l'isolation des ressources, et la première action à mener. | 15 min |
| 7.10 | Comparer deux options de mise en œuvre pour l'isolation des ressources selon trois critères : coût, risque, réversibilité. | 20 min |
| 7.11 | Rédiger la question qu'un relecteur poserait sur l'isolation des ressources lors d'une revue d'architecture. | 25 min |
| 7.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'isolation des ressources. | 10 min |
| 7.13 | Décrire en cinq lignes un incident plausible en lien avec la dégradation maîtrisée, et la première action à mener. | 15 min |
| 7.14 | Comparer deux options de mise en œuvre pour la dégradation maîtrisée selon trois critères : coût, risque, réversibilité. | 20 min |
| 7.15 | Rédiger la question qu'un relecteur poserait sur la dégradation maîtrisée lors d'une revue d'architecture. | 25 min |
| 7.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la dégradation maîtrisée. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les disjoncteurs », avec ses exercices corrigés.
- Article de synthèse fictif « Les disjoncteurs en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les disjoncteurs », deux pages.
- Support de cours, chapitre « Les nouvelles tentatives », avec ses exercices corrigés.
- Article de synthèse fictif « Les nouvelles tentatives en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les nouvelles tentatives », deux pages.
- Support de cours, chapitre « L'isolation des ressources », avec ses exercices corrigés.
- Article de synthèse fictif « L'isolation des ressources en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'isolation des ressources », deux pages.
- Support de cours, chapitre « La dégradation maîtrisée », avec ses exercices corrigés.
- Article de synthèse fictif « La dégradation maîtrisée en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La dégradation maîtrisée », deux pages.


## Module 8 — Observabilité

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les traces distribuées, les métriques, les journaux structurés et les objectifs de niveau de service. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les traces distribuées avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les traces distribuées.
- Expliquer les métriques avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les métriques.
- Expliquer les journaux structurés avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les journaux structurés.
- Expliquer les objectifs de niveau de service avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les objectifs de niveau de service.

### Déroulé des séances

#### Séance 8.1 — Étude de cas : les traces distribuées

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les traces distribuées) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 61 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.2 — Démonstration : les traces distribuées

Le formateur montre les traces distribuées en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 42 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.3 — Discussion : les métriques

Discussion guidée autour de les métriques : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 53 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.4 — Synthèse : les métriques

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les métriques (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 64 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.5 — Exposé : les journaux structurés

Le formateur présente les journaux structurés et situe la notion dans l'ensemble du module « Observabilité ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 45 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.6 — Atelier : les journaux structurés

Par groupes de trois, les stagiaires étudient les journaux structurés sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 56 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.7 — Étude de cas : les objectifs de niveau de service

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les objectifs de niveau de service) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 37 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 8.8 — Démonstration : les objectifs de niveau de service

Le formateur montre les objectifs de niveau de service en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 48 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 8.1 | Décrire en cinq lignes un incident plausible en lien avec les traces distribuées, et la première action à mener. | 15 min |
| 8.2 | Comparer deux options de mise en œuvre pour les traces distribuées selon trois critères : coût, risque, réversibilité. | 20 min |
| 8.3 | Rédiger la question qu'un relecteur poserait sur les traces distribuées lors d'une revue d'architecture. | 25 min |
| 8.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les traces distribuées. | 10 min |
| 8.5 | Décrire en cinq lignes un incident plausible en lien avec les métriques, et la première action à mener. | 15 min |
| 8.6 | Comparer deux options de mise en œuvre pour les métriques selon trois critères : coût, risque, réversibilité. | 20 min |
| 8.7 | Rédiger la question qu'un relecteur poserait sur les métriques lors d'une revue d'architecture. | 25 min |
| 8.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les métriques. | 10 min |
| 8.9 | Décrire en cinq lignes un incident plausible en lien avec les journaux structurés, et la première action à mener. | 15 min |
| 8.10 | Comparer deux options de mise en œuvre pour les journaux structurés selon trois critères : coût, risque, réversibilité. | 20 min |
| 8.11 | Rédiger la question qu'un relecteur poserait sur les journaux structurés lors d'une revue d'architecture. | 25 min |
| 8.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les journaux structurés. | 10 min |
| 8.13 | Décrire en cinq lignes un incident plausible en lien avec les objectifs de niveau de service, et la première action à mener. | 15 min |
| 8.14 | Comparer deux options de mise en œuvre pour les objectifs de niveau de service selon trois critères : coût, risque, réversibilité. | 20 min |
| 8.15 | Rédiger la question qu'un relecteur poserait sur les objectifs de niveau de service lors d'une revue d'architecture. | 25 min |
| 8.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les objectifs de niveau de service. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les traces distribuées », avec ses exercices corrigés.
- Article de synthèse fictif « Les traces distribuées en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les traces distribuées », deux pages.
- Support de cours, chapitre « Les métriques », avec ses exercices corrigés.
- Article de synthèse fictif « Les métriques en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les métriques », deux pages.
- Support de cours, chapitre « Les journaux structurés », avec ses exercices corrigés.
- Article de synthèse fictif « Les journaux structurés en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les journaux structurés », deux pages.
- Support de cours, chapitre « Les objectifs de niveau de service », avec ses exercices corrigés.
- Article de synthèse fictif « Les objectifs de niveau de service en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les objectifs de niveau de service », deux pages.


## Module 9 — Sécurité des architectures distribuées

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde l'authentification entre services, la gestion des secrets, le chiffrement et le moindre privilège. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer l'authentification entre services avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'authentification entre services.
- Expliquer la gestion des secrets avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la gestion des secrets.
- Expliquer le chiffrement avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : le chiffrement.
- Expliquer le moindre privilège avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : le moindre privilège.

### Déroulé des séances

#### Séance 9.1 — Démonstration : l'authentification entre services

Le formateur montre l'authentification entre services en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 38 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.2 — Discussion : l'authentification entre services

Discussion guidée autour de l'authentification entre services : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 49 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.3 — Synthèse : la gestion des secrets

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur la gestion des secrets (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 60 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.4 — Exposé : la gestion des secrets

Le formateur présente la gestion des secrets et situe la notion dans l'ensemble du module « Sécurité des architectures distribuées ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 41 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.5 — Atelier : le chiffrement

Par groupes de trois, les stagiaires étudient le chiffrement sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 52 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.6 — Étude de cas : le chiffrement

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (le chiffrement) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 63 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.7 — Démonstration : le moindre privilège

Le formateur montre le moindre privilège en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 44 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 9.8 — Discussion : le moindre privilège

Discussion guidée autour de le moindre privilège : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 55 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 9.1 | Décrire en cinq lignes un incident plausible en lien avec l'authentification entre services, et la première action à mener. | 15 min |
| 9.2 | Comparer deux options de mise en œuvre pour l'authentification entre services selon trois critères : coût, risque, réversibilité. | 20 min |
| 9.3 | Rédiger la question qu'un relecteur poserait sur l'authentification entre services lors d'une revue d'architecture. | 25 min |
| 9.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'authentification entre services. | 10 min |
| 9.5 | Décrire en cinq lignes un incident plausible en lien avec la gestion des secrets, et la première action à mener. | 15 min |
| 9.6 | Comparer deux options de mise en œuvre pour la gestion des secrets selon trois critères : coût, risque, réversibilité. | 20 min |
| 9.7 | Rédiger la question qu'un relecteur poserait sur la gestion des secrets lors d'une revue d'architecture. | 25 min |
| 9.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la gestion des secrets. | 10 min |
| 9.9 | Décrire en cinq lignes un incident plausible en lien avec le chiffrement, et la première action à mener. | 15 min |
| 9.10 | Comparer deux options de mise en œuvre pour le chiffrement selon trois critères : coût, risque, réversibilité. | 20 min |
| 9.11 | Rédiger la question qu'un relecteur poserait sur le chiffrement lors d'une revue d'architecture. | 25 min |
| 9.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : le chiffrement. | 10 min |
| 9.13 | Décrire en cinq lignes un incident plausible en lien avec le moindre privilège, et la première action à mener. | 15 min |
| 9.14 | Comparer deux options de mise en œuvre pour le moindre privilège selon trois critères : coût, risque, réversibilité. | 20 min |
| 9.15 | Rédiger la question qu'un relecteur poserait sur le moindre privilège lors d'une revue d'architecture. | 25 min |
| 9.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : le moindre privilège. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « L'authentification entre services », avec ses exercices corrigés.
- Article de synthèse fictif « L'authentification entre services en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'authentification entre services », deux pages.
- Support de cours, chapitre « La gestion des secrets », avec ses exercices corrigés.
- Article de synthèse fictif « La gestion des secrets en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La gestion des secrets », deux pages.
- Support de cours, chapitre « Le chiffrement », avec ses exercices corrigés.
- Article de synthèse fictif « Le chiffrement en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Le chiffrement », deux pages.
- Support de cours, chapitre « Le moindre privilège », avec ses exercices corrigés.
- Article de synthèse fictif « Le moindre privilège en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Le moindre privilège », deux pages.


## Module 10 — Déploiement et exploitation

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde l'intégration continue, le déploiement progressif, l'infrastructure as code et la gestion des versions d'API. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer l'intégration continue avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'intégration continue.
- Expliquer le déploiement progressif avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : le déploiement progressif.
- Expliquer l'infrastructure as code avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'infrastructure as code.
- Expliquer la gestion des versions d'API avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la gestion des versions d'API.

### Déroulé des séances

#### Séance 10.1 — Discussion : l'intégration continue

Discussion guidée autour de l'intégration continue : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 45 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.2 — Synthèse : l'intégration continue

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur l'intégration continue (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 56 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.3 — Exposé : le déploiement progressif

Le formateur présente le déploiement progressif et situe la notion dans l'ensemble du module « Déploiement et exploitation ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 37 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.4 — Atelier : le déploiement progressif

Par groupes de trois, les stagiaires étudient le déploiement progressif sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 48 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.5 — Étude de cas : l'infrastructure as code

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (l'infrastructure as code) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 59 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.6 — Démonstration : l'infrastructure as code

Le formateur montre l'infrastructure as code en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 40 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.7 — Discussion : la gestion des versions d'API

Discussion guidée autour de la gestion des versions d'API : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 51 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 10.8 — Synthèse : la gestion des versions d'API

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur la gestion des versions d'API (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 62 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 10.1 | Décrire en cinq lignes un incident plausible en lien avec l'intégration continue, et la première action à mener. | 15 min |
| 10.2 | Comparer deux options de mise en œuvre pour l'intégration continue selon trois critères : coût, risque, réversibilité. | 20 min |
| 10.3 | Rédiger la question qu'un relecteur poserait sur l'intégration continue lors d'une revue d'architecture. | 25 min |
| 10.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'intégration continue. | 10 min |
| 10.5 | Décrire en cinq lignes un incident plausible en lien avec le déploiement progressif, et la première action à mener. | 15 min |
| 10.6 | Comparer deux options de mise en œuvre pour le déploiement progressif selon trois critères : coût, risque, réversibilité. | 20 min |
| 10.7 | Rédiger la question qu'un relecteur poserait sur le déploiement progressif lors d'une revue d'architecture. | 25 min |
| 10.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : le déploiement progressif. | 10 min |
| 10.9 | Décrire en cinq lignes un incident plausible en lien avec l'infrastructure as code, et la première action à mener. | 15 min |
| 10.10 | Comparer deux options de mise en œuvre pour l'infrastructure as code selon trois critères : coût, risque, réversibilité. | 20 min |
| 10.11 | Rédiger la question qu'un relecteur poserait sur l'infrastructure as code lors d'une revue d'architecture. | 25 min |
| 10.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'infrastructure as code. | 10 min |
| 10.13 | Décrire en cinq lignes un incident plausible en lien avec la gestion des versions d'API, et la première action à mener. | 15 min |
| 10.14 | Comparer deux options de mise en œuvre pour la gestion des versions d'API selon trois critères : coût, risque, réversibilité. | 20 min |
| 10.15 | Rédiger la question qu'un relecteur poserait sur la gestion des versions d'API lors d'une revue d'architecture. | 25 min |
| 10.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la gestion des versions d'API. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « L'intégration continue », avec ses exercices corrigés.
- Article de synthèse fictif « L'intégration continue en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'intégration continue », deux pages.
- Support de cours, chapitre « Le déploiement progressif », avec ses exercices corrigés.
- Article de synthèse fictif « Le déploiement progressif en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Le déploiement progressif », deux pages.
- Support de cours, chapitre « L'infrastructure as code », avec ses exercices corrigés.
- Article de synthèse fictif « L'infrastructure as code en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'infrastructure as code », deux pages.
- Support de cours, chapitre « La gestion des versions d'API », avec ses exercices corrigés.
- Article de synthèse fictif « La gestion des versions d'API en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La gestion des versions d'API », deux pages.


## Module 11 — Tests des systèmes distribués

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les tests de contrat, les tests de bout en bout, l'injection de pannes et les environnements éphémères. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les tests de contrat avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les tests de contrat.
- Expliquer les tests de bout en bout avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les tests de bout en bout.
- Expliquer l'injection de pannes avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : l'injection de pannes.
- Expliquer les environnements éphémères avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les environnements éphémères.

### Déroulé des séances

#### Séance 11.1 — Synthèse : les tests de contrat

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les tests de contrat (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 52 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.2 — Exposé : les tests de contrat

Le formateur présente les tests de contrat et situe la notion dans l'ensemble du module « Tests des systèmes distribués ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 63 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.3 — Atelier : les tests de bout en bout

Par groupes de trois, les stagiaires étudient les tests de bout en bout sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 44 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.4 — Étude de cas : les tests de bout en bout

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les tests de bout en bout) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 55 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.5 — Démonstration : l'injection de pannes

Le formateur montre l'injection de pannes en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 36 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.6 — Discussion : l'injection de pannes

Discussion guidée autour de l'injection de pannes : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 47 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.7 — Synthèse : les environnements éphémères

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur les environnements éphémères (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 58 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 11.8 — Exposé : les environnements éphémères

Le formateur présente les environnements éphémères et situe la notion dans l'ensemble du module « Tests des systèmes distribués ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 39 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 11.1 | Décrire en cinq lignes un incident plausible en lien avec les tests de contrat, et la première action à mener. | 15 min |
| 11.2 | Comparer deux options de mise en œuvre pour les tests de contrat selon trois critères : coût, risque, réversibilité. | 20 min |
| 11.3 | Rédiger la question qu'un relecteur poserait sur les tests de contrat lors d'une revue d'architecture. | 25 min |
| 11.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les tests de contrat. | 10 min |
| 11.5 | Décrire en cinq lignes un incident plausible en lien avec les tests de bout en bout, et la première action à mener. | 15 min |
| 11.6 | Comparer deux options de mise en œuvre pour les tests de bout en bout selon trois critères : coût, risque, réversibilité. | 20 min |
| 11.7 | Rédiger la question qu'un relecteur poserait sur les tests de bout en bout lors d'une revue d'architecture. | 25 min |
| 11.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les tests de bout en bout. | 10 min |
| 11.9 | Décrire en cinq lignes un incident plausible en lien avec l'injection de pannes, et la première action à mener. | 15 min |
| 11.10 | Comparer deux options de mise en œuvre pour l'injection de pannes selon trois critères : coût, risque, réversibilité. | 20 min |
| 11.11 | Rédiger la question qu'un relecteur poserait sur l'injection de pannes lors d'une revue d'architecture. | 25 min |
| 11.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : l'injection de pannes. | 10 min |
| 11.13 | Décrire en cinq lignes un incident plausible en lien avec les environnements éphémères, et la première action à mener. | 15 min |
| 11.14 | Comparer deux options de mise en œuvre pour les environnements éphémères selon trois critères : coût, risque, réversibilité. | 20 min |
| 11.15 | Rédiger la question qu'un relecteur poserait sur les environnements éphémères lors d'une revue d'architecture. | 25 min |
| 11.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les environnements éphémères. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les tests de contrat », avec ses exercices corrigés.
- Article de synthèse fictif « Les tests de contrat en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les tests de contrat », deux pages.
- Support de cours, chapitre « Les tests de bout en bout », avec ses exercices corrigés.
- Article de synthèse fictif « Les tests de bout en bout en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les tests de bout en bout », deux pages.
- Support de cours, chapitre « L'injection de pannes », avec ses exercices corrigés.
- Article de synthèse fictif « L'injection de pannes en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « L'injection de pannes », deux pages.
- Support de cours, chapitre « Les environnements éphémères », avec ses exercices corrigés.
- Article de synthèse fictif « Les environnements éphémères en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les environnements éphémères », deux pages.


## Module 12 — Décisions d'architecture et gouvernance

**Durée :** 5 h 50, soit une demi-journée et une soirée de travail personnel guidé.

Ce module aborde les enregistrements de décision (ADR), les revues d'architecture, la dette technique et la trajectoire de migration. Il s'appuie sur les modules précédents et prépare les suivants ; les notions y sont présentées du point de vue d'une équipe qui doit faire évoluer un système existant, pas le concevoir à partir de rien.

### Objectifs pédagogiques

- Expliquer les enregistrements de décision (ADR) avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les enregistrements de décision (ADR).
- Expliquer les revues d'architecture avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : les revues d'architecture.
- Expliquer la dette technique avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la dette technique.
- Expliquer la trajectoire de migration avec ses propres mots et donner un exemple d'usage pertinent.
- Reconnaître les situations où la notion suivante apporte plus de complexité que de bénéfices : la trajectoire de migration.

### Déroulé des séances

#### Séance 12.1 — Exposé : les enregistrements de décision (ADR)

Le formateur présente les enregistrements de décision (ADR) et situe la notion dans l'ensemble du module « Décisions d'architecture et gouvernance ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 59 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.2 — Atelier : les enregistrements de décision (ADR)

Par groupes de trois, les stagiaires étudient les enregistrements de décision (ADR) sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 40 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.3 — Étude de cas : les revues d'architecture

L'étude de cas porte sur une plateforme fictive de réservation dont l'architecture a évolué sans plan d'ensemble. Les stagiaires repèrent les moments où la notion étudiée (les revues d'architecture) aurait changé la trajectoire, chiffrent grossièrement l'effort et proposent un ordre de priorité. La séance se termine par une restitution de dix minutes par groupe.

Durée indicative : 51 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.4 — Démonstration : les revues d'architecture

Le formateur montre les revues d'architecture en situation, sur un environnement de démonstration où il injecte une panne ou une charge inhabituelle. Les stagiaires observent les indicateurs, décrivent ce qu'ils voient avant toute interprétation, puis comparent leurs hypothèses avec l'explication.

Durée indicative : 62 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.5 — Discussion : la dette technique

Discussion guidée autour de la dette technique : dans quels cas la notion est surdimensionnée, quels signaux indiquent qu'elle devient nécessaire, et comment l'expliquer à une équipe ou à un responsable non technique. Chaque stagiaire formule un argument pour et un argument contre.

Durée indicative : 43 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.6 — Synthèse : la dette technique

Synthèse du module : les stagiaires rédigent individuellement une fiche d'une page sur la dette technique (définition, cas d'usage, pièges, critères de choix), relue par un pair. Le quiz de fin de module est passé en fin de séance.

Durée indicative : 54 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.7 — Exposé : la trajectoire de migration

Le formateur présente la trajectoire de migration et situe la notion dans l'ensemble du module « Décisions d'architecture et gouvernance ». Il part d'un exemple volontairement simple, puis montre comment les contraintes de volume, de disponibilité et d'équipe modifient les choix. Les stagiaires notent les questions qu'ils se posent sur leur propre contexte ; elles sont reprises en fin de séance.

Durée indicative : 35 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

#### Séance 12.8 — Atelier : la trajectoire de migration

Par groupes de trois, les stagiaires étudient la trajectoire de migration sur un système fictif de gestion de commandes. Chaque groupe produit un schéma et une liste de risques, puis les confronte à ceux d'un autre groupe. Le formateur insiste sur la justification des choix plutôt que sur une solution unique.

Durée indicative : 46 minutes. Matériel : support projeté, tableau blanc, environnement de démonstration pour les séances pratiques.

### Exercices

| N° | Énoncé | Durée |
| --- | --- | --- |
| 12.1 | Décrire en cinq lignes un incident plausible en lien avec les enregistrements de décision (ADR), et la première action à mener. | 15 min |
| 12.2 | Comparer deux options de mise en œuvre pour les enregistrements de décision (ADR) selon trois critères : coût, risque, réversibilité. | 20 min |
| 12.3 | Rédiger la question qu'un relecteur poserait sur les enregistrements de décision (ADR) lors d'une revue d'architecture. | 25 min |
| 12.4 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les enregistrements de décision (ADR). | 10 min |
| 12.5 | Décrire en cinq lignes un incident plausible en lien avec les revues d'architecture, et la première action à mener. | 15 min |
| 12.6 | Comparer deux options de mise en œuvre pour les revues d'architecture selon trois critères : coût, risque, réversibilité. | 20 min |
| 12.7 | Rédiger la question qu'un relecteur poserait sur les revues d'architecture lors d'une revue d'architecture. | 25 min |
| 12.8 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : les revues d'architecture. | 10 min |
| 12.9 | Décrire en cinq lignes un incident plausible en lien avec la dette technique, et la première action à mener. | 15 min |
| 12.10 | Comparer deux options de mise en œuvre pour la dette technique selon trois critères : coût, risque, réversibilité. | 20 min |
| 12.11 | Rédiger la question qu'un relecteur poserait sur la dette technique lors d'une revue d'architecture. | 25 min |
| 12.12 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la dette technique. | 10 min |
| 12.13 | Décrire en cinq lignes un incident plausible en lien avec la trajectoire de migration, et la première action à mener. | 15 min |
| 12.14 | Comparer deux options de mise en œuvre pour la trajectoire de migration selon trois critères : coût, risque, réversibilité. | 20 min |
| 12.15 | Rédiger la question qu'un relecteur poserait sur la trajectoire de migration lors d'une revue d'architecture. | 25 min |
| 12.16 | Repérer dans un schéma fourni les zones à revoir sous l'angle suivant : la trajectoire de migration. | 10 min |

### Critères d'évaluation

Le quiz de fin de module comporte douze questions à choix multiples et deux questions ouvertes. Il est validé à partir de 70 % de bonnes réponses. Les questions ouvertes sont appréciées sur la clarté de l'argumentation, la prise en compte des contraintes et l'honnêteté sur les limites de la solution proposée.

### Lectures conseillées

- Support de cours, chapitre « Les enregistrements de décision (ADR) », avec ses exercices corrigés.
- Article de synthèse fictif « Les enregistrements de décision (ADR) en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les enregistrements de décision (ADR) », deux pages.
- Support de cours, chapitre « Les revues d'architecture », avec ses exercices corrigés.
- Article de synthèse fictif « Les revues d'architecture en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « Les revues d'architecture », deux pages.
- Support de cours, chapitre « La dette technique », avec ses exercices corrigés.
- Article de synthèse fictif « La dette technique en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La dette technique », deux pages.
- Support de cours, chapitre « La trajectoire de migration », avec ses exercices corrigés.
- Article de synthèse fictif « La trajectoire de migration en pratique », revue interne de l'institut.
- Fiche mémo de l'institut, « La trajectoire de migration », deux pages.

## Annexe A — Glossaire

| Terme | Définition courte |
| --- | --- |
| Latence | Notion étudiée dans le module « Fondamentaux des systèmes distribués » ; voir la fiche mémo correspondante. |
| Pannes partielles | Notion étudiée dans le module « Fondamentaux des systèmes distribués » ; voir la fiche mémo correspondante. |
| Horloges | Notion étudiée dans le module « Fondamentaux des systèmes distribués » ; voir la fiche mémo correspondante. |
| Modèles de cohérence | Notion étudiée dans le module « Fondamentaux des systèmes distribués » ; voir la fiche mémo correspondante. |
| Contextes bornés | Notion étudiée dans le module « Découpage en services » ; voir la fiche mémo correspondante. |
| Couplage | Notion étudiée dans le module « Découpage en services » ; voir la fiche mémo correspondante. |
| Cohésion | Notion étudiée dans le module « Découpage en services » ; voir la fiche mémo correspondante. |
| Frontières de données | Notion étudiée dans le module « Découpage en services » ; voir la fiche mémo correspondante. |
| API REST | Notion étudiée dans le module « Communication synchrone » ; voir la fiche mémo correspondante. |
| Appels gRPC | Notion étudiée dans le module « Communication synchrone » ; voir la fiche mémo correspondante. |
| Délais d'expiration | Notion étudiée dans le module « Communication synchrone » ; voir la fiche mémo correspondante. |
| Rétropression | Notion étudiée dans le module « Communication synchrone » ; voir la fiche mémo correspondante. |
| Files de messages | Notion étudiée dans le module « Messagerie et événements » ; voir la fiche mémo correspondante. |
| Journaux d'événements | Notion étudiée dans le module « Messagerie et événements » ; voir la fiche mémo correspondante. |
| Ordre de livraison | Notion étudiée dans le module « Messagerie et événements » ; voir la fiche mémo correspondante. |
| Consommateurs idempotents | Notion étudiée dans le module « Messagerie et événements » ; voir la fiche mémo correspondante. |
| Base de données par service | Notion étudiée dans le module « Gestion des données distribuées » ; voir la fiche mémo correspondante. |
| Réplication | Notion étudiée dans le module « Gestion des données distribuées » ; voir la fiche mémo correspondante. |
| Partitionnement | Notion étudiée dans le module « Gestion des données distribuées » ; voir la fiche mémo correspondante. |
| Migrations de schéma | Notion étudiée dans le module « Gestion des données distribuées » ; voir la fiche mémo correspondante. |
| Sagas | Notion étudiée dans le module « Transactions et cohérence » ; voir la fiche mémo correspondante. |
| Compensation | Notion étudiée dans le module « Transactions et cohérence » ; voir la fiche mémo correspondante. |
| Boîte d'envoi transactionnelle | Notion étudiée dans le module « Transactions et cohérence » ; voir la fiche mémo correspondante. |
| Cohérence à terme | Notion étudiée dans le module « Transactions et cohérence » ; voir la fiche mémo correspondante. |
| Disjoncteurs | Notion étudiée dans le module « Résilience » ; voir la fiche mémo correspondante. |
| Nouvelles tentatives | Notion étudiée dans le module « Résilience » ; voir la fiche mémo correspondante. |
| Isolation des ressources | Notion étudiée dans le module « Résilience » ; voir la fiche mémo correspondante. |
| Dégradation maîtrisée | Notion étudiée dans le module « Résilience » ; voir la fiche mémo correspondante. |
| Traces distribuées | Notion étudiée dans le module « Observabilité » ; voir la fiche mémo correspondante. |
| Métriques | Notion étudiée dans le module « Observabilité » ; voir la fiche mémo correspondante. |
| Journaux structurés | Notion étudiée dans le module « Observabilité » ; voir la fiche mémo correspondante. |
| Objectifs de niveau de service | Notion étudiée dans le module « Observabilité » ; voir la fiche mémo correspondante. |
| Authentification entre services | Notion étudiée dans le module « Sécurité des architectures distribuées » ; voir la fiche mémo correspondante. |
| Gestion des secrets | Notion étudiée dans le module « Sécurité des architectures distribuées » ; voir la fiche mémo correspondante. |
| Chiffrement | Notion étudiée dans le module « Sécurité des architectures distribuées » ; voir la fiche mémo correspondante. |
| Moindre privilège | Notion étudiée dans le module « Sécurité des architectures distribuées » ; voir la fiche mémo correspondante. |
| Intégration continue | Notion étudiée dans le module « Déploiement et exploitation » ; voir la fiche mémo correspondante. |
| Déploiement progressif | Notion étudiée dans le module « Déploiement et exploitation » ; voir la fiche mémo correspondante. |
| Infrastructure as code | Notion étudiée dans le module « Déploiement et exploitation » ; voir la fiche mémo correspondante. |
| Gestion des versions d'API | Notion étudiée dans le module « Déploiement et exploitation » ; voir la fiche mémo correspondante. |
| Tests de contrat | Notion étudiée dans le module « Tests des systèmes distribués » ; voir la fiche mémo correspondante. |
| Tests de bout en bout | Notion étudiée dans le module « Tests des systèmes distribués » ; voir la fiche mémo correspondante. |
| Injection de pannes | Notion étudiée dans le module « Tests des systèmes distribués » ; voir la fiche mémo correspondante. |
| Environnements éphémères | Notion étudiée dans le module « Tests des systèmes distribués » ; voir la fiche mémo correspondante. |
| Enregistrements de décision (ADR) | Notion étudiée dans le module « Décisions d'architecture et gouvernance » ; voir la fiche mémo correspondante. |
| Revues d'architecture | Notion étudiée dans le module « Décisions d'architecture et gouvernance » ; voir la fiche mémo correspondante. |
| Dette technique | Notion étudiée dans le module « Décisions d'architecture et gouvernance » ; voir la fiche mémo correspondante. |
| Trajectoire de migration | Notion étudiée dans le module « Décisions d'architecture et gouvernance » ; voir la fiche mémo correspondante. |

## Annexe B — Calendrier de la session

| Jour | Date | Modules |
| --- | --- | --- |
| 1 | 9 janvier 2023 | 1 et 2 |
| 2 | 16 janvier 2023 | 2 et 3 |
| 3 | 23 janvier 2023 | 4 |
| 4 | 30 janvier 2023 | 5 |
| 5 | 6 février 2023 | 6 (étude de cas intermédiaire) |
| 6 | 13 février 2023 | 7 et 8 |
| 7 | 27 février 2023 | 9 et 10 |
| 8 | 6 mars 2023 | 11 |
| 9 | 13 mars 2023 | 12 |
| 10 | 17 mars 2023 | Soutenance du projet final |

## Annexe C — Règlement intérieur (extrait)

- Les horaires sont de 9 h à 12 h 30 et de 13 h 30 à 17 h. Toute absence est signalée à l'avance au responsable pédagogique.
- Les supports sont réservés à un usage personnel et ne doivent pas être diffusés en dehors de l'entreprise du stagiaire.
- Les environnements de démonstration sont réinitialisés chaque soir ; aucune donnée personnelle ne doit y être saisie.
- Les évaluations sont individuelles. Les travaux de groupe sont signalés comme tels.
- Une réclamation sur une évaluation peut être adressée par écrit dans les quinze jours suivant la publication des résultats.

## Annexe D — Questionnaire de satisfaction (modèle vierge)

| Question | Très satisfait | Satisfait | Peu satisfait | Pas satisfait |
| --- | --- | --- | --- | --- |
| Qualité du module « Fondamentaux des systèmes distribués » | | | | |
| Utilité du module « Fondamentaux des systèmes distribués » pour votre poste | | | | |
| Qualité du module « Découpage en services » | | | | |
| Utilité du module « Découpage en services » pour votre poste | | | | |
| Qualité du module « Communication synchrone » | | | | |
| Utilité du module « Communication synchrone » pour votre poste | | | | |
| Qualité du module « Messagerie et événements » | | | | |
| Utilité du module « Messagerie et événements » pour votre poste | | | | |
| Qualité du module « Gestion des données distribuées » | | | | |
| Utilité du module « Gestion des données distribuées » pour votre poste | | | | |
| Qualité du module « Transactions et cohérence » | | | | |
| Utilité du module « Transactions et cohérence » pour votre poste | | | | |
| Qualité du module « Résilience » | | | | |
| Utilité du module « Résilience » pour votre poste | | | | |
| Qualité du module « Observabilité » | | | | |
| Utilité du module « Observabilité » pour votre poste | | | | |
| Qualité du module « Sécurité des architectures distribuées » | | | | |
| Utilité du module « Sécurité des architectures distribuées » pour votre poste | | | | |
| Qualité du module « Déploiement et exploitation » | | | | |
| Utilité du module « Déploiement et exploitation » pour votre poste | | | | |
| Qualité du module « Tests des systèmes distribués » | | | | |
| Utilité du module « Tests des systèmes distribués » pour votre poste | | | | |
| Qualité du module « Décisions d'architecture et gouvernance » | | | | |
| Utilité du module « Décisions d'architecture et gouvernance » pour votre poste | | | | |