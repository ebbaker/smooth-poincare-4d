# IMM-E01r · Continuity and integrability of the induced Weyl density

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance as a bounded E packet. The serving model and
reasoning effort were unavailable. [Route 08 register](../REGISTER.md) ·
[Immersion manuscript, eq:middle-weyl](../../../../../papers/master/manuscript/immersion_entry.tex)

| Input | SHA-256 prefix or revision |
| --- | --- |
| [Immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex) | `f7a9522959429fdb` |
| [InducedBlock.lean](../../../../SmoothPoincare/Immersions/InducedBlock.lean) | `668860729fb2887d` |
| [FixedChartFrames.lean](../../../../SmoothPoincare/Immersions/FixedChartFrames.lean) | `f53e3aaf22467e965` |
| [NormalChartTransition.lean](../../../../SmoothPoincare/Immersions/NormalChartTransition.lean) | `3f5b19d6cfddcfa3` |
| [ChartShapeDual.lean](../../../../SmoothPoincare/Immersions/ChartShapeDual.lean) | `7dd380f5a790a7630` |
| [PrincipalPatch.lean](../../../../SmoothPoincare/Immersions/PrincipalPatch.lean) | `d6dd76baf71507fa6` |
| [OrientedGaussNormal.lean](../../../../SmoothPoincare/Immersions/OrientedGaussNormal.lean) | `3468dc4b7248496d` |
| [GaussDifferential.lean](../../../../SmoothPoincare/Heights/GaussDifferential.lean) | `3cc3c6d0781891ec` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) `839111aae86b6935`.

## Result and scope

For a smooth isometric immersion of a boundaryless oriented smooth real
four-manifold into Euclidean five-space, the squared Hilbert–Schmidt norm
of the actual positive Weyl block is continuous in any independently
chosen pointwise oriented principal frames. The result covers vanishing
and repeated principal curvatures. When the source is compact the same
density is integrable for the volume of the induced metric.

In a chart the smooth oriented Gauss vector gives the signed normal form,
and its metric dual is a `C²` field of endomorphisms. The oriented Gauss
vector and the chosen principal normal agree up to sign at each point.
Transporting the principal frame to the fixed chart therefore
diagonalizes the metric dual with all eigenvalues signed together. If
$A$ is its matrix in any fixed chart basis, write
\[
  e_2=\frac{(\operatorname{tr} A)^2-\operatorname{tr}(A^2)}{2},\qquad
  q=\frac{(\operatorname{tr}(A^2))^2-\operatorname{tr}(A^4)}{2}.
\]
The Gauss formula for the chiral density gives
\[
  |W^+|_{\mathrm{HS}}^2=\frac{q+6\det A}{4}-\frac{e_2^2}{12}.
\]
Lean checks the identity in the diagonal basis. Both basis change and
normal sign change preserve its value. The expression in the fixed
basis is continuous. Compactness gives compact support and the
Riemannian volume is finite on compact sets.

## Verification

- [ChiralEnergyContinuity.lean](../../../../SmoothPoincare/Immersions/ChiralEnergyContinuity.lean)
  has SHA-256 `2a4d8c695fe437551dc3e6ec24b46d0c8ad0b177d0281cb6cbdc060fab14bff3`.
  `lake build SmoothPoincare.Immersions.ChiralEnergyContinuity` passed.
- Imported-module `#check` and `#print axioms` checked
  `SmoothPoincare.continuous_inducedChiralDensity` and
  `SmoothPoincare.integrable_inducedChiralDensity`. Both declarations
  depend on `propext`, `Classical.choice`, and `Quot.sound`.
