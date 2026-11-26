# Affine flattening in the native charged disk

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E execution for the preliminary flattening
in the E61 transport witness, CDS-B03 / E02j. Requested dispatch GPT-6.2
Sol/ultra. Independent serving model and effort metadata are unavailable.

[Route register](../REGISTER.md) ·
[Lean source](../../../../SmoothPoincare/Variational/NativePocketFlattening.lean) ·
[Scientific transport witness](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/notes/TRANSPORT_ON_THE_CHARGED_DISK.md#the-buffered-marking-and-the-flattening)

## Fixed inputs

Use one actual smooth metric $g$ and one smooth partial diffeomorphism
$F:\mathbb R^4\dashrightarrow M$ with a closed buffered ball in its source.
The native model is four-dimensional Euclidean space. For a selected
charged disk, the same chart must mark the disk and its buffer, and the
change ball is chosen strictly inside the marked disk. The proof uses a
supplied chart and reads its coefficient match at the center. The
relative construction of normalized or normal coordinates with the
prescribed Gaussian boundary marking remains a separate input.

The scientific input was read at revision
`19c187ad8dbe936cf165017c753a94add775ebaf`. The verification worktree was
at `8471728a1549614f155a8751c709904cbcf994d6`. Lean `4.35.0-rc3` at
`470d5ce1400764999581fd26d5d72b00d990b0f4`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`; Lake manifest SHA-256
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

| Input | SHA-256 |
| --- | --- |
| Scientific transport witness above | `3afb193895a79e3b1f4ce508f66017cba887c5b3e3a9b1bb3aee36d81c22c37f` |
| `SelectedDiskReference.lean` | `7f20fb9247000014ec856bea3975107e3b2981145d8a8c090782ae32b6a55811` |
| `PhysicalStripVolume.lean` | `a0ae00bc192539c4a09cccd0382681760f696298315278c188c601c308bcf0f5` |
| `PairedStripCurvature.lean` | `26d9577a967e4ed2dd499c549e6d7170e6ceb8205aa39a930a663e215f3f9cb4` |

## Checked conclusions

- `nativePocketPath` is the actual positive definite affine metric for
  every time $s\in[0,1]$. Its coefficient formula is affine in time and
  its cutoff is smooth, equal to one through native radius $2r$ and zero
  at and beyond $5r/2$. `nativePocketPath_at_zero` gives the original
  metric, and `nativePocketPath_outer_germ` supplies a neighborhood
  agreement on the complement of $F(B_{3r})$, including its rim.
- `exists_nativePocketReference` extends the Euclidean metric from the
  fixed buffered ball with the actual marking. With that matching
  reference, `nativePocketPath_endpoint_flat` gives a Euclidean
  pullback and identically zero lowered Riemann tensor on the actual
  open pocket $F(B_{2r})$ at time one.
- `exists_nativePocket_volume_bound` gives one reference and one
  constant $V\ge0$ such that every time and every positive radius with
  $3r$ within the fixed buffer have metric volume at most $Vr^4$ on
  $F(\overline B_{3r})$. It compares the actual metric to a fixed
  smooth positive dominating metric. The compact chart density and
  Euclidean Haar scaling give the uniform power of the native radius.
- `exists_nativePocketCutoff_deriv_bounds` bounds the first and second
  operator norms of the actual scaled cutoff by $L_1/r$ and $L_2/r^2$.
  `exists_nativePocketCoefficientTaylor` bounds a fixed difference
  $D$ with $D(0)=0$ by $C|x|$ and its first derivative by $C$. A match
  $dD(0)=0$ improves these to $C|x|^2$ and $C|x|$. In
  `exists_nativePocketPath_nativeCoefficient_hessian_bounds`, both
  mixed slots of the product rule are included for $(1-s\chi_r)D$.
  For each fixed pair of coordinate vectors, the actual path coefficient
  minus the fixed reference coefficient has Hessian bounded by $C'/r$
  for $0<r\le1$, and by $C'$ with the first-jet match. The constants
  are chosen before the radius and time. The neighborhood coefficient
  identity identifies the derivatives at all points of the change ball,
  including its rim. For the Euclidean reference the defect Hessian
  equals the complete coefficient Hessian on the chart neighborhood
  where the reference is Euclidean.
- `nativePocketPath_signed_change` identifies the actual signed global
  increment with the change on the closed pocket under the explicit
  frame agreement on its complement. `nativePocketPath_signed_peak_of_curvature`
  uses the actual frame norm square bound $D_*$ for both metrics on that
  pocket and actual physical volume bound $Vr^4$ to give absolute drift
  at most $D_*Vr^4$ for either sign. The single strict gap
  $E_+(g)+D_*Vr^4<2T$ gives the strict peak bound for both signs, using
  the signature condition on the signed path metric.

The bridge from the coordinate estimates to the uniform intrinsic
curvature norm square in the signed frames remains open in this leaf.
It needs uniform inverse metric and actual first-jet bounds in the
marked chart, followed by the Riemann tensor and orthonormal-frame
estimates on the same family. The integrated rates $O(r^2)$ at zeroth
match and $O(r^4)$ at first-jet match follow from the last two measure
theorems once that curvature bound is respectively of order $r^{-2}$ or
order one. Actual signed frame assembly and the spectral-wall
application for positivity of the conformal classes are subsequent
inputs. The radial transport, conformal stage and cap claims belong to
their own packets.

The independent cap readback checked the two actual inverse charts.
`transportedCapStereographic_metric_inner` uses the metric induced on the
unit sphere, with sectional curvature $+1$, and gives tensor multiplier
$16/(\|z\|^2+4)^2$, equal to one at the stereographic center. The scaled
inverse marking applies $2/b$ to each tangent slot, including angular
slots, so its metric density is $\lambda_b(z)=4b^2/(b^2+\|z\|^2)^2$.
Lean fixtures verified the center multiplier, $\lambda_b(0)=4/b^2$ and
$\lambda_b|_{\|z\|=b}=1/b^2$.
`euclideanPocket_inverseMetric_of_forward` differentiates $F\circ F^{-1}$
on its open target and transfers the actual endpoint identity on
$U=B_{2r}$ to inverse tangents. For $0<b<2r$ and the exact compressed disk
image, `euclideanPocket_localCapConformalGerm` takes the scaled round
identity and gives $u\circ F\circ C-\tfrac12\log(\lambda_b\circ C)$ on
an open neighborhood of the whole retained cap, including the equator.
`exists_nativePocket_matchedCaps` combines these identities on one marked
source. For the supplied positive signed flattening endpoint and one
smooth $u$, it gives both positive caps, the relative metric germ and
exterior inverse, and the exact two-sign charge ledger. The physical
product specialization requires the incoming Gaussian marking and the
logarithmic conformal exposure on the compressed collar. Choosing
$3r<1$ applies the outer germ to the complete incoming exterior during
flattening. The signed flattening and spectral-wall premises above still
apply.
[Round chart formula](../../../../SmoothPoincare/Variational/StereographicCapMetric.lean) ·
[Physical cap germ](../../../../SmoothPoincare/Variational/EuclideanPocketCapGerm.lean) ·
[Matched caps](../../../../SmoothPoincare/Variational/NativePocketCaps.lean)

## Reproduction

`lake env lean SmoothPoincare/Variational/NativePocketFlattening.lean`
and `lake build +SmoothPoincare.Variational.NativePocketFlattening` passed
from `formalization/`. The Lake leaf build completed 9,898 jobs. The
frozen Lean source SHA-256 is
`ae0af718860dddd02aa1a143ae76681199c4f09f8a8a39bab3646f78b74424ef`.
The following import-only replay and two plateau fixtures passed.
Replay source SHA-256
`83df13db8b41b94f7671a496543a535fc8b985812f30da61e848af4e6a33ba52`;
exact signature and axiom output SHA-256
`506263fec990e812f1c363836075b915b44df65c4a159751dffddb9ecbcaf093`.
The nine axiom checks report only `propext`, `Classical.choice` and
`Quot.sound`.

The independent matrix reader directly elaborated the same source hash.
Its readback confirmed the fixed-vector and uniform-in-time quantifiers
of the Hessian theorem, the center first-jet premise for the bounded
case, and the separate pointwise frame-curvature premise for the two
integrated rates.

```lean
import SmoothPoincare.Variational.NativePocketFlattening

open SmoothPoincare Set
open scoped Manifold

#check @nativePocketPath_at_zero
#check @nativePocketPath_outer_germ
#check @exists_nativePocketReference
#check @nativePocketPath_endpoint_flat
#check @exists_nativePocket_volume_bound
#check @exists_nativePocketCutoff_deriv_bounds
#check @exists_nativePocketCoefficientTaylor
#check @exists_nativePocketPath_nativeCoefficient_hessian_bounds
#check @nativePocketPath_signed_change
#check @nativePocketPath_signed_peak_of_curvature
#print axioms nativePocketPath_at_zero
#print axioms nativePocketPath_outer_germ
#print axioms nativePocketPath_endpoint_flat
#print axioms exists_nativePocket_volume_bound
#print axioms exists_nativePocketCutoff_deriv_bounds
#print axioms exists_nativePocketCoefficientTaylor
#print axioms exists_nativePocketPath_nativeCoefficient_hessian_bounds
#print axioms nativePocketPath_signed_change
#print axioms nativePocketPath_signed_peak_of_curvature

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

example : nativePocketCutoff (1 / 7) (0 : E₄) = 1 :=
  nativePocketCutoff_eq_one (by norm_num) (by simp)

example {x : E₄} (hx : ‖x‖ = 5 / 14) : nativePocketCutoff (1 / 7) x = 0 :=
  nativePocketCutoff_eq_zero (by norm_num) (by rw [hx]; norm_num)
```
