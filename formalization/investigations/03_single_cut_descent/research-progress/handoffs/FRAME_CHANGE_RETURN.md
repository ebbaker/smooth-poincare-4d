# E28h · Oriented change of self-dual frame

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The delegated helper uses the configured
GPT-6.2 Sol and ultra setting. The runtime does not independently expose
its serving variant or effort. This execution packet uses checkout
`0c3399d831d71a1a17c29ffcba14ee0593315cbe`, the new public wedge indices
in `GeometricChiralBlock`, and the pinned Lean and Lake dependencies.
[Geometric block](../../../../FirstOrderTwistor/GeometricChiralBlock.lean) ·
[Lake manifest](../../../../lake-manifest.json)

## Scope

`hodgeStar_map_of_volumePreserving` proves that the induced exterior
map intertwines Mathlib's Hodge star under preservation of the bilinear
form and the specified top exterior volume. The proof uses preservation
of the induced bilinear form on decomposable wedges, multiplicativity
of the exterior algebra map, and nondegeneracy. In degree two in
dimension four, the result takes every positive Hodge vector to a
positive Hodge vector.

`selfDualCurvatureBlock_eq_compression` realizes the four-slot
`selfDualCurvatureBlock` as compression by the normalized basis with
columns equal to the sums of complementary wedges divided by $\sqrt2$.
The coordinate order is $(01,02,03;23,31,12)$. Orthogonality of the
columns is proved separately. `traceFreeSelfDualBlock_conjugate`
now takes the full curvature transformation in these coordinates
and commutation with the corresponding positive projection as inputs.
It constructs an orthogonal three-dimensional conjugator and carries
the trace-subtracted block by that conjugation. The proof applies
trace cyclicity after compression. [Lean module](../../../../FirstOrderTwistor/SelfDualFrameChange.lean)

For a physical frame change, the output of the DG exterior operator
conjugacy still has to be expressed in the recorded ordered wedge
coordinates with the operator normalization in `GeometricChiralBlock`.
To apply the Hodge result, realize preservation of the selected top
volume for the oriented frame change and identify its positive
orthogonal projection with the displayed inclusion. These are the
remaining links from the geometric frame data to the supplied matrix
premises. No measurable frame selection or curvature integral is
constructed in this packet.

## Verification

On Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`
and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`,
`lake build FirstOrderTwistor.SelfDualFrameChange` passed with 3,866
jobs. A fresh public-module import checked the Hodge, compression
and conjugacy theorem types. Their axiom reports, along with the
two underlying orthogonality and general compression reports, list
only `propext`, `Classical.choice` and `Quot.sound`.
