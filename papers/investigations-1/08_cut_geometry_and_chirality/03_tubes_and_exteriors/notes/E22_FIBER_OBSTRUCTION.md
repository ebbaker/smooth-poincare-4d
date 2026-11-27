# E22 — Positive scalar curvature on a fibered exterior double

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E22_REQUEST_R1](../research-progress/handoffs/E22_REQUEST_R1.md). Input checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, [B06](../brainstorm/notes/B06_ROUND_CHAMBER.md) and [E05](E05_TWISTED_EXTERIORS.md). Requested Sol 6.2/ultra. Actual model and effort unavailable. This is an analytical result, with no assumptions on energies, collapse, or a fibration-adapted metric.

**Result.** Let \(Q\) be a closed connected orientable smooth three-manifold, let \(P=Q\setminus\operatorname{int}B^3\), and let \(\varphi:P\to P\) be a smooth orientation-preserving diffeomorphism carrying its boundary to itself. Its exterior mapping torus \(X_\varphi\) has a smooth double admitting a positive-scalar-curvature metric if and only if \(Q\) has no aspherical prime summand. In particular the necessary condition applies to a positive reflective doubled conformal class. If \(Q\) is irreducible, it must be a spherical space form, with the round \(S^3\) allowed. In the reducible case the allowed prime factors are spherical space forms and \(S^1\times S^2\). The converse concerns existence of some positive-scalar-curvature metric on the double.

## 1. Doubling the fibration and using the positive sign

