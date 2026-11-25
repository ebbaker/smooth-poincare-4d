# SP4-FORM-HT-E02f · Actual index-two critical points and Gauss fibers

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet on the pointwise classification and its count.
Actual serving model and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/IndexedHeightFibers.lean)

For one specified isometric immersion and a supplied principal frame at
each domain point, `principalHeight_indexTwo_iff` proves that the actual
height in a unit direction \(v\) is nondegenerate of index two at \(x\)
exactly when \(v\) is one of the two principal unit normals and the shape
has strict signature \((2,2)\) at \(x\). The Hessian is diagonal in the
principal basis. A zero signed coefficient puts its basis vector in the
Hessian kernel, so nondegeneracy excludes zero coefficients. The two normal
signs give the negative and positive counts respectively. With no zero
coefficients their sum is four, so either normal has index two exactly
when both sign counts are two. The argument uses pointwise frames.

`indexedHeightTwoPoints_eq_gaussFibers` identifies the complete set of
nondegenerate index-two points with \(U\cap N^{-1}(\{v,-v\})\), for the
specified measurable unit normal \(N\) of the same immersion and \(U\)
defined by the strict middle signature. Perpendicularity and unit length
identify \(N(x)\) with one of the two principal normals, so the theorem
requires no separate sign-coherence premise. The equivalence excludes
nondegenerate index-two points outside \(U\).
`indexedHeightTwoPoints_eq_criticalPoints_of_morse` identifies this set
with the index-two restriction of the ordinary critical set at a Morse
height. [Manuscript indexed count](../../../../../papers/master/manuscript/immersion_entry.tex#L45)

`meanActualIndexTwo_eq_gaussMass` attaches the measurable-sheet result to
this actual critical-point set. The extended count of the two source fibers
is measurable. The natural cardinality is its real value followed by the
natural floor, including the agreed zero value for infinite sets. The
determinant integral is finite, so the measure-theoretic fiber count is
finite almost everywhere and agrees there with the natural cardinality.
The theorem returns measurability and integrability of the actual count and
its normalized indexed mean
\[
   \int m_2(v)\,d\mu(v)=\frac{2}{8\pi^2/3}\int_U\det A\,dV_g.
\]
The same Gauss normal, region, and source Riemannian volume appear throughout.
[Measured sheet proof](ED03_GAUSS_SHEETS.md) · [Regular cover](ED03_GAUSS_REGULAR_COVER.md)

The geometric application still supplies the global normal and pointwise
principal frames, identifies the signed shape determinant in the local
volume pushforwards, and verifies round area and its normalization. The
count in the displayed theorem concerns nondegenerate index-two points.
Applying the smooth handle count floor requires a conull set of Morse
heights and the separate smooth topological argument.
[Energy composition](ED03_INDEXED_BUDGET.md)

## Inputs and verification

The checkout base during proof work was `b5de9758f16e`. The Lake manifest
SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

| Frozen Lean source | SHA-256 |
| --- | --- |
| [GaussDifferential.lean](../../../../SmoothPoincare/Heights/GaussDifferential.lean) | `3cc3c6d0781891ec9986fa9c74a282c3b041e87f8e5f5d6a61252dd1e3050dbf` |
| [ImmersionHeightIndex.lean](../../../../SmoothPoincare/Heights/ImmersionHeightIndex.lean) | `19e025647baeb75a3fce270124c7207ed44d7ad7e2c48c89bcad06ff2c4ae850` |
| [GaussSheets.lean](../../../../SmoothPoincare/Heights/GaussSheets.lean) | `444e675a325620c577c4d95d007f94d448d373ffc875c78cc2f47bfc8ededae0` |
| [GaussRegularCover.lean](../../../../SmoothPoincare/Heights/GaussRegularCover.lean) | `afb35b11aa4ece860c98c7c644720a6d1bc239b4529ac965ab008e17032af242` |

The pointwise inputs are `principalHeight_unitCritical_iff`,
`principalHeight_hessian`, and `principalHeight_morseIndex`. The natural
count uses Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, in
`MeasureTheory/Measure/Count.lean` and `MeasureTheory/Function/Floor.lean`.
The Morse predicates and index are from DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`.

`lake build +SmoothPoincare.Heights.IndexedHeightFibers` passed on Lean
`4.35.0-rc3` and Lake `5.0.0-src+470d5ce`. A separate import checked the
whole-set equality and mean signatures. All five theorems reported only
`propext`, `Classical.choice` and `Quot.sound`.
