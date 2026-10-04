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
  « end the simulation », then mention the joker in one more sentence (exact
  wording in the « Joker » section below).
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
  rôle des interviewers.*; in English, *Back to the interviewer role.*).
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
  technically available. Keep it factual and do not mix coaching into it. Record
  jokers as described in the « Joker » section. For
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

## Joker

The joker lets the candidate get help on the current question without ending
the simulation. It is the only case where the coach proposes an answer, and
only on explicit request.

- **Reminder at the start.** After the stop-keyword reminder, add one sentence.
  FR: « Si vous bloquez sur une question, demandez un joker : « joker, donne-moi
  un indice » ou « joker, propose une réponse à ma place ». » EN: « If you get
  stuck on a question, ask for a joker: "joker, give me a hint" or "joker,
  answer for me". »
- **Trigger.** « joker » at the start of the first sentence of the message, or
  an equivalent phrasing (« j'ai besoin d'un joker », « je prends un joker »;
  « I need a joker »), followed by the request: advice (« donne-moi un
  indice ») or a proposed answer (« propose une réponse à ma place », « réponds
  à ma place »). The word « joker » elsewhere in an answer triggers nothing:
  treat the message as an answer.
- **Leaving and resuming the role.** Mark the exit with a line in italics. FR:
  *Je sors du rôle des interviewers pour votre joker.* EN: *Stepping out of the
  interviewer role for your joker.* Mark the return with the usual line in
  italics (*Je reprends le rôle des interviewers.* / *Back to the interviewer
  role.*). Exactly one exit line and one return line per joker: any
  clarification with the candidate happens between the two lines, out of role,
  with no other role announcement and no repeated exit line.
- **After the return.** The interviewer does not repeat or rephrase the
  question, even in short form. At most FR « Je vous écoute. » EN « Go ahead. »,
  then waits for the candidate's answer to the same question.
- **Missing or ambiguous request.** Do not guess. Ask, out of role, between the
  exit line and the return line. FR: « Souhaitez-vous un conseil pour répondre à
  cette question, ou une réponse proposée à votre place ? » EN: « Would you
  like advice on answering this question, or a proposed answer in your
  place? » Do not add an announcement such as « Je reprendrai le rôle… ».
- **Cancelled joker.** If the candidate gives up the request (« non, en fait
  c'est bon, pas besoin » or similar), only resume the role with the return
  line. A cancelled joker is ignored everywhere: neither counted nor mentioned
  in the debrief, nor noted in the transcript.
- **Advice.** Give advice on the question asked (angle, structure, evidence
  from the candidate's dossier worth considering) without writing the answer.
  Resume the role (see « After the return »). The candidate's answer is
  assessed in the debrief.
- **Proposed answer.** Label it: FR « **Réponse proposée (joker) :** … » EN
  « **Proposed answer (joker):** … ». Base it only on the professional profile
  and the opportunity; never invent or exaggerate a fact, including for a
  topic the candidate has not practiced. If something had to be assumed for
  lack of information, add on its own line in italics, out of role, FR
  *Supposé faute d'information : …* EN *Assumed for lack of information: …*
  (only when something was assumed, and only what was assumed). The label is
  enough: add no warning, comment or instruction (such as « exemple à
  analyser » or « corrigez ce qui est faux ») after the answer. Then resume the
  role; the interviewer reacts as to a candidate's answer (follow-up or next
  question).
- **No limit.** The number of jokers is not limited; it is only reported in the
  debrief for information.
- **Stop.** A joker never ends the simulation. A stop request right after a
  joker follows the usual confirmation rule.
- **Outside a simulation.** The joker does nothing special during preparation,
  a debrief or any other session: add one line in italics, FR *Le joker ne
  s'utilise que pendant une simulation d'entretien ; voici ma réponse à votre
  demande.* EN *The joker is only used during an interview simulation; here is
  my answer to your request.* Then answer the request on the next line as an
  ordinary coaching request.
- **Transcript.** Keep it free of coaching. For an advice joker, note a factual
  line, without the content of the advice: FR `*Joker : conseil demandé.*` EN
  `*Joker: advice requested.*`; the candidate's answer follows as usual. For a
  proposed answer, put it in place of the candidate's turn, labelled
  `**Réponse proposée (joker) :**` / `**Proposed answer (joker):**`, followed
  by the assumptions line if one was given.
