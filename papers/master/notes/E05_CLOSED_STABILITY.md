# E05 · Two chiral bounds for a closed Einstein minimizer

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution for [SP4-MASTER-E05](../research-progress/handoffs/E05_CLOSED_STABILITY.md). Requested GPT-6.2 Sol/ultra. Actual serving settings were unavailable. The committed inputs were checked at fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2. The four master working sources matched the handoff's SHA-256 prefixes a499b313e6d5, 3f3722b56d34, f93717b0b73c, and 8ff80d4d42e5. The argument uses the owning manuscript's exact compactness alternative and marked ALE end identities. It concerns smooth closed attainment.

## Result

Let $M$ be a connected, closed, oriented smooth homotopy four-sphere and $g$ a smooth positive Einstein Riemannian metric. For $W^\pm$ acting on $\Lambda^\pm$, use the Hilbert–Schmidt norm and write

$$
e=E_+(g)=E_-(g),\qquad T=4\pi^2,\qquad Y=Y([g]).
$$

If $e>0$, let $x_\pm\le y_\pm\le z_\pm$ be the ordered eigenvalues of $W^\pm$, and let $D_\pm=\int_M(x_\pm-y_\pm)^2\,dV_g$. Then

$$
e>\frac{16\pi^2}{3}+\frac{1}{6}\max(D_+,D_-).
\tag{1}
$$

There is also a universal $\eta_E>0$, independent of the smooth homotopy-sphere type, such that any such metric with $0<e<2T$ satisfies

$$
e\ge\frac{16\pi^2}{3}+\eta_E.
\tag{2}
$$

The proof of (2) is non-effective. Both estimates apply to a smooth attained $I^+(M)$ whose conformal class contains a positive Einstein metric, independently of variational stability.

## Chiral inequalities and the endpoint

Positive Einstein metrics are Yamabe representatives by Obata's theorem. In our convention Chern–Gauss–Bonnet and signature give, with $V=\operatorname{Vol}(M,g)$ and scalar curvature $R>0$,

$$
Y=R\sqrt V,\qquad 16\pi^2=2e+\frac{Y^2}{24}.
\tag{3}
$$

The contracted Bianchi identity gives $\delta W^\pm=0$ because the Hodge star is parallel. On a homotopy sphere with $e>0$ both blocks are nonzero. Apply the strict estimate $Y^2<36\int z^2\,dV_g$ from the owning strict half-harmonic theorem first in the stated orientation and then with the opposite orientation. For either block, the trace-free identity $x+y=-z$ gives

$$
|W^\pm|_{\mathrm{HS}}^2=\frac32 z_\pm^2+\frac12(x_\pm-y_\pm)^2,
\qquad
36\int_M z_\pm^2\,dV_g=24e-12D_\pm.
$$

