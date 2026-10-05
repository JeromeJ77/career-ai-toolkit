# Guide utilisateur de MyCareer Workspace

[English version](USER-GUIDE.md)

MyCareer Workspace est votre **espace carrière** personnel et durable : un dossier professionnel vivant, dont vous gardez la propriété et que vous validez, et qui s'enrichit à chaque opportunité, préparation, simulation et débriefing. Ouvrez la racine de ce répertoire dans un outil d'IA capable de lire les fichiers, ajoutez des sources autorisées et initialisez le dossier professionnel ; la langue du profil se configure dans `data/config/workspace.yaml`, créé par le coach lors de la première session. Pour une nouvelle candidature, fournissez au coach les documents ou le contexte disponibles sur l'offre ; le coach crée la structure de l'opportunité. Gardez votre espace carrière privé.

Le nom du répertoire local est libre : un workspace extrait sous `career-ai-workspace/` continue de fonctionner et n'a pas besoin d'être renommé. À la session suivante, la section `user` est ajoutée à son `workspace.yaml` et la question du prénom est posée, sans message d'accueil.

## Première session

La première session est détectée par l'absence de `data/current-status.md` (sauf si un dossier professionnel ou un répertoire d'opportunité existe déjà : il s'agit alors d'une perte possible, traitée sans message d'accueil). Avant toute autre chose, le coach vous souhaite la bienvenue dans votre espace carrière et vous demande si vous souhaitez être appelé par votre prénom, puis attend votre réponse. Il crée ensuite les fichiers obligatoires, accuse réception de votre réponse, indique en une phrase ce qu'il a préparé et propose de construire votre dossier professionnel à partir de vos documents. Si votre premier message contient déjà une demande, le coach la traite juste après votre réponse.

Le choix est enregistré dans la section `user` de `data/config/workspace.yaml` (`address_by_first_name` : `unset`, `ask_again`, `yes` ou `no` ; `first_name`). Vous pouvez le modifier à tout moment, en le demandant au coach ou en éditant le fichier. Avec `yes`, le coach vous salue par votre prénom au début d'une conversation et prend congé quand vous terminez la session ; il n'emploie pas votre prénom ailleurs. Chaque session commence par une courte ligne en italique, *Lancement de la session…*, suivie directement du message d'accueil ou de la salutation.

Le toolkit est un coach, pas un générateur de réponses : il aide à réfléchir, à s'entraîner, à progresser et à s'approprier son histoire professionnelle, plutôt qu'à mémoriser des réponses toutes faites. La seule exception est le joker, disponible pendant une simulation d'entretien (voir « Sessions de travail ») : une réponse proposée n'est donnée que sur votre demande explicite et est clairement étiquetée comme réponse proposée.

## Opportunités gérées par le coach

Les nouveaux répertoires d'opportunité utilisent un identifiant stable d'au moins
trois chiffres et un slug organisation-poste en kebab-case ASCII, par exemple
`001-acme-principal-architect`. Le coach attribue `max + 1` ; il ne comble jamais
un trou, ne réutilise jamais un identifiant et ne renomme jamais silencieusement
un répertoire existant.

Le coach crée `opportunity.md`, représentation textuelle canonique des
informations fournies sur l'offre, et `current-status.md`, son état de travail.
Les originaux autorisés peuvent être conservés tels quels sous `sources/`. Les
faits sources, les incertitudes et l'analyse dérivée restent distincts. Quand
l'analyse de l'opportunité commence, le coach crée un `analysis.md` séparé.

Lorsqu'un entretien est connu, le coach crée
`interviews/01-screening/interview.md`, avec le numéro à deux chiffres suivant et
un type descriptif. Les répertoires et fichiers de préparation, de simulation et
d'entretien réel ne sont ajoutés que lorsque le workflow les atteint. Les
entretiens et simulations existants ne sont jamais renumérotés ni écrasés.

## Continuité durable

Votre espace carrière est la référence durable entre les conversations.
L'historique d'une conversation n'est utile que comme contexte temporaire d'une
session de travail ciblée et ne doit pas être nécessaire pour reprendre plus
tard.

