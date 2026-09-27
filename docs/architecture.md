# Architecture

Career AI Toolkit separates generic, publishable assets from private user data.

- `standalone/`: portable assistant instructions.
- `workspace/`: generic workspace template distributed as a ZIP.
- `examples/`: synthetic end-to-end demonstration.
- `docs/`: product and pilot documentation.
- `dist/`: local, untracked build output.

A user's extracted workspace must live outside this repository. The candidate's source of truth is `profile/professional-profile.md`; CVs and opportunity documents are derived views. The workspace and its status files provide durable continuity between temporary coaching conversations.

## Repository boundaries

```mermaid
flowchart LR
    repo["Toolkit repository<br/>public or shareable"]
    dist["dist/<br/>local release artifacts"]
    workspaceZip["career-ai-workspace ZIP"]
    standalone["standalone coach Markdown"]
    userWorkspace["User workspace<br/>private, outside this repository"]
    aiTool["File-aware AI tool<br/>VS Code, Claude Code, etc."]

    repo --> standalone
    repo --> workspaceZip
    repo --> dist
    workspaceZip --> userWorkspace
    aiTool <--> userWorkspace

    classDef privateNode fill:#fff1f2,stroke:#be123c,color:#3f0a16;
    classDef publicNode fill:#eef2ff,stroke:#4f46e5,color:#1e1b4b;
    class userWorkspace privateNode;
    class repo,dist,workspaceZip,standalone,aiTool publicNode;
```

The toolkit repository contains only reusable instructions, templates,
documentation and fictional examples. Real resumes, notes, job descriptions,
interview feedback and generated candidate documents belong only in the
private user workspace.

## Workspace tree

The distributed ZIP contains the reusable workspace skeleton. Entries marked
as coach-created below appear progressively in a private user workspace; they
are not pre-populated in the toolkit artifact.

```text
career-ai-workspace/
|-- AGENTS.md
|-- CLAUDE.md
|-- README.md
|-- README.fr.md
|-- current-status.md
|-- config/
|   |-- README.md
|   `-- workspace.yaml
|-- profile/
|   |-- README.md
|   |-- professional-profile.md
|   `-- sources/
|       |-- README.md
|       |-- external-references.md
|       |-- certifications/
|       |-- coaching-notes/
|       |-- evaluations/
|       |-- historical-resumes/
|       |-- portfolios/
|       |-- recommendations/
|       `-- skills-assessments/
|-- cv/
|   `-- README.md
|-- opportunities/
|   |-- README.md
|   `-- 001-organization-role/             # coach-created
|       |-- current-status.md
|       |-- opportunity.md
|       |-- analysis.md                    # when analysis starts
|       |-- sources/                       # when originals are retained
|       `-- interviews/                    # from the first known round
|           `-- 01-screening/
|               |-- interview.md
|               |-- preparation.md         # when generated
|               |-- simulations/           # from the first simulation
|               |   `-- 01/
|               |       |-- transcript.md  # when available
|               |       `-- debrief.md
|               `-- actual/                # when the real interview is documented
|                   |-- notes.md            # when available
|                   |-- transcript.md       # optional
|                   `-- review.md
|-- skills/
|   |-- README.md
|   `-- interview-coach/
|       |-- SKILL.md
|       |-- assets/
|       |   |-- cover-letter.template.md
|       |   |-- interview.template.md
|       |   |-- interview-feedback.template.md
|       |   |-- interview-preparation-sheet.template.md
|       |   |-- opportunity.template.md
|       |   |-- opportunity-analysis.template.md
|       |   |-- opportunity-current-status.template.md
|       |   `-- professional-profile.template.md
|       `-- references/
|           |-- interview-preparation-sheet-guidelines.md
|           |-- interview-simulation-guidelines.md
|           |-- opportunity-structure-guidelines.md
|           |-- professional-profile-guidelines.md
|           `-- profile-update-guidelines.md
|-- archives/
|   `-- README.md
`-- feedback/
    |-- README.md
    `-- pilot-feedback.md
```

Only `current-status.md`, `opportunity.md` and, once analysis starts,
`analysis.md` are opportunity-level working files. Each interview owns its
metadata, preparation, simulations and actual-interview artifacts. Optional or
phase-specific directories are created only when needed.

## Workspace document model

```mermaid
flowchart TD
    sources["Authorized source documents<br/>CVs, certifications, notes, assessments"]
    profile["profile/professional-profile.md<br/><i>candidate-owned source of truth</i>"]
    workspaceStatus["current-status.md<br/><i>latest scope and resumption point</i>"]
    cv["cv/<br/>derived CVs<br/><i>(dedicated skill planned)</i>"]
    opportunitySource["opportunities/{NNN-org-role}/opportunity.md<br/><i>canonical textual representation</i>"]
    opportunityOriginals["opportunities/{NNN-org-role}/sources/<br/><i>unchanged originals</i>"]
    opportunityWork["analysis.md<br/><i>derived fit and positioning</i>"]
    opportunityStatus["opportunities/{NNN-org-role}/current-status.md<br/><i>opportunity working state</i>"]
    interview["interviews/{NN-type}/<br/><i>metadata and progressive artifacts</i>"]
    updates["Reviewed profile update proposals"]
    feedback["feedback/<br/><i>pilot observations, sanitized before sharing</i>"]

    sources ==> profile
    profile ==> cv
    opportunityOriginals ==> opportunitySource
    profile ==> opportunityWork
    opportunitySource ==> opportunityWork
    workspaceStatus -.-> opportunityStatus
    opportunityStatus <--> opportunityWork
    opportunityWork ==> interview
    opportunityStatus <--> interview
    interview --> updates
    updates --> profile
    interview -.-> feedback
```

The professional profile is the stable base. Derived documents may be edited
for clarity and format, but new facts should be added to source documents or
the professional profile before regenerated output depends on them.

Status files are compact working-memory snapshots, not historical logs or new
sources of candidate facts. Detailed evidence and history remain in the
profile, authorized sources and dedicated opportunity artifacts.

The coach creates opportunity and interview directories progressively. Stable
numeric prefixes preserve creation order; Markdown identity files preserve the
business meaning independently from directory names.

## Related documentation

- [Use cases](use-cases.md)
- [Document lifecycle](document-lifecycle.md)
- [Workspace mode](workspace-mode.md)
- [Professional profile](professional-profile.md)
