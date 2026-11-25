# E53c · Ricci growth at the recognition endpoint

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution SP4-MASTER-E53c for DESC-B03. Independent serving model and reasoning effort were unavailable. Base `b5de9758f16e14f22162b4a1e091166ea126c389`, E52 master transitive TeX digest `2867c940507acb77` and E51 descent digest `f50a339b25823e19`. Individual input SHA-256 prefixes are `a1dec14caba7f145f` for `ricci_scales.tex`, `8b5692f2bcab8747` for `complete_limits.tex` and `f58cc485316690a3` for the E51 descent root. The argument uses no Lean results. [Master physical Ricci theorem](../../manuscript/ricci_scales.tex) · [Master whole-limit and quantile scales](../../manuscript/complete_limits.tex) · [Descent manuscript section](../manuscript/endpoint_windows.tex)

## Critical Ricci defect

Keep one closed connected oriented smooth homotopy four-sphere, positive-definite smooth Riemannian metrics, the Hilbert–Schmidt \(W^+\) energy \(e_i\), and the volume-one minimizing Yamabe representatives \(g_i\). Write \(T=4\pi^2\), \(I^+(M)=T\), \(d_i=e_i-T>0\), \(Y_i=R_{g_i}>0\), \(Z_i=\operatorname{Ric}_{g_i}-Y_i g_i/4\). The full four-index Weyl integral is \(8e_i\) by the norm conversion and signature zero. A smooth positive class of energy at most \(T\) would give \(I^+(M)=0\). Under the endpoint hypothesis \(M\) has nonstandard smooth type and \(d_i\to0\).

Hai-Ping Fu, *Four-manifolds with positive Yamabe constant*, Pacific J. Math. **296** (2018), 79–103, defines the full tensor norm at p. 79. Theorem 1.3, p. 83, applies to one smooth closed Riemannian four-manifold with positive conformal Yamabe constant and \(\int |W|_{\rm tens}^2\le Y^2/6\). The strict case of its proof on p. 100 gives \(S^4\), \(\mathbb{RP}^4\), a compact quotient of \(S^3\times\mathbb R\) by a free cocompact discrete isometry group, or their connected sum. The theorem also lists an equality alternative conformal to Fubini–Study \(\mathbb{CP}^2\), which has \(b_2=1\). Connected sums give free products of fundamental groups, and the universal cover of each listed cylinder quotient is the noncompact \(S^3\times\mathbb R\), with nontrivial deck group. Simple connectivity eliminates every factor except \(S^4\). The argument below needs only the strict case, and uses no curvature equation on the sources. Inspected the primary norm definition, Theorem 1.3 and its proof on 25 November 2026. [Published source, pp. 79, 83, 100–101](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf) · [Canonical source record R137](../../../../references/SOURCE_NOTES_SECOND_COLLAR_20261125.md)

It follows that \(8e_i\ge Y_i^2/6\). The physical Gauss–Bonnet identity gives

$$
 A_i^2:=\|Z_i\|_{L^2(g_i)}^2=4e_i+Y_i^2/12-32\pi^2\le8d_i,
 \qquad
 Y_i^2=192\pi^2-48d_i+12A_i^2.
$$

Thus \(Y_i\to8\sqrt3\,\pi=S/\sqrt2\). The \(L^2\) trace-free Ricci measure of **every** physical set tends to zero, with uniform bound \(8d_i\) independent of the set and scale. This supplies both small-ball nonconcentration and equiintegrability at the scale-invariant exponent. It gives no corresponding Weyl estimate, and the scalar part of Ricci is separate.

## Rate obstruction and protected windows

Fix \(2<q<\infty\) and \(\kappa>0\). On a physical set \(U\) let \(N_{i,q}(U)=\sup_{t>0}t\operatorname{Vol}_{g_i}(U\cap\{|Z_i|>t\})^{1/q}\), and set \(\gamma_q=2-4/q\). The quantity \(a^{\gamma_q}N_{i,q}(U)\) is the weak \(L^q\) norm of \(Z\) in the metric \(a^{-2}g_i\). The \(L^2\) norm is invariant under this rescaling. Choose \(p=2+(q-2)/(1+q\kappa)\in(2,q)\), and let \(\alpha/(1-\alpha)=2\kappa\). Then \(1/p=\alpha/2+(1-\alpha)/q\) and \(\gamma_p=(1-\alpha)\gamma_q\).

