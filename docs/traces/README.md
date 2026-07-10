# End-to-End Traces

Traces are reproducible evidence records. Each trace follows one concrete behavior through the code, preferably using the smallest scenario that exercises it.

## Required path

```text
input/configuration
    -> reader
    -> module/type/field
    -> controller/object dispatch
    -> process calculation
    -> routing/aggregation
    -> output or watched state
```

Use the [trace template](../templates/trace-note.md). Record the SWAT+ revision, scenario, active object indices, breakpoints, watched variables, observations, and exact source symbols.

The trace can be `partial` when a boundary is not yet proven. Promote its stable conclusions into canonical [`knowledge/`](../knowledge/README.md) notes.

## Trace catalog

No end-to-end runtime trace has been completed yet. The first planned trace is `file.cio` through the input-selection path.

