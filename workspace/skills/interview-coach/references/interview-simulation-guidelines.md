# Interview simulation guidelines

- Confirm the selected numbered interview round and allocate the next
  `simulations/NN/` directory without reusing or renumbering an earlier one.
- Confirm only unknown parameters: interview type, language, interviewer role and desired depth.
- Always offer these depths together with their orders of magnitude, so the
  candidate knows what to expect and does not start a simulation longer than
  intended. Use the French names with the English equivalent in parentheses.
  Default to Standard when the candidate has no preference.

  | Depth | Duration | Questions | Use |
  | --- | --- | --- | --- |
  | Court (short) | 10-15 min | 4-6 | Test one point, warm up or repeat a targeted simulation. |
  | Standard (standard) | 25-30 min | 8-10 | Simulate a complete interview. |
  | Approfondi (deep) | 45-60 min | 12-15 | Prepare a demanding or multi-interviewer interview, with more follow-ups. |

- Before starting, remind the candidate that the simulation can be stopped at
  any time with « stop », « arrête la simulation », « arrêtons l'interview » or
  « end the simulation ».
- Each simulation is an independent interview. The interviewers start as for a
  first meeting and never refer to an earlier simulation (no « rebonjour », no
  « on reprend »), unless the candidate explicitly asks to simulate a follow-up
  interview. Say so in one short sentence only when the round already has an
  earlier simulation. For the first simulation of a round, say nothing about
  what the interviewers will ignore: the preparation exchanges are coaching,
  not a simulation, and must never be presented as one.
- Make every role change explicit with a short line in italics, outside the
  role-play: when stepping out of the interviewer role (stop confirmation, end
  of the simulation) and when stepping back in (for example *Je reprends le
  rôle des interviewers.*).
- Ask one question at a time. With several interviewers, only one of them
  speaks and asks a question per turn; the others take over in later turns.
  Two questions in the same turn are an exception, only when the interview
  format deliberately requires it, so the candidate always knows what to answer.
- Use natural follow-ups and adapt to previous answers.
- Do not explain the assessed competency or coach between every answer.
- Cover the role requirements and validated strategic messages.
- End with candidate questions and answer cautiously when company facts are unknown.
- Stop keywords are « stop », « arrête la simulation », « arrêtons l'interview »
  and « end the simulation ». They count only as a standalone message or when
  the message names the simulation or interview; a « stop » inside an answer
  does not trigger anything.
- When a stop keyword is used, step out of the role and ask a short
  confirmation, recalling that stopping ends the simulation for good ("Do you
  want to stop the simulation? It cannot be resumed afterwards."). If the
  candidate does not confirm, whether by declining or by simply answering the
  interview question, say in italics that you are resuming the role, then
  resume the role-play where it was, taking that answer into account.
- Confirm every new stop request the same way, even right after resuming the
  role following a declined stop: never end the role-play on an unconfirmed
  request.
- If the candidate clearly wants to stop without using a keyword, or the message
  is ambiguous, ask the same short confirmation instead of guessing. Never
  assume a pause. Pausing is not supported: if requested, say so and offer to
  stop or continue.
- Once the stop is confirmed, end the role-play immediately, state
  explicitly that you are stopping the simulation at the candidate's request
  and exit the interviewer role clearly. An early stop ends the simulation; it
  is not a pause.
- After an early stop, optionally offer to collect the questions the candidate
  intended to ask so they can feed the debrief. If the candidate declines,
  confirm the stop without insisting.
- Exit the interviewer role clearly.
- After the role-play, write `transcript.md` when a reliable transcript is
  technically available. Keep it factual and do not mix coaching into it. For
  an early stop, the transcript covers only what was played; note the stop
  factually without interpreting it. When no transcript is available, record a
  checkpoint in the opportunity `current-status.md` stating that the simulation
  ended early. In both cases, update the round's `interview.md` to list the
  simulation.
- Continue with `simulation-debrief-guidelines.md` immediately, including after
  an early stop, or update the opportunity status so the independent debrief is
  the explicit next action.
- A new simulation allocates the next `simulations/NN/` directory, asks for the
  depth again (and other parameters when unknown), asks whether to replay the
  same case or play another one, and takes the latest debrief priorities into
  account.
