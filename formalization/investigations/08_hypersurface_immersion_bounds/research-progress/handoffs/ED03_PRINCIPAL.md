# FOT-E36 · Principal-curvature inequalities

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable to this helper. This is the bounded E proof from the
[Route 08 plan](../../research-plan/PLAN.md) (SHA-256 prefix
`19005b5907919058`).

## Scalar results

The checked file is
[`SmoothPoincare/Immersions/PrincipalCurvatures.lean`](../../../../SmoothPoincare/Immersions/PrincipalCurvatures.lean).

| Declaration in `SmoothPoincare` | Statement and range |
| --- | --- |
| `middleSignatureWeylBound` | For every spectrum `(-a,-b,c,d)` with `a,b,c,d > 0`, the frozen three-pair formula is at least `(8/3)*a*b*c*d`. Equality is equivalent to `a=b ∧ b=c ∧ c=d`. |
| `shapeDeficitBound` | For all four real principal curvatures, including zero entries, `(8/9)*max (-(a*b*c*d)) 0` is bounded by `principalShapeDeficit a b c d`. |
| `shapeDeficitBound_sharp` | The tuple `(-1,3,3,3)` gives equality with strictly negative determinant. |

The signed comparison bounds each of the first two pair differences
below by four times the square root of the determinant. Equality
forces both of those squared differences to attain their lower bounds.
The three resulting product equalities and positivity give the
equality spectrum. The module checks equality at `(1,1,1,1)` and strictness
at `(1,2,3,4)` in the four positive parameters.

The deficit is defined as the square of the trace-free principal norm
squared, divided by six, minus the squared Weyl norm of a single chiral
block. Expanding in the three Hadamard coordinates gives a sum of
nonnegative products of squares. For negative determinant the proof
uses simultaneous sign reversal and permutations to put the unique
negative entry first and the smallest positive entry second. It uses
the manuscript's two square inequalities with the positive scaling
factor retained, and includes the gap between the two larger entries.

## Source and geometric scope

Use `eq:middle-weyl` and `eq:shape-deficit` of
[`immersion_entry.tex`](../../../../../papers/master/manuscript/immersion_entry.tex)
with the single-block Hilbert–Schmidt norm. The launch recorded HEAD
`a1a8b8866fafd24cc11236b426fcd67d7cdfee2b` and manuscript SHA-256
prefix `4f56dfe589d3525e`. The subsequently extended manuscript at
`9c579f0126ceb8e9a3b2d9b2fcc935b5743b2ad7` had prefix
`cf7a5e72e147772f`. The two scalar passages at the issued revision
`2689540` and the examined checkout agreed byte for byte (passage
SHA-256 prefix `5a57836f5198086f`). The comparison uses the
[frozen equality audit](../../../../../papers/master/reviews/E34_MIDDLE_WEYL_EQUALITY.md)
and [sharp-deficit note](../../../../../papers/master/notes/E29_GAUSS_DEFICIT.md).
Onti–Vlachos Proposition 9 provides the general intermediate-signature
estimate and leaves the constant unspecified. The four-dimensional
constant in this return comes from the explicit pair sums.
[Onti–Vlachos, §2](https://arxiv.org/pdf/1610.07349)

These declarations accept scalar principal data. Application to the
actual induced Riemannian metric requires a principal orthonormal
frame, the Gauss identification of both Weyl blocks in that frame, and
the identification of the determinant and trace-free norm. The
strict integrated inequality needs the separate Codazzi exclusion of
open saturation on the middle-signature locus, then the indexed Gauss
mass and smooth handle lower count for recognition.

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`.
The Lake manifest SHA-256 prefix was `839111aae86b6935` with Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`.

- `lake env lean SmoothPoincare/Immersions/PrincipalCurvatures.lean` passed.
- `lake build +SmoothPoincare.Immersions.PrincipalCurvatures` passed
  in the pinned package (1,523 jobs).
- `lake env lean --stdin` imported the module and assigned
  `middleSignatureWeylBound` directly to the exact frozen proposition.
  The three public statements in the table passed `#check`.
- Each of the three `#print axioms` reports lists `propext`,
  `Classical.choice` and `Quot.sound`.