Write \(M=\mathcal D(X_\varphi)\). The bundle projection of \(X_\varphi\) admits a fiberwise collar: on its boundary choose an inward transverse vector field in the vertical tangent bundle and flow it for small time. Doubling with this collar extends the projection to a smooth fibration \(f:M\to S^1\) with fiber \(F=P\cup_{\partial P}\overline P=Q\#\overline Q\). The ordinary smooth double is independent up to diffeomorphism of the collar choice. This construction also gives a smooth doubled monodromy \(\Phi\) by choosing a bundle transport in the fiberwise collar. It works for a boundary-preserving \(\varphi\) given without product jets at the boundary. The fibers are connected and oriented, and the cohomology class \(\alpha=f^*[d\theta]\) uses the integral circle generator. Here \([F]=\operatorname{PD}(\alpha)\) has infinite order and is primitive, since \(f_*\) on fundamental groups is onto.

For a smooth positive doubled class, choose a positive-scalar-curvature representative. The same existence conclusion follows if positivity is given for the reflected \(C^{1,1}\) metric \(h\) by its weak Yamabe quotient. Smooth it in \(C^1\cap W^{2,2}\) in a finite atlas. The smooth approximations \(h_j\) are uniformly positive definite and their scalar curvatures converge in \(L^2\), by the local coordinate expression for scalar curvature. Let \(Q_h(v)=\int_M(6|dv|_h^2+R_hv^2)\,dV_h\) and use \(h\) for the comparison norms. Then
\[
 |Q_{h_j}(v)-Q_h(v)|
 \le \epsilon_j\big(\|dv\|_2^2+\|v\|_4^2\big),\qquad \epsilon_j\to0 .
\]
The gradient term is bounded by \(\big(Q_h(v)+\|R_h\|_2\|v\|_4^2\big)/6\). Since \(Q_h(v)\ge Y_h\|v\|_4^2\) for \(Y_h>0\), the approximating quadratic forms have a strict positive lower bound by a multiple of \(\|v\|_4^2\) for large \(j\). The smooth conformal Laplacian then has positive first eigenvalue. Its positive first eigenfunction produces the required smooth positive-scalar-curvature metric. This step uses the positive sign of the supplied class and allows a change of smooth representative.

## 2. Area minimization and the cyclic-cover degrees

Assume a smooth metric on \(M\) has \(R_M>0\). In the integral class \([F]\), minimize area as an integral codimension-one current. Existence and regularity in the Schoen–Yau argument give a finite union of mutually disjoint closed embedded oriented hypersurfaces \(S_i\), with positive integer multiplicities \(m_i\) after choosing their orientations. The class is \(\sum_i m_i[S_i]=[F]\), with inclusion pushforward understood. In ambient dimension four there are no singular points in this minimizer. Each \(S_i\) is two-sided, minimal and stable. Allowing disconnected support and multiplicities avoids needing a separate connectedness or irreducibility assertion about the minimizer. [Schoen–Yau, §1, proof of Theorem 1](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11170-Shing-Tung_Yau_358.pdf).

For clarity, stability and the Gauss equation for any such component give
\[
 \int_{S_i}\left(2|dv|^2+R_{S_i}v^2\right)
 \ge \int_{S_i}(R_M+|B|^2)v^2,\qquad v\in C^\infty(S_i).
\]
The coefficient of the three-dimensional conformal Laplacian is eight, so its first eigenvalue is strictly positive. A positive first eigenfunction gives a smooth conformal metric of positive scalar curvature on \(S_i\).

Every loop on \(S_i\) can be pushed along the oriented normal into a small collar, disjoint from the whole minimizing support. Its intersection with \(\sum_i m_i[S_i]\) is therefore zero. Accordingly \(f|_{S_i}\) induces the zero homomorphism to \(\pi_1(S^1)=\mathbb Z\), and the inclusion \(S_i\to M\) lifts to the infinite cyclic cover \(M_\alpha\). Pullback of \(f\) to the universal cover of the base identifies \(M_\alpha\) with \(F\times\mathbb R\). Choose independently a lift for each inclusion and let \(d_i\) be the degree after projection to \(F\). With the lifted fibers oriented as \(F\), the map \(H_3(M_\alpha;\mathbb Z)\to H_3(M;\mathbb Z)\) takes a generator to \([F]\). Therefore
\[
 \sum_i m_i d_i=1 .
\]
In particular at least one \(S_i\) maps to \(F\) with nonzero degree. Changing a lift composes, up to homotopy on the fiber projection, with a power of the orientation-preserving doubled monodromy, so does not change \(d_i\).

## 3. The three-dimensional obstruction and the converse

For a closed connected oriented three-manifold, positive scalar curvature, rational inessentiality, and absence of aspherical prime summands are equivalent. This is the three-dimensional classification statement collected as Theorem 5 in Kotschick's source below. Rational inessentiality descends along a nonzero-degree map: the universal-cover classifying maps commute up to homotopy with the map of classifying spaces induced on fundamental groups, and the image of the source fundamental class is the degree times the target class. Thus the positive-scalar-curvature \(S_i\) with \(d_i\ne0\) makes \(F\) rationally inessential. Equivalently, if \(F\) had an aspherical prime \(N\), pinching to that summand gives a degree-one map \(F\to N\). Its composition with \(S_i\to F\) contradicts rational inessentiality because \(N\) itself is a classifying space and its rational fundamental class is nonzero. Each prime of \(Q\) appears in \(Q\#\overline Q\), so the obstruction applies to \(Q\). Here irreducibility is a statement about the filled-in closed fiber \(Q\).

Conversely, with no aspherical prime in \(Q\), the same classification gives a smooth positive-scalar-curvature metric \(g_0\) on \(F\). The positive-scalar-curvature metric space of the closed connected orientable smooth \(F\) is path connected by Bamler–Kleiner, Theorem 1.1. Join \(g_0\) to \(\Phi^*g_0\) by a path and make it constant near the two ends. It may be made smooth in the parameter through such metrics because the path is continuous in the smooth topology, the positive condition is open in \(C^2\), and the parameter interval is compact. For example, piecewise linear interpolation on a fine partition followed by smoothing in the parameter gives the required approximation relative to the constant end intervals.

For the convention \((1,y)\sim(0,\Phi(y))\), the metric \(L^2dt^2+g_t\) then descends smoothly to \(M\). The fiber scalar curvature has a uniform strictly positive lower bound. With \(K_t=\dot g_t/(2L)\) and \(H_t=\operatorname{tr}_{g_t}K_t\), the four-dimensional scalar curvature is
\[
 R_{L^2dt^2+g_t}=R_{g_t}-2L^{-1}\partial_tH_t-H_t^2-|K_t|^2 .
\]
All the correction terms are uniformly \(O(L^{-2})\) on the smooth compact path. A sufficiently large \(L\) gives strict positivity. This is a metric-existence statement for any smooth doubled monodromy in these fiber types. The metric of this existence proof is auxiliary to a proposed reflective seam geometry.

## 4. Effect on the marked exterior question

The obstruction applies without a preferred collapse gauge and at any \(e_X\). In particular a positive double rules out an aspherical prime in a reducible fiber as well as the irreducible aspherical case. If the closed fiber \(Q\) is a rational homology sphere, the allowed connected sums consist of spherical primes since \(S^1\times S^2\) would contribute to \(H_1(Q;\mathbb Q)\). Rational circle homology of \(X_\varphi\) alone gives a different condition. The mapping-torus exact sequence requires \(\varphi_*-\mathrm{id}\) to have zero cokernel on \(H_1(P;\mathbb Q)\), allowing \(H_1(P;\mathbb Q)\ne0\).

The marked filling still kills the actual meridian stable letter. If \(\Gamma=\pi_1(P)\) and \(t\) is the marked stable letter, let \(\alpha_t\) act on \(\Gamma\) by \(tgt^{-1}\). Van Kampen gives the group after filling as
\[
 \Gamma/\big\langle\!\big\langle\alpha_t(g)g^{-1}:g\in\Gamma
 \big\rangle\!\big\rangle .
\]
For a different unmarked splitting, the same \(t\) may include a displacement in \(\Gamma\), so the based automorphism in this quotient is essential. As a simple check, if \(Q\) is a nontrivial lens space and \(\varphi=\mathrm{id}\), the double has positive scalar curvature while the meridian quotient remains \(\pi_1(Q)\). The fiber criterion concerns scalar-curvature existence. The geometric realization of a marked monodromy, the sign of a particular reflective class, and an energy estimate on its exterior and cap are separate requirements for closing.

## Inspected sources and attribution

- R. Schoen and S.-T. Yau, *On the structure of manifolds with positive scalar curvature*, Manuscripta Math. **28** (1979), 159–183. Checked §1, proof of Theorem 1, pp. 164–167 and equations (1.1)–(1.9), on 27 November 2026. The codimension-one minimal-current existence and regularity passage and the stability calculation supply the smooth stable representative in the oriented ambient dimension four used here. [Published scan](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11170-Shing-Tung_Yau_358.pdf).
- D. Kotschick, *Geometric formality and non-negative scalar curvature*, Pure Appl. Math. Q. **13** (2017), no. 3, 437–451. Checked Theorem 5, p. 440, and the last part of the proof of Theorem 8, pp. 443–444, on 27 November 2026. The latter already gives the mapping-torus-to-fiber domination argument, in a theorem where geometric formality first identifies the manifold as a mapping torus. Once the bundle over the circle is specified, its domination argument uses only that bundle and positive scalar curvature of the total space. The cyclic-cover proof above makes the multiplicities and possibly disconnected minimizing support explicit. [Published text](https://www.intlpress.com/site/pub/files/_fulltext/journals/pamq/2017/0013/0003/PAMQ-2017-0013-0003-a003.pdf).
- R. H. Bamler and B. Kleiner, *Ricci flow and contractibility of spaces of metrics*, arXiv:1909.08710. Checked Theorem 1.1 and the introductory definition of the smooth metric space in the authors' 15 October 2019 PDF on 27 November 2026. The relevant hypothesis is a closed connected orientable smooth three-manifold with a nonempty positive-scalar-curvature metric space. Its contractibility implies the path connectedness used for the converse. [Author PDF](https://math.nyu.edu/~bkleiner/psc.pdf).
