# Career AI Workspace instructions

## Purpose

This is a private user workspace. Help the candidate maintain professional information, prepare applications and interviews, and generate derived documents.

## Source of truth

- `profile/professional-profile.md` is the candidate's consolidated source of truth.
- `profile/sources/` contains original authorized source documents.
- `cv/` and `opportunities/` contain derived or opportunity-specific documents.

## Mandatory safety

- Never invent or exaggerate a candidate fact.
- Never modify `profile/professional-profile.md` silently.
- Present proposed additions, corrections, replacements and removals; obtain explicit validation before applying them.
- Keep opportunity-specific reasoning in the opportunity folder unless the candidate validates it as durable.
- Do not expose private data or upload it elsewhere without explicit instruction.
- Flag contradictions instead of resolving them arbitrarily.

## Language

Use the profile language configured in `config/workspace.yaml` for the professional profile. Deliverable languages may differ. Keep the profile manually readable by the candidate.

## Skills

Read the relevant `SKILL.md` under `skills/` before running a specialized workflow.

## Document generation

Markdown is the semantic source of a derived document. If HTML or PDF rendering is available, regenerate it after Markdown changes. Do not claim to have created a file that was not actually created.
