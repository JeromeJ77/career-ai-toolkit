# Fiche de préparation à l'entretien

## Première page : aide-mémoire

**Entreprise / poste :** Lumen Pay · Développeuse backend senior, squad Scoring & Décision (réf. LP-2026-ENG-014)  
**Étape / interlocuteur :** 02 · Entretien technique · deux membres de la squad (noms et fonctions à confirmer)  
**Date / durée / langue :** date à confirmer · 1 h 15 · langue et modalité (Part-Dieu ou visio) à confirmer

### Cadrage

Discussion d'architecture à partir d'un cas concret, puis questions sur l'expérience. Pas de code en direct. La squad construit un moteur de décision de crédit en temps réel (Java/Spring Boot, Kafka, PostgreSQL, décision sous 300 ms au p99, décisions traçables et auditables). Le cas peut porter sur ce moteur, mais ce n'est pas confirmé. Votre fil conducteur : la fiabilité d'un moteur transactionnel critique, plus que le scoring lui-même.

### Messages stratégiques

- **1. Fiabilité de production éprouvée :** astreinte N2, incidents critiques de 11 à 3 par trimestre grâce à l'observabilité, post-mortems des trois incidents majeurs de 2025 devenus modèles dans l'entreprise.
- **2. Architecture distribuée menée dans la durée :** migration monolithe vers six services (déploiement 40 % plus rapide), plan négocié et tenu 18 mois avec le CTO, idempotence des webhooks.
- **3. Qualité comme pratique d'équipe :** TDD, tests de contrat Pact adoptés par trois squads, revue de code.
- **4. Mentorat et influence sans titre :** deux juniors encadrés, restés et progressés ; revue d'architecture hebdomadaire.

### Pitch : repères

- Situation actuelle : développeuse backend senior chez Payflow Solutions (squad Règlement), paiement à forte disponibilité.
- Fil rouge : la fiabilité en production, de l'astreinte à l'architecture.
- Différenciation : je connais la production de l'intérieur et j'ai fait évoluer une architecture distribuée sans casser le service.
- Recherche actuelle : à formuler avec vos mots.
- Lien avec le poste : moteur transactionnel critique, Kafka, idempotence, astreinte, mentorat.

### Exemples prioritaires

*Seuls les faits déjà validés figurent ci-dessous. Les parties « à compléter » sont à travailler par vous, en « j'ai ».*

- **Migration monolithe vers six services :** contexte et résultat connus (six services, déploiement 40 % plus rapide, plan tenu 18 mois avec le CTO). **À compléter :** pourquoi ce découpage, ce que vous avez écarté, une décision que vous avez prise vous-même.
- **Idempotence et webhooks à traitement unique (Kiwano) :** votre réponse la plus solide en simulation. **À compléter :** le cas précis, le mécanisme, ce que vous referiez.
- **Observabilité et incidents (11 à 3 par trimestre) :** **À compléter :** ce qui a concrètement fait baisser les incidents, un incident vécu raconté du début à la fin.
- **Tests de contrat et mentorat :** Pact adopté par trois squads, deux juniors encadrés. **À compléter :** comment vous avez convaincu les squads.

### Questions prioritaires

*Validées par la candidate le 2026-10-02. Choisissez-en trois au maximum selon le temps disponible.*

1. **Dette technique :** « Comment la squad arbitre entre roadmap et dette ? Quel est le dernier exemple de dette traitée ? »  
   Réponse :  
2. **Décisions d'architecture entre équipes :** « Racontez-moi une décision d'architecture récente qui touchait plusieurs squads : qui a tranché, et comment ? »  
   Réponse :  
3. **Traçabilité des décisions :** « Comment l'auditabilité est-elle assurée dans le moteur aujourd'hui, et quelle est la partie la plus difficile à maintenir ? »  
   Réponse :  

### Points de vigilance

- Prendre position avant de renvoyer au produit : donnez votre recommandation, puis la dépendance.
- Dire « j'ai décidé » plutôt que « on ».
- Annoncer un plan et conclure chaque réponse en une phrase.
- Ralentir le débit si le stress monte, surtout en anglais.

