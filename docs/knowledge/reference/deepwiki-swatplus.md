---
title: DeepWiki SWAT+ source explorer
kind: knowledge
status: verified
created: 2026-07-10
updated: 2026-07-10
source_revision: cb442f7c05fc3bfc34349c446010f452d2737ca0
scenario: general
tags: [reference, deepwiki, external-resource, source-navigation]
external_url: https://deepwiki.com/swat-model/swatplus
external_checked: 2026-07-10
---

# DeepWiki SWAT+ Source Explorer

## Decision

Record a curated map to the [SWAT+ DeepWiki](https://deepwiki.com/swat-model/swatplus) rather than downloading a full copy.

DeepWiki is useful for discovering subsystems, diagrams, related source files, and possible call paths. A local mirror would duplicate a dynamic generated site, lose refresh context, and become stale. Our authoritative evidence remains the checked-out source in [`SRC_GitHub_Repository`](../../../SRC_GitHub_Repository).

## Trust level

Use DeepWiki as a **secondary discovery aid**, not as proof that a statement is true for our source revision or active scenario.

Before promoting a DeepWiki statement into canonical knowledge:

1. Check the **Last indexed** date and commit on the specific DeepWiki page.
2. Compare that commit with the local source revision.
3. Open every important cited file in `SRC_GitHub_Repository/src`.
4. Confirm exact routines, branches, data fields, units, and indices locally.
5. For scenario-dependent behavior, confirm the path with `Osu_1hru` inputs or a debugger trace.
6. Cite local files and traces in our canonical note; retain DeepWiki only as a related external reference.

DeepWiki diagrams and summaries can suggest where to look, but they do not prove which alternate object/process implementation a scenario selects.

## Revision audit on 2026-07-10

Our local SWAT+ source was:

```text
commit:  cb442f7c05fc3bfc34349c446010f452d2737ca0
describe: 62.0.0-2-gcb442f7
```

DeepWiki exposes an index revision separately on each page. The pages were not uniform:

| DeepWiki area | Last indexed | Indexed commit | Relative to local source |
| --- | --- | --- | --- |
| [Overview](https://deepwiki.com/swat-model/swatplus) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Main Program and Time Control](https://deepwiki.com/swat-model/swatplus/2.1-main-program-and-time-control) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Command System](https://deepwiki.com/swat-model/swatplus/2.2-command-system) | 2025-04-28 | `02cda6` | Older; verify carefully. |
| [Basin Configuration](https://deepwiki.com/swat-model/swatplus/2.3-basin-configuration) | 2026-03-31 | `ae1136` | Older than local HEAD. |
| [Soil Carbon and Nutrient Processes](https://deepwiki.com/swat-model/swatplus/3-soil-carbon-and-nutrient-processes) | 2026-03-31 | `ae1136` | Older than local HEAD. |
| [Land Management Operations](https://deepwiki.com/swat-model/swatplus/4-land-management-operations) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Channel and Water Body Processes](https://deepwiki.com/swat-model/swatplus/5-channel-and-water-body-processes) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Output System](https://deepwiki.com/swat-model/swatplus/6-output-system) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Model Calibration](https://deepwiki.com/swat-model/swatplus/7-model-calibration) | 2026-07-07 | `cb442f` | Matches local HEAD prefix. |
| [Groundwater Flow Module](https://deepwiki.com/swat-model/swatplus/7.2-groundwater-flow-module) | 2026-03-31 | `ae1136` | Older than local HEAD. |
| [Build System and Deployment](https://deepwiki.com/swat-model/swatplus/8-build-system-and-deployment) | 2026-03-31 | `ae1136` | Older than local HEAD. |

This mixed revision state is the main reason not to save the website as a frozen local knowledge source. Recheck page headers when returning later.

## Navigation map

### Architecture and configuration

- [Overview](https://deepwiki.com/swat-model/swatplus)
- [Core Architecture](https://deepwiki.com/swat-model/swatplus/2-core-architecture)
- [Main Program and Time Control](https://deepwiki.com/swat-model/swatplus/2.1-main-program-and-time-control)
- [Command System](https://deepwiki.com/swat-model/swatplus/2.2-command-system)
- [Basin Configuration](https://deepwiki.com/swat-model/swatplus/2.3-basin-configuration)

### Soil, carbon, and nutrients

- [Soil Carbon and Nutrient Processes](https://deepwiki.com/swat-model/swatplus/3-soil-carbon-and-nutrient-processes)
- [Soil Initialization](https://deepwiki.com/swat-model/swatplus/3.1-soil-initialization)
- [Carbon Cycling](https://deepwiki.com/swat-model/swatplus/3.2-carbon-cycling)
- [Nutrient Cycling and Transport](https://deepwiki.com/swat-model/swatplus/3.3-nutrient-cycling-and-transport)

### Land management

- [Land Management Operations](https://deepwiki.com/swat-model/swatplus/4-land-management-operations)
- [Tillage Operations](https://deepwiki.com/swat-model/swatplus/4.1-tillage-operations)
- [Plant Operations](https://deepwiki.com/swat-model/swatplus/4.2-plant-operations)
- [Fertilizer and Chemical Applications](https://deepwiki.com/swat-model/swatplus/4.3-fertilizer-and-chemical-applications)

### Channels and water bodies

- [Channel and Water Body Processes](https://deepwiki.com/swat-model/swatplus/5-channel-and-water-body-processes)
- [Channel Control and Sediment](https://deepwiki.com/swat-model/swatplus/5.1-channel-control-and-sediment)
- [Reservoirs and Wetlands](https://deepwiki.com/swat-model/swatplus/5.2-reservoirs-and-wetlands)
- [Pesticide Transport in Water](https://deepwiki.com/swat-model/swatplus/5.3-pesticide-transport-in-water)

### Outputs

- [Output System](https://deepwiki.com/swat-model/swatplus/6-output-system)
- [Carbon and Nutrient Outputs](https://deepwiki.com/swat-model/swatplus/6.1-carbon-and-nutrient-outputs)
- [Hydrologic and Water Quality Outputs](https://deepwiki.com/swat-model/swatplus/6.2-hydrologic-and-water-quality-outputs)
- [Output Configuration](https://deepwiki.com/swat-model/swatplus/6.3-output-configuration)

### Calibration and groundwater

- [Model Calibration](https://deepwiki.com/swat-model/swatplus/7-model-calibration)
- [Parameter Selection and Modification](https://deepwiki.com/swat-model/swatplus/7.1-parameter-selection-and-modification)
- [Groundwater Flow Module](https://deepwiki.com/swat-model/swatplus/7.2-groundwater-flow-module)

### Build and development

- [Build System and Deployment](https://deepwiki.com/swat-model/swatplus/8-build-system-and-deployment)
- [Building and Testing](https://deepwiki.com/swat-model/swatplus/8.1-building-and-testing)
- [IDE and Developer Environment Setup](https://deepwiki.com/swat-model/swatplus/8.2-ide-and-developer-environment-setup)

## Best uses in this project

- Get an initial list of relevant `.f90` files for a subsystem.
- Use diagrams to form a trace hypothesis.
- Jump from a model concept to cited source lines.
- Identify alternate implementations that must be distinguished locally.
- Compare DeepWiki's topic taxonomy with our canonical knowledge gaps.

## Uses to avoid

- Treating generated prose as a replacement for reading the source.
- Copying equations, units, defaults, or control-code meanings without checking the current local files.
- Assuming the parent overview's index revision applies to every child page.
- Assuming a cited routine is active in `Osu_1hru` without tracing object and option selection.
- Copying the entire website into `docs/knowledge/` and allowing it to compete with verified canonical notes.

## Local related records

- [Knowledge-base home](../../README.md)
- [High-level simulation control flow](../architecture/simulation-control-flow.md)
- [Main-program generation](../architecture/main-program-generation.md)
- [`Osu_1hru` scenario](../debugging/osu-1hru-scenario.md)
- [End-to-end trace method](../../traces/README.md)

