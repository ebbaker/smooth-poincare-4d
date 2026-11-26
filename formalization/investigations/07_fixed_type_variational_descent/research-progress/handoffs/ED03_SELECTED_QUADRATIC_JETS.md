# Edition 03 · First-jet products at the selected physical width

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. `SP4-FORM-DESC-E06e` is a bounded proof packet on
working base `5706ef811adc3691fd85e75507a0a399cb81d18d`. The independent
serving model identifier and reasoning effort were unavailable.
[Route 07](../REGISTER.md) · [Selected physical jets](ED03_SELECTED_PHYSICAL_JETS.md) ·
[Lean module](../../../../SmoothPoincare/Variational/SelectedQuadraticJets.lean)

## One physical splice, one measure

Let \(F\) be the selected outer marking, \(w=1/(n+1)\) its buffered
width, and \(\mu\) the original Riemannian volume restricted to the
entire selected trim and pushed back by the inverse marking. Choose any
smooth incoming metric \(g\) and smooth reference \(b\) on the source.
`exists_selectedPhysicalSplice_native_model` uses the same \(F,n\) to
construct the ambient cutoff \(\chi\), two smooth model lifts \(G,B\),
and a common open neighborhood of the full buffered ball. For each
\(t\in[0,1]\), the model metric there is the pullback of the ambient
convex splice. The cutoff vanishes on the entire complement of disk and
trim. The choice of reference determines what happens inside the disk.
`chartGramOnE_selectedModelSplice` identifies the actual chart Gram
entries along this model path.

For one such entry write \(A\) and \(D\) for the Gram coefficients of
\(G\) and \(B\). Put \(s=t\chi_w\), with the same squared radial step
\(\chi_w\) as in the selected physical jet packet. Its true first jet is
\[
 P_i=H_i+tE_i,\quad
 H_i=(1-s)\partial_i A+s\partial_i D,\quad
 E_i=(\partial_i\chi_w)(D-A).
\]
`selectedSpliceCoefficient_partial` proves the equality by the Fréchet
product rule. `exists_selectedChartGramFirstPartialError_on_physicalTrim`
proves \(P_i-H_i\in L^4(\mu)\) and
\[
 \|P_i-H_i\|_{4,\mu}\le t\,\frac{C}{w}\|D-A\|_{4,\mu}.
\]
Here \(C\) is fixed for the model and cutoff profile. The compact
coordinate buffer and finite physical volume give the necessary finite
norms for smooth coefficients.

## The two mixed terms and the quadratic term

For any pair of first jets of chart Gram coefficients, the product
increment from differentiating the cutoff is
\[
 P_1P_2-H_1H_2=t H_1E_2+t E_1H_2+t^2 E_1E_2.
\]
A measurable scalar coefficient \(k\), such as a bounded inverse-Gram
entry from the spliced metric, can multiply the whole increment. With
\(|k|\le K\) almost everywhere and
\(d_j=(C/w)\|D_j-A_j\|_{4,\mu}\), Hölder gives
\[
 \|k(P_1P_2-H_1H_2)\|_{2,\mu}\le
 K\left[t\bigl(\|H_1\|_{4,\mu}d_2+d_1\|H_2\|_{4,\mu}\bigr)
       +t^2d_1d_2\right].
\]
`quadraticFirstJetProduct_memLp_and_le` proves the inequality and finite
\(L^2\) membership by bounding each product. The actual metric entries
and incoming physical trim volume enter via
`exists_selectedChartGramQuadraticFirstJet_on_physicalTrim`. The
multiplier bound comes from the supplied coefficient or its ellipticity
estimate.

If comparing with the affine combination of endpoint products, there
is also the frozen-jet discrepancy
\(-s(1-s)(\partial_iD_1-\partial_iA_1)
(\partial_jD_2-\partial_jA_2)\).
`frozenFirstJet_mul_sub_weighted` proves this identity. Comparing
curvature remainders across metrics additionally changes the value and
inverse-Gram multipliers. The remainders, moving chiral projections,
volume conversion, exterior charges, signed core saving and positive
matched cap still enter the repair test. [Commutator and coefficient
remainder](../../../../SmoothPoincare/Variational/SpliceRemainderL2.lean) ·
[Signed comparison](ED03_SIGNED_COLLAR_REPAIR.md)

## Pinned verification

Lean `4.35.0-rc3`, mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
The selected physical jet input SHA-256 was
`a22335277211ad9150c96dcf68977272471e4f6d02864eec5f61d62cc44df995`.
The bounded follow-up began on the frozen edition above. During work the
shared HEAD advanced to `4b15d52`, which contains an earlier draft of this
leaf. The completed leaf was checked from the working tree with
`lake build +SmoothPoincare.Variational.SelectedQuadraticJets` (15 s for the
leaf). An independent `lake env lean` import replay printed axioms for
all nine public theorems. Each depends only on `propext`, `Classical.choice`
and `Quot.sound`. Completed leaf SHA-256
`fa463f14b3d10068fd64122ded21d6cef8c035ce1e661bf6a93dcfbc6b28d2fa`.
