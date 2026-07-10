---
title: Workspace and knowledge-base foundation
kind: journal
status: verified
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: Osu_1hru
tags: [journal, workspace, documentation, debugging]
---

# 2026-07-10 - Workspace and Knowledge-base Foundation

## Goal

Establish the SWAT+ learning workspace, verify the relationship among the downloaded source, Intel Fortran project, and one-HRU scenario, and create a structure capable of retaining many future findings.

## Actions

- Mapped the actual workspace folder names and project paths.
- Confirmed that the Intel project source entries point into `SRC_GitHub_Repository/src`.
- Verified Git tracking and CMake generation of the main program.
- Inspected `main.f90.in`, `time_control.f90`, and `command.f90` for the high-level execution route.
- Checked the current Intel project configurations and compiler properties.
- Verified the purpose of the Visual Studio working directory.
- Cross-checked preprocessing, parallel compilation, and runtime-library meanings with Intel documentation.
- Created root `AGENTS.md` and `README.md`.
- Designed and created the hybrid SWAT+ knowledge base.
- Audited the SWAT+ DeepWiki hierarchy and its per-page indexed revisions.

## Verified observations

- `SRC_GitHub_Repository` is the source Git repository; the root workspace is not a Git repository.
- `src/main.f90.in` is tracked and contains `program main`; CMake generates ignored `src/main.f90`.
- The Intel project compiles linked files from the source repository and references generated `main.f90`.
- A normal simulation enters `time_control`, which invokes `command` in the daily loop.
- `command` contains object dispatch, including full HRU dispatch to `hru_control`.
- `Debug|x64` uses `ifx` with preprocessing, parallel source compilation, and debugging checks.
- Multi-processor compilation reduces compilation time; it does not make the simulation runtime multithreaded.
- `Osu_1hru` should be the working directory for the default learning/debug session.
- DeepWiki is useful for source discovery, but its child pages may be indexed from different commits; each claim still requires local verification.

## Corrections to initial understanding

- Renaming `main.f90.in` reveals the entry source but does not perform CMake placeholder substitution. The maintained workflow is to edit the template and regenerate the output.
- Source preprocessing is not merely a convenience: current sources contain compiler-condition directives in lowercase `.f90` files.
- Runtime Library is not one universal value. It must match Debug/Release configuration and linked-library compatibility.

## Promoted records

- [Main-program template and generation](../../knowledge/architecture/main-program-generation.md)
- [High-level simulation control flow](../../knowledge/architecture/simulation-control-flow.md)
- [Visual Studio and Intel Fortran configuration](../../knowledge/debugging/visual-studio-intel-fortran.md)
- [`Osu_1hru` learning scenario](../../knowledge/debugging/osu-1hru-scenario.md)
- [DeepWiki SWAT+ source explorer](../../knowledge/reference/deepwiki-swatplus.md)
- [Knowledge-base design](../../superpowers/specs/2026-07-10-swat-knowledge-base-design.md)

## Next session

Create the first end-to-end trace: start at `Osu_1hru/file.cio`, identify the exact reader and data structures, and follow how it selects the remaining input files.
