# Full two-jet bounds in the normalized face chart

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E45 execution for the fixed-source part of
SP4-FORM-VAR-E04e and E04f. Requested dispatch GPT-6.2 Sol/ultra.
Independent serving model and effort metadata are unavailable.

[Route register](../REGISTER.md) ·
[E44 physical metric construction](ED04_EXACT_FACE_PHYSICAL_INTERPOLATION_20261126.md) ·
[Lean source](../../../../SmoothPoincare/Variational/ExactFacePhysicalJets.lean)

## Inputs and scope

Use one fixed original metric and normalization, the E44 smooth partial
diffeomorphism $F:S^3\times\mathbb R\dashrightarrow M$, and one smooth
extension $R$ of the round product on the marked reference slab. In an
actual angular chart $\phi$, the signed chart is
$z=(a,t)\mapsto F(\phi(a),t)$, with exactly the original normalized
normal parameter $t$. Its open domain $U$ contains the buffered set
$K\times[-W_L,W_R]$ for a fixed compact angular set $K$. The two
signed half-widths are chosen independently. The coordinate norm on
$\mathbb R^3\times\mathbb R$ is the maximum of the two factor norms.

For two fixed coordinate vectors let $D$ be the scalar coefficient of
the actual normalized source minus the coefficient of $R$. The exact
face premises are $D(a,0)=0$ on the open chart face and
$\partial_t D(a,0)=0$ for $a\in K$. The chart, its buffer and those
two identities refer to the original fixed disk or supplied marked
face. A charged disk needs an independently established exact face
or a measured approximate comparison.

Input revision `19c187ad8dbe936cf165017c753a94add775ebaf`. Lean
`4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, and
Lake manifest SHA-256
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

| Fixed input | SHA-256 |
| --- | --- |
| [Lean physical interpolation](../../../../SmoothPoincare/Variational/ExactFacePhysicalInterpolation.lean) | `5d1ae823c571b7bc0c5042831bdaec4ed1cbdd0c79ee800ce37a42a3e522fe52` |
| [Deformation manuscript](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/manuscript/deformation_of_marked_spherical_collars.tex), issue revision | `2575660c6240b61533f9972fe8f6c145566be0dac5c02ebceea7c493b37843b5` |
| Same manuscript, working generation inspected during this packet | `1d1ea6e510a2292d36dfebdf87a05a36fe8bbf2f436a71ea2e01b60daf89e8b9` |
| [Exact-face calculation](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/EXACT_FACE_AND_BENDING.md) | `dca779667aecc2fdf9b1565cbe8611462fb93c1b468f49a897eb3d642078b2dc` |
| [Approximate physical jets](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/APPROXIMATE_PHYSICAL_JETS.md) | `f66c890a70717ad948356b9a268409765680abd7e7c2bf6e428bfda9ce53eab7` |

## Checked conclusions

- `contDiffOn_exactFaceNativeCoefficient` derives smoothness of each
  actual pullback coefficient from the pinned pullback-coefficient
  theorem on the open native chart. The map uses the actual spherical
  angular chart and preserves the signed normal coordinate. The
  coefficient formula `exactFaceNativePath_sub_reference_germ`
  identifies the affine model with the true E44 normalized path on
  a neighborhood of every used point. In particular, differentiating
  at the strip endpoints uses the same smooth metric.
- `fderiv_eq_zero_of_exactFace` derives the angular first derivatives
  from the value equality on the open face. It adds the given unit
  normal derivative to obtain the full first differential zero at
  the face. `exists_exactFaceCoordinateTaylor` obtains one compact
  bound $C$ on the full Hessian of the fixed defect. Two mean-value
  estimates along closed vertical segments give
  $|D|\le C|t|^2$ and $\|dD\|\le C|t|$. The value envelope uses
  coefficient one in place of the sharp Taylor coefficient one half.
- `exactFaceCoordinateSplice_two_jets` checks the Hessian in its two
  ordered directions. Writing $b(t)=1-s\chi(t)$, the four terms are
  $b\,d^2D(v,w)$, $b'v_t\,dD(w)$, $b'w_t\,dD(v)$, and
  $b''v_t w_tD$. The angular-angular part keeps only the first term.
  Each angular-normal order keeps its corresponding first cutoff
  derivative term. This is the signed normal convention of E44.
- `exists_exactFaceCoordinateSplice_twoJetBound` gives
  $Cw_j^2$, $C(1+L_1)w_j$ and $C(1+2L_1+L_2)$ for value,
  full differential and full Hessian on side $j$. The constants
  $L_1,L_2$ are the E44 fixed profile bounds. The two mixed terms
  use $L_1/w_j$ against a first jet of order $w_j$. The last term
  uses $L_2/w_j^2$ against a value of order $w_j^2$. Each term
  uses only its native side width. The nested operator norm controls
  both angular and mixed evaluations through second order.
- `exists_exactFaceNativePath_twoJetBound` transfers all these bounds
  to the actual metric coefficient minus the reference in the given
  chart. `exists_exactFaceNativePath_fullCoefficientBound` adds back
  the compact bounds of the fixed smooth reference and bounds the
  actual normalized full coefficient and both derivatives by one
  constant, uniform in the path and both independently chosen
  widths at most one.
- `exactFaceCoordinateSplice_plateau_germs` gives exact local
  proportionality to the original defect on the common central plateau
  and exact local equality with the original defect near both native
  outer faces. At the endpoint the normalized central defect vanishes
  on an open set. The exposure conformal factor belongs to the
  physical metric path. E44 transfers both signed energy measures
  from the normalized path in matched frames, so derivatives of the
  exposure factor are unnecessary for chiral strip bounds.

## Geometric inputs still required

Use the normalized signed chart and the exact coefficient face jets on
the chosen original disk. Then cover the complete marked face by
finitely many compact buffered angular charts, choose the same
physical widths in that cover, and identify the coefficient Hessian
with the curvature and inverse-metric estimates and the physical
strip measures. The curvature, chiral projection, and integral bound
are separate from this jet packet. The positive path and marked cap
transplants retain their strict joined and actual marking premises.
The approximate-face curvature and energy estimate also retains its
own measured smallness and ellipticity assumptions.

## Verification and signatures

The [Lean source](../../../../SmoothPoincare/Variational/ExactFacePhysicalJets.lean)
has SHA-256 `1c1985d9a9edfeb2e7834d3eb61a7543db992ba8766d493e0d7fd6c1153c0973`.
Both `lake build +SmoothPoincare.Variational.ExactFacePhysicalJets` and
`lake env lean SmoothPoincare/Variational/ExactFacePhysicalJets.lean`
succeeded from `formalization/`. The
[imported replay](ED04_EXACT_FACE_PHYSICAL_JETS_REPLAY.lean) has SHA-256
`182720bfaf9ff37e3dfc649bafc7a97cbb009ed063bed118a816ed8d08dc9fa1`.
Its printed theorem signatures and axiom output have SHA-256
`5cecf630e1cf9588f7ec16e8570562f2bcdfc3db652146df8337e6ba7a305432`.
The checked declarations use only `propext`, `Classical.choice` and
`Quot.sound`. The replay tests an angularly varying exact-face defect
on closed strips of unequal widths, the exact central plateau at the
endpoint, and the unchanged outer germ at an interior path time.
