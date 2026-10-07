# Professional profile

The professional profile is the candidate-owned source of truth. It combines stable facts, intentions, preferences, validated career stories and interview learnings that are not adequately captured by a CV.

The profile should use the candidate's primary working or native language so it remains readable and manually maintainable. Updates must be proposed, reviewed and explicitly approved. Opportunity-specific claims belong in the opportunity folder unless the candidate validates them as durable.

## Status and version

The profile header carries a status and a version, decided with the candidate (see [D-010](design/decision-log.md#d-010--statut-et-version-du-dossier-professionnel-décidés-avec-le-candidat)). The header is their only source; no status file copies them. The coach instructions are in the "Professional profile status" section of `workspace/AGENTS.md`.

| Code | French label | English label | Meaning |
| --- | --- | --- | --- |
| `empty` | vide | empty | Skeleton created from the template, version `0.1`. |
| `draft` | en construction | in progress | Set by the first validated change (`0.2`); the profile is being built. |
| `ready` | prêt | ready | Operational threshold decided jointly: sufficient to work on opportunities. Not a final state. |

- The file holds the stable English code followed by the label in the profile language (`draft (en construction)`); the code decides. The coach speaks to the candidate with the label, never the code.
- Version: +0.1 at most once per session (conversation) that applies at least one validated change, whatever the number of changes (`0.9` → `0.10`). Moving to `ready` gives the next major version `.0` (`1.0` the first time). A `ready` profile keeps the same rule (`1.1`, `1.2`…).
- Moving to `ready`: proposed by the coach when it judges the profile sufficient (after a validated update, or when answering a request for opportunity work); the candidate may first add information, then validates. A request from the candidate counts as the validation; if the coach sees important gaps, it states its reservation and asks for confirmation, and the candidate's decision applies. There is no measured criterion.
- Return to `draft`: requested by the candidate or proposed by the coach (career change, major rework), applied after validation. The version continues (`1.3` → `1.4`); the next `ready` gives `2.0`.
- Every status or version change is presented before application and adds one entry to « Historique synthétique »: date, old and new status and version, one-line reason, candidate validation. A declined `ready` proposal changes nothing.
- Status line: at the start of every session except the first, right after the greeting, the coach states the status with an emoji, the label and the version, for example « Dossier professionnel : 🟠 en construction (version 0.2). ».
- While the profile is not `ready`, the coach gently declines opportunity analysis, interview preparation, simulation, debriefing, the preparation sheet and any derived document that compares the profile with an opportunity. Creating an opportunity, recording its sources, creating an interview round and documenting an interview already held stay available. After creating an opportunity, the coach proposes to return to the profile first.
- If the candidate insists, the coach continues, says the result is less reliable and records the exception in the opportunity's `current-status.md`. The exception covers that opportunity only; the coach recalls it when the opportunity is resumed, and proposes a new analysis pass once the profile is `ready`.
- Each analysis pass is recorded in the opportunity's `analysis.md` with the profile version and status used.
- A missing or invalid status or version is reported, never interpreted; the coach proposes a value deduced from the content (never `ready`) and applies it only after explicit agreement.
