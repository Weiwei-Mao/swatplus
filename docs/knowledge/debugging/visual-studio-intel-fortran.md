---
title: Visual Studio and Intel Fortran configuration
kind: knowledge
status: verified
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: Osu_1hru
tags: [debugging, visual-studio, ifx, build]
---

# Visual Studio and Intel Fortran Configuration

## Summary

The default learning configuration is `Debug|x64` using Intel `ifx`. The project links directly to the downloaded SWAT+ source and uses `Osu_1hru` as the debugger working directory.

## Working directory

Set **Configuration Properties > Debugging > Working Directory** to:

```text
$(SolutionDir)Osu_1hru
```

Equivalent absolute path:

```text
D:\SWAT\VSProj\SWAT\Osu_1hru
```

SWAT+ opens many inputs by relative filename. The working directory lets the executable find `file.cio` and the rest of the scenario without copying them beside the project or executable.

The setting is user-specific and is not present in the shared [`SWAT.vfproj`](../../../VSProj/SWAT/SWAT/SWAT.vfproj) XML. Recheck it after moving the workspace or changing scenarios.

## Verified `Debug|x64` settings

| Property | Current value | Meaning |
| --- | --- | --- |
| Compiler | Intel `ifx` | LLVM-based Intel Fortran compiler. |
| Multi-processor Compilation | Yes | Compiles independent sources concurrently; it does not parallelize SWAT+ execution. |
| Preprocess Source File | Yes | Processes compiler-condition directives in `.f90` sources. |
| Optimization | Disabled | Supports predictable source-level stepping and variable inspection. |
| Debug information | Enabled | Supplies symbols to the debugger. |
| Interface warnings | Enabled | Helps detect calling-interface mismatches. |
| Traceback | Enabled | Preserves the failure call path. |
| Bounds check | Enabled | Detects invalid array indexing. |
| Stack-frame check | Enabled | Adds runtime stack diagnostics. |
| Runtime Library | Multithreaded Debug DLL | Matches the Debug configuration. |

The current Release configurations use the multithreaded DLL runtime. Keep the runtime choice compatible across all linked objects and libraries. A DLL runtime also means another machine may need the matching Intel redistributable runtime.

## Preprocessing evidence

The source contains `#if`, `#ifdef`, `#elif`, and `#endif` blocks in files including:

- [`utils.f90`](../../../SRC_GitHub_Repository/src/utils.f90)
- [`swift_output.f90`](../../../SRC_GitHub_Repository/src/swift_output.f90)

On Windows, Intel does not automatically preprocess ordinary lowercase `.f90` files by default, so the Visual Studio **Preprocess Source File: Yes** setting is functionally important.

## Configuration scope

Visual Studio properties are configuration- and platform-specific. The current `SWAT.vfproj` explicitly enables multi-processor compilation and preprocessing for `Debug|x64`, but not for every other configuration. Confirm the property-page selectors before editing or diagnosing a setting.

For Release builds, preprocessing should be confirmed because it affects source meaning. Multi-processor compilation is optional for correctness and only affects build time.

## Primary evidence

- Local project: [`SWAT.vfproj`](../../../VSProj/SWAT/SWAT/SWAT.vfproj)
- Upstream SWAT+ guide: [`doc/VS-Win.md`](../../../SRC_GitHub_Repository/doc/VS-Win.md)
- Intel: [fpp preprocessing](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2024-2/fpp-preprocessing.html)
- Intel: [multiple compiler processes (`/MP`)](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2023-0/multiple-processes-mp.html)
- Intel: [multithreaded runtime options](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2025-1/threads.html)

## Related notes

- [`Osu_1hru` debug scenario](osu-1hru-scenario.md)
- [Main-program generation](../architecture/main-program-generation.md)

