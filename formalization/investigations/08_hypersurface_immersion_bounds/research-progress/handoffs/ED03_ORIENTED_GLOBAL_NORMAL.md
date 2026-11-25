# IMM-E01o rev. 1 · Global oriented Gauss normal

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Dispatched as a bounded E packet with
`gpt-6.2-sol` at `ultra`. Independent serving telemetry was unavailable.
[Route 08 register](../REGISTER.md) ·
[Edition 03 handoff](../../../continuation-notes/AFTER_OPEN_EQUALITY_AND_MARKED_SHELL_20261125.md) ·
[Immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex)

| Input | SHA-256 prefix or revision |
| --- | --- |
| [Immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex) | `f7a9522959429fdb` |
| [InducedBlock.lean](../../../../SmoothPoincare/Immersions/InducedBlock.lean) | `668860729fb2887d` |
| [ChartUnitNormal.lean](../../../../SmoothPoincare/Immersions/ChartUnitNormal.lean) | `6441d13c6e7db7fb` |
| [NormalChartTransition.lean](../../../../SmoothPoincare/Immersions/NormalChartTransition.lean) | `3f5b19d6cfddcfa3` |
| [GaussSheets.lean](../../../../SmoothPoincare/Heights/GaussSheets.lean) | `444e675a325620c5` |
| DifferentialGeometry `Topology/Manifold/Orientation.lean` | `6c17f5a32bd8d118` |
| Mathlib `Geometry/Manifold/Instances/Sphere.lean` | `0de5aae869875b75` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) `839111aae86b6935`.

## Result and scope

Fix a smooth isometric immersion of a boundaryless smooth real
four-manifold with a `ManifoldOrientation` into Euclidean five-space. An
ordered ambient orthonormal basis specifies the Euclidean orientation. At
each source point choose a positive tangent basis $b$ and define the
ambient vector $c$ by

\[
  \langle c,v\rangle = \operatorname{vol}_5(v,dF(b_1),\ldots,dF(b_4)).
\]

The differential is injective by isometry and positivity of the source
metric. The pushed-forward basis therefore extends to an ambient basis,
which proves $c\ne 0$. Alternation gives perpendicularity to the
differential. Replacing $b$ by any positive basis scales $c$ by a positive
determinant, so $c/\|c\|$ is the same vector on every chart overlap.
The positivity of the determinant with the unit normal in the first
slot fixes the sign. Moving this slot to the end uses four transpositions.

Local constancy of the orientation in each tangent trivialization supplies
a fixed positive basis on a neighborhood in that chart. Its image under
the actual written immersion differential is smooth. The ambient volume
form is continuous multilinear and normalization is smooth where $c$ is
nonzero. The resulting ambient vector is smooth on the full source,
including flat points. Mathlib's `ContMDiff.codRestrict_sphere` gives the
smooth map into the usual stereographic $S^4$. The construction yields
the existing `ImmersionGaussNormal` with the Borel measurable map and the
required perpendicularity to the actual manifold derivative. This packet
gives the normal input for the indexed Gauss area theorem. The differential
and regular-sheet density comparison are subsequent inputs.

## Verification

- [OrientedGaussNormal.lean](../../../../SmoothPoincare/Immersions/OrientedGaussNormal.lean)
  has SHA-256 `3468dc4b7248496d27fe639653dfa4f7b969afc9938877557ab0d189035a0319`.
  `lake build SmoothPoincare.Immersions.OrientedGaussNormal` passed.
- Imported-module `#check` and `#print axioms` passed for
  `orientedGaussNormal`, `orientedGaussNormal_smooth`,
  `orientedGaussVector_eq_of_basis`, `orientedGaussVector_perpendicular`,
  and `orientedGaussVector_volume_pos`. The reported dependencies were
  `propext`, `Classical.choice`, and `Quot.sound` for each declaration.
