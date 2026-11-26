# E63d · Rescalings in the modified Ricci concentration regime

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Bounded MASTER-E63d v1 under DESC B03/B04. Requested GPT-6.2 Sol at ultra effort. Actual serving telemetry is unavailable. Input descent source bundle `1dcb565392f85fb3` belongs to the [E62 assessment](../../research-progress/handoffs/E59_E62_SPECTRAL_WINDOWS_20261125.md), SHA-256 prefix `e2101647a907e16b`. The quantitative end accounting follows the physical-gauge [SEC-E50 analysis](../../../investigations-1/03_first_order_twistor/01_sections_and_connections/notes/SEC_E50_20261124.md) and is applied here to the actual modified gauge. The derivation below concerns a fixed strict band and the small spectral deficit regime.

## Conclusions and scope

Let the smooth closed oriented homotopy four-spheres \(M_i\) be nonstandard, possibly varying, and let \(g_i\) be volume-one positive Yamabe metrics. Take \(T=4\pi^2\), common chiral energies \(e_i=E_+(g_i)=E_-(g_i)\le2T-\delta\) for a fixed \(\delta>0\), and scalar curvature \(Y_i\). Let \(L\) be the larger of the top eigenvalues of the two real Weyl blocks and assume

\[
\Delta_i=36\int L_{g_i}^2dV_{g_i}-Y_i^2\longrightarrow0.
\]

Let \(q_i\) be the volume-one modified Yamabe representatives of the E62 proof. Every complete, smooth oriented limit supplied by smooth marked embeddings on a compact exhaustion of \(a_i^{-2}q_i\), with \(a_i\to0\) and convergence locally uniformly and strongly in \(W^{1,4}\), is Euclidean. The full curvature integrals then vanish on fixed compacts. The same conclusions hold for the complete marked harmonic limit extracted when full curvature is uniformly bounded on each fixed enlarged rescaled ball. In particular, if \(K_i=\max_{M_i}|\mathrm{Rm}_{q_i}|_{\mathrm{tens}}\), then \(K_i\to\infty\), and for every fixed \(A<\infty\)

\[
\sup_{x\in M_i}\int_{B_{q_i}(x,A/\sqrt{K_i})}
 |\mathrm{Rm}_{q_i}|_{\mathrm{tens}}^2dV_{q_i}\longrightarrow0. \tag{1}
\]

The norms use the full ordered four-index Riemann tensor and the usual symmetric two-tensor norm for Ricci. In particular (1) bounds twice the trace-free Ricci squared integral in that normalization. The conclusions use neither variational minimizing assumptions nor a small Bach error on the sources. They leave possible Ricci concentrations lacking bounded-curvature protected windows. Scalar and Weyl mass in this test refers to the auxiliary metric and the invariant chiral measures. The Ricci defect is specific to the auxiliary metric.

## What passes to the marked rescaling

After taking a subsequence write \(e_i\to e\), \(Y_i\to y\in[\sqrt{48\delta},8\sqrt6\pi]\), and \(S=8\sqrt6\pi\). On the nonstandard types the modified equation and ordinary Yamabe inequality give

\[
 R_{q_i}-6L_{q_i}=c_i\le0,\qquad
 Y_i\le c_i+6\int L_{q_i}dV_{q_i}\le c_i+6\|L_{q_i}\|_{2,q_i}.
\]

The spectral deficit implies \(c_i\to0\), \(L_{q_i}\to y/6\) and \(R_{q_i}\to y\) strongly in the indicated auxiliary \(L^2\) norms. Thus the Weyl and scalar squared integrals are uniformly integrable, since \(|W^\pm|_{\mathrm{HS}}^2\le6L^2\) pointwise. For example on any measurable \(U_i\),

\[
 \int_{U_i}L_{q_i}^2dV_{q_i}
 \le 2\|L_{q_i}-y/6\|_{2,q_i}^2+2(y/6)^2\operatorname{Vol}_{q_i}(U_i).
\]

