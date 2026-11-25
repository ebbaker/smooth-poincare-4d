# SP4-FORM-HT-E02h rev1 · Ordinary round Gauss area

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet in Edition 03. Actual serving model and
reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/RoundGaussArea.lean)

The direction space is the existing `GaussDirection`, the unit sphere in
real Euclidean five-space. The metric `gaussRoundMetric` is the pinned
`roundMetric`, which takes the Euclidean inner product of the two vectors
under the differential of the inclusion. The measure `gaussRoundArea`
is that metric's actual `riemannianVolumeMeasure` transported to the
sphere subtype's inherited measurable space. The equality
`gaussRoundArea_borel` gives the exact measure used on the target of
`gaussSheet_pushforward_of_paramDensity`. The two measurable-space
instances agree by `BorelSpace.measurable_eq`.
[Gauss sheet change of variables](../../../../SmoothPoincare/Heights/GaussSheets.lean)

The logarithmic polar map `(u,t) ↦ exp(t) • u` carries the full sphere
cylinder diffeomorphically onto punctured Euclidean five-space. Its metric
pullback is the product of the round metric with the Euclidean line
metric, multiplied by \(e^{2t}\). The orthogonality of the inclusion
differential to the radial vector gives the conformal identity. For a
measurable sphere set \(A\), the conformal measure formula and product
integration over \(A\times(-\infty,0)\) give
\[
  \operatorname{Vol}_5\{ru:u\in A,\ 0<r<1\}
   = \operatorname{Area}_{\rm round}(A)\int_{-\infty}^0 e^{5t}\,dt
   = \tfrac15\operatorname{Area}_{\rm round}(A).
\]
Thus `gaussRoundArea_eq_gaussConeArea` identifies the entire Riemannian
measure with the ambient `volume.toSphere` cone measure. The gamma-value
formula for the Euclidean unit ball gives volume \(8\pi^2/15\).
`gaussRoundArea_univ` gives area \(8\pi^2/3\). The ambient negation
preserves Lebesgue measure and carries every direction cone to the opposite
one, giving `gaussRoundArea_antipodal`. These two results supply the
area-specific hypotheses of the indexed mean theorem on the same target.
[Indexed mean normalization](../../../../../papers/master/manuscript/immersion_entry.tex#L49)

| Input | Revision |
| --- | --- |
| `GaussSheets.lean` | SHA-256 `444e675a325620c577c4d95d007f94d448d373ffc875c78cc2f47bfc8ededae0` |
| Master immersion section | SHA-256 `f7a9522959429fdb45a88955f089834ec926fcdf03eb9ded749986870d49f4ae` |
| Mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` |
| Lake manifest | SHA-256 `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239` |

The pinned sources supply `euclideanPolarDiffeomorph` and its differential
in `Geometry/Metric/Euclidean/PolarCoordinates.lean`, the partial-isometry
measure formula in `Analysis/Integration/Measure/PullbackCross.lean`,
the conformal density in `Analysis/Integration/Measure/Conformal.lean`,
and the round-metric–line product measure in `Geometry/Measure/Product.lean`.
Mathlib supplies `Measure.toSphere_apply'`, `EuclideanSpace.volume_ball`
and the gamma recurrence. The area calculation uses no topology or
regularity assertion about the Gauss map of a particular immersion.

`lake build +SmoothPoincare.Heights.RoundGaussArea` passed on
Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate public
import of the module checked the displayed metric type and exact
statements. The axiom reports for `gaussRoundMetric`,
`gaussRoundArea_apply`, `gaussRoundArea_borel`,
`gaussRoundArea_eq_gaussConeArea`, `gaussRoundArea_univ`, and
`gaussRoundArea_antipodal` each listed `propext`, `Classical.choice`,
and `Quot.sound`.