For a function with \(A=\|f\|_2\), \(B=\|f\|_{q,\infty}\), integrate \(p t^{p-1}\min(A^2t^{-2},B^qt^{-q})\), splitting at \(t_0=(B^q/A^2)^{1/(q-2)}\) when both norms are nonzero. The result is \(\|f\|_p\le C_{p,q}A^\alpha B^{1-\alpha}\). Neither the measure of \(U\) nor a ball upper volume ratio is needed. In particular,

$$
 a^{\gamma_p}\|Z_i\|_{L^p(U,g_i)}\le C_{p,q}
 \bigl(\|Z_i\|_{L^2(U,g_i)}^{2\kappa}a^{\gamma_q}N_{i,q}(U)\bigr)^{1-\alpha}.
$$

- With \(U=M\), \(a=1\), the master Ricci theorem gives smooth same-type positive attainment whenever \(A_i^{2\kappa}N_{i,q}(M)\) is bounded on a subsequence. This contradicts the endpoint, so \(A_i^{2\kappa}N_{i,q}(M)\to\infty\) and \(d_i^\kappa N_{i,q}(M)\to\infty\) for every fixed \(q>2\) and \(\kappa>0\). In particular \(d_i^\kappa\sup_M|\operatorname{Rm}_{g_i}|_{\rm tens}\to\infty\) by unit volume and the curvature contraction bound. A bounded global weak norm at some \(q>2\) by itself would give only a change of exponent from the original global strong hypothesis. Allowing its divergence at an arbitrary fixed power of \(1/d_i\) is the quantitative improvement.
- On shrinking windows \(U=B_{g_i}(x_i,Da_i)\), with \(a_i\to0\), the product on the right suffices if bounded for every fixed \(D\) eventually on the same subsequence. The master theorem gives vanishing full curvature integral on each \(B_{g_i}(x_i,Aa_i)\) with fixed finite \(A\). One sufficient bound replaces the local \(L^2\) power by \(d_i^\kappa\). If a sequence of balls \(B_{g_i}(x_i,Aa_i)\) carries chiral mass bounded below on a subsequence, this protected-window hypothesis fails on every further subsequence. The offending buffer need not be fixed independently of subsequence selection.
- On \(a_i=(d_i^\kappa N_{i,q}(M))^{-1/\gamma_q}\), the latter bound holds at every center. The vanishing is uniform in the centers by choosing violating centers on a subsequence if the supremum failed to vanish. For any fixed \(0<\vartheta\le1/2\), the quantile ball with chiral mass \(\vartheta e_i\) has full curvature mass at least \(4\vartheta e_i\). Consequently \(r_i(\vartheta)/a_i\to\infty\). This scale is larger than the unweighted weak Ricci scale by the factor \(d_i^{-\kappa/\gamma_q}\to\infty\).
- On a fixed physical scale \(a_0>0\), an eventual uniform bound of the product over balls \(B_{g_i}(x,a_0)\) for all centers \(x\) also implies global attainment. The Yamabe lower volume estimate gives a uniformly finite cover by such balls using a maximal \(a_0/2\)-separated net and disjoint \(a_0/4\)-balls, taking \(a_0\le1\). Summing the \(L^p\) integrals gives the global bound. A bound on a single fixed ball supplies only its local chart conclusion.

## Scope of critical estimates

