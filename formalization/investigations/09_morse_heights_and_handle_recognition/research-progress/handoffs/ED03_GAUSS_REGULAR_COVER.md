# SP4-FORM-HT-E02d · Countable Gauss sheets on the regular locus

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet on the local inverse charts and the measurable
partition. Actual serving model and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/GaussRegularCover.lean)

`exists_gaussRegularSheets_of_localDiffeomorph` obtains local source
neighborhoods by intersecting the inverse-function neighborhood with the
open locus and a source chart. Second countability gives a countable
subcover. The successive differences give a disjoint measurable partition
of the entire locus. Every piece retains injectivity of the same map and
the source chart which contains it. The Borel images follow by Lusin–Souslin
with the supplied Polish source and Hausdorff target. Empty sheets include
the case of an empty locus.

`ImmersionGaussNormal.exists_regularSheets` applies this argument to the
measurable unit normal of the specified isometric immersion and the standard
smooth four-sphere. Smoothness on the open locus and invertibility of the
actual Gauss differential there yield the local diffeomorphisms by the
pinned manifold inverse function theorem. `GaussRegularSheets.parametrization`
returns a measurable coordinate subset, its open chart domain inside the
locus, the chart inverse and the composed Gauss map. The statement identifies
the inverse and the subset with those of the retained chart. The inverse
is injective on the subset and maps it onto the sheet. These are
the chart prerequisites for the local volume pushforward. Its remaining
geometric premise identifies the ratio of the target and source parametric
densities with the signed shape determinant on the middle locus.
[Measured sheets](ED03_GAUSS_SHEETS.md)

## Direction probability and fiber audit

`gaussFiber_finite_of_compact_of_locallyInjective` isolates the full closed
fiber of a direction by continuity of the normal on the compact source.
Local injectivity at every point of that fiber makes it discrete. Compactness
then makes it finite. Apply this to both regular directions \(u\) and
\(-u\), then take the two restrictions to the open middle locus. The count
of their disjoint union is finite on those directions. Compactness of the
open middle locus is unnecessary. To identify this count with the finite
Morse index-two count, one still needs regularity of the two directions and
the height Hessian identification with the signed shape operator.
The downstream probability theorem takes a globally measurable natural
count representative. The sheet theorem supplies the measurable extended
count, and the finite regular fibers specify its natural values there.
[Manuscript count](../../../../../papers/master/manuscript/immersion_entry.tex#L45)

`ae_avoid_two_normals_of_null` transports any supplied area-null exceptional
set under antipodal invariance and positive area normalization. Thus the
critical-value exception would have zero contribution for both signs in the
Bochner mean. The pinned Euclidean local result available for assembling
Sard is `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`. A global
manifold argument must identify the singular differential in compatible
charts and transport the local null images to the spherical measure. For
an exterior with boundary, the boundary normal image requires its own null
argument before identifying the count with the extension across the seam.
The pinned `riemannianVolumeMeasure_image_boundary_eq_zero_of_modelHaar_frontier_eq_zero`
in `Analysis/Integration/Measure/NullImage.lean` reduces that piece to
the nullity of the boundary-model frontier and differentiability of the
normal up to the seam.

The normalization used in the mean is \(\mu=\sigma/\omega\), with ordinary
spherical area \(\sigma\) and \(\omega=8\pi^2/3\). Orthogonal reflection
preserves round area. The Euclidean cone formula gives mass
\(5\operatorname{vol}(B^5)=8\pi^2/3\), using
\(\operatorname{vol}(B^5)=\pi^{5/2}/\Gamma(7/2)=8\pi^2/15\).
The pinned `Measure.toSphere_apply_univ` and `euclideanSphereArea_eq` cover
the cone normalization. The identification of that area with the round
Riemannian volume, its antipodal invariance in the required Lean measure
instance, and the numerical mass specialization remain explicit inputs
to the indexed mean theorem.

## Inputs and verification

The checkout remained based at `b5de9758f16e`. `GaussSheets.lean` had
SHA-256 `444e675a325620c577c4d95d007f94d448d373ffc875c78cc2f47bfc8ededae0`.
The unchanged Lake manifest SHA-256 prefix is `839111aae86b6935`.

- Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` provides
  `TopologicalSpace.isOpen_iUnion_countable`, `disjointed`, Lusin–Souslin,
  and the Euclidean determinant-zero image theorem.
- DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` provides
  `isLocalDiffeomorphAt_of_contMDiffOn_of_isInvertible_mfderiv` in
  `Topology/Manifold/InverseFunction.lean`, the smooth extended chart in
  `Topology/Manifold/PartialDiffeomorph/Chart.lean`, and its cone sphere mass
  formula in `Analysis/SpecialFunctions/JacobiModel/Volume.lean`.

`lake build +SmoothPoincare.Heights.GaussRegularCover` passed on Lean
`4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate import checked the
main declarations and reported only `propext`, `Classical.choice` and
`Quot.sound` for all five results.
