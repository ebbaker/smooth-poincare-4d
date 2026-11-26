# Physical measure transport on a marked four-ball

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and effort are unavailable.

This bounded followthrough of `SP4-FORM-DESC-E05a` uses an actual smooth
partial diffeomorphism $F$ of Euclidean four-space to a boundaryless
smooth four-manifold. Its source contains the entire closed unit ball $D$.
The target manifold is Hausdorff and sigma-compact for the smooth
image-null theorem. The input measures are finite and absolutely continuous
with respect to the volume of a supplied smooth Riemannian metric. One
can take the input measures already restricted to an exterior region.
[Companion construction](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex) · [Euclidean bisection](ED03_FOUR_MEASURE_BISECTION.md) · [Live register](../REGISTER.md)

`markedDiskPullback` restricts the source measure $\mu$ to $F(D)$ and
maps it by $F^{-1}$ on the chart target. The inverse is extended by zero
outside that target for global measurability. The restriction puts full
mass inside the target. For every Borel coordinate set $A$,
`markedDiskPullback_apply` gives $\nu(A)=\mu(F(A\cap D))$. The total
pullback equals the entire marked disk mass and the pullback is unchanged
on restriction to $D$.

`markedDiskPullback_absolutelyContinuous` takes a measurable null envelope
of a Lebesgue-null set. After intersection with $D$, its smooth chart image
has zero Riemannian volume by
`riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn`. The imported
model Haar measure and Lebesgue measure are proportional. Absolute
continuity of the physical input gives the conclusion.
`markedDiskPullback_nullSingletonClass` gives the null singleton instance
required by the finite packing theorem.

`exists_markedDisk_affine_bisection` applies the conditional affine
bisection to the same four pullbacks and transports both halfspace masses
and the null affine seam to the marked disk. Both strict caps meet the
open chart ball. Its topological input is `FourDimensionalAntipodalZero`.

`exists_markedDisk_finiteBall_division` instead supplies one finite
collection of pairwise disjoint physical chart images of closed
coordinate balls strictly inside $D$. For each of the four measures
the image of their common union has mass within the prescribed
positive tolerance of one half the total marked disk mass. The spherical
boundary is null and chart injectivity gives physical disjointness. This
conclusion uses finite packing and no antipodal premise. The remaining
geometric construction connects and rounds marked pieces while retaining
the protected disk and controlling the added mass.

The frozen [module](../../../../SmoothPoincare/Variational/ChartMeasureTransport.lean)
has SHA-256 `81c9ab6e12774300f8e4b423112dc61ea2db09ed4ba7f61cc533a984fce7a03c`.
The starting checkout was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`.
The source hashes began `708f616a6d020b4f` for `SelectedDiskCollars`,
`d679ee2c1850c6d7` for `FiniteBallDivision` and `1cdb1d98f25f6fc4`
for `FourMeasureBisection`. The package pins are Lean `4.35.0-rc3`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
The manifest SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

`lake build SmoothPoincare.Variational.ChartMeasureTransport` passed
(9789 jobs). At the interface between Mathlib and DifferentialGeometry, the
proof aligns the Borel measurable-space representations before it compares
the Haar measures. Both adapters and the eight other public declarations
passed `#check` and `#print axioms` from the built import. The reports give
`propext`, `Classical.choice` and `Quot.sound` throughout.
