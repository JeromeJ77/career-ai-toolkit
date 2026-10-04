# Contributing

Version 0.3 is a pilot. Keep contributions small, testable, and aligned with validated user needs.

1. Read `AGENTS.md`, `BACKLOG.md`, and `docs/test-plan.md`.
2. Never use real candidate data in examples or tests.
3. Use the fictional developer scenario of `test-kit/` for tests and demonstrations.
4. Update documentation and `CHANGELOG.md` when behavior changes.
5. Do not add installation, update, or CV-generation complexity without a validated pilot need.

## Idea intake and grooming

Ideas that are not yet engaged live in `BACKLOG.md`. Work selected and defined
for implementation is tracked in GitHub Issues and prioritized on the project
board. Always preserve a reviewed backlog snapshot before converting ideas into
issues, even when an incoming idea already appears clear.

### 1. Capture and normalize new ideas

New ideas may arrive as free-form text, conversation notes, screenshots, images
or scans.

1. Extract all useful information from the supplied material. For an image or
   scan, mark unreadable or uncertain text explicitly instead of inventing it.
2. Rewrite the ideas as clear French under `New ideas (grooming necessary)` in
   `BACKLOG.md`. Correct spelling and structure, but preserve the author's
   wording, nuance, examples, doubts and open questions as closely as possible.
3. Align terms with `docs/glossary.md`. Do not use this phase to merge away,
   prioritize, reject or silently resolve ideas.
4. Ask the author to review the normalized text and confirm that no information
   or intent was lost.
5. After approval, create the dedicated capture commit when explicitly asked,
   or ask the author to create it. Do not continue to grooming until the commit
   exists in Git history. A suitable message is
   `docs(backlog): capture <topic> ideas`.

The committed text is the traceable raw-idea checkpoint. It is normalized for
readability, but it is not yet a commitment, design decision or implementation
scope. Source images or scans do not need to be committed; never commit them if
they contain personal or confidential data.

### 2. Analyze and select a release scope

Start from the committed capture and review:

- the complete backlog, not only the new section;
- existing open and closed GitHub Issues;
- the glossary and decision log;
- relevant architecture, workflow and product documentation.

Analyze duplicate or related items, possible contradictions, confirmed need,
feasibility, risks, missing decisions and implementation dependencies. Propose
an ordering when one idea enables or constrains another.

Classify each new idea with the author as:

- selected for the target release;
- deferred for later grooming;
- still requiring clarification.

The author owns the release decision. The agent should challenge the proposed
scope for consistency and risk, but must not silently assign an idea to a
release.

Once the release scope is confirmed, split only that scope into coherent
candidate issues. At this point, keep the representation concise: add a
temporary synthesis table at the beginning of the new-ideas section with the
provisional title, objective, covered backlog items, priority, estimated size
and dependencies. Present this table to the author and obtain confirmation
before drafting the first full issue.

After confirmation, create the second repository checkpoint when explicitly
asked, or ask the author to create it. Do not continue to detailed issue review
until this commit exists in Git history. A suitable message is
`docs(backlog): plan <release> candidate issues`.

The table remains a temporary backlog structure, but this commit preserves the
agreed release scope, issue boundaries and dependencies after the table is
removed during cleanup. Do not draft or create every issue in bulk.

### 3. Review and create issues one at a time

Start from the committed candidate-issue table and process each candidate issue
independently:

1. Draft its French title and body, including context, objective, acceptance
   criteria, dependencies, open questions and out-of-scope items.
2. Check again that it does not duplicate an existing issue and that it contains
   no real candidate, employer, customer or third-party data.
3. Present the complete draft to the author and obtain explicit approval.
4. Create the issue in GitHub only after that approval.
5. Apply the agreed labels, milestone, priority, size and project status when
   the available GitHub integration supports them. Never claim unsupported
   metadata was applied.

Repeat this review-and-create cycle for the next candidate only after the
previous issue has been handled.

### 4. Clean up the backlog separately

After the selected issues have been created:

1. Verify their numbers, titles and coverage against the confirmed synthesis.
2. Remove the temporary synthesis table and only the backlog items fully covered
   by the created issues.
3. Keep deferred, rejected-for-now or unresolved ideas in `BACKLOG.md`, refining
   their wording only when needed to preserve their standalone meaning.
4. Update `docs/glossary.md`, `docs/design/decision-log.md` and canonical
   documentation when grooming established terminology or decisions. New
   decision log entries follow the template documented at the top of
   `docs/design/decision-log.md` (type, options considered, reassessment
   conditions).
5. Create or request a third, separate commit for the cleanup. A suitable
   message is `docs(backlog): move <release> work to issues`.

The first commit preserves what was proposed, the second records the confirmed
release scope and issue plan, and the third records what was transferred to
GitHub and removed from the backlog. Detailed issue review and creation occur
between the second and third repository checkpoints.

## Delivery workflow

1. **Ready**: keep only 3 to 5 items in *Ready*. Work on the top item by priority.
2. **In progress**: work on a branch and open a pull request that references the
   issue with `Fixes #<number>`. Start by recording the scenarios in
   `docs/test-plan.md` and `docs/test-log.md` and by checking that the test kit
   can test and demonstrate the change (see `AGENTS.md`).
3. **In review**: check the change against `docs/test-plan.md`, confirm the
   test kit and master scenario (`test-kit/`) cover the new behavior and that
   the change can be demonstrated with them, update documentation and
   `CHANGELOG.md`, then merge.
4. **Done**: the issue closes with the pull request.

Board columns: Backlog, Ready, In progress, In review, Done.

### Labels

- Type: `bug`, `enhancement`, `documentation`, `question`, `investigation`,
  `accessibility`.
- Aspect: `non-functional` for performance, privacy, reliability and other
  non-functional concerns.
- Scope: `workspace-mode`, `skill`. The `standalone-mode` label is kept only
  for issues created before the standalone mode was abandoned (#14).
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
