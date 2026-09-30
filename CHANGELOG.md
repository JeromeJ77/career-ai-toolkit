# Changelog

## [Unreleased]

### Added

- Added a French/English business glossary covering the current domain model
  and clearly separating provisional terms that still require grooming.
- Added a design decision log to preserve the rationale and open questions
  behind structural and behavioral choices.
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

### Changed

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
