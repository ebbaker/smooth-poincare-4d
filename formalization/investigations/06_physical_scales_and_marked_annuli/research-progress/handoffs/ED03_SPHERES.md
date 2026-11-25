# SCALE-E01 · Physical spheres and attainment of curvature quantiles

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. Bounded E follow-on to the physical quantile proof.
The manuscript passage in `cor:energy-radius` uses SHA-256 prefix
`8b5692f2bcab8747`. The reviewed physical metric API revision has
prefix `541f71e51c2e53e`.
[Manuscript](../../../../../papers/master/manuscript/complete_limits.tex) ·
[Physical metric API](../../../../SmoothPoincare/PhysicalScales/MetricQuantiles.lean)

## Scope

The source is a compact connected Hausdorff manifold smooth without
boundary, with a smooth Riemannian metric. The finite-dimensional model
has an inner product and positive dimension. These hypotheses cover the
Euclidean model in dimension four. The distance is the metric's own
length distance and the measure is its Riemannian volume on the Borel
space. For the chiral statements, choose a four-dimensional manifold
orientation and a family of oriented orthonormal frames of the same
metric.

| Declaration in `SmoothPoincare` | Result |
| --- | --- |
| `riemannianVolume_physicalDistanceSphere_eq_zero` | Every distance sphere of the actual metric has zero Riemannian volume for arbitrary center and real radius. |
| `geometricChiralMeasure_physicalDistanceSphere_eq_zero` | The same sphere has zero positive chiral curvature measure. |
| `exists_metricChiralQuantileAlternatives` | For a sequence of these metrics on one fixed oriented source, select attaining quantile radii for every index and every fraction in $(0,1/2]$ and obtain the measured alternatives. |

[Lean module](../../../../SmoothPoincare/PhysicalScales/DistanceSphere.lean)

## Proof dependencies

The canonical Riemannian bundle for the given metric supplies its
fiber norm and intrinsic extended metric. Compactness gives
completeness. Hopf–Rinow
(`hopf_rinow_expMapIntrinsic_surjective_minimizing`) lifts each point of
a distance sphere to a tangent vector whose length is the actual
distance from the center. In the normal linear frame,
`normalFrame_sqrt` turns the tangent length condition into membership
in the model sphere of that radius. The framed exponential is smooth
by composing `intrinsicFiber_smooth` with the frame. The full distance
sphere lies in the exponential image of that model sphere, including
points at the cut locus.

The positive-dimensional model sphere is Haar-null at every real
radius, including zero, by `Measure.addHaar_sphere`.
`riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn` sends
this null set to a Riemannian-volume null set. The equality
`physicalMetricSpace_dist` transfers the result to the physical metric
interface. The chiral measure is the corresponding volume with a
Weyl-density weight, so absolute continuity transfers the conclusion.

For the sequence theorem, `exists_isMetricChiralQuantile` applies
the continuous ball-mass and attainment result at each index and
fraction. Choice gives one radius family over the requested fractions,
which then enters `metricChiralQuantileAlternatives`. The hypotheses
are integrability of the two curvature densities, strictly positive
total chiral energy at each index, and a uniform full-curvature integral
bound. The separated outcome retains the attaining centers and measured
shells on the same metric sequence. Realizing a smooth marked shell
with analytic estimates is a further geometric step.

## Verification

Lean `4.35.0-rc3`, commit
`470d5ce1400764999581fd26d5d72b00d990b0f4`, manifest SHA-256 prefix
`839111aae86b6935`. DifferentialGeometry revision
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib revision
`c55e6e786f49471c72fbddbec5415808896aec1e`.

- `lake env lean SmoothPoincare/PhysicalScales/DistanceSphere.lean` passed.
- `lake build +SmoothPoincare.PhysicalScales.DistanceSphere` passed
  in the pinned package (4,147 jobs).
- The importing check of the three public declarations passed through
  `lake env lean --stdin`. Each `#print axioms` report lists
  `propext`, `Classical.choice` and `Quot.sound`.
- The checked module has SHA-256
  `fb46ea32f873f75cf17e284f0f32ba824bcd9e55620f368934acf3d6a2a9a168`.
