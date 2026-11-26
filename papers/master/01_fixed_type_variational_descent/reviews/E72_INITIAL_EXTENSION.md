# E72r v1 · Obstruction to a smooth complete initial extension

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent bounded audit of the proposed initial-trace argument at working baseline `5706ef811adc3691fd85e75507a0a399cb81d18d`. Actual serving model and reasoning effort are unavailable. The E71r review and inherited modified Ricci section had SHA-256 prefixes `f903a7f2655b4847` and `8cf098e31a6c4038`. [E71 charged-flow proof check](E71_CHARGED_FLOW.md) · [E63 shrinking-limit and end calculation](../manuscript/ricci_concentration.tex)

**Assessment.** The E71 positive-time pointed flow obtained under the added modified-metric upper volume ratios cannot extend to a smooth complete metric at time zero on its underlying manifold. The comparison uses tests transported by smooth positive-time embeddings. The trace identities impose the zero-time scalar, Euler and sharp homogeneous Yamabe data needed by the E63 end argument.

## Tests on the original source flows

Use the fixed strict band $e_i\le2T-\delta$ with $\delta>0$, $T=4\pi^2$, modified scalar and Weyl integrability estimates, and the rescaled E71 flows with $k_i(0)=a_i^{-2}h_i$, with $a_i\to0$. Pass to a subsequence with $Y_i\to y>0$ and $e_i\to e$. The initial total trace-free Ricci budget survives the smoothing and scaling:
\[
 \int |Z_{k_i(0)}|^2dV_{k_i(0)}
 \longrightarrow D:=4e+y^2/12-8T\le y^2/12-4\delta .
\]
The initial unit ball about $x_i$ has squared full curvature $\epsilon^2$. E71 gives $\sup_t\|\operatorname{Rm}\|_2\le C$, $\int_0^{t_*}\|\nabla\operatorname{Rm}\|_2^2\,dt\le C$, and weak nonnegative isotropic curvature on the positive-time pointed limit $(X,h(t),x)$.

Fix one common comparison time $\tau_0\in(0,t_*)$. For a smooth compactly supported function on $X$, push it forward using the smooth pointed convergence embeddings and extend it by zero. Its support is well inside the embedding domain for late indices. Denote the result by $f_i$ or $\chi_i$. The transport uses the same time-independent spatial embeddings on positive-time windows, so their integrals converge to the corresponding limit integrals at each fixed positive time. The support lies in a fixed-radius ball for $k_i(\tau_0)$. The shrinking-balls inclusion puts it in a fixed initial rescaled ball. Its volume is uniformly bounded on $[0,\tau_0]$ by the initial upper volume ratios and $dV_{k_i(s)}\le e^s dV_{k_i(0)}$. In original unrescaled units that initial ball has volume $O(a_i^4)$. Scale invariance of squared curvature integrals gives vanishing initial local scalar and Weyl $L^2$ norms on the support. The uniform rescaled volume bound also gives vanishing initial local scalar $L^1$ norm there.

