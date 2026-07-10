# Canonical SWAT+ Knowledge

This library contains the current best verified understanding of SWAT+. Organize notes by what the model *is*, not by the date we learned it.

## Categories

- [`architecture/`](architecture/README.md): entry point, initialization, time loops, dispatch, and shared program structure.
- [`inputs/`](inputs/README.md): input files, readers, validation, defaults, and stored configuration.
- [`processes/`](processes/README.md): scientific calculations, state transitions, units, and mass balance.
- [`objects/`](objects/README.md): HRU, routing unit, aquifer, channel, reservoir, wetland, recall, and other simulation objects.
- [`outputs/`](outputs/README.md): print controls, aggregation, output files, columns, and balances.
- [`reference/`](reference/README.md): terminology, units, variable crosswalks, and source indexes.
- [`debugging/`](debugging/README.md): durable build and debugging practices.

## Canonical-note rule

A canonical note must state its scope and evidence. If a conclusion applies only to `Osu_1hru`, say so. If only the high-level route is known, use `status: partial` rather than filling gaps with inference.

Use the [knowledge-note template](../templates/knowledge-note.md). Put the dated investigation history in the journal and the detailed runtime proof in a trace; keep the canonical note readable as the maintained conclusion.

