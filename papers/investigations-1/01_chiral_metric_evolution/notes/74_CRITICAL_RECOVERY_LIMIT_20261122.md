# SP4-CME-E74 — Critical control of the recovery and its limiting automorphism

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. Six frozen digests matched
the [request][req] before use. I authored E63 and the earlier E50
recovery transfer. Here I use E63 with its E67 audit and derive the
recovery estimate and limiting argument. See [B45][b45] and the
[return][ret].

## Setting and statement

Fix the oriented standard round \(S^4\), its positive perfect
chiral \(A_0\), and the associated compact principal \(SO(3)\) bundle
\(P\). Use the native \(g_0=g(F_0)\), the fixed internal negative
Killing pairing, the reference derivative \(D_0\) induced by
\(A_0,g_0\), and native time \(\tau\) throughout. Write \(F_0=F_{A_0}\).
Fix an integer \(m\ge6\). For smooth compatible initial data set
\[
 U_{\rm in}=(A_{\rm in}-A_0,F_{A_{\rm in}}-F_0),\qquad
 \delta=\|U_{\rm in}\|_{\mathcal B^{1/2}},
\]
using the exact E60/E62 fixed localized \(B^{1/2}_{8,1}\) norm.
For sufficiently small \(\delta\), E60 supplies the smooth
compatible adjusted pair \((\widehat A,F_{\widehat A})\) on the
common interval, with \(E_{T_{\rm crit}}(U)\le C_{\rm crit}\delta\)
and the E42 identification. Take E62's fixed positive splice
time \(\tau_0=\tfrac14\min(T_{\rm crit},T_{42},1,c_K)\) with
\(c_K=2K\) as there, so
\(I=[\tau_0/2,2\tau_0]\subset (0,T_{42})\) and
\(2\tau_0<T_{\rm crit}\).
Let \(B(u)\) be the stable adjusted connection from
\(B(0)=\widehat A(\tau_0)\), \(u=\tau-\tau_0\). E63 with \(k=m\),
the stationary reference, and the localized \(C^0\) bound give
\(\|B(0)-A_0\|_{H^m}\le K_m\delta\).
Thus, after a fixed smallness restriction, E49 gives
\[
 q_b(u):=\|B(u)-A_0\|_{H^m}\le
                 C_{\rm st}K_m\delta e^{-\alpha u},\qquad u\ge0.     \tag{1}
\]
These are the thresholds and estimates verified in E67.
[E60][e60] · [E62 (1)–(7)][e62] · [E63 (1)][e63] ·
[E49 (1)–(2)][e49] · [E67, combined budget][e67].

For either smooth adjusted path, the recovery in E62 flows
\(j\) by \(\dot j=-\xi\circ j\) and uses \(g=j^{-1}\) in the
left action \(g\cdot A=(g^{-1})^*A\). We prove that the
piecewise vector field \(W=-\xi\) of that direct ODE satisfies
\[
 \int_0^\infty \|W(\tau)\|_{C^1(P)}\,d\tau\le C\delta,              \tag{2}
\]
in a fixed compact-bundle norm. This refers to the vector field
used to solve for \(j\). The conjugated right velocity
\(\dot g\circ g^{-1}=\operatorname{Ad}_g\xi\) is a different
field. Our estimates give \(C^1\) limits \(j_\infty\) and
\(g_\infty=j_\infty^{-1}\), both \(O(\delta)\) from identity in
a fixed \(C^1\) neighborhood. In the E62 splice, the original
connection–curvature pair tends in \(C^0\) to
\(j_\infty^*(A_0,F_0)\). Its curvature is interpreted weakly
below. These conclusions are for smooth compatible data on
this fixed round bundle. [E62 (6)–(7)][e62] · [E67, splice][e67].

## The local generator in fixed bundle charts

