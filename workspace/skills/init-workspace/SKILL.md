---
name: init-workspace
description: Initialize the user data under data/ on first use. Create missing mandatory files (workspace.yaml, professional-profile.md, external-references.md, current-status.md) from the engine templates without overwriting anything. Use at the start of any session before another skill reads user data, and when the candidate asks to fill in the optional pilot feedback form.
---
# Initialize the workspace

The engine (`skills/`, `AGENTS.md`, `CLAUDE.md`, READMEs) is replaceable. User data lives only under `data/` and is never overwritten by the engine.

## Mandatory files

| File to create | Template |
|---|---|
| `data/config/workspace.yaml` | `assets/workspace.template.yaml` |
| `data/profile/professional-profile.md` | `assets/professional-profile.template.md` |
| `data/profile/sources/external-references.md` | `assets/external-references.template.md` |
| `data/current-status.md` | `assets/current-status.template.md` |

`data/feedback/pilot-feedback.md` is optional. Create it from `assets/pilot-feedback.template.md` only when the candidate asks for it.

## First use

Run this check at the start of a session, before another skill reads user data.

1. For each mandatory file, check whether it exists under `data/`.
2. Before creating a missing file, check whether other user data shows it already held content: `data/current-status.md` says it was initialized or filled, or other files depend on it (for example transcribed sources or opportunities for a missing professional profile). In that case it is a possible loss, not a first use: do not recreate it. Tell the candidate which file is missing and why it looks lost, and ask whether to rebuild it from the sources, restore a copy or check a synchronization tool. Act only on their answer.
3. Create only the other missing files by copying their template. Create missing parent directories. Never overwrite, rewrite or reformat an existing file, even if it looks empty or outdated (the only exception is appending missing keys to `workspace.yaml`, step 5).
4. Do not fill in the professional profile silently. A profile created from its template is an empty skeleton; populate it only through the interview-coach "Initialize the professional profile" workflow, with the candidate's validation.
5. Compare `data/config/workspace.yaml` with `assets/workspace.template.yaml`. If keys from the template are missing, append each one with its template default value at its place in the structure. Do not change, reorder or remove any existing key, value or comment.
6. Tell the candidate which files were created and which configuration keys were added (with their default values), in one short sentence each. Say nothing when nothing was created, added or found missing.

A missing file is created individually and a missing key is added individually, so a partial or interrupted initialization is repaired on the next session.

## Rules

- Do not use a marker file to detect first use: the absence of a mandatory file is the signal, unless other user data shows the file already held content (step 2).
- A missing key is added with its default value and reported, as described in steps 5 and 6.
- If an existing key has an invalid value (for example a non-boolean where a boolean is expected, or an unsupported language) or the file is malformed, never rewrite it. Use the template default value for the session, tell the candidate which key, which value was found and which default is used, and let them correct the file.
- Never copy real candidate data into `assets/`; templates stay generic.
- If a mandatory file exists but cannot be read, report it and stop; do not replace it.
