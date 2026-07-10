# SWAT+ Code Learning Workspace

This workspace is for learning the SWAT+ Fortran source step by step, understanding how model inputs become state changes and outputs, and determining the exact maintained source location for future code changes.

The working method combines the downloaded SWAT+ repository with an Intel Fortran Visual Studio project and a small one-HRU scenario that is practical for breakpoints, watches, and call-stack tracing.

## Workspace structure

```text
D:\SWAT
|-- AGENTS.md                       AI-agent operating rules
|-- README.md                       Human-facing project guide
|-- docs\                           Indexed SWAT+ knowledge base
|-- SRC_GitHub_Repository\          Downloaded SWAT+ Git repository
|   |-- CMakeLists.txt              Official build configuration
|   |-- doc\                        Upstream build/development documentation
|   `-- src\                        Authoritative Fortran source
`-- VSProj\SWAT\
    |-- SWAT.slnx                   Visual Studio solution
    |-- SWAT\SWAT.vfproj            Intel Fortran project
    `-- Osu_1hru\                   One-HRU input/debug scenario
```

The source entries in [`SWAT.vfproj`](VSProj/SWAT/SWAT/SWAT.vfproj) point back to [`SRC_GitHub_Repository/src`](SRC_GitHub_Repository/src). They are linked source files, not a second maintained copy.

Our accumulated SWAT+ knowledge is indexed separately in the [`docs` knowledge base](docs/README.md). The root README remains a concise workspace and startup guide.

Only [`SRC_GitHub_Repository`](SRC_GitHub_Repository) is currently a Git repository. The root workspace, Visual Studio project, demo, and root documentation are not currently version-controlled together.

## Quick start with Visual Studio

### 1. Confirm that the generated main program exists

The Intel project references [`src/main.f90`](SRC_GitHub_Repository/src/main.f90), but Git tracks only [`src/main.f90.in`](SRC_GitHub_Repository/src/main.f90.in). Configure the CMake project once when `main.f90` is missing or the template/version context has changed:

```powershell
Set-Location D:\SWAT\SRC_GitHub_Repository
cmake -B build -D CMAKE_Fortran_COMPILER=ifx -D CMAKE_BUILD_TYPE=Debug
```

This runs CMake's `configure_file(...)` step and substitutes the template placeholders. See [`CMakeLists.txt`](SRC_GitHub_Repository/CMakeLists.txt) and the upstream [`Tagging.md`](SRC_GitHub_Repository/doc/Tagging.md).

Do not make durable edits in generated `main.f90`; a later CMake configure can overwrite it. Modify `main.f90.in`, then regenerate.

### 2. Open and select the debug configuration

Open [`VSProj/SWAT/SWAT.slnx`](VSProj/SWAT/SWAT.slnx), then select:

- Configuration: `Debug`
- Platform: `x64`
- Compiler used by the current project: Intel `ifx`

### 3. Set the scenario working directory

Open the project Property Pages and select the intended `Debug|x64` configuration. Under **Configuration Properties > Debugging**, set **Working Directory** to:

```text
$(SolutionDir)Osu_1hru
```

For this workspace, the equivalent absolute path is:

```text
D:\SWAT\VSProj\SWAT\Osu_1hru
```

This is essential because SWAT+ opens input files such as `file.cio` using relative paths. Setting the working directory avoids copying all scenario inputs beside the project or executable.

The working directory is a user/debugger setting and is not currently stored in the shared `SWAT.vfproj` XML. Check it when moving the workspace, using another computer, or switching scenarios.

### 4. Check the important Intel Fortran properties

| Property page | Setting for `Debug|x64` | Why it matters | Current shared project |
| --- | --- | --- | --- |
| Fortran > General | Multi-processor Compilation: **Yes** | Compiles independent source files concurrently and reduces build time. It does not parallelize model execution. | Enabled |
| Fortran > Preprocessor | Preprocess Source File: **Yes** | Processes `#if`, `#ifdef`, `#elif`, and related compiler-condition blocks in `.f90` files. | Enabled |
| Fortran > General | Optimization: **Disabled** | Keeps stepping and inspected variables aligned with source during debugging. | Disabled |
| Fortran diagnostics | Debug information, traceback, interface warnings, bounds and stack checks: **Enabled** | Makes invalid indexing, interface problems, and runtime failures easier to locate. | Enabled |
| Fortran > Libraries | Runtime Library: **Multithreaded Debug DLL** | Matches the Debug configuration and debug runtime. Linked libraries must use compatible runtime choices. | Enabled for Debug |

