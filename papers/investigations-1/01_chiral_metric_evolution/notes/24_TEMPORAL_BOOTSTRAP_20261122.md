# SP4-CME-E24 temporal budget and continuous finite-time limits

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This bounded
[E24 calculation](../research-progress/handoffs/SP4-CME-E24_REQUEST_v1.md)
implements the [B20 decision](../brainstorm/notes/B20_TEMPORAL_BOOTSTRAP_DECISION_20261122.md).
The [return](../research-progress/handoffs/SP4-CME-E24_RETURN_v1.md)
records the checked input versions.

## Setting and two relative comparisons

Let \(A(t)\), \(0\le t<\tau\), be a smooth solution of the actual
unadjusted independent-connection Fine flow on a fixed oriented
Euclidean rank-three \(SO(3)\) bundle \(E\) over a smooth closed
oriented real four-manifold \(M\). Assume positive definite
curvature planes and the round-compatible sign throughout the
supplied smooth interval. Use the manuscript internal pairing
\(\delta\), bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), fixed \(K>0\),
and the fixed base and bundle identification in time. Write
\[
 \begin{gathered}
 F=-KS\Sigma,\quad S=Q^{1/2},\quad Q>0,\quad
 \operatorname{tr}Q=3,\quad q=Q-I,\quad
 \mu=2K^2dV_{\widehat g},\\
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\qquad
 T_c=\tfrac12(S^{-1}\nabla^A_cQ\,S^{-1})_0 .
 \end{gathered}
\]
Here \(\nabla^A\) uses the connection \(A\) on internal slots and
the reconstructed Levi–Civita connection on all base slots.
Internal endomorphism norms are Frobenius. The instantaneous
base norms are computed in \(\widehat g(t)\), with each
unordered pair counted once for two-forms. Put \(g_0=\widehat g(0)\),
\[
 \mathcal G=|\nabla^A T|+|T|^2,\quad
 J(t)=\int_0^t\sup_{x\in M}\mathcal G(s,x)\,ds,\quad
 a(t)=C_*J(t),\qquad C_*=4512\sqrt2 .
\]
E14 gives the metric tensor comparison and the two-sided
quadratic-form comparison for \(Q\),
\[
 e^{-a(t)}g_0\le\widehat g(t)\le e^{a(t)}g_0,\qquad
 e^{-a(t)}Q(0,x)\le Q(t,x)\le e^{a(t)}Q(0,x).
 \tag{1}
\]
The second comparison follows by integrating the bound on
\(\partial_t\log\langle u,Q(t,x)u\rangle\) for each fixed nonzero
fiber vector \(u\), so it also applies at eigenvalue multiplicities.
The unadjusted flow has \(\mu_t=0\) pointwise, hence
\(dV_{\widehat g(t)}=dV_{g_0}\).
[E14 relative motion and volume law](16_TEMPORAL_STRAIN_CRITERION_20261122.md).

## Budget for pinching and critical-strain decay

Let \(\eta=\sup_M|q(0)|\). Then
\((1-\eta)I\le Q(0,x)\le(1+\eta)I\) by the spectral bound from
the Frobenius norm. At every \(x,t\), (1) bounds each eigenvalue
of \(Q(t,x)\) between \(e^{-a(t)}(1-\eta)\) and
\(e^{a(t)}(1+\eta)\). Since \(a,\eta\ge0\),
\[
 e^a(1+\eta)+e^{-a}(1-\eta)-2
   =e^a+e^{-a}-2+\eta(e^a-e^{-a})\ge0.
\]
Thus \(1-e^{-a}(1-\eta)\le e^a(1+\eta)-1\).
Each eigenvalue deviation from one is bounded in absolute value
by \((1+\eta)e^{a(t)}-1\). Taking the Frobenius norm in rank
three proves
\[
 \sup_M|q(t)|\le \sqrt3\bigl((1+\eta)e^{a(t)}-1\bigr).
 \tag{2}
\]

Assume the scalar Sobolev inequality at time zero is
\[
 \|u\|_{L^4(g_0)}^2\le S_0
       \left(\int_M |du|_{g_0}^2\,dV_{g_0}
                       +K\int_M u^2\,dV_{g_0}\right)
 \tag{3}
\]
for every smooth real scalar \(u\). Fixed pointwise volume
means that the scalar \(L^4\) and \(L^2\) norms are identical
at time zero and time \(t\). The cotangent comparison from (1)
gives \(|du|_{g_0}^2\le e^{a(t)}|du|_{\widehat g(t)}^2\).
Since \(e^{a(t)}\ge1\), (3) at \(t\) holds with
\(S_0 e^{a(t)}\).

