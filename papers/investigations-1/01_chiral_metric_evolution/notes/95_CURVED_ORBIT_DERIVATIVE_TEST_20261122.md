# SP4-CME-E95 — Horizontal derivative growth on the actual round orbit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E79, E53 and
E94. I did not author E91. All four frozen input hashes matched
the [request][req] before use. This is the fixed [B56 decision][b56]
on the actual round chiral bundle. No new primary source was used.
[Return][ret].

## Compactly supported shear and bundle lift

Let \(M=S^4\) be the compact oriented standard smooth sphere
with the fixed round positive perfect chiral connection \(A_0\)
on its principal \(SO(3)\) bundle \(P\). Use the native round
metric \(g_0\) and the internal positive pairing from the negative
Killing form on the adjoint bundle \(E\). Norms and adjoints
for the solver use this fixed reference.

Choose a coordinate chart \(U\) and a smooth principal
trivialization over it. In its coordinate image take cubes
\(Q_j=(-jd,jd)^4\), \(j=1,2,3\), for fixed \(d>0\) with
\(\overline{Q_3}\) interior to the image of \(U\).
Choose \(0\le \rho\le1\) smooth, with support compact in
\(Q_3\) and \(\rho=1\) on \(Q_2\). Write \(e_i=\partial_{x^i}\)
in this chart and set
\[
 \epsilon_n=n^{-3/4},\qquad
 \delta_n=\epsilon_n/n,\qquad
 V_n(x)=\delta_n\rho(x)\sin(nx^1)e_2,\quad n\in\mathbb N.
\]
The extension by zero is a smooth global base field because
its support is interior to the chart. Its flow
\(\psi_{n,t}\) is global, since \(M\) is compact. The flow
fixes each point outside the support and leaves the chart
invariant, by uniqueness and bijectivity at each time.
In coordinates one can equivalently take the flow of the
compactly supported zero extension on \(\mathbb R^4\).
Let \(\psi_n=\psi_{n,1}\). Its inverse is \(\psi_{n,-1}\).

The first, third and fourth coordinates stay fixed.
For \(x\in Q_1\) and \(|t|\le1\) the second coordinate
moves by at most \(\delta_n\) and the entire curve stays
in \(Q_2\) once \(\delta_n<d\). Thus in \(Q_1\) the flow
is exactly
\[
 \psi_{n,t}(x)=x+t\delta_n\sin(nx^1)e_2,\qquad |t|\le1.                \tag{1}
\]
This holds for both \(\psi_n\) and its inverse with their
respective signs. Globally in the coordinate chart,
differentiating the cutoff field gives
\[
 \|V_n\|_\infty\le\delta_n,\qquad
 \|DV_n\|_\infty\le C\epsilon_n,\qquad
 \|D^2V_n\|_\infty\le Cn\epsilon_n ,
\]
where derivatives of \(\rho\) are fixed.
The first variational equation along the flow is
\(\partial_tD\psi_{n,t}=DV_n(\psi_{n,t})D\psi_{n,t}\).
It gives \(\|D\psi_{n,t}\|_\infty\le e^{C\epsilon_n|t|}\)
and \(\|D\psi_{n,t}-I\|_\infty\le e^{C\epsilon_n|t|}-1\).
The second variational equation has terms
\(DV_n(\psi_{n,t})D^2\psi_{n,t}\) and
\(D^2V_n(\psi_{n,t})[D\psi_{n,t},D\psi_{n,t}]\).
Its zero initial second derivative and the first equation
give \(\|D^2\psi_{n,t}\|_\infty\le Cn\epsilon_n\) for
\(|t|\le1\) by integration of the differential inequality.
The negative-time inequalities follow by the same argument
with the vector field negated. In particular,
\[
 \|\psi_n^{\pm1}-\operatorname{id}\|_{C^0}\le C\delta_n,\qquad
 \|\psi_n^{\pm1}-\operatorname{id}\|_{C^1}\le C\epsilon_n,\qquad
 c n\epsilon_n\le
    \|\psi_n^{\pm1}-\operatorname{id}\|_{C^2}
       \le C n\epsilon_n                                                \tag{2}
\]
for large \(n\). The lower bound follows from the second
derivative in (1) at \(x^1=\pi/(2n)\) with the other
coordinates zero. The map differences in (2) are measured
by the coordinate representations in fixed charts for
maps near the identity. Fixed changes of charts preserve
the upper estimates by the chain rule; the displayed
inner chart gives the lower bound.

