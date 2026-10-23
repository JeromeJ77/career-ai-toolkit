# Instructions for AI agents

## Repository purpose

This repository contains the generic Career AI Toolkit. It must remain free of real candidate data.

## Mandatory rules

- Never add real resumes, certifications, job descriptions, interview notes, contact details, or other personal data.
- Treat `workspace/` as a distributable generic workspace template, not as a personal workspace.
- Treat `examples/` as synthetic data only.
- Keep French-first pilot usability while maintaining simple English technical paths and metadata.
- Never stage changes (`git add`, `git rm`, `git mv`, `git stash`, or any command that modifies the index) and never commit unless the user explicitly asks. Leave every modification in the working tree so that the user can review it and stage it themselves. When a file must be moved or removed, use plain file operations rather than Git commands.
- At the end of a piece of work, after the summary, propose a ready-to-copy commit message; never commit it yourself unless the user explicitly asks. Keep it succinct: Conventional Commits in English, the summary line alone for a small fix, otherwise at most a few short bullets, then `Refs #N` (or `Closes #N`) and the `Co-Authored-By` trailer of the model used.
- Update `CHANGELOG.md` for user-visible changes.
- Before preparing a release, run the release pass described in the test strategy (`docs/test-plan.md`); record the tests actually performed in `docs/test-history/` and their outcome in the test dashboard (`docs/test-log.md`).

## Test coverage and versioning

The test strategy is `docs/test-plan.md` (in French). It relies on four
layers: requirements (`docs/requirements/`, one rule per requirement, model
and rules in its `README.md`), tests (steps of the master scenario
`test-kit/scenario.md` and checks of `docs/checks.md`, each citing the
requirements it verifies in its « Exigences » line), history (one file per
test session under `docs/test-history/`) and the test dashboard
(`docs/test-log.md`, one row per tracked requirement).

- Before starting an issue, read in the dashboard the requirements of the
  affected domains that are « À revalider », « Problème constaté » or « Non
  testé », and report them to the user. Do not decide silently to ignore them.
- Start every issue with its requirements, in the manner of
  acceptance-test-driven development: add the new rules as requirements with
  the status 🔵 Proposée, or modify active requirements, with the issue
  number `#N` in their Origin. Never delete, reuse or renumber a requirement:
  a replaced or abandoned one keeps its entry, with ⚪ Remplacée par REQ-… or
  ❌ Abandonnée. Proposed requirements become ✅ Active when the issue is
  delivered. Then add or adjust the scenario steps or checks that cite them,
  and add or update their dashboard rows (« Non testé », or « À revalider »
  for a modified requirement). Review the requirements and tests with the
  user before development.
- At the same time, check that the test kit (`test-kit/`: fictional sources and
  master scenario `scenario.md`) and the fictional example under `examples/`
  make the new behavior testable and demonstrable. Complete the fictional
  sources and add or adjust the scenario steps in the same change, tagging the
  steps kept for the demo with `[demo]` and those of a pilot's essential path,
  replayed in the quick pass before a release, with `[socle]`. If a feature cannot be demonstrated
  with the kit, report the gap explicitly to the user instead of ignoring it.
- Once the requirements and tests are reviewed, write the implementation plan
  in `plans/issue-<N>.md` (ignored by Git) so that a new conversation can
  carry out the implementation from it alone. The plan names the impacted
  requirements by identifier and lists the one-off delivery checks (decision
  entry, documentation, `CHANGELOG.md`, GitHub issue) in a checklist: they are
  not requirements. Give the user an assessment of the implementation
  complexity (low, medium or high, with the main reasons) and recommend the
  model to use for the implementation. A change to the coach's behavior
  (`workspace/AGENTS.md`, skills) is never assessed as low complexity. For
  every new message to the candidate, the plan states whether it is fixed
  wording or described by its required content, with the reason under D-022:
  fixed wording only for a marker the candidate recognizes from one session
  to the next, given in every supported coaching language. The choice goes
  into the Message field of the requirement.
- At the end of the implementation, the implementation conversation appends a
  report to the plan: what was done, what the agent verified, what remains
  untested, deviations from the plan and points to review. The user then
  commits the implementation as a checkpoint and returns to the analysis
  conversation for the review of the changes. The analysis conversation records
  the required corrections in the plan; the implementation conversation carries
  them out in a second pass, committed separately. Manual tests start only once
  the review is satisfactory, so that corrections do not invalidate them; the
  user then debriefs them in the analysis conversation. A manual pass can be
  guided by the project skill `/prompteur` (`.claude/skills/prompteur/`), run
  in a test conversation opened in the repository: it gives the steps one by
  one, checks the test workspace files and the coach's traces, and drafts the
  test session and the dashboard update.
- During development, revisit the requirements and tests to catch forgotten
  cases and add the ones discovered.
- Record only tests actually performed. Each test session is a dated file
  under `docs/test-history/` (`YYYY-MM-DD-short-subject.md`, with `-2`, `-3`
  for a repeat of the same session on the same day), linked from the
  dashboard's « Sessions » index, never rewritten afterwards. It states the
  date, and times only when they were actually recorded, and cites the tests
  played by their identifier: step code (`B2`), prompt sub-identifier (`C4.2`)
  or check (`CHK-BLD-03`). Then update the dashboard rows of the requirements
  those tests cite: « Validé » only when all the tests that cite the
  requirement have passed on a version later than its last change,
  « Problème constaté » when one of them failed. Never mark a behavior as
  validated by inference. The dashboard and the sessions are written in
  French.
