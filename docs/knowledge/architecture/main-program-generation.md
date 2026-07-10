---
title: Main-program template and generation
kind: knowledge
status: verified
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: general
tags: [architecture, build, entry-point, cmake]
---

# Main-program Template and Generation

## Summary

The maintained SWAT+ program entry is [`src/main.f90.in`](../../../SRC_GitHub_Repository/src/main.f90.in). It contains `program main`, initialization calls, simulation control, and shutdown logic. CMake generates [`src/main.f90`](../../../SRC_GitHub_Repository/src/main.f90) from that template and substitutes build-specific values.

Git tracks the template and ignores the generated file. A durable main-program change therefore belongs in `main.f90.in`, followed by regeneration.

## Verified generation path

```text
src/main.f90.in
    -> CMake configure_file(...)
    -> placeholder substitution
    -> src/main.f90
    -> compiler
```

[`CMakeLists.txt`](../../../SRC_GitHub_Repository/CMakeLists.txt) sets the SWAT+ version from Git, gathers timestamp/compiler/platform values, and runs `configure_file(...)`. The resulting program text contains resolved values for placeholders such as:

- `@SWAT_VERSION@`
- `@TODAY@`
- `@YEAR@`
- `@ISO@`
- `@CMAKE_Fortran_COMPILER_ID@`
- `@CMAKE_Fortran_COMPILER_VERSION@`
- `@CMAKE_HOST_SYSTEM_NAME@`

[`SRC_GitHub_Repository/.gitignore`](../../../SRC_GitHub_Repository/.gitignore) explicitly ignores `src/main.f90`.

## Visual Studio relationship

[`SWAT.vfproj`](../../../VSProj/SWAT/SWAT/SWAT.vfproj) references `..\..\..\SRC_GitHub_Repository\src\main.f90`, not the `.in` template. The generated file must exist before that project builds.

Copying or renaming `main.f90.in` exposes valid Fortran entry logic, but it is not equivalent to CMake generation while `@...@` placeholders remain. The reproducible workflow is:

```powershell
Set-Location D:\SWAT\SRC_GitHub_Repository
cmake -B build -D CMAKE_Fortran_COMPILER=ifx -D CMAKE_BUILD_TYPE=Debug
```

## Change guidance

- Edit `main.f90.in` for maintained changes.
- Regenerate `main.f90` before compiling the Intel project.
- Do not commit or independently maintain generated `main.f90`.
- If a breakpoint is needed in the executable source, set it in generated `main.f90` while remembering that the durable matching line is in the template.
- Recheck generated text after changing CMake version or compiler configuration.

## Evidence

| Claim | Evidence |
| --- | --- |
| The template contains the program entry | [`src/main.f90.in`](../../../SRC_GitHub_Repository/src/main.f90.in) begins with `program main`. |
| CMake generates `main.f90` | [`CMakeLists.txt`](../../../SRC_GitHub_Repository/CMakeLists.txt) calls `configure_file` for the template and output. |
| Generated main is not tracked | [`.gitignore`](../../../SRC_GitHub_Repository/.gitignore) ignores `src/main.f90`; Git tracks only `src/main.f90.in`. |
| Visual Studio compiles the generated file | [`SWAT.vfproj`](../../../VSProj/SWAT/SWAT/SWAT.vfproj) includes the generated path. |

## Related notes

- [Simulation control flow](simulation-control-flow.md)
- [Visual Studio and Intel Fortran](../debugging/visual-studio-intel-fortran.md)
- [Workspace foundation journal](../../journal/2026/2026-07-10-workspace-foundation.md)