On the compatible local graph write
\(a=\widehat A-A_0\), \(\beta=F_{\widehat A}-F_0\), and
\(h_\ell=\|D_0^\ell(a,\beta)\|_\infty\) for \(0\le\ell\le2\).
In this calculation let \(A=\widehat A\), \(g=g(A)\) be the
native reconstructed metric, and \(S_A(Y)=\iota_Y F_A\).
The adjoint \(S_A^*\) has the live base metric and fixed internal
pairing. In the sign convention of (2), E62 gives
\[
 W_{\rm loc}=\phi+\chi_A(Y),\qquad
 \phi=d_A^{*g_0}a,\qquad Y=S_A^*d_A^{*g}\eta,\qquad \eta=d_A a .
                                                                         \tag{3}
\]
The value tube is chosen uniformly by shrinking the critical
datum threshold, and we use \(h_0\le\rho\le1\).
The curvature identity with the bracket wedge convention is
\[
 F_A-F_0=d_{A_0}a+\tfrac12[a\wedge a],\qquad
 \eta=\beta+\tfrac12[a\wedge a].                                    \tag{4}
\]
The second equality uses \(d_A a=d_{A_0}a+[a\wedge a]\).
The reference bracket and exterior algebra maps are parallel,
so through two derivatives (4) gives
\[
 \|\eta\|_\infty\le Ch_0,\quad
 \|D_0\eta\|_\infty\le Ch_1,\quad
 \|D_0^2\eta\|_\infty\le C(h_2+h_1^2).                              \tag{5}
\]
All tensor norms here are fixed native reference norms.

For an \(E\)-valued form \(\omega\) the codifferential is
\((d_A^{*g}\omega)_{i_2\cdots i_k}
=-g^{ij}(\nabla_i^{A,g}\omega)_{j i_2\cdots i_k}\).
For the fixed metric part of (3) this gives exactly
\[
 \phi=-g_0^{ij}\big((D_0)_i a_j+[a_i,a_j]\big)
       =-g_0^{ij}(D_0)_i a_j .                                    \tag{6}
\]
The bracket contraction vanishes by symmetry. In particular
\(\|\phi\|_\infty\le Ch_1\) and
\(\|D_0\phi\|_\infty\le Ch_2\).
For the live part write \(L=\Gamma(g)-\Gamma(g_0)\).
All base covector slots contribute:
\[
 \begin{split}
 (d_A^{*g}\eta)_k
 &=-g^{ij}\big((D_0)_i\eta_{jk}+[a_i,\eta_{jk}]
             -L^p{}_{ij}\eta_{pk}-L^p{}_{ik}\eta_{jp}\big),\\
 L^p{}_{ij}
 &=\tfrac12 g^{pq}\big((D_0)_i g_{jq}+(D_0)_j g_{iq}
                                    -(D_0)_q g_{ij}\big).
 \end{split}                                                       \tag{7}
\]
The algebraic reconstruction of \(g\) from \(F_0+\beta\) is
smooth on the fixed small tube, with inversion and adjoint
operations smooth there. The parallel reference \(F_0,g_0\)
and fixed internal pairing mean these derivatives can be
computed in reference-parallel frames. Consequently
\[
 \begin{gathered}
 \|g^{-1}\|_\infty+\|S_A^*\|_\infty\le C,\qquad
 \|D_0g\|_\infty+\|D_0g^{-1}\|_\infty+\|D_0S_A^*\|_\infty\le Ch_1,\\
 \|L\|_\infty\le Ch_1,\qquad
 \|D_0 L\|_\infty\le C(h_2+h_1^2).
 \end{gathered}                                                     \tag{8}
\]
E59 gives the smooth algebraic metric map and its first two
fiber derivatives with a fixed scale. The native scale is a
fixed comparison, as in E62. [E59 (1)–(3)][e59] · [E62 (3), (6)][e62].

For \(Z=d_A^{*g}\eta\), (5) and (7) give
\(\|Z\|_\infty\le C(h_1+h_0^2+h_0h_1)\).
In the derivative of (7), differentiating \(g^{-1}\) costs
\(Ch_1\) times the three bounds in the preceding expression.
Differentiating \(D_0\eta\) gives \(C(h_2+h_1^2)\).
Differentiating the bracket gives \(Ch_0h_1\).
Differentiating \(L\eta\) costs
\(C[h_0(h_2+h_1^2)+h_1^2]\).
Use \(h_0\le1\) and the derivative of \(S_A^*\) in (8) to get
\[
 \|Y\|_\infty\le C(h_0+h_1),\qquad
 \|D_0Y\|_\infty\le C(h_2+h_1^2+h_0h_1).                             \tag{9}
\]

