# Architecture

Program-wide control structure: entry, initialization, simulation time, object dispatch, shared modules/types, and shutdown.

## Notes

- [Main-program generation](main-program-generation.md)
- [Simulation control flow](simulation-control-flow.md)

## Boundary

Keep object-specific equations under [`../objects/`](../objects/README.md) or [`../processes/`](../processes/README.md). Architecture notes should explain how those components are reached and coordinated.

