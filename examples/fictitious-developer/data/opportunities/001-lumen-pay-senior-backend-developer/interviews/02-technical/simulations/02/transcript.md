# Transcript : simulation 02, entretien 02-technical

- Date : 2026-10-02
- Paramètres : profondeur standard (8 à 10 questions prévues), en français. Rôle joué par le coach : Marc (développeur senior), personnage fictif. Le cas est inventé pour la simulation.
- Fin : arrêt à la demande de la candidate (« Arrête la simulation. ») juste après la première question, sans réponse de sa part.
- Fidélité : transcription verbatim de la conversation.

---

**Marc :** Bonjour Nadia, je suis Marc. On a 1 h 15 : on commence par un cas d'architecture, puis on parlera de votre expérience.

Notre moteur de décision publie chaque décision de crédit sur Kafka. Plusieurs services la consomment : celui qui déclenche le paiement au commerçant, celui qui alimente l'audit, celui qui met à jour le plafond du client. Il y a quelques semaines, un incident a fait qu'une même décision a été consommée deux fois par le service de paiement : le commerçant a été payé en double.

Comment conçoit-on le système pour que ça ne puisse pas se reproduire, et que faites-vous si malgré tout un doublon passe ?

**Nadia :** Arrête la simulation.

---

*Arrêt de la simulation à la demande de la candidate. La première question est restée sans réponse.*
