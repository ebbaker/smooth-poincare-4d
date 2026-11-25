# E57r · Critical Ricci-flow smoothing audit

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort are unavailable. This
bounded E audit checks the proposed four-dimensional curvature-tail argument,
using the E55 master bundle `15c0f568bb52bdde` and
[`endpoint_charge.tex`](../manuscript/endpoint_charge.tex) SHA-256 prefix
`b877c61b76b7`. Both proofs below work on the actual smooth compact source
for each index. The record-maximum proof gives the shorter continuation
argument. The Moser proof additionally gives a positive-time bound on the
excess proportional to its initial norm.

**Verdict.** The E55 auxiliary representatives do rule out the unattained
recognition endpoint on a hypothetical nonstandard smooth homotopy
four-sphere. The estimates are uniform over varying smooth types, yielding
a universal positive gap above the recognition threshold. The essential
inputs for the isotropic-curvature route are a uniform inhomogeneous Sobolev
inequality, a vanishing full-curvature tail beyond a fixed cutoff, a uniform
scalar lower bound, and the vanishing pointwise lower defect for both
chiral isotropic inequalities. The open upper band requires further input.

## Initial metrics and entropy transport

Use the Riemannian curvature operator on the real two-forms with
\(\langle\mathcal R(e_i\wedge e_j),e_i\wedge e_j\rangle=K_{ij}\), full
four-index norm \(U=|\mathrm{Rm}|_{\mathrm{tens}}\), scalar curvature \(R\),
and \(L=\max(\lambda_{\max}W^+,\lambda_{\max}W^-)\). The E55 conformal
representatives of volume one satisfy \(R-6L=c_i\to0\) at regularity
\(C^{2,\alpha}\). For each index approximate the positive conformal factor
in \(C^2\) by a positive smooth one, then renormalize volume. Choose the
approximation with absolute pointwise error in \(R-6L\) tending to zero,
and with errors tending to zero in the scalar and curvature integrals
used in E55. This is possible on each compact source. Since \(L\ge0\),
the smooth representatives \(q_i\) have \(R_{q_i}\ge-1\) for large \(i\).
The Yamabe inequality in their original conformal class and
\(\eta_i=\|R_{q_i}-Y_i\|_{2,q_i}\to0\) give
\[
 (Y_i-\eta_i)\|f\|_{4,q_i}^{2}
 \le 6\|df\|_{2,q_i}^{2}+Y_i\|f\|_{2,q_i}^{2}.
\]
As \(Y_i\to8\sqrt3\pi\), one constant \(S_0\) gives
\(\|f\|_4^2\le S_0(\|df\|_2^2+\|f\|_2^2)\). The E55 estimate
\(\|U_i(0)^2-64\pi^2\|_1\to0\) gives
\(\delta_i=\|(U_i(0)-P)_+\|_2\to0\) for any fixed \(P>8\pi\), since
\((s-P)_+^2\le (s^2-P^2)_+\) for \(s\ge 0\).