- When a change may have impacted a requirement already « Validé », set it
  back to « À revalider » and add it to the dashboard's « À revalider »
  section with « impacté par #N » and a short reason. This targeted
  regression check replays the tests that cite the impacted requirements
  before the release, not necessarily before each commit.
- Before a commit, list the dashboard requirements that are not « Validé »
  as an informational reminder (it does not block the commit), and run
  `test-kit/tools/check_traceability.ps1` when the commit touches the
  requirements, the scenario, the checks or the dashboard: no error may
  remain.
- When asked to prepare a release, run the release pass of the test strategy
  and the traceability script, re-check the whole dashboard, warn explicitly
  about every requirement that is not « Validé » and list them, then let the
  user decide whether to replay them or to release anyway. Never mark them
  validated yourself.
- `VERSION` holds the release in progress, with the `-dev` suffix (for example
  `0.4.0-dev`) from the first development work of a release. It must never stay
  on an already released version. Remove the suffix only when preparing the
  release.

## Project knowledge maintenance

- Treat `docs/glossary.md` as the reference for French and English domain
  terminology. Update it when a change introduces, renames or materially
  clarifies a project term. Keep undecided terms explicitly provisional rather
  than presenting them as canonical.
- Record structural or behavioral decisions whose rationale should survive the
  implementation in `docs/design/decision-log.md`, using the entry template
  documented at the top of that file: type, status, date, context, options
  considered, decision and intention, consequences and reassessment
  conditions (write "Aucune identifiée" when there are none). Never
  reconstruct alternatives that were not actually studied; do not add trivial
  implementation details.
- Follow the complete idea intake and grooming workflow in `CONTRIBUTING.md`.
  Capture every new idea in `BACKLOG.md` before grooming or issue creation,
  including ideas supplied as text, images or scans. Normalize them in French,
  preserve the author's meaning and information, and flag unreadable or
  ambiguous input instead of guessing.
- Keep idea capture, candidate-issue planning and backlog cleanup as three
  distinct traceable commits. Do not begin grooming until the user has reviewed
  the normalized ideas and the capture commit exists in Git history. If the
  agent has not been asked to commit, stop after review and ask the user to
  create or authorize that checkpoint.
- During grooming, check the complete backlog, existing GitHub Issues, the
  glossary, the decision log and relevant canonical documentation for overlap,
  contradictions, feasibility questions and dependencies. The user owns release
  scope; challenge it constructively but do not silently decide it.
- Split only the confirmed release scope into candidate issues. Review each
  concise candidate-issue table with the user and commit the confirmed table as
  a second checkpoint before drafting full issues. Review each issue's full
  title and body with the user and obtain explicit approval before creating it
  in GitHub. After successful issue creation, remove only the covered ideas from
  the backlog and commit that cleanup as the third checkpoint. Leave deferred
  or unresolved ideas in the backlog.
- Keep the glossary, decision log, backlog and affected canonical documentation
  synchronized in the same change when a term, decision or scope change is
  established. When it is still being discussed, preserve the uncertainty or
  propose the documentation update instead of silently deciding it.
- Record in `docs/lessons-learned.md`, as they occur, the difficulties met
  during the project, notably getting the coach to say or do precisely what is
  intended. Use the numbered `L-XXX` entry template documented at the top of
  that file, with links to issues, decisions and other entries, and keep its
  « Enseignements » summary up to date. Add entries when debriefing manual
  tests or reviewing an implementation, including analysis mistakes, and
  update their status when the verifying test is replayed. The file is written
  in French.

## Instructions as AI source code

`workspace/AGENTS.md`, `workspace/CLAUDE.md` and the skills under
`workspace/skills/` (`SKILL.md`, references and templates) define how the coach
behaves. Treat them as the toolkit's "AI source code", not as plain
documentation.

- A change to the coach's behavior is a functional change: use `feat`, `fix`
  or `refactor` in the commit type, with a scope such as `coach` or `skill`.
  Reserve `docs` for documentation that does not alter how the coach behaves
  (README, glossary, decision log, requirements, test strategy, backlog).
- Keep `workspace/AGENTS.md` and the skills consistent with each other, and
  update the affected requirements, the master scenario and `CHANGELOG.md`
  in the same change.
- Before writing or changing coach instructions, read the « Enseignements »
  section of `docs/lessons-learned.md` and apply it.

## Sources and derived artifacts

- Source workspace template: `workspace/`
- Build outputs: `dist/` (never commit)
- Product feedback templates: `workspace/skills/product-feedback/assets/feedback-log.template.md` and `workspace/skills/product-feedback/assets/product-feedback.template.md`

## Build behavior

`build.bat` must only package source content. It must never install files, modify personal folders, access the network, or include the fictional example or the test kit inside the workspace artifact. It packages the test kit as a separate ZIP (fictional sources already generated and committed, plus the demo script extracted from the master scenario) and never calls the source generation script under `test-kit/tools/`.
