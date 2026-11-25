# Formalization progress at the opening of Version 01

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The exact serving model and effort are unavailable. This is a dated review of the working checkout at `cec037fa20d8b9e74636e4c313e802df9f71bd3d`. Later progress belongs in the [live register](REGISTER.md). [Overview 01](../research-overview/01_OVERVIEW.md) · [Plan 01](../research-plan/01_PLAN.md)

## Lean evidence

The package has one public library, `SectionsAndConnections`. Its entry point imports the three-axis module. In orthonormal coordinates, for a real symmetric trace-free $3\times3$ matrix $W$, the checked theorem states

$$
\sum_i q_i^2=\tfrac34\sum_i W_{ii}^2+\sum_{i<j}W_{ij}^2,\qquad
\tfrac12\sum_{i,j}W_{ij}^2\le\sum_i q_i^2 .
$$

Here $q_i$ is the magnitude of the **complex-bilinear** evaluation on $(n_j+\mathrm i n_k)/\sqrt2$ for the cyclic triple. The definition, exact component expansion, equality and bound are in the [proof module](../../SectionsAndConnections/ThreeAxisWeyl.lean). Passage from this matrix to a smooth chiral Weyl field and the differential section-energy inequality are further steps.

| Check performed at this review | Result |
| --- | --- |
| `lean --version`, `lake --version` inside the package | Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`. Lake `5.0.0-src+470d5ce`. |
| Compare each installed dependency HEAD and its tracked working tree to [lake-manifest.json](../../lake-manifest.json) | All ten HEADs matched, all tracked trees clean. Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. |
| `lake build` | Passed, 1,619 jobs reported. |
| Import the public library, inspect the theorem type and print the axioms of both mathematical declarations | The hypotheses are `W : Matrix (Fin 3) (Fin 3) ℝ`, `W.IsSymm`, and `W.trace = 0` for the estimate. Both proofs reported exactly `propext`, `Classical.choice`, `Quot.sound`. |
| Inspect the [blueprint source](../../blueprint/src/content.tex) against the [pilot's register](../01_sections_and_connections/research-progress/REGISTER.md) | Null evaluations and the three-axis statement and proof carry `\leanok`. The flat TT symbols and chiral wedge/Levi–Civita statements have no checked proofs. The annular theorem and its supplied-control corollary are blueprint mathematics. `problem:almost-bach-flat-control` is open. |

To reproduce the declaration checks from `formalization/`:

~~~sh
lake build
lake env lean --stdin <<'LEAN'
import SectionsAndConnections
#check SectionsAndConnections.threeAxisWeylEstimate
#print axioms SectionsAndConnections.axisNullEvaluation_eq
#print axioms SectionsAndConnections.threeAxisWeylEstimate
LEAN
~~~

The pilot's B03 settled the coordinate pairing, E01 is verified, B01 and B02 are ready decisions, and E02–E04 await their prerequisites. This is the opening snapshot of the [pilot register](../01_sections_and_connections/research-progress/REGISTER.md), which continues to own those IDs. The package and blueprint acquired no new proof in this review.

## Scientific inputs

The following digests were recomputed from the working files. The revisions identify the last commit touching each input at this review. A source revision identifies the statement a future proof should match. The mathematical registers and brainstorms supply the authors' evidence and proposed interfaces.

| Input | Revision | SHA-256 |
| --- | --- | --- |
| [FOT · First-order twistor manuscript][FOT] | `f178fbb` | `2e11413d0e3a25a059ae6e8375c0bdd361fb25fcb8dfad6c5c7e4d34d7f6bfa0` |
| [SEC · Sections and Connections][SEC] | `f6e10f0` | `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66` |
| [DIR · Dirac and Twistor Spinors][DIR] | `0a0abde` | `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d` |
| [CME · Chiral Metric Evolution, selected inputs][CME] | `5417865` | `8f7c71f36835f62acdd587960d8b61108908dd3fc1b50ab8b74a2549752796f6` |
| [Adopted shared collar program][map] | `cec037f` | `7013026681f23229435c294e0f7de75956c1eaab5d0d72ea029658e707aa425d` |
| [Neck energy accounting][account] | `f6e10f0` | `72297da14a0251c07d8710affbbdcbc36038c874c8e4474731cc45e5c86ded49` |
| [Chiral, Dirac and surgery approaches][comp] | `f6e10f0` | `67afb86d232278c0c3a2af58fbbccc78672f6f216ae54738ab1c4b84f63cc2bf` |
| [Using a supplied collar][cut] | `f6e10f0` | `147f51a5b426a3ba25af6c643023a768ae61f6681ad7c561c1752dce3fe6747b` |
| [Reviewed neck proposal, including the adoption note][proposal] | `cec037f` | `9477e81a5619fd0f91d3cb32f8c265f5ff061a51d6f2ee0668f892a3be5f0672` |
| [Relaxing collar hypotheses for Dirac matching][relax] | `fb37f1b` | `da1ead482b9241d1d07bdf8ff66df38cdae6e1812c13a328972b82bfb60fe57c` |
| [NECK plan][neck] | `cec037f` | `eee51b3c155f4396d9d7ea7bd3104ca4c779784f8fd091209d028fb3c7234cdc` |
| [EXTRACT plan][extract] | `cec037f` | `caf24a8987751f9fcfdc57e9584bc8ad79cc86630e4ca2d7903af6ef2e9ca0b0` |
| [MATCH plan][match] | `cec037f` | `cb34a1b726ed2cae567b871611888844253ada12f55d8598ba9eff24e54c4d2d` |
| [Lean pilot module](../../SectionsAndConnections/ThreeAxisWeyl.lean) | `cec037f` | `003da61e9d593fbc9c1c61b900098ac9de3c0c6768202314add227583efd3350` |
| [Blueprint content](../../blueprint/src/content.tex) | `cec037f` | `e97c1131cf0bfdbd62a10adff7e517eacbb7cc8ebee80cead6a571398aa6a278` |
| [Lake manifest](../../lake-manifest.json) | `3348250` | `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239` |

The parent manuscript's recognition and first-order equivalences, the child manuscripts' labeled results, and the adopted branch plans determine scope. In the opening revision, SEC reached E61 with B36/E62 the next decision/test. DIR reached E50 with B24/E51 the next decision/test. The three collar branches also began joint mathematical research in the working tree during this review. [Parent register][shreg] · [SEC register][sreg] · [DIR register][dreg] · [NECK, EXTRACT and MATCH ownership][map]

## Joint collar work

Version 01 includes the following working-tree inputs selected on **25 November 2026**, after the opening checkout was recorded. These SHA-256 prefixes identify the versions reviewed, including same-session revisions. Their authors give mathematical derivations under the stated assumptions. The paper registers own their assessment. None had an associated Lean proof at this baseline. Recheck those registers and the file versions before issuing a proof packet. [Joint mathematical assessment](../../../papers/investigations-1/03_first_order_twistor/reviews/JOINT_COLLAR_ASSESSMENT_20261125.md)

| Paper branch | Inputs and SHA-256 prefixes | Consequence for the plan |
| --- | --- | --- |
| NECK | [E01 two-cap audit][n1] `58969f8b827d`, [E03 embedded cut][n3] `6ecef368cfe3`, [E02/E05 same-type descent][n25] `61d01e1cf53b` | Formalize the cap costs and their order of choices, the actual compactification-ball marking, and the resulting lower-energy competitor on $M$. A near-minimizer with $e-I^+(M)<\kappa_\delta$ excludes this kind of nonflat bubble. |
| NECK, weaker inputs | [E06 weak cap][n6] `8ba857d4da3c`, [E07 first-order cap][n7] `350b86f03790`, [E08 quotient-link test][n8] `77516d152f16` | Keep the weak splice estimates separate from $C^4$ Bach costs. E08 assumes an embedded quotient collar and an exact-product replacement on the closed source within the specified energy margin. |
| NECK, finite cuts and scale selection | [E09 finite-puncture transfer][n9] `2d83a8631548`, [E10 nonsplitting][n10] `899cab9f56ed`, [E11 volume and balanced block][n11] `83a16b35c301` | E09 uses a single oriented comparison of whole truncations around finitely many smooth punctures. E10 tracks the energy outside a surviving capped summand on a near-minimizer. E11 obtains a ball-volume lower bound and selects a low-energy block when chiral quantile radii separate. A usable chart in that block is an additional input. |
| EXTRACT | [E01 chart calibration][x1] `a0e76662f95e`, [E02 ALE strip][x2] `75a52db87e33`, [E03 measured slices][x3] `a87ca4b2073b`, [E04 diagonal end][x4] `c7051991c2d8` | Separate realization on a supplied ALE end from a chart on the entire gap to another component. The diagonal gives an energy estimate up to an outer scale chosen by convergence. |
| MATCH | [E01 round inverse][m1] `35a75f5e023e`, [E02 fixed-domain perturbation][m2] `cd0f3cfb8bb6`, [E03 varying slices][m3] `7573a2a1f546` | Keep endpoint projectors, complementary adjoint domain, spectral gap and length-uniform norm in the theorem. A varying-domain statement needs its own hypotheses. |
| MATCH, actual fields | [E04 ball/pole traces][m4] `bc4c9a5828da`, [E05 weighted residual][m5] `241d68d88fe1`, [E06 actual core graphs][m6] `93dd8bc69d67` | Exact-product cores with suitable fillings admit a genuine graph test. The weighted error and any uncovered energy remain separate inputs on the original sequence. |
| MATCH, closed jumps and transmission | [E07 original-source jump solver][m7] `e5ab7c268669`, [E08 global critical mass][m8] `b79b90905df9`, [E09 weighted transmission][m9] `0386c2ad0241` | Separate the local trace bound on four faces from the global mass estimate for a regular correction. A prescribed Green pole needs separate normalization. The weighted strip estimate also tests whether bounded incoming data can sustain a joint interior floor. |

## Primary dependencies worth checking early

| Consumer in Plan 01 | Dependency and exact premise | Record of inspection |
| --- | --- | --- |
| E03–E06 | Hirzebruch §4, eq. (16) for the closed oriented signature identity. Conformal development uses a simply connected, locally conformally flat source and compactness. Atiyah–Hitchin–Singer Theorem 4.1 needs the chirality translation. | Existing [shared source guide](../../../papers/investigations-1/03_first_order_twistor/references/README.md). |
| E04 and E13 | Chang–Gursky–Yang Theorem A uses $Y([g])>0$ and a **strict** full-tensor energy inequality. At equality E13 uses the topology alternatives of Theorem B and Chang–Chen Theorem 2.1 with standard smooth type already established. | Theorem A and Remarks 1–2 rechecked in the [primary text](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3). Further equality inputs are in [SEC source records R95–R97](../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026). |
| E10–E13 | Critical regularity in a supplied $W^{2,q}$ gauge, end Euler/signature corrections, smooth link exclusions, and end removability all need distinct declarations. Ache–Viaclovsky removal requires the scalar-curvature and end regularity used in SEC §11.4. | Existing [SEC records R91–R98](../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026). |
| E13–E17 | Chang–Qing–Yang Theorems 2.4 and 3.1 use the exact Bach equation in positive Yamabe gauge. Theorem 3.1 also uses $b_1=0$, the specified annulus, an inner area bound, scale separation and small annular curvature. Its link can be a spherical quotient. | Hypotheses rechecked in [arXiv:math/0508621v2](https://arxiv.org/pdf/math/0508621v2#page=8). |
| E18–E24 | Friedrich's prolongation, Schrödinger–Lichnerowicz, conformal bundle comparison, relative Dirac invertibility and Green asymptotics serve different steps. Bär Theorem 1 gives the spectrum of the **unit round** link. | [DIR source guide](../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/references/README.md). The product gap was rechecked against [Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf#page=6). |
| E25 | Extension of the actual $S^3$ gluing map across a standard ball uses the component theorem for $\mathrm{Diff}(S^3)$, with orientations fixed. This suffices for connected-sum reconstruction. The topology of a capped summand alone does not identify it smoothly. | Existing [surgery comparison and Hatcher reference][comp]. |

At the dependency pins, Mathlib has files for exterior-power Hodge star, Clifford algebra/spin group, Sobolev inequalities and diffeomorphisms. The geometry dependency has Riemannian curvature and pullback APIs. These are leads for B01/B04. Each import still needs a type, convention and axiom audit before it can close a geometric leaf. [Pilot API/source assessment](../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/brainstorm/notes/LEAN_FORMALIZATION_PILOT_20261125.md)

[FOT]: ../../../papers/investigations-1/03_first_order_twistor/manuscript/first_order_twistor_and_smooth_poincare.tex
[SEC]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex
[DIR]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex
[CME]: ../../../papers/investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex
[map]: ../../../papers/investigations-1/03_first_order_twistor/brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md
[account]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/NECK_GEOMETRY_AND_ENERGY_ACCOUNTING_20261125.md
[comp]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/CHIRAL_DIRAC_AND_SURGERY_APPROACHES_20261125.md
[cut]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md
[proposal]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/PROPOSED_OVERVIEW_AND_PLAN_20261125.md
[relax]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md
[neck]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/research-plan/PLAN.md
[extract]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/research-plan/PLAN.md
[match]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/research-plan/PLAN.md
[shreg]: ../../../papers/investigations-1/03_first_order_twistor/research-progress/REGISTER.md
[sreg]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/research-progress/REGISTER.md
[dreg]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/research-progress/REGISTER.md
[n1]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md
[n3]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md
[n25]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md
[n6]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E06_WEAK_CAP_20261125.md
[n7]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md
[n8]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E08_QUOTIENT_LINK_TEST_20261125.md
[n9]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md
[n10]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E10_NONSPLITTING_MINIMIZERS_20261125.md
[n11]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md
[x1]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E01_BUFFERED_SPIN_STRIP_20261125.md
[x2]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E02_ALE_SPIN_TRANSFER_20261125.md
[x3]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E03_NORMAL_SLICE_MEASUREMENTS_20261125.md
[x4]: ../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E04_DIAGONAL_END_20261125.md
[m1]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E01_ROUND_INVERSE_20261125.md
[m2]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E02_FIXED_PROJECTION_PERTURBATION_20261125.md
[m3]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E03_VARYING_INVERSE_20261125.md
[m4]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E04_BALL_AND_POLE_TRACES_20261125.md
[m5]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E05_NORMALIZATION_AND_RESIDUAL_20261125.md
[m6]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E06_ACTUAL_CORE_GRAPHS_20261125.md
[m7]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E07_GLOBAL_JUMP_SOLVER_20261125.md
[m8]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E08_GLOBAL_CRITICAL_MASS_20261125.md
[m9]: ../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E09_WEIGHTED_TRANSMISSION_20261125.md
