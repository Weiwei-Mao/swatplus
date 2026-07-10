---
title: Osu_1hru learning and debug scenario
kind: knowledge
status: partial
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: Osu_1hru
tags: [debugging, scenario, hru]
---

# `Osu_1hru` Learning and Debug Scenario

## Summary

[`VSProj/SWAT/Osu_1hru`](../../../VSProj/SWAT/Osu_1hru) is the default small input dataset for learning SWAT+ through the Intel Visual Studio debugger. Its small object count makes call stacks, indices, watches, and output comparisons more manageable than a large watershed.

This note is `partial` because the complete object graph and active process options have not yet been traced from the inputs into runtime state.

## Verified role

- It contains a complete SWAT+ input set headed by [`file.cio`](../../../VSProj/SWAT/Osu_1hru/file.cio).
- It includes key configuration files such as `object.cnt`, `time.sim`, `codes.bsn`, `weather-sta.cli`, `hru.con`, and `hru-data.hru`.
- It should be the Visual Studio debugger working directory.
- It is intended as the first scenario for full-HRU step-by-step learning.

## Appropriate uses

- Trace startup input selection.
- Learn the simulation calendar and daily loop.
- Prove command dispatch into the configured HRU.
- Follow a weather signal through HRU processes.
- Compare a watched internal value to a reported output.
- Reproduce a small behavior before testing a larger scenario.

## Limits

A small scenario cannot verify code paths for objects or options it does not contain. Before using it to validate a change, confirm that the relevant object type, process selector, constituent, management operation, and output are active.

Do not generalize a runtime observation from this scenario to every SWAT+ configuration without checking the selecting inputs and alternate implementations.

## First planned traces

1. `file.cio` -> input-file selection and reader calls.
2. `object.cnt` and connection inputs -> command sequence and object indices.
3. One weather precipitation value -> HRU water state -> runoff/output.
4. `hru_control` -> ordered land-phase process calls for the configured HRU.

Each completed investigation belongs in [`../../traces/`](../../traces/README.md), with stable conclusions promoted to the input, object, process, or output knowledge areas.

## Related notes

- [Visual Studio and Intel Fortran](visual-studio-intel-fortran.md)
- [Simulation control flow](../architecture/simulation-control-flow.md)
- [Learning journal](../../journal/README.md)

