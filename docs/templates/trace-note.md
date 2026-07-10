---
title: <specific input-to-output behavior>
kind: trace
status: partial
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
source_revision: <Git commit or unknown>
scenario: <scenario name>
tags: [trace, <topic>]
---

# <Trace title>

## Question

<The concrete behavior this trace will prove.>

## Reproduction context

- Build configuration: <configuration and compiler>
- Scenario: <path or name>
- Simulation date/object: <relevant date and object indices>
- Expected signal: <watched value or output>

## Evidence chain

| Stage | Input/file | Source routine | Stored value/index | Evidence |
| --- | --- | --- | --- | --- |
| Input | <field> | <reader> | <field/index> | <observation> |
| Control | <selector> | <controller> | <object/index> | <observation> |
| Process | <state> | <routine> | <result> | <observation> |
| Output | <control> | <writer> | <file/column> | <observation> |

## Breakpoints and watches

<Exact routines, conditions, indices, and variables.>

## Result

<What the evidence proves.>

## Unresolved links

<Any part of the path that remains inferred or unobserved.>

## Knowledge promoted

<Links to canonical notes updated from this trace.>