### Notes pendant l'entretien

Priorités / problèmes évoqués :


Attentes / critères de réussite :


Informations à approfondir :


Prochaine étape / engagement :


<!-- PAGE BREAK -->

## Adéquation avec le poste

| Attendu dans l'offre | Éléments du profil |
|---|---|
| 5 ans+ de backend, Java et Spring | 7 ans de backend ; Java 21, Spring Boot 3 chez Payflow |
| Systèmes distribués, messagerie asynchrone, idempotence | Kafka (Kiwano, Payflow), webhooks à traitement unique, migration en six services |
| TDD, tests d'intégration, revue de code | TDD, Pact, revue de code (tests d'intégration non cités explicitement) |
| Production : monitoring, incidents, post-mortems | Astreinte N2, incidents de 11 à 3 par trimestre, post-mortems 2025 |
| Français courant, anglais professionnel | Anglais C1 |
| Apprécié : paiement, mentorat, Kubernetes, cloud | Payflow, Kiwano ; deux juniors ; Kubernetes ; Cloud Platform Associate |
| Astreinte (1 semaine sur 7, rémunérée) | Astreinte N2 (article « trois ans d'astreinte », 2025) |

## Messages et preuves

- **Message 1 :** preuves à retrouver : rapports de post-mortem 2025, chiffres d'incidents, article sur l'observabilité.
- **Message 2 :** preuves : plan de migration, arbitrages avec le CTO, mesure du déploiement (-40 %). Votre impact personnel reste à chiffrer.
- **Message 3 :** preuves : Pact entre squads, conférence au meetup « Java au Confluent ».
- **Message 4 :** preuves : les deux juniors, la revue d'architecture hebdomadaire.

## Banque d'exemples

À construire au format situation / action / résultat, en commençant par la migration, les post-mortems, l'observabilité et le mentorat. Rien n'est ajouté à votre place.

## Motivations et écarts

**Motivations validées :** un produit utile aux gens, une équipe où l'on peut dire « je ne sais pas », du temps pour l'excellence technique, un environnement qui investit dans la plateforme.

**Écarts à assumer honnêtement :**
- Scoring, décision de crédit, données : aucune expérience (point « apprécié »).
- Faible latence mesurée (300 ms au p99) : aucun travail chiffré dans le dossier ; à préciser si vous en avez.
- Traçabilité réglementaire : exposition à l'audit chez Payflow non précisée dans le dossier ; à ne pas affirmer sans l'avoir vérifié.
- Tests d'intégration : à mentionner si vous les pratiquez.
- Système design formel au tableau : jamais passé d'entretien de 45 minutes, mais pratique quotidienne.

**Point à clarifier pour vous :** votre objectif tech lead ou staff, face à un poste senior de squad sans titre de lead. À formuler avant l'entretien.

## Questions complémentaires

*Validées par la candidate le 2026-10-02, à poser si le temps le permet.*

- **Passage à l'échelle :** « Vous êtes à 500 000 opérations par jour et visez 2 millions fin 2027 : où est le goulot aujourd'hui, par rapport aux 300 ms ? »  
  Réponse :  
- **Astreinte :** « Sur votre dernière semaine d'astreinte, qu'est-ce qui a sonné et qu'avez-vous changé ensuite ? »  
  Réponse :  

## Enseignements des simulations

- **Simulation 01 (écrite, arrêt anticipé) :** bon réflexe sur la contradiction 300 ms / fournisseur lent, traçabilité intégrée. À améliorer : recommandation avant renvoi au produit, appui sur votre expérience, réponses plus structurées. Question de l'incident en production non jouée.
- **Simulation 02 :** arrêtée après la première question (double consommation Kafka et idempotence), sans réponse.
- **Simulation 03 (orale avec un ami, souvenir) :** idempotence claire. À améliorer : justifier le découpage et les alternatives écartées, « j'ai décidé » au lieu de « on », questions préparées pour l'interviewer.
