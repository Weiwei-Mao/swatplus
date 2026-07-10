---
title: High-level simulation control flow
kind: knowledge
status: verified
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: general
tags: [architecture, time-control, command, object-dispatch]
---

# High-level Simulation Control Flow

## Summary

For a normal time-stepped run, the generated main program performs basin/database/input/object initialization and then calls `time_control`. During the daily loop, `time_control` initializes daily state, handles climate and scheduled actions, and calls `command`. `command` follows the configured object sequence and dispatches each object type to its control routine.

This note is a verified orientation map, not a complete call graph of every SWAT+ process.

## Top-level branch

In [`main.f90.in`](../../../SRC_GitHub_Repository/src/main.f90.in), the simulation branch is:

```text
if time%step < 0
    set average-annual/export-coefficient mode
    call command directly
else
    call time_control
```

This distinction matters when a breakpoint in `time_control` is not reached: a negative `time%step` intentionally takes a different route.

## Normal daily path

```text
program main
    -> input and object initialization
    -> time_control
        -> calendar loops
        -> beginning-of-day initialization
        -> climate_control
        -> conditional actions and allocations
        -> command
            -> configured object dispatch
            -> object/process output
```

[`time_control.f90`](../../../SRC_GitHub_Repository/src/time_control.f90) calls `sim_initday` when full HRUs exist, calls `climate_control`, applies scheduled conditions/actions and allocations, and then calls `command` in the daily loop.

## Object dispatch

[`command.f90`](../../../SRC_GitHub_Repository/src/command.f90) uses the configured command/object sequence. Its dispatch includes, among others:

- Full HRU -> `hru_control`
- HRU-LTE -> `hru_lte_control`
- Routing unit -> `ru_control`
- Groundwater flow -> `gwflow_simulate`
- 1-D aquifer -> `aqu_1d_control`
- Reservoir -> `res_control`
- Recall -> recall handling routines
- Channel -> `sd_channel_control3` for the relevant channel object path

The presence of a routine in `command.f90` does not prove that a given scenario executes it. The active path depends on object definitions, connections, command order, and configuration inputs.

## Debugging use

Start with conditional breakpoints at these boundaries:

1. `main`: after input and connection initialization.
2. `time_control`: target simulation year/month/day.
3. `command`: target command position and object type/index.
4. Object control routine: target HRU, channel, aquifer, or reservoir index.
5. Process routine: target state/value after proving the controller path.

For `Osu_1hru`, watching the full-HRU object index before entering `hru_control` is a practical first object-level trace.

## Change guidance

- Change `main` only for program-wide lifecycle behavior.
- Change `time_control` for calendar/daily orchestration, not an isolated process equation.
- Change `command` only when object dispatch/order/transfer behavior is wrong.
- Change an object controller for its internal process ordering or object-level preparation.
- Change the smallest process routine when the scientific calculation itself is wrong.
- Always inspect downstream routing and output before finalizing a change.

## Evidence

- [`main.f90.in`](../../../SRC_GitHub_Repository/src/main.f90.in): `program main`, initialization sequence, and `time%step` branch.
- [`time_control.f90`](../../../SRC_GitHub_Repository/src/time_control.f90): daily initialization, climate/actions, and `call command`.
- [`command.f90`](../../../SRC_GitHub_Repository/src/command.f90): object dispatch and output calls.
- [`hru_control.f90`](../../../SRC_GitHub_Repository/src/hru_control.f90): full-HRU controller entry.

## Related notes

- [Main-program generation](main-program-generation.md)
- [`Osu_1hru` debug scenario](../debugging/osu-1hru-scenario.md)
- [End-to-end trace method](../../traces/README.md)

