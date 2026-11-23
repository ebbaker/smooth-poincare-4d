# SP4-CME-E10 — shrinking definite perturbations of the round connection

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This executes the [frozen E10 request](../research-progress/handoffs/SP4-CME-E10_REQUEST_v1.md)
under the [B09 decision](../brainstorm/notes/B09_CONCENTRATED_INITIAL_DATA_20261122.md).
Frozen input hashes are in the [packet return](../research-progress/handoffs/SP4-CME-E10_RETURN_v1.md).
The evidence is one exact closed-bundle family and its spatial scaling.

## The global connection and exact center curvature

Use the smooth standard oriented round \((S^4,g_0)\) of sectional curvature
\(K=1\). The oriented Euclidean rank-three bundle is \(E=\Lambda^+_{g_0}\) with
its bracket-normalized chiral connection \(A_0\). In the manuscript's
orthonormal internal frames \([e_i,e_j]=\epsilon_{ijk}e_k\) and
\(F_{0i}=-\Sigma_i\), where the round self-dual two-forms have
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{g_0}\). Fix positively oriented
geodesic coordinates \(x\) on a ball about \(p=0\), and radially transport an
oriented orthonormal bundle frame at \(p\) using \(A_0\). The reference
coefficients are smooth, \(A_0(p)=0\), and \(|A_0(x)|\le C|x|\) on a sufficiently
small closed coordinate ball. Fix \(0<\epsilon_0\le1\) with the closed
coordinate ball of radius \(2\epsilon_0\) in this chart.

Choose one smooth \(\chi\in C_c^\infty(B_1(0))\) with \(\chi=1\) near zero
and put \(c=(1,-1,0)\). In the rescaled variable \(y\) set
\[
 a_i(y)=-\tfrac12 c_i\chi(y)\sum_{a,b}\Sigma_{i,ab}(p)y^a\,dy^b.
\]
For \(0<\epsilon\le\epsilon_0\) and a fixed \(0<\delta<1\) to be made
small, define \(b_\epsilon=\delta\epsilon\sum_{i,b}a_{i,b}(x/\epsilon)
\,dx^b\otimes e_i\) in the specified local trivialization. Extend it by zero,
which is smooth because the profile vanishes on a neighborhood of the
boundary of the unit ball. The global connection is
\(A_\epsilon=A_0+b_\epsilon\) on the same bundle. The parameters label
static data.

Use \(\Sigma_i(p)=\tfrac12\sum_{a,b}\Sigma_{i,ab}(p)dx^a\wedge dx^b\) for
antisymmetric components. At \(y=0\), this gives
\(da_i(0)=-c_i\Sigma_i(p)\) under the coordinate identification. In the
\(x\) chart differentiation of the scaled coefficients gives
\(d b_{\epsilon,i}(p)=-\delta c_i\Sigma_i(p)\). Since
\(b_\epsilon(p)=A_0(p)=0\), the bracket terms have zero contribution at
\(p\), so the curvature is exactly
\[
 F_{\epsilon,i}(p)=-(1+\delta c_i)\Sigma_i(p).
 \tag{1}
\]
With \(\mu_\epsilon=\tfrac13\sum_iF_{\epsilon,i}\wedge F_{\epsilon,i}\),
let \(Q_\epsilon\) be the matrix defined by
\(F_{\epsilon,i}\wedge F_{\epsilon,j}=(Q_\epsilon)_{ij}\mu_\epsilon\). At the
center, (1) yields
\[
 (Q_\epsilon)_{ij}(p)=\frac{3(1+\delta c_i)^2}{3+2\delta^2}\delta_{ij},
 \qquad
 D_\epsilon(p)=\sqrt{\frac{\lambda_{\max}}{\lambda_{\min}}}
             =\frac{1+\delta}{1-\delta}>1.
 \tag{2}
\]
Both extremes are the entries with \(c_i=1\) and \(c_i=-1\) since
\(0<\delta<1\). For \(q_\epsilon=Q_\epsilon-I\), the exact defect size is
\[
 |q_\epsilon(p)|^2
    =\frac{6\delta^2(12+\delta^2)}{(3+2\delta^2)^2}>0.
 \tag{3}
\]
The two-form shapes at \(p\) in (1) are still round self-dual, and the
representative with \(dV_{\widehat g_\epsilon}=\mu_\epsilon/2\) satisfies
\(\widehat g_\epsilon(p)=\sqrt{1+2\delta^2/3}\,g_0(p)\).

