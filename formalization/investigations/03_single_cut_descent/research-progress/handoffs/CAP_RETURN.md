# FOT-E26a · Capped Yamabe localization

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. This execution packet checks the functional inequalities for one supplied cap. [Lean module](../../../../FirstOrderTwistor/CapEstimates.lean) · [Route register](../REGISTER.md) · [Issued scope](ACTIVATION_20261125.md)

## Checked result

On a measure space with measure $\mu$, let $N(u)=\|u\|_{L^4(\mu)}^2$. The `FirstOrderTwistor` declarations below concern real tests and an abstract real form $Q$.

| Declaration | Checked inputs and conclusion |
| --- | --- |
| `capPartitionMass` | For real a.e. strongly measurable $\chi,\xi$ with $\chi^2+\xi^2=1$ a.e. and $u\in L^4$, derive boundedness of the two cutoff multipliers and $N(u)\le N(\chi u)+N(\xi u)$ by $L^2$ Minkowski for the squares. |
| `capCutoffLoss` | For $F\in L^2$ a.e. nonnegative and $u\in L^4$, prove $6\int Fu^2\,d\mu\le 6\|F\|_{L^2}N(u)$ by Hölder. |
| `capFormLowerBoundOfIMS` | If the two local forms bound their nonnegative masses with nonnegative coefficients $s,c$, the total mass is bounded by their sum, and the total form equals their sum minus an error at most $L$ times the total mass, the total form bounds that mass with coefficient $\min(s,c)-L$. |
| `capYamabeInfimumLowerBound` | On a nonempty test set of functions with nonzero $L^4$ class, use the last three results with the supplied IMS identity and $6\|F\|_{L^2}\le L$. The infimum of $Q(u)/N(u)$ is at least $\min(s,c)-L$. |
| `halfCapYamabeMargin`, `capYamabePositiveOfMargin` | For $s\ge y_0>0$, $R>0$, $\varepsilon\le 1/2$ and $L\le \frac12\min(y_0,R/2)$, the coefficient $\min(s,(1-\varepsilon)R)-L$ is at least $\frac12\min(y_0,R/2)>0$. |
| `halfQuotientCapYamabeMargin` | For $\sigma\ge1$, the same cover-normalized loss threshold for $L$ yields $\min(s,(1-\varepsilon)R/\sigma)-L/\sigma\ge \frac12\min(y_0,R/(2\sigma))$. In E07, $\sigma=\sqrt N$ for group order $N$. |

For a smooth closed Riemannian cap, the intended interpretation takes $Q(u)=\int(6|du|^2+R_g u^2)\,dV_g$, real smooth nonzero tests, and $F=|d\chi|^2+|d\xi|^2$. The geometric application supplies that form, the identification of its test infimum with the Yamabe constant, the IMS identity from differentiating the cutoff products, and the quantitative uniform loss bound on the chosen buffer. The partition and Hölder arguments above then apply to its volume measure. Lee–Parker supply the conformal covariance and the sharp round constant $Y_{\rm rd}=8\sqrt6\pi$ in dimension four. [NECK-E01, Yamabe localization][e01yamabe] · [Lee–Parker, (2.7) and Theorems 3.2–3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7)

## Geometric splice hypotheses

| Model on the supplied oriented annulus | Inputs for use in localization and accounting |
| --- | --- |
| Smooth spherical model, NECK-E01 | Product-gauge $C^2$ error $\eta_2$ across the protected strip gives $s=Y_0$, $c=(1-C_Y\eta_2)Y_{\rm rd}$ and $L=C_I\ell^{-3/2}$. The fixed smooth cap is conformally flat. The two unit splices have total added chiral Hilbert–Schmidt Weyl energy at most $C_W\eta_2^2$ summed over sides and chiralities. [NECK-E01][e01] |
| First-order model, NECK-E07 | On a fixed Euclidean annulus cover use $a=\|v\|_\infty\le1/4$ and $d=\|Dv\|_{L^4}$ for $m=\delta+v$, with $a+d\le1$ and $C_\ell(a+d)\le1/2$. The form comparison uses scalar-density integration by parts and gives $c=(1-C_\ell(a+d))Y_{\rm rd}/\sqrt N$, with $s=Y_0$ and $L=C_I\ell^{-3/2}/\sqrt N$. The Weyl estimate additionally uses the downstairs physical $K=\|\mathrm{Rm}_{m}\|_{L^2}$ on the union of splices in the selected gauge. Its net bound is $2\sqrt q\,\Delta+\Delta^2$ with $q$ the incoming positive-chiral splice energy and $\Delta=C_W(aK+N^{-1/2}(d^2+d+a))$. The total absolute positive-chiral addition to unchanged regions is bounded by $(\sqrt q+\Delta)^2$. The rotational quotient filling is smooth when $N=1$ and orbifold when $N>1$. Applying the smooth descent route to a quotient candidate requires a separate trivial-link test. [NECK-E07][e07] · [NECK-E08][e08] |
| Additional Bach estimate, NECK-E01 | A separate normalized central-splice $C^4$ bound $\eta_4\le1$ gives total additional $\int|B|\,dV$ at most $C_B\eta_4$. For the covariant Bach tensor, $B_{f^2g}=f^{-2}B_g$ and $|B|\,dV$ is conformally invariant in dimension four. The fourth-order metric-jet estimate uses $\eta_4$, and a vanishing total Bach norm along capped metrics requires the incoming norm and the splice allowance to tend to zero. The E07 first-order controls and the physical curvature budget supply the form and Weyl estimates above. [NECK-E01, Bach cost][e01bach] · [Bahuaud–Guenther–Isenberg–Mazzeo, arXiv:2508.06633v1, §1 and (1.1)](https://arxiv.org/html/2508.06633v1#S1) |

In E01, fix the finite buffer length first so $L\le\frac12\min(y_0,Y_{\rm rd}/2)$, then require $C_Y\eta_2\le1/2$. In E07 the same buffer choice uses the unscaled loss, and $C_\ell(a+d)$ is tested with that fixed $\ell$. The checks consume these supplied inequalities. They leave construction of the oriented annulus, the smooth cap and the two local form comparisons to the geometric argument. The scalar Yamabe estimate is independent of chirality. The chiral costs use the inherited orientation and the real block Hilbert–Schmidt norm.

## Verification and versions

From `formalization/`, `lake env lean FirstOrderTwistor/CapEstimates.lean` and `lake build FirstOrderTwistor.CapEstimates` passed, the latter with 2,573 jobs. A separate `lake env lean --stdin` imported `FirstOrderTwistor.CapEstimates` and ran `#check` and `#print axioms` for the seven declarations above. Lean reported `propext`, `Classical.choice` and `Quot.sound` for each. The shared public-import check belongs to integration.

The packet used the contents pinned at `7db310a2a9219c537b440d7c2fb39e602a32b729`. E01 and E07 matched that tree with SHA-256 digests `58969f8b827d048772318453cf33631a71d55dfc00adc2711a9412ba6d43cd1f` and `350b86f03790daa347b2ee8d9ab6a75f2a4d58beed735a77b72608a984696257`, respectively. Lean is `4.35.0-rc3` and Mathlib is `c55e6e786f49471c72fbddbec5415808896aec1e`. [Route overview and pins](../../research-overview/OVERVIEW.md#inputs-at-setup)

[e01]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md
[e01yamabe]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md#yamabe-localization-on-each-side
[e01bach]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md#bach-cost-and-its-gauge
[e07]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md
[e08]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E08_QUOTIENT_LINK_TEST_20261125.md
