# Document Lifecycle

```mermaid
flowchart TD
    sources["Original authorized sources"]
    profile["Professional profile<br/><i>personal source of truth</i>"]
    opportunity["Opportunity analysis and coaching"]
    derived["Derived Markdown documents<br/>CV, cover letter, prep sheet"]
    render["HTML/PDF rendering<br/>when supported"]
    learnings["Post-interview learnings"]
    proposal["Validated professional-profile<br/>update proposal"]

    sources --> profile
    profile --> opportunity
    profile --> derived
    opportunity --> derived
    derived --> render
    opportunity --> learnings
    learnings --> proposal
    proposal --> profile
```

Modify Markdown sources before regenerating derived output. Never add a new
fact only to a CV, cover letter or interview sheet.

## Candidate Workflow

```mermaid
sequenceDiagram
    actor Candidate
    participant Workspace
    participant Assistant
    participant Profile as Professional profile
    participant Opportunity

    Candidate->>Workspace: Create private workspace from toolkit ZIP
    Candidate->>Workspace: Add authorized source documents
    Candidate->>Assistant: Ask for profile initialization
    Assistant->>Workspace: Read sources
    Assistant->>Profile: Draft structured profile
    Candidate->>Profile: Review and correct facts
    Candidate->>Assistant: Ask for CV generation or refresh
    Assistant->>Profile: Reuse validated profile facts
    Assistant->>Workspace: Write derived CV Markdown
    Candidate->>Opportunity: Add job description and context
    Candidate->>Assistant: Prepare opportunity
    Assistant->>Opportunity: Write analysis and preparation sheet
    loop For each interview round
        Candidate->>Assistant: Prepare the round
        Candidate->>Assistant: Run one or more simulations or targeted drills
        Assistant->>Opportunity: Write feedback and next steps
        Candidate->>Assistant: Improve answers and preparation as needed
        Assistant->>Opportunity: Update preparation material
        Candidate->>Assistant: Debrief the real interview
        Assistant->>Opportunity: Capture learnings and next-round actions
    end
    Assistant->>Profile: Propose durable updates
    Candidate->>Profile: Accept, edit or reject updates
```

Version 0.1 does not include a dedicated CV-generation skill yet. CV files are
still treated as derived documents, and any new durable fact should be added to
the professional profile before it becomes part of a CV.
