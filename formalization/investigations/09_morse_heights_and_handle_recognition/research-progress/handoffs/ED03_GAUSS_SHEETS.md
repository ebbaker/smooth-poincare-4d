# SP4-FORM-HT-E02b · Indexed area from Gauss sheets

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet on change of variables and source multiplicity.
Actual serving model and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/GaussSheets.lean)

`GaussSheetAtlas` is a countable measurable partition of the specified source
locus \(U\). The same Gauss map is injective on each sheet. Each sheet carries
its local change-of-variables equality of measures, from the source volume
weighted by the Jacobian to the restriction of spherical area to its image.
The images can overlap. `gaussMultiplicity_eq_encard` identifies the fiber
count with the cardinality of the actual domain fiber, including infinite
fibers. `GaussSheetAtlas.multiplicity_eq_tsum` decomposes that count into a
sum of indicators of the sheet images. `GaussSheetAtlas.lintegral_multiplicity`
integrates this sum, evaluates each image mass by the local pushforward, and
reassembles the source integral on \(U\).

`gaussSheet_pushforward_of_paramDensity` proves the local pushforward for
actual source and target Riemannian volumes using two instances of the pinned
parametric change-of-variables theorem. It takes a common coordinate
parametrization, injectivity on the measurable sheet, and the pointwise
identity relating the source and target parametric densities by the Jacobian.
`gaussSheet_pushforward_of_fderivWithin` is the Euclidean-chart version, with
Mathlib's absolute determinant of the actual Fréchet derivative.
[Parametric and chart sources are identified below.](#inputs-and-verification)

`meanIndexTwo_eq_gaussMass` uses a measurable unit Gauss normal perpendicular
to the differential of the specified `IsometricHypersurface` and the
Riemannian volume of its induced metric. Its two normal fibers are disjoint
because a unit vector differs from its antipode. For ordinary area supplied
with total mass \(\omega=8\pi^2/3\) and antipodal invariance, the two normal
integrals agree. Scaling area by \(\omega^{-1}\) gives a probability measure
and the real identity
\[
   \mathbb E[m_2]=\frac{2}{\omega}\int_U\det A\,dV_g.
\]
On the source, the determinant is supplied integrable and nonnegative on
\(U\). On the direction sphere, the count supplied as a natural-valued
function agrees almost everywhere with the cardinality of the union of the
actual domain fibers. The measured sheets give measurable multiplicity.
Finite determinant mass gives integrability of the supplied count under this
agreement. [Manuscript indexed mass](../../../../../papers/master/manuscript/immersion_entry.tex#L45)

The geometric application must construct the smooth unit normal and the
countable partition of the regular locus, identify the local normalized
Jacobian with the signed determinant in middle signature, and establish that
the two fibers count index-two points off a Sard exceptional set. The
identity can then feed `indexedHeight_energy_split` with the independently
supplied smooth handle count floor and pointwise Weyl comparison. For the
retained exterior application, one additionally needs the nullity of the
boundary normal image and its antipode, and agreement with each supplied
scalar extension on the seam. Those statements are geometric inputs to
this packet. [Energy composition](ED03_INDEXED_BUDGET.md) · [Exterior height source](../../../../../papers/master/manuscript/immersion_entry.tex#L78)

## Inputs and verification

| Checked input | Revision |
| --- | --- |
| Master immersion section | SHA-256 `d294f6e4600927f533165de51106599d9c7410d27356bc57072f8fed8e2bc19d` |
| [InducedBlock.lean](../../../../SmoothPoincare/Immersions/InducedBlock.lean) | SHA-256 `668860729fb2887da490b8c621e638233e95d107d6da5757278d474a3d18718e` |
| [IntegratedSelection.lean](../../../../SmoothPoincare/Heights/IntegratedSelection.lean) | SHA-256 `73763265b0d7349ede45ab3e79831670919863d35dfd44432d9dddb528584205` |
| Mathlib `MeasureTheory/Function/Jacobian.lean` | `c55e6e786f49471c72fbddbec5415808896aec1e`, `map_withDensity_abs_det_fderiv_eq_addHaar` |
| DifferentialGeometry `Analysis/Integration/Measure/Parametric/Integration.lean` | `788efe97894474c032de6dfb1289d515f613d15a`, `lintegral_image_eq_lintegral_paramDensity_mul` |

The shared checkout advanced from `483ad3cef5a0` at intake to `b5de9758f16e`
during execution. The frozen manuscript and local parent modules still
matched the digests above. Manifest SHA-256 was
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

`lake env lean SmoothPoincare/Heights/GaussSheets.lean` and
`lake build +SmoothPoincare.Heights.GaussSheets` passed on Lean `4.35.0-rc3`
and Lake `5.0.0-src+470d5ce`. A separate import checked the exported
signatures and reported only `propext`, `Classical.choice` and `Quot.sound`
for both change-of-variables results and the multiplicity and mean theorems.
