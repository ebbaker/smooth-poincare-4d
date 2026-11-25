# Lean formalization

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning effort
are unavailable.

The [current program](investigations/research-overview/OVERVIEW.md) follows the master manuscript on a fixed smooth homotopy four-sphere, with separate proof routes for physical scales, fixed-type descent, immersed curvature and Morse heights. [Edition 03 plan](investigations/research-plan/03_PLAN.md) · [Route index](investigations/README.md#proof-investigations) · [Global Gauss geometry and marked collars](investigations/reviews/GLOBAL_GEOMETRY_AND_SELECTED_COLLARS_20261125.md)

The Lake package has three public imports.

| Import | Purpose |
| --- | --- |
| [SectionsAndConnections](SectionsAndConnections.lean) | Coordinate Weyl pilot and finite residual arithmetic. |
| [FirstOrderTwistor](FirstOrderTwistor.lean) | Existing neck-accounting, marked-cut and spinor proofs. The [route-to-module index](FirstOrderTwistor/README.md) locates the main results and their owners. |
| [SmoothPoincare](SmoothPoincare.lean) | Actual measured repairs and two-sided cuts, quantiles of the physical minimizing sequence, principal curvature of an isometric immersion, and the conditional height and Codazzi results. [Verified results and hypotheses](investigations/research-progress/handoffs/ED03_INTEGRATION_20261125.md) |

The first pilot follows the Sections and Connections manuscript.
The [three-axis Weyl module](SectionsAndConnections/ThreeAxisWeyl.lean)
proves the exact identity and Hilbert–Schmidt lower bound for a symmetric
trace-free real matrix in orthonormal coordinates.
The proposed targets and conventions are in the [pilot note](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/brainstorm/notes/LEAN_FORMALIZATION_PILOT_20261125.md).
The [Lean Blueprint](blueprint/README.md) records their statements, proof
dependencies, and the open neck hypotheses.

The [FirstOrderTwistor library](FirstOrderTwistor.lean) contains the Route 02 proofs of energy accounting from convergence on fixed truncations and bounds on all remaining regions. It includes the four-slot/chiral conversion and fixed-domain comparisons for the metric’s Levi–Civita curvature and Riemannian volume. It also exposes the [marked single-cut descent theorems](investigations/03_single_cut_descent/README.md). [Verified statements and remaining geometric inputs](investigations/02_neck_energy_accounting/research-progress/REGISTER.md)

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
