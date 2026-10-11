---
name: product-feedback
description: Product feedback of the pilot. Read it when `init-workspace` hands over during initialization (anonymous identifier, feedback log, first-session information message), and when the candidate asks to generate their product feedback. The rule for taking notes during the session is in `AGENTS.md`, not here.
---
# Product feedback

During the pilot, the coach keeps a local log of the difficulties met and of the notes dictated by the candidate. Nothing is sent anywhere. The rule for taking notes during the session (what is recorded, the keywords, the acknowledgement, the line format) lives in the « Product feedback » section of `AGENTS.md`: follow it, do not restate it here.

This skill owns the log `data/feedback/feedback-log.md`, the anonymous identifier, the generation workflow and the two templates in `assets/`.

## Initialization

Called by `init-workspace` after "First use".

1. **Identifier.** If `product_feedback.user_id` in `data/config/workspace.yaml` is empty, generate an identifier of 8 characters `[a-z0-9]` with no link to the candidate's identity (no name, first name or date of birth), for example `k7m2x9qa`. When a shell is available, generate it with a command (for example PowerShell `[guid]::NewGuid().ToString('N').Substring(0,8)`); otherwise compose it varying the characters. Write it once, when the key is empty; never change it afterwards.
2. **Log.** If `data/feedback/feedback-log.md` does not exist, create it from `assets/feedback-log.template.md`. A missing log is never a possible loss: recreate it, do not ask.
3. **Report.** Say the generated identifier and the recreated log, each in one short sentence; the added `product_feedback` section is already reported by `init-workspace` as a missing key. On a first session, give no such sentence: give instead the information message below.
4. **Information message (first session only).** After the privacy reminder and before the first step, in the coaching language, two or three sentences without a question. Required content: during the pilot, the coach keeps local notes on difficulties of use to improve the product; how to dictate a note, quoting the exact keyword (« suggestion d'amélioration : » in French, « suggested improvement: » in English); how to ask for a feedback; nothing is sent automatically. At most one example, presented as an example.

## Generate a product feedback

On request (« génère mon feedback produit » or equivalent). Follow this order.

1. Read `data/feedback/feedback-log.md` (recreate it if missing, see Initialization) and pick the entries whose state is « non traitée ».
2. If there is none, say so, then still ask the three questions of step 4: with at least one answer, the feedback holds only those answers; with none, write no file and say so.
3. Review the silent entries one by one with the candidate: confirm or discard each (problem fixed, not established, of no interest). Explicit entries and joker entries need no review (joker entries only feed the statistic of step 5).
4. Ask three questions, in this order: what works well; important points to fix quickly; ideas for long-term evolution.
5. If there are unprocessed joker entries, compute an anonymous statistic from all of them, and from them only (number of simulations concerned, number of pieces of advice, number of proposed answers), propose it to the candidate and include it only if they accept.
6. Gather the metadata and counts: `product_feedback.user_id`; the version read in `ENGINE-VERSION` at the root of the workspace (« non connue » / « unknown » if absent); the date; the AI tool and model as you know them (« non connu » / « unknown » otherwise); the coaching language; the total number of directories under `data/opportunities/` and of `interviews/*/` directories they contain, counted now.
7. Anonymize while writing the content, from the candidate's answers and the retained entries, at least: names of people (candidate, interviewers, recruiters, contacts), companies and organizations, identifying job titles, local paths, e-mail addresses, phone numbers, profile links. Use generic replacements (`[Entreprise A]`, `[Personne 1]`, `[chemin local]`). Keep the list of replacements for the conversation: never write it in the file.
8. Choose the name `data/feedback/feedback-<user_id>-YYYY-MM-DD.md`; check the existing files of the day and add the suffix `-2`, `-3`… when needed. Never overwrite an existing file.
9. Write the file from `assets/product-feedback.template.md`, in the coaching language (headings in French in the template; translate them to English when coaching in English). Remove the « Usage des jokers » section when the statistic is not included.
10. Only after the file is actually written, change the state of the entries taken into account (explicit entries, reviewed silent entries, retained or discarded, and joker entries, whether the statistic was accepted or not) from « non traitée » to « traitée »; change nothing else in the log. If the generation is interrupted or fails, leave the log unchanged.
11. In the conversation, give the list of the replacements made, say that the result is not guaranteed anonymous and ask the candidate to read it before any sharing.

The file belongs to the candidate. Reworking it (« raccourcis cette partie ») modifies that file only, never the log. Send nothing and record no sending date, in `current-status.md` or elsewhere.
