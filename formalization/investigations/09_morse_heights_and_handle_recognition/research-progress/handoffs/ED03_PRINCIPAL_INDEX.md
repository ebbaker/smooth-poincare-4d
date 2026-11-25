# HT-E02c-index · Morse index in a principal frame

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. Bounded E proof of the index and nondegeneracy part
of the indexed height argument on the induced domain. Manuscript
SHA-256 prefix `d294f6e4600927f5`, lines 43–50. Route plan SHA-256 prefix
`907c230ca31ce26a`.
[Height and Hessian source](../../../../../papers/master/manuscript/immersion_entry.tex#L43) ·
[Route plan](../../research-plan/PLAN.md)

## Checked scope

Take a real quadratic form $Q$, a symmetric bilinear form $B$ with
$Q(v)=B(v,v)$, and a four-element basis in which $B$ is diagonal
with signed entries $k_i$. The results use the quadratic form's
actual Mathlib negative inertia index `sigNeg`.

| Declaration in `SmoothPoincare` | Result |
| --- | --- |
| `principalQuadratic_associated_eq` | The associated symmetric bilinear form of $Q$ is $B$. |
| `principalQuadratic_signature` | $\operatorname{sigNeg}(Q)$ counts the indices with $k_i<0$, and $\operatorname{sigNeg}(-Q)$ counts those with $k_i>0$. |
| `principalQuadratic_nondegenerate` | If every $k_i$ is nonzero, then $Q$, $-Q$ and $B$ are each nondegenerate. |
| `principalQuadratic_twoMiddle_of_orderedSigns` | With $k_0,k_1<0<k_2,k_3$, both signed quadratic forms are nondegenerate and have index two. |

[Lean module](../../../../SmoothPoincare/Heights/PrincipalIndex.lean)

Polarization identifies the actual associated form with $B$. The
off-diagonal entries give orthogonality of the given basis and its
diagonal entries give the weights of the quadratic form's basis
representation. The pinned isometry to that representation and
Sylvester's law give the two counts. The rank of the radical is
the number of zero weights. Passing to the negative form preserves
the radical by the kernel of the negated associated form.

The algebraic declarations take the signed height Hessian as input.
The application below obtains that input from the actual immersion.
Regular directions and the Gauss-map area formula with multiplicity
remain separate geometric steps.

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`.
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and manifest
SHA-256 prefix `839111aae86b6935`.

- `lake env lean SmoothPoincare/Heights/PrincipalIndex.lean` passed.
- `lake build +SmoothPoincare.Heights.PrincipalIndex` passed (1,842 jobs).
- An importing `lake env lean --stdin` checked all four declarations.
  Each axiom report lists `propext`, `Classical.choice` and `Quot.sound`.
- Checked module SHA-256
  `736e71bd9cdcc3a6be7e4688fba4eb009fe7fbdbbd793065ca7e8e1fe2e7af3a`.

## Application to the actual immersed height

`principalHeight_morseIndex` identifies the pinned manifold Morse index
at the point of a supplied principal frame as the count of the weights
$s k_i<0$ for the height in direction $s\nu$. It uses the actual chart
Hessian from `principalHeight_hessian`. Smoothness of the immersion and
continuity of the ambient linear functional give the $C^2$ height
representative in the centered chart. Its second derivative is symmetric.

`principalHeight_nondegenerateCritical` proves nondegenerate criticality
when all $s k_i$ are nonzero. Criticality follows from perpendicularity
of the supplied normal to the differential of this immersion, while
nondegeneracy uses the associated form of the same chart Hessian.
`principalHeight_twoMiddle_bothNormals` applies both results to the two
opposite unit normals in an ordered principal frame with two curvatures
of each sign. Each height has a nondegenerate critical point of index two.
[Immersion-height module](../../../../SmoothPoincare/Heights/ImmersionHeightIndex.lean)

`ImmersionChart.lean` had SHA-256 prefix `3dc69a1955cff56a` at
the importing check. `lake build +SmoothPoincare.Heights.ImmersionHeightIndex`
passed (9,735 jobs). The importing `lake env lean --stdin` checked all
three statements, with `propext`, `Classical.choice` and `Quot.sound`
in each axiom report. Checked module SHA-256
`19e025647baeb75a3fce270124c7207ed44d7ad7e2c48c89bcad06ff2c4ae850`.