`data/current-status.md` ne fait qu'aiguiller la session suivante : il consigne
le dernier périmètre, la dernière tâche et un court point de reprise. Il ne
duplique ni la liste ni l'état détaillé des opportunités.

Chaque opportunité a son propre `current-status.md`. Cet instantané compact
consigne l'état de l'opportunité, l'entretien et la phase en cours, les
décisions validées, le travail réalisé, le contexte utile, les artefacts
pertinents et la prochaine action. L'historique détaillé relève de documents
d'opportunité dédiés.

## Sessions de travail

Utilisez chaque conversation avec l'assistant pour un objectif de coaching
ciblé : initialiser le profil, analyser une opportunité, préparer un entretien,
mener une simulation ou débriefer un entretien réel. Les conversations doivent
rester relativement courtes ; ouvrez-en une nouvelle quand l'objectif change ou
après un point d'étape naturel.

Au début d'une session, indiquez le périmètre visé lorsqu'il est connu. Pour une
demande générique comme « reprenons où nous nous sommes arrêtés », l'assistant
lit l'état racine et propose le point de reprise enregistré. Si plusieurs
périmètres sont plausibles, l'assistant vous demande de confirmer au lieu d'en
choisir un en silence.

Pour le travail sur une opportunité, l'assistant lit son état avant les autres
fichiers pertinents. Il met à jour l'état approprié après les transitions de
workflow significatives, les validations importantes et la création
d'artefacts utiles, et rend la prochaine action explicite avant de terminer une
session productive.

Pendant une simulation, la mise à jour des états ne doit pas interrompre le jeu
de rôle. L'assistant fait un point d'étape avant si nécessaire, capture les
artefacts produits ensuite, puis met à jour l'état de l'opportunité.

Les simulations existent en trois profondeurs : Court (environ 10 à 15 minutes
et 4 à 6 questions), Standard (environ 25 à 30 minutes et 8 à 10 questions, par
défaut) et Approfondi (environ 45 à 60 minutes et 12 à 15 questions). Écrire
« stop », « arrête la simulation », « arrêtons l'interview » ou « end the
simulation » demande l'arrêt d'une simulation à tout moment ; le coach vous
demande toujours de confirmer avant d'y mettre fin, et la mise en pause n'est
pas encore prise en charge. Une fois que vous avez confirmé, le coach annonce
l'arrêt, peut proposer de recueillir vos questions,
enregistre la transcription ou un point d'étape dans `current-status.md`, et
débriefe ce qui a été joué, immédiatement ou plus tard, en consignant l'arrêt
anticipé et ses limites dans `debrief.md`. Une nouvelle simulation après le
débriefing utilise le répertoire `simulations/NN/` suivant et redemande la
profondeur.

Si vous bloquez sur une question pendant une simulation, demandez un joker sans
l'arrêter : commencez votre message par « joker » (par exemple « joker,
donne-moi un indice » ou « joker, propose une réponse à ma place »). Le coach
sort du rôle des interviewers par une ligne en italique, puis donne un conseil
sur la question sans rédiger la réponse, ou propose une réponse, clairement
signalée, fondée uniquement sur votre dossier professionnel et l'opportunité.
S'il a fallu supposer quelque chose faute d'information, une ligne en italique
l'indique. Le coach reprend ensuite le rôle des interviewers. Si votre demande
n'est pas claire, il vous demande si vous souhaitez un conseil ou une réponse
proposée. Le nombre de jokers n'est pas limité ; le débriefing l'indique à
titre informatif. Une réponse proposée n'est pas évaluée comme votre réponse,
alors que votre réponse après un conseil l'est. Le mot « joker » au milieu
d'une réponse ne déclenche rien. Hors simulation, le coach vous rappelle que le
joker est réservé aux simulations, puis répond à votre demande.

Un débriefing de simulation peut avoir lieu immédiatement ou dans une
conversation ultérieure. Dans les deux cas, il lit les artefacts persistants de
la simulation choisie, consigne ses preuves et leurs limites dans `debrief.md`,
et ne doit pas dépendre d'un historique de discussion caché. Vos notes peuvent
appuyer un débriefing en l'absence de transcription.
