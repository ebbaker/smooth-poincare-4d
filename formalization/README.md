# Lean formalization

**Edition 07 · FOT-E54 · 27 November 2026.** The wider native switch exceeds the entry budget. The returned HMP tube admits a relative trace comparison and the capped Euclidean core has a directly computed Euler integral. [Assessment](investigations/reviews/ED07_E54_RELATIVE_TRACE_WIDENED_SWITCH_AND_CAP.md) · [Verification](investigations/research-progress/handoffs/ED07_E54_VERIFICATION_20261127.md)

**27 November 2026 · Edition 07, FOT-E53.** The exact long-cuff width-1/16 trial exceeds both signed energy budgets. The marked meridian, two positive round caps and one buffered Euclidean truncation have geometric realizations. [Assessment](investigations/reviews/ED07_E53_GEOMETRIC_INSTANCES_AND_FIXED_WIDTH.md) · [Public verification](investigations/research-progress/handoffs/ED07_E53_VERIFICATION_20261127.md)

**27 November 2026 · Edition 07 proof milestone E52.** The current public proof and geometric dependencies are recorded in the [E52 assessment](investigations/reviews/ED07_E52_MARKED_CUTS_AND_CLOSED_CAPS.md) and [verification](investigations/research-progress/handoffs/ED07_E52_VERIFICATION_20261127.md).

**Edition 07 at issue · 27 November 2026.** The program tracks positive entry and recognition of every entered type separately. Its first proof target is the degree of a separator on a marked band. FOT-E51 is the verified Lean baseline. [Overview](investigations/research-overview/07_OVERVIEW.md) · [Proof plan](investigations/research-plan/07_PLAN.md) · [Progress at issue](investigations/research-progress/07_BASELINE.md) · [Continuation](investigations/continuation-notes/EDITION_07_ENTRY_AND_MARKED_RECOGNITION_20261127.md)

**Edition 06 · FOT-E51 · 26 November 2026.** One common harmonic realization now bounds the metric and trace-free Ricci in $W^{2,6}$ at both stationary scales, given Peters and the flat scalar estimate. On a fixed positive-parameter stationary pointed limit, finite scalar-square energy and the physical volume and completeness hypotheses force scalar flatness. [Assessment](investigations/reviews/ED06_E51_HARMONIC_ESTIMATES_AND_TERMINAL_LIMITS.md) · [Public verification](investigations/research-progress/handoffs/ED06_E51_VERIFICATION_20261126.md) · [Continuation](investigations/continuation-notes/AFTER_E51_COUPLED_INTERIOR_AND_POINTED_SCALAR_20261126.md)

**Edition 06 · FOT-E50 · 26 November 2026.** Derived the curvature-commuted gradient along the original metric family, its conformal trace and terminal dissipation. Verified the physical harmonic chart transport and end-link integral estimate, and carried one post-attainment Ricci margin through both extractions. [Assessment](investigations/reviews/ED06_E50_PHYSICAL_VARIATION_AND_EXTRACTIONS.md) · [Verification](investigations/research-progress/handoffs/ED06_E50_VERIFICATION_20261126.md) · [Continuation](investigations/continuation-notes/AFTER_E50_ORIGINAL_GRADIENT_AND_SECOND_EXTRACTION_20261126.md)

**Edition 06 · FOT-E49 · 26 November 2026.** [Assessment](investigations/reviews/ED06_E49_PHYSICAL_ADJOINT_AND_MARKED_EXTERIOR.md) · [Public verification](investigations/research-progress/handoffs/ED06_E49_VERIFICATION_20261126.md) · [Continuation](investigations/continuation-notes/AFTER_E49_PHYSICAL_ADJOINT_AND_MARKED_EXTERIOR_20261126.md)

**Edition 06 · 26 November 2026.** The [overview](investigations/research-overview/06_OVERVIEW.md) and [proof plan](investigations/research-plan/06_PLAN.md) assign eight open problems across entry, marked surgery, fixed-type attainment and rigidity. [Setup baseline](investigations/research-progress/06_BASELINE.md) · [Edition 06 continuation](investigations/continuation-notes/EDITION_06_RIGIDITY_AND_GEOMETRIC_INPUTS_20261126.md)

**Edition 05 · FOT-E48.** Uniform normal charts on both physical stationary scales, harmonic-coordinate Ricci estimates, and the conformal trace of the original functional are checked. [Assessment](investigations/reviews/ED05_E48_STATIONARY_BALLS_AND_VARIATION.md) · [Public verification](investigations/research-progress/handoffs/ED05_E48_VERIFICATION_20261126.md) · [E48 handoff](investigations/continuation-notes/AFTER_STATIONARY_BALLS_AND_VARIATION_20261126.md)

**Edition 05 setup · 26 November 2026.** [Start with the original flows and marked return](investigations/continuation-notes/EDITION_05_BOUR_ATTAINMENT_20261126.md).

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning effort
are unavailable.

The [Edition 05 overview](investigations/research-overview/05_OVERVIEW.md) pairs the two Bour investigations with the separate entry and attained-rigidity problems. [Issued plan 05](investigations/research-plan/05_PLAN.md) · [Proof owners](investigations/README.md#proof-investigations) · [Baseline and pins](investigations/research-progress/05_BASELINE.md) · [Checked E47 milestone](investigations/reviews/ED05_E47_BOUR_BUDGET_AND_MARKED_RETURN.md)

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