Release currently uses the **Multithreaded DLL** runtime. Runtime-library choice matters when linking other objects/libraries and when distributing an executable to a machine that needs Intel runtime DLLs. Do not apply the Debug runtime to Release automatically.

Settings are stored per configuration and platform. The current `Release|x64` project entry does not explicitly enable multi-processor compilation or preprocessing, so verify those properties before building Release. Preprocessing is functionally important; multi-processor compilation is a build-speed option.

Intel documents the relevant behavior in [fpp Preprocessing](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2024-2/fpp-preprocessing.html), [multiple-processes `/MP`](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2023-0/multiple-processes-mp.html), and [runtime-library threading options](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2025-1/threads.html).

### 5. Build and begin debugging

Build the solution, then begin with breakpoints in:

- [`main.f90.in`](SRC_GitHub_Repository/src/main.f90.in) to learn initialization (place the executable breakpoint in generated `main.f90` if needed).
- [`time_control.f90`](SRC_GitHub_Repository/src/time_control.f90) to observe year/day progression, climate, and the daily command call.
- [`command.f90`](SRC_GitHub_Repository/src/command.f90) to see how configured objects are dispatched.
- [`hru_control.f90`](SRC_GitHub_Repository/src/hru_control.f90) to enter the detailed land-phase path for a full HRU.

Use call stacks and watches to confirm the path for the active one-HRU inputs rather than stepping indiscriminately through every initialization routine.

## The main-program template and generated file

The original observation was mostly correct but needs one important qualification:

1. GitHub/source control contains `src/main.f90.in`; it does not track `src/main.f90`.
2. `main.f90.in` already contains `program main` and the actual entrance logic.
3. CMake generates `main.f90` and replaces placeholders such as `@SWAT_VERSION@`, `@CMAKE_Fortran_COMPILER_ID@`, and timestamps.
4. Copying or renaming the template makes the Fortran entry visible, but it is only a manual workaround unless the placeholders are replaced. CMake generation is the reproducible method.
5. The Visual Studio project currently references generated `main.f90`, so that file must exist to build the project.

The generated file is ignored by Git as documented in [`SRC_GitHub_Repository/.gitignore`](SRC_GitHub_Repository/.gitignore).

## High-level execution path

This is an orientation map, not the full SWAT+ call graph:

```text
main.f90.in / generated main.f90
  |
  |-- basin, time, database, input, and object initialization
  |
  `-- time_control.f90
        |
        |-- simulation calendar loops
        |-- daily state initialization
        |-- weather/climate handling
        |
        `-- command.f90
              |
              |-- dispatch objects in command order
              |-- HRU -> hru_control.f90
              |-- routing unit, aquifer, reservoir, channel, recall, etc.
              `-- collect/write object outputs
