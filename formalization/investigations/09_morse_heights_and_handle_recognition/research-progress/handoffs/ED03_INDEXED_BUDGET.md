# SP4-FORM-HT-E02a · Indexed mass and chiral energy composition

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution packet with an issued integral identity and
pointwise comparison. The actual serving model and reasoning effort were
unavailable. [Lean module](../../../../SmoothPoincare/Heights/IntegratedSelection.lean)

`SmoothPoincare.indexedHeight_energy_split` uses a smooth oriented
four-dimensional Riemannian metric \(g\), a pointwise oriented orthonormal
frame, its positive chiral Weyl block and the Riemannian measure of \(g\).
Write \(H=|W^+|^2_{\rm HS}\) and \(\omega=8\pi^2/3\). The measurable
middle-signature locus \(U\), the integrable signed determinant on \(U\),
the pointwise bound \((8/3)\det A\le H\) there and the normalized indexed
identity \(\mathbb E[m_2]=(2/\omega)\int_U\det A\,dV_g\) are premises.
The theorem gives the identity
\[
E_+(g)-\tfrac83\omega
=\int_{U^c} H\,dV_g
 +\int_U\bigl(H-\tfrac83\det A\bigr)\,dV_g
 +\tfrac43\omega\bigl(\mathbb E[m_2]-2\bigr).
\]
The first two terms use the full stated regions and the same density and
volume as the total. The comparison and supplied almost-sure count floor
make all three terms nonnegative. [Immersion source](../../../../../papers/master/manuscript/immersion_entry.tex#L74)

`SmoothPoincare.prob_and_exists_regular_twoMiddle_of_subcritical_energy`
uses the split and \(E_+(g)<8\pi^2\) to derive the strict mean bound, then
proves \(\Pr(m_2=2)>3/4\) and selects a direction in the supplied conull
regular set. Any data returned come from the assumed family at that
same direction.
[Probability packet](ED03_HEIGHT.md) · [Marked height source](../../../../../papers/master/notes/E36_MARKED_HEIGHT.md)

With only nonnegative deficits, \(E_+=8\pi^2\) yields a weak mean bound.
A separately established positive complement mass or middle deficit
would make the mean bound strict even at that endpoint. The split also
gives \(E_+\ge(8/3)\omega=64\pi^2/9\) under the supplied floor. The
inclusive geometric recognition test at \(64\pi^2/9\) requires a strict
comparison, for which the manuscript uses the Codazzi argument on an open
middle-signature locus. The composition leaves that geometric proof open
in Lean.

The probability space in this theorem is supplied. To specialize it to an
actual immersion of a closed smooth homotopy four-sphere, one still needs
the normalized spherical measure, a measurable regular count, the
indexed area formula with multiplicity for both normal signs, and the
smooth handle-theoretic floor on a nonstandard candidate. The theorem
uses those outputs as hypotheses. A geometric cancellation or a marked
surgery recognition test still requires its own diagram-specific data.
[Route plan](../../research-plan/PLAN.md) · [Blueprint](../../../../blueprint/src/parallel_investigations.tex)

## Inputs and verification

The route plan SHA-256 is `907c230ca31ce26a4405ad19fe57b737f327cf25c43a84cbbb91ef2d74468d7e`.
The shared checkout advanced from intake `a1a8b8866fafd` to
`9c579f0126ce` during the probability packet. The checked excess
identity appears in the approved working manuscript with digest prefix
`74a1bbdbbf92e53a` and the subsequent observed working manuscript with
prefix `cf7a5e72e147772f`. The initial issue named the revision recorded
by E48, `4f56dfe589d3525e`. The E36 note retained digest prefix
`33bcac0c687b2191`.
[Source revision record](../../../../../papers/master/reviews/E48_INTEGRATED_MARKED_TESTS.md#inputs-and-checks)

The module passed `lake build +SmoothPoincare.Heights.IntegratedSelection`
on Lean `4.35.0-rc3`, Lake `5.0.0-src+470d5ce` and unchanged pinned
manifest `839111aae86b6935`. A separate import checked both statements
and reported only `propext`, `Classical.choice` and `Quot.sound` for each.
