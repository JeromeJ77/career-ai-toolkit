# v0.2 developer test plan

## Build

- Run `build.bat` from a clean checkout on Windows.
- Confirm `dist/` is created.
- Confirm the version matches `VERSION`.
- Confirm the standalone and pilot-feedback filenames are versioned.
- Confirm the ZIP contains one top-level `career-ai-workspace/` directory.
- Confirm `examples/`, repository docs and real or synthetic demo data are not in the workspace ZIP.
- Confirm a missing mandatory source file makes the build fail clearly.
- Confirm the opportunity structure reference and its Markdown templates are
  included in the workspace ZIP and treated as mandatory build sources.
- Confirm repeated builds replace previous local artifacts.

## Repository privacy

- Search the repository for real names, employer-specific content, personal email addresses and phone numbers.
- Confirm all example data is explicitly fictional.
- Confirm `dist/` and `build/` are ignored.

## Standalone coach

- Start with CV + offer only.
- Start with CV + professional profile + offer + existing letter.
- Test French and English.
- Test HR screening, technical, system design, leadership and executive scenarios.
- Confirm the coach proposes strategic messages and allows adjustment.
- Confirm simulation asks one question at a time.
- Confirm coaching does not interrupt a realistic simulation.
- Confirm the first debrief is succinct and evidence-based.
- Confirm no facts are invented.
- Confirm file persistence and PDF limitations are stated honestly.

## Workspace

- Extract the ZIP outside the repository.
- Open it as a new VS Code/Claude Code project.
- Confirm root instructions are discovered and readable.
- Set the profile language in `config/workspace.yaml`.
- Add sample authorized sources and initialize the profile.
- Confirm profile changes are proposed before application.
- Confirm the root `current-status.md` is read and remains a minimal routing
  snapshot rather than an opportunity index.
- Give the coach source material for two opportunities without creating their
  directories manually.
- Confirm it creates stable `001-...` and `002-...` directories, then uses
  `max + 1` without filling gaps or renumbering existing opportunities.
- Confirm each opportunity has a canonical `opportunity.md` and
  `current-status.md`, and that retained original files under `sources/` remain
  unchanged.
- Confirm derived analysis is separate from the canonical source
  representation and uncertain information is explicit.
- Create a first and second interview round and confirm
  `interviews/01-type/interview.md` and `interviews/02-type/interview.md` retain
  their sequence and metadata.
- Confirm preparation, simulation and `actual/` artifacts are created only when
  their workflow phase is reached; no empty placeholder tree is generated.
- Complete preparation, sheet generation, simulation and post-interview
  reflection for one opportunity.
- Confirm the opportunity receives a `current-status.md` and that it is updated
  after phase changes, important validations and new relevant artifacts.
- For the same opportunity, run at least two simulation/debrief/improvement
  loops; confirm `simulations/01/` and `simulations/02/` remain distinct, then
  prepare a follow-up interview round.
- Confirm an actual-interview review works from candidate notes without
  requiring a transcript.
- Start a new conversation for a later coaching session and confirm work can be
  resumed from the workspace without prior conversation history.
- Confirm status updates do not interrupt the interview simulation itself.
- Confirm first-page sheet density and note area remain usable.
- Confirm durable learnings are separated from opportunity-specific content.

## Regression

Repeat essential standalone and workspace scenarios after any change to the core coach instructions.
