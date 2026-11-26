# Edition 03 · Finite marked packing in a smooth atlas

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E continuation using the finite Euclidean Besicovitch
packing and the actual smooth atlas. The serving model identifier and
reasoning effort are unavailable to the worker. [Route 07](../REGISTER.md) ·
[Balanced exterior construction](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex)

Let \(U\) be an arbitrary open subset of a compact Hausdorff smooth
boundaryless four-manifold \(M\), and let \(\mu\) be a finite Borel measure
annihilating singletons. For every \(\delta,\varepsilon>0\), the construction
selects a finite pairwise disjoint family of closed disks in \(U\). Each has
\(\mu\)-mass below \(\delta\) and the complement of their union in \(U\) has
\(\mu\)-mass below \(\varepsilon\). Each disk is the image of the closed
Euclidean unit ball under a smooth partial diffeomorphism whose source
contains that entire ball. The disk therefore has a smooth extended marking.
[Atlas packing module](../../../../SmoothPoincare/Variational/AtlasBallPacking.lean)

On one supplied chart \(F\), restrict the physical measure to the target
and push it forward by \(F^{-1}\). Almost-everywhere measurability follows
from continuity on that target. The pushed measure is finite and annihilates
singletons because the inverse coordinate map is injective there. Apply
`exists_fine_finite_ball_packing` inside the Euclidean open inverse image of
\(U\) in this chart. Equality of the pushed measure with the mass of the
actual image transports the local remainder as well as each ball mass. An
explicit affine translation and positive dilation turns each closed model
ball \(\overline B(p,r)\) into a marked unit disk. [Euclidean packing](../../../../SmoothPoincare/Variational/FiniteBallDivision.lean)

On a finite atlas, apply the next chart to the current open remainder after
subtracting the entire family already selected. The disks selected earlier
are closed, so this remainder is open and every new disk is disjoint from
every earlier disk. The uncovered portion in the union of the chart targets
is contained in the union of the two uncovered portions from the induction
step. Splitting the tolerance in half and using subadditivity closes the
step. Compactness gives a finite subcover of the actual smooth atlas and
therefore exhaustion of \(U\) to the prescribed tolerance.

Taking the sum of the four finite measures provides a common dominating
measure when each measure annihilates singletons. The measured-subfamily
criterion selects an approximate half for all four, and the finite separator
realizes the chosen subfamily exactly as the trace of the marked outer
disk's closed exterior on the packed disks. The measure error on the rest of
the exterior is bounded by the omitted packing mass and the original seam,
which is null for measures absolutely continuous with respect to physical
volume. The construction supplies a marked seam and an exterior charge
estimate. A geometric repair across that seam remains a separate task.
[Marked atlas division](../../../../SmoothPoincare/Variational/MarkedAtlasDivision.lean)
· [Finite separator](../../../../SmoothPoincare/Variational/MarkedDiskSeparation.lean)

The working base was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The pinned
Lean version was `4.35.0-rc3`, Mathlib was at
`c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry was at
`788efe97894474c032de6dfb1289d515f613d15a`.

The 26 November 2026 UTC integration used working base
`5706ef811adc3691fd85e75507a0a399cb81d18d` and the same pins. The targeted
Lake build accepted `AtlasBallPacking.lean` at source SHA-256
`3e06c2a84244a6ee9ee07305b73358f21b57677df2437d48982d82886ea1c7a6`
and compiled `MarkedAtlasDivision.lean` at SHA-256
`07b77d0c7cfa97b395809661763c7b59d8df623779c026d69d092fd1d00b6e3d`
without diagnostics. A replay through
`SmoothPoincare.Variational.BalancedPhysicalDivision` checked
`exists_fine_atlas_disk_packing`, `exists_four_measure_atlas_division`,
`exists_bisecting_marked_disks`, `markedDisk_seam_null` and
`exists_marked_four_measure_half_of_separation`. Each depends on `propext`,
`Classical.choice` and `Quot.sound`.
