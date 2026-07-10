# SWAT+ Workspace Agent Guide

## Mission

Use this workspace to learn the SWAT+ Fortran model, document its structure, trace model behavior, and make changes in the exact maintained source location. Treat scientific-code changes as evidence-driven work: identify the input, state, callers, calculation, and outputs before editing.

This file applies to the entire `D:\SWAT` workspace.

## Workspace map

| Path | Role | Edit policy |
| --- | --- | --- |
| `SRC_GitHub_Repository/` | Downloaded SWAT+ Git repository | Treat as the upstream source repository. |
| `SRC_GitHub_Repository/src/` | Maintained Fortran source | Make model-code changes here. |
| `VSProj/SWAT/SWAT.slnx` | Visual Studio solution | Use for Intel Fortran debugging. |
| `VSProj/SWAT/SWAT/SWAT.vfproj` | Intel Fortran project | Its source entries link to `SRC_GitHub_Repository/src`; do not assume it contains copies. |
| `VSProj/SWAT/Osu_1hru/` | One-HRU SWAT+ input dataset | Use as the default small debug case. Preserve its inputs unless a task explicitly changes the scenario. |
| `VSProj/SWAT/SWAT/x64/` | Compiler and linker output | Generated artifacts; do not edit. |
| `docs/` | Workspace designs and future learning records | Keep durable, verified project knowledge here. |

`D:\SWAT` itself is not currently a Git repository. `SRC_GitHub_Repository` is a nested Git repository; do not claim that root-level documents or `VSProj` changes were committed there.

## Source-of-truth rules

1. Use the actual folder names `SRC_GitHub_Repository` and `VSProj`.
2. The Visual Studio project references source files with paths such as `..\..\..\SRC_GitHub_Repository\src\*.f90`. Editing a linked file in Visual Studio normally edits the authoritative source file.
3. Git tracks `src/main.f90.in`, not `src/main.f90`. CMake generates `src/main.f90` with version, compiler, platform, and timestamp substitutions.
4. For durable main-program changes, edit `src/main.f90.in` and regenerate `src/main.f90`. Do not maintain the generated file independently.
5. Do not edit `.obj`, `.mod`, `__genmod.f90`, executables, or other files under build-output directories.
6. Preserve unrelated user changes and untracked files. Inspect repository status before modifying source.

## Required investigation workflow

Before recommending or making a model change, trace the behavior through these layers:

1. **Input or configuration** - identify the controlling file in `Osu_1hru` or another scenario and the relevant field/value.
2. **Reader** - locate the routine that opens and parses that file.
3. **Data structure** - identify the module, derived type, array, and object index that store the value.
4. **Orchestration** - trace how `main`, `time_control`, `command`, or another controller reaches the calculation.
5. **Process calculation** - identify the smallest routine containing the scientific equation or state transition.
6. **Consumers and outputs** - locate downstream routing, mass-balance, aggregation, and output routines.
7. **Verification** - choose an input/output signal or breakpoint that can prove the explanation or change.

Use code evidence for call paths. Label an unverified interpretation as an inference. If similarly named legacy, LTE, channel, reservoir, or aquifer implementations exist, determine which one the active object configuration selects.

## Model orientation

Use this only as a starting map, not as a substitute for tracing the active configuration:

```text
main.f90.in -> generated main.f90
    -> input reading and object initialization
    -> time_control
        -> daily initialization and climate
        -> command
            -> object dispatch (HRU, routing unit, aquifer,
               reservoir, channel, recall, and others)
            -> object/process outputs
```

Important entry files include:

- `SRC_GitHub_Repository/src/main.f90.in`
- `SRC_GitHub_Repository/src/time_control.f90`
- `SRC_GitHub_Repository/src/command.f90`
- `SRC_GitHub_Repository/src/hru_control.f90`

The actual object path depends on `object.cnt`, connection files, object types, and simulation options.

## Visual Studio and Intel Fortran

