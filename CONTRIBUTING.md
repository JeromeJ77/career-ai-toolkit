# Contributing

Version 0.3 is a pilot. Keep contributions small, testable, and aligned with validated user needs.

1. Read `AGENTS.md`, `BACKLOG.md`, and `docs/test-plan.md`.
2. Never use real candidate data in examples or tests.
3. Use the fictional Principal Architect scenario for demonstrations.
4. Update documentation and `CHANGELOG.md` when behavior changes.
5. Do not add installation, update, or CV-generation complexity without a validated pilot need.

## Backlog and workflow

Ideas that are not yet engaged live in `BACKLOG.md`. Committed work is tracked
in GitHub Issues and prioritized on the project board.

1. **Idea**: add it to `BACKLOG.md`, or open an issue if it is already clear.
2. **Grooming**: turn the idea into an issue with context, an objective and
   acceptance criteria, then remove it from `BACKLOG.md`. Set `Priority` and
   `Size` on the project board and, if it is planned, a milestone.
3. **Ready**: keep only 3 to 5 items in *Ready*. Work on the top item by priority.
4. **In progress**: work on a branch and open a pull request that references the
   issue with `Fixes #<number>`.
5. **In review**: check the change against `docs/test-plan.md`, update
   documentation and `CHANGELOG.md`, then merge.
6. **Done**: the issue closes with the pull request.

Board columns: Backlog, Ready, In progress, In review, Done.

### Labels

- Type: `bug`, `enhancement`, `documentation`, `question`, `accessibility`.
- Scope: `standalone-mode`, `workspace-mode`, `skill`.
- Source: `pilot-feedback` for feedback from pilot testers.
- Closing reasons: `duplicate`, `invalid`, `wontfix`.

### Priority

- **P0**: blocks users or risks exposing personal data; handle first.
- **P1**: planned for the next release.
- **P2**: valuable, but can wait for pilot feedback.

### Size

- **S**: a small documentation or wording change.
- **M**: a change across several files with test-plan updates.
- **L**: new behavior, or a change that affects persisted workspace files.

Issues and the board are public. Never paste real resumes, job descriptions,
interview notes or contact details into an issue; use synthetic examples.
