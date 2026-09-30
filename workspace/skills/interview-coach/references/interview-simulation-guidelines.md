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
- Ask one question at a time.
- Use natural follow-ups and adapt to previous answers.
- Do not explain the assessed competency or coach between every answer.
- Cover the role requirements and validated strategic messages.
- End with candidate questions and answer cautiously when company facts are unknown.
- Stop keywords are « stop », « arrête la simulation », « arrêtons l'interview »
  and « end the simulation ». They count only as a standalone message or when
  the message names the simulation or interview; a « stop » inside an answer
  does not trigger anything.
- If the candidate clearly wants to stop without using a keyword, or the message
  is ambiguous, ask a short confirmation ("Do you want to stop the
  simulation?") instead of guessing. Never assume a pause. Pausing is not
  supported: if requested, say so and offer to stop or continue.
- Once a stop is requested or confirmed, end the role-play immediately, state
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
  ended early.
- Continue with `simulation-debrief-guidelines.md` immediately, including after
  an early stop, or update the opportunity status so the independent debrief is
  the explicit next action.
- After the debrief, a new simulation allocates the next `simulations/NN/`
  directory, asks for the depth again (and other parameters when unknown) and
  takes the debrief priorities into account.
