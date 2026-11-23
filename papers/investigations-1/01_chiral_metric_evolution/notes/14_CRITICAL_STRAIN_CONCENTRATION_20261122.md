# SP4-CME-E12 — logarithmic concentration at the critical spatial strain norm

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This executes the [frozen E12 request](../research-progress/handoffs/SP4-CME-E12_REQUEST_v1.md)
under the [B11 decision](../brainstorm/notes/B11_CRITICAL_SPATIAL_NORM_20261122.md).
Input identities are in the [return](../research-progress/handoffs/SP4-CME-E12_RETURN_v1.md).
The evidence is one analytic construction of smooth closed-bundle connections.

## Family and exact center data

Take the standard smooth oriented round \((S^4,g_0)\) with \(K=1\) and the
oriented real rank-three chiral bundle \(E=\Lambda^+_{g_0}\), with the
manuscript's internal norm and \([e_i,e_j]=\epsilon_{ijk}e_k\).
The round connection is \(A_0\), with \(F_{0i}=-\Sigma_i\) in the
normalized round self-dual basis, where
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{g_0}\).
Use the geodesic coordinates \(x\) about \(p=0\) and round radial gauge
from [E10](12_CONCENTRATED_INITIAL_DATA_20261122.md). In this fixed local
trivialization \(A_0(p)=0\), \(A_0=O(r)\), \(\partial A_0=O(1)\) and
\(\partial F_0=O(1)\) on a fixed sufficiently small closed coordinate ball,
with \(r=|x|\). Reference coordinate and \(g_0\) tensor norms are uniformly
comparable there.

Let \(L\ge2\), restricting to the tail for which \(\rho_L=e^{-L}\)
lies inside the chart if necessary. Fix the prescribed smooth
\(\eta:\mathbb R\to[0,1]\) with \(\eta=0\) for \(z\le1/4\) and \(\eta=1\) for
\(z\ge3/4\). Put \(z_L(r)=\log(\rho_L/r)/L\) and
\(\chi_L(r)=\eta(z_L(r))\). The active radii are
\[
 r_{\mathrm{in}}=\rho_L e^{-3L/4}=e^{-7L/4},
 \qquad r_{\mathrm{out}}=\rho_L e^{-L/4}=e^{-5L/4}.
\]
Thus \(\chi_L\) is identically one on the inner core \(r\le r_{\mathrm{in}}\)
and identically zero for \(r\ge r_{\mathrm{out}}\). The annulus between them
has logarithmic length \(\log(r_{\mathrm{out}}/r_{\mathrm{in}})=L/2\).
The cutoff is constant near the origin and smooth across both annulus
boundaries by the prescribed smooth plateaus.

For \(c=(1,-1,0)\) let \(P_i=-c_i\sum_{a,b}\Sigma_{i,ab}(p)x^a dx^b/2\)
in the fixed internal frame, and set \(a_L=\delta\chi_L P\) for one fixed
\(0<\delta<1\) to be made small. The perturbation is an \(E\)-valued one-form,
smooth after extension by zero outside the coordinate chart. Hence
\(A_L=A_0+a_L\) is an actual smooth connection on the original closed bundle.
The constituents obey \(|P|\le Cr\), \(|\partial P|\le C\),
\(\partial^2P=0\), and \(dP_i=-c_i\Sigma_i(p)\). At the center \(a_L=0\) and
\(da_L=-\delta(c_i\Sigma_i(p))_i\). The curvature, wedge quotient, distortion,
and nonzero defect there are exactly as in E10:
\[
 \begin{aligned}
 F_{Li}(p)&=-(1+\delta c_i)\Sigma_i(p),&
 (Q_L)_{ij}(p)&=\frac{3(1+\delta c_i)^2}{3+2\delta^2}\delta_{ij},\\
 D_L(p)&=\sqrt{\lambda_{\max}(Q_L(p))/\lambda_{\min}(Q_L(p))}
        =\frac{1+\delta}{1-\delta},&
 |q_L(p)|^2&=\frac{6\delta^2(12+\delta^2)}{(3+2\delta^2)^2}>0.
 \end{aligned}
 \tag{1}
\]
Here \(q_L=Q_L-I\). All center values are independent of \(L\).

## Cutoff derivatives, curvature and reconstructed geometry

