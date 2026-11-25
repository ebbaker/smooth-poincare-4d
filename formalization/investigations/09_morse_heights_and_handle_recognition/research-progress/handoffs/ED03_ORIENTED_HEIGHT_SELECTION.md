# SP4-FORM-HT · Selection from the actual subcritical induced energy

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution packet. Actual serving model and reasoning
effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/OrientedHeightSelection.lean)
· [Immersed-height theorem](../../../../../papers/master/manuscript/immersion_entry.tex)

The closed source is a nonempty compact Polish smooth four-manifold
with a boundaryless model. The orientation and isometric immersion into
Euclidean five-space are fixed. The normal and ascending pointwise
principal frames refer to this same immersion. Normalize the
round Riemannian area on the actual direction sphere by $8\pi^2/3$.

The event is the set of directions whose actual smooth height has only
nondegenerate critical points and a finite set of exactly two index-two
points. On a Morse direction the indexed nondegenerate critical set agrees
with the index-two part of the ordinary critical set. The checked Sard
theorem and the indexed mean give a conull set on which the height
is Morse and its middle count is finite. The displayed event agrees
almost everywhere with the measurable count-two set and is measurable
for the completion of ordinary round probability.
[Both-sign Morse theorem](ED03_MANIFOLD_GAUSS_SARD.md)

The pointwise bound on the strict middle locus is
$|W^+|_{\mathrm{HS}}^2\ge (8/3)|\prod_i k_i|$ in the actual oriented
principal frames. Use the indexed mean formula on that locus and the
integrated selection bound with the full complementary Weyl mass.
For a strict actual energy bound $E_+(g)<8\pi^2$, the mean count is
strictly below $9/4$. With the separate floor of two on finite Morse
heights, the probability of the displayed event is strictly above $3/4$.
The floor concerns smooth recognition and is an explicit input.
[Topology audit](../../reviews/ED03_HEIGHT_FLOOR_AUDIT.md)

For any supplied family of marked data indexed by direction, if each
eligible direction has its marked data then there exists an eligible
direction together with data for that same direction. The probability
bound concerns the full Morse count-two event. Recognition of a
particular diagram class still requires its own geometric hypothesis.

## Declarations and input versions

- `orientedHeight_prob_morse_twoMiddle_of_subcritical_energy` proves the
  probability statement and null measurability of `morseTwoMiddleDirections F`.
- `orientedHeight_exists_morse_twoMiddle_with_data_of_subcritical_energy`
  supplies the direction and its own data.

The final run used workspace base `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`
and the current master immersion TeX with SHA-256 prefix `f7a9522959429fdb`.
The relevant Lean inputs had these SHA-256 prefixes.

| Input | SHA-256 prefix |
| --- | --- |
| `IntegratedSelection.lean` | `73763265b0d7349` |
| `OrientedIndexedMean.lean` | `01b8a879ff8271e2` |
| `RegularMorseHeights.lean` | `0c10b6499a778b8d` |
| `RoundGaussArea.lean` | `e5b4981edc2599bb` |
| `ChiralEnergyContinuity.lean` | `2a4d8c695fe43755` |
| `PrincipalFrameExistence.lean` | `33372013b3790341` |

The normalization, middle-locus openness, Gauss Jacobian integrability,
and induced Weyl density integrability are all discharged in the
probability theorem. Both selection declarations use the fixed geometric
setting, the finite Morse count floor and the strict energy bound. The
existence declaration additionally assumes availability of the supplied
data at the eligible directions.

## Verification

The manifest prefix was `839111aae86b6935`, with Mathlib at
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
at `788efe97894474c032de6dfb1289d515f613d15a`.
`lake build +SmoothPoincare.Heights.OrientedHeightSelection` passed
with Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate import
checked the two event definitions and both theorem statements.
The theorem axiom reports contained only `propext`, `Classical.choice`
and `Quot.sound`.
