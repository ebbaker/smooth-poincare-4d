# IMM-E01p · Ordered pointwise principal frames

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Dispatched as a bounded E packet with
`gpt-6.2-sol` at `ultra`. Independent serving telemetry was unavailable.
[Route 08 register](../REGISTER.md) · [Oriented Gauss normal](ED03_ORIENTED_GLOBAL_NORMAL.md)

| Input | SHA-256 prefix or revision |
| --- | --- |
| [OrientedGaussNormal.lean](../../../../SmoothPoincare/Immersions/OrientedGaussNormal.lean) | `3468dc4b7248496d` |
| [IndexedHeightFibers.lean](../../../../SmoothPoincare/Heights/IndexedHeightFibers.lean) | `628c0f758d17d05cf` |
| [GaussDifferential.lean](../../../../SmoothPoincare/Heights/GaussDifferential.lean) | `3cc3c6d0781891ec` |
| [InducedBlock.lean](../../../../SmoothPoincare/Immersions/InducedBlock.lean) | `668860729fb2887d` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) `839111aae86b6935`.

## Result and scope

For any `ImmersionGaussNormal F`, the declaration
`ImmersionGaussNormal.principalFrameAt` gives a `PrincipalFrameAt F o x`
at each point $x$ of the oriented real four-dimensional source. Its
normal is the given normal at $x$, and the signed curvatures are
nondecreasing. `orientedPrincipalFrameAt F o a x` uses the global Gauss
normal constructed from $F$ and the source and ambient orientations.

The ambient second form of an isometric immersion is symmetric and
orthogonal to the immersed tangent space by the pinned DifferentialGeometry
theorems `secondFundamentalFormAmbientAt_symmetric` and
`secondFundamentalFormAmbientAt_inner_mfderiv_eq_zero_of_inner_map`.
The actual unit normal spans that orthogonal complement because its four
orthonormal immersed tangent vectors complete the normal to a basis of
Euclidean five-space. Projecting onto the normal gives the scalar second
form. The induced metric identifies it with a symmetric endomorphism by
real Riesz representation on the tangent fiber.

The finite-dimensional spectral theorem `LinearMap.IsSymmetric.eigenvectorBasis`
supplies the principal directions. Reversing the descending Mathlib order
gives the ascending order, and then adjusting the basis to the source
orientation changes basis-vector signs without changing any eigenvalues.
In strict middle signature there are two negative entries and no zero
entries. The ascending order puts the negatives in slots 0 and 1 and the
positives in slots 2 and 3. `orientedPrincipalFrameAt_middle_order` gives
this specialization for the global normal.

These frames are selected pointwise on the given immersion, including at
repeated or zero principal curvatures. The middle-order theorem is restricted
to strict middle signature. Smooth eigenbasis selection and openness of
the middle locus are separate questions.

## Verification

- [PrincipalFrameExistence.lean](../../../../SmoothPoincare/Immersions/PrincipalFrameExistence.lean)
  has SHA-256 `33372013b3790341af106cd293e69ebe1c527ed1718f24903fbcee31a6450293`.
  `lake build SmoothPoincare.Immersions.PrincipalFrameExistence` passed.
- Imported-module `#check` and `#print axioms` passed for
  `ImmersionGaussNormal.principalFrameAt`, `.principalFrameAt_monotone`,
  `.principalFrameAt_normal`, `HasMiddlePrincipalSignature.ordered_of_monotone`,
  `orientedPrincipalFrameAt`, `orientedPrincipalFrameAt_monotone`, and
  `orientedPrincipalFrameAt_middle_order`. All depend on `propext`,
  `Classical.choice`, and `Quot.sound`.