Thus $Y^2<24e-12\max(D_+,D_-)$. Substitution of (3) gives (1). The maximum appears because both inequalities bound the same $Y^2$. Simply adding the two bounds $E_\pm\ge Y^2/24$ recovers only $e\ge16\pi^2/3$ on a homotopy sphere. The correction in (1) measures how far apart the lower two eigenvalues are. [Owning strict half-harmonic estimate and Einstein Yamabe identity](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L876) · [Akutagawa–Endo–Seshadri, §2 and Remark 3.3(1)](https://arxiv.org/html/1801.10305v2) · [Gursky–McKeown–Tyrrell, §3, (3.7) and Corollary 3.4](https://doi.org/10.1017/S1474748025101060)

For the equality check, allow a smooth closed connected oriented positive Einstein four-manifold of signature zero with $e>0$. Equality $e=Y^2/24$ in either chiral estimate forces $w=|W^\pm|_{\mathrm{HS}}$ to be a positive constant. The modified Yamabe test with $w^{1/3}$ gives equality in Hölder only if $w$ is proportional to $w^{2/3}$, and continuity and connectedness then give the claim. At $R=2\sqrt6\,w$, the half-harmonic Weitzenböck formula and the sharp trace-free determinant bound force $\nabla W^\pm=0$ and eigenvalues $(-R/12,-R/12,R/6)$. Since $E_+=E_-$, equality holds in both estimates.

On the universal cover the two parallel simple eigenlines give parallel unit eigenforms. Scaling them to norm $\sqrt2$ gives commuting complex structures of opposite chirality. Their product is a parallel symmetric involution with two rank-two eigendistributions. The de Rham decomposition and the positive Einstein equation make the universal cover the product of two equally curved round two-spheres. Conversely, the product with each factor of sectional curvature $k>0$ has $R=4k$, chiral eigenvalues $(-k/3,-k/3,2k/3)$, and $V=16\pi^2/k^2$, so $E_+=E_-=32\pi^2/3=Y^2/24$. The same equality descends to any closed smooth oriented isometric quotient, since the Weyl integrals and $R^2V$ scale by the same factor. On a simply connected homotopy sphere, even one parallel simple eigenline gives a global nonzero parallel two-form, contradicting $b_2=0$. The product verifies the endpoint constants and attains the chiral bound in the larger class of positive Einstein manifolds of signature zero. [Fu, Proposition E and Theorem 1.1, in the full four-index norm](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf)

## Uniform gap in the homotopy-sphere class

Fix $\delta>0$. For a sequence of positive Einstein metrics $g_i$ on oriented smooth homotopy four-spheres $M_i$ with $T\le e_i\le2T-\delta$, normalize each to volume one. Both $E_\pm$ are scale invariant. By (3), $R_i=Y_i\ge\sqrt{48\delta}$ and $R_i\le8\sqrt6\,\pi$ by the round Yamabe bound. Einstein metrics are exactly Bach-flat, so the owning exact compactness alternative applies. Its hypotheses allow $M_i$ to vary. It yields either smooth closed convergence via oriented diffeomorphisms or a nonflat complete smooth blow-up $h$ at scales $\lambda_i\downarrow0$, with oriented embeddings of whole compact truncations and ALE end decay. [Owning band hypotheses](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L119) · [Owning exact compactness alternative](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L719)

In the blow-up alternative, $\operatorname{Ric}(\lambda_i^{-2}g_i)=(\lambda_i^2R_i/4)(\lambda_i^{-2}g_i)$, so $h$ is Ricci-flat. The end part of the owning same-type descent theorem forces one end with trivial group and yields

$$
E_+(h)=E_-(h),\qquad \int_X|\operatorname{Ric}_h|^2\,dV_h=4E_+(h).
$$

Each limiting Weyl block has budget at most $2T-\delta$. For a $Q_8$ end the signed difference would have magnitude $9\pi^2$, exceeding either budget. The multiple-end estimate and the spin obstruction to the binary icosahedral link are part of the owning end argument. With a trivial link the boundary Euler and signature formulas give the displayed identities. Ricci-flatness then forces $W_h^+=W_h^-=0$ and hence flatness, contradicting the blow-up selection. The end and curvature identities occur before the quantitative same-type descent in the owning proof. [Owning ALE end proof](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L554) · [Canonical APS, end and spin source record](../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md)

Consequently the normalized positive Einstein metrics in every such fixed band are sequentially compact up to oriented diffeomorphism, allowing variable $M_i$. Smooth convergence preserves the positive Einstein equation and the chiral integrals. If (2) failed, there would be a sequence with $e_i\to16\pi^2/3$ from above by (1). Its tail lies in the fixed band with $\delta=T/3$. Smooth compactness gives a positive Einstein metric on a smooth homotopy sphere with $e=16\pi^2/3>0$. This contradicts (1), proving (2). Equivalently one may choose $0<\eta_E<2T/3$ so all these nonround candidates have $Y\le\sqrt{128\pi^2-48\eta_E}$. The argument follows the compactness step of Akutagawa–Endo–Seshadri's gap proof on the standard $S^4$. Here the marked ALE end obstruction gives compactness in the subcritical band across all smooth homotopy spheres. [Akutagawa–Endo–Seshadri, Proposition 1.4, Theorem 1.2, and their proofs, arXiv v2](https://arxiv.org/html/1801.10305v2)

## Verification and remaining cases

- The product check uses the curvature-operator eigenvalues $k,0,0$ on each block before subtracting $R/12=k/3$. It agrees with Chern–Gauss–Bonnet at $\chi(S^2\times S^2)=4$. On the homotopy sphere the equal-energy identity uses $\tau=0$, which holds in either orientation.
- The algebra check is $48(8\pi^2-e)<24e-12\max D_\pm$, or $72e>384\pi^2+12\max D_\pm$. A sequence approaching the endpoint has a uniform margin below $2T=8\pi^2$, as required for the ALE analysis.
- For an Einstein candidate, (1) and (2) leave the upper part of the subcritical band with no descent conclusion. For an attained class without an Einstein representative the Cotton and smooth extension hypotheses for the owning harmonic-scale reduction still have to be proved. The ordinary orientation double of an oriented homotopy sphere is the disjoint union of two copies, each with $b_2=0$. [Owning closed critical alternatives](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L642)