The default learning/debug configuration is `Debug|x64` with Intel `ifx`.

- Set **Configuration Properties > Debugging > Working Directory** to `$(SolutionDir)Osu_1hru` (or the equivalent absolute path). SWAT+ opens most inputs by relative filename.
- Under **Fortran > General**, enable **Multi-processor Compilation** to compile independent source files concurrently. This speeds the build; it does not make a SWAT+ simulation multithreaded.
- Under **Fortran > Preprocessor**, enable **Preprocess Source File**. Current `.f90` files contain `#if`, `#ifdef`, and related compiler-condition directives.
- Keep Debug builds unoptimized and retain debug information, traceback, interface warnings, bounds checks, and stack-frame checks when diagnosing behavior.
- Under **Fortran > Libraries**, keep the runtime library compatible with the configuration and all linked objects. The current project uses the multithreaded Debug DLL runtime for Debug and the multithreaded DLL runtime for Release.
- Property changes are configuration- and platform-specific. Confirm the property-page selectors before applying or evaluating a setting.

The current `SWAT.vfproj` already records multi-processor compilation and preprocessing for `Debug|x64`; do not assume those settings are present in every configuration. The debugger working directory is user-specific and is not stored in the shared project XML.

## Change and verification rules

- For an explanation or diagnosis, inspect and report; do not change model behavior unless requested.
- For an implementation request, make the smallest change that addresses the traced behavior.
- Do not modify an equation based only on a filename or variable name. Check units, indexing, initialization, reset timing, mass balance, and downstream use.
- Prefer `Osu_1hru` for fast step-by-step verification when it exercises the relevant path. Use a different scenario when the feature is absent from the one-HRU configuration.
- Build the configuration that will be debugged. A successful compile is necessary but not sufficient; run the relevant scenario and inspect its output or watched state.
- Report exact paths and routine names, what was verified, what remains uncertain, and any output differences.
- Record every durable finding in the knowledge system under `docs/`; do not rely only on chat history or keep expanding the root `README.md`.

## Knowledge recording workflow

Use [`docs/README.md`](docs/README.md) as the knowledge catalog. Place information according to its maturity and purpose:

1. Record the learning session in `docs/journal/YYYY/`, including failed paths and clearly labeled hypotheses.
2. When proving an input-to-output or controller-to-process path, create a reproducible record in `docs/traces/` with scenario, source revision, breakpoints, indices, and watched values.
3. Promote stable conclusions into one maintained topic note under `docs/knowledge/`.
4. When selecting a code/configuration approach, create a record under `docs/decisions/` with alternatives and verification.
5. Update `docs/README.md` and the relevant category `README.md` whenever a substantive record is added.

Canonical knowledge is organized under:

- `knowledge/architecture/` for entry, initialization, time loops, and dispatch.
- `knowledge/inputs/` for files, readers, fields, validation, and defaults.
- `knowledge/processes/` for equations, units, and state transitions.
- `knowledge/objects/` for HRU, routing unit, aquifer, channel, reservoir, and other object behavior.
- `knowledge/outputs/` for aggregation, print controls, files, and balances.
- `knowledge/reference/` for crosswalks, glossary, units, and indexes.
- `knowledge/debugging/` for durable build and debugging techniques.

Use the templates in `docs/templates/`. Substantive notes must state `status`, `source_revision`, and `scenario`. Use `verified`, `partial`, `hypothesis`, or `superseded` consistently.

## Documentation standards

- Keep `README.md` human-facing and `AGENTS.md` operational.
- Keep `docs/README.md` as the central knowledge index; the root `README.md` is only the workspace guide.
- Link to maintained source and local evidence with relative paths.
- Distinguish verified facts, partial paths, hypotheses, and superseded history.
- Keep one durable topic per canonical note and link it to supporting traces or source evidence.
- Do not copy large sections of upstream documentation. Summarize them and link to the local upstream document.
