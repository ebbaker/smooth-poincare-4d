# One ambient contraction of finitely many marked disks

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and effort are unavailable.

This bounded followthrough concerns a finite family of pairwise disjoint
closed marked disks, all on the same Hausdorff smooth four-manifold.
Each smooth partial diffeomorphism is defined on an open neighborhood
of the whole Euclidean closed unit ball. For each disk the specified open
set contains the chart center. The sets can be chosen after the markings.
[Balanced exterior construction](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex) · [Live register](../REGISTER.md)

`exists_diffeomorph_contracting_finiteMarkedDisks_fixing` constructs one
global smooth self-diffeomorphism. It sends each closed disk into the
intersection of that disk with the corresponding open set. It fixes an
arbitrary disjoint closed set pointwise. The empty protected-set instance is
`exists_diffeomorph_contracting_finiteMarkedDisks`.

For each disk, use the complement of the protected set and all the other
closed disks as its open control region. The source chart is continuous at
the chart center. A sufficiently small open coordinate ball therefore
maps into the prescribed neighborhood. The pinned DifferentialGeometry
theorem `exists_diffeomorphs_contracting_embedded_closedBall` radially
contracts the closed disk by the scale $\exp(-t)$ with $t\ge0$ and fixes
points outside a compact subset of the control region. Choosing a finite
$t$ places the whole contracted disk in the small coordinate ball.
Compose these ambient diffeomorphisms by finite induction. Every later
factor fixes the original disks already handled, so their contracted
images retain their inclusions.

The starting checkout was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`.
The imported `SelectedComparisonDisks` had SHA-256 prefix
`3d9d7ef05c96a8a8`. The pinned DifferentialGeometry source
`Topology/Manifold/EmbeddedBallContraction.lean` had prefix
`f7336e0a8a3f830d`. The pins are Lean `4.35.0-rc3`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
The manifest SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
