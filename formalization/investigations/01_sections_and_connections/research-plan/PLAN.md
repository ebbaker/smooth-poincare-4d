# Plan

25 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The serving model identifier and reasoning
effort for this setup are unavailable.

Use the statement and versions in the
[overview](../research-overview/OVERVIEW.md). Provider recommendations,
handoff requirements, and proof acceptance checks are in the
[formalization setup workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md).
The [register](../research-progress/REGISTER.md) owns live status.

| Task | Type | Depends on | Intended result |
| --- | --- | --- | --- |
| SP4-FORM-SEC-E01 | E | Pinned Lean and Mathlib | Pointwise three-axis Weyl equality and bound |
| SP4-FORM-SEC-B01 | B | Flat symbol definitions in the blueprint | Representation and proof route for the two flat symbols |
| SP4-FORM-SEC-E02 | E | SP4-FORM-SEC-B01 | Bach symbol and squared Weyl norm on real transverse traceless amplitudes |
| SP4-FORM-SEC-B02 | B | Chiral curvature statement and pinned Riemannian API | Conventions and dependencies for the curvature projection |
| SP4-FORM-SEC-E03 | E | SP4-FORM-SEC-B02 | Wedge-projection calculation given the signed curvature rows |
| SP4-FORM-SEC-E04 | E | SP4-FORM-SEC-B02 and SP4-FORM-SEC-E03 | Curvature projection for the induced Levi–Civita connection |

## SP4-FORM-SEC-E01

Fix the representation as a real matrix indexed by `Fin 3`, with
symmetry and vanishing trace. Define the complex-bilinear evaluation on
the cyclic normalized vectors \(\zeta_i=(n_j+i n_k)/\sqrt2\), where
\(n_i\) are the coordinate basis vectors. Use its squared complex
modulus, and define the squared Hilbert–Schmidt norm as the sum of
squares of all matrix entries. Prove both the equality and the lower
bound in blueprint label `lem:three-axis-weyl`.

Expand the evaluation into \((d_j-d_k)/2+i w_{jk}\), sum over the
three cycles, and use the trace condition. The pinned Mathlib's
`Mathlib.Basic.Complex.Basic` defines `Complex.normSq` for the
squared modulus. This is an E task because the objects, proof route,
and required conclusions are fixed.

The proposed output is `SectionsAndConnections/ThreeAxisWeyl.lean`
with `SectionsAndConnections.threeAxisWeylEstimate`, imported by
the [library entry point](../../../SectionsAndConnections.lean).
Verify the theorem type against the cyclic evaluation and the exact
coefficients \(3/4\) and \(1/2\). Build the package and audit the
declaration's axioms. Return a B decision if the proposed statement
would change the geometric content of the null evaluation.

## SP4-FORM-SEC-B01 and SP4-FORM-SEC-E02

B01 chooses the Lean representations for the Kulkarni–Nomizu product,
Ricci contraction, and squared tensor norms in
`def:flat-curvature-symbols`. Compare a component calculation for
arbitrary \(\xi\) with a calculation after orthonormal rotation, including
the required transport lemmas for the latter. Record the selected imports,
slot order, and proof steps in a decision note linked from the register.
This choice determines the fixed E02 packet.

E02 proves \(B_\xi(H)=-|\xi|^4H/4\) and
\(\lVert W_\xi(H)\rVert_{\mathrm{tens}}^2
=|\xi|^4\lVert H\rVert_{\mathrm{HS}}^2/2\) for every real nonzero
\(\xi\) and real symmetric \(H\) satisfying the transverse and trace
conditions. Use blueprint label `lem:flat-weyl-bach`. The proposed
module is `SectionsAndConnections/FlatSymbols.lean`, with declarations
`SectionsAndConnections.flatBachSymbolTT` and
`SectionsAndConnections.flatWeylSymbolNormSqTT`. The completion test
includes the arbitrary direction, sign, and full ordered-index norm.
The geometric identification of the symbols with differential operators
belongs to a later task.

## SP4-FORM-SEC-B02, SP4-FORM-SEC-E03, and SP4-FORM-SEC-E04

B02 identifies the usable curvature, connection, exterior algebra, and
Hodge interfaces at the pinned versions. Record how the manuscript's
last-slot convention translates to the upstream Riemann tensor. Specify
the \(\Lambda^+\) frame and its orientation, the wedge pairing, and the
normalization of the generators in a decision note linked from the
register. The decision assigns any missing infrastructure and fixes the
exact statements for E03 and E04.

E03 proves the wedge projection with normalized self-dual forms and
the signed rows \(F^i=-\mathcal R\Sigma_i\) and positive block
\(\mathcal R_{++}=W^++s_g I/12\) supplied as hypotheses. This is the
finite calculation giving \(C=W^++s_g I/12\). The provisional declaration is
`SectionsAndConnections.chiralProjectionOfCurvatureRows`.

E04 establishes the signed curvature rows for the induced Levi–Civita
connection and the positive block decomposition from the pinned geometry.
It uses E03 for the complete theorem in blueprint label
`prop:chiral-curvature`. Its provisional declaration is
`SectionsAndConnections.chiralLeviCivitaCurvatureProjection`.
Use the unit round four-sphere as the sign and scale check. Compare
the exact round product cylinder when checking the treatment of
degenerate curvature wedge products. E03 and E04 provisionally share
`SectionsAndConnections/ChiralCurvature.lean`. Close E04 after the
geometric bridge and the final theorem both pass verification. If the
required interface is missing, record the missing definition or lemma
and issue an explicit prerequisite before resuming E04.
