# VAR-E04b · Fixed-chart splice density comparison

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This bounded E packet treats the measured comparison in
`weak:splice` and `thm:local-min`. The [Route 05 register](../REGISTER.md)
owns the live status.

## Frozen inputs

| Input | SHA-256 prefix |
| --- | --- |
| [First-order splice manuscript](../../../../../papers/master/manuscript/first_order_splice.tex) | `e31283f6c8429f7f` |
| [Defect.lean](../../../../SmoothPoincare/Variational/Defect.lean) | `98189f6ba6435a32` |
| [CapSplice.lean](../../../../FirstOrderTwistor/CapSplice.lean) | `4b6908e9434c6ad1` |
| [CurvatureCompressionBound.lean](../../../../FirstOrderTwistor/CurvatureCompressionBound.lean) | `c277ca699fdb990c` |
| [CurvatureDensityLimit.lean](../../../../FirstOrderTwistor/CurvatureDensityLimit.lean) | `d85b74c5d25b6f30` |
| [FixedMetricEnergy.lean](../../../../FirstOrderTwistor/FixedMetricEnergy.lean) | `d466dd4414b4f064` |

Issue checkout `b5de9758f16e14f22162b4a1e091166ea126c389`. Lean
`4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and manifest
`839111aae86b6935`. Installed DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` match the pins.

## Comparison proved

`spliceEnergyDifference_le` takes a moving and a comparison curvature
array in the same fixed coefficient space. Both functions are in $L^2$
for the one specified measure. If the curvature residual is bounded
by $\varepsilon$, the comparison curvature norm by $K$, the two
continuous linear projection norms by $B$, and their operator difference
by $\eta$, then the absolute difference of the squared projected
energy integrals is bounded by $(2BK+\Delta)\Delta$, with
$\Delta=B\varepsilon+\eta K$. The proof applies the moving operator to
the curvature residual, then adds its difference from the comparison
operator applied to the comparison curvature. The reverse triangle
inequality in $L^2$ controls the squared integral. The comparison
bound is independent of path parameter in
`tendstoUniformly_spliceEnergyDifference`.

`weightedSpliceProjector_bounds` treats the half-density explicitly.
An upper bound $V$ on both square roots of the volume Jacobians, an
unweighted projection bound $B$, a projection difference bound $\eta$,
and a Jacobian difference bound $\delta$ give a weighted projection
difference bounded by $V\eta+B\sqrt{\delta}$. In particular uniform
vanishing of the unweighted distortions supplies the weighted one.
The coefficient norm after the square-root weight squares to the
one-Jacobian energy density.

`tendstoUniformly_geometricSpliceEnergy` compares the actual positive
Weyl energy of a moving smooth Riemannian metric on one measurable
region with the corresponding projected comparison energy. The nine
coordinates have exactly Hilbert–Schmidt squared norm. The geometric
specialization requires the stated equality of the moving operator
on the moving curvature with the square-root-weighted geometric
block in the supplied oriented orthonormal frame. The square-integral
comparison follows from the linear and $L^2$ premises.

The linear map `framedChiralCompression` performs the trace-free self-dual
compression from the ordered four-slot Euclidean coefficient space to the
nine chiral coefficients. Its operator norm is at most one in these
norms. `framedChiralCompression_metricCurvature` exactly evaluates the
actual geometric block when fed the Levi-Civita curvature slots in that
frame. This supplies the algebraic part of the geometric identification.

## Fixed reference and remaining geometry

The reference measure in the actual-metric result is the volume of
one fixed smooth metric $q$, restricted to the same measurable region
for all indices and parameters. The existing volume density theorem
writes the actual volume as that reference volume weighted by the
positive Jacobian. Lean uses the square root once on the coefficient
field and the Jacobian once on its squared energy. The comparison uses
the full region even if its image has small physical volume. A
Euclidean-coordinate formulation chooses Euclidean reference volume
in the fixed chart, with the marking or change of variables identifying
the region.

The actual moving family still requires the shared-coordinate
all-lowered curvature residual from the splice jets, a coherent
contraction from these coordinates to the moving frames, and uniform
bounds for that contraction and the volume Jacobians. The available
pointwise frame and volume continuity proofs use prescribed tangent
frames and do not alone give the uniform operator estimate. Within
the fixed domain, almost-everywhere tests may have null sets depending
on the parameter because the resulting scalar estimate is uniform.
The global conformal transplant, its unchanged exterior energy and
the subsequent variation remain separate geometric steps.
[Uniformity inputs from fixed-point frames](../../../../FirstOrderTwistor/ConvergingFrames.lean) ·
[Volume limit](../../../../FirstOrderTwistor/MetricVolumeLimit.lean) ·
[Local replacement manuscript](../../../../../papers/master/manuscript/variational_comparison.tex)

## Verification

- [SpliceDensity.lean](../../../../SmoothPoincare/Variational/SpliceDensity.lean)
  has SHA-256 `45260991e7582a12fd1c364a36d89d8555ae23f5a554bcab952aa1f4e26ccaa7`.
  Both `lake env lean SmoothPoincare/Variational/SpliceDensity.lean` and
  `lake build SmoothPoincare.Variational.SpliceDensity` completed.
- An imported-module screen checked the comparison statements and their
  geometric block bridge. `#print axioms` on the new public theorems
  reported only `propext`, `Classical.choice`, and `Quot.sound`.
