# Developer test plan

This plan lists what to test. [`test-log.md`](test-log.md) records what has actually been tested, by whom and with what result.

## Build

- Run `build.bat` from a clean checkout on Windows.
- Confirm `dist/` is created.
- Confirm the version matches `VERSION`, that it is not an already released
  version, and that it carries the `-dev` suffix until the release is prepared.
- Confirm the version shown in the standalone header and in the pilot feedback
  template matches `VERSION`.
- Confirm the standalone and pilot-feedback filenames are versioned.
- Confirm the ZIP contains one top-level `career-ai-workspace/` directory.
- Confirm `examples/`, repository docs and real or synthetic demo data are not in the workspace ZIP.
- Confirm a missing mandatory source file makes the build fail clearly.
- Confirm the opportunity structure reference and its Markdown templates are
  included in the workspace ZIP and treated as mandatory build sources.
- Confirm repeated builds replace previous local artifacts.
- Confirm the ZIP tree matches `docs/architecture.md#workspace-tree`: the engine
  is at the root and `data/` contains only `README.md` files.
- Confirm the five templates exist under `skills/init-workspace/assets/` and
  that the ZIP contains no `data/config/workspace.yaml`,
  `data/current-status.md`, `data/profile/professional-profile.md`,
  `data/profile/sources/external-references.md` or
  `data/feedback/pilot-feedback.md`.
- Confirm the build fails when a non-`README.md` file is added under
  `workspace/data/`, and when an initialized working file is added to the engine.
- Confirm the build still performs no installation, network access or inclusion
  of the fictional example.
- Search the repository for obsolete root paths (`profile/`, `opportunities/`,
  `config/`, `feedback/`, `cv/`, `archives/`, root `current-status.md`) and
  confirm none remains outside `data/`.

## Repository privacy

- Search the repository for real names, employer-specific content, personal email addresses and phone numbers.
- Confirm all example data is explicitly fictional.
- Confirm the fictional end-to-end example follows the canonical v0.3
  opportunity, interview, simulation and actual-interview structure.
- Confirm `dist/` and `build/` are ignored.

## Standalone coach

- Start with CV + offer only.
- Start with CV + professional profile + offer + existing letter.
- Test French and English.
- Test HR screening, technical, system design, leadership and executive scenarios.
- Confirm the coach proposes strategic messages and allows adjustment.
- Confirm simulation asks one question at a time and, with several
  interviewers, that only one of them asks per turn.
- Confirm a new stop request made right after a declined stop is confirmed
  again before the simulation ends.
- Confirm preparation stays coaching: the coach never plays an interviewer or
  uses the italic role markers outside a simulation.
- Confirm the coach says « dossier professionnel », never « profil
  professionnel », when coaching in French.
- Confirm coaching does not interrupt a realistic simulation.
- Confirm the first debrief is succinct and evidence-based.
- Confirm the coach offers the Court, Standard and Approfondi depths with
  approximate duration and question count, and mentions the stop keywords.
- Confirm each stop keyword triggers a confirmation recalling that the stop is
  final, that the simulation resumes if the candidate does not confirm, that a
  « stop » inside an answer triggers nothing, that an unclear phrasing such as
  « je veux arrêter là » triggers the same confirmation, and that a pause
  request is answered by saying pausing is not supported.
- Confirm a second simulation is independent from the first (no « rebonjour »,
  no reference to the earlier session) and that the coach asks whether to
  replay the same case or play another one.
- Confirm the first simulation of a round says nothing about what the
  interviewers will ignore and never presents the preparation as a simulation.
- Confirm each exit from and return to the interviewer role is marked by a
  short line in italics, including when a stop is not confirmed and the
  simulation resumes, whether the candidate declines the stop or simply
  answers the interview question.
- Confirm the coach recalls what a strategic message is the first time, and
  keeps a withdrawn message apart with its reason instead of deleting it.
- Confirm questions the coach suggests for the interviewers are presented as
  its suggestions, distinct from the candidate's ideas.
- Write « stop » mid-simulation and confirm; check the coach states it is stopping at the
  candidate's request, leaves the role, optionally offers to collect the
  candidate's questions, debriefs only what was played, does not assess unplayed
  parts, then asks the depth again for a new simulation.
- Confirm no facts are invented.
- Confirm file persistence and PDF limitations are stated honestly.

## Workspace

- Extract the ZIP outside the repository.
- Open it as a new VS Code/Claude Code project.
- Confirm root instructions are discovered and readable.
- On the first session in the extracted workspace, confirm the coach creates
  the four missing mandatory files under `data/` from the templates and says so.