## Uniform definiteness, metric comparability and derivatives

Work first with coordinate component norms on the closed chart, all uniformly
equivalent to the reference metric norms. Constants in the following upper
bounds depend only on this chart and the one fixed profile. On \(|x|<\epsilon\),
the chain rule yields
\[
 |b_\epsilon|\le C\delta\epsilon,\qquad
 |\partial b_\epsilon|\le C\delta,\qquad
 |\partial^2b_\epsilon|\le C\delta/\epsilon .
\]
The curvature difference \(\Delta F=F_\epsilon-F_0\) is
\(db_\epsilon+[A_0\wedge b_\epsilon]+\tfrac12[b_\epsilon\wedge b_\epsilon]\).
The second and third terms are \(O(\delta\epsilon^2)\) and
\(O(\delta^2\epsilon^2)\) there, since \(A_0=O(\epsilon)\). Their first
coordinate derivatives are \(O(\delta\epsilon)\) and
\(O(\delta^2\epsilon)\), by smoothness of \(A_0\) and the first derivative
bound on \(b_\epsilon\). Thus, for \(\delta,\epsilon\le1\),
\[
 |\Delta F|\le C\delta,\qquad |\partial\Delta F|\le C\delta/\epsilon.
 \tag{4}
\]
Both differences vanish outside the perturbation support. The same estimates
hold uniformly along the line from \(A_0\) to \(A_\epsilon\), by replacing
\(\delta\) with \(s\delta\), \(s\in[0,1]\).

The wedge Gram relative to \(2dV_{g_0}\) is
\(M_{ij}(F)=F_i\wedge F_j/(2dV_{g_0})\) and \(M(F_0)=I\). Its smooth quadratic
formula and (4) give \(|M(F_\epsilon)-I|\le C\delta\). Uniform positivity
therefore holds for sufficiently small fixed \(\delta\), including along
the whole line of connections. These remain in the round-positive component.
The quotient \(Q=3M/\operatorname{tr}M\) then yields a uniform
\(|q_\epsilon|\le C\delta\), and one can require \(|q_\epsilon|\le1/16\)
by reducing the one fixed \(\delta\). This ensures the E05 pinching range and
a uniform definite margin. The same argument applies outside the ball
with \(q_\epsilon=0\).

