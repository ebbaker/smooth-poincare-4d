# E25d · Orientation of the smooth cut reassembly

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The route activation records a request for GPT-6.2 Sol at ultra. The serving runtime does not independently expose its model variant and reasoning effort. [Route activation](ACTIVATION_20261125.md)

## Verified statement

`FirstOrderTwistor.PreservesPatchOrientation p oM oXhat` requires that, at each point of the open patch source, its manifold differential act as a tangent linear equivalence sending the specified source orientation to the specified target orientation at the image. The orientations are the pinned DifferentialGeometry `ManifoldOrientation`s. `SmoothCutGluing.toDiffeomorph_preservesOrientation d hcore hexterior` concludes `d.toDiffeomorph.preservesOrientation oM oXhat`. The theorem is stated in finite dimension `n` and instantiates with the actual four-dimensional model `𝓡 4` and orientations of dimension four. [Lean source](../../../../FirstOrderTwistor/OrientedCutGluing.lean) · [Smooth reassembly](SMOOTH_GLUE_RETURN.md)

On either source open, the restriction equation gives agreement on a neighborhood of the point. Mathlib's `Filter.EventuallyEq.mfderiv_eq` identifies the glued differential with the patch differential followed by the target tangent-space cast. Equality of the actual image points makes this cast transport the target orientation at the patch value to the one at the glued value. The source cover gives the pointwise assertion everywhere. The geometric source still needs the two pointwise patch orientation proofs for the chosen markings. [E03 signed normal-coordinate collar](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md) · [E02/E05 oriented reassembly](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md)

## Inputs and checks

The E25b inputs and package pins carried over unchanged. Verification ran at `0c3399d831d71a1a17c29ffcba14ee0593315cbe` under Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. The pinned `DifferentialGeometry/Topology/Manifold/Orientation.lean` SHA-256 prefix was `6c17f5a32bd8d1189`. [E25b input versions](SMOOTH_GLUE_RETURN.md#scope-and-input-versions)

`lake env lean FirstOrderTwistor/OrientedCutGluing.lean` and `lake build FirstOrderTwistor.OrientedCutGluing` passed. A separate import checked both public declarations and an explicit application on four-dimensional Euclidean-model manifolds. `#print axioms` returned `propext`, `Classical.choice` and `Quot.sound` for both public declarations.