Choose a finite collection of relatively compact local
trivializations of \(P\), using fixed smooth base sections and
fixed group charts with compactly contained subcharts on
\(SO(3)\). In the representation \(p=s(x)r\), with the right
principal action, a vertical section \(\phi(x)\) and the
horizontal lift give the vector field
\[
 W_{\rm loc}(x,r)=\big(Y(x),(\phi(x)-A_i(x)Y^i(x))r\big).
                                                                         \tag{10}
\]
Indeed the connection form in this trivialization is
\(\operatorname{Ad}_{r^{-1}}(A_i\,dx^i)+r^{-1}dr\).
The product by \(r\) in (10) denotes the matrix tangent
to the group, expressed in the fixed group charts. Those
conversion coefficients and their first derivatives are fixed
and bounded. On the chosen base supports, \(A_i=A_{0i}+a_i\).
All fixed connection and frame coefficients are bounded, and
the first coordinate derivatives of \(\phi,a,Y\) are their
reference derivatives plus fixed linear value terms. A base
derivative of \(A_iY^i\) costs at most
\(C[(1+h_0)(\|D_0Y\|_\infty+\|Y\|_\infty)+h_1\|Y\|_\infty]\).
Fiber derivatives in (10) cost the undifferentiated
\(\phi\) and \(A_iY^i\) terms. This proves
\[
 \|W_{\rm loc}(\tau)\|_{C^1(P)}
             \le C(h_0+h_1+h_2+h_1^2)                              \tag{11}
\]
using (6), (9) and \(h_0\le1\). We may take the norm as the
supremum of \(|W|+|\nabla^P W|\) for a fixed smooth metric
on \(P\), for example the one using \(g_0,A_0\) and the fixed
fiber pairing. This norm and the finite chart norms compare
by fixed constants. All terms in (11) vanish at the reference.
[E62 (6), native recovery][e62].

## Integration on the two intervals and splice order

Use the fixed localization of E60/E62 and write \(M,H\) for
the time supremum and integrated terms of the restricted path
norm on \([0,\tau_0]\). Its supported pieces \(v_\gamma\) are
extended by zero to the fixed torus. Bernstein and reconstruction
as in E59 give
\[
 h_\ell(\tau)\le C\sum_{\gamma,j}2^{(\ell+1/2)j}
           \|\Delta_j v_\gamma(\tau)\|_8,\qquad 0\le\ell\le 2.
\]
This comparison includes the inhomogeneous low block, the
connection coefficients and the cutoff derivatives. Summing
the time integrals gives
\(\int_0^{\tau_0}(h_0+h_1+h_2)\,d\tau\le CH\).
Taking the \(L^2\) norm in time of the \(\ell=1\) bound
and applying Minkowski gives the sum of
\(2^{3j/2}\|\Delta_j v_\gamma\|_{L^2_\tau L^8_x}\).
Each summand is bounded by
\[
 \big(2^{j/2}\sup_{\tau}\|\Delta_j v_\gamma\|_8\big)^{1/2}
 \big(2^{5j/2}\int_0^{\tau_0}\|\Delta_j v_\gamma\|_8\,d\tau\big)^{1/2}.
\]
Cauchy–Schwarz over \((\gamma,j)\) gives
\(\|h_1\|_{L^2_\tau}\le C\sqrt{MH}\).
The restricted \(M+H\le C_{\rm crit}\delta\), so (11) yields
\[
 \int_0^{\tau_0}\|W_{\rm loc}\|_{C^1(P)}\,d\tau
              \le C(H+MH)\le C'(\delta+\delta^2).                  \tag{12}
\]
The value tube bound used here follows from the same
Bernstein comparison at \(\ell=0\) and the \(M\) part.
[E59, (7)–(9)][e59] · [E60][e60] · [E62 (1)–(3)][e62].

For the stable branch put \(b=B-A_0\) and
\[
 W_{\rm st}=\delta_0 b+\chi_B(Y_{\rm st}),\qquad
       Y_{\rm st}=\Delta_0S_0^*b,                                  \tag{13}
\]
where \(\delta_0=d_{A_0}^{*g_0}\), \(\Delta_0\) and \(S_0^*\)
are fixed. The first term is vertical and first order; the
base field is second order with fixed smooth coefficients.
Their \(C^1\) bounds are at most \(C\|b\|_{C^3}\). The chart
formula (10) now has \(A_i=A_{0i}+b_i\); differentiating the
product with \(Y_{\rm st}\) adds at most \(C\|b\|_{C^3}^2\)
to the linear bound. In dimension four, for \(m\ge6\)
one has \(m-3>2\). On each fixed compactly supported chart,
Cauchy–Schwarz in Fourier inversion bounds derivatives
through order three by the \(H^m\) norm, since
\(\int_{\mathbb R^4}(1+|\xi|^2)^{-(m-3)}\,d\xi<\infty\).
Fixed chart and frame comparisons give the geometric
\(H^m\to C^3\) bound, so
\[
 \begin{split}
 \|W_{\rm st}(u)\|_{C^1(P)}&\le C(q_b(u)+q_b(u)^2),\\
 \int_s^\infty\|W_{\rm st}(u)\|_{C^1(P)}\,du
   &\le C\left(\frac{C_{\rm st}K_m}{\alpha}\delta e^{-\alpha s}
      +\frac{(C_{\rm st}K_m)^2}{2\alpha}\delta^2 e^{-2\alpha s}\right)
      \qquad(s\ge0).
 \end{split}                                                       \tag{14}
\]
There is no persistent reference term. Equations (12) and (14)
give (2) for \(\delta\le1\). No change of clock is needed in
this native recovery calculation.
[E49 (1)–(2)][e49] · [E62 (6)][e62] · [E67, stable tail][e67].