```

In [`main.f90.in`](SRC_GitHub_Repository/src/main.f90.in), a normal time-stepped run calls `time_control`; a negative `time%step` takes the average-annual export-coefficient path directly through `command`. During the normal daily loop, [`time_control.f90`](SRC_GitHub_Repository/src/time_control.f90) initializes the day, handles climate and scheduled actions, and calls `command`. [`command.f90`](SRC_GitHub_Repository/src/command.f90) then dispatches the object type configured in the watershed command sequence.

The exact active path is controlled by the scenario's object and connection inputs. A filename-based architecture guess is not enough; confirm object types and indices in the debugger.

## Where we record knowledge

Use the [SWAT+ learning knowledge base](docs/README.md) as the durable project memory:

| Record type | Location | Purpose |
| --- | --- | --- |
| Canonical knowledge | [`docs/knowledge/`](docs/knowledge/README.md) | Current verified understanding organized by architecture, inputs, processes, objects, outputs, reference, and debugging. |
| Execution traces | [`docs/traces/`](docs/traces/README.md) | Reproducible evidence from input through source and state to output. |
| Learning journal | [`docs/journal/`](docs/journal/README.md) | Dated sessions, observations, failed paths, and hypotheses. |
| Decisions | [`docs/decisions/`](docs/decisions/README.md) | Why a code, configuration, or documentation approach was selected. |
| Templates | [`docs/templates/`](docs/templates/README.md) | Consistent metadata and required evidence sections. |

The lifecycle is: journal observation -> verification -> trace -> canonical knowledge -> decision record when a change is chosen. `docs/README.md` and each category index are updated as the library grows.

## Recommended learning workflow

For each process or variable, make one end-to-end trace:

1. Find the scenario input field that controls it.
2. Find the reader that opens and parses the input file.
3. Find the module/derived type where the value is stored.
4. Find the controller that selects the calculation.
5. Find the process routine and check units, indices, and reset timing.
6. Follow the value into routing, aggregation, mass balance, and output.
7. Prove the path with a breakpoint/watch and one observable output.
8. Record the verified path before changing code.

A useful change-location classification is:

| Layer | Typical reason to change it |
| --- | --- |
| Input/configuration | Scenario behavior is selected or parameterized incorrectly. |
| Reader/validation | A field is parsed, defaulted, bounded, or diagnosed incorrectly. |
| Data module/type | State is missing, incorrectly scoped, or reset at the wrong time. |
| Control/orchestration | The wrong process/object path is selected or ordered. |
| Scientific process | The equation, units, or state transition is wrong. |
| Routing/aggregation | Correct local results are transferred or accumulated incorrectly. |
| Output | The calculation is correct internally but reported incorrectly. |

## Initial verified foundation

The full maintained notes now live in the [knowledge base](docs/README.md). This table preserves the initial corrections that established the workspace:

| Initial observation | Status | Verified record |
| --- | --- | --- |
| GitHub does not have `main.f90`; it has `main.f90.in`. | **Confirmed** | Git tracks `src/main.f90.in`; generated `src/main.f90` is ignored. |
| Rename `main.f90.in` to obtain the model entrance. | **Corrected** | The template contains `program main`, but CMake must resolve its placeholders. Maintain the template and generate `main.f90`. |
| Set the demo directory as the debugger working directory. | **Confirmed** | This lets relative input-file opens resolve in `Osu_1hru` without copying the dataset. |
| Enable multi-processor compilation to use multiple threads. | **Corrected** | It runs multiple compiler processes to build source files concurrently; it does not make SWAT+ runtime calculations multithreaded. |
| Enable source preprocessing. | **Confirmed** | Current `.f90` sources contain compiler-condition directives. It is already enabled for `Debug|x64`. |
| Runtime Library sometimes matters. | **Confirmed and expanded** | Debug/Release and linked objects must use compatible runtime libraries; DLL choices also affect deployment dependencies. |
| Property-page changes apply to the project. | **Configuration-dependent** | Visual Studio properties can differ by configuration and platform. Always check the selectors. |

## Common mistakes to avoid

- Editing generated `src/main.f90` and losing the change during the next CMake configure.
- Editing files under `x64/Debug` because their names resemble source routines.
- Assuming Visual Studio holds a separate copy of each `.f90` file.
- Treating multi-processor compilation as parallel SWAT+ simulation.
- Changing a property for `Debug|Win32` while debugging `Debug|x64`.
- Running the executable with the project or output directory as the working directory and receiving missing-input errors.
- Modifying a scientific equation before checking its reader, initialization, units, callers, and downstream mass balance.

## Primary local references

- [SWAT+ repository README](SRC_GitHub_Repository/README.md)
- [Building SWAT+](SRC_GitHub_Repository/doc/Building.md)
- [Developing with Visual Studio on Windows](SRC_GitHub_Repository/doc/VS-Win.md)
- [Version tagging and generated `main.f90`](SRC_GitHub_Repository/doc/Tagging.md)
- [SWAT+ coding conventions](SRC_GitHub_Repository/doc/coding_conventions.md)
- [Workspace agent guide](AGENTS.md)
- [SWAT+ learning knowledge base](docs/README.md)
- [DeepWiki SWAT+ source-explorer record](docs/knowledge/reference/deepwiki-swatplus.md)