- Confirm a second session creates nothing and overwrites nothing, that a file
  deleted by the user is recreated alone, and that an existing file with custom
  content is left untouched.
- Confirm the created profile is an empty skeleton and that the coach does not
  fill it in without the profile workflow and the candidate's validation.
- Remove a key from `data/config/workspace.yaml` and confirm the coach appends
  it with its template default value at its template position, tells the
  candidate which key and value were added, and leaves existing keys, values
  and comments unchanged. Confirm a second session adds and reports nothing.
- Give a key an invalid value (for example a non-boolean for
  `allow_external_web_search`) and confirm the coach does not rewrite the file,
  uses the default for the session, tells the candidate the key, the value found
  and the default used, and leaves the correction to them.
- Confirm `data/feedback/pilot-feedback.md` is created only on request.
- Set the profile language in `data/config/workspace.yaml`.
- Add sample authorized sources and initialize the profile.
- Confirm profile changes are proposed before application.
- Ask to initialize the profile without providing sources and confirm the
  coach states the three ways to provide them (copy into the matching
  `data/profile/sources/` subdirectory, attach to the conversation, paste the
  text). Attach the sources to the conversation and confirm the coach places an
  unchanged copy of each one in the matching subdirectory, says where, and then
  transcribes them.
- Add a synthetic PDF CV to `data/profile/sources/historical-resumes/` and
  confirm the coach creates a faithful Markdown transcription with the same
  name in the same directory, with a header (original name, date, limitations),
  leaves the original unchanged, marks unreadable passages instead of guessing,
  creates no transcription for a source that already is Markdown, and does not
  overwrite an existing transcription.
- Add a very long synthetic source and confirm the coach states its size and
  asks for confirmation (offering to transcribe only the relevant parts) before
  transcribing, while a normal-sized source is transcribed without asking.
- Confirm the coach then proposes profile updates from the new source and
  applies none before validation.
- Add a synthetic LinkedIn PDF export containing a public profile URL to
  `data/profile/sources/historical-resumes/` and confirm the coach records the
  URL and the source file in `external-references.md`, tells the candidate, does
  not set a verification date, does not claim to have opened the link and does
  not duplicate the entry on a second pass.
- Delete `data/profile/professional-profile.md` but keep the sources and
  `data/current-status.md`. Confirm the coach flags the inconsistency, suggests
  a possible file loss, and does not recreate or rewrite the profile until the
  candidate decides (no empty skeleton is created from the template); then ask
  for a full re-import and confirm the sources are transcribed again and the
  profile is rebuilt through the validated workflow.
- At the start of a session, confirm the coach has read the professional
  profile (it never says it does not know whether the profile is filled) and
  corrects a status that says the profile is empty while it is filled.
- Confirm `data/current-status.md` is read and remains a minimal routing
  snapshot rather than an opportunity index.
- Give the coach source material for two opportunities without creating their
  directories manually.
- Confirm it creates stable `001-...` and `002-...` directories, then uses
  `max + 1` without filling gaps or renumbering existing opportunities.
- Confirm each opportunity has a canonical `opportunity.md`,
  `current-status.md` and a `sources/` directory created with it, that the coach
  states the three ways to provide a document (copy into `sources/`, attach to
  the conversation, paste the text), that retained original files under
  `sources/` remain unchanged, and that each PDF or DOCX original gets a
  Markdown transcription next to it while pasted text is saved as a Markdown
  file.
- Provide a job posting in a language other than the coaching language and
  confirm the transcription next to the original keeps the source language word
  for word, while `opportunity.md` is written in the coaching language, states
  the source language in its Sources section and keeps proper names and the
  official job title as in the source.
- Confirm derived analysis is separate from the canonical source
  representation and uncertain information is explicit.
- Create a first and second interview round and confirm
  `interviews/01-type/interview.md` and `interviews/02-type/interview.md` retain
  their sequence and metadata.
- Confirm preparation, simulation and `actual/` artifacts are created only when
  their workflow phase is reached; no empty placeholder tree is generated.
- Confirm the coach reviews the candidate's questions for the interviewers
  before the sheet: reuses the ideas already in the dossier without asking for
  them again, gives an opinion on each, proposes rephrasings and one or two
  questions specific to the opportunity, separates this round's questions from
  later rounds', and consigns only what the candidate validated. Confirm that a
  sheet requested without this step makes the coach say so and ask whether to
  do it first, and that a refusal still produces the sheet with the question
  sections left empty and no invented question.
- Complete preparation, sheet generation, simulation and post-interview
  reflection for one opportunity.
