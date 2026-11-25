# FOT-E26e · Integrated Weyl and Bach splice bounds

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. This fixed execution packet checks the passage from supplied splice fields and comparison bounds to integrated costs. [Lean module](../../../../FirstOrderTwistor/CapSplice.lean) · [Yamabe localization](CAP_RETURN.md) · [Route register](../REGISTER.md)

## Smooth spherical splice

Use the volume measure of the normalized splice metric restricted to the splice and a bound $V$ for that volume. In `FirstOrderTwistor`, `smoothCapSpliceWeylBound` integrates an a.e. bound $|W|\le C\eta_2$ for an a.e. strongly measurable normed-space field to obtain $\int|W|^2\,dV\le VC^2\eta_2^2$. For a fixed chirality the norm is the Hilbert–Schmidt norm of the block on real $\Lambda^\pm$. The two splices and both block costs can be summed. NECK-E01 supplies conformal invariance of the resulting Weyl integrals, the incoming equality on the unchanged region and the zero Weyl contribution on the exact cap. [NECK-E01 Weyl cost][e01weyl]

`smoothCapSpliceBachBound` independently integrates $|B|\le C\eta_4$ to get $\int|B|\,dV\le VC\eta_4$. The physical pointwise bound on the fixed normalized splice uses the separate $C^4$ metric control there, while the Weyl bound uses the normalized $C^2$ comparison. The exact cap is conformally flat and the integrated norm of the covariant Bach tensor is conformally invariant in dimension four. These geometric facts identify which terms of the physical cost the integral estimates control. [NECK-E01 Bach cost][e01bach] · [Bahuaud–Guenther–Isenberg–Mazzeo, arXiv:2508.06633v1, §1 and (1.1)](https://arxiv.org/html/2508.06633v1#S1)

## First-order comparison

Take the reference measure on the two splice strips together on the cover. The incoming and spliced $\mathcal F$ fields encode the positive-chiral block in oriented orthonormal coordinates, with the volume-density factor $(\det m)^{1/4}$ in the incoming field and the corresponding factor for the spliced metric. Their common target uses the Hilbert–Schmidt norm. Under the finite quotient of order $N$, their squared $L^2$ norms divide by $N$ to give the physical source splice energy $q$ and its replacement $A$. [NECK-E07, comparison before chiral projection][e07compare]

| Declaration | Inputs and outputs |
| --- | --- |
| `capSpliceProjectionErrorBound` | Given nonnegative constants $C,a$, an a.e. error bound by $C(a\,\mathrm{Curv}+\mathrm{Cut})$, and supplied $L^2$ envelope bounds $K_{\rm cov}$ and $D_{\rm cov}$, derive $\|\mathrm{error}\|_2\le C(aK_{\rm cov}+D_{\rm cov})$. The E07 instantiation uses $K_{\rm cov}=\sqrt N K$ and $D_{\rm cov}=d^2+d+a$, absorbing fixed equivalence and annulus constants into $C$. |
| `capSpliceNormTriangle` | For a.e. $|\theta|\le1$, prove $\|\mathcal F_{\rm splice}\|_2\le\|\mathcal F_{\rm source}\|_2+\|\mathcal F_{\rm splice}-\theta\mathcal F_{\rm source}\|_2$ in that common measure. |
| `firstOrderCapSpliceWeylBound` | With $\sigma>0$ representing $\sqrt N$ and a supplied cover residual bound $C(a\sigma K+d^2+d+a)$, derive $\sqrt A\le\sqrt q+\Delta$, $A\le(\sqrt q+\Delta)^2$, and $\mathrm{retained}+A\le\mathrm{retained}+q+2\sqrt q\,\Delta+\Delta^2$, where $\Delta=C[aK+(d^2+d+a)/\sigma]$. |

The residual hypotheses come from the smooth structure of the all-lowered Riemann tensor and the moving Weyl trace subtraction, chiral projection and density factor. The normalized curvature term uses $K=\|\mathrm{Rm}_m\|_{L^2}$ with the physical metric and volume downstairs in the specified Euclidean representative. The cutoff terms depend on $a=\|v\|_\infty$ and $d=\|Dv\|_4$ on the cover. Uniform equivalence of the metric and volume gives the bound for the curvature envelope, and the fixed central annulus and Hölder give the cutoff envelope bound. These identifications are geometric inputs to the proposition. [NECK-E07, Eq. (3) and the resulting splice bounds][e07compare]

For a strict net cost apply the last inequality with an explicit margin for $2\sqrt q\,\Delta+\Delta^2$. For a cost added to one unchanged side, use the absolute analogue with that side's splice measure. The first-order controlled fields estimate the Weyl cost. The separate Bach bound above uses the fourth-order input of the smooth construction. [NECK-E07, choice of margins][e07margins]

## Verification and versions

`lake env lean FirstOrderTwistor/CapSplice.lean` and `lake build FirstOrderTwistor.CapSplice` passed from `formalization/`, the latter with 2,573 jobs. A direct `lake env lean --stdin` import checked the types and axioms of all five public declarations. Lean reported only `propext`, `Classical.choice` and `Quot.sound`. Input versions and SHA-256 digests agree with the E26a return. [Pinned sources and toolchain](CAP_RETURN.md#verification-and-versions)

[e01weyl]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md#weyl-cost
[e01bach]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md#bach-cost-and-its-gauge
[e07compare]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection
[e07margins]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md#choice-of-margins-and-use
