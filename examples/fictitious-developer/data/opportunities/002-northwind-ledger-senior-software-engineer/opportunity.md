# Opportunité

## Identité

- Identifiant : 002-northwind-ledger-senior-software-engineer (réf. offre : NWL-ENG-2026-087)
- Organisation : Northwind Ledger (scale-up Series B, 210 personnes, 14 nationalités ; l'offre se déclare « fictional »)
- Poste : Senior Software Engineer, équipe Core Ledger
- Localisation : télétravail dans l'UE, quatre semaines par an sur site à Amsterdam (voyages pris en charge)
- Modalité de travail : full remote UE ; l'anglais est la langue de travail
- Type de contrat : temps plein (type de contrat juridique non précisé)
- Date d'ajout : 2026-10-02

## Sources

- `sources/002-northwind-ledger-senior-software-engineer.pdf` : offre d'emploi (2 pages, publiée le 25 septembre 2026), copie inchangée de l'original fourni par la candidate.
- Contact indiqué dans l'offre : careers@northwind-ledger.example
- Informations orales de la candidate (2026-10-02) : voir section dédiée.
- `sources/002-northwind-ledger-notes-appel-recruteuse.txt` : notes à chaud de la candidate après l'appel recruteuse du 2026-09-30 (transcrites dans `interviews/01-recruiter/actual/notes.md`).

## Description canonique de l'opportunité

### Contexte et finalité du poste

Northwind Ledger construit le socle comptable et de trésorerie pour les e-commerçants européens de taille moyenne. Son grand livre traite 40 millions d'écritures par mois et doit être « correct au centime, à chaque fois ». Le poste rejoint l'équipe Core Ledger (8 ingénieurs), qui possède le grand livre en partie double au cœur du produit. Rôle senior « hands-on » avec une réelle influence architecturale : concevoir, construire et opérer des services dont toutes les autres équipes dépendent.

### Responsabilités

- Concevoir et implémenter des services de ledger en Kotlin et Java sur la JVM (Spring Boot), avec PostgreSQL et un journal d'événements sur Kafka.
- Être responsable de la correction : écritures idempotentes, sémantique exactly-once là où c'est nécessaire, jobs de réconciliation, et les tests qui le prouvent.
- Piloter les décisions techniques inter-équipes via RFC et design reviews.
- Mentorer les ingénieurs, relever le niveau des code reviews et de l'excellence opérationnelle.
- Partager l'astreinte du ledger (une semaine sur huit, rémunérée) et animer des post-mortems sans blâme.
- Aider à passer à 200 millions d'écritures par mois « sans tout réécrire ».

### Compétences et expérience recherchées

- 6+ ans de développement backend, expérience JVM approfondie. Kotlin est un plus, pas une exigence.
- Solides fondamentaux des systèmes distribués : modèles de cohérence, partitionnement, gestion des pannes.
- Expérience avérée d'exploitation de systèmes en production et d'amélioration de leur fiabilité.
- Expérience d'influence sur l'architecture au-delà de sa propre équipe.
- Anglais écrit et oral clair (rédaction et présentation de RFC).
- Résider dans l'UE, avec le droit d'y travailler.
- Atouts : connaissance fintech / paiements / comptabilité ; contract testing ou gouvernance de schémas sur de nombreuses équipes ; prise de parole ou écrits publics sur l'ingénierie.

### Organisation et environnement

- Équipe Core Ledger : 8 ingénieurs.
- Ingénierie entièrement distribuée dans l'UE, anglais comme langue de travail.
- Stack citée : Kotlin, Java, Spring Boot, PostgreSQL, Kafka.

### Conditions et contraintes explicites

- Salaire de base : 75 000 – 90 000 €, selon localisation et expérience, plus equity.
- Budget formation 3 000 € par an, indemnité de télétravail, 30 jours de congés payés.
- Astreinte : une semaine sur huit, compensée.
- Quatre semaines sur site par an à Amsterdam.
- Droit de travailler dans l'UE exigé.

### Processus de recrutement connu

Objectif : processus complet en quatre semaines. Cinq étapes :

1. Appel recruteur (30 min) : motivation, logistique, attentes de rémunération.
2. Entretien avec le hiring manager (45 min) : expérience et façon de travailler.
3. Entretien de system design (60 min) : concevoir une partie d'un système de type ledger sur un tableau blanc partagé avec deux ingénieurs.
4. Deep dive technique (60 min) : conversation détaillée sur un système construit par le candidat, avec focus sur les arbitrages et les incidents.
5. Entretien valeurs (45 min) : avec deux personnes d'autres équipes.

## Informations complémentaires fournies par la candidate

- La candidate décrit une « nouvelle opportunité » de senior software engineer chez Northwind Ledger, scale-up européenne en télétravail (2026-10-02).
- Elle a d'abord dit « Core Ledger », puis « Northwind Ledger » ; l'offre confirme : organisation = Northwind Ledger, équipe = Core Ledger.

- Éléments rapportés par la recruteuse Sanne lors de l'appel du 2026-09-30 (notes de la candidate, non vérifiés par écrit) :
  - Core Ledger : 8 personnes, 5 nationalités, lead Marek (Pologne).
  - Profil recherché : quelqu'un qui « a vu des choses casser en prod ». Kotlin non requis, JVM solide attendu.
  - System design : étape qui élimine le plus de candidats ; 60 min, tableau Miro, 2 ingénieurs ; sujet typique : ledger supportant des écritures concurrentes et un rapprochement quotidien.
  - Télétravail total possible depuis Lyon, contrat via un EOR (employer of record) en France ; on-site Amsterdam 4 semaines/an, dates fixées à l'avance.
  - Fourchette pour le profil de la candidate : « plutôt 75-82k ». La candidate avait annoncé 70-75k.
  - Prochaine étape : entretien avec Marek, semaine du 6 octobre ; document de préparation au system design à recevoir.

## Incertitudes et informations à confirmer

- Origine de la candidature (directe, cooptation, chasseur de têtes) : non précisée. L'étape actuelle est connue : appel recruteuse fait, entretien avec Marek à planifier.
- Motivation de la candidate et ce qui l'attire dans ce poste (le ressenti après l'appel est positif ; voir `interviews/01-recruiter/actual/notes.md`).
- Rémunération : l'offre indique 75-90 k€, la recruteuse a évoqué 75-82 k€ pour ce profil, la candidate a annoncé 70-75 k€. À arbitrer par la candidate.
- Contrat via un EOR en France (dit oralement) : entité employeuse, protection sociale et équity associées non précisées.
- Raison de l'ouverture du poste (départ ou croissance) : inconnue.
- Détail de l'equity (type, volume, vesting) non précisé.
- Les titres de l'offre et son texte se déclarent fictifs (« Fictional job posting ») : aucune conséquence sur la préparation, simplement à garder en tête.