Write \(j_{\rm loc},j_{\rm st}\) for the solutions of the
direct ODEs with initial identity on their own intervals,
and \(g_{\rm loc}=j_{\rm loc}^{-1}\), \(g_{\rm st}=j_{\rm st}^{-1}\).
For \(c=g_{\rm loc}(\tau_0)\), the piecewise map is
\[
 j(\tau)=
 \begin{cases}
 j_{\rm loc}(\tau),&0\le\tau\le\tau_0,\\
 j_{\rm st}(\tau-\tau_0)\,c^{-1},&\tau\ge\tau_0,
 \end{cases}
 \qquad
 g(\tau)=j(\tau)^{-1}=c\,g_{\rm st}(\tau-\tau_0)
          \quad(\tau\ge\tau_0).                                    \tag{15}
\]
Composition is written from right to left. Indeed on the
tail \(j(\tau_0)=c^{-1}\) and the constant right factor
keeps \(\dot j=W_{\rm st}\circ j\) exact. Thus \(j\) is one
continuous flow map with the piecewise vector field \(W\)
and initial identity. The fields are smooth on each
piece and can change at the splice. The smoothness of the
recovered original connection at the splice follows from
E62's right-overlap uniqueness. That argument is separate
from time regularity of the chosen maps. [E62 (6)–(7)][e62] ·
[E67, original splice][e67].

## Compact-bundle \(C^1\) convergence and invertibility

Let \(\mathsf B=\int_0^\infty\|W\|_{C^1(P)}\,d\tau\).
For finite time, the compact-bundle flow of these smooth
piecewise fields is a smooth diffeomorphism in space.
One solves on successive time intervals, with the inverse
on each interval obtained by uniqueness for the reverse
finite-time equation. The fields (10), (13) are invariant
under the principal right action, so uniqueness makes
\(j(\tau)\) and \(g(\tau)\) equivariant at every finite time.
Their induced base maps are smooth and orientation
preserving, since they start at the identity along a
continuous path of smooth diffeomorphisms.

For a fixed metric on \(P\) as above, choose nested chart
sets \(V_i\Subset O_i\Subset U_i\) in the same charts, with
the \(V_i\) covering \(P\); use fixed coordinates \(x_i\)
on \(U_i\). Choose the larger sets and charts with
uniformly bounded coordinate comparisons on the compact
parts used below. For example insert a fourth chart subset
between \(\overline O_i\) and \(U_i\). The distance
\(d_P(j(\tau)(p),p)\) is bounded by the integral of
\(\|W\|_\infty\), hence by \(\mathsf B\). Shrink the fixed
datum threshold so this is less than the positive margins
from \(\overline V_i\) to \(P\setminus O_i\) and from
\(\overline O_i\) to the exterior of the additional subset.
Then all trajectories from \(O_i\) stay within compact
parts of the same \(U_i\). The same displacement bound
holds for \(g(\tau)\), by putting \(p=g(\tau)(q)\).

