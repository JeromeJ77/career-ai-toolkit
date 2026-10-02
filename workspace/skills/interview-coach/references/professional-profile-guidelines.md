# Professional profile guidelines

The profile is candidate-owned and written in the configured primary language.

## Initialization

- Inventory available CVs, certificates, skills assessments, coaching notes, recommendations, portfolios and external references.
- Note dates, overlaps, contradictions and potentially obsolete information.
- Extract stable facts, intentions, preferences, career stories and evidence.
- Ask only for important missing details.
- Present a complete draft before applying it.

## Source transcription

Each source document the candidate adds under `data/profile/sources/` (PDF, DOCX, image, export, etc.) gets a Markdown transcription next to it, so that later sessions rely on the `.md` file instead of reopening the original. The same rules apply to the originals kept in an opportunity's `sources/` directory (see `opportunity-structure-guidelines.md`).

- Create `<same-name>.md` in the same directory as the original (`resume-2024.pdf` gives `resume-2024.md`). Skip it when the source already is Markdown or plain text.
- Never modify, move, rename or delete the original. The transcription is derived; the original remains the evidence.
- Transcribe faithfully and keep the source's structure (headings, lists, tables, dates). Do not summarize, correct, reorder, interpret or add facts. Mark unreadable, truncated or ambiguous passages explicitly (for example `[illisible]`) instead of guessing.
- Start the file with a short header: original file name, transcription date, and any limitation (pages not readable, images omitted, scan quality).
- Never overwrite an existing transcription. If the original seems to have changed, tell the candidate and propose a new dated transcription.
- Transcribe directly, except when the source is very voluminous (for example several dozen pages, or a large batch of files at once): state its size, ask the candidate to confirm, and offer to transcribe only the relevant parts. Transcribe only after they agree.
- If a source cannot be read at all, say so; do not create an empty or invented transcription.
- Use the transcriptions, not the originals, as the working basis for the profile and later sessions. Return to the original only to settle a doubt.
- The professional profile is still updated only through the controlled workflow: propose what the new source brings (additions, enrichments, contradictions with existing content) and apply it after the candidate validates it. Never merge source content into the profile silently.

## External references

`data/profile/sources/external-references.md` is the registry of the candidate's public links (LinkedIn, GitHub, portfolio, other). Keep it in step with the sources, whenever a source is read, at initialization or later.

- When a source the candidate provided (for example a LinkedIn PDF export in `historical-resumes/`, a CV header, a portfolio) contains a public profile URL, username or similar reference, record it in the matching section of `external-references.md`. If the same reference is already there, do not duplicate it; if it differs, flag the contradiction instead of replacing it.
- Fill only the fields the source supports (URL, username). Mention the originating source file in `Notes`. Leave the other fields empty.
- Do not set `Dernière vérification` and do not claim to have opened the link: the link has not been visited. Web access remains governed by the privacy settings.
- This registry is not the professional profile: recording a reference there does not need prior validation, but tell the candidate which references were added or which contradiction was found, in one short sentence. Facts retrieved from a link still go through the controlled profile update workflow.
- Never invent or guess a URL, and never add a reference that appears only in a third party's document.

## Content quality

Distinguish facts, candidate preferences, validated formulations and items to verify. Keep the profile richer than a CV but readable. Add a short history entry for significant approved updates.
