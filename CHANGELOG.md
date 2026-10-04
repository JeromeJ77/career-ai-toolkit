# Changelog

## [Unreleased]

### Added

- The workspace ZIP now contains an `ENGINE-VERSION` file at its root, generated
  by the build from `VERSION`, so that the installed engine version can be
  identified (a v0.3.0 workspace has none). The coach does not use it yet.
- Added a French/English business glossary covering the current domain model
  and clearly separating provisional terms that still require grooming.
- Added a design decision log to preserve the rationale and open questions
  behind structural and behavioral choices. Its entry template now includes a
  Type, the options considered and the reassessment conditions, with a new
  « ❌ Rejetée » status; entries D-001 to D-014 are migrated to it (#13).
- Added the `init-workspace` skill: on first use the coach creates each missing
  mandatory file (`workspace.yaml`, `professional-profile.md`,
  `external-references.md`, `current-status.md`) under `data/` from templates in
  `skills/init-workspace/assets/`, without ever overwriting an existing file.
  Keys missing from an existing `workspace.yaml` are appended with their
  template defaults and reported; invalid values are never rewritten, only
  reported to the candidate.
- The interview coach now transcribes each profile source added under
  `data/profile/sources/` to a Markdown file next to the untouched original
  (asking first for very large sources), and records public links found in
  sources (for example a LinkedIn PDF export) in `external-references.md`. The
  professional profile is still updated only after the candidate validates the
  proposed changes.
- Added `docs/test-log.md`, a French working log of the tests actually
  performed (first and last test dates, targeted non-regression tracking), and
  the process rules for it in `AGENTS.md`.
- Added `test-kit/`: a fictional developer candidate (CV, LinkedIn export,
  certificate and career notes as PDF and DOCX generated from Markdown
  references), two fictional opportunities (one job posting in English) and a
  master scenario listing every test and demo step with its prompts, keywords,
  files and expected result. The build now produces a second ZIP,
  `career-ai-test-kit-v<version>.zip`, with the fictional sources and a demo
  script of 35 to 40 minutes extracted from the `[demo]` steps and reduced to
  what the presenter does and says (no expected results, test references or
  steps waiting for an undelivered issue). The workspace ZIP still contains no
  fictional data.
- The tester guide offers a Teams meeting transcription as a lighter
  alternative to the voice scribe for experienced testers.
- Test sessions are now one dated file each under `docs/test-history/`, linked
  from the « Sessions » index of `docs/test-log.md`, which keeps only the
  coverage summary; the three existing sessions were migrated unchanged.
- Added `test-kit/guide-testeur.md`, shipped in the test kit ZIP: how to run the
  scenario, record results per step (including voice notes with a scribe
  assistant and a ready-to-paste prompt) and prepare the test log and report.
- Added `examples/fictitious-developer/data/`, the `data/` tree produced by the
  first complete run of the master scenario (2026-10-02) on the fictional
  developer: professional profile with transcribed sources, two opportunities
  with rounds, simulations, debriefs, preparation sheet and real-interview
  review. Reviewed before commit; never included in the workspace ZIP.
- `AGENTS.md` and `CONTRIBUTING.md` now require every new development to keep
  the test kit, the master scenario and the fictional example able to test and
  demonstrate it, in the same change.

### Removed

- Removed the fictional Principal Architect example. `examples/` will hold the
  `data/` tree of the fictional developer workspace, copied on request from a
  run of the master scenario.

### Changed

- Fixed a regression found in the first full scenario run: when a mandatory
  file is missing but other user data shows it already held content (for
  example a deleted professional profile while the status says it was filled),
  the coach no longer recreates it from its template; it reports a possible
  loss and asks whether to rebuild, restore or check a synchronization.
- At session start the coach reads the professional profile, so it knows
  whether it is filled, and corrects a status that contradicts the files.
- Profile sources can be attached to the conversation or pasted, as for
  opportunities: the coach states the three ways to provide them when none is
  available, places an unchanged copy of each attached file in the matching
  `data/profile/sources/` subdirectory, says where, then transcribes it.
- `opportunity.md` is written in the coaching language (`language.coaching`)
  whatever the source language, with faithful translation, proper names and the
  official job title kept, and the source language stated; transcriptions keep
  the original language word for word (decision D-014).
- The coach creates `sources/` with each opportunity, states the three ways to
  provide a document (copy, attachment, pasted text) and transcribes PDF or DOCX
  originals to Markdown next to them, as for profile sources.
- Strategic messages: the coach recalls what a strategic message is, labels
  them as proposed for this opportunity, and keeps withdrawn or invalidated
  messages with their reason in `analysis.md` instead of deleting them.
- Simulations: a stop keyword now asks for confirmation, since stopping is
  final; each simulation is independent from the previous ones, which the coach
  mentions only from the second simulation of a round, never presenting the
  preparation as a simulation; every exit from and return to the interviewer
  role is marked by a short line in italics; before a new simulation the coach
  asks whether to replay the same case or another one.
- The round's `interview.md` is kept up to date during preparation,
  simulations and debriefs; the opportunity status points to it for the
  round's detail.
- Interview preparation is coaching, not a simulation: the coach never plays an
  interviewer or uses role markers while preparing. The round's `interview.md`
  shows preparation in progress as soon as it starts, distinct from the
  preparation sheet generated at the end.
- Simulations: with several interviewers, only one asks a question per turn;
  every new stop request is confirmed, even right after resuming the role.
- In French the coach says « dossier professionnel », never « profil
  professionnel », and reports dates as recorded, with consistent wording.
- Questions for the interviewers suggested by the coach are presented as its
  suggestions. The preparation sheet's first page no longer holds vigilance
  points or communication reminders (it may be seen by the interviewers); the
  second page is for notes and detail starts on the third page (workspace
  skills and standalone coach).
- Test kit: renamed `sources/opportunity/` to `sources/opportunities/`, added a
  49-page fictional training booklet for the large-source step, and gave every
  scenario step a **Conversation** field (new conversation or continuation).
  Scenario prompts and expectations were aligned with the first full run.
- Before generating the interview preparation sheet, the coach now checks
  whether questions for the interviewers were worked on for the round, says so
  if not and asks the candidate whether to review them first; a refusal still
  produces the sheet with empty question sections (workspace skill and
  standalone coach).
- Separated the replaceable engine from user data: the private folders and the
  former root `current-status.md` moved under `data/`, which contains only
  `README.md` files in the ZIP. `pilot-feedback.md` is created on request from a
  single template (`docs/pilot-feedback.template.md` removed). `build.bat` now
  fails if `data/` holds anything but `README.md` files, if the workspace root
  holds unexpected entries, or if the engine holds initialized working files.
  Upgrading from v0.3 requires moving existing folders under `data/`.
- `VERSION` is now `0.4.0-dev`; the `-dev` suffix stays until the release is
  prepared. The standalone header and the pilot feedback template follow it.
- Extended `docs/test-plan.md` for the new structure, first-use initialization,
  configuration keys, source transcription and profile inconsistencies, and
  linked it to the test log.
- Unified and documented the simulation depths (Court/short, Standard,
  Approfondi/deep) with approximate durations and question counts, added stop
  keywords (« stop », « arrête la simulation », « arrêtons l'interview »,
  « end the simulation ») with confirmation for unclear intent, and described the immediate debrief
  and follow-up simulation path in standalone and workspace modes.
- Made the coaching principle explicit in the READMEs, standalone coach,
  workspace instructions, interview-coach skill and design documentation:
  the toolkit is a coach, not an answer generator.
- Formalized a three-checkpoint idea intake and grooming workflow that preserves
  reviewed raw ideas and the confirmed candidate-issue plan before creating
  GitHub issues and cleaning the backlog.

## [0.3.0] - 2026-09-27

### Changed

- Included Markdown-based AI skill sources in GitHub language statistics.
- Made the workspace the durable reference between focused coaching sessions,
  replacing the previous recommendation to keep one conversation per
  opportunity.
- Made the coach responsible for creating and progressively maintaining
  opportunity, interview, simulation and actual-interview artifacts.
- Replaced the iterative workflow design notes with a canonical design
  reference and definitive Mermaid domain model; deferred compatibility,
  migrations and reasoning metadata until after the real end-to-end test.
- Expanded the pilot protocol and feedback form around coach-managed structure,
  cross-conversation resume behavior and evidence-based debriefing.
- Migrated the fully fictional example to the canonical v0.3 opportunity,
  interview, simulation and actual-interview structure.

### Added

- Added a minimal root `current-status.md`, an opportunity status template and
  explicit coach responsibilities for reading and maintaining both levels.
- Added canonical `opportunity.md`, separate `analysis.md` and round-level
  `interview.md` templates, stable three-digit opportunity numbering, two-digit
  interview numbering and source-preservation rules.
- Documented the complete workspace tree, distinguishing distributed template
  files from artifacts created progressively by the coach.
- Added an independent simulation-debrief workflow and template that work from
  persistent evidence in a later conversation and disclose missing evidence.

## [0.2.0]

### Changed

- Expanded documentation with Mermaid diagrams for architecture, document
  lifecycle, use cases, pilot workflow and per-opportunity conversation scope.
- Clarified the opportunity workflow: CV generation is independent from
  opportunity work, strategic positioning is reviewed before simulations, real
  interviews are debriefed, and preparation sheets are kept per interview
  round.
- Refined minor wording and agreement details in the fictional Principal
  Architect example.

## [0.1.0]

### Added

- Standalone interview coach.
- Portable private workspace template.
- Professional-profile initialization and controlled update workflow.
- Interview preparation, simulation, debriefing, and post-interview reflection workflow.
- Progressive interview preparation sheet specification.
- Fictional Principal Architect example.
- Developer test plan and optional anonymized pilot-feedback form.
- Windows build script producing versioned release artifacts.
