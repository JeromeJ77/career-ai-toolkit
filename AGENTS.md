# Instructions for AI agents

## Repository purpose

This repository contains the generic Career AI Toolkit. It must remain free of real candidate data.

## Mandatory rules

- Never add real resumes, certifications, job descriptions, interview notes, contact details, or other personal data.
- Treat `workspace/` as a distributable generic workspace template, not as a personal workspace.
- Treat `examples/` as synthetic data only.
- Keep French-first pilot usability while maintaining simple English technical paths and metadata.
- Never stage changes (`git add`, `git rm`, `git mv`, `git stash`, or any command that modifies the index) and never commit unless the user explicitly asks. Leave every modification in the working tree so that the user can review it and stage it themselves. When a file must be moved or removed, use plain file operations rather than Git commands.
- Update `CHANGELOG.md` for user-visible changes.
- Run the checks in `docs/test-plan.md` before preparing a release, and record the tests actually performed and their outcome in `docs/test-log.md`.

## Test coverage and versioning

- Before starting an issue, compare `docs/test-log.md` with `docs/test-plan.md`:
  identify plan items that are not covered, not tested or to be revalidated, and
  report the gaps to the user. Do not decide silently to ignore them.
- Start every issue by updating `docs/test-plan.md` and `docs/test-log.md` with
  the scenarios the change must satisfy (nominal flow, edge cases, limit cases,
  non-regression), recorded as « Non testé » and reviewed with the user before
  development, in the manner of acceptance-test-driven development.
- At the same time, check that the test kit (`test-kit/`: fictional sources and
  master scenario `scenario.md`) and the fictional example under `examples/`
  make the new behavior testable and demonstrable. Complete the fictional
  sources and add or adjust the scenario steps in the same change, tagging the
  steps kept for the demo with `[demo]`. If a feature cannot be demonstrated
  with the kit, report the gap explicitly to the user instead of ignoring it.
- Once the scenarios are reviewed, write the implementation plan in
  `plans/issue-<N>.md` (ignored by Git) so that a new conversation can carry
  out the implementation from it alone. Give the user an assessment of the
  implementation complexity (low, medium or high, with the main reasons) and
  recommend the model to use for the implementation. A change to the coach's
  behavior (`workspace/AGENTS.md`, skills) is never assessed as low complexity.
  The final verification and the analysis of manual tests may return to the
  analysis conversation.
- During development, revisit these scenarios to catch forgotten cases and add
  the ones discovered.
- Record in `docs/test-log.md` only tests actually performed. Never mark a
  behavior as validated by inference; a later change to the coach's behavior
  makes the affected tests « À revalider ». The log is written in French.
  `docs/test-log.md` holds the coverage summary; each test session is a dated
  file under `docs/test-history/` (`YYYY-MM-DD-short-subject.md`, with `-2`,
  `-3` for a repeat of the same session on the same day) linked from the log's
  « Sessions » index. The file itself states the date, and times only when
  they were actually recorded.
- When a change may have impacted a scenario already marked « Validé », set it
  back to « À revalider » in `docs/test-log.md` with the remark
  « Non-régression : impacté par #N » and a short reason. This targeted
  non-regression check is replayed before the release, not necessarily before
  each commit. Keep the first and last test dates of each zone up to date.
- Before a commit, list the zones of `docs/test-log.md` that are not « Validé »
  (« À revalider », « Non testé », « Problème constaté ») as an informational
  reminder. It does not block the commit.
- When asked to prepare a release, re-check the whole coverage in
  `docs/test-log.md` against `docs/test-plan.md` first. Warn explicitly about
  every zone that is not « Validé » and list them, then let the user decide
  whether to replay them or to release anyway. Never mark them validated
  yourself.
- `VERSION` holds the release in progress, with the `-dev` suffix (for example
  `0.4.0-dev`) from the first development work of a release. It must never stay
  on an already released version. Remove the suffix only when preparing the
  release. Keep the version in the pilot feedback template equal to `VERSION`.

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

## Instructions as AI source code

`workspace/AGENTS.md`, `workspace/CLAUDE.md` and the skills under
`workspace/skills/` (`SKILL.md`, references and templates) define how the coach
behaves. Treat them as the toolkit's "AI source code", not as plain
documentation.

- A change to the coach's behavior is a functional change: use `feat`, `fix`
  or `refactor` in the commit type, with a scope such as `coach` or `skill`.
  Reserve `docs` for documentation that does not alter how the coach behaves
  (README, glossary, decision log, test plan, backlog).
- Keep `workspace/AGENTS.md` and the skills consistent with each other, and
  update `docs/test-plan.md` and `CHANGELOG.md` in the same change.

## Sources and derived artifacts

- Source workspace template: `workspace/`
- Build outputs: `dist/` (never commit)
- User feedback template: `workspace/skills/init-workspace/assets/pilot-feedback.template.md`

## Build behavior

`build.bat` must only package source content. It must never install files, modify personal folders, access the network, or include the fictional example or the test kit inside the workspace artifact. It packages the test kit as a separate ZIP (fictional sources already generated and committed, plus the demo script extracted from the master scenario) and never calls the source generation script under `test-kit/tools/`.
