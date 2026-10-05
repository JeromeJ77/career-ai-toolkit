# Developer test plan

This plan lists what to test. [`test-log.md`](test-log.md) records what has actually been tested, by whom and with what result.

## Build

- Run `build.bat` from a clean checkout on Windows.
- Confirm `dist/` is created.
- Confirm the version matches `VERSION`, that it is not an already released
  version, and that it carries the `-dev` suffix until the release is prepared.
- Confirm the pilot feedback template source holds the `{{VERSION}}`
  placeholder, that the ZIP copy and the `dist/` copy hold the content of
  `VERSION`, that no placeholder remains, that the build fails when the
  placeholder is missing from the source, and that the pilot-feedback filename
  is versioned.
- Confirm `build.bat` produces no standalone deliverable and no longer checks a
  standalone version (#14): `dist/` holds no
  `interview-coach-standalone-v<version>.md`.
- Confirm the ZIP contains one top-level `mycareer-workspace/` directory.
- Confirm the ZIP contains `ENGINE-VERSION` at the workspace root, holding
  exactly the content of `VERSION` (single line, no trailing space), and that
  `workspace/` itself holds no `ENGINE-VERSION` (the build rejects it as an
  unexpected root entry).
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
- Confirm the fictional end-to-end example follows the canonical
  opportunity, interview, simulation and actual-interview structure.
- Confirm `dist/` and `build/` are ignored.

## Workspace

- Extract the ZIP outside the repository.
- Open it as a new VS Code/Claude Code project.
- Confirm root instructions are discovered and readable.
- On the first session in the extracted workspace, confirm the coach shows the
  welcome message and the first-name question first, waits for the answer,
  then creates the four missing mandatory files under `data/` from the
  templates, reports it in one functional sentence and gives the one-time
  privacy reminder before proposing the first step (see « Refocus on MyCareer
  Workspace (#15) » and « Privacy reminder and web browsing (#8) »).
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
- Set the profile and coaching languages in `data/config/workspace.yaml`, and
  run coaching sessions in French and in English.
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
- Confirm the coach proposes strategic messages and allows adjustment, recalls
  what a strategic message is the first time, and keeps a withdrawn message
  apart with its reason instead of deleting it.
- Create a first and second interview round and confirm
  `interviews/01-type/interview.md` and `interviews/02-type/interview.md` retain
  their sequence and metadata. Across opportunities, cover HR screening,
  technical, system design, leadership and executive interview types.
- Confirm preparation, simulation and `actual/` artifacts are created only when
  their workflow phase is reached; no empty placeholder tree is generated.
- Confirm the coach reviews the candidate's questions for the interviewers
  before the sheet: reuses the ideas already in the dossier without asking for
  them again, gives an opinion on each, proposes rephrasings and one or two
  questions specific to the opportunity presented as its own suggestions,
  distinct from the candidate's ideas, separates this round's questions from
  later rounds', and consigns only what the candidate validated. Confirm that a
  sheet requested without this step makes the coach say so and ask whether to
  do it first, and that a refusal still produces the sheet with the question
  sections left empty and no invented question.
- Complete preparation, sheet generation, simulation and post-interview
  reflection for one opportunity.
- Confirm preparation stays coaching: the coach never plays an interviewer or
  uses the italic role markers outside a simulation, never presents the
  preparation as a simulation, and the first simulation of a round says nothing
  about what the interviewers will ignore.
- Confirm the coach offers the "Court", "Standard" and "Approfondi" depths with
  approximate duration and question count, and mentions the stop keywords.
- Confirm simulation asks one question at a time and, with several
  interviewers, that only one of them asks per turn; that each exit from and
  return to the interviewer role is marked by a short line in italics; and that
  neither coaching nor status updates interrupt the simulation itself.
- Confirm the opportunity receives a `current-status.md` and that it is updated
  after phase changes, important validations and new relevant artifacts.
- Confirm the round's `interview.md` is updated when preparation starts (status
  « en préparation », preparation « en cours » while `preparation.md` is not
  generated yet), after each simulation and debrief and when the actual
  interview is documented, and
  that the opportunity status points to it instead of listing the round's
  detail.
- For the same opportunity, run at least two simulation/debrief/improvement
  loops; confirm `simulations/01/` and `simulations/02/` remain distinct, that
  the coach asks whether to replay the same case or play another one, and that
  the second simulation is independent from the first (no « rebonjour », no
  reference to the earlier session); then prepare a follow-up interview round.
- End one conversation after persisting a simulation transcript. In a new
  conversation, request its debrief and confirm the coach selects the correct
  opportunity, round and simulation using only workspace artifacts.
- Repeat an independent debrief without a transcript using candidate notes;
  confirm `debrief.md` identifies its sources and limitations and does not
  invent exact wording or chronology.
- Confirm each simulation debrief is succinct and evidence-based, separates
  observations from interpretation, limits priorities to one through three, and
  updates the opportunity status.
- Confirm an actual-interview review works from candidate notes without
  requiring a transcript.
- Start a new conversation for a later coaching session and confirm work can be
  resumed from the workspace without prior conversation history, with dates
  reported as recorded and worded consistently.
- Confirm each stop keyword triggers a confirmation recalling that the stop is
  final, that the simulation resumes (with the italic return line) if the
  candidate declines or simply answers the question, that a new stop request
  right after a declined stop is confirmed again, that a « stop » inside an
  answer triggers nothing, that an unclear phrasing such as « je veux arrêter
  là » triggers the same confirmation, and that a pause request is answered by
  saying pausing is not supported.
- Stop a simulation early with « stop » and confirm; check the coach states it
  is stopping at the candidate's request, leaves the role, optionally offers to
  collect the candidate's questions, debriefs only what was played without
  assessing unplayed parts, then asks the depth again for a new simulation.
  Confirm the transcript covers only what was played (or `current-status.md`
  holds a checkpoint when none exists), `debrief.md` records the early stop, and
  a following simulation uses the next `simulations/NN/` directory without
  altering the first.
- Confirm first-page sheet density remains usable, that the first page holds no
  vigilance points or communication reminders, that the second page is the note
  area and that detail starts on the third page with the vigilance points and
  communication reminders.
- Confirm durable learnings are separated from opportunity-specific content.
- Throughout the sessions, confirm no facts are invented and that the coach
  says « dossier professionnel », never « profil professionnel », when coaching
  in French.

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

## Standalone abandonment (#14)

Nominal flow:

- Confirm `standalone/` and `docs/standalone-mode.md` no longer exist and that
  every generic coaching rule of the former standalone instructions is present
  in the workspace skills, or has been reported to the user.
- Run `build.bat` on a clean copy and replay the « Build » section.
- Search the repository (outside `CHANGELOG.md`, `docs/test-history/`, closed
  issues and the abandonment decision itself) for « standalone » and « mode
  autonome »: no remaining mention as an active component.
- Confirm the decision log holds an entry for the abandonment in the format
  defined by #13 (type `PRODUCT`, status « ✅ Adoptée », options considered,
  consequences, reassessment condition) and that D-009 no longer cites the
  standalone as an active reference.
- Confirm `CHANGELOG.md` announces the abandonment and the glossary keeps the
  « Mode standalone » entry, marked as abandoned with a link to the decision.

Edge cases:

- Confirm the pilot-feedback template no longer asks which mode was tested.
- Confirm `test-kit/scenario.md` and `test-kit/guide-testeur.md` no longer
  refer to standalone checks or to the standalone as a source to fix.
- Confirm the « mode autonome » criteria are removed from issues #8 and #9 with
  a comment pointing to #14, that #3 no longer carries `standalone-mode`, and
  that the label itself still exists for closed issues such as #2.
- Confirm « Validate the standalone coach with real users » is gone from
  `BACKLOG.md` and that « Standalone interview coach in English » is reworded as
  an English version of the workspace, without any standalone reference.

Limit cases:

- Confirm historical documents (earlier `CHANGELOG.md` entries, `docs/test-history/`)
  are not rewritten.
- Confirm `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md` and `.gitattributes` keep
  no rule that depends on the standalone (version, consistency, commit scope,
  source path), without losing any other rule.

Non-regression:

- Confirm the workspace ZIP file list is unchanged and replay « Repository
  privacy ».

## Refocus on MyCareer Workspace (#15)

Nominal flow:

- Run `build.bat` on a clean copy and confirm it produces
  `dist/mycareer-workspace-v<version>.zip` with one top-level
  `mycareer-workspace/` directory, and the test kit as
  `dist/mycareer-workspace-test-kit-v<version>.zip`; no
  `career-ai-workspace*`, `career-ai-test-kit*` or `my-career-workspace*`
  artifact is produced. The
  pilot feedback is `dist/mycareer-workspace-pilot-feedback-v<version>.md`.
- Confirm the pilot feedback template source holds the `{{VERSION}}`
  placeholder, that the build replaces it with the content of `VERSION` in the
  ZIP copy and in `dist/` (accents and line endings preserved), that no
  placeholder remains, and that the build fails clearly when the placeholder
  is missing from the source.
- Confirm version numbers are gone from the READMEs, `CONTRIBUTING.md` and the
  docs wherever they are not needed (release-specific wording), so that a
  release only changes `VERSION` and `CHANGELOG.md`.
- On the first session of a freshly extracted workspace, coaching in French,
  confirm the coach opens, after the fixed line *Lancement de la session…*,
  with « Bienvenue dans votre **espace carrière** ! »,
  the validated introduction paragraph and the question « Souhaitez-vous que je
  vous appelle par votre prénom ? Si oui, lequel ? », then waits for the answer
  before any other initialization task.
- Coaching in English, confirm the first session opens the same way with the
  validated English message (« Welcome to your **career workspace**! »).
- Confirm every session (first or later, French or English) opens with the
  fixed line in italics *Lancement de la session…* (*Starting the session…*),
  directly followed by the welcome or the greeting: no other preamble, no
  mention of the instruction files, the procedure or its steps (« comme demandé
  par le CLAUDE.md », « Step 2: … »), and, when nothing changed, no sentence on
  the state of the initialization or configuration.
- Confirm the welcome is shown before the coach examines the rest of the
  workspace: only the first-session check (presence of
  `data/current-status.md`, then presence of the professional profile and of
  opportunity directories, without reading them) precedes it.
- After the answer, confirm the coach acknowledges it with the validated
  wording, creates the mandatory files, writes the choice into the new
  `data/config/workspace.yaml`, reports the creation in a single functional
  sentence (configuration, empty professional profile, external references,
  current status) and proposes to build the professional profile from the
  user's documents.
- Answer « oui » with a first name: `user.address_by_first_name` is `yes` and
  `user.first_name` holds the name; the next conversation starts with
  « Bonjour <prénom>. » and closing a session (« merci, au revoir ») gets
  « À bientôt, <prénom>. ». Answer « non »: the value is `no`, the next
  conversation starts with « Bonjour. » and the question is never asked again.
- Answer « oui » without a first name and confirm the coach asks which one.
- Ignore the question (answer with another request) and confirm the coach
  does not insist, records `ask_again`, asks once more at the next
  conversation, and records `no` if the question is ignored a second time.
- Confirm the first name is used only in the greeting, the acknowledgement of
  the choice and the farewell, over a whole work session (no « Nadia, … » in
  other messages).
- Starting from a workspace whose configuration has no `user` keys (for
  example extracted from an earlier version), confirm the keys are added with
  their template defaults (`unset`, empty first name) and that the coach asks
  the question once at session start, without the first-session welcome.
- Throughout a French session, confirm the coach calls the product « espace
  carrière » (never « workspace », « Career AI Workspace » or « espace de
  travail ») when talking to the user.
- Confirm the decision log holds two entries in the format defined by #13: the
  product and directory rename (type `PRODUCT`) and the adoption of « espace
  carrière » as the French functional term.
- Confirm the glossary distinguishes Career AI Toolkit, MyCareer Workspace,
  espace carrière, dossier professionnel, workspace (technical concept) and
  opportunité, and that the former « Mode workspace » entry is replaced by the
  single MyCareer Workspace entry.
- Confirm `docs/workspace-mode.md` no longer exists and that the user guide is
  delivered at the root of the workspace ZIP in two versions, `USER-GUIDE.md`
  (English) and `USER-GUIDE.fr.md` (French), linked to each other and from the
  matching workspace README. Their links stay valid once the ZIP is extracted
  outside the repository (none points to `docs/` or the repository), and no link
  still points to the old names.
- Confirm the build fails with a clear error when `workspace/USER-GUIDE.md` or
  `workspace/USER-GUIDE.fr.md` is missing, and that the ZIP then holds both
  guides at its root.
- Confirm `CONTRIBUTING.md` names the `mycareer-workspace` GitHub label instead
  of `workspace-mode`.
- Confirm `README.md`, `README.fr.md`, the workspace READMEs, `workspace/AGENTS.md`
  and `docs/architecture.md` present MyCareer Workspace and its vision
  (living professional profile, user ownership, privacy, persistence,
  portability, traceability, user validation) without putting AI first in the
  value proposition.

Edge cases:

- Confirm the first session is detected by the absence of
  `data/current-status.md`, without any marker file, unless the professional
  profile or an opportunity directory exists (possible loss: no welcome).
- Confirm the welcome message does not appear in a second session, nor when
  another mandatory file is deleted and recreated, nor when a possible loss is
  reported (professional profile deleted with sources kept).
- Confirm the documentation states that an existing workspace extracted as
  `career-ai-workspace/` keeps working and does not need to be renamed, the
  local directory name being free.
- Search the repository (outside `CHANGELOG.md`, `docs/test-history/` and the
  rename decision) for « Career AI Workspace », `career-ai-workspace`,
  `career-ai-test-kit`, « My Career Workspace » (with a space) and
  `my-career-workspace`: no remaining mention as the current product name.
- Confirm technical names kept as the workspace concept (`workspace/`,
  `init-workspace`, `workspace.yaml`) are unchanged, as decided in the issue.

Limit cases:

- Confirm historical documents (earlier `CHANGELOG.md` entries,
  `docs/test-history/`, earlier decision-log entries) are not rewritten.
- Confirm `test-kit/scenario.md` (A1 extraction example, B1 and B2 expected
  results) and `test-kit/tools/demo-script-header.md` use the new names, and
  that the generated demo script shows the welcome message in B1.

Non-regression:

- Replay « Build » (ZIP tree, `ENGINE-VERSION`, negative cases): only the root
  directory and archive names change, the ZIP file list is otherwise
  unchanged.
- Replay the first-session initialization (B1 to B3): the four mandatory files
  are still created, reported and never overwritten.
- Replay « Repository privacy ».

## Interview simulation joker (#18)

Nominal flow:

- During a simulation, write « joker, donne-moi un indice » and confirm the
  coach steps out of the interviewer role with a short line in italics, gives
  advice on the current question without writing the answer, steps back into
  the role with a line in italics and waits for the candidate's answer. After
  the return, the interviewer does not repeat or rephrase the question (at
  most « Je vous écoute. »). Exactly one exit line and one return line.
- During a simulation, write « joker, propose une réponse à ma place » and
  confirm the coach steps out of the role in italics, gives a proposed answer
  clearly labelled (**Réponse proposée (joker) :**), based only on the
  professional profile and the opportunity, with no warning or comment after
  it, signals in italics only what it had to assume (the line is absent when
  nothing was assumed), steps back into the role in italics, and that the
  interviewer then reacts as to a candidate answer (follow-up or next
  question).
- Confirm `transcript.md` marks the proposed answer as such, distinct from the
  candidate's answers, and records each advice joker as a short factual line
  without its coaching content (the transcript stays free of coaching).
- Confirm the debrief does not assess a proposed answer as the candidate's,
  assesses the answer given after advice, and states the number of jokers used
  as an indication, counted only from the transcript markers (« Jokers :
  aucun » when there are none).
- Confirm a formulation with the same meaning (« j'ai besoin d'un joker,
  … ») triggers the joker the same way, and that the English trigger
  (« joker » or « I need a joker ») works in an English simulation.

Edge cases:

- Write « joker » alone, or with an unclear request: confirm the coach steps
  out of the role in italics, asks whether the candidate wants advice or a
  proposed answer, then acts on the answer and steps back into the role in
  italics. Exactly one exit line and one return line; no other role
  announcement (no « Je reprendrai le rôle… ») and no repeated exit line after
  the candidate's answer.
- Write « joker », then, at the clarification question, « non, en fait c'est
  bon, pas besoin » (or a similar wording): confirm the coach steps back into
  the role in italics and waits for the answer without repeating the question,
  and that the cancelled joker is ignored everywhere: not counted, not
  mentioned in the debrief, not recorded in `transcript.md`.
- Outside a simulation (preparation, debrief), write « joker, donne-moi un
  indice »: confirm the coach says on a line in italics that the joker is only
  used during an interview simulation, then answers the request on the next
  line as an ordinary coaching request.
- Confirm « joker » inside an answer (not at the start of the first sentence)
  triggers nothing, and that the debrief neither comments nor flags it (no
  anomaly, no contradiction).

Limit cases:

- Use several jokers in the same simulation, including two in a row: no limit,
  the count in the debrief matches the transcript.
- With no relevant information in the profile or the opportunity for the
  question, confirm the proposed answer invents no fact and states what is
  assumed or missing.
- Confirm the decision on the « coach, not an answer generator » principle is
  recorded in `docs/design/decision-log.md` (format #13), and that the glossary
  holds a « Joker » entry (FR/EN).
- Confirm the user guides (`workspace/USER-GUIDE.md`,
  `workspace/USER-GUIDE.fr.md`) describe the joker, and that the simulation
  start reminder mentions it together with the stop keywords.

Non-regression:

- Replay the early stop (D5, D7): a stop request is still confirmed, a joker
  never ends the simulation, and a stop request right after a joker is
  confirmed as usual.
- Replay a debrief in a new conversation from the transcript (D8) with jokers
  used during the simulation.
- Confirm the demo script includes the joker steps and its total duration is
  updated.

## Privacy reminder and web browsing (#8)

Nominal flow:

- On the first session, after the candidate's answer to the first-name
  question, confirm the coach gives a brief privacy reminder once (check the
  AI tool's privacy settings, training on conversations, history and
  attachment retention, extra care with personal accounts), without blocking
  the work and without tool-specific procedure or guarantee.
- Confirm the reminder is not repeated in a second session, nor in a new
  conversation.
- With `privacy.allow_external_web_search: false` and no request, confirm the
  coach never browses on its own initiative.
- One-off exception, job offer link: give a fictional offer link instead of
  pasting the offer. Confirm the coach asks for or confirms the explicit
  agreement for this link only, then (if browsing is available) opens it,
  presents the extracted information for validation before writing it in
  `opportunity.md`, and traces the provenance (link, consultation date).
- One-off exception proposed by the coach: when a need appears (for example a
  company page useful to the session), confirm the coach proposes it, waits
  for the explicit agreement, and that the agreement does not turn browsing
  on permanently (the next need is proposed again).
- With the parameter set to `true`, confirm the coach may browse without
  asking each time, and still presents retrieved information for validation
  and traces its provenance.

Edge cases:

- The candidate refuses a proposed exception: confirm the coach does not
  browse and offers to paste the content or provide the file.
- Parameter missing from `workspace.yaml` (earlier version): confirm the coach
  adds it with `false` (existing missing-key rule), does not browse, and does
  not overwrite the file.
- Parameter unreadable (invalid value): confirm the coach uses `false` for the
  session, does not rewrite the file and reports it.
- Browsing unavailable in the tool (or fictional link that cannot be opened):
  confirm the coach says so, never claims to have consulted the resource and
  proposes pasting the content or providing the file.
- Retrieved information is never integrated into the professional profile or
  an opportunity before the candidate validates it.

Limit cases:

- The candidate asks for browsing in the middle of a simulation: confirm the
  rule is the same and the simulation is not broken.
- The candidate switches the parameter to `true` by hand: confirm the coach
  applies it from the next session (the sensitive-change alert remains in the
  backlog).
- The candidate supplies a link together with an explicit request to open it
  (« peux-tu lire cette offre en ligne ? »): confirm the coach does not ask
  again before browsing.
- The page of a job posting read from a link: confirm it is kept as a dated
  Markdown transcription under the opportunity's `sources/` (link and
  consultation date in its header), cited with the link in the Sources
  section of `opportunity.md`.
- An external reference consulted for the professional profile: confirm the
  update proposal states the link and consultation date, and that
  `data/profile/sources/external-references.md` records them.
- The exact messages (privacy reminder, agreement request, browsing
  impossible) are identical in `workspace/AGENTS.md`, `init-workspace/SKILL.md`
  and the master scenario.

Documentation:

- Confirm `docs/privacy.md` and the workspace READMEs (FR and EN) and user
  guides explain, in generic terms, how to protect the privacy of exchanges
  with the AI tool, with no tool-specific procedure and no guarantee, and
  explain the default browsing rule, its intention and how to set the
  parameter to `true` in the user's `data/config/workspace.yaml`.
- Confirm D-003 is reworded (one-off exception proposed or requested, always
  explicitly validated; open points settled or restated), and that the
  glossary and `CHANGELOG.md` are updated.
- Confirm the coach instructions (`workspace/AGENTS.md`, `CLAUDE.md`, skills)
  are consistent with each other on this rule.

Non-regression:

- Replay B1 to B5 (first session, second session, missing key, invalid value)
  and the Source transcription step with an attached offer: the reminder must
  not disturb the welcome sequence nor the existing flows.

## Regression

Repeat essential workspace scenarios after any change to the core coach instructions.