A function test illustrates the gap between critical control and weighted supercritical control. On Euclidean unit balls set \(f_j=e^{2j-\sqrt j}\mathbf 1_{B_{e^{-j}}}\). The \(L^2\) norm is a fixed constant times \(e^{-\sqrt j}\), while the weak \(L^q\) norm is a constant times \(e^{(2-4/q)j-\sqrt j}\). Setting \(d_j=e^{-2\sqrt j}\) gives the same critical decay \(\|f_j\|_2^2=O(d_j)\), yet \(d_j^\kappa\|f_j\|_{q,\infty}\to\infty\) for all fixed \(q>2\), \(\kappa>0\). Smooth radial bumps give the same estimates. This tests the norm implication and imposes no geometric equation.

There is also a geometric coordinate test even on harmonically parametrized Euclidean balls. Take a smooth transition \(u_j(x)=\chi((\log |x|+2j)/j)\), with \(\chi=1\) for arguments at most zero and \(\chi=0\) for arguments at least one, with \(0\le\chi\le1\). Extend by one at the origin. Put \(F_j=|x|^2u_j/2\) and define

$$
 B_j=\mathrm{Id}+\varepsilon\bigl((\Delta F_j)\mathrm{Id}-D^2 F_j\bigr),
 \qquad h_j=(\det B_j)^{1/2}B_j^{-1}.
$$

The uniform bounds on \(D^2F_j\) give uniform ellipticity for a fixed sufficiently small \(\varepsilon>0\). In dimension four \(\sqrt{\det h_j}\,h_j^{-1}=B_j\); its rows have zero divergence, so the standard coordinates are harmonic, including with affine Dirichlet data on the unit sphere. Outside \(B_{e^{-j}}\) the metric is Euclidean. On the core \(B_{e^{-2j}}\) it equals \((1+3\varepsilon)\mathrm{Id}\). On the transition annulus \(D^ku_j=O_k((j|x|^k)^{-1})\) for \(k\ge1\), yielding \(Dh_j=O(\varepsilon/(j|x|))\) and \(D^2h_j=O(\varepsilon/(j|x|^2))\). The log annulus thus gives \(\|Dh_j\|_4^4=O(\varepsilon^4/j^3)\) and \(\|D^2h_j\|_2^2=O(\varepsilon^2/j)\). The coordinate curvature formula and ellipticity imply \(\int|\operatorname{Rm}_{h_j}|^2\to0\). These harmonic metric components converge strongly in \(W^{2,2}\) and \(W^{1,4}\) to the Euclidean components, while their uniform distance is at least \(3\varepsilon\) on every fixed concentric interior ball. In particular the critical embedding step to \(C^0\) fails in these given harmonic charts. This local family has no constant-scalar, global minimizing, or endpoint hypotheses. It does not rule out different markings or a critical compactness theorem using additional geometric structure.

Theorem 3.1 of Deane Yang, *Convergence of Riemannian manifolds with integral bounds on curvature. II*, Ann. Sci. ÉNS **25** (1992), 179–199, retains \(p>n/2\) for Ricci in its harmonic compactness conclusion and separately imposes small full curvature on prescribed balls. The stated estimates therefore give no critical-radius theorem for the endpoint's \(\|Z_i\|_2\to0\). Fu's Theorem 1.4 would instead recognize a smooth metric here if its Weyl tensor were harmonic, \(Y>0\), and \(8e_i<(64/3)\pi^2\chi(M)\), or \(e_i<16\pi^2/3\). The last inequality holds eventually at the endpoint. Exact harmonic Weyl curvature on a source is a separate hypothesis. Constant scalar gives the Cotton identity with the covariant derivative of \(Z_i\), and its small physical \(L^2\) norm alone supplies no exact vanishing of that derivative. [Yang, Theorem 3.1](https://www.numdam.org/item/10.24033/asens.1647.pdf) · [Fu, Theorem 1.4](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf#page=5)

Surviving case. Physical Yamabe minimizers at \(I=T\) can still satisfy global vanishing of critical trace-free Ricci energy while their weighted supercritical norms diverge and no protected-window bound holds at the charged scales. Extracting the requisite whole markings and uniform plus strong first-order convergence from the endpoint data would require further analysis. A result for exact Bach-flat or harmonic-Weyl metrics cannot be applied to a sequence chosen only by its minimizing energies.
