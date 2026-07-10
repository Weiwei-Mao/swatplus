# SWAT+ Learning Knowledge Base

This directory is the durable memory for our SWAT+ learning project. Start here when looking for model knowledge, past evidence, or the reason behind a project decision.

The root [`README.md`](../README.md) explains how to open and run the workspace. This knowledge base explains what we have learned and how we know it.

## Where information belongs

| Information | Location | Rule |
| --- | --- | --- |
| Current verified understanding | [`knowledge/`](knowledge/README.md) | One maintained note per durable topic. |
| Reproducible input-to-output investigation | [`traces/`](traces/README.md) | Record scenario, revision, breakpoints, variables, and evidence. |
| What happened during a learning session | [`journal/`](journal/README.md) | Dated record; tentative observations are allowed when labeled. |
| Why a change or approach was selected | [`decisions/`](decisions/README.md) | Preserve context, alternatives, evidence, and verification. |
| Reusable note structure | [`templates/`](templates/README.md) | Copy the matching template when starting a substantive record. |
| Approved project designs | [`superpowers/specs/`](superpowers/specs/) | Design records, separate from model knowledge. |

## Knowledge map

Canonical knowledge is organized by stable concepts rather than the order in which we learned them:

| Area | Questions answered | Current notes |
| --- | --- | --- |
| [Architecture](knowledge/architecture/README.md) | How does the program start, initialize, loop, and dispatch work? | [Main-program generation](knowledge/architecture/main-program-generation.md); [simulation control flow](knowledge/architecture/simulation-control-flow.md) |
| [Inputs](knowledge/inputs/README.md) | Which file supplies a value, how is it read, and where is it stored? | Category established; detailed traces will populate it. |
| [Processes](knowledge/processes/README.md) | Which scientific equations and state transitions are used? | Category established; notes require equation and unit evidence. |
| [Objects](knowledge/objects/README.md) | How do HRUs, routing units, aquifers, channels, and reservoirs behave? | Category established; notes will be grouped by object. |
| [Outputs](knowledge/outputs/README.md) | How are results aggregated, balanced, controlled, and written? | Category established; notes require producer-to-column evidence. |
| [Reference](knowledge/reference/README.md) | Where are code crosswalks, units, variables, terminology, and external source explorers? | [DeepWiki SWAT+ source explorer](knowledge/reference/deepwiki-swatplus.md) |
| [Debugging](knowledge/debugging/README.md) | How do we build, run, and prove behavior efficiently? | [Visual Studio and Intel Fortran](knowledge/debugging/visual-studio-intel-fortran.md); [`Osu_1hru` scenario](knowledge/debugging/osu-1hru-scenario.md) |

## Current learning status

### Verified foundation

- The maintained main program is [`src/main.f90.in`](../SRC_GitHub_Repository/src/main.f90.in); CMake generates ignored `src/main.f90`.
- A normal simulation enters `time_control`, which calls `command` during the daily loop.
- `command` dispatches configured simulation objects, including full HRUs through `hru_control`.
- The Intel project links to authoritative sources under `SRC_GitHub_Repository/src`.
- `Debug|x64` is configured for Intel `ifx`, debugging checks, preprocessing, and parallel source compilation.
- `Osu_1hru` is the default small scenario for step-by-step learning.

### Next high-value traces

1. Trace `file.cio` through its reader and the files it activates.
2. Trace `object.cnt` and connection inputs into the `command` object sequence.
3. Trace one daily precipitation value from weather input through HRU water balance to output.
4. Map the internal HRU process order called by `hru_control`.

These are learning priorities, not verified conclusions. Each completed investigation should produce a trace and promote stable facts into the appropriate canonical note.

## Knowledge lifecycle

```text
Journal observation
    -> verify in source or debugger
    -> write an end-to-end trace when execution evidence is involved
    -> update canonical knowledge
    -> create a decision record if a change is selected
    -> update this catalog and the relevant category index
```

Do not promote a guess directly into canonical knowledge. A source-based conclusion should cite files and symbols; a runtime conclusion should also record scenario, source revision, object indices, watched values, and observed outputs.

## Status vocabulary

| Status | Meaning |
| --- | --- |
| `verified` | Supported by source evidence or a reproducible runtime observation. |
| `partial` | Some path or behavior is verified, but important boundaries remain. |
| `hypothesis` | Plausible observation that still needs evidence. |
| `superseded` | Historical record replaced by a newer note, trace, or decision. |

## Naming and maintenance

- Use lowercase kebab-case filenames: `surface-runoff-routing.md`.
- Canonical topic filenames do not contain dates; journal and decision filenames do.
- Keep one clear topic per canonical note.
- Record the exact SWAT+ Git revision and scenario scope in substantive notes.
- Add links in both directions when notes depend on one another.
- Update this catalog whenever a new canonical note, trace, or decision is added.

The structure is defined in the approved [knowledge-base design](superpowers/specs/2026-07-10-swat-knowledge-base-design.md).