- Confirm the opportunity receives a `current-status.md` and that it is updated
  after phase changes, important validations and new relevant artifacts.
- Confirm the round's `interview.md` is updated when preparation starts (status
  « en préparation », preparation « en cours » while `preparation.md` is not
  generated yet), after each simulation and debrief and when the actual
  interview is documented, and
  that the opportunity status points to it instead of listing the round's
  detail.
- For the same opportunity, run at least two simulation/debrief/improvement
  loops; confirm `simulations/01/` and `simulations/02/` remain distinct, then
  prepare a follow-up interview round.
- End one conversation after persisting a simulation transcript. In a new
  conversation, request its debrief and confirm the coach selects the correct
  opportunity, round and simulation using only workspace artifacts.
- Repeat an independent debrief without a transcript using candidate notes;
  confirm `debrief.md` identifies its sources and limitations and does not
  invent exact wording or chronology.
- Confirm each simulation debrief separates observations from interpretation,
  limits priorities to one through three, and updates the opportunity status.
- Confirm an actual-interview review works from candidate notes without
  requiring a transcript.
- Start a new conversation for a later coaching session and confirm work can be
  resumed from the workspace without prior conversation history, with dates
  reported as recorded and worded consistently.
- Stop a simulation early with « stop »; confirm the transcript covers only what
  was played (or `current-status.md` holds a checkpoint when none exists),
  `debrief.md` records the early stop, and a following simulation
  uses the next `simulations/NN/` directory without altering the first.
- Confirm status updates do not interrupt the interview simulation itself.
- Confirm first-page sheet density remains usable, that the first page holds no
  vigilance points or communication reminders, that the second page is the note
  area and that detail starts on the third page with the vigilance points and
  communication reminders.
- Confirm durable learnings are separated from opportunity-specific content.

## Test kit, demo script and fictional example (#12)

Nominal flow:

- Confirm `test-kit/sources/profile/` holds a realistic, explicitly fictional
  developer profile (CV, LinkedIn profile, certification, additional
  information) whose Markdown sources are consistent with each other.
- Confirm `test-kit/sources/opportunities/` holds at least two fictional
  opportunities, the second one usable to show parallel handling with a session
  change.
- Run the generation script and confirm it produces the PDF and DOCX files from
  the Markdown sources; confirm the committed files match a fresh generation.
- Confirm each step of `test-kit/scenario.md` states the files to inject and
  their destination under `data/`, the prompt, the keywords, the expected result
  and the related test-plan item.
- Run `build.bat` and confirm it produces the demo and manual-test kit ZIP with
  the fictional sources and a demo script holding only the `[demo]` steps,
  reduced to duration, conversation, files, actions, prompts and talking
  points, without expected results or test plan references.
- Confirm the `[demo]` steps fit in 35 to 40 minutes during a timed dry run
  played from the demo script alone.
- Confirm each step of `test-kit/scenario.md` with a prompt states whether it
  runs in a new conversation or continues the previous step's conversation.
- Confirm the kit holds a very long synthetic profile source generated from a
  Markdown reference, usable for the large-source scenario.
- Play the master scenario end to end in a fresh extracted workspace with the
  fictional sources only, and confirm each step behaves as written.
- Confirm `examples/fictitious-developer/data/` mirrors the workspace `data/`
  tree, contains no engine file, and comes from that run.

Edge cases:

- Confirm steps depending on undelivered issues (#6, #9, #10, #11) are tagged
  `[todo #N]` and flagged as such in the generated demo script.
- Confirm the coach transcribes the fictional PDF, DOCX and TXT sources as
  described in the transcription scenarios above.
- Confirm `build.bat` never calls the generation script and requires no new
  dependency (no Python, no library, no network).

Limit cases:

- Confirm the build fails clearly when `test-kit/scenario.md` or a required
  kit source is missing.
- Confirm the workspace ZIP still embeds no fictional data, test-kit content or
  example.
- Search `test-kit/` and `examples/` for real names, employers, emails and
  phone numbers.
- Confirm `examples/fictitious-principal-architect/` is gone and no document
  still refers to it.

Rule and documentation:

- Confirm `AGENTS.md` requires every new development to check and complete the
  test kit, the fictional example and the master scenario in the same change,
  recalls it at issue start, and requires reporting a non-demonstrable feature.
- Confirm `CONTRIBUTING.md` (and any issue template or PR checklist) repeats the
  rule consistently.

Non-regression:

- Replay « Build » and « Repository privacy » after the example is replaced and
  the kit ZIP is added.

## Regression

Repeat essential standalone and workspace scenarios after any change to the core coach instructions.