In the chosen principal trivialization put
\[
                  G_n(x,h)=(\psi_n(x),h).
\]
It is an equivariant diffeomorphism there with inverse
\((x,h)\mapsto(\psi_n^{-1}(x),h)\). The identity on the
collar where \(\psi_n=\operatorname{id}\) glues these
maps smoothly to the identity on the rest of \(P\).
The lift covers the orientation-preserving base
diffeomorphism, since the latter is a flow from the
identity. In fixed product charts, the displacement
and derivatives of \(G_n^{\pm1}\) relative to the identity
have the same bounds (2), including the second derivative
lower bound. A finite cover of the compact group factor
and fixed smooth coordinate changes give the corresponding
bounds in fixed global \(C^k\) comparisons.

## Compatible curvature and critical convergence of the inputs

Set \(A_n=G_n^*A_0\) in the active pullback convention.
Then \(A_n\) is smooth on the fixed principal bundle and
\(F_{A_n}=G_n^*F_0\). In particular its curvature is the
curvature of its actual connection. Choose a fixed smooth
base field \(u_0\) equal to \(e_1\) on \(Q_2\), supported
inside \(Q_3\), by a second fixed cutoff. Put
\(r_0=S_0u_0=\iota_{u_0}F_0\) and \(r_n=G_n^*r_0\).
Naturality of the covariant exterior derivative on
adjoint forms gives
\[
 d_{A_n}r_n=G_n^*(d_0r_0),\qquad d_0=d_{A_0}.                        \tag{3}
\]
This follows equally by expanding the local exterior
derivative and the bracket in the pulled-back connection.
Thus every needed difference is a pullback difference of
one fixed smooth local form: the reference potential on
\(U\), \(F_0\), \(r_0\), or \(d_0r_0\). The potential
difference is the global connection difference
\(a_n=A_n-A_0\). The lift keeps the group coordinate
fixed, so the local potential also transforms by base
pullback in this frame.

For a fixed \(E\)-valued \(k\)-form with coefficient array
\(W(x)\), its local pullback has coefficients
\(W(\psi_n(x))(D\psi_n(x))^{\otimes k}\), with the slots
ordered as in the form. The differences are zero outside
the fixed chart support. On the chart, subtract the value
at the identity using the smoothness of \(W\), the
displacement in (2), and telescoping of the \(k\) factors.
This gives a \(C^0\) bound \(C_W\epsilon_n\).
One derivative of the difference has terms from
\(DW(\psi_n)D\psi_n\) in the composition and terms with
one \(D^2\psi_n\) in a pullback slot. The former, after
subtraction, are bounded by \(C_W(\delta_n+\epsilon_n)\)
using fixed derivatives through \(D^2W\), and the latter
by \(C_Wn\epsilon_n\). Thus the differences
\[
 a_n,\quad \beta_n=F_{A_n}-F_0,\quad
 r_n-r_0,\quad d_{A_n}r_n-d_0r_0
                                                                            \tag{4}
\]
are each \(O(\epsilon_n)\) in \(C^0\) and \(O(n\epsilon_n)\)
in \(C^1\) in the fixed frame. On overlaps, a fixed
coordinate change and bundle frame change preserve the
bounds. Differentiating their coefficient matrices adds
only a fixed multiple of the \(C^0\) difference. For
\(a_n\) the affine frame-change terms cancel between
the two connections, leaving the tensor transformation
of the difference. Passing to the fixed covariant
derivative adds only bounded fixed connection coefficients
times the value differences.

