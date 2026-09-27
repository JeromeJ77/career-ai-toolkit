# Workspace mode

Extract the built workspace ZIP outside the toolkit repository and open its root in a file-aware AI tool. Read `README.fr.md`, configure the profile language, add authorized sources, initialize the professional profile, then create one folder per opportunity. Keep the workspace private.

## Durable continuity

The workspace is the durable reference between conversations. Conversation
history is useful only as temporary context for a focused work session and must
not be required to resume later.

The root `current-status.md` only routes the next session: it records the latest
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
