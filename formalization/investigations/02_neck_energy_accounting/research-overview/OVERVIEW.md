# Full neck energy accounting · Research overview

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md) · [Route plan](../research-plan/PLAN.md) · [Route register](../research-progress/REGISTER.md)

## What a whole-neck estimate would prove

Fix a smooth, closed, oriented Riemannian homotopy four-sphere $M$. Work in one chirality with $E_+(g;U)=\int_U |W^+|_{\mathrm{HS}}^2\,dV_g$. Supply smooth, volume-one positive Yamabe minimizers $g_i$ with $E_+(g_i)\to e$, $4\pi^2\le E_+(g_i)\le8\pi^2-\delta$ for fixed $\delta>0$, and $\int_M|B_{g_i}|\,dV_i\to0$. Use the same subsequence for all component comparisons. [SEC §11.1, source and norms](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

The principal theorem concerns a finite family consisting of a smooth compactifiable base and smooth asymptotically locally Euclidean (ALE) comparison components with the oriented embeddings, regularity and end decay of SEC §§11–12. Disjoint truncations give an energy inequality. To obtain equality one must also estimate the energy of **every** remaining point, including the transitions at both ends of each neck. [SEC §12.4, accounting](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4700) · [Neck accounting note](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/NECK_GEOMETRY_AND_ENERGY_ACCOUNTING_20261125.md)

$$
e=e_0+\sum_{j\in J} e_j.
$$

A nonflat bubble of this class has $e_j>4\pi^2$ and leaves $0<e-e_j<4\pi^2-\delta$. The closed-component gap then forces the base and all other bubbles to have zero energy. Equality would give $e=e_j$, contradicting the strict residual. Hence $e=e_0$, with every bubble flat. The base may still carry a positive closed critical value. E01 formalizes the finite arithmetic. E17 must derive **each** of its premises in the geometric setting. [SEC §15, consequence of an energy identity](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6507)

## Where the other routes enter

A length-independent chart estimate or an intrinsic transverse-field estimate can supply the requisite control on a given annulus. The spinor route offers another contribution when its differentiated estimates and joint lower bounds cover the residual. For separated scales $r_i/R_i\to0$, take $\limsup_i$ on $Lr_i<\rho<R_i/L$ at fixed $L$, then let $L\to\infty$. Covers with a growing number of strips require a bound on their total error. A slow outer radius chosen by convergence on one ALE end can leave an uncontrolled gap to a prescribed neighboring scale. [Blueprint, energy in a supplied annular chart](../../../blueprint/src/content.tex#L152) · [Diagonal-end estimate](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E04_DIAGONAL_END_20261125.md) · [Dirac route](../../04_dirac_collar_transmission/research-overview/OVERVIEW.md)

Route 03 reuses our band, compactification and gap estimates to obtain a lower-energy competitor from one marked cut. Its proof can proceed even when this route lacks a global accounting identity. The geometric extraction of the full family, a uniform chart or transverse field on the actual necks, and control of singular intermediate regions are open inputs for this program. [Single-cut route](../../03_single_cut_descent/research-overview/OVERVIEW.md) · [Mathematical neck investigation](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/research-progress/REGISTER.md)

## Inputs at setup

The Version 01 sources below are recorded at `6879850c01a741618210815be0cc8041abe45a94`. Their SHA-256 prefixes identify the exact inputs for this route. The package uses Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. The [Lake manifest](../../../lake-manifest.json) pins all ten packages. The numbered program baseline records the full source digests and revisions. [Reproducible baseline](../../research-progress/01_BASELINE.md)

| Input | SHA-256 prefix |
| --- | --- |
| [Sections and Connections manuscript](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex) | `329513a3cfd8e939` |
| [Neck energy-accounting note](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/NECK_GEOMETRY_AND_ENERGY_ACCOUNTING_20261125.md) | `72297da14a0251c0` |
| [Diagonal ALE end](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E04_DIAGONAL_END_20261125.md) | `c7051991c2d8ee2a` |
| [Shared blueprint](../../../blueprint/src/content.tex) | `e97c1131cf0bfdbd` |

The existing pilot's three-axis Weyl theorem is Lean-verified. The route's geometric claims are manuscript results or conditional working derivations awaiting formalization. [Current route evidence](../research-progress/REGISTER.md) · [Pilot evidence](../../01_sections_and_connections/research-progress/REGISTER.md)
