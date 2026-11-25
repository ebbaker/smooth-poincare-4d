# CUT-E02 · Two full measured sides of a marked cut

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. [Route plan](../../research-plan/PLAN.md#first-symmetric-implication) ·
[Lean module](../../../../SmoothPoincare/Variational/CutNonsplitting.lean)

`SmoothPoincare.discardedMass_le_excess` proves the exact fenced disjunction.
For each branch, membership gives $I\le E_s$ by `csInf_le`. Combining it
with $E_s\le m_s+\gamma_s$ and $m_1+m_2=e$ gives
$m_{3-s}\le e-I+\gamma_s$. The member also witnesses that the energy set
is nonempty.

`SmoothPoincare.geometricDiscardedMass_le_excess` applies this comparison
on a closed smooth oriented four-manifold with one fixed source metric.
Each raw mass integrates the source metric's squared positive chiral block
norm over an entire supplied measurable side. Each capped energy uses the
corresponding smooth capped metric, its own volume, an oriented orthonormal
frame and an integrable squared block norm. Both capped metrics have
positive class Yamabe constant. Full coverage and an almost-everywhere
disjoint overlap in the source volume give $m_1+m_2=e$ by additivity.
The cost inequalities and $e+\gamma_1+\gamma_2<8\pi^2$ give a capped
energy strictly below $4\pi^2$. The opposite side then supplies the
competitor. The theorem allows signed costs if the same upper bounds and
strict total margin hold. [Finite and one-cut source](../../../../../papers/master/manuscript/marked_cut.tex)

For each possible retained side, `SmoothPoincare.MarkedSideReplacement.reassemble`
starts from the threshold recognition of the opposite capped metric and
an ambient extension of its marked cap-neighborhood germ. It uses
`exists_recognition_eqOn_capNeighborhood` to correct that recognition and
`originalTypeOfRecognizedExterior` to join the oriented partial diffeomorphisms.
The returned map agrees with the designated retained-core map and sends
the entire discarded raw side onto the named attached cap. The same map
carries the retained raw side onto the closed cap complement and pulls
back the retained metric, giving positivity, integrability in the
transported frames, exact energy equality and membership in
`geometricPositiveEnergies` on the source. [Corrected recognition](../../../../FirstOrderTwistor/MarkedCapRecognition.lean) ·
[Oriented gluing](../../../../FirstOrderTwistor/MarkedCut.lean) ·
[Metric transport](../../../../FirstOrderTwistor/GeometricCutDescent.lean)

## Geometric inputs

The two side records supply the raw sets, their core identifications with
the closed cap complements, and the neighborhood markings of the caps.
The two replacement records supply recognition below $4\pi^2$ for the
specified positive capped classes and the exact germ extension for each
opposite cap. The geometric application needs the capped homotopy-sphere
topology and the signature and Euler normalization to instantiate
Chang–Gursky–Yang Theorem A and Remark 2. The two signed collar realizations
still require their actual partial maps, open covers, overlaps, orientations
and agreement formulas. The supplied ball map identifies the full model
complement with the actual retained cap. Palais's Theorem C is the
neighborhood-extension input. In the manuscript's boundary formulation,
the extension of the attaching diffeomorphism uses the component result
for $\mathrm{Diff}(S^3)$ recorded by Hatcher. The theorem also takes the
physical seam nullity, both positive signs and both energy upper bounds as
inputs. Producing these data on a given minimizing sequence is a separate
geometric step. [Chang–Gursky–Yang, Theorem A and Remark 2](https://arxiv.org/abs/math/0309287) ·
[Palais and Hatcher source records](../../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md)

## Verification

The route plan had SHA-256 prefix `d5159428ef0d87fe`, the initial cut source
`ff85196b791f50d6`, and the pinned Lake manifest `839111aae86b6935`.
The checkout moved from `a1a8b886` to `9c579f01` during the packet. The
working main TeX read `8bfc6287c7b128598` at opening and
`d2d3a4151a4414f6` at verification. Both differ from the assigned
digest `f5ece6cb00e65ecc`. The final cut file read `c33376f493973d43`.
The relevant `prop:cut-energy` and two-survivor inequality were checked
in the matching cut input and in the current text. [Lake manifest](../../../../lake-manifest.json)

`lake env lean SmoothPoincare/Variational/CutNonsplitting.lean` and
`lake build SmoothPoincare.Variational.CutNonsplitting` passed under Lean
`4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build had 4,052 jobs. A fresh module import
checked the exact fenced type and both geometric declarations.
`#print axioms` reported only `propext`, `Classical.choice` and `Quot.sound`
for all three theorems.

The asymmetric test used $A=\{5\}$, $e=10$ and triples
$(m_1,E_1,\gamma_1)=(3,5,2)$ and $(m_2,E_2,\gamma_2)=(7,7,0)$.
Lean forced the sole member's branch and checked sharpness in both
label orders. Substituting the discarded side's cost yields a false
bound. At the exhausted margin the scalar test used $T=4$, $e=6\in A=\{6\}$,
$(m_1,E_1,\gamma_1)=(2,4,2)$ and $(m_2,E_2,\gamma_2)=(4,4,0)$.
Here $e+\gamma_1+\gamma_2=2T$ and both caps equal $T$. Lean checked the
failure of both strict threshold tests and both discarded-mass bounds
in this scalar instance.