Gauss–Bonnet in dimension four and signature give, with \(Z=\operatorname{Ric}^0\),

\[
 \int |Z_{q_i}|^2dV_{q_i}\longrightarrow D_\infty:=4e+y^2/12-8T . \tag{2}
\]

Uniform inhomogeneous Sobolev follows exactly as in E62 from \(R_{q_i}-Y_i\to0\) in \(L^2\), with a positive lower bound for \(Y_i\). The modified representatives have positive \(C^{2,\alpha}\) conformal factors. For smooth geometric compactness one may approximate each factor in \(C^2\) and restore volume one, with pointwise errors in curvature norms and a relative metric error tending to zero separately at each index. This preserves the displayed estimates, the asymptotic full-curvature and Ricci tail statements, and all chiral measures. For the integrals of the squared pointwise curvature norms, the errors can also be chosen \(o(1)\) in total variation by continuity on the individual compact source. Distances are uniformly bilipschitz close with relative error tending to zero. In what follows the same estimates apply to these smooth representatives. [E62 derivation and uniform-integrability version](../reviews/E62_ISOTROPIC_FLOW.md) · [Chen–Zhu, Lemma 2.1, Theorem 1.7 and proof of Theorem 1.4](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

Suppose \(a_i\to0\) and let \(h\) be a complete marked limit. For each fixed compact \(K\) in \(X\), its image in the unrescaled \(q_i\) has volume \(O_K(a_i^4)\). Scalar and Weyl energy integrals are invariant under constant scale in four dimensions. They therefore tend to zero on these images. Uniform and strong \(W^{1,4}\) convergence gives distributional convergence of curvature: products of the first derivatives converge in \(L^2\), and the second-derivative terms pass by integration by parts. The bounded full curvature integrals then yield weak \(L^2\) curvature convergence, so \(R_h=0\) and \(W_h^+=W_h^-=0\). In the harmonic limit one also has weak \(W^{2,p}_{\rm loc}\) convergence. Passing (2) and the total curvature budget to fixed compacts and then exhausting gives

\[
 d_X:=\int_X|\operatorname{Ric}_h|^2dV_h\le D_\infty,
 \qquad \int_X|\mathrm{Rm}_h|_{\mathrm{tens}}^2dV_h=2d_X<\infty.
\]

For a compactly supported smooth test function, transport the ordinary Yamabe inequality. The scalar term tends to zero by the just-proved compact scalar \(L^2\) bound and Hölder. Taking the limit gives \(y\|f\|_4^2\le6\|df\|_2^2\). It excludes a compact connected limit by testing with a constant. Cutoffs and dyadic iteration yield \(\operatorname{Vol}_h B_s(x)\ge c(y)s^4\) for all \(s>0\). No Ricci lower bound in \(q_i\) is inferred from the different positive-Ricci comparison metrics.

## End cost closes the smooth alternative

The smooth limit is scalar-flat locally conformally flat. Thus its curvature is harmonic by Bianchi and its Ricci tensor satisfies the critical equation \(\Delta_h\operatorname{Ric}_h=\mathrm{Rm}_h*\operatorname{Ric}_h\). The interior critical-metric estimate on a ball of radius \(r/2\) centered at distance \(r\) bounds \(r^2|\mathrm{Rm}_h|\) at the center by the square root of the curvature energy beyond radius \(r/2\). This goes to zero. With the homogeneous Sobolev inequality and finite \(\int|\operatorname{Ric}_-|^2\), Tian–Viaclovsky give finitely many ALE ends of order zero. Their Theorem 5.1 upgrades the scalar-flat harmonic-curvature case to positive differentiated order, using the already obtained finite topology and volume lower bound. Use orders through two derivatives on the lifted end. [Tian–Viaclovsky, arXiv:math/0612491v1, Theorems 1.1, 1.2 and 5.1](https://arxiv.org/pdf/math/0612491)

Write \(k\ge1\) for the number of ends, \(m_j=|\Gamma_j|\ge1\) for their spherical link orders, and \(m=\max_j m_j\). A whole compact truncation embeds in one actual source. Its rational homology satisfies \(H_1=H_2=0\) by Mayer–Vietoris, since each face is a rational homology sphere and the ambient manifold is a homology sphere. Poincaré–Lefschetz duality and the relative fundamental class give \(b_3=k-1\). Thus \(\chi(X)=2-k\). In the ALE Gauss–Bonnet formula each end contributes \(8\pi^2/m_j\) to the Euler integral. With zero scalar and Weyl it gives the exact cost

\[
 -\tfrac12d_X=8\pi^2\left(2-k-\sum_{j=1}^k m_j^{-1}\right),\qquad
 d_X=4T\left(k-2+\sum_{j=1}^k m_j^{-1}\right). \tag{3}
\]

For each ALE end, take radial annular cutoffs of the Euclidean sharp Yamabe test and then scale their supports out along that end. This keeps them on the quotient, where the ratio \(6\|df\|_2^2/\|f\|_4^2\) scales by \(m_j^{-1/2}\) because both integrals are on an \(m_j\)-fold quotient. At fixed annular cutoffs the metric error goes to zero as the dilate escapes. Then remove the inner and outer cutoffs on the Euclidean test. Thus \(y^2\le S^2/m\). Combining with (2) and (3) gives the necessary bound

\[
\delta+T\left(k-2+\sum_j m_j^{-1}\right)\le\frac{2T}{m}. \tag{4}
\]

For \(k\ge2\), the left side is at least \(\delta+T(k-2)+kT/m>2T/m\). Hence \(k=1\). Equation (3) and \(d_X\ge0\) then force \(m_1=1\) and \(d_X=0\). The entire metric is flat. With its one asymptotically Euclidean end, its asymptotic volume ratio is one, so Bishop–Gromov rigidity makes it Euclidean. This last step needs no list of groups of embedded space forms, signature or spin correction, conformal compactification, or mass theorem. The two-ended Euclidean-link cost would be exactly \(32\pi^2\), the value at the Schwarzschild calibration and above the strict band budget, which is at most \(32\pi^2-4\delta\) before a quotient-end improvement. [Tian–Viaclovsky, arXiv:math/0310302v3, Section 7, (7.2) and (7.4)](https://arxiv.org/pdf/math/0310302) · [SEC-E50 end budget and Schwarzschild check](../../../investigations-1/03_first_order_twistor/01_sections_and_connections/notes/SEC_E50_20261124.md)

## Bounded-curvature windows preserve squared Ricci charge

Suppose a rescaling at \((x_i,a_i)\) has \(|\mathrm{Rm}_{a_i^{-2}q_i}|\) uniformly bounded on every ball of a fixed radius \(A\) about \(x_i\), with the bound allowed to depend on \(A\). The scaled Sobolev inequality has the original bounded gradient coefficient and an \(O(a_i^2)\) zero-order coefficient. Its cutoff iteration yields noncollapse on balls of fixed radii at most one. Buffered sectional control and noncollapse give injectivity radius bounds, then harmonic compactness on successive smaller windows. This yields complete pointed convergence, with smooth whole-domain marks, in \(C^{1,\beta}_{\rm loc}\) and weak \(W^{2,p}_{\rm loc}\) for any chosen finite \(p>4\). The metric Ricci equation in harmonic charts gives the needed interior \(W^{2,p}\) bound after the preliminary harmonic radius bound on first derivatives. Image coverage of each smaller ball follows from the buffer in the complete-limit embeddings. These compactness steps are the bounded-curvature harmonic extraction of the owning complete physical-limit corollary, using here the scaled auxiliary Sobolev inequality in place of the physical scalar identity. [Complete-limit extraction](../../manuscript/complete_limits.tex) · [Cheeger–Gromov–Taylor, Theorem 4.7](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/536.pdf#page=33) · [Anderson–Cheeger, Theorem 0.3](https://doi.org/10.4310/jdg/1214448075) · [Belegradek–Kapovitch, Theorem 3.1 and proof](https://arxiv.org/pdf/math/0002028)

The inherited full curvature bound passes weakly to the limit. Since \(R_h=W_h=0\), Lemma 5.1 gives the local distributional equation \(\Delta_h\operatorname{Ric}_h=\mathrm{Rm}_h*\operatorname{Ric}_h\) with bounded right side. The local tensor elliptic estimate adds two derivatives to \(\operatorname{Ric}_h\) in finite \(L^p\). In harmonic coordinates the Ricci equation then improves the metric, and iteration makes the same limit smooth. This is the local elliptic step in the complete-limit proof and needs no source Bach control. The smoothings of the approximating chart transitions used there supply smooth exhaustion embeddings in the resulting limit structure. [Avalos–Cogo–Royo Abrego, Lemma 5.1 (5.2) and local form of Theorem 2.2(ii)](https://arxiv.org/html/2610.35257v1)

To see that trace-free Ricci energy passes to either limit on compact tests, put the oriented Levi-Civita connections on a common Euclidean tangent bundle by metric square roots. Let \(\Theta_i\) be their difference. It tends to zero in \(L^4\) on fixed compacts by the uniform and strong \(W^{1,4}\) metric convergence. For the affine connection path the curvature forms are

\[
 \Omega_{i,t}=(1-t)\Omega+t\Omega_i-t(1-t)\Theta_i\wedge\Theta_i .
\]

They are bounded in \(L^2\) there. The difference of normalized Euler forms is the exterior derivative of twice the integral of the polarized Pfaffian of \((\Theta_i,\Omega_{i,t})\), with its common normalization. This follows by differentiating the Pfaffian along the path and using covariant Bianchi. By Hölder the transgression tends to zero in \(L^{4/3}\). Against a fixed compact smooth cutoff the Euler densities therefore converge. Since the chiral Weyl and scalar contributions to those densities already tend to zero in \(L^1\), the Euler identity with coefficient \(-1/2\) on \(|Z|^2dV\) yields convergence of the squared-Ricci integrals with that cutoff. The Euclidean conclusion from (4) makes the integrals vanish. In particular every fixed compact interior ball has vanishing full curvature integral, by the decomposition \(|\mathrm{Rm}|_{\mathrm{tens}}^2=4(|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2)+2|Z|^2+R^2/6\). Whole marked larger windows capture the actual smaller source balls in the bounded-curvature extraction.

If \(K_i\) remained bounded on a subsequence, E62's tail-only recognition theorem would contradict the nonstandard smooth types. Hence \(K_i\to\infty\). At \(a_i=K_i^{-1/2}\) the rescaled curvature is bounded globally, so the preceding argument applies for any centers. If (1) failed, pick a violating center on a subsequence, then apply whole-window compactness with a fixed buffer. This proves (1). The smooth approximations transfer (1) to \(q_i\) using the pointwise norm and relative distance errors specified above. A nonzero normalized maximum at a point does not pass through the available convergence.

More generally, if a fixed positive modified Ricci charge is found on balls of radii \(r_i\to0\), then \(r_i\sqrt{K_i}\to\infty\). Along any such charged subsequence there is a finite \(A\) and a further subsequence for which \(r_i^2\sup_{B_{q_i}(x_i,Ar_i)}|\mathrm{Rm}_{q_i}|\to\infty\). Bounds on all fixed enlarged radii would give a Euclidean comparison, contradicting the charge. E62's losing-volume sets may still consist of many small pieces or have curvature concentrated at scales for which these protected bounds fail. Locating a charged ball from those sets, establishing uniform integrability, and obtaining a signed cut remain open.
