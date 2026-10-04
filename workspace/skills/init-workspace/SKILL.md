---
name: init-workspace
description: Initialize the user data under data/ on first use. On the very first session, welcome the candidate to their career workspace and ask whether to use their first name before anything else. Create missing mandatory files (workspace.yaml, professional-profile.md, external-references.md, current-status.md) from the engine templates without overwriting anything. Use at the start of any session before another skill reads user data, and when the candidate asks to fill in the optional pilot feedback form.
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

## Session start order

Run these steps at the start of a session, before another skill reads user data. Do not read any data file before step 1 is done.

1. Read the instructions (`AGENTS.md`, `CLAUDE.md`, this file).
2. Check whether this is a first session (next section). Only check that files exist; do not read them.
3. First session: welcome the candidate, ask the first-name question and wait for the answer (see "First session"). Do nothing else until they answer.
4. Not a first session: read `data/config/workspace.yaml` (for `user.*` and the languages; if it is missing, treat `user.address_by_first_name` as `unset`) and `data/current-status.md`, greet the candidate (see "First name and greetings"), then continue with "First use" below.

## First session

The session is a first session when `data/current-status.md` does not exist, unless `data/profile/professional-profile.md` or a directory under `data/opportunities/` exists. In that case other user data shows that content may have been lost: it is not a first session, there is no welcome message, and "First use" step 2 applies. Do not use a marker file.

On a first session:

1. Show the welcome message immediately, in the coaching language: `language.coaching` if `data/config/workspace.yaml` already exists (for example created by hand), otherwise the language of the candidate's first message, French by default. Address the candidate formally (« vous »).

   French:

   ```text
   Bienvenue dans votre **espace carrière** !

   Cet espace vous permet de construire et d'enrichir votre dossier professionnel, puis de l'exploiter au fil de vos opportunités et de vos entretiens.

   Souhaitez-vous que je vous appelle par votre prénom ? Si oui, lequel ?
   ```

   English:

   ```text
   Welcome to your **career workspace**!

   This workspace lets you build and enrich your professional profile, then use it throughout your opportunities and interviews.

   Would you like me to call you by your first name? If so, what is it?
   ```

2. Wait for the answer. Perform no other initialization task meanwhile, so that the candidate has time to read. If the first message already contains a real request, show the welcome and the question, say that you will handle the request right after, then wait.
3. After the answer, run "First use" to create the missing files, then write the choice in the newly created `workspace.yaml` (see "First name and greetings").
4. Acknowledge the answer with the exact wording of the table below, report the creation in one functional sentence, then propose the first step.

   | | French | English |
   |---|---|---|
   | Report | « J'ai préparé votre espace : configuration, dossier professionnel (vide pour l'instant), références externes et état courant. » | « I've set up your workspace: configuration, professional profile (empty for now), external references and current status. » |
   | First step | « Pour commencer, nous pouvons construire votre dossier professionnel à partir de vos documents (CV, profil LinkedIn, certifications…). » | « To get started, we can build your professional profile from your documents (CV, LinkedIn profile, certifications…). » |

5. Then handle the candidate's initial request, if any.

## First name and greetings

`data/config/workspace.yaml` holds two keys under `user`:

| `address_by_first_name` | Meaning | Behavior |
|---|---|---|
| `unset` | Never asked (template value; also the case of a workspace from an earlier version, where the key is added by "First use" step 5). | At the start of the session, ask the question without the welcome message. |
| `ask_again` | Asked once, no answer. | Ask once more in the next conversation; if it is ignored again, write `no`. |
| `yes` | Accepted, `first_name` filled in. | Greet with the first name. |
| `no` | Declined, or ignored twice. | Never ask again. |

`yes` with an empty `first_name` is treated as `unset`. A value outside this list follows the invalid-value rule below (no rewrite, report it, use `unset` for the session).

Answers to the question (exact wording; write the value after the answer):

| Answer | French | English | Written |
|---|---|---|---|
| Yes, with a first name | « Entendu, <prénom>. Vous pourrez changer cela à tout moment, en me le demandant ou dans votre configuration. » | « Got it, <first_name>. You can change this at any time, by asking me or in your configuration. » | `yes` and `first_name` |
| Yes, without a first name | « Quel prénom dois-je utiliser ? » | « Which first name should I use? » | nothing until the first name is given |
| No | « Entendu, je ne vous appellerai pas par votre prénom. Vous pourrez changer d'avis à tout moment. » | « Understood, I won't use your first name. You can change your mind at any time. » | `no` |
| Unrelated answer (question ignored) | Do not insist; handle the request. | Same. | `ask_again` (then `no` if ignored a second time) |

Greetings, in the coaching language, without repeating the first name at every message:

- Start of a new conversation: « Bonjour <prénom>. » or « Bonjour. » (« Hello <first_name>. » or « Hello. »).
- When the candidate ends the session (for example « merci, au revoir »): « À bientôt, <prénom>. » or « À bientôt. » (« See you soon, <first_name>. » or « See you soon. »).

The candidate may change or withdraw their choice at any time by asking, or by editing the file. Update `user.address_by_first_name` and `user.first_name` accordingly.

## First use

Run this check once the session start order allows it, before another skill reads user data.

1. For each mandatory file, check whether it exists under `data/`.
2. Before creating a missing file, check whether other user data shows it already held content: `data/current-status.md` says it was initialized or filled, or other files depend on it (for example transcribed sources or opportunities for a missing professional profile). In that case it is a possible loss, not a first use: do not recreate it. Tell the candidate which file is missing and why it looks lost, and ask whether to rebuild it from the sources, restore a copy or check a synchronization tool. Act only on their answer.
3. Create only the other missing files by copying their template. Create missing parent directories. Never overwrite, rewrite or reformat an existing file, even if it looks empty or outdated (the only exceptions are appending missing keys to `workspace.yaml`, step 5, and updating the `user.*` keys from the candidate's answer or request, see "First name and greetings").
4. Do not fill in the professional profile silently. A profile created from its template is an empty skeleton; populate it only through the interview-coach "Initialize the professional profile" workflow, with the candidate's validation.
5. Compare `data/config/workspace.yaml` with `assets/workspace.template.yaml`. If keys from the template are missing, append each one with its template default value at its place in the structure. Do not change, reorder or remove any existing key, value or comment.
6. Tell the candidate which files were created and which configuration keys were added (with their default values), in one short sentence each. Say nothing when nothing was created, added or found missing. On a first session, give instead the single functional sentence of "First session" step 4.

A missing file is created individually and a missing key is added individually, so a partial or interrupted initialization is repaired on the next session.

## Rules

- Do not use a marker file to detect first use or a first session: the absence of `data/current-status.md` (first session) or of a mandatory file (first use) is the signal, unless other user data shows the file already held content (step 2).
- A missing key is added with its default value and reported, as described in steps 5 and 6.
- The only keys the coach updates in an existing `workspace.yaml`, besides appending missing keys, are `user.address_by_first_name` and `user.first_name`, from the candidate's answer or an explicit request to change them.
- If an existing key has an invalid value (for example a non-boolean where a boolean is expected, or an unsupported language) or the file is malformed, never rewrite it. Use the template default value for the session, tell the candidate which key, which value was found and which default is used, and let them correct the file.
- Never copy real candidate data into `assets/`; templates stay generic.
- If a mandatory file exists but cannot be read, report it and stop; do not replace it.
