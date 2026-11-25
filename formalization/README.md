# Lean formalization

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning effort
are unavailable.

This directory contains the Lean package and its toolchain configuration.
The first pilot follows the Sections and Connections manuscript.
The [three-axis Weyl module](SectionsAndConnections/ThreeAxisWeyl.lean)
proves the exact identity and Hilbert–Schmidt lower bound for a symmetric
trace-free real matrix in orthonormal coordinates.
The proposed targets and conventions are in the [pilot note](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/brainstorm/notes/LEAN_FORMALIZATION_PILOT_20261125.md).
The [Lean Blueprint](blueprint/README.md) records their statements, proof
dependencies, and the open neck hypotheses.

Use the [formalization setup workflow](FORMALIZATION_SETUP_WORKFLOW.md)
and [investigation index](investigations/README.md) to plan and track
Lean proofs.

`lakefile.toml` pins `DifferentialGeometry` v0.1.4 to commit
`788efe97894474c032de6dfb1289d515f613d15a`. That release uses Lean and
Mathlib v4.35.0-rc3. Lake resolves Mathlib through the upstream dependency.
[Upstream release](https://github.com/qinz1yang/differential-geometry/releases/tag/v0.1.4)

With Elan installed, build from this directory.

```sh
lake build
```

The first successful dependency resolution generates `lake-manifest.json`
for version control. Lake stores dependency checkouts and build products
under the ignored `.lake/` directory. Use `lake update` when changing the
dependency pin. [Lake reference](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/)