Use the localized norm \(\mathcal B^{1/2}\) obtained
by a finite fixed atlas and bundle frames with supported
partition pieces extended by zero to unit four-tori, and
the E53 dyadic \(B^{1/2}_{8,1}\) norm summed over pieces.
For a smooth localized component vector \(v\), the
E53 kernel bound and inverse derivative formula give,
for \(j\ge1\),
\[
 \|\Delta_jv\|_8
   \le C\min\{\|v\|_8,\ 2^{-j}\|\partial v\|_8\}.
\]
Indeed the first bound uses the uniform \(L^1\) block
kernel, and the second expresses \(\Delta_jv\) as
\(2^{-j}\sum_i K_{j,m_i}*\partial_i v\) with uniform
\(L^1\) kernels on the annulus. With the low block
bounded by \(C\|v\|_8\), split the weighted sum at
\(2^j\) comparable to
\((\|v\|_8+\|\partial v\|_8)/\|v\|_8\) when
\(\|v\|_8>0\). The geometric sums give
\[
 \|v\|_{B^{1/2}_{8,1}}
       \le C\|v\|_8^{1/2}
                  (\|v\|_8+\|\partial v\|_8)^{1/2}.                   \tag{5}
\]
The zero case is immediate. In each fixed localized
piece of (4), the cutoff derivative contributes \(O(\epsilon_n)\),
and the smooth coordinate, density and frame coefficients
have fixed bounds on the compact supports. There are no
seam terms in the zero extensions. Therefore the piece
has \(\|v\|_8\le C\epsilon_n\) and
\(\|v\|_8+\|\partial v\|_8\le C n\epsilon_n\).
By (5), the sum of the four localized difference norms
in (4) is at most \(C\epsilon_n\sqrt n=Cn^{-1/4}\).
In particular the coefficient values enter the E79 fixed
tube for all large \(n\). [E53, dyadic kernels and inverse
derivative][e53]. [E79, value tube][e79].

## Exact normalized E79 output

For vector fields use the pullback convention
\[
                 u_n=\psi_n^*u_0=(D\psi_n)^{-1}(u_0\circ\psi_n).
\]
Contraction commutes with bundle and base pullback, so
\[
 S_{A_n}u_n=\iota_{u_n}G_n^*F_0
            =G_n^*(\iota_{u_0}F_0)=r_n .
\]
The E79 fiber projection satisfies
\(\Pi_{A_n}S_{A_n}=0\) and \(H_{A_n}S_{A_n}=I\).
Consequently \(d_0^*\Pi_{A_n}r_n=0\).
The exact normalized weak inverse therefore gives
\(\phi_n=0\) on its fixed \(N^\perp\) domain. Its
horizontal parameter is \(H_{A_n}r_n=u_n\), and its
fixed-slice residual is zero. The same formulas at
\(A_0,r_0\) give output \((0,u_0,0)\).
[E79 (1), (5)–(9)][e79].

By (1) and the fact that \(u_0=e_1\) at the image
of \(Q_1\) under \(\psi_n\) for large \(n\),
\[
 u_n(x)=e_1-\epsilon_n\cos(nx^1)e_2
                     \quad\text{on }Q_1 .                          \tag{6}
\]
At \(x_n=(\pi/(2n),0,0,0)\) in \(Q_1\),
\(u_n-u_0=0\) and
\(\nabla^{g_0}_{\partial_{x^1}}(u_n-u_0)=n\epsilon_n e_2\).
The connection term vanishes since the difference field
vanishes there. Fixed metric comparison in the chart
therefore gives
\[
  \|\nabla^{g_0}(u_n-u_0)\|_\infty\ge c n\epsilon_n=c n^{1/4}.
\]
Globally \(\|u_n-u_0\|_{C^0}\le C\epsilon_n\) by (2)
and the fixed smoothness of \(u_0\).
Differentiating the inverse-matrix formula for
\((D\psi_n)^{-1}\) gives the upper bound
\(\|u_n-u_0\|_{C^1}\le C n\epsilon_n\).
In particular the horizontal output is unbounded in
\(C^1\) as well as failing \(C^1\) convergence to \(u_0\).