The terminal supremum of $|df_i|_{\tau_0}$ is bounded by smooth convergence, and the E71 Ricci estimate gives $\|df_i\|_{\infty,s}\le C_f s^{-b}$ for $0<s\le\tau_0$, with $b<1/2$. The same applies to $d\chi_i$. For a test detecting the initial charge, choose $\chi\in C_c^\infty(X)$ with values in $[0,1]$, equal to one on a buffered positive-time ball about $x$ whose realized interior contains the original charged unit ball. E71 places that original ball within a fixed terminal radius. A strict buffer in the limit ball and the smooth embeddings ensure that the corresponding $\chi_i$ equal one on it at late indices. [E71 cutoff localization and distance bounds](E71_CHARGED_FLOW.md#a-fixed-terminal-cutoff-retains-the-euler-charge)

## Scalar, Yamabe and Euler traces

The scalar density evolves by $\partial_s(R\,dV)=(\Delta R+2|\operatorname{Ric}|^2-R^2)dV$. Testing against the fixed $\chi_i$ and integrating by parts once gives
\[
 \left|\int\chi_iR(t)dV_t-\int\chi_iR(0)dV_0\right|
 \le C_\chi\left(t+\int_0^t s^{-b}\|\nabla\operatorname{Rm}\|_{2,s}\,ds\right)
 \le C_\chi(t+t^{1/2-b}).
\]
For the diffusion term use the bounded volume of the support to get the gradient cutoff bound in $L^2$; curvature energy bounds the reaction term. The initial pairing vanishes in the limit. Passing to the positive-time limit and then sending $t\downarrow0$ gives the zero scalar density trace on every compactly supported smooth test. If $h(t)$ extends smoothly to $h_0$ at time zero, then $R_{h_0}=0$. The inequality $F_\pm\ge0$ is closed under this smooth limit, so $\lambda_{\max}(W^\pm_{h_0})\le0$. Since each block is trace-free, both vanish. The scalar transfer suffices for this inference.

The sharp ordinary Yamabe inequality in the initial conformal class is
\[
 Y_i\|f_i\|_{4,0}^2
 \le 6\int |df_i|_{0}^2\,dV_0
    +\int R(0) f_i^2\,dV_0 .
\]
The initial scalar term vanishes for fixed compact tests. Curvature $L^2$ and the bounded support volume control $\int_{\operatorname{supp} f_i}|R(s)|\,dV_s$ and the analogous Ricci integral. Hence the variation of $\int f_i^4\,dV_s$ between zero and $t$ is $O_f(t)$. For the gradient term,
\[
 \frac{d}{ds}\int |df_i|_s^2\,dV_s
   =\int\bigl(2\operatorname{Ric}(\nabla f_i,\nabla f_i)-R|df_i|_s^2\bigr)\,dV_s .
\]
Its absolute value is at most $C_f s^{-2b}$, which is integrable at zero. Thus the variation is $O_f(t^{1-2b})$. The square root converting the fourth-power integral to the squared $L^4$ norm is continuous, including at zero. Passing to the positive-time limit and then to a smooth time-zero extension yields $y\|f\|_{4,h_0}^2\le6\|df\|_{2,h_0}^2$ for every compact smooth test.

Write $\mathcal E$ for the Euler form multiplied by $8\pi^2$. E71 Chern–Weil transport for the fixed test from $\tau_0$ gives
\[
 \left|\int\chi_i\mathcal E(t)-\int\chi_i\mathcal E(0)\right|
 \le C_\chi \int_0^t s^{-b}\|\nabla\operatorname{Ric}\|_{2,s}\|\operatorname{Rm}\|_{2,s}\,ds
 \le C_\chi t^{1/2-b}.
\]
For $0\le\chi\le1$ the initial local scalar and Weyl contributions vanish and the initial Ricci term lies between $-D/2-o(1)$ and zero. The charge cutoff has the sharper upper bound $-\epsilon^2/4+o(1)$, since it contains the initial unit ball and $\mathcal E=(2\sum_\pm|W^\pm|_{\rm HS}^2+R^2/12-|\operatorname{Rm}|_{\rm tens}^2/4)dV$. As $t\downarrow0$, the comparison of any two positive times to the same source initial pairings gives a Cauchy estimate for each compact test. The resulting trace is a nonpositive Radon measure of total variation at most $D/2$, and it is nonzero by the charge cutoff. A smooth time-zero extension identifies it with $\mathcal E(h_0)=-|\operatorname{Ric}_{h_0}|^2dV_{h_0}/2$. Therefore
\[
 0<d_X:=\int_X|\operatorname{Ric}_{h_0}|^2dV_{h_0}\le D<y^2/12.
\]
This deduction also shows why the comparison needs a fixed signed cutoff and the local initial Weyl and scalar control. [E71 Euler pairing](E71_CHARGED_FLOW.md#a-fixed-terminal-cutoff-retains-the-euler-charge)

## The complete smooth extension would violate the end formula

The scalar-flat conformally flat $h_0$ has harmonic curvature by the Bianchi and Cotton identities. Its full tensor curvature square integral equals $2d_X$. If complete, it is a noncompact smooth Riemannian four-manifold of finite curvature energy and finite homogeneous Sobolev constant, so Tian–Viaclovsky's harmonic-curvature case gives finitely many ALE ends of any order below two. I rechecked the published Theorem 5.1, which allows the finite homogeneous Sobolev constant in place of the paired lower volume and finite first Betti assumptions. [Tian–Viaclovsky, *Comment. Math. Helv.* 83 (2008), §5, Theorem 5.1](https://ems.press/content/serial-article-files/43177?nt=1#page=20)

Write $k$ for the number of ends and $m_j$ for the order of the $j$th spherical link group. A whole connected compact ALE truncation with rational-homology-sphere boundary embeds into an actual source homotopy sphere through the positive-time comparison. Mayer–Vietoris gives $b_1=b_2=0$ on the truncation. The relative fundamental class has boundary the sum of the $k$ link classes, and Poincaré–Lefschetz duality gives $H_3(K,\partial K;\mathbb Q)=H^1(K;\mathbb Q)=0$. Thus $b_3=k-1$ and $\chi(X)=2-k$. These calculations use smooth embeddings of the compact domain at positive time.

The exact ALE Gauss–Bonnet formula in E63 gives $d_X=4T(k-2+\sum_j m_j^{-1})$. The sharp homogeneous Yamabe bound tested by dilated radial functions on an ALE end gives $y\le 8\sqrt6\pi/\sqrt{m_j}$. With $m=\max_j m_j$ the strict band now gives
\[
 \delta+T\left(k-2+\sum_j m_j^{-1}\right)\le 2T/m .
\]
For $k\ge2$ the left side exceeds $2T/m$. For $k=1$ the end expression $4T(-1+m_1^{-1})$ is nonpositive, contradicting $d_X>0$. This rules out the complete smooth extension. [E63 derivation and ALE normalization](../manuscript/ricci_concentration.tex) · [Tian–Viaclovsky, ALE Gauss–Bonnet formula (7.4)](https://arxiv.org/pdf/math/0310302#page=51)

The result concerns the positive-time flow selected under the upper volume ratios and its smooth initial extension on the same underlying manifold. The trace calculation leaves the regularity and geometry of an initial singular metric-space limit open.
