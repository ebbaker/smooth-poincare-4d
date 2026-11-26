# HT-E06e · Orientation choice and a relative signed foot comparison

26 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded E packet applies the pinned orientation dichotomy
and reflection to a buffered Morse-foot chart. Serving model and effort
telemetry are unavailable. The worktree was based on
`5706ef811adc3691fd85e75507a0a399cb81d18d`. The toolchain is Lean `4.35.0-rc3`
at `470d5ce14007`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.
[Signed collar packet](ED03_RELATIVE_FOOT_COLLAR.md) · [Protected ball complement](ED03_PROTECTED_FOOT_COMPLEMENT.md)

## Orientation and actual foot coordinates

On a closed oriented Euclidean-modeled three-manifold, the pinned
`BallChart.exists_oriented` restricts a buffered chart to the component of
its source containing zero. This component contains the full closed
radius-two ball. On it the differential has one orientation sign, and the
restricted chart retains the original pointwise formula. In the negative
case, `OrientedBallChart.reflect` precomposes with the central inversion
$z\mapsto -z$, whose determinant in dimension three is negative. Applying
it to a chart for the opposite orientation makes the reflected chart
positive for the prescribed orientation.

`exists_orientedFootChart` returns that positive chart $e$ and the
orthogonal coordinate map $A\in\{I,-I\}$. For the original chart $b$,
the equation is $e(Az)=b(z)$. The marked closed unit-foot images agree
as sets because both choices of $A$ preserve the origin and norm. The
native specialization packages the actual compact incoming level
component with its supplied orientation and uses its verified
radius-two chart. `IsolatedOneHandle.exists_orientedNativeFootComponentChart`
retrieves the exact original transverse point for every closed unit-foot
parameter.
[Pinned chart orientation dichotomy](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Manifold/OrientedBallChart/Orientation.lean) · [Pinned reflection](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/ThreeManifold/ConnectedSum/OppositeSum.lean)

## Signed comparison with a prescribed model foot

`exists_bufferedFootSignedCollarComparison` compares a buffered actual foot
and an oriented model foot on the same preconnected closed oriented level.
Both unit-foot images avoid a finite pairwise disjoint family of protected
unit-foot images. The complement packet supplies compactness and
preconnectedness for their union. With the two given smooth partial collar
charts on the same signed strip, the comparison sends each actual coordinate
$(b(z),t)$ to the model coordinate $(e_{\mathrm{model}}(Az),t)$ on the full
central plateau, including both signed sides, with the inverse equation.
Both outer germs and all protected tube parametrizations agree in the two
directions. When the collar charts coincide on a protected tube, this fixes
that tube pointwise.
[Lean source and exact declarations](../../../../SmoothPoincare/Heights/FootOrientationChoice.lean)

The model parameter is $Az$. A subsequent gluing must incorporate that
coordinate map when the chosen model marking has an independent frame.
The native component orientation and actual signed collar charts remain
inputs. A rounded four-dimensional handle-rim comparison still requires the
rim's own local gluing data.

## Frozen inputs and verification

| Input | SHA-256 prefix |
| --- | --- |
| Lake manifest | `839111aae86b6935` |
| HT-E06b signed collar source | `7a41cf8e3b0c7b3c` |
| HT-E06c finite complement source | `7f4c432c0c47e48e` |
| HT-E06d native component source | `6be5b90c50bc7ed4` |
| Pinned orientation dichotomy | `b4dce843ee993882` |
| Pinned reflection | `5481022343921310` |

The frozen SHA-256 of `FootOrientationChoice.lean` is
`814da596414091f06ac5d521239bddf3b0db7d8f83b8fd2b6335edc62eebbe82`.
The two pinned orientation and reflection targets built together with
4,252 jobs. `lake build +SmoothPoincare.Heights.FootOrientationChoice`
completed successfully with 10,102 jobs. A downstream import checked the
exact signatures of `exists_orientedFootChart`,
`exists_bufferedFootSignedCollarComparison`,
`IsolatedOneHandle.footComponentBallChart`,
`IsolatedOneHandle.footComponentClosedOriented` and
`IsolatedOneHandle.exists_orientedNativeFootComponentChart`. The five axiom
reports each listed only `propext`, `Classical.choice` and `Quot.sound`.
