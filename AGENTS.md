# Instructions for AI agents

## Repository purpose

This repository contains the generic Career AI Toolkit. It must remain free of real candidate data.

## Mandatory rules

- Never add real resumes, certifications, job descriptions, interview notes, contact details, or other personal data.
- Treat `workspace/` as a distributable generic workspace template, not as a personal workspace.
- Treat `examples/` as synthetic data only.
- Keep French-first pilot usability while maintaining simple English technical paths and metadata.
- Refer to `BACKLOG.md` before adding out-of-scope v0.3 features.
- Update `CHANGELOG.md` for user-visible changes.
- Run the checks in `docs/test-plan.md` before preparing a release.

## Sources and derived artifacts

- Source standalone instructions: `standalone/interview-coach-standalone.md`
- Source workspace template: `workspace/`
- Build outputs: `dist/` (never commit)
- User feedback template: `docs/pilot-feedback.template.md`

## Build behavior

`build.bat` must only package source content. It must never install files, modify personal folders, access the network, or include the fictional example inside the workspace artifact.
