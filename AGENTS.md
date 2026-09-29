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
- Check `BACKLOG.md` before adding out-of-scope features. Add newly identified,
  uncommitted ideas when they need later grooming, and keep them distinct from
  work already tracked in GitHub Issues. When an idea is groomed into an issue,
  remove it from the backlog as described in `CONTRIBUTING.md`.
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
