# SWAT+ Knowledge Base Design

Date: 2026-07-10

## Goal

Build a durable knowledge system for a long-running, source-driven study of SWAT+. It must support both human learning and future agent work without turning the root `README.md` into a large, unsearchable notebook.

The system must distinguish verified model knowledge from session observations, preserve the evidence behind a conclusion, and make it easy to find the exact input, data structure, routine, and output involved in a behavior.

## Approaches considered

### One growing notebook

Keep all findings in the root `README.md` or one learning log. This is easy initially but becomes difficult to navigate, mixes tentative and verified observations, and creates merge/edit conflicts.

### Subsystem wiki only

Organize every note under model subsystems such as HRU, soil, plant, channel, and aquifer. This supports reference lookup but loses the chronological learning story and makes cross-subsystem execution traces awkward.

### Hybrid evidence-based knowledge base

Use canonical subsystem/topic notes for verified facts, end-to-end trace records for evidence, a dated journal for learning sessions, and decision records for code changes. This adds a small amount of structure but scales cleanly and preserves how each conclusion was reached.

The hybrid approach is selected.

## Information architecture

```text
docs/
|-- README.md                 Knowledge-base home and catalog
|-- knowledge/                Canonical, maintained SWAT+ knowledge
|   |-- architecture/         Program structure and lifecycle
|   |-- inputs/               Input files, readers, defaults, validation
|   |-- processes/            Scientific processes and equations
|   |-- objects/              HRU, routing unit, aquifer, channel, etc.
|   |-- outputs/              Output controls, variables, and balances
|   |-- reference/            Crosswalks, glossary, units, code indexes
|   `-- debugging/            Durable debugging/build techniques
|-- traces/                   Reproducible input-to-output code paths
|-- journal/YYYY/             Chronological learning sessions
|-- decisions/                Records for model/code/document decisions
|-- templates/                Required note structures
`-- superpowers/specs/        Approved project-design specifications
```

Folder names are semantic rather than numbered. Ordering belongs in `docs/README.md`, avoiding future folder renames and broken links.

## Document roles

### Canonical knowledge

One note explains one durable topic. A canonical note summarizes the current best understanding and links to source evidence and relevant traces. It is updated when understanding improves rather than duplicated by date.

### Traces

A trace proves a concrete path through one scenario: input field -> reader -> stored state -> controller -> process routine -> output. It records breakpoints, variables, object indices, source revision, and observed result. Canonical notes may cite multiple traces.

### Journal

A journal entry records what was attempted and observed during a learning session. Observations may be incomplete. Verified results are promoted into canonical knowledge or traces, and the journal links to those promoted records.

### Decisions

A decision record captures why a code, configuration, or documentation change was chosen, what alternatives were considered, and how it was verified. It prevents future work from repeating an already-settled investigation.

## Knowledge lifecycle

```text
learning/debug session
    -> journal observation
    -> source or debugger verification
    -> trace record when an execution path is involved
    -> canonical knowledge update
    -> decision record when a change is selected
    -> index/catalog update
```

Tentative observations must not be presented as canonical facts. If evidence later conflicts, update the canonical note and mark the affected trace or decision as superseded rather than deleting the history.

## Metadata

Every substantive note begins with compact YAML metadata:

- `title`
- `kind`: `knowledge`, `trace`, `journal`, or `decision`
- `status`: `verified`, `partial`, `hypothesis`, or `superseded`
- `created`
- `updated`
- `source_revision`
- `scenario`
- `tags`

`source_revision` records the SWAT+ Git revision used for verification. `scenario` is `general` when the fact is source-wide and names a dataset such as `Osu_1hru` when behavior is scenario-specific.

## Initial content

The scaffold will be seeded with knowledge already verified during workspace setup:

- Main-program template and CMake generation.
- High-level simulation control flow.
- Visual Studio and Intel Fortran debug configuration.
- The role of the `Osu_1hru` scenario.
- A dated journal entry documenting creation of the workspace knowledge system.

The remaining categories start with concise index files describing their scope and the rule for adding notes. Empty speculative topic files will not be created.

## Navigation and maintenance

- `docs/README.md` is the central catalog and learning-status dashboard.
- Each category `README.md` lists its notes and boundaries.
- Root `README.md` remains a concise workspace and quick-start guide, linking into the knowledge base.
- `AGENTS.md` defines the promotion workflow and requires index updates.
- File names use lowercase kebab-case and describe the concept, not the date, except journal and decision records.
- Links use paths relative to the document so the workspace remains movable.

## Validation

- Verify all local Markdown links.
- Check required metadata keys on substantive notes.
- Ensure each seeded factual claim has local source/project evidence.
- Ensure the catalog reaches every non-template knowledge, trace, journal, and decision record.
- Confirm no Fortran source, Visual Studio project, or scenario input is modified.

## Acceptance criteria

- A learner can start from `docs/README.md` and locate knowledge by subsystem or task.
- A future agent can decide whether new information belongs in knowledge, traces, journal, or decisions.
- Verified facts are separated from hypotheses and dated observations.
- Notes record source revision and scenario scope.
- The initial verified setup knowledge is stored outside the root `README.md` and linked from it.
- The structure can grow without renaming top-level categories or creating a single oversized note.
