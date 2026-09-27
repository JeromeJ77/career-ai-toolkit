# Changelog

## [Unreleased]

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