For \(p\in O_i\), write \(J_i(\tau,x_i(p))=x_i(j(\tau)p)\)
and \(P_i(\tau,p)=D_{x_i(p)}J_i(\tau,x_i(p))\).
Let \(W_i\) be the coordinate vector field on \(U_i\).
The exact derivative equation, piecewise in time, is
\[
 \dot J_i=W_i(\tau,J_i),\qquad
 \dot P_i=(DW_i)(\tau,J_i)P_i,\qquad P_i(0,p)=I .                   \tag{16}
\]
The coordinate coefficient is bounded by
\(C\|W\|_{C^1(P)}\). Integration and Grönwall give, uniformly
on all the \(O_i\),
\[
 \begin{gathered}
 |J_i(\tau,x_i(p))-x_i(p)|\le C\mathsf B,\qquad
 \|P_i(\tau,p)\|\le e^{C\mathsf B},\qquad
 \|P_i(\tau,p)-I\|\le e^{C\mathsf B}-1,\\
 \|J_i(t)-J_i(s)\|_\infty+\|P_i(t)-P_i(s)\|_\infty
       \le C e^{C\mathsf B}\int_s^t\|W(\tau)\|_{C^1(P)}\,d\tau
               \qquad(0\le s\le t).
 \end{gathered}                                                     \tag{17}
\]
These formulas hold across the splice by the integral
equation and continuity at \(\tau_0\).
The coordinate maps and their derivatives are therefore
uniformly Cauchy. The limiting coordinate maps are \(C^1\)
with the limiting derivatives, by integrating along segments
inside small coordinate balls and taking the uniform limits.
The charts agree by continuity of their transition functions.
This defines a global \(C^1\) map \(j_\infty\) and gives
\(C^1\) convergence of \(j(\tau)\).
The direct map tail is bounded in these charts by (17) and
(14).

The determinant of \(P_i\) equals
\(\exp\int_0^\tau\operatorname{tr}(DW_i)(s,J_i(s))\,ds\)
by the determinant equation in (16). Its positive lower
bound \(e^{-C\mathsf B}\) passes to the limit, so \(j_\infty\)
has positive local Jacobian and is a local \(C^1\)
diffeomorphism. The finite maps also have uniformly bounded
inverse derivatives, by (17) after shrinking \(\mathsf B\)
so \(\|P_i-I\|<1/2\), and by fixed chart comparisons.
Applying this derivative bound to inverse images of curves
gives
\[
 d_P(p,p')\le C\,d_P(j(\tau)p,j(\tau)p')
\]
uniformly in \(\tau\). The total space is connected since
both \(S^4\) and \(SO(3)\) are connected. Taking the limit
proves injectivity. For surjectivity, fix \(q\), take
\(p_n=j(\tau_n)^{-1}(q)\) for \(\tau_n\to\infty\), and pass
to a convergent subsequence by compactness. Uniform forward
convergence gives \(j_\infty(p)=q\) at its limit. The local
inverse theorem and bijectivity give the \(C^1\) inverse
\(g_\infty\). Equivariance passes to the limit and to its
inverse. The induced maps on the base are \(C^1\) using
local sections and bundle projection, and are inverse
to one another. Their base determinants are positive
because the finite base maps have positive determinants,
converge in \(C^1\) by the same local-section expressions,
and the limiting base maps are inverse \(C^1\) maps.

The inverses converge uniformly:
\[
 d_P(g(\tau)q,g_\infty q)
    \le C\,d_P(q,j(\tau)g_\infty q)
    \le C\sup_p d_P(j(\tau)p,j_\infty p).
\]
For \(q\in V_i\), the finite and limiting inverse images
lie in \(O_i\). In the same chart the inverse derivative is
\(P_i(\tau,g(\tau)q)^{-1}\).
Uniform convergence of \(P_i(\tau,\cdot)\) on \(O_i\)
and uniform continuity of the limiting matrix on compact
interior subsets show that
\(P_i(\tau,g(\tau)q)\to P_i(\infty,g_\infty q)\) uniformly
for \(q\in V_i\). The inverses of the matrices converge
uniformly as well by the uniform lower bound. This proves
\(g(\tau)\to g_\infty\) in \(C^1\). The argument uses the
modulus of continuity of the limiting derivative at moving
inverse points. It establishes qualitative \(C^1\) inverse
convergence.

One fixed \(C^1\) neighborhood of identity consists of maps
whose values on the chart sets stay in the specified larger
charts and for which
\[
 d_{1,P}(h,\mathrm{id})
 :=\max_i\sup_{p\in V_i}
 \left(|x_i(hp)-x_i(p)|
       +\|D(x_i\circ h\circ x_i^{-1})(x_i(p))-I\|\right)
\]
is sufficiently small. On this neighborhood the displayed
distance to identity uses only the fixed charts and
coordinate norms. By (17) it is bounded by \(C\mathsf B\)
for \(j_\infty\). The same bound holds for \(g_\infty\):
use the displacement bound and
\(\|P^{-1}-I\|\le\|P^{-1}\|\|P-I\|\) at the inverse point
in \(O_i\). Thus each limit is within \(C\delta\) of
identity. This bound on the limits does not require a
rate of \(C^1\) convergence for the inverse maps.

