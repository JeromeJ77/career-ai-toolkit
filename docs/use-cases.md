# Use Cases

Career AI Toolkit is organized around a candidate who wants to keep ownership
of career information while using AI for structured preparation. Version 0.1
focuses on the interview coach and local workspace pilot; CV generation is a
planned skill and is represented here as part of the intended workflow.

## Actors

- **Candidate**: owns the workspace, reviews every durable fact and decides
  what can be reused.
- **AI assistant**: reads the workspace, follows toolkit instructions and
  proposes generated or updated documents.
- **Beta tester**: uses the toolkit on a realistic journey and shares sanitized
  product feedback.
- **Toolkit maintainer**: improves generic documentation, templates and skills
  without collecting private career data.

## Main Use Cases

Colors distinguish work done mostly by the candidate alone, by the coach, or
jointly by the candidate and coach. Actor and maintainer nodes stay neutral.

```mermaid
flowchart TD
    candidate(("Candidate / beta tester"))
    maintainer(("Toolkit maintainer"))

    setup["Create private workspace"]
    collect["Add authorized career sources"]
    profile["Initialize or update professional profile"]
    cv["Generate or refresh CV<br/>any time after profile setup<br/><i>(planned dedicated skill)</i>"]
    opportunity["Create opportunity"]
    analyze["Analyze role and positioning"]
    validatePositioning["Review and validate<br/>strategic messages"]
    interview["Manage one or more interview rounds"]
    simulate["Run interview simulation"]
    debrief["Debrief simulation"]
    improvePrep["Improve answers and preparation"]
    prep["Prepare interview sheet<br/>for this round"]
    realInterview["Attend real interview"]
    postReview["Review real interview"]
    nextRound["Prepare next round if needed"]
    update["Review profile update proposal"]
    feedback["Share sanitized pilot feedback"]
    improve["Improve toolkit docs, templates and skills"]
    legendUser["Candidate alone"]
    legendCoach["Coach work"]
    legendJoint["Candidate + coach"]

    candidate --> setup
    setup --> collect
    collect --> profile
    profile -.-> cv
    profile --> opportunity
    opportunity --> analyze
    analyze --> validatePositioning
    validatePositioning --> interview
    interview --> simulate
    simulate --> debrief
    debrief --> improvePrep
    improvePrep -.-> simulate
    improvePrep --> prep
    prep --> realInterview
    realInterview --> postReview
    postReview --> nextRound
    nextRound -.-> interview
    postReview --> update
    update -.-> profile
    update --> feedback

    maintainer --> improve
    feedback -.-> improve

    classDef userTask fill:#2563eb,stroke:#1e3a8a,stroke-width:3px,color:#ffffff;
    classDef coachTask fill:#ea580c,stroke:#7c2d12,stroke-width:3px,color:#ffffff;
    classDef jointTask fill:#16a34a,stroke:#14532d,stroke-width:3px,color:#ffffff;
    classDef actor fill:#f5f5f5,stroke:#404040,stroke-width:2px,color:#171717;

    class setup,collect,opportunity,realInterview,feedback,legendUser userTask;
    class analyze,prep,cv,legendCoach coachTask;
    class profile,validatePositioning,interview,simulate,debrief,improvePrep,postReview,nextRound,update,legendJoint jointTask;
    class candidate,maintainer,improve actor;
```

An opportunity is created inside the candidate workspace, usually as one folder
under `opportunities/`. It can include several interview rounds. A single round
can also need several simulation, debrief and improvement loops before the
candidate feels ready.

The coach can analyze the role and propose positioning, but the strategic
messages only become reusable preparation material after candidate review and
validation.

## Conversation Scope

Use one assistant conversation per opportunity whenever possible. This keeps
the job description, positioning, interview rounds, simulations, debriefs and
follow-up work in the same context without mixing them with another
application.

If the same opportunity has several interview rounds, keep using the same
conversation while the context is still manageable. Start a new conversation
only when the thread becomes too long, and then point the assistant back to the
opportunity folder and the latest preparation or feedback files.

## Use Case Notes

