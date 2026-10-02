# Transcript : simulation 01, entretien 02-technical

- Date : 2026-10-02
- Paramètres : profondeur courte (4 à 6 questions prévues), en français. Rôles joués par le coach : Marc (développeur senior) et Léa (second membre de la squad), personnages fictifs. Le cas d'architecture est inventé pour la simulation, il n'est pas le cas réel de l'entretien.
- Fin : arrêt à la demande de la candidate (« stop ») après la 3e réponse, pendant la 4e question. La simulation ne couvre donc que la partie architecture.
- Fidélité : réponses dictées à l'oral et transcrites ; les hésitations (« euh ») et les phrases inachevées sont en partie conservées, les erreurs de dictée corrigées.

---

**Marc :** Bonjour Nadia, merci d'être venue. Je suis Marc, et voici Léa. On a 1 h 15 devant nous : on commence par un cas d'architecture, puis on parlera de votre expérience. Pas de code en direct, on veut surtout comprendre votre manière de raisonner.

Voici le cas. Notre moteur de décision reçoit une demande de crédit instantané lorsqu'un client est en caisse chez un commerçant. Il doit répondre en moins de 300 ms au 99e centile. Pour décider, il interroge plusieurs sources : l'historique du client chez nous, un score calculé par un modèle, et un fournisseur externe de données qui répond parfois en 400 ms ou plus. Chaque décision doit pouvoir être rejouée et expliquée à un régulateur des mois plus tard.

Comment aborderiez-vous la conception de ce service ? Prenez le temps de réfléchir à voix haute.

**Nadia :** Alors, déjà, on voit qu'il y a une incohérence entre, euh, la cible que l'on veut atteindre, 300 millisecondes au 99e centile, et le fait qu'on a un fournisseur externe qui répond parfois en 400 millisecondes ou plus. Ce qu'il faudrait déterminer, c'est si on a plus de données là-dessus, parce que « parfois », c'est un peu imprécis. Si c'est 400 millisecondes au 99,9e centile, bon. Mais sinon, ce qui serait utile, c'est de voir si les données qu'on récupère de ce fournisseur varient souvent ou si elles sont peu variables : on pourrait envisager de les mettre en cache, euh, et de les rafraîchir à intervalles réguliers en fonction de leur variabilité. Imaginons que ces données changent toutes les 10 minutes, on pourrait les mettre en cache et les rafraîchir toutes les 5 minutes, ce qui fait qu'elles seraient disponibles directement quand on en a besoin, sans avoir à faire cette requête en série ; ça se ferait en parallèle, de manière asynchrone. Euh, et alors, chaque décision doit pouvoir être rejouée et expliquée à un régulateur. D'accord. Donc, effectivement, il faut pouvoir tracer toutes ces décisions dans une base de données, une table d'audit, quelque chose comme ça, en indiquant bien les sources utilisées, puisqu'il y a une histoire de traçabilité qui est importante : tracer les sources utilisées et comment elles ont été requêtées, est-ce que ça venait d'un cache ou d'une requête directe vers, euh, l'historique du client, le score calculé par un modèle, ou le fournisseur externe, selon la décision prise.

**Marc :** D'accord, merci. Pour répondre à votre question : disons que le fournisseur dépasse les 300 ms sur 2 à 3 % des appels, et ça peut monter jusqu'à 800 ms. C'est donc bien plus que le 99e centile.

Autre précision : les données du fournisseur sont propres à chaque client et à chaque demande. On ne les connaît pas avant que le client se présente en caisse, donc on ne peut pas les rafraîchir à l'avance.

Dans ce cas, que fait votre service quand le fournisseur répond en 800 ms, ou ne répond pas du tout, alors qu'une décision est attendue en 300 ms ?

**Nadia :** Alors, je pense que ce ne serait pas forcément une bonne solution de stopper et de faire un retour, euh, au client du service en disant qu'on n'a pas de réponse. À mon avis, pour que l'expérience utilisateur reste correcte, il faudrait pouvoir retourner une réponse au bout de 300 millisecondes maximum, ou peut-être un petit peu avant, puisque c'est notre cible, pour dire que le traitement prend plus de temps que prévu, puisque c'est quelque chose qui peut arriver de manière non prévisible. Et lui redonner un identifiant de requête qu'il puisse interroger dans un deuxième temps. Ça permet de faire patienter l'utilisateur, même si effectivement ce n'est pas bon pour notre service. Pendant ce temps-là, on a un traitement en arrière-plan qui interroge le fournisseur externe et qui référence la requête, ce qui fait que quand la réponse arrive, on est à même de répondre à la deuxième requête vers le service avec les données attendues. Au niveau traçabilité, ça permet aussi d'indiquer qu'on a dépassé le délai, d'analyser les requêtes et de voir dans quelles conditions, à quelle heure, quel fournisseur de données répond moins bien de temps en temps, et potentiellement d'identifier des patterns pour investiguer et améliorer le service. Euh,

**Marc :** Je vois l'idée : on répond vite avec un identifiant, et le client revient chercher le résultat.

Mais imaginez la situation concrète. Le client est devant la caisse, le commerçant attend, et un crédit va être accordé ou refusé. Vous dites qu'un thread en arrière-plan continue d'interroger le fournisseur. Si ce dernier met 800 ms, ou jamais, on fait quoi sur la décision elle-même ? Est-ce qu'on peut décider sans ses données, et à quelles conditions ?

**Nadia :** Alors, je pense qu'il faut qu'on ait une limite dure. 300 millisecondes, c'est la première réponse vers le client, c'est maximum 300 millisecondes. Et après, euh, à voir avec l'équipe produit ce qui est acceptable et à partir de quand il faut faire un retour définitif pour dire, par exemple, que le crédit est refusé. Puisque si on n'a pas de réponse, on ne peut dire ni oui ni non. Encore une fois, à valider avec le produit. Mais on ne va pas attendre indéfiniment : il faut de toute façon se donner un time-out, dont la valeur est à déterminer. Et étudier, euh, puisque vous avez l'air de dire que cette donnée est potentiellement optionnelle : qu'est-ce qu'on fait si on ne l'a pas ? Est-ce qu'on peut vraiment, avec notre algorithme, faire quelque chose sans cette donnée ? Auquel cas, ça change pas mal la donne. Parce que même dans le cas nominal, on pourrait répondre sans l'attendre, et avoir une confirmation en deux étapes.

**Marc :** Pour répondre à votre question : oui, le modèle peut tourner sans les données du fournisseur, avec une décision plus prudente. Mais on s'arrête là sur le cas, on a bien vu votre façon de raisonner.

**Léa :** Bonjour Nadia. Je voudrais maintenant parler de votre expérience en production. Racontez-moi un incident sérieux que vous avez traité chez Payflow, de la détection jusqu'au post-mortem. Qu'est-ce que vous avez fait, vous, concrètement ?

---

*Arrêt de la simulation à la demande de la candidate (« stop »). La question de Léa est restée sans réponse.*
