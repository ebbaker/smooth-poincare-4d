# SP4-FORM-HT-E02k · Openness of the middle-signature locus

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet in Edition 03. Actual serving model and
reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/OpenMiddleLocus.lean)

For the represented smooth isometric immersion in real Euclidean
five-space, `isOpen_middlePrincipalLocus` proves that
\(\{x:\operatorname{sig}A_x=(2,2)\}\) is open. It uses the actual
pointwise family `P : ∀ x, PrincipalFrameAt F o x`. Each frame may be
chosen independently, including its unit normal sign. The theorem has
no compactness or global normal hypothesis. Its source manifold uses the
boundaryless model and the orientation appearing in `PrincipalFrameAt`.
[Manuscript middle-signature locus](../../../../../papers/master/manuscript/immersion_entry.tex#L43)

The dimension-four criterion is a positive determinant and two vectors
on which the scalar form takes values of opposite signs. In a
diagonalizing basis, positivity of the determinant excludes zero
entries and forces even negative count by the product of the signs.
Both signs occurring in the quadratic form exclude zero and four
negative entries. Changing the coordinate basis multiplies the
determinant by a positive square. Changing the normal reverses both
quadratic signs and preserves the determinant.

At any point of strict middle signature a nonzero principal curvature
provides a smooth local unit normal. The established coordinate
transition identifies its scalar second form with the ambient second
fundamental form in every overlapping principal frame. Unit normals
agree up to sign by the critical-point condition for the actual
height. The coordinate determinant and the quadratic evaluations on the
same two fixed vectors are continuous in the chart. The strict signs
persist on a neighborhood, giving openness without choosing a
continuous principal frame. This supplies the open source locus for the
regular Gauss sheets on the same immersion.
[Regular sheet construction](../../../../SmoothPoincare/Heights/GaussRegularCover.lean)

| Input | Revision |
| --- | --- |
| `IndexedHeightFibers.lean` | SHA-256 `628c0f758d17d05cfe4ea596000a4b53f505b6ebb93c9419feaa34121c348f36` |
| `ChartUnitNormal.lean` | SHA-256 `6441d13c6e7db7fbfb98acd0506dc875bfdb4d930c4f8315ab65782897d5a1a0` |
| `FixedChartFrames.lean` | SHA-256 `f53e3aaf22467e965e2bb1454701cc7583d33b761f0353255292f099b58b4c48` |
| `NormalChartTransition.lean` | SHA-256 `3f5b19d6cfddcfa3928c7db1f1bc69b8fbb0e17efdaa6ac854d9e84b905166f5` |
| Master immersion section | SHA-256 `f7a9522959429fdb45a88955f089834ec926fcdf03eb9ded749986870d49f4ae` |
| Mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` |

`lake build +SmoothPoincare.Heights.OpenMiddleLocus` passed without
warnings on Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate
public import checked the exact openness statement with no Hausdorff
assumption and reported `propext`, `Classical.choice`, and
`Quot.sound` for `isOpen_middlePrincipalLocus`,
`hasMiddlePrincipalSignature_iff_bilin`, and
`hasMiddlePrincipalSignature_iff_posProd_signs`.
The checked module's SHA-256 is
`f6b70899ea1ffe202988ba8f466e7396396a4e70e38efcace6a7827f387d2772`.
