# IMM-E01c · Codazzi jets at open saturation

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning
effort were unavailable. This is a bounded E proof of the pointwise
rank-two blocks and the final mixed curvature calculation. The
launch fingerprint of the manuscript was `c08d7c3251b9ddc4`.
The running checkout had manuscript SHA-256 prefix
`d294f6e4600927f5`. Lines 62–69 there contain the corresponding
open-saturation argument.
[Immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex#L62) ·
[Equality audit](../../../../../papers/master/reviews/E34_MIDDLE_WEYL_EQUALITY.md#sharp-pointwise-estimate-and-strict-integrated-estimate)

## Pointwise results

`SmoothPoincare.saturatedCodazziJets_zero` accepts the components
$T_{ijk}=\langle(\nabla_{e_i}A)e_j,e_k\rangle$ and the corresponding
derivatives $da_i$ of the common magnitude, as real arrays in an
adapted orthonormal frame ordered with signs $(-1,-1,1,1)$. Assume
symmetry in the first two slots from Codazzi, symmetry in the last
two from self-adjointness, and the differentiated diagonal equation
$T_{ijk}=\delta_{jk}\sigma_j da_i$ when $\sigma_j=\sigma_k$.
The conclusion gives both $da_i=0$ for all $i$ and $T_{ijk}=0$ for
all $i,j,k$.

For each $i$ there is a distinct partner $j$ of equal sign. The
projected equation gives $T_{ijj}=\sigma_j da_i$ and $T_{jij}=0$.
Codazzi equates these entries, forcing $da_i=0$. Among any three
indices there is an equal-sign pair. The two symmetries put that
pair in the last two slots, so the same projected equation makes
the original component zero.

`SmoothPoincare.saturatedPrincipalFrame_noCurvatureCommutation`
takes an actual induced principal frame with spectrum $(-a,-a,a,a)$,
$a>0$, and the coefficient equation for commutation of $A$ with
curvature. The equation on the mixed wedge $e_0\wedge e_2$ forces
its sectional curvature to be zero by the difference of the two
eigenvalues. The checked induced Gauss identity gives the mixed
sectional value $-a^2$, a contradiction.

[Lean module](../../../../SmoothPoincare/Immersions/CodazziJets.lean)

## Geometric hypotheses

The jet theorem's projection equation follows by differentiating
$A e_j=\sigma_j a e_j$ in a smooth local adapted frame. Pairing
$(\nabla_{e_i}A)e_j$ with $e_k$ leaves the diagonal derivative and a
connection term multiplied by the difference of the eigenvalues.
The connection term vanishes for a same-sign pair. The formal
application still needs the local smooth eigenbundle and frame
realization on the actual saturated open set and the corresponding
geometric identities for the supplied jets. Vanishing over that
neighborhood would make $A$ parallel there, giving the curvature
commutation premise via the curvature of the endomorphism bundle.
The checked mixed-wedge contradiction uses the same induced metric
and frame. The indexed Gauss and handle-count inputs remain separate
premises for inclusive recognition.

## Verification

Lean `4.35.0-rc3`, commit `470d5ce1400764999581fd26d5d72b00d990b0f4`.
Lake manifest SHA-256 prefix `839111aae86b6935`.

- `lake env lean SmoothPoincare/Immersions/CodazziJets.lean` passed
  against the checked `InducedBlock` module, with source SHA-256 prefix
  `668860729fb2887d`.
- `lake build +SmoothPoincare.Immersions.CodazziJets` passed (9,727 jobs).
- An importing `lake env lean --stdin` checked both public declarations.
  Each `#print axioms` reports `propext`, `Classical.choice`
  and `Quot.sound`.
- Checked module SHA-256
  `8d4279c5d32919ca04871da34b6cfa96b50ba6014198679b79c44260d5a4c960`.
