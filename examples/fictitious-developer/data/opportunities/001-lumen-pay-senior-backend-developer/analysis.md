# Analyse de l'opportunité

Dernière mise à jour : 2026-10-02 · Sources : `opportunity.md` (offre LP-2026-ENG-014), `data/profile/professional-profile.md` v1.0. Rien n'est validé par la candidate à ce stade.

## Passes d'analyse

- 2026-10-02 : dossier professionnel version 1.0 (prêt)

## Synthèse

Poste de développeuse backend senior dans la squad Scoring & Décision de Lumen Pay (fintech régulée ACPR, 120 personnes) : moteur de décision de crédit en temps réel, Java/Spring Boot, Kafka, PostgreSQL, faible latence, traçabilité réglementaire. Le cœur technique et le contexte paiement recoupent fortement le profil. Les écarts portent sur le domaine (scoring/crédit), la latence mesurée et l'auditabilité réglementaire, et sur le niveau visé (poste senior sans titre de lead).

## Adéquation naturelle avec le profil

Faits tirés de l'offre et du profil.

| Attendu dans l'offre | Éléments du profil |
|---|---|
| 5 ans+ de backend, Java et Spring | 7 ans de backend professionnel ; Java 21, Spring Boot 3 chez Payflow |
| Systèmes distribués, messagerie asynchrone, idempotence | Kafka (Kiwano, Payflow) ; webhooks à traitement unique garanti ; migration monolithe vers six services |
| TDD, tests d'intégration, revue de code | TDD, tests de contrat Pact adoptés par trois squads, revue de code |
| Production : monitoring, incidents, post-mortems | Astreinte N2, incidents critiques de 11 à 3 par trimestre, post-mortems des trois incidents majeurs de 2025 |
| Français courant, anglais professionnel | Anglais C1, travail quotidien avec une équipe partiellement anglophone |
| Apprécié : paiement | Payflow (règlement marchand), intégration d'un fournisseur de paiement chez Kiwano |
| Apprécié : Kubernetes, cloud public | Kubernetes dans les outils ; certification Cloud Platform Associate |
| Apprécié : mentorat, référent technique | Référente technique de deux juniors, revue d'architecture hebdomadaire |
| Astreinte (1 semaine sur 7, rémunérée) | Astreinte N2 (article « trois ans d'astreinte », 2025) ; article sur l'observabilité |
| Télétravail 3 jours / 2 sur site à Part-Dieu | Cohérent avec ses contraintes (Lyon, 3 jours minimum) |
| 62–72 k€ brut + BSPCE | Recoupe sa fourchette visée (confidentielle, voir profil section 10) |

Points qui jouent en sa faveur : l'ordre de grandeur de volume (2 M de transactions par jour chez Payflow contre 500 000 chez Lumen Pay aujourd'hui, 2 M visés fin 2027) et l'entretien technique sans exercice de code en direct.

## Écarts, risques et contradictions

- **Scoring, décision de crédit, données** (apprécié) : rien dans le profil. Écart réel, mais « apprécié » et non indispensable.
- **Faible latence** (objectif 300 ms au p99) : le profil ne mentionne aucun travail de latence ou de performance mesuré. Écart probable à sonder.
- **Traçabilité et auditabilité réglementaires** : le profil ne dit pas si Payflow est soumis à une régulation comparable. À vérifier avant de la mettre en avant.
- **Tests d'intégration** : non cités explicitement dans le profil (TDD et tests de contrat le sont).
- **Entretien d'architecture sur cas concret** (étape 2) : c'est son point de vigilance déclaré (jamais de system design formel de 45 minutes au tableau). Risque principal de la phase technique.
- **Anglais oral** : C1, mais elle parle trop vite sous stress, surtout en anglais.
- **Minimisation de ses réussites** (« on a fait ») : à contrer face à un panel de pairs et au Head of Engineering.
- **Niveau visé** : le profil indique tech lead ou staff engineer. L'offre est un poste senior de squad, avec mentorat et contribution aux choix d'architecture transverses, sans titre de lead. Tension à clarifier avec elle, pas à trancher à sa place.
- **Motivation « investir dans la plateforme »** : l'offre cite une équipe plateforme distincte et une squad produit orientée roadmap. La position de la squad Scoring & Décision sur ce point est inconnue.

Aucune contradiction factuelle entre l'offre et le profil.

## Hypothèses à vérifier

- Le contexte de Payflow impose-t-il des exigences d'audit ou de traçabilité comparables (à confirmer avec elle) ?
- A-t-elle déjà travaillé sur des contraintes de latence, même sans objectif chiffré ?
- Les services de l'offre (Java/Spring Boot, Kafka, PostgreSQL) correspondent-ils à sa pile actuelle ? Le profil confirme la pile ; l'usage de Kafka chez Payflow est indiqué sur LinkedIn mais non détaillé.
- Que recouvre « contribuer aux choix d'architecture transverses » dans la pratique ? Question pour les interlocuteurs.
- Où en est-elle dans la candidature (contact déjà pris, dates d'entretien) ?

## Positionnement proposé

Une développeuse de systèmes de paiement qui connaît la production de l'intérieur (incidents, observabilité, post-mortems), qui sait faire évoluer une architecture distribuée sans casser le service, et qui élève le niveau de l'équipe autour d'elle (tests, revue, mentorat). Le point de jonction avec Lumen Pay est la fiabilité d'un moteur transactionnel critique, plus que le scoring en lui-même.

## Messages stratégiques

### Proposés

1. **Fiabilité de production éprouvée** : astreinte N2, incidents critiques de 11 à 3 par trimestre, post-mortems devenus modèles dans l'entreprise. Répond à « expérience de la production » et à l'astreinte.
2. **Architecture distribuée menée dans la durée** : migration monolithe vers six services, plan négocié et tenu 18 mois avec le CTO, idempotence des webhooks. Répond à « systèmes distribués » et aux choix d'architecture transverses.
3. **Qualité comme pratique d'équipe** : TDD, tests de contrat adoptés par trois squads, revue de code. Répond à « culture du test ».
4. **Mentorat et influence sans titre** : deux juniors encadrés, restés et progressés. Répond à l'accompagnement des moins expérimentés.

### Validés par la candidate

Messages 1 à 4 ci-dessus validés par la candidate le 2026-10-02 (le message 5 a été retiré à sa demande).

## Exemples et preuves à approfondir

- Migration monolithe vers services : son rôle personnel, les arbitrages avec le CTO, les chiffres, formulés en « j'ai ».
- Post-mortems 2025 : retrouver les rapports comme preuves.
- Observabilité : ce qui a concrètement fait baisser les incidents.
- Tout cas où une contrainte de latence ou de performance l'a occupée.
- Un cas d'architecture à raconter à l'oral, au tableau, en préparation de l'étape 2.
- Webhooks à traitement unique : le raisonnement sur l'idempotence.

## Questions ouvertes

Pour la candidate :

- Quel est l'état de la candidature, et que représente ce poste par rapport à votre objectif tech lead ou staff engineer ?
- Quelle exposition réglementaire ou d'audit avez-vous eue chez Payflow ?
- Quelle expérience avez-vous de la latence et de la performance ?
- Les messages 1 à 4 vous ressemblent-ils ? Lesquels ajuster, retirer ou ajouter ?

Pour les interlocuteurs de Lumen Pay (idées, à travailler ensuite) :

- Part de temps réservée à la dette technique et à l'outillage dans la squad.
- Mécanisme de décision pour une architecture qui touche plusieurs équipes.
- Répartition du temps entre la roadmap produit et la plateforme pour la squad Scoring & Décision.
