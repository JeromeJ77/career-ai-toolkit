# Opportunity structure guidelines

Use this structure for new opportunities. Preserve existing user content and do not rename an existing opportunity or interview directory without explicit agreement.

## Create an opportunity

The coach creates the opportunity directory; the candidate supplies the available source documents or context.

1. Inspect the existing directories under `data/opportunities/`.
2. Find the highest leading numeric identifier and allocate the next one. Use at least three digits: `001`, `002`, `003`. Never fill a gap or renumber an existing opportunity.
3. Build a lowercase ASCII kebab-case slug from the organization and role, for example `001-acme-principal-architect`. Remove diacritics, replace punctuation and whitespace with single hyphens, and avoid adding facts that are not known.
4. Create the opportunity directory and its `sources/` directory.
5. Create `opportunity.md` from `../assets/opportunity.template.md` and `current-status.md` from `../assets/opportunity-current-status.template.md`.
6. If the documents are not provided yet, tell the candidate the three ways to provide them: copy the files into `sources/` and say so; attach them to the conversation; or paste the text into the conversation.
7. If original files are available and authorized for retention, place an unchanged copy under `sources/` when the tool can do so safely. Do not rename, move, rewrite or delete the supplied original without the candidate's agreement. When the candidate pastes text, save it unchanged as a Markdown file under `sources/` with a short header stating that it was pasted in the conversation and when.
8. Transcribe each original that is not already Markdown or plain text to `<same-name>.md` next to it, following the source transcription rules of `professional-profile-guidelines.md` (faithful transcription, header, no overwrite, confirmation for very voluminous sources). The transcription keeps the source language; never translate it.
9. Convert the useful source content into `opportunity.md`, written in the coaching language configured in `data/config/workspace.yaml` (`language.coaching`), whatever the language of the sources. When a source is in another language, translate its content faithfully, keep proper names, the official job title and established technical terms as they appear in the source, and state the source language in the Sources section (for example "job posting in English, translated"). The verbatim transcription next to the original remains the evidence. Use another language only if the candidate asks for it. Record source paths or provenance and distinguish missing or uncertain information from source facts.
10. Update the opportunity status and the root status with the new scope and next action.

Creating an opportunity stays available whatever the profile status. When the profile is not `ready`, the next step proposed is to return to the profile, with the warning of the "Professional profile status" section of `AGENTS.md`.

If the candidate supplies a link to the job posting instead of the document, follow the "Web browsing" section of `AGENTS.md` (agreement for that link, no browsing otherwise). Once the page is opened, save its content as a Markdown transcription under `sources/`, with a header stating the link and the consultation date: it is a frozen copy, since the page may change or disappear. Present the extracted information for validation before writing it in `opportunity.md`, and cite the transcription and the link in its Sources section.

`opportunity.md` is the canonical textual representation used by the coach. It contains source information, not fit analysis, positioning or invented interpretation. When analysis starts, create `analysis.md` from `../assets/opportunity-analysis.template.md` and keep derived reasoning there.

If organization or role information is insufficient for a stable slug, ask only for the missing identifier before creating the directory. Numeric prefixes make otherwise identical organization-role slugs unambiguous.

When a new source is added later, preserve and transcribe it like the earlier originals and update `opportunity.md` from the combined evidence. Flag contradictions or superseded information explicitly instead of silently choosing one version.

## Exception for a profile that is not ready

Record the exceptions of the "Professional profile status" section of `AGENTS.md` in the « Décisions validées » section of the opportunity's `current-status.md`, and nowhere else:

- the exception: « Dérogation : travail avec le dossier professionnel version <version> (<statut>), décidé le <date>. », where `<statut>` is the status label;
- after a definitive refusal of a new analysis pass: « Nouvelle passe d'analyse refusée le <date> ; ne plus la proposer. »;
- after a new analysis pass: « Dérogation close le <date> : nouvelle passe d'analyse avec le dossier prêt <version>. »

An exception is open until it is marked closed. Keep the earlier lines when adding a new one.

## Create an interview round

Create `interviews/` when the first round becomes known. Do not create placeholder rounds.

1. Inspect existing round directories under `interviews/`.
2. Allocate the next unused sequence using at least two digits: `01`, `02`, `03`. Never renumber an existing round.
3. Use a concise lowercase ASCII type slug, such as `screening`, `recruiter`, `hiring-manager`, `technical`, `system-design`, `leadership`, `hr`, `executive` or `other`. Prefer the most precise type supported by known facts.
4. Create `interviews/<sequence>-<type>/interview.md` from `../assets/interview.template.md`.
5. Record the sequence, type, known logistics and uncertainties in `interview.md`; the directory name is not the sole source of meaning.
6. Update the opportunity status so its current interview and next action point to the new round when appropriate.

If the round type is not yet clear enough for a stable directory name, ask for clarification before creating it. Use `other` only when the type is genuinely unspecified, not as a temporary placeholder.

## Add artifacts progressively

Create only artifacts that the workflow has reached:

```text
data/opportunities/
`-- 001-organization-role/
    |-- current-status.md
    |-- opportunity.md
    |-- analysis.md                      # when opportunity analysis starts
    |-- sources/                         # created with the opportunity
    |   |-- job-posting.pdf              # unchanged original
    |   `-- job-posting.md               # transcription
    `-- interviews/                      # from the first known round
        `-- 01-screening/
            |-- interview.md
            |-- preparation.md           # sheet, generated at the end of preparation
            |-- simulations/             # from the first simulation
            |   `-- 01/
            |       |-- transcript.md    # when technically available
            |       `-- debrief.md
            `-- actual/                  # when the real interview is documented
                |-- notes.md             # when notes are available
                |-- transcript.md        # optional and only when legitimate
                `-- review.md
```

- Generate `preparation.md` from `interview-preparation-sheet.template.md`.
- Number simulations independently within a round using at least two digits and `max + 1`. Never overwrite or renumber a prior simulation.
- Keep `transcript.md` factual. Put interpretation and coaching feedback in `debrief.md`.
- Generate a simulation's `debrief.md` from `../assets/simulation-debrief.template.md`.
- A round has at most one `actual/` directory. A transcript is optional; candidate notes are sufficient for `review.md`.
- Generate `actual/review.md` from `interview-feedback.template.md` when reviewing the real interview.
- Keep each round's `interview.md` current: update its status and « Artefacts du round » section when preparation starts, after each simulation and debrief, and when the actual interview is documented.
- Reference created artifacts from the opportunity status instead of copying their full contents into it. For a round's detail, point to its `interview.md`.