| Use case | Current v0.1 support | Main output |
| --- | --- | --- |
| Create private workspace | Supported through the built ZIP | Extracted local workspace |
| Initialize professional profile | Supported through coach instructions and templates | `profile/professional-profile.md` |
| Generate CV | Planned; independent from opportunity work and available after profile setup | `cv/*.md`, later HTML/PDF |
| Create and prepare an opportunity | Supported by the interview coach | Opportunity folder with job description, analysis and one preparation sheet per interview round |
| Simulate and debrief interviews | Supported by the interview coach | One or more simulation/debrief loops per interview round |
| Review a real interview | Supported by the interview coach | Post-interview learnings and next-round actions |
| Update professional profile | Supported as a reviewed proposal | Candidate-approved profile changes |
| Share pilot feedback | Supported through feedback template | Sanitized product feedback |

## Candidate / Beta-Tester Journey

```mermaid
flowchart TD
    start([Start pilot])
    choose{Choose usage mode}
    standalone["Standalone coach<br/>copy Markdown into an AI assistant"]
    workspace["Workspace mode<br/>build and extract private ZIP"]
    configure["Configure workspace<br/>language, preferences, tool context"]
    sources["Add authorized sources<br/>historical CVs, certifications, notes"]
    initProfile["Ask assistant to initialize professional profile"]
    reviewProfile{Candidate approves profile?}
    refineProfile["Refine profile from source evidence"]
    generateCv["Optionally generate or refresh CV<br/>(independent planned skill)"]
    newOpp["Create opportunity"]
    addJob["Add job description and useful context"]
    analyze["Analyze fit, risks and strategic messages"]
    validatePositioning["Review and validate positioning"]
    interview["Prepare a specific interview round"]
    simulate["Run mock interview or targeted drills"]
    debrief["Debrief simulation and capture improvements"]
    improvePrep["Improve answers, stories and prep material"]
    retrySame{More practice for this interview?}
    prepare["Generate final preparation sheet<br/>for this interview"]
    realInterview["Attend real interview"]
    postReview["Review real interview"]
    durable{Durable profile update?}
    updateProfile["Propose and review profile update"]
    nextInterview{Another interview for this opportunity?}
    nextOpp{Another opportunity?}
    feedback["Fill sanitized pilot feedback"]
    finish([End])

    start --> choose
    choose --> standalone
    choose --> workspace
    workspace --> configure
    standalone --> sources
    configure --> sources
    sources --> initProfile
    initProfile --> reviewProfile
    reviewProfile -- No --> refineProfile --> initProfile
    reviewProfile -- Yes --> newOpp
    reviewProfile -.-> generateCv
    newOpp --> addJob --> analyze --> validatePositioning --> interview
    interview --> simulate --> debrief --> improvePrep --> retrySame
    retrySame -- Yes --> simulate
    retrySame -- No --> prepare --> realInterview --> postReview --> durable
    durable -- Yes --> updateProfile --> nextInterview
    durable -- No --> nextInterview
    nextInterview -- Yes --> interview
    nextInterview -- No --> nextOpp
    nextOpp -- Yes --> newOpp
    nextOpp -- No --> feedback --> finish

    classDef userTask fill:#2563eb,stroke:#1e3a8a,stroke-width:3px,color:#ffffff;
    classDef coachTask fill:#ea580c,stroke:#7c2d12,stroke-width:3px,color:#ffffff;
    classDef jointTask fill:#16a34a,stroke:#14532d,stroke-width:3px,color:#ffffff;
    classDef decision fill:#f5f5f5,stroke:#404040,stroke-width:2px,color:#171717;

    class start,standalone,workspace,configure,sources,newOpp,addJob,realInterview,feedback,finish userTask;
    class refineProfile,generateCv,analyze,prepare coachTask;
    class initProfile,validatePositioning,interview,simulate,debrief,improvePrep,postReview,updateProfile jointTask;
    class choose,reviewProfile,durable,retrySame,nextInterview,nextOpp decision;
```

The loop matters: interview preparation should improve the opportunity files
first. Real-interview review can then feed the next round for the same
opportunity, and durable learnings should update the professional profile only
when the candidate validates that they are reusable beyond one application.
