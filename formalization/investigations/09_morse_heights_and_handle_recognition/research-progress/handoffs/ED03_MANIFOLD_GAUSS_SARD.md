# SP4-FORM-HT-E02i · Manifold Sard and both normal directions

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet, revision 1. Actual serving model and reasoning
effort were unavailable. [Lean module](../../../../SmoothPoincare/Heights/ManifoldGaussSard.lean) · [Manuscript](../../../../../papers/master/manuscript/immersion_entry.tex)

`riemannianVolumeMeasure_criticalValues_eq_zero` proves global Sard in equal
finite dimensions for a smooth map of boundaryless real manifolds. The source
is second countable. The target is Hausdorff and sigma-compact, with a smooth
Riemannian metric. For each source chart and target chart, the coordinate map
is smooth on the open coordinate domain where the composition is defined.
The chain rule and injectivity of the target chart differential show that
failure of surjectivity of the actual manifold differential implies failure
of surjectivity of the coordinate derivative. The equal-dimensional
additive Haar Sard theorem makes its coordinate image null. The inverse
target chart sends that null image to a set of Riemannian volume zero. The
open source patches using target charts centered at the corresponding
images have a countable subcover. Their image nullities give the conclusion
for the entire critical set.

`ImmersionGaussNormal.roundArea_criticalValues_eq_zero` specializes the
argument to the given unit normal of the specified isometric immersion
in Euclidean five-space. Its premises are dimension four and smoothness of
that normal. `ImmersionGaussNormal.ae_invertible_mfderiv_on_two_normal_fibers`
applies Sard to the same map and its composition with the smooth antipodal
diffeomorphism. The antipodal differential is injective, so a singular point
of the original map is singular for the composition. For almost every
direction under the round Riemannian volume scaled by
\((8\pi^2/3)^{-1}\), the actual Gauss differential is invertible at every point
of both full normal fibers. This conclusion needs neither an assumed
critical-value nullity nor a measure-preservation premise. Identifying this
scaling as a probability uses the round-volume mass calculation. The
retained-exterior boundary image requires a separate boundary calculation.

## The actual Morse height

At a critical point of the height, its unit ambient direction and the
unit Gauss normal belong to the same normal line. Invertibility of the
normal differential on both fibers gives a nonzero absolute
principal-curvature product by the checked Gauss Jacobian identity.
Each principal curvature is therefore nonzero. The height Hessian has
diagonal entries given by these curvatures with the common sign of the
height direction. Its kernel is zero.

`orientedHeight_ae_nondegenerate` obtains the smooth normal and the actual
pointwise principal frames from the oriented immersion. Under
`normalizedGaussDirections gaussRoundArea (8 * Real.pi ^ 2 / 3)` it proves
that almost every actual height is smooth with every critical point
nondegenerate. The change from the explicit Borel instance to the native
sphere instance uses `gaussRoundArea_apply` on the null exceptional set.
Coincident critical values are permitted. The independent topological
floor uses the marked decomposition of the same smooth manifold.
[Lean module](../../../../SmoothPoincare/Heights/RegularMorseHeights.lean) · [Floor audit](../../reviews/ED03_HEIGHT_FLOOR_AUDIT.md)

## Inputs and verification

Frozen inputs at workspace revision `2fba0882dbf8766c95094ef4d1207190b0c24bc2`
were `GaussRegularCover.lean` (SHA-256 prefix `afb35b11aa4ece86`),
`GaussSheets.lean` (`444e675a325620c5`) and the Lake manifest
(`839111aae86b6935`). The current immersion manuscript hash prefix was
`f7a9522959429fdb`.

- Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` supplies the
  determinant-zero image theorem, the manifold differential chain rule,
  and countable refinement of open covers.
- DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` supplies
  `addHaar_image_eq_zero_of_not_surjective_fderivWithin` in
  `External/TauCeti/Analysis/Calculus/Sard/EqualDimension.lean`,
  `riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn` in
  `Analysis/Integration/Measure/NullImage.lean`, and
  `sphereAntipodalDiffeomorph` in
  `Topology/Manifold/StereographicAntipodal.lean`.

`lake build +SmoothPoincare.Heights.ManifoldGaussSard` passed on Lean
`4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate import with
`#check` and `#print axioms` verified all three public statements. Each
depends only on `propext`, `Classical.choice` and `Quot.sound`.

The completed height module used `GaussParametricDensity.lean`
(`28dd9c22becca2b8`), `RoundGaussArea.lean` (`e5b4981edc2599bb`),
`OrientedGaussNormal.lean` (`3468dc4b7248496d`) and
`PrincipalFrameExistence.lean` (`33372013b3790341`). The prefixes are
SHA-256. `lake build +SmoothPoincare.Heights.RegularMorseHeights` passed.
An independent import checked the three public statements and reported
only `propext`, `Classical.choice` and `Quot.sound` for each.