Choose a common allowable pinching threshold
\[
 \sqrt3\eta<\epsilon\le\min\{\epsilon_0^{\rm E16},\epsilon_1^{\rm E19}\},
 \qquad
 a_{\rm B}=\log\!\left(\frac{1+\epsilon/\sqrt3}{1+\eta}\right)>0,\qquad
 J_{\rm B}=a_{\rm B}/C_* .
 \tag{4}
\]
Here \(\epsilon_0^{\rm E16},\epsilon_1^{\rm E19}\in(0,1/8]\)
are the two strain-energy pinching thresholds. This choice
requires sufficiently small initial \(\eta\). On any smooth
segment \([0,t]\) with \(J(t)\le J_{\rm B}\), \(J\) is
nondecreasing, so (2) and (3) give the pinching and the same
Sobolev constant \(S_{\rm B}=S_0e^{a_{\rm B}}\) throughout
the segment. These premises hold up to the first exhaustion
of the budget within the smooth interval, including equality
if that time is itself in the interval. [E16 strain-energy
threshold](18B_STRAIN_ENERGY_ESTIMATE_20261122.md).

Let \(C\) be the sixth-power error constant in E19 and write
\(F_4(t)=\int_M|T|^4dV_{\widehat g}\),
\(Y(t)=F_4(t)^{1/2}=\|T(t)\|_{L^4(\widehat g(t))}^2\).
With E19's \(c=8\), its threshold for a uniform
Sobolev constant \(S_{\rm B}\) is
\[
  Y_{\rm B}=\min\{c/8,1/2\}/(C S_{\rm B})
                =\frac{1}{2C S_0e^{a_{\rm B}}}.
\]
If \(Y(0)<Y_{\rm B}\), the E19 first-hit argument on any
such segment gives
\[
  F_4(t)\le e^{-Kt/2}F_4(0),\qquad
  Y(t)\le e^{-Kt/4}Y(0) .
 \tag{5}
\]
Explicitly \(F_4'\le-(c/2)\int |T|^2|\nabla^AT|^2dV_{\widehat g}
-(K/2)F_4\) whenever \(Y\le Y_{\rm B}\) on the segment.
A first equality with the threshold would contradict this decay
from the strict initial inequality. This uses the E19 threshold
and the common pinching range of the two packets. The estimate
applies to the given smooth segment under the budget and gives
no bound for later growth of \(J\).
[E19 critical energy and first-hit threshold](20_CRITICAL_STRAIN_ENERGY_20261122.md).

## Integrability of the two velocities at a finite endpoint

Independently of (4)–(5), suppose \(0<\tau=T_\star<\infty\)
is a candidate endpoint of the given smooth definite interval and
\[
 J_\star:=\int_0^{T_\star}\sup_M \mathcal G(t,x)\,dt<\infty,\qquad
 a_\star=C_*J_\star .
\]
Use the fixed sup norm \(\|\cdot\|_{C^0(g_0,\delta)}\)
on \(E\)-valued tensors. From (1), for a covariant \(k\)-form
the norm in \(g_0,\delta\) is at most
\(e^{ka_\star/2}\) times its norm in \(\widehat g(t),\delta\).
This follows by using a \(g_0\)-orthonormal frame diagonalizing
\(\widehat g(t)\) at the point, with each tangent eigenvalue
between \(e^{-a_\star}\) and \(e^{a_\star}\).

**Velocity normalization.** Write \(H_q=q-|q|^2I/6\) and
\(C=\nabla^AQ-\tfrac13\operatorname{tr}(Q\nabla^AQ)I\).
In dimension four, \(d_A^{*\widehat g}=-*_{\widehat g}d_A*_{\widehat g}\)
on two-forms. Self-duality of \(H_qF\) and \(d_AF=0\)
give
\[
 v=-4d_A^{*\widehat g}(H_qF)=+4*_{\widehat g}(C\wedge F).
 \tag{6}
\]
The frozen E24 request writes a minus sign in front of the Hodge
star. Equation (6) is the sign of the actual flow in the
audited conventions. The estimates below use absolute norms.
[E02C direct Hodge contraction](04C_VOLUME_AND_JETS_20261122.md).

