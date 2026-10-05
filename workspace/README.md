# MyCareer Workspace

MyCareer Workspace is part of Career AI Toolkit,
created by Jérôme Jurbert and distributed under MIT license.

This is your **career workspace**: a private, local and durable space where you build a living professional profile that you own and validate, then use it throughout your opportunities and interviews. The AI coach helps you analyse, summarize and prepare; it never replaces your validation. User data lives only under `data/`; the rest is the replaceable engine. Read the [user guide](USER-GUIDE.md) (French version: [USER-GUIDE.fr.md](USER-GUIDE.fr.md)) and `README.fr.md` for the French-first pilot guide. Never publish this directory without reviewing and removing personal data.

The workspace is the durable reference between coaching conversations. Treat each conversation as a focused work session; use `data/current-status.md` and each opportunity's `current-status.md` to resume work.

Give opportunity sources and context to the coach. It creates stable numbered opportunity and interview directories, preserves authorized originals, and adds Markdown artifacts progressively as the workflow reaches them.

## Privacy

The `data/` directory contains personal data. Store it on a personal device or a private, durable location you control. Do not add trade secrets, unauthorized employer documents, source code, customer data or unnecessary third-party personal data.

Your exchanges with the AI tool also contain personal information. Check in your tool's settings that your conversations are not used to train models when this is possible, and how history and attached files are kept, especially with a personal account. These settings vary between tools and change over time: the toolkit cannot check them for you and gives no guarantee about them.

By default, the coach does not browse the web without your explicit agreement (`privacy.allow_external_web_search: false`). See the "Web browsing" section of the [user guide](USER-GUIDE.md).
