# Career AI Toolkit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> Generic toolkit behind **MyCareer Workspace**: a personal, persistent and local career workspace, built around a living professional profile that you own.

**French-first pilot:** the most complete getting-started guide is [README.fr.md](README.fr.md).

## MyCareer Workspace

MyCareer Workspace (in French, « espace carrière ») is a private workspace of files that you open in VS Code, Claude Code or another file-aware AI tool. Its core is a living professional profile: structured professional memory, validated by you, the starting point of your work on opportunities and interviews, and enriched by that work over time. Each opportunity, preparation, simulation and debriefing can consolidate it, so the work is not consumed by a one-off use: it becomes a reusable professional asset.

AI (analysis, synthesis, coaching) is a means, not the value proposition. The structuring principles are:

- you own and control your data;
- confidentiality;
- persistence and continuity between conversations;
- portability (plain files);
- transparency and traceability;
- your validation of any information that is capitalized.

`career-ai-toolkit` remains the name of this repository: the generic project that gathers the components, skills, templates, tools and deliverables of the product.

## Coaching principle

The toolkit is a coach, not an answer generator: it helps candidates reflect, practice, improve and make their professional story their own, rather than memorize ready-made answers. The only exception is the joker, on explicit request during an interview simulation: a proposed answer is clearly labelled as such.

## How to use it

**MyCareer Workspace**: build and extract the private workspace ZIP, then open it in VS Code, Claude Code, or another file-aware AI tool. See the [user guide](workspace/USER-GUIDE.md).

The local directory name is free: a workspace extracted under `career-ai-workspace/` keeps working and does not need to be renamed. At the next session the `user` section is added to its `workspace.yaml` and the first-name question is asked, without the welcome message.

## Privacy model

This repository contains only generic instructions, templates, and a fully fictional example. Never add real resumes, certifications, job descriptions, interview notes, or other personal data to this repository. Keep personal data in a separate private workspace, preferably on a personal device or a storage location you control. See [docs/privacy.md](docs/privacy.md) for the privacy of exchanges with the AI tool and the web browsing rule.

## Build

On Windows, run:

```bat
build.bat
```

The command creates versioned release artifacts under the untracked `dist/` directory: the MyCareer Workspace ZIP, the demo and manual-test kit ZIP and the pilot feedback form.

## Project status

The toolkit is in a pilot phase. The current priority is validating the redesigned coaching workflow with real users before adding a CV generator, installers, automatic updates, or a full document-rendering pipeline.

## Documentation

- [French/English business glossary](docs/glossary.md)
- [Design decision log](docs/design/decision-log.md)
- [Architecture](docs/architecture.md)
- [Use cases and beta-tester journey](docs/use-cases.md)
- [Document lifecycle](docs/document-lifecycle.md)
- [Pilot testing](docs/pilot-testing.md)

## Author

Created and maintained by Jérôme Jurbert.

This project grew out of a practical need to structure career information,
job applications, and interview preparation using AI-assisted workflows.

Career AI Toolkit is released under the MIT License.