Since \(X=\nabla^AQ\) is trace-free and
\(\operatorname{tr}(QX_c)=\operatorname{tr}(qX_c)\),
the orthogonal trace decomposition gives
\[
 |C_c|^2=|X_c|^2+\tfrac13|\operatorname{tr}(qX_c)|^2
      \le 3|X_c|^2
\]
by \(|q|^2\le 6\) from the trace-three constraint.
Thus \(|C|\le \sqrt3|X|\le6\sqrt3|T|\).
The \(\Sigma_j\) wedge followed by Hodge star is an isometry
on one-forms. Writing \(C\wedge F=-K(CS)\wedge\Sigma\)
and applying Cauchy–Schwarz over the three internal summands
gives \(|*(C\wedge F)|\le K\sqrt3|CS|\le 3K|C|\),
because \(\|S\|_{\rm op}\le\sqrt3\).
Consequently (6) and the E14 relative curvature estimate imply
\[
 |A_t|_{\widehat g,\delta}\le72\sqrt3 K|T|,\qquad
 |F_t|_{\widehat g,\delta}\le4512\sqrt3 K\mathcal G .
 \tag{7}
\]
The last inequality uses
\(|F_t|\le\|S\|_{\rm op}|S^{-1}F_t|\). Converting the
one-form and two-form norms to \(g_0\), respectively, and applying
Cauchy–Schwarz in time gives
\[
 \begin{aligned}
 \int_0^{T_\star}\|A_t\|_{C^0(g_0,\delta)}\,dt
 &\le 72\sqrt3 K e^{a_\star/2}\sqrt{T_\star J_\star},\\
 \int_0^{T_\star}\|F_t\|_{C^0(g_0,\delta)}\,dt
 &\le 4512\sqrt3 K e^{a_\star}J_\star.
 \end{aligned}
 \tag{8}
\]
For the first line,
\(\int \sup_M|T|\,dt\le \sqrt{T_\star\int\sup_M|T|^2dt}
\le\sqrt{T_\star J_\star}\). No smallness or pinching
premise from the previous section is used.

## Continuous limits and curvature compatibility

Write \(A_{\rm ref}=A(0)\), \(F_{\rm ref}=F(0)\), and
\(\alpha(t)=A(t)-A_{\rm ref}\), a global adjoint-valued
one-form. The tail integrals in (8) tend to zero. By the
fundamental theorem of calculus on compact subintervals, the
families \(\alpha(t)\) and \(F(t)\) are Cauchy in the fixed
sup norms as \(t\uparrow T_\star\). Completeness gives
uniform limits \(\alpha_\star\) and \(F_\star\), continuous
in space. Define the continuous connection coefficients
by \(A_\star=A_{\rm ref}+\alpha_\star\) in fixed smooth
bundle trivializations.

For every \(t<T_\star\) one has
\[
 F(t)=F_{\rm ref}+d_{A_{\rm ref}}\alpha(t)
                          +\tfrac12[\alpha(t)\wedge\alpha(t)] .
\]
Uniform convergence implies distributional convergence under
the first-order linear operator with smooth coefficients
\(d_{A_{\rm ref}}\). The quadratic term converges uniformly
by continuity of the wedge and bracket. Testing against
compactly supported smooth local test forms and passing to the
limit gives
\[
 F_\star=F_{\rm ref}+d_{A_{\rm ref}}\alpha_\star
                          +\tfrac12[\alpha_\star\wedge\alpha_\star]
 \qquad\text{in distributions.}
 \tag{9}
\]
In particular the distributional curvature of the limiting
connection is represented by the continuous two-form \(F_\star\).

The wedge products converge uniformly. Thus
\(\mu_\star=\tfrac13\sum_i F_{\star i}\wedge F_{\star i}
=\mu(0)>0\), pointwise, and the normalized Gram endomorphisms
\(Q(t,x)\) converge uniformly to
\[
  (Q_\star)_{ij}=(F_{\star i}\wedge F_{\star j})/\mu(0).
\]
The quadratic-form inequality (1) passes to the limit and yields
\[
 Q_\star(x)\ge e^{-a_\star}Q(0,x)
            \ge e^{-a_\star}\min_M\lambda_{\min}(Q(0))\, I>0.
 \tag{10}
\]
The positive wedge Gram matrix gives a strictly definite limiting
curvature in the same prescribed base orientation. The
round-compatible curvature-map sign also persists, since it is
locally constant on the open definite region and the limiting
curvature stays there. The algebraic reconstruction is continuous
on this region. Applying it to the uniform curvature limit on
compact \(M\) also gives uniform convergence to a continuous
positive metric in the same volume normalization.

On overlaps of fixed smooth local orthonormal frames, the
connection matrices transform by the usual affine rule with the
same fixed inhomogeneous differential term for \(A(t)\) and
\(A_{\rm ref}\). Their difference and \(F(t)\) transform
homogeneously by the internal isometry. The limits obey the same
rules, and multiplication by smooth transition matrices and
covariance of \(d_{A_{\rm ref}}\) preserve the distributional
identity (9). Thus these statements also hold after any fixed
smooth internal gauge change. The estimates are in a fixed
base and bundle comparison.

The endpoint data have continuous coefficients and continuous
distributional curvature. Their differentiability in a gauge
suitable for restarting the parabolic problem, higher-derivative
control approaching the endpoint, and smooth continuation remain
unresolved by these estimates.