## The limiting pair and its distributional curvature

Apply the same convergence argument to \(j_{\rm st}\) from
identity, or use (15) and the convergence of \(j\). The
limits are ordered as
\(j_\infty=j_{{\rm st},\infty}c^{-1}\) and
\(g_\infty=c\,g_{{\rm st},\infty}\).
At every finite \(\tau\) on the tail the recovered native
connection and its curvature are exactly
\[
 A^{\rm F}(\tau)=j(\tau)^*B(u),\qquad
 F_{A^{\rm F}(\tau)}=j(\tau)^*F_{B(u)},\qquad u=\tau-\tau_0 .
\]
By (1) and the fixed \(H^m\to C^3\) bound,
\(B(u)\to A_0\) uniformly. The compatible curvature identity
\(F_B=F_0+d_{A_0}b+\tfrac12[b\wedge b]\) then gives \(F_B\to F_0\)
uniformly. These convergences also hold for the corresponding
tensors on \(P\) in the fixed charts. Uniform control of \(Dj(\tau)\)
bounds the pullback of these uniform errors. The pullback of a
fixed smooth tensor by \(j(\tau)\) converges uniformly to its
pullback by \(j_\infty\) because both the maps and their first
derivatives converge uniformly. Consequently
\[
 (A^{\rm F}(\tau),F_{A^{\rm F}(\tau)})
 \ \longrightarrow\
 (A_\infty,F_\infty)
 =\big(j_\infty^*A_0,j_\infty^*F_0\big)
 =g_\infty\cdot(A_0,F_0)
 \quad\text{in }C^0.                                                \tag{18}
\]
The same limit holds in the fixed rescaled time.
The continuous form \(A_\infty\) is a continuous
principal connection, since a \(C^1\) equivariant bijection
with \(C^1\) inverse preserves the fundamental vertical
fields and the right equivariance of the connection form.

For its curvature, use a smooth local section of \(P\).
Write \(\mathcal A_\tau\) and \(\mathcal F_\tau\) for the
local potentials and curvatures. The two uniform limits in
(18) give
\[
 d\mathcal A_\tau=\mathcal F_\tau
              -\tfrac12[\mathcal A_\tau\wedge\mathcal A_\tau]
 \ \longrightarrow\
 \mathcal F_\infty-\tfrac12[\mathcal A_\infty\wedge\mathcal A_\infty]
 \quad\text{uniformly locally}.
\]
Uniform convergence of \(\mathcal A_\tau\) also implies
distributional convergence of \(d\mathcal A_\tau\) to
\(d\mathcal A_\infty\), by testing against compactly
supported smooth forms. Thus
\(d\mathcal A_\infty+\tfrac12[\mathcal A_\infty\wedge\mathcal A_\infty]
=\mathcal F_\infty\) in distributions, with the continuous
representative in (18). This identity is compatible with all
smooth local section transitions. Algebraically the continuous
curvature pair is definite and has \(Q=I\), since \(F_\infty\) is
the pullback of \(F_0\) by an orientation-preserving \(C^1\)
bundle automorphism with pointwise invertible derivative.
The construction gives \(C^1\) regularity for the limiting
automorphism and \(C^0\) regularity for the limiting connection
and curvature.

The constants in (2), the thresholds, and the neighborhood
use the fixed native round geometry, \(A_0\), the internal
pairing, the fixed finite reference atlases and cutoffs, compact
bundle metric and charts with their margins, the fixed curvature
tube and reconstruction bounds through order two, the E60/E42
common times and constants, fixed splice strip \(I\), the selected
\(m\), and the E49 \(\eta,C_{\rm st},\alpha\) and E63 smoothing
constants. The data threshold may be reduced to satisfy each
of those fixed choices and \(\delta\le1\). Higher norms of the
smooth initial pair do not enter. No new primary source was
inspected or used.

[req]: ../research-progress/handoffs/SP4-CME-E74_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E74_RETURN_v1.md
[b45]: ../brainstorm/notes/B45_CRITICAL_GAUGE_LIMIT_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e59]: 59_CRITICAL_PATH_STRAIN_20261122.md
[e60]: 60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
[e62]: 62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md
[e63]: 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e67]: ../reviews/E67_GLOBAL_BUDGET_AUDIT_20261122.md
