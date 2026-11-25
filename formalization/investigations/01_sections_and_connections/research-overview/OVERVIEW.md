# Overview

25 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The serving model identifier and reasoning
effort for this setup are unavailable.

Formalize three results from the
[Sections and Connections manuscript](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex).
The [pilot note](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/brainstorm/notes/LEAN_FORMALIZATION_PILOT_20261125.md)
records the upstream sources. The
[blueprint source](../../../blueprint/src/content.tex) gives the
statements and proof sketches used at setup.

| Pilot result | Manuscript label | Blueprint label | Hypotheses and conventions |
| --- | --- | --- | --- |
| Three-axis Weyl estimate | `secjet:orthogonal` | `lem:three-axis-weyl` | Real symmetric trace-free `3 × 3` matrix, cyclic unit null vectors, complex bilinear pairing, Hilbert–Schmidt norm |
| Flat Weyl and Bach symbols | `msneck:symbols` | `lem:flat-weyl-bach` | Real nonzero covector in Euclidean four-space, real symmetric amplitude with \(H\xi=0\) and \(\operatorname{tr}H=0\), \(\partial_j\mapsto i\xi_j\), full four-index Weyl norm |
| Chiral curvature projection | `lift:projection` | `prop:chiral-curvature` | Smooth oriented Riemannian four-manifold, local normalized self-dual frame, positive round curvature convention, Levi–Civita connection on \(\Lambda^+\) |

The first result is a pointwise calculation on three-dimensional matrices.
The second is an identity for the flat algebraic symbols. The third
requires a bridge from the pinned Riemannian curvature API to the
manuscript's operator on two-forms. In the manuscript pairing, the last
two vector slots are \(g(R(X,Y)V,U)\). The bridge must preserve this sign
and the frame normalization \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}\,dV_g\).

The blueprint also records a conditional annular estimate and the open
problem of obtaining its geometric hypotheses. These provide downstream
context for the symbol calculation. The [plan](../research-plan/PLAN.md)
specifies the three pilot targets and their verification scope.

## Inputs at setup

The checkout at setup is `3348250457015f32a54004cd337463b022195d7a`.
The inspected source files have these SHA-256 digests.

| File | SHA-256 |
| --- | --- |
| Manuscript source | `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66` |
| Blueprint content | `c303a165d92aba49b4661a4bc1d1734b899b56e269225c5d2956c02ea58b4ae2` |
| Lake manifest | `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239` |

Use the [toolchain file](../../../lean-toolchain) and
[Lake manifest](../../../lake-manifest.json) to reproduce these pins.

- Lean `v4.35.0-rc3`
- Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`
- DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`

The [register](../research-progress/REGISTER.md) records current evidence
and task status.
