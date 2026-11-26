# Simultaneous four-measure bisection in a Euclidean ball

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and effort are unavailable.

Bounded execution packet `SP4-FORM-DESC-E05a` checks the Euclidean bisection
step in `prop:balanced-exterior`. The starting checkout was
`4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The working companion and master
sections had SHA-256 prefixes `96ec25cd36bf5d319` and `02095630c4e9fa89`.
The earlier marked exterior module had prefix `88ecd83e48994968`.
[Companion proof](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex) · [Master criterion](../../../../../papers/master/manuscript/balanced_disk.tex) · [Earlier formal receipt](ED03_BALANCED_MARKED_EXTERIOR.md) · [Live register](../REGISTER.md)

`AffineCutSphere` is the actual unit sphere for the Euclidean product norm on
$\mathbb R^4\times\mathbb R$. The affine form of $(n,c)$ is
$x\mapsto\langle n,x\rangle+c$. `affineCutPlane_null` proves the zero set of
each nonzero affine form is null for any measure absolutely continuous with
respect to Euclidean volume. When $n\ne0$ it uses the Haar nullity of a proper
affine subspace. At either pole the zero set is empty.

`fourMeasureImbalance` evaluates the four real differences between positive
and negative strict halfspace masses. Negation exchanges the sides.
For each limiting parameter, away from its null zero set the strict-side
indicator is locally constant as a function of the parameter. Dominated
convergence with bound $1$ gives continuity for finite measures at every
parameter, including the poles. The theorem uses no support bound for
continuity.

`FourDimensionalAntipodalZero` is the explicit Borsuk–Ulam premise that each
continuous odd map from this sphere to the four real coordinates has a zero.
No matching Borsuk–Ulam or ham-sandwich theorem was found in the pinned
Mathlib and DifferentialGeometry sources. DifferentialGeometry's
`euclideanSphereDegree_antipodal` computes the degree of the antipodal
self-map. The invocation here concerns zeros of a general odd map to
four-space. The Stone–Tukey primary landing page was available as a wrapper.
The secondary statement of Borsuk–Ulam and use of oriented hyperplanes were
checked in Theorem 2.14 and Corollary 2.15.
[Stone–Tukey, 1942](https://doi.org/10.1215/S0012-7094-42-00925-6) · [Secondary passage](https://ligm.univ-eiffel.fr/~hubard/Lectures.pdf#page=22) · [Canonical source record](../../../../../references/SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md)

`exists_fourMeasure_bisection` takes this premise and supplies one $n\ne0$
and $c$ bisecting all four measures exactly on both strict sides, with null
seam. A positive total mass of any component excludes either pole. When all
four totals vanish, a linear hyperplane works by monotonicity.
`exists_fourMeasureBall_bisection` restricts all four measures to the same
closed Euclidean unit ball and proves that both strict caps meet the open
ball. For positive restricted mass it uses nullity of the spherical
boundary. In the zero case it gives explicit opposite interior points for
a linear cut. The construction starts with the Euclidean measures and leaves
the smooth clipping and attachment to the protected disk for later packets.

The frozen [module](../../../../SmoothPoincare/Variational/FourMeasureBisection.lean)
has SHA-256 `1cdb1d98f25f6fc4181ce13b02e60ab1b8d71faabf4fa8ae02292a8e1b8381f6`.
The checkout uses Lean `4.35.0-rc3`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The manifest SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
`lake build SmoothPoincare.Variational.FourMeasureBisection` passed
(2647 jobs).
An import of the built leaf passed the six named type and axiom checks.
`#print axioms` reports `propext`, `Classical.choice` and `Quot.sound` for
the antipodal proposition and the five listed theorems.
