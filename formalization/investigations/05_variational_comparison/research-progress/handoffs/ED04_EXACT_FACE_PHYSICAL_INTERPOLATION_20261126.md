# Exact-face interpolation in the two physical widths

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E execution for SP4-FORM-VAR-E04e and
the scalar normal-jet part of E04f. Independently reported serving model
and reasoning effort unavailable.

[Route register](../REGISTER.md) · [Route plan](../../research-plan/PLAN.md#edition-04-objectives) ·
[Edition 04 milestone](../../../research-plan/04_PLAN.md) ·
[Lean source](../../../../SmoothPoincare/Variational/ExactFacePhysicalInterpolation.lean)

## Fixed inputs

The issue revision is `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`.
The Lean pin is `4.35.0-rc3` at
`470d5ce1400764999581fd26d5d72b00d990b0f4`, Mathlib is
`c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry is
`788efe97894474c032de6dfb1289d515f613d15a`, and the Lake manifest SHA-256
is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

| Scientific source | SHA-256 |
| --- | --- |
| [Deformation manuscript, exact coefficient and two physical widths](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/manuscript/deformation_of_marked_spherical_collars.tex) | `2575660c6240b61533f9972fe8f6c145566be0dac5c02ebceea7c493b37843b5` |
| [Parent, positivity and exact-face mass](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/manuscript/marked_collars_and_smooth_recognition.tex) | `7e36f4398acf116f2355d1d74676d2bd89a5bec2dc7be73e920abcdda6a8c15f` |
| [Edition 04 plan](../../../research-plan/04_PLAN.md) | `583731803705ef3b92da8b259525a457c72425fc6a782f728c14687b1008b3d2` |

## Constructed metric and checked interfaces

- `exactFaceNormalizingExponent_face_jet` constructs a globally smooth
  exponent from an original signed Gaussian partial diffeomorphism on a
  full marked spherical slab. Its normal restriction has value `v` and
  derivative `-H/3` at zero with $H$ the trace in the left-to-right
  convention. `exactFaceNormalizedMetric_tangent_inner` proves the
  round tangential value under the conformally round coefficient
  hypothesis. `exactFaceNormalizedMetric_first_tangential_jet` proves
  vanishing of the tangential derivative in that original chart from
  the Gaussian coefficient umbilicity relation $h'_0=2(H/3)h_0$.
- `exists_exactFacePhysicalPath` takes a normalized smooth marked
  bicollar $F:S^3\times\mathbb R\dashrightarrow M$, a fixed original
  metric and a smooth exponent. The domain contains the entire compact
  slab with independently available widths $W_L,W_R$. A single
  smooth metric extends the reference $dt^2+\gamma_{S^3}$ from the
  marked slab using the pinned compact metric extension theorem. For
  every pair of positive subwidths, the extension is reused by the
  named path. Each slice is a smooth positive-definite metric.
  `exactFacePhysicalPath_joint_coefficient` gives the explicit smooth
  parameter extension for coefficients in smooth spatial sections.
- The profile is `Real.smoothTransition (3/2-2*r)`. On the physical
  left and right halves the relative arguments are $-t/w_L$ and
  $t/w_R$, respectively. Both factors are one near the seam. The
  path equals the incoming metric on the open complement of the compact
  shortened slab of widths $3w_L/4,3w_R/4$, so both native outer
  faces retain the incoming metric germ. At time one the terminal
  metric pulls back to the unit round product on the open interior
  of the slab of widths $w_L/16,w_R/16$. The endpoint exposure uses
  the same profile at quarter widths and has support strictly inside
  the normalized product germ.
- `exactFaceNormalizedPath_pullback_sub_round` identifies the pulled
  back bilinear coefficients on the marked slab with the affine model
  $(1-s\chi)D$, after subtracting the actual product reference.
  `exactFaceJetSplice_derivs` gives the first two normal product rules.
  `exactFaceCutoff_derivs_left` and
  `exactFaceCutoff_derivs_right` give the signed first derivative and
  the unsigned second derivative at each physical width, including the
  seam. `exists_exactFaceCutoff_deriv_bounds` obtains common derivative
  constants from compactness of the fixed profile interval.
  `exactFaceDefect_taylor_bounds` controls the normal defect of any
  scalar coefficient on an actual half-interval from its value, first
  derivative and bounded second derivative. The first Taylor bound
  uses the upper estimate $\alpha+(\beta+Mw)|t|$.
- `exactFacePhysicalPath_chiralMeasure` proves equality of the actual
  normalized and physical energy measures in either ambient chirality
  in conformally matched frames. The signed change on a full side is
  exactly the change on its physical strip by
  `exactFacePhysicalPath_side_change`. The unchanged complement uses
  the true metric germ and supplied coincident oriented bases there.
  Under bounds $E_\sigma\le C_jw_j$ on the old and new strips of this
  same path, `exactFacePhysicalPath_joined_bound` bounds each absolute
  full-side drift by $C_jw_j$. It uses a measurable cover by the two
  complete regions and a common seam null for the actual chiral
  measures. `exists_exactFace_subwidth_budgets` shows that such fixed
  constants allow two independent positive subwidths meeting any
  positive tolerance and the strict joined bound, for every smaller
  positive width pair.

## Remaining proof boundaries

E04e has an actual source path on the supplied normalized chart. The
full conformally normalized signed normal exponential tube of an
arbitrary embedded umbilic sphere remains an input, together with its
physical overlap and clearance in any preceding marking. The exact $C_jw_j$ chiral
strip estimates require proving a uniform bound on the angular and
mixed geometric two-jets in the normalized chart, applying the
curvature and density formulas at that bound, and integrating with
linear reference strip volume. The joined theorem consumes this
geometric estimate for the very same metric path. It also uses the
actual frame, integrability, complete-side localization and null-seam
data in the signed measure interface. Yamabe positivity needs the
spectral and Euler hypotheses already identified by Route 05 E02.

E04f still needs the product covariant derivative estimate in the
supplying chart and its transfer to the moving orthonormal frame,
both curvature projections, the volume density and the complete
integrals. These are needed for the stated $Z_j+w_j^{3/2}Z_j^2$
estimate. Selection on a sequence requires the measured physical
premises on that sequence. The sharp signed second-jet coefficient
and the endpoint-maximizer statement remain separate proof tasks.

## Verification and signature freeze

The Lean source SHA-256 is
`5d1ae823c571b7bc0c5042831bdaec4ed1cbdd0c79ee800ce37a42a3e522fe52`.
From `formalization/`, both
`lake build +SmoothPoincare.Variational.ExactFacePhysicalInterpolation`
and direct `lake env lean SmoothPoincare/Variational/ExactFacePhysicalInterpolation.lean`
succeeded. The [imported replay](ED04_EXACT_FACE_PHYSICAL_INTERPOLATION_REPLAY.lean)
has SHA-256 `1239d30b0be2a9f8228b1a3795ee74435b46ef8036b1e2fd4eefb8f8df225a5f`.
Its raw standard output, including all thirteen elaborated theorem signatures,
has SHA-256 `58bcd7f03647b54e2dd4dba4716d21c98c59cd293871aef6536379496a6aee9c`.
The axiom checks returned only `propext`, `Classical.choice` and `Quot.sound`.
The four replay fixtures use unequal widths $1/3,2/3$, test both
outer values and a point on the common plateau, and verify normal
derivative minus two for a nontrivial exponent on the identity spherical
bicollar. Shared public import and blueprint review belong to the lead.
