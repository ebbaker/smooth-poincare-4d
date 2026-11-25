# CUT-E02i · Inclusive recognition in the two-sided marked cut

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. The checkout was `b5de9758f16e14f22162b4a1e091166ea126c389`.
The opening strict module had SHA-256 prefix `eb26bb095c6931ac`. The
working marked-cut source read `fb0ff8aedc88f909`, which differed from
the assigned `b3e0f666589e9ed1`. Its `prop:cut-energy` statement and
one-cut corollary carried the inclusive threshold and nonstrict total
bound. The Lake manifest prefix was `839111aae86b6935`.
[Marked cut](../../../../../papers/master/manuscript/marked_cut.tex#L11) ·
[Lean module](../../../../SmoothPoincare/Variational/CutNonsplitting.lean)

`SmoothPoincare.MarkedSideReplacement.reassembleOfRecognition` starts
from an oriented diffeomorphism of the discarded cap to the standard
four-sphere. It corrects the cap neighborhood germ and reassembles the
source with the same open patches as the strict proof. The original
strict reassembly and discarded-mass theorems keep their types and use
the shared construction. [Strict packet](ED03_TWO_SIDES.md)

`SmoothPoincare.geometricDiscardedMass_le_excess_inclusive` takes
separately supplied oriented recognition for each actual positive capped
metric at $E_j\le T=4\pi^2$. The measured full sides satisfy
$m_1+m_2=e$ by integrability, coverage and almost-everywhere disjointness.
The caller can supply $E_1+E_2\le2T$ directly, or supply
$e+\gamma_1+\gamma_2\le2T$ together with the individual capped energy
bounds. One cap then has energy at most $T$. Reassembly and pullback of
the opposite capped metric give admissible membership on the original
oriented type. The resulting branch bounds $m_{3-s}$ by
$e-I^+(M)+\gamma_s$ for its surviving cap $s$.

`SmoothPoincare.MarkedSideReplacement.recognizeOriginalOfBothCaps_le_threshold`
applies when both capped energies are at most $T$. It returns the
marked identification $\Phi$ of the source with a retained cap and the
oriented recognition $r$ of that cap. The composition $r\circ\Phi$
identifies the source with the standard sphere. The intermediate map
agrees with the full retained core map and identifies each raw side with
its recorded cap or closed cap complement.

The inclusive recognition is an explicit input on the two specified
positive capped classes, including at equality. The application needs
the capped homotopy-sphere topology, the inclusive sphere recognition
criterion, the ambient cap-germ extension, and the signed collar
realizations. The cap Yamabe signs and energy estimates remain supplied
by the geometric construction. [Manuscript recognition](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L200)

## Verification

`lake env lean SmoothPoincare/Variational/CutNonsplitting.lean` and
`lake build SmoothPoincare.Variational.CutNonsplitting` passed under Lean
`4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build completed 4,052 jobs. In a fresh import,
`#check` confirmed the inclusive comparison, the returned marked images,
and the existing strict interfaces. `#print axioms` reported only
`propext`, `Classical.choice` and `Quot.sound` for the checked declarations.
The strict tests for swapped surcharges and the exhausted margin
still passed. A separate test took $E_1=E_2=T$ in the scalar comparison.
The geometric tie test supplied recognition at equality for the two
specified caps and obtained the orientation of the composition and
both intermediate marked side images. [Lake manifest](../../../../lake-manifest.json)