Let \(g_i(t)\) be the maximal smooth unnormalized Ricci flow, with
maximal time \(T_i>0\). Fix a horizon \(T_0>0\), independent of \(i\),
to be restricted below. All estimates preceding continuation apply on
\([0,\min(T_i,T_0))\). The scalar equation and maximum principle give
\(R(t)\ge-1\). Define \(Q_t(f)=\int(|df|^2+Rf^2/4)\,dV_t\) and
\(\operatorname{Ent}_t(f)=\int f^2\log f^2\,dV_t\) for \(\|f\|_{2,t}=1\).
Initially Jensen's inequality and the preceding Sobolev estimate give
\[
 \operatorname{Ent}_0(f)
 \le \log\int f^4\,dV_0
 \le 2\log\big[S_0(Q_0(f)+5/4)\big].
\]
Using \(2\log x\le\sigma x-2\log\sigma+2\log2-2\) on
\(x=Q_0(f)+5/4\) yields
\[
 \operatorname{Ent}_0(f)\le\sigma Q_0(f)-2\log\sigma+C_0+5\sigma/4
 \qquad(\sigma>0).
\]
Here \(C_0\) depends only on \(S_0\). In dimension four, Perelman's
\(\mu(g,\sigma/4)\) is the infimum of
\(\sigma Q(f)-\operatorname{Ent}(f)-4-2\log(\pi\sigma)\) over
\(L^2\)-normalized functions. Monotonicity compares
\(\mu(g_i(t),\sigma/4)\) with \(\mu(g_i(0),(\sigma+4t)/4)\).
Consequently
\[
 \operatorname{Ent}_t(f)\le\sigma Q_t(f)-2\log\sigma+
 C_0+\tfrac54(\sigma+4t).
\]
For \(0<\sigma<4\) the last two terms have a common upper bound on the
chosen horizon. Ye's logarithmic-to-Sobolev conversion applies to each
fixed slice with \(\mu=n=4\), \(\sigma^*=4\), and potential \(R/4\)
bounded below by \(-1/4\). Thus there are uniform \(A,B>0\) such that
\[
 \|f\|_{4,t}^{2}\le A Q_t(f)+B\|f\|_{2,t}^{2}. \tag{1}
\]
This derivation is needed for the available inhomogeneous inequality.
The initial \(C_S\) in Ye's Theorem D* is defined by (2.4), with the
coefficient of \(\|f\|_2\) fixed to \(\operatorname{Vol}^{-1/n}\). A
bound for the actual inhomogeneous inequality leaves that coefficient
free. The entropy derivation works directly with the available bound.
[Perelman, arXiv:math/0211159v1, §3](https://arxiv.org/pdf/math/0211159#page=8) ·
[Ye, arXiv:0707.2424v4, §2 (2.4) and Theorem 5.5 (5.17)–(5.18)](https://arxiv.org/pdf/0707.2424#page=22)

## Truncated curvature energy

The compact-flow curvature evolution gives the weak inequality
\((\partial_t-\Delta)U\le cU^2\), for a dimensional \(c>0\). Take
\(\phi'=c\phi^2\), \(\phi(0)=P\), and choose
\(T_0\le\min(1,(2cP)^{-1})\), so \(\phi\le2P\) on the horizon. With
\(v=(U-\phi)_+\), the positive-part inequality gives
\[
 (\partial_t-\Delta)v\le c(v+2\phi)v. \tag{2}
\]
On any interval where \(\|v\|_{2,t}\le\epsilon\), the scalar term in
(1) can be estimated by \(R\le c_R U\le c_R(v+\phi)\) and
\(\int vf^2\le \epsilon\|f\|_4^2\). First choose \(\epsilon\) so that
\(Ac_R\epsilon/4\le1/2\). This gives a constant \(S\), independent of
\(\epsilon\) below this threshold, such that
\[
 \|f\|_{4,t}^{2}\le S\big(\|df\|_{2,t}^{2}+\|f\|_{2,t}^{2}\big). \tag{3}
\]
Write \(E_2=\int v^2\) and \(G_2=\int|dv|^2\), using the evolving
volume throughout. Multiply (2) by \(2v\), integrate by parts, and use
\(\partial_t dV=-R\,dV\) with \(-R\le1\). This gives
\[
 E_2'+2G_2\le C E_2+2c\int v^3
 \le C E_2+2c\epsilon S(G_2+E_2).
\]
With \(2c\epsilon S\le1\), it follows that
\(E_2'+S^{-1}\|v\|_4^2\le C E_2\). Taking \(i\) so large that
\(e^{CT_0}\delta_i^2<\epsilon^2/2\) excludes a first crossing of
\(\epsilon\) by continuity, regardless of the individual \(T_i\). Hence
on every existing part of this horizon
\[
 \sup E_2+\int_0^{\min(T_i,T_0)}\|v\|_4^2\,dt\le C\delta_i^2,
 \qquad \int_0^{\min(T_i,T_0)}\int v^3\,dV_tdt\le C\delta_i^3. \tag{4}
\]
For the last bound use \(\int v^3\le\|v\|_2\|v\|_4^2\). Norms of
curvature and their positive parts can be treated by regularization or the
weak Kato and chain rules. The energy tests take place on compact smooth
subintervals of the individual flows.

## Uniform continuation by a record curvature maximum

The unweighted inequality (3) gives a volume lower bound for every slice
and all radii \(r\le1\). Put \(V(r)=\operatorname{Vol}_t B_t(x,r)\).
A Lipschitz cutoff equal to one on \(B_t(x,r/2)\), with slope at most
\(2/r\), gives \(V(r/2)^{1/2}\le5S r^{-2}V(r)\). For
\(F(r)=r^{-4}V(r)\) this implies
\(F(r)\ge (20S)^{-1} F(r/2)^{1/2}\). Iterate dyadically and use the ordinary
smooth density limit for this single metric, \(F(r/2^j)\to\omega_4\).
The result is \(V(r)\ge (20S)^{-2}r^4\), independently of the slice or
of the radius of its smooth normal chart.

Suppose at some record time \(t\) on the existing horizon
\(tK=\max_{0\le s\le t}s\max_M U(s)\ge H\), where \(K=\max_M U(t)\) and
\(H\ge \max(2,T_0,4T_0\sup\phi)\) is fixed. The previous interval
\([t-K^{-1},t]\) has \(s\ge t/2\), so \(U(s)\le2K\) there. Rescale by
\(K\) to a compact Ricci flow of duration one with \(U\le2\). The
curvature derivative estimate applied to its last half gives
\(|\nabla\mathrm{Rm}(t)|\le C_1K^{3/2}\). At a maximum point \(x\), take
\(r=a/\sqrt K\) with \(a\le\min(1,(2C_1)^{-1})\). Along minimizing
geodesics in this slice the norm changes by at most \(K/2\), so \(U\ge
K/2\) throughout \(B_t(x,r)\). Since \(K\ge4\sup\phi\), the energy there
is at least
\[
 (K/4)^2 V(r)\ge a^4/[16(20S)^2].
\]
For large \(i\) this contradicts (4). The maximum of the continuous function
\(s\max_M U(s)\) over any compact subinterval starting at zero is attained.
Thus \(U_i(t)\le H/t\) on every existing part of the horizon. If
\(T_i\le T_0\), then \(U_i\le 2H/T_i\) on \([T_i/2,T_i)\). Together
with smoothness on the earlier compact interval, this meets the bounded-
curvature extension criterion for that individual closed flow, a
contradiction. The argument also rules out putative maximal times tending
to zero.
[Hamilton, *The formation of singularities in the Ricci flow*, Surveys in Differential Geometry 2 (1995), Theorems 7.1 and 8.1](https://intlpress.com/site/pub/files/_fulltext/journals/sdg/1993/0002/0001/SDG-1993-0002-0001-a002.pdf)

## Independent parabolic estimate

A global Moser argument also closes continuation. For \(0<t<\min(T_i,T_0)\),
(4) supplies \(a\in[t/4,t/2]\) with
\(\int v(a)^3\le C\delta_i^3/t\). In the fixed \(p=3\) energy estimate,
write \(f=v^{3/2}\). The coercive coefficient of \(\|df\|_2^2\) is
\(4(p-1)/p=8/3\). The reaction term involving \(v\) is bounded by
\(3c\|v\|_2\|f\|_4^2\) and absorbed by (3), after decreasing the common
bootstrap threshold if necessary. Grönwall therefore gives
\[
 K_3^3:=\sup_{[t/2,t]}\|v\|_3^3\le C\delta_i^3/t.
\]
This uses a fixed exponent before running the iteration. Absorption by the
critical \(L^2\) norm alone would require a threshold tending to zero as the
exponent tends to infinity.

For \(p\ge3\) and \(f=v^{p/2}\), the general energy inequality has
coercive coefficient \(4(p-1)/p\ge2\). Hölder, interpolation and Young
on \([t/2,t]\) give
\[
 pc\int vf^2
 \le pcK_3\|f\|_2^{2/3}\|f\|_4^{4/3}
 \le \rho\|f\|_4^2+C_\rho p^3K_3^3\|f\|_2^2.
\]
Choose fixed \(\rho>0\) small relative to \(S\) and apply (3).
For \(s_k=3t/4-t2^{-k-2}\), let
\(Q_k=M\times[s_k,t]\) and cut off in time between \(s_k\) and
\(s_{k+1}\). The slope is bounded by \(C2^k/t\). Integration gives
\[
 \sup_{[s_{k+1},t]}\|f\|_2^2+
 \int_{s_{k+1}}^t\|f\|_4^2
 \le C\big(p+p^3K_3^3+2^k/t+1\big)\int_{Q_k} f^2.
\]
Since \(\int f^3\le \|f\|_2\|f\|_4^2\) at each slice, this implies
\[
 \|v\|_{L^{3p/2}(Q_{k+1})}
 \le \big[C(p+p^3K_3^3+2^k/t+1)\big]^{1/p}
      \|v\|_{L^p(Q_k)}.
\]
For \(p_k=3(3/2)^k\), \(0<t\le1\), and \(\delta_i\le1\), the bracket
is bounded by \(C p_k^3 2^k/t\). Its product to powers \(1/p_k\) is
bounded by \(C/t\), since \(\sum_k1/p_k=1\) and
\(\sum_k(1+k)/p_k<\infty\). The spacetime \(L^3\) norm in (4) is at
most \(C\delta_i\). Thus continuity at time \(t\) gives
\(\|v(t)\|_\infty\le C\delta_i/t\), which also suffices for the same
continuation argument.

## Chiral deficit and recognition on the limit

Let \(A=W^++RI/12\) and \(C=W^-+RI/12\) be the two diagonal blocks of
\(\mathcal R\), with off-diagonal block \(B\). For either diagonal block
write its eigenvalues in ascending order as \(a\le b\le d\), and set
\(F=a+b\). Thus \(\min(F_A,F_C)=R/6-L\). In a moving orthonormal frame
Hamilton's block equation is
\[
 (D_t-\Delta)A=2(A^2+2A^\#+BB^\top),
\]
with \(A^\#\) the adjugate, and the corresponding equation for \(C\) has
\(B^\top B\). The coefficient is for the operator normalized to have
sectional curvatures on unit simple two-forms. The sign inequality is
independent of the convention that scales the entire curvature operator
by two. For the minimizing orthonormal eigenpair \(e_1,e_2\), taking the
trace over that pair yields
\[
 (\partial_t-\Delta)F\ge
 2(a^2+b^2)+4dF+2\sum_{j=1}^2 |B^\top e_j|^2. \tag{5}
\]
Here the stronger expression is applied in the support sense, using the
chosen minimizing pair and the matching block. In particular one obtains
an unambiguous scalar viscosity supersolution with the last term omitted.
Indeed \(F\) is the minimum of the two-plane traces. For a test touching
\(F\) from below, extend a minimizing two-plane by normal spatial and
time-compatible frames with vanishing first spatial derivative and traced
second derivative at the point. The same test touches this smooth trace
from below. Its heat operator is at least that of the smooth trace at the
contact point, giving the claimed sign. Eigenvalue ties are admissible.
[Hamilton, *Four-manifolds with positive curvature operator*, J. Differential Geom. 24 (1986), §2, pp. 157–158](https://doi.org/10.4310/jdg/1214440433) ·
[Hamilton, *Four-manifolds with positive isotropic curvature*, Comm. Anal. Geom. 5 (1997), §1.2 and §2.1, Theorem 1.2](https://doi.org/10.4310/CAG.1997.v5.n1.a1) ·
[Chen–Zhu, Comm. Anal. Geom. 22 (2014), §3, equations (3.1)–(3.2)](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=13)

For each chirality \(w=(-F)_+\) is therefore a scalar subsolution of
\((\partial_t-\Delta)w\le C U w\). The viscosity inequality is also a
weak inequality for this scalar linear operator with smooth metric and
locally bounded continuous reaction coefficient. Testing by \(w\), using
\(-R\le1\), \(U\le v+\phi\), (3) and the smallness of \(\|v\|_2\) gives
\[
 \frac{d}{dt}\int w^2+2\int|dw|^2
 \le C\int w^2+C\|v\|_2\|w\|_4^2.
\]
Choose the original common bootstrap threshold small enough to absorb
this term as well. Since \(F(q_i)\ge-o(1)\) for both signs and initial
volume is one, \(\sup_t\|w_i(t)\|_2\to0\). The critical energy inequality
starts at time zero, where a coefficient of order \(t^{-1}\) would be
nonintegrable.

At a fixed interior time \(t_*\in(0,T_0)\) the curvature bound on a
preceding fixed time interval gives bounds on all curvature derivatives
at \(t_*\). The volume lower estimate after (4) at any fixed sufficiently
small radius and the sectional bound give a uniform injectivity radius
by Cheeger–Gromov–Taylor. The same lower volumes and
\(\operatorname{Vol}_{g_i(t_*)} M\le e^{t_*}\), from \(R\ge-1\) and
initial volume one, give a diameter bound by disjoint balls along any
minimizing geodesic. Smooth compactness applied on an interior time
interval, or on the fixed slices with their derivative bounds, yields a
smooth closed limit with global diffeomorphisms from a subsequence of the
same smooth source. The diameter bound keeps the pointed limit compact.
Smooth convergence and the \(L^2\) deficit estimate give \(F_A,F_C\ge0\)
on the whole limit. This is the nonnegative isotropic cone in four
dimensions.
[Cheeger–Gromov–Taylor, J. Differential Geom. 17 (1982), Theorem 4.7(i)](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/536.pdf#page=33) ·
[Hamilton, *A compactness property for solutions of the Ricci flow*, Amer. J. Math. 117 (1995), pp. 545–572](https://doi.org/10.2307/2375080)

For a direct four-dimensional way to finish, restart Ricci flow from the
smooth nonnegative-isotropic-curvature limit. Nonnegativity persists by
(5) and the scalar weak maximum principle, since \(d\) is now bounded
on a compact smooth time interval. It implies \(R\ge0\) because \(L\ge0\).
If \(R\equiv0\) initially, then \(L\equiv0\) and both trace-free Weyl
blocks vanish. Gauss–Bonnet would give \(8\pi^2\chi(M)\le0\), as its
remaining integrand is \(-|Z|^2/2\). Therefore the scalar evolution implies
\(R>0\) everywhere at positive restart times. For either block, \(F\ge0\)
implies \(d\ge0\). A zero of \(F\) at a positive interior time forces
\(F\equiv0\) at the preceding positive times by (5) and the scalar strong
maximum principle. The nonnegative squares in (5) then give \(a=b=0\)
throughout that earlier time interval. The block consequently has rank
one, with positive remaining eigenvalue \(d=R/4\).

Consider such an interval for \(A\). For a smooth local section \(\xi\) of
\(\ker A\), the identity \(A\xi=0\) gives
\((\nabla A)\xi=-A\nabla\xi\). Hence the block equation yields
\[
 0=(\partial_t-\Delta)\langle A\xi,\xi\rangle
   =2|B^\top\xi|^2+2\langle A\nabla\xi,\nabla\xi\rangle.
\]
Here \(A^2\xi=0\) and the rank-one adjugate vanishes identically. Because
\(A\) is positive on the orthogonal complement of \(\ker A\), this shows
that the kernel and its orthogonal eigenline are parallel. The argument
for \(C\) has the same conclusion. A real parallel line on a simply
connected manifold has a global parallel unit section. In this case the
section is a nonzero harmonic (anti-)self-dual two-form, contrary to
\(b_2(M)=0\). Both chiral inequalities must therefore be strict at any
positive interior restart time. The positive isotropic curvature
classification implies that the homotopy four-sphere is diffeomorphic
to \(S^4\). Each projective or cocompact cylindrical summand would have
nontrivial fundamental group, and connected sum gives their free product.
[Chen–Tang–Zhu, *Complete classification of compact four-manifolds with positive isotropic curvature*, J. Differential Geom. 91 (2012), Main Theorem and Corollary 1 proof, p. 44](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/926-JDG-91-1-a2-che.pdf#page=4)

## Cross-check of the Einstein transport proof

The separately drafted [smoothing section](../manuscript/endpoint_smoothing.tex),
inspected at SHA-256 prefix e7464b8bb2c9, uses the initial Einstein defect
from E55 and gives a shorter recognition. Let \(P=\operatorname{Ric}-\lambda g\),
\(\lambda(0)=y_*/4\), with \(\lambda'=2\lambda^2\). The Ricci equation on
covariant tensors is
\[
 (\partial_t-\Delta)\operatorname{Ric}
 =2\mathrm{Rm}(\operatorname{Ric})-2\operatorname{Ric}^2,
 \qquad \mathrm{Rm}(g)=\operatorname{Ric},
\]
where \(\mathrm{Rm}(T)_{ij}=R_{ikjl}T_{kl}\) in orthonormal coordinates
with the matching contraction convention. Passing to the moving
orthonormal frame cancels the displayed square term and makes the metric
matrix constant. Consequently
\((D_t-\Delta)P=2\mathrm{Rm}(P)+2\lambda P\).
Testing its norm square in the evolving volume gives the same absorption
as for \(w\), since \(U\le v+\phi\) and \(\lambda\) stays bounded on a
smaller common horizon. The E55 estimates for the trace and trace-free
Ricci parts give \(\|P(0)\|_2=o(1)\), hence \(\sup_t\|P(t)\|_2=o(1)\).
[Hamilton, *The formation of singularities in the Ricci flow*, §§4–5](https://intlpress.com/site/pub/files/_fulltext/journals/sdg/1993/0002/0001/SDG-1993-0002-0001-a002.pdf)

For \(V_i(t)=\operatorname{Vol}(g_i(t))\), differentiation gives
\(V_i'+4\lambda V_i=-\int\operatorname{tr}P\). The error is bounded by
\(2V_i^{1/2}\|P\|_2=o(1)\), uniformly by \(V_i\le e^{T_0}\). The solution
with initial volume one therefore satisfies
\(V_i(t)\to(1-2\lambda(0)t)^2\) uniformly. At a positive fixed time the
smooth closed limit has \(\operatorname{Ric}=\lambda(t)g\), and its scalar
square integral is \(16\lambda(t)^2(1-2\lambda(0)t)^2=y_*^2=192\pi^2\).
Its topological invariants are \(\chi=2\) and signature zero by global
diffeomorphism. Gauss–Bonnet and the signature formula give
\(16\pi^2=2E_++192\pi^2/24\), so \(E_+=4\pi^2\). Positive scalar curvature
gives a positive Yamabe class, and the inclusive recognition result
applies to this actual smooth limit.
[Fixed-type descent manuscript, inclusive recognition](../manuscript/fixed_type_chiral_energy_descent.tex)

This passage also checks the varying-source quantifier. The E55 formulas
through the full-curvature density have universal leading terms and use
only the per-class strict deficit and \(e_i\to T\). All continuation and
compactness constants above then have uniform bounds. If no universal
\(\eta>0\) existed, choose nonstandard sources \(M_i\) with a positive
Yamabe class and \(e_i<T+1/i\). Inclusive recognition for individual
classes gives \(e_i>T\). The resulting smooth limit is standard by the
preceding computation and is diffeomorphic to all late sources in its
subsequence, a contradiction. The proof yields an existential gap.

## Scope and citation check

The conclusion concerns a closed connected oriented smooth homotopy
four-sphere carrying the stated sequence. In the E55 use, the sequence
would exist if the fixed-type positive Yamabe chiral-energy infimum were
\(4\pi^2\). Every hypothetical nonstandard type with a nonempty positive
class family must instead have \(I^+(M)>4\pi^2\), using the existing
strict-threshold recognition below this endpoint. Construction of a
sufficient entry and the open upper-band alternatives remain separate
problems. The bounds at positive time concern Ricci flows started from
auxiliary conformal representatives. The physical supercritical Ricci
norms on the original Yamabe metrics are a different estimate.

The primary sources were inspected at the mathematical passages indicated
above on 25 November 2026. An alternative direct source for (1) is Zhang,
Addendum Lemma A1, equations (A.1)–(A.2), which assumes
\(\|f\|_4^2\le A(0)(Q_0(f)+\|f\|_2^2)\). This follows from the original
inhomogeneous Sobolev inequality and \(R\ge-1\). The constant at each
existing time \(t\) depends on this initial bound, the initial negative
scalar bound, dimension and the upper time horizon. The first derivative
estimate used for record times and the closed continuation criterion are
also both stated in Hamilton's survey as Theorems 7.1 and 8.1.
[Zhang, arXiv:0706.1594v4, Addendum Lemma A1](https://arxiv.org/pdf/0706.1594#page=9)