The precise continuity statement concerns smooth inputs
\((A,r)\) in the E79 value tube, with convergence to
\((A_0,r_0)\) measured by
\[
 \|(A-A_0,F_A-F_0)\|_{\mathcal B^{1/2}}
       +\|(r-r_0,d_A r-d_0r_0)\|_{\mathcal B^{1/2}} .
\]
Here each pair norm can be interpreted as the sum of
its component norms. The pairs in (4) satisfy this
convergence, while the selected horizontal output fails
to be \(C^1\)-continuous by (6). The forcing varies
along this sequence and is exactly the pulled-back
\(r_0\), as prescribed. This is an actual perfect
connection family, whereas E91 uses an independent
frozen curvature triple and exterior derivative.
[E91, scope of frozen model][e91].

## Auxiliary bundle transport and stationary original flow

The wedge Gram matrix and the reconstructed metric
pull back with the actual curvature. Thus \(A_n\) is
perfect with \(Q(A_n)=I\) and \(g_{A_n}^{\rm F}=\psi_n^*g_0\).
The covariant derivative of \(I\) vanishes, so \(T(A_n)=0\).
The original Fine gradient vector field is zero at
\(A_n\). In native form it is \(-2d_{A_n}^*F_{A_n}\)
when \(Q=I\), which is zero by self-duality and Bianchi.
Equivalently the normalized defect form of the velocity
vanishes at \(Q=I\). The original evolution from every
\(A_n\) is stationary.

For the auxiliary transport let
\(Y_0=\chi_{A_0}(u_0)\) and \(Y_n=\chi_{A_n}(u_n)\)
be the actual horizontal lifts to \(P\).
The vector field
\((DG_n)^{-1}Y_0\circ G_n\) projects to \(u_n\)
because \(G_n\) covers \(\psi_n\). Its \(A_n\) component
vanishes by \(A_n=G_n^*A_0\) and \(A_0(Y_0)=0\).
These two properties give the identity
\[
                     Y_n=G_n^*Y_0 .
\]
The smooth invariant fields have complete flows on the
compact principal bundle. If \(\Theta_{0,t}\) is the
flow of \(Y_0\), the flow and inverse of \(Y_n\) are
\[
 \Theta_{n,t}=G_n^{-1}\circ\Theta_{0,t}\circ G_n,\qquad
 \Theta_{n,t}^{-1}=G_n^{-1}\circ\Theta_{0,-t}\circ G_n .                \tag{7}
\]
Differentiate (7) in time to get the vector field
\(Y_n\) and initial identity. Equivariance follows
from the invariance of the generators. These are
auxiliary bundle flows, separate from the connection
gradient flow at the perfect initial data.
[E94, flat conjugacy precedent][e94].

Fix \(T<\infty\). The smooth reference family on
\([-T,T]\times P\) has bounded derivatives in space
through second order in fixed charts. One can compare
the maps using finitely many chart pairs with margins
on this compact time-space set. For large \(n\), the
displacements of \(G_n^{\pm1}\) keep the compositions
in these charts. The two displacements and the
reference Lipschitz bound give \(C^0\) difference
at most \(C_T\delta_n\) in (7). The derivative of
the direct composition in such coordinates is
\[
 DG_n^{-1}(\Theta_{0,t}(G_n p))\,
       D\Theta_{0,t}(G_n p)\,DG_n(p).
\]
The outer factors differ from identity by \(O(\epsilon_n)\)
uniformly. The middle factor differs from
\(D\Theta_{0,t}(p)\) by \(O_T(\delta_n)\) since its
first spatial derivative is bounded. Hence
\(\|\Theta_{n,t}-\Theta_{0,t}\|_{C^1}
 \le C_T\epsilon_n\) uniformly for \(|t|\le T\).
Replacing \(t\) by \(-t\) gives the same estimate for
the inverse maps. The bounded-time \(C^1\) convergence
follows from the exact conjugacy and fixed smooth
reference family.

The result tests only the selected E79 solver and the
specified joint critical input topology at a round-orbit
point. Other right inverses, finite slice placement,
and general nonlinear critical estimates remain outside
this example.

[req]: ../research-progress/handoffs/SP4-CME-E95_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E95_RETURN_v1.md
[b56]: ../brainstorm/notes/B56_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e79]: 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e91]: 91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md
[e94]: 94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md
