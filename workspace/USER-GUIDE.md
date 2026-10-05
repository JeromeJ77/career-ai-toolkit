# MyCareer Workspace user guide

[Version française](USER-GUIDE.fr.md)

MyCareer Workspace is your personal, persistent career workspace: a living professional profile that you own and validate, which grows with every opportunity, preparation, simulation and debriefing. Open the root of this directory in a file-aware AI tool, add authorized sources and initialize the professional profile; the profile language is configured in `data/config/workspace.yaml`, created by the coach in the first session. For a new application, give the available job documents or context to the coach; the coach creates the opportunity structure. Keep the workspace private.

The local directory name is free: a workspace extracted under `career-ai-workspace/` keeps working and does not need to be renamed. At the next session the `user` section is added to its `workspace.yaml` and the first-name question is asked, without the welcome message.

## First session

The first session is detected by the absence of `data/current-status.md` (unless a professional profile or an opportunity directory already exists: that is a possible loss, handled without a welcome message). Before anything else, the coach welcomes you to your career workspace and asks whether to call you by your first name, then waits for your answer. It then creates the mandatory files, acknowledges your answer, reports in one sentence what it prepared and proposes to build your professional profile from your documents. If your first message already contains a request, the coach handles it right after your answer.

The choice is stored in the `user` section of `data/config/workspace.yaml` (`address_by_first_name`: `unset`, `ask_again`, `yes` or `no`; `first_name`). You can change it at any time by asking the coach or by editing the file. With `yes`, the coach greets you by your first name at the start of a conversation and says goodbye when you end the session; it does not use your first name elsewhere. Every session starts with a short line in italics, *Starting the session…*, followed directly by the welcome message or the greeting.

The toolkit is a coach, not an answer generator: it helps candidates reflect, practice, improve and make their professional story their own, rather than memorize ready-made answers. The only exception is the joker, available during an interview simulation (see "Work sessions"): a proposed answer is only given on your explicit request and is clearly labelled as a proposed answer.

## Coach-managed opportunities

New opportunity directories use a stable identifier with at least three digits
and an ASCII kebab-case organization-role slug, such as
`001-acme-principal-architect`. The coach allocates `max + 1`; it never fills a
gap, reuses an identifier or silently renames an existing directory.

The coach creates `opportunity.md` as the canonical textual representation of
the supplied job information and `current-status.md` as its working state.
Authorized originals may be retained unchanged under `sources/`. Source facts,
uncertainties and derived analysis remain distinguishable. When opportunity
analysis starts, the coach creates a separate `analysis.md`.

When an interview becomes known, the coach creates
`interviews/01-screening/interview.md`, using the next two-digit sequence and a
descriptive type. Preparation, simulation and actual-interview directories and
files are added only when the workflow reaches them. Existing rounds and
simulations are never renumbered or overwritten.

## Durable continuity

The workspace is the durable reference between conversations. Conversation
history is useful only as temporary context for a focused work session and must
not be required to resume later.

`data/current-status.md` only routes the next session: it records the latest
scope, latest task and a short resumption point. It does not duplicate the list
or detailed state of opportunities.

Each opportunity has its own `current-status.md`. This compact snapshot records
the opportunity state, current interview and phase, validated decisions,
completed work, useful context, relevant artifacts and next action. Detailed
history belongs in dedicated opportunity documents.

## Work sessions

Use each assistant conversation for a focused coaching objective, such as
initializing the profile, analyzing one opportunity, preparing an interview,
running a simulation or debriefing a real interview. Conversations should stay
relatively short; start a new one when the objective changes or after a natural
checkpoint.

At the start of a session, state the intended scope when it is known. For a
generic request such as "resume where we stopped," the assistant reads the root
status and proposes the saved resumption point. If several scopes are
plausible, the assistant confirms the choice instead of selecting one silently.

For opportunity work, the assistant reads that opportunity's status before the
other relevant files. It updates the appropriate status after meaningful
workflow transitions, important validations and creation of useful artifacts,
and makes the next action explicit before ending a productive session.

During a simulation, status maintenance must not interrupt the role-play. The
assistant checkpoints beforehand when needed, captures the resulting artifacts
afterward, and then updates the opportunity status.

Simulations have three depths: Court (short, about 10-15 minutes and 4-6
questions), Standard (about 25-30 minutes and 8-10 questions, the default) and
Approfondi (deep, about 45-60 minutes and 12-15 questions). Writing « stop »,
« arrête la simulation », « arrêtons l'interview » or « end the simulation »
requests the end of a simulation at any time; the coach always asks you to
confirm before ending it, and pausing is not supported yet. Once you confirm,
the coach announces the stop, may offer to collect the candidate's questions, saves the transcript or a
`current-status.md` checkpoint, and debriefs what was played, immediately or
later, recording the early stop and its limits in `debrief.md`. A new simulation
after the debrief uses the next `simulations/NN/` directory and asks for the
depth again.

If you get stuck on a question during a simulation, ask for a joker without
ending it: start your message with "joker" (for example "joker, give me a
hint" or "joker, answer for me"). The coach steps out of the interviewer
role with a line in italics, then either gives advice on the question without
writing the answer, or proposes an answer, clearly labelled, based only on your
professional profile and the opportunity. When something had to be assumed for
lack of information, a line in italics says what. The coach then resumes the
interviewer role. If your request is unclear, the coach asks whether you want
advice or a proposed answer. The number of jokers is not limited; the debrief
reports it for information. A proposed answer is not assessed as your answer,
whereas your answer after advice is. The word "joker" in the middle of an
answer triggers nothing. Outside a simulation, the coach reminds you that the
joker is for simulations, then answers your request.

A simulation debrief may happen immediately or in a later conversation. In
both cases it reads the selected simulation's persistent artifacts, records its
evidence and limitations in `debrief.md`, and must not depend on hidden chat
history. Candidate notes can support a debrief when no transcript exists.