For the reconstruction, the self-dual projection of the curvature plane
onto \(\Lambda^+_{g_0}\) is invertible uniformly near \(F_0\). In smooth local
round chiral coframes, the plane is its graph over \(\Lambda^+_{g_0}\) with
small graph matrix. The trace-free metric variable with volume \(dV_{g_0}\)
is a smooth function of that graph, by the explicit analytic inverse in
[E01A, §1](../reviews/E01A_AUDIT_20261122.md#1-positive-planes-and-reconstruction).
Multiplying this metric by the positive scalar
\((\mu_\epsilon/(2dV_{g_0}))^{1/2}\) gives the reconstructed representative.
Thus reconstruction and the quotient can each be written as smooth maps
\(G(x,F)\) on a fixed compact tube about \((x,F_0(x))\) in the coordinate
and gauge chart. The tube is chosen inside the definite neighborhood.
Their first and second derivatives in the local variables are bounded on
it and \(G(x,F_0(x))\) equals the corresponding round value. Consequently
(4) and the mean-value bound give
\[
 |\widehat g_\epsilon-g_0|\le C\delta,
 \qquad |\partial(\widehat g_\epsilon-g_0)|+|\partial q_\epsilon|
       \le C\delta/\epsilon .
 \tag{5}
\]
For the derivative in (5), the difference of the two chain rules consists
of \(D_FG(x,F_\epsilon)\partial\Delta F\), of the difference of the \(D_FG\)
factors paired with the bounded \(\partial F_0\), and of the difference of
the explicit \(x\) derivatives. The last two are \(O(\delta)\). This accounts
for the spatial dependence of the reference coframes and reconstructed
metric. For a sufficiently small fixed \(\delta\) the metrics, volume
forms and relevant form norms are uniformly comparable to the round
ones, for example \(g_0/2\le\widehat g_\epsilon\le2g_0\). This comparability
is an estimate of the metric values. The first derivative estimate has
explicit inverse-radius dependence.

## Energy and squared speed

At \(K=1\), \(\mu_\epsilon=2dV_{\widehat g_\epsilon}\). The nonzero part of
\(q_\epsilon\) is contained in the coordinate ball \(B_\epsilon\), whose
volume in \(\widehat g_\epsilon\) is \(O(\epsilon^4)\) by uniform comparison
with round normal coordinates. Thus
\[
 \mathcal P(A_\epsilon)=\int_{S^4}|q_\epsilon|^2\mu_\epsilon
          \le C\delta^2\epsilon^4 .
 \tag{6}
\]
The total \(V_\mu=\int\mu_\epsilon=16\pi^2/3\) is independent of the
parameters. Along the affine path \(A_0+s b_\epsilon\), its derivative
vanishes by Stokes' theorem because the volume derivative is
\((2/3)d\sum_i (b_\epsilon)_i\wedge F_i\). Evaluation at \(A_0\) gives
\(2\operatorname{Vol}(S^4,g_0)=16\pi^2/3\). The normalized energy
\(\mathcal P/V_\mu\) has the same scaling as (6).

Evaluate the actual unadjusted flow vector field at each fixed connection.
Write \(R=q-|q|^2I/6\), \(v=-4d_A^{*_{\widehat g}}(RF)\). The self-duality of
\(RF\) throughout the reconstructed geometry and the Bianchi identity
reduce it exactly to
\[
 v=4*_{\widehat g}[(d_A R)\wedge F].
 \tag{7}
\]
This reduction is performed before differentiation of any local formula
for \(*_{\widehat g}\). It accounts for the varying metric, as in
[E07](09_DISSIPATION_KERNEL_20261122.md). The covariant derivative of \(Q\)
is \(\partial q+[A_\epsilon,q]\). The connection coefficients on
\(B_\epsilon\) are \(O(\epsilon)\), and (5) gives
\(|\nabla^{A_\epsilon}Q_\epsilon|\le C\delta/\epsilon\). The derivative of
\(R\) obeys the same bound, since \(q\) is uniformly small. The curvature is
bounded by (4), all pointwise tensor operations in (7) are bounded in the
uniformly comparable norms, and \(v=0\) outside \(B_\epsilon\). Therefore
\[
 |v(A_\epsilon)|_{\widehat g_\epsilon}\le C\delta/\epsilon,\qquad
 \|v(A_\epsilon)\|_{A_\epsilon}^2
 =\int_{S^4}|v(A_\epsilon)|_{\widehat g_\epsilon}^2\,dV_{\widehat g_\epsilon}
 \le C\delta^2\epsilon^2 .
 \tag{8}
\]
Here \(\|\cdot\|_A\) is the connection metric from the defect gradient.
The result uses the manuscript-normalized form of
[Fine v2, Proposition 4.2](https://arxiv.org/html/1111.5005v2#S4.SS1).

### Consistency with the integrated pinched estimate

The use of (6)–(8) is consistent with the independent
[E05 integrated inequality](07_PINCHED_ENERGY_GAP_20261122.md).
In fact the gradient integral on its right-hand side has scale
\(\epsilon^2\) for this family. To see this, examine the curvature
coefficient arrays in the fixed \(dx\) coframe at \(x=\epsilon y\), rather
than pulling the two-forms back by dilation. The arrays converge in
\(C^1(\overline B_1)\) to \(F_0(p)+\delta\, da(y)\) in the corresponding
coefficient frame. The difference comes from the variation of \(F_0\) and
bracket terms whose rescaled coefficient arrays are \(O(\delta\epsilon^2)\)
in \(C^1\) on this domain. The quotient \(\widetilde Q_\epsilon(y)=
Q_\epsilon(\epsilon y)\) therefore converges in \(C^1\) to a trace-three
smooth positive matrix profile \(Q_{\rm prof}\). It is anisotropic at zero
by (2) and equal to \(I\) on the annulus where \(a=0\), so
\(\int_{B_1}|\partial_y Q_{\rm prof}|^2dy>0\).
Moreover
\[
 \epsilon\nabla_x^{A_\epsilon}Q_\epsilon(\epsilon y)
   =\partial_y\widetilde Q_\epsilon(y)+
         \epsilon[A_\epsilon(\epsilon y),\widetilde Q_\epsilon(y)]
   \longrightarrow \partial_yQ_{\rm prof}(y).
\]
Metric and measure comparability then give
\(c_\delta\epsilon^2\le\int|\nabla^{A_\epsilon}Q_\epsilon|^2\mu_\epsilon
\le C_\delta\epsilon^2\) for all sufficiently small \(\epsilon\), with
\(c_\delta>0\) for this fixed nonzero \(\delta\). Likewise continuity and
(3) give a positive lower bound of order \(\epsilon^4\) for (6). These
statements compare only powers, with no leading coefficient prescribed.

At a single pinched connection E05's computation with tangent
\(a=v(A)\), together with the gradient identity, gives
\(\|v\|_A^2\ge 2\int|\nabla^A Q|^2\mu+36\mathcal P\) at \(K=1\).
This instantaneous form follows by evaluating the integration at the
initial tangent of any smooth definite path with that derivative, such as
an affine path for sufficiently small parameter. Neither the integration
nor the energy differentiation uses that path beyond its tangent. This
confirms that the \(\epsilon^2\) scale in (8) is compatible with the global
integrated gradient bound. There is no claim concerning a time interval of
pinching in this construction.

## Nonvanishing path cost and scope of the obstruction

For each fixed connection set \(T_X=\tfrac12(S^{-1}\nabla_X^A Q S^{-1})_0\),
\(S=Q^{1/2}\), and use the [E04 path cost](06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md)
\(C_T=\sup_{x,y}\inf_{\gamma:x\to y}\int|T_{\dot\gamma}|\). The static path
inequality from E04 is \(|\log D(x)-\log D(y)|\le\sqrt2\,c_T(x,y)\).
Choose any point \(y\) outside the chart ball, where the connection is
round and \(D(y)=1\). By (2),
\[
 C_T(A_\epsilon)\ge c_T(p,y)\ge
   \frac{1}{\sqrt2}\log\frac{1+\delta}{1-\delta}>0
 \tag{9}
\]
independently of \(\epsilon\). The supremum of \(|q_\epsilon|\) and of
\(D_\epsilon-1\) also has a fixed positive lower bound by (2)–(3).

Thus a universal static estimate using only
\(\big(\mathcal P(A),\|v(A)\|_A^2\big)\) and tending to zero as those two
integrals tend to zero cannot bound \(C_T\), \(\sup_X|q|\), or
\(\sup_X(D-1)\), even on the fixed standard bundle with uniform
metric comparability and the stated pinching. The example permits estimates
that use spatial scale, stronger regularity, spacetime quantities, or
properties of actual trajectories. It establishes neither a failure of
flow preservation nor the existence of a singular trajectory, and uses
no construction on an unknown smooth homotopy sphere.
