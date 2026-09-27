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

## Workspace document model

```mermaid
flowchart TD
    sources["Authorized source documents<br/>CVs, certifications, notes, assessments"]
    profile["profile/professional-profile.md<br/><i>candidate-owned source of truth</i>"]
    workspaceStatus["current-status.md<br/><i>latest scope and resumption point</i>"]
    cv["cv/<br/>derived CVs<br/><i>(dedicated skill planned)</i>"]
    opportunityStatus["opportunities/{company-role}/current-status.md<br/><i>opportunity working state</i>"]
    opportunity["Opportunity artifacts<br/><i>analysis, prep, simulation, debrief</i>"]
    updates["Reviewed profile update proposals"]
    feedback["feedback/<br/><i>pilot observations, sanitized before sharing</i>"]

    sources ==> profile
    profile ==> cv
    profile ==> opportunity
    workspaceStatus -.-> opportunityStatus
    opportunityStatus <--> opportunity
    opportunity --> updates
    updates --> profile
    opportunity -.-> feedback
```

The professional profile is the stable base. Derived documents may be edited
for clarity and format, but new facts should be added to source documents or
the professional profile before regenerated output depends on them.

Status files are compact working-memory snapshots, not historical logs or new
sources of candidate facts. Detailed evidence and history remain in the
profile, authorized sources and dedicated opportunity artifacts.

## Related documentation

- [Use cases](use-cases.md)
- [Document lifecycle](document-lifecycle.md)
- [Workspace mode](workspace-mode.md)
- [Professional profile](professional-profile.md)
