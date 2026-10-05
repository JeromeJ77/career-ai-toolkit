# Privacy guidance

Career data is sensitive. Store the personal workspace somewhere private and durable, preferably on a personal device or storage location the user controls.

Do not retain employer trade secrets, customer information, third-party personal data, internal source code, or documents the candidate is not authorized to keep. Anonymize examples. Review files before sharing feedback. A professional OneDrive may become inaccessible after departure; choose storage deliberately and follow applicable policies.

## Privacy of exchanges with the AI tool

Your exchanges with the AI tool contain personal information: the files you attach, your answers and the coach's replies. Protecting the workspace files is not enough; also look at how the tool handles your conversations.

- Check the settings of your tool, and disable the use of your conversations to train models when this is possible.
- Check how the conversation history and the attached files are kept, and for how long.
- Take extra care with a personal account, whose default settings and retention rules may differ from those of a professional account.

These settings vary from one tool to another and change over time: you must check them yourself. The toolkit cannot check them for you and gives no guarantee about them. The coach gives a short reminder during the first session.

## Web browsing

By default, the coach does not browse the web (`privacy.allow_external_web_search: false` in `data/config/workspace.yaml`). The intention is to keep the work in a closed setting, limit the information handled and keep the sources actually used traceable.

- One-off exception: the coach may propose to open a link (for example a company page), or you may ask for it (for example to read a job posting from its link). The coach opens it only after your explicit agreement for that specific need. Providing a link is not an agreement, and an agreement is not a permanent activation.
- Permanent option: set `privacy.allow_external_web_search` to `true` in your `data/config/workspace.yaml`. This file is yours and is kept when the engine is updated. The coach may then browse without asking each time, so the content of the pages it opens becomes part of your exchanges with the AI tool.
- Whatever the setting, the information retrieved is presented to you for validation before it enters your professional profile or an opportunity, and its provenance (link and consultation date) is recorded.
- If browsing is not possible, the coach says so and invites you to paste the content or provide the file.

This rule is a behavior of the coach, defined in its instructions. It is not a technical lock of the tool, and it is not a guarantee.
