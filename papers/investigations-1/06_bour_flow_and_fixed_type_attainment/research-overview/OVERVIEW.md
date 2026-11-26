# Can Bour's flow produce a minimizing Bach-flat class on the original sphere?

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Astra/ultra leadership and bounded GPT-6.2 Sol/ultra packets. Serving settings are not independently attested. The scientific baseline is repository revision \(\texttt{65f06ea}\), Bour's v1 preprint and the source passages identified in the [version receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md).

## The proposed implication

Fix a closed, connected, oriented, smooth Riemannian homotopy four-sphere \(M\). In curvature-operator Hilbert–Schmidt normalization, \(E_\pm=\int_M |W^\pm|^2\,dV\). The signature vanishes, so \(E_+=E_-=e\) on a closed source. Write \(T=4\pi^2\) and \(I=I^+(M)=\inf_{Y([g])>0}e([g])\). The input is an actual positive class with \(e<2T\). The desired conclusion is a smooth positive conformal class on this very \(M\) with \(B=0\) and \(e=I\). On a putative nonstandard type the master's recognition gap places \(I\) in the open band \((T+\varepsilon_*,2T)\). In this band attainment would also identify \(I\) with the least subcritical positive exact critical value \(a_M\). Establishing entry for every smooth type and excluding an attained minimizer in this band are separate master problems. [Master overview](../../../master/research-overview/OVERVIEW.md) · [Exact closed types](../../../master/manuscript/exact_closed_types.tex)

## Fixed parameter, then vanishing parameter

Write \(D=\int|\mathrm{Ric}_0|^2\), \(S=\int R^2\) and \(F_W=E_++E_-\). In this normalization the functional on \(M\) is
\[
\mathcal F^\alpha=(1-\alpha)F_W+\tfrac{\alpha}{2}D
                 = F_W+\tfrac{\alpha}{24}S-16\alpha\pi^2 .
\]
Bour's Theorem 1.11 treats a fixed \(0<\alpha<1\), a smooth compact four-manifold with positive Yamabe constant, and \(\mathcal F^\alpha(g_0)\le(1-\alpha)8\pi^2\chi(M)\). It states a dichotomy between a smooth critical subsequential limit and a complete noncompact nonflat scalar-flat Bach-flat pointed rescaling. A compact critical metric of the regularized functional can have nonzero Bach tensor. The source proof and the hypotheses that give uniform positivity in the strict range are the first audit. [Bour, Theorem 1.11 and §8](https://arxiv.org/html/1012.0342v1) · [Source record](../references/README.md)

The [external review, F2](../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md) proposes fixed-parameter restarts followed by \(\alpha\downarrow0\). The discussion identified a narrower test sufficient for the attainment question. Choose \(\alpha_j\downarrow0\), positive unit-volume Yamabe initial metrics with \(0\le e_{j,0}-I\le\alpha_j^2\), and \(\alpha_j<1-e_{j,0}/(2T)\) at late indices. For every smooth time of each original flow, positivity on the same \(M\) gives \(e_j(t)\ge I\). The proposed audit combines monotonicity with \(Y_{j,0}^2\le384\pi^2\) to test
\[
 e_j(t)\le e_{j,0}/(1-\alpha_j),\qquad
 S_j(t)\le384\pi^2+48\alpha_j,\qquad
 D_j(t)\le4I+4\alpha_j<32\pi^2 \quad\text{for late }j.
\]
The discussion gave the last bound as \(4I+O(\alpha_j)\). The flow packet will check the explicit constant using \(\mathcal F^{\alpha_j}(g_{j,0})\le2e_{j,0}\) and the first expression for the functional. The strict margin comes from fixing the entered type before passing to the limit. These estimates concern the full uncut metrics. Changing a cap, resetting a conformal representative or rescaling a selected piece requires its own account of \(D,S\), orientation, volume and marking. The estimates are discussion-level input awaiting independent rederivation in [01](../01_regularized_flow_and_energy/research-plan/PLAN.md).

## Where smooth topology enters

A noncompact pointed limit must acquire finite controlled ends. For each sufficiently large truncation one needs a single oriented embedding of a neighborhood of the entire compact core **with every end buffer simultaneously** into the same \(M\). At each end, sufficient regularity and a small-cost change to an exact round quotient collar on that closed source are required for the \(E_+<9\pi^2\) obstruction. If all end groups are trivial and the embedded core has Euler characteristic \(2-k\), scalar-flat Gauss–Bonnet gives \(D_X=2F_W(X)+32\pi^2(k-1)\). A strict source bound below \(32\pi^2\) would then exclude \(k\ge2\). The remaining one-ended case needs smooth removal of the compactifying point, positivity, both chiral energies and a marked identification of the compactified manifold with \(M\). Pointed convergence alone gives maps only on compact subsets. [Neck manuscript, quotient obstruction, buffered cuts, finite punctures and same-type descent](../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex)

For compact critical endpoints, fix volume, control the constant scalar curvature and Sobolev constant, and derive elliptic estimates uniform as \(\alpha\to0\). The exact Bach compactness lemma in the neck manuscript is available in its stated Yamabe gauge. The regularized endpoints have a different critical equation. At bounded curvature the target is a smooth closed limit on \(M\). At unbounded curvature the target is a marked one-ended model with a positive smooth compactification on \(M\). To conclude equality one needs both \(e_{\rm out}\le I\) in the limit and \(I\le e_{\rm out}\) from the actual positive same-type metric. An individually compactified fixed-\(\alpha_j\) bubble can give a member of an exact sequence with energy \(I+o(1)\); the passage to an attained limit is still required. [02 · Marked limits](../02_marked_limits_and_attainment/research-plan/PLAN.md)

## Consequence for the research program

An attainment theorem would allow the master to test Euler–Lagrange equations and stability on an actual global Weyl minimizer. A precise failure of marked transfer or compactness would identify a particular missing comparison for the existing descent program. Investigation 05 can contribute such a comparison when it has the requisite physical and topological input on that source. The already recognized examples there carry their original hypotheses. [Master plan](../../../master/research-plan/PLAN.md) · [Narrowed collar investigation](../../05_collar_deformation_and_surgery/research-plan/PLAN.md)
