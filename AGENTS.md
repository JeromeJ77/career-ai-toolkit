# Instructions for AI agents

## Repository purpose

This repository contains the generic Career AI Toolkit. It must remain free of real candidate data.

## Mandatory rules

- Never add real resumes, certifications, job descriptions, interview notes, contact details, or other personal data.
- Treat `workspace/` as a distributable generic workspace template, not as a personal workspace.
- Treat `examples/` as synthetic data only.
- Keep French-first pilot usability while maintaining simple English technical paths and metadata.
- Update `CHANGELOG.md` for user-visible changes.
- Run the checks in `docs/test-plan.md` before preparing a release.

## Project knowledge maintenance

- Treat `docs/glossary.md` as the reference for French and English domain
  terminology. Update it when a change introduces, renames or materially
  clarifies a project term. Keep undecided terms explicitly provisional rather
  than presenting them as canonical.
- Record structural or behavioral decisions whose rationale should survive the
  implementation in `docs/design/decision-log.md`. Include their status,
  intention, consequences and open questions when relevant; do not add trivial
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

## Sources and derived artifacts

- Source standalone instructions: `standalone/interview-coach-standalone.md`
- Source workspace template: `workspace/`
- Build outputs: `dist/` (never commit)
- User feedback template: `docs/pilot-feedback.template.md`

## Build behavior

`build.bat` must only package source content. It must never install files, modify personal folders, access the network, or include the fictional example inside the workspace artifact.
