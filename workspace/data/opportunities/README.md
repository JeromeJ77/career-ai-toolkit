# Opportunités

Fournissez au coach les documents ou informations disponibles et demandez-lui d'ajouter l'opportunité. Le coach crée et maintient l'arborescence ; vous n'avez pas à gérer manuellement les répertoires et fichiers.

Les opportunités reçoivent un numéro stable d'au moins trois chiffres dans leur ordre de création, par exemple `001-organization-role`, `002-other-organization-role`. Un numéro n'est jamais réutilisé et les répertoires existants ne sont pas renumérotés.

```text
001-organization-role/
|-- current-status.md
|-- opportunity.md
|-- analysis.md                      # lorsque l'analyse commence
|-- sources/                         # originaux et leurs transcriptions
`-- interviews/                      # à partir du premier entretien connu
    `-- 01-screening/
        |-- interview.md
        |-- preparation.md           # fiche, générée en fin de préparation
        |-- simulations/
        |   `-- 01/
        |       |-- transcript.md
        |       `-- debrief.md
        `-- actual/
            |-- notes.md
            |-- transcript.md        # facultatif
            `-- review.md
```

`opportunity.md` est la représentation textuelle canonique de l'offre et du contexte fourni. Le coach crée `sources/` avec l'opportunité. Pour lui fournir un document, trois voies : le copier dans `sources/` et le lui dire, le joindre à la conversation, ou coller son texte dans la conversation. Les originaux autorisés y sont conservés sans modification, avec une transcription Markdown à côté. L'analyse et le positionnement sont maintenus séparément dans `analysis.md`.

Chaque entretien reçoit un numéro stable d'au moins deux chiffres et un type lisible, par exemple `01-screening`, `02-hiring-manager` ou `03-technical`. Les informations importantes existent aussi dans son `interview.md` : le nom du répertoire n'est pas la seule source de sens.

Le coach ajoute les sous-répertoires et fichiers au fur et à mesure. Il ne crée pas à l'avance de préparations, simulations ou comptes rendus vides. `current-status.md` reste une mémoire de travail compacte : état, entretien et phase courants, décisions validées, artefacts pertinents et prochaine action. Le détail de chaque entretien (préparation, simulations, débriefs, entretien réel) est tenu à jour dans son `interview.md`.

Le debrief d'une simulation peut être réalisé dans une nouvelle conversation. Le coach relit alors les artefacts persistants de la simulation ciblée, indique les sources et limites de son analyse dans `debrief.md`, et ne reconstitue pas les éléments absents.
