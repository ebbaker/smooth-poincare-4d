# SP4-FORM-HT-E02g rev1 · Gauss-map parametric densities

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet. The independently reported serving model
identifier and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/GaussParametricDensity.lean) ·
[Immersion manuscript, indexed mass](../../../../../papers/master/manuscript/immersion_entry.tex)

The local identity is for the actual smooth Riemannian metric \(g\), the
actual sphere-valued map \(n\), and the unit round metric on \(S^4\).
In a common source parametrization \(p\) with coordinate \(z\), let \(C\)
be the matrix of \(dp_z\) from the parameter model's chosen basis into a
\(g\)-orthonormal frame at \(p(z)\). The chain rule gives the two Gram
matrices \(C^{\mathsf T}C\) and \(C^{\mathsf T}G C\), where \(G\) is the
round-metric Gram matrix of \(dn_{p(z)}\) on that orthonormal frame.
The determinants give both densities the same factor \(|\det C|\).
In particular,
\[
\rho_{\mathrm{round},n\circ p}(z)
 = \rho_{g,p}(z)\sqrt{\det G}.
\]
This identity admits singular \(dn\) and requires only differentiability
at the indicated points. The calculation imports the bilinear-form
change-of-basis lemma and the actual parametric Gram matrix in the pinned
libraries. For source and target integration, the pinned parametric API
uses a common model vector space. The exact \(S^4\) density and measured
sheet declarations here use \(\mathbb R^4\) with its Euclidean norm as the
source model. The intrinsic Jacobian and its ambient Weingarten and
invertibility comparisons allow an arbitrary finite-dimensional normed
source model with the given four-dimensional frame.

`gaussFrameJacobian_eq_ambient` uses the differential of the sphere
inclusion and the defining inner product of the round metric.
`ImmersionGaussNormal.frameJacobian_eq_abs_prod` expresses the same
Jacobian as the absolute principal-curvature product for the specified
isometric immersion and its supplied unit normal. It applies the existing
Weingarten calculation to the centered written normal chart. Either sign
of the principal normal gives the same result by negating the unit normal
and the four principal curvatures together. The determinant test
`gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero` uses the ambient
Gram matrix to recognize independent images of the four frame vectors.
`ImmersionGaussNormal.mfderiv_isInvertible_of_principal` supplies
regularity where every principal curvature is nonzero.

`ImmersionGaussNormal.measuredSheets_of_principal` applies the common
parametrization identity and the existing sheet pushforward to the
countable regular atlas. The local ratio of parametric densities is
continuous because the source density is positive in the extended chart.
Thus the absolute principal product is continuous on the smooth open
locus even for pointwise choices of principal frame, and extends by zero
to a measurable function. When applying the older indexed mean with the
native direction-subtype measurable structure,
`GaussSheetAtlas.transportTargetMeasurableSpace` transports the atlas
along the equality of the two Borel measurable structures. The volume
measure used before transport is the pinned round Riemannian volume.

The packet supplies the Jacobian and measured sheet bridge in the
indexed mass calculation. The global normal construction, round mass
and antipodal invariance, conull Morse directions and topological floor
are other inputs to the full mean and strict induced energy arguments.
The classical comparison is the integral of the absolute shape
determinant on the unit-normal bundle at a fixed index, with ordinary
sphere area on the target.
[Onti–Vlachos, equation (5)](https://arxiv.org/pdf/1610.07349v3) ·
[Chern–Lashof, total curvature](https://doi.org/10.2307/2372684)

## Inputs and verification

The checkout base was `2fba0882dbf8`. The input SHA-256 prefixes were
`3cc3c6d0781891ec` for `GaussDifferential.lean`, `444e675a325620c5` for
`GaussSheets.lean`, `afb35b11aa4ece86` for `GaussRegularCover.lean`,
and `839111aae86b6935` for the Lake manifest. The unchanged toolchain is
Lean `4.35.0-rc3` with mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`
and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.

`lake build +SmoothPoincare.Heights.GaussParametricDensity` succeeded with
9749 jobs for the final source. The standalone `lake env lean` replay
of the two public imports `GaussParametricDensity` and `RoundGaussArea`
checked the elaborated types of all ten public declarations in this
packet. Each `#print axioms` result was exactly `propext`,
`Classical.choice`, and `Quot.sound`. The replay also transported the
measured atlas in `borel GaussDirection` directly to `gaussRoundArea`
in the native direction-subtype measurable structure.