All estimates below use constants depending on the fixed chart and cutoff,
independent of \(L\) and of \(0<\delta\le1\). The coordinate radial derivatives
on the annulus obey
\[
 \chi_L'(r)=-\frac{\eta'(z_L)}{Lr},
 \qquad \chi_L''(r)=\frac{\eta''(z_L)}{L^2r^2}
                        +\frac{\eta'(z_L)}{Lr^2}.
\]
The Euclidean coordinate Hessian of a radial function consists of its
radial second derivative and the tangential term \(\chi_L'/r\). Therefore
\[
 |\partial\chi_L|\le \frac{C}{Lr},
 \qquad |\partial^2\chi_L|\le\frac{C}{Lr^2}
 \quad(r_{\mathrm{in}}<r<r_{\mathrm{out}}),
 \tag{2}
\]
and both derivatives vanish on the core and exterior. In particular
\(|a_L|\le C\delta r\) and \(|\partial a_L|\le C\delta\) on the support.
The curvature difference is
\[
 \Delta F=F_L-F_0
      =\delta(\chi_L dP+d\chi_L\wedge P)
        +[A_0\wedge a_L]+\tfrac12[a_L\wedge a_L].
 \tag{3}
\]
The term \(d\chi_L\wedge P\) is \(O(1/L)\) before multiplication by \(\delta\),
and the brackets are \(O(\delta r^2)\) and \(O(\delta^2r^2)\), respectively.
Thus \(|\Delta F|\le C\delta\).

For clarity, each differentiated cutoff term in (3) is controlled on the
annulus. The derivative of \(\chi_L dP\) is
\((\partial\chi_L)dP\) because \(dP\) is constant. The derivative of
\(d\chi_L\wedge P\) includes both \(\partial(d\chi_L)\wedge P\), bounded by
\((C/(Lr^2))Cr\), and \(d\chi_L\wedge \partial P\), bounded by \(C/(Lr)\).
Together these terms are bounded by \(C/(Lr)\) before multiplication by
\(\delta\). The first bracket derivative consists of
\([\partial A_0\wedge a_L]+[A_0\wedge\partial a_L]\), both \(O(\delta r)\).
The differentiated quadratic bracket is \(O(\delta^2r)\). Thus on the
three regions,
\[
 |\partial\Delta F|\le
 \begin{cases}
 C\delta r,&r\le r_{\mathrm{in}},\\
 C\delta\big((Lr)^{-1}+r\big),&r_{\mathrm{in}}<r<r_{\mathrm{out}},\\
 0,&r\ge r_{\mathrm{out}} .
 \end{cases}
 \tag{4}
\]
In the core the linear part of the curvature difference is exactly
\(\delta dP\), so only the brackets in (3) contribute to its derivative.
In the exterior the connection is identically round.

The wedge Gram \(M(F)_{ij}=F_i\wedge F_j/(2dV_{g_0})\) is \(I\) at the round
curvature. Equation (3) and the quadratic Gram formula yield
\(|M(F_L)-I|\le C\delta\). For one sufficiently small fixed \(\delta>0\),
all these curvatures are uniformly definite. The same estimates hold
along the straight segment \(A_0+s a_L\), \(0\le s\le1\), showing the
curvature-map sign remains the round sign. The normalized quotient
\(Q_L=3M(F_L)/\operatorname{tr}M(F_L)\) satisfies \(|q_L|\le C\delta\).
Shrink the fixed \(\delta\) once to arrange \(|q_L|\le1/16\) globally.
In particular \(m_L=\lambda_{\min}(Q_L)\ge15/16\).

The metric is reconstructed from the positive graph over \(\Lambda^+_{g_0}\)
and the positive scale determined by
\(dV_{\widehat g_L}=\mu_L/2\), with \(\mu_L=\sum_iF_{Li}\wedge F_{Li}/3\).
As in the [E10 reconstruction check](12_CONCENTRATED_INITIAL_DATA_20261122.md#uniform-definiteness-metric-comparability-and-derivatives),
the quotient and metric are smooth maps \(G(x,F)\) on a fixed compact tube
near \(F_0\) in the chart and internal frame. This follows from the smooth
graph inverse within the wedge-positive cone and the smooth volume
factor. First and second derivatives of \(G\) are bounded on the tube,
and \(G(x,F_0(x))\) gives \(I\) or \(g_0(x)\), respectively. Thus
\[
 |\widehat g_L-g_0|\le C\delta,\qquad
 |\partial(\widehat g_L-g_0)|+|\partial q_L|
     \le C\bigl(|\Delta F|+|\partial\Delta F|\bigr).
 \tag{5}
\]
The derivative bound follows by subtracting the two chain rules:
\(D_FG(x,F_L)\partial\Delta F\), the difference of \(D_FG\) paired with
\(\partial F_0\), and the difference of explicit \(x\) derivatives.
This includes the dependence on the reference metric and coframes.
For the fixed choice of sufficiently small \(\delta\), the reconstructed
metrics obey \(g_0/2\le\widehat g_L\le2g_0\). This bounds the changes of
base tensor norms and volume densities in the chart uniformly in \(L\).

Since \(\nabla^{A_L}Q_L=\partial q_L+[A_L,q_L]\), and \(A_L=O(r)\) on the
support, equations (4)–(5) show, in the instantaneous reconstructed norm,
\[
 |\nabla^{A_L} Q_L|\le
 \begin{cases}
 C\delta,&r\le r_{\mathrm{in}},\\
 C\delta\big(1+(Lr)^{-1}\big),&r_{\mathrm{in}}<r<r_{\mathrm{out}},\\
 0,&r\ge r_{\mathrm{out}} .
 \end{cases}
 \tag{6}
\]
In the exterior the covariant derivative is zero also away from the chart,
because \(Q_L=I\) there. The metric estimate (5) has the same support and
radial bound for the derivative of the difference. No uniform
derivative bound as \(L\to\infty\) is assumed.

## Fourth powers, energy and pointwise speed on the slice

Define the tensor \(T_X=\tfrac12(S_L^{-1}\nabla_X^{A_L}Q_L S_L^{-1})_0\),
with \(S_L=Q_L^{1/2}\) and trace-free projection in the internal Frobenius
pairing. Use the Hilbert–Schmidt norm on this one-form with values in
symmetric matrices, using \(\widehat g_L\) on the one-form index.
Orthogonal trace-free projection and the definite margin give
\[
 |T|\le \frac{1}{2m_L}|\nabla^{A_L} Q_L|.
 \tag{7}
\]
In particular the same fourth-power integral estimate applies to both
tensors. The real whole-fiber \(L^2\) remainder has squared norm
\((4\pi/5)|T_X|^2\) per direction, so these estimates also bound its fourth
power after summing the squared norms over a reconstructed orthonormal
coframe. [E03 remainder normalization](05A_REAL_TWISTOR_COMPARISON_20261122.md#holomorphic-projection-and-moments).

The coordinate volume is comparable to \(r^3dr\) times the angular measure.
The core contributes at most \(C\delta^4 r_{\mathrm{in}}^4\) to
\(\int |\nabla^{A_L}Q_L|^4\,dV_{\widehat g_L}\), and the exterior contributes
zero. On the annulus the constant part of (6) contributes at most
\(C\delta^4 r_{\mathrm{out}}^4\). Using \((a+b)^4\le8(a^4+b^4)\) and (6),
the singular part contributes at most
\[
 C\frac{\delta^4}{L^4}
   \int_{r_{\mathrm{in}}}^{r_{\mathrm{out}}}\frac{dr}{r}
   =\frac{C\delta^4}{2 L^3}.
\]
Consequently
\[
 \int_{S^4}\bigl(|\nabla^{A_L}Q_L|^4+|T|^4\bigr)\,dV_{\widehat g_L}
       \le C\delta^4\bigl(L^{-3}+e^{-5L}\bigr).
 \tag{8}
\]
Here \(r_{\mathrm{out}}^4=e^{-5L}\), which also bounds the core fourth
power of the radius. The bound holds with the stated uniform geometric
comparison and tends to zero for fixed \(\delta\).

The defect energy satisfies
\(\mathcal P(A_L)\le C\delta^2 r_{\mathrm{out}}^4\), since the perturbation
is supported in that ball and \(\mu_L=2dV_{\widehat g_L}\). Its total
\(V_\mu=16\pi^2/3\) is the same fixed-bundle integral as in E10, so the
normalized defect energy obeys the same bound. To evaluate the actual
unadjusted flow vector field at the slice, write \(R=q-|q|^2I/6\).
Since \(RF\) is self-dual for \(\widehat g_L\), Bianchi gives
\[
 v(A_L)=4*_{\widehat g_L}[(d_{A_L}R)\wedge F_L].
\]
This is the same exact reduction of the normalized equation used in E10.
Bounded curvature and \(q_L\) give \(|v(A_L)|\le C|\nabla^{A_L}Q_L|\) and
the same support. Squaring (6), the annular singular term now integrates
as \(L^{-2}\int_{r_{\mathrm{in}}}^{r_{\mathrm{out}}}r\,dr\).
The other terms are bounded by the support volume. Thus
\[
 \|v(A_L)\|_{A_L}^2
 =\int_{S^4}|v(A_L)|^2\,dV_{\widehat g_L}
 \le C\delta^2\left(\frac{r_{\mathrm{out}}^2}{L^2}
                        +r_{\mathrm{out}}^4\right)\longrightarrow0 .
 \tag{9}
\]
This is the squared instantaneous speed of the gradient vector field
evaluated at these connections.

## Path cost and precise static obstruction

With \(C_T\) the supremum of the infimum of the path integrals
\(\int|T_{\dot\gamma}|\), use the
[E04 path comparison](06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md#path-estimate-including-repeated-eigenvalues).
For any exterior point \(y\), \(D_L(y)=1\) and
\(|\log D_L(p)-\log D_L(y)|\le\sqrt2\,c_T(p,y)\le\sqrt2 C_T\).
Equation (1) gives the fixed lower bound
\[
 C_T(A_L)\ge\frac{1}{\sqrt2}\log\frac{1+\delta}{1-\delta}>0.
\]
The two suprema \(\sup|q_L|\) and \(\sup(D_L-1)\) also have fixed positive
lower bounds. Thus on the fixed round chiral bundle, even in a uniformly
definite pinched class with reconstructed metrics uniformly comparable
to \(g_0\), no universal single-slice bound tending to zero with
\(\|T\|_{L^4(\widehat g)}\), \(\mathcal P\), and \(\|v\|_A^2\) together can
bound these three quantities. The same example applies when
\(\|\nabla^A Q\|_{L^4(\widehat g)}\) is substituted for the strain norm or
added to those inputs. The data vary by the spatial concentration
parameter \(L\). A claim about an evolved solution, critical spacetime
quantities, parabolic regularity, or other stronger critical norms would
require additional arguments.
