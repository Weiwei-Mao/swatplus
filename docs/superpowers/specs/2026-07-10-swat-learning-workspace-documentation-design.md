# SWAT+ Learning Workspace Documentation Design

Date: 2026-07-10

## Purpose

Create two root-level documents that make this workspace easier for both AI agents and human learners to use safely:

- `AGENTS.md` will be the authoritative operating guide for AI agents working anywhere under `D:\SWAT`.
- `README.md` will be the human-facing introduction, setup guide, architecture map, and verified learning record.

The documentation should help the user learn SWAT+ step by step, understand the model's control flow, and identify the exact source location for a future change before editing scientific code.

## Current Workspace

The documents will describe the actual on-disk names and roles:

- `SRC_GitHub_Repository/` is the downloaded SWAT+ Git repository and source of truth.
- `SRC_GitHub_Repository/src/` contains the maintained Fortran sources.
- `VSProj/SWAT/SWAT/SWAT.vfproj` is the Intel Fortran project. Its source entries point to `SRC_GitHub_Repository/src` using relative paths.
- `VSProj/SWAT/Osu_1hru/` is the one-HRU demonstration input dataset used for step-by-step debugging.
- `VSProj/SWAT/SWAT/x64/Debug/` contains generated build artifacts and is not a source directory.

Existing `GEMINI.md` files will be left unchanged. No Fortran source, project setting, demo input, or generated file is changed by this documentation task.

## Verified Technical Facts

The documents must preserve the following distinctions.

### Generated main program

- Git tracks `SRC_GitHub_Repository/src/main.f90.in` and ignores `SRC_GitHub_Repository/src/main.f90`.
- The top-level `CMakeLists.txt` uses `configure_file(...)` to create `src/main.f90` from `src/main.f90.in` and substitute values such as the version, compiler, platform, and timestamp.
- `main.f90.in` already contains the `program main` entry and model initialization logic.
- Copying or renaming the template can expose the entry code for a manual project, but it is not equivalent to CMake generation while `@...@` placeholders remain unresolved.
- Maintained changes to the main program belong in `main.f90.in`; generated `main.f90` must not be treated as the durable source.
- The current Intel project references the generated `src/main.f90`, so it must exist before the Visual Studio project can compile.

### Intel Fortran and Visual Studio settings

- The debugger working directory should be the selected SWAT+ input dataset, currently `D:\SWAT\VSProj\SWAT\Osu_1hru`, so relative input-file opens resolve correctly.
- This working-directory choice is a debugger/user setting and is not currently represented in the shared `SWAT.vfproj` XML.
- In the current project, `Debug|x64` uses Intel `ifx`, enables multi-processor compilation, enables preprocessing, disables optimization, generates debugging information, and enables diagnostic checks.
- Multi-processor compilation allows independent source files to compile concurrently. It improves build speed but does not make model execution multithreaded.
- Source preprocessing is required because current sources contain compiler-conditional directives, including code in `utils.f90` and `swift_output.f90`.
- Runtime-library selection is configuration-sensitive. Debug currently uses the multithreaded debug DLL runtime, while Release uses the multithreaded DLL runtime. The documentation will warn users to keep all linked objects and libraries compatible instead of prescribing one runtime for every case.
- Settings are configuration- and platform-specific. Users must confirm they are editing the intended configuration, normally `Debug|x64`, rather than assuming a property change applies to every configuration.

## `AGENTS.md` Design

`AGENTS.md` will be concise and operational. It will contain:

1. **Mission and scope** — learn and modify SWAT+ carefully, with evidence for every claimed call path or source location.
2. **Workspace map** — identify source, Visual Studio project, demo data, and generated artifacts.
3. **Source-of-truth rules** — edit maintained files in `SRC_GitHub_Repository/src`; account for generated `main.f90`; preserve user changes; do not edit compiler outputs.
4. **Required investigation workflow** — trace input/configuration, data structures, orchestration, process equations, and outputs before recommending a change.
5. **Visual Studio guidance** — check the active configuration, working directory, preprocessing, multi-processor compilation, diagnostics, and runtime-library compatibility.
6. **Change workflow** — explain the observed behavior, identify callers and consumers, make the smallest scoped edit, and state assumptions.
7. **Verification expectations** — build the relevant configuration, run `Osu_1hru` when applicable, inspect errors/output, and distinguish code defects from input-data problems.
8. **Communication expectations** — give exact paths and symbols, label facts versus inferences, and correct incomplete learning notes respectfully.

The file will not duplicate a complete model reference manual. It will tell future agents how to investigate the source reliably.

## `README.md` Design

`README.md` will be explanatory and suitable for a learner with some Fortran and modeling experience. It will contain:

1. **Project goal** — learn SWAT+ architecture through source reading and one-HRU debugging.
2. **Workspace tree** — explain the purpose of each top-level folder and the relationship between the Intel project and downloaded source.
3. **Quick start** — open the solution, select `Debug|x64`, generate or confirm `main.f90`, set the `Osu_1hru` working directory, build, and start debugging.
4. **Verified Visual Studio settings** — explain each relevant property, why it matters, and whether it is already encoded in the current project.
5. **Main-program generation** — clearly separate the tracked template, CMake-generated file, and manual Visual Studio workaround.
6. **High-level execution path** — introduce `main.f90.in`/`main.f90`, `time_control.f90`, `command.f90`, and object controls such as `hru_control.f90` without claiming that this is the complete call graph.
7. **Learning workflow** — follow an input value from its file through readers, modules/types, control routines, process routines, and output.
8. **Verified learning record** — record the user's initial observations in a table with statuses such as Confirmed, Corrected, and Configuration-dependent, plus file-based evidence.
9. **Common mistakes** — editing generated files, confusing parallel compilation with parallel simulation, changing the wrong build configuration, and running from a directory without SWAT+ inputs.

## Evidence and Linking

Claims will be backed by local evidence, especially:

- `SRC_GitHub_Repository/CMakeLists.txt`
- `SRC_GitHub_Repository/.gitignore`
- `SRC_GitHub_Repository/src/main.f90.in`
- `SRC_GitHub_Repository/doc/Tagging.md`
- `SRC_GitHub_Repository/doc/VS-Win.md`
- `VSProj/SWAT/SWAT/SWAT.vfproj`
- Compiler-condition directives in `utils.f90` and `swift_output.f90`

Links in the Markdown documents will use repository-relative paths so they continue to work if the workspace is moved.

## Validation

Because this task changes documentation only, validation consists of:

- Confirming every linked local path exists.
- Comparing setting claims against all configurations in `SWAT.vfproj`.
- Checking generated-main claims against Git tracking, `.gitignore`, and `CMakeLists.txt`.
- Scanning both documents for contradictions, unfinished placeholders, and unclear statements.
- Confirming that no source, project, input, or generated build file was modified.

## Acceptance Criteria

- Root-level `AGENTS.md` and `README.md` exist and have clearly different audiences.
- The actual folder spelling and hierarchy are correct.
- The main-program explanation is reproducible and does not instruct users to maintain generated `main.f90`.
- Visual Studio advice distinguishes per-configuration settings and explains, rather than merely lists, important properties.
- The learning record explicitly corrects incomplete statements while retaining the user's practical experience.
- Future agents can determine where to investigate and how to verify a proposed SWAT+ change.
