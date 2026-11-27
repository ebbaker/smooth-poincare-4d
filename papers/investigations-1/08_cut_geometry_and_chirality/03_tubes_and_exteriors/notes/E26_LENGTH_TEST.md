# SP4-CUT-TUBE-E26 · Exact finite-length test on a fixed doubled fibre path

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E26 request](../research-progress/handoffs/E26_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The comparison input
is [E05](E05_TWISTED_EXTERIORS.md), SHA-256 beginning 547b0e4385cc510a.
The independent chirality sign check uses [E07](../reviews/E07_PROJECTIVE.md),
SHA-256 beginning 5ca3454c2f1331eb. This is an analytical test on a
specified smooth Riemannian metric path, with no search over paths.

For a fixed path, the exterior mean Weyl energy is exactly
\(AL+B/L+C/L^3\). The positive Yamabe lengths form an open interval
given by a single variational threshold on the doubled path. The energy
infimum on that interval comes from one quadratic equation and, if the
constraint is active, a limit at the Yamabe threshold.

## Geometry and conventions

Let \(P\) be the compact oriented punctured fibre, \(DP\) its smooth
double, and \(\varphi\) the specified punctured monodromy extended to its
double. Let \(h_t\) be a fixed smooth path on \(DP\) with all mapping-torus
jets matched at \(t=0,1\) by the extended monodromy. Assume each \(h_t\) is
reflection invariant and \(R_{h_t}\ge r_0>0\) everywhere on \(DP\).
For length parameter \(L>0\) put \(g_L=L^2dt^2+h_t\), with \(t\) of
period one, on the smooth doubled mapping torus \(D\). Its half \(X\)
has totally geodesic seam for every \(L\), as the fixed set of the
isometric involution. Use the orientation of increasing \(t\) followed
by the given fibre orientation on \(X\). Let
\[
K=\tfrac12\partial_t h_t,\qquad H=\operatorname{tr}_{h_t}K,\qquad
(K^2)_{ij}=K_{ia}h_t^{ab}K_{bj},\qquad d\mu=dt\,dV_{h_t}.
\]
A dot differentiates a covariant tensor at a fixed fibre point in the
product coordinates. All spatial traces, trace-free parts \({}^\circ\),
derivatives and norms use the current \(h_t\). The ambient normal is
\(e_0=L^{-1}\partial_t\). Its shape tensor is \(K/L\).

Write \(\mathcal R_{ab,cd}=\langle R(e_a,e_b)e_d,e_c\rangle\) so the
curvature operator of the unit sphere is the identity. The normal
curvature and Gauss equations give the mixed matrix \(N\) and tangential
contraction \(G\) in an \(h_t\)-orthonormal frame:
\[
\begin{aligned}
N_{ij}&=\mathcal R_{0i,0j}=L^{-2}(-\dot K+K^2)_{ij},\\
G_{ij}&=\operatorname{Ric}_{h_t,ij}
            +L^{-2}(-HK+K^2)_{ij}.
\end{aligned}
\]
For example, in product coordinates the mixed Christoffel symbols are
\(\Gamma^0_{ij}=-K_{ij}/L^2\) with index \(0\) denoting \(t\) in
that formula, and \(\Gamma^i_{0j}=K^i{}_j\). Inserting them and
normalizing two occurrences of \(e_0\) gives \(N\). The tangential
ambient Ricci tensor is \(N+G\) and \(\operatorname{Ric}_{00}=\operatorname{tr}N\).
Since \(\operatorname{tr}_{h_t}\dot K=\dot H+2|K|^2\), tracing gives
the exact scalar curvature
\[
R_{g_L}=R_{h_t}-\frac{Q}{L^2},\qquad
Q=2\dot H+H^2+|K|^2 .
\]

## Weyl polynomial and chiral signs

Use paired two-form bases \(\alpha_i=e^0\wedge e^i\),
\(\beta_i=*\alpha_i\). Symmetry and commutation of the Weyl operator
with \(*\) give the matrix \(\bigl(\begin{smallmatrix}E&J\\J&E\end{smallmatrix}\bigr)\)
in these bases. In the normalized chiral bases
\((\alpha_i\pm\beta_i)/\sqrt2\) its two matrices are \(E\pm J\).
Subtracting the Schouten term and taking the trace-free part gives
\[
E=\bigl(N-\tfrac12\operatorname{Ric}_{g_L}|_{TP}\bigr)^\circ
  =\tfrac12(N-G)^\circ
  =\tfrac12(-D_0+L^{-2}U),
\quad
D_0=\operatorname{Ric}_{h_t}^\circ,\quad U=(-\dot K+HK)^\circ .
\]
In particular the two \(K^2\) terms cancel in \(E\).

With fibre volume symbol \(\epsilon\) in the chosen orientation,
\(J_{ij}=\tfrac12\epsilon_j{}^{kl}W_{0i,kl}\).
Codazzi gives
\(\mathcal R_{0i,kl}=L^{-1}(\nabla_lK_{ki}-\nabla_kK_{li})\).
The Schouten correction after contraction with \(\epsilon\) is
skew in \(i,j\). Thus
\[
J=L^{-1}M,\qquad
M_{ij}=-\operatorname{sym}_{ij}\!\left(\epsilon_j{}^{kl}\nabla_k K_{li}\right).
\]
The contraction defining \(M\) has zero trace by symmetry of \(K\).
The displayed sign uses the positive sphere curvature convention and
the specified orientation. In the E07 biaxial model with \(L=1\) and
lengths \((1,1,a)\), for example, the axial components are
\((D_0)_{33}=\tfrac83(a^2-1)\), \(U_{33}=-2a''/(3a)\) and
\(M_{33}=-2a'\). This recovers the paired E07 eigenvalues
\((4-4a^2-a''/a\mp6a')/3\).

Let \(\int_X^\mathrm{fib}\) denote the integral over \(0\le t\le1\)
and the half fibre \(P\) with measure \(d\mu\). The exterior energies
are in the real Hilbert–Schmidt operator normalization on the
three-dimensional chiral spaces. In particular the mean density is
\(\tfrac12(|E+J|^2+|E-J|^2)=|E|^2+|J|^2\) and \(dV_{g_L}=L\,d\mu\).
This gives
\[
\begin{aligned}
e_X(L)&=A L+\frac{B}{L}+\frac{C}{L^3},\\
A&=\tfrac14\int_X^\mathrm{fib}|D_0|^2\,d\mu,\qquad
B=\int_X^\mathrm{fib}\bigl(|M|^2-\tfrac12\langle D_0,U\rangle\bigr)\,d\mu,\qquad
C=\tfrac14\int_X^\mathrm{fib}|U|^2\,d\mu,\\
E_\pm(X;g_L)&=e_X(L)\pm\left[
 -\int_X^\mathrm{fib}\langle D_0,M\rangle\,d\mu
 +L^{-2}\int_X^\mathrm{fib}\langle U,M\rangle\,d\mu\right].
\end{aligned}
\]
Here \(A,C\ge0\) and \(B\ge-2\sqrt{AC}\) by Cauchy–Schwarz.
Orientation reversal fixes \(A,B,C\) and exchanges the signed
energies. Reflection identifies the two halves and swaps chiralities,
so \(E_+(D;g_L)=E_-(D;g_L)=2e_X(L)\).

For the stationary E05 control, \(h_t=h\) is the invariant fibre
metric, \(K=H=U=M=Q=0\), and the signed and mean energies all equal
\((L/4)\int_P|\operatorname{Ric}_h^\circ|^2\,dV_h\). It has \(A>0\)
by the nonround product collar and \(B=C=0\). Every \(L>0\) gives
positive scalar curvature, and the energy infimum zero is approached
as \(L\) decreases to zero. The curvature identities recover both the
normalization and the collapsing limit in E05.

## Positive scalar and exact positive Yamabe lengths

Pointwise strict positive scalar curvature holds exactly for
\(L^2>q_R\), where
\[
q_R=\max\!\left(0,\ \max_{[0,1]\times DP}\frac{Q}{R_{h_t}}\right).
\]
The statement uses \(L>0\) and compactness. The nonnegative scalar
border can also be tested directly from \(R_{h_t}-Q/L^2\).

For the exact Yamabe test, use real \(w\in H^1(D)\) with the
mapping-torus trace matching. Write \(\int_D^\mathrm{fib}\) for the
integral using \(d\mu\) on the doubled slab. Define
\[
\begin{aligned}
\mathcal S[w]&=\int_D^\mathrm{fib}(6|\nabla_{h_t}w|^2+R_{h_t}w^2)\,d\mu,\\
\mathcal T[w]&=\int_D^\mathrm{fib}(6|\partial_t w|^2-Qw^2)\,d\mu\\
&=\int_D^\mathrm{fib}\left[6\left(\partial_t w+\tfrac13 Hw\right)^2
                  -|K^\circ|^2w^2\right]\,d\mu .
\end{aligned}
\]
The last identity follows by integrating \(-2\dot H w^2\) in \(t\),
using \(\partial_t dV_{h_t}=H\,dV_{h_t}\) and endpoint cancellation.
The scalar-curvature numerator in dimension four is exactly
\(N_L[w]=L\mathcal S[w]+L^{-1}\mathcal T[w]\).
In particular \(\mathcal S[w]>0\) for every nonzero \(w\). Put
\[
q_Y=\max\!\left(0,\ \sup_{0\ne w\in H^1(D)}
                      \frac{-\mathcal T[w]}{\mathcal S[w]}\right).
\]
The pointwise potential bound \(Q\le q_R R_{h_t}\) gives
\(0\le q_Y\le q_R\). If \(L^2<q_Y\), a test gives negative numerator
and \(Y(D,[g_L])<0\). If \(L^2>q_Y\), then
\(N_L[w]\ge (L-q_Y/L)\mathcal S[w]\), which controls the fibre
gradient and \(L^2\) norm. The first display for \(\mathcal T\) also
gives
\[
(6/L)\|\partial_t w\|_{L^2(d\mu)}^2
\le N_L[w]+(\sup Q_+/L)\|w\|_{L^2(d\mu)}^2.
\]
Together they control the full fixed-length \(H^1\) norm, hence
the \(L^4\) denominator on the smooth compact four-manifold.
Therefore \(Y(D,[g_L])>0\). If \(L^2=q_Y>0\), normalize a
maximizing sequence by \(\mathcal S[w_j]=1\). Its numerator goes to
zero and \(\|w_j\|_{L^2(d\mu)}^2\) stays bounded below, since
\(\int Q w_j^2\,d\mu\ge-\mathcal T[w_j]\to q_Y>0\).
Its \(L^4(g_L)\) denominator is bounded below by Hölder, and
all numerators are nonnegative. Thus the Yamabe constant is zero
at this endpoint. The exact positive condition is \(L^2>q_Y\).

A smooth invariant positive density \(\nu\) for the doubled monodromy
supplies the explicit test \(w=(dV_{h_t}/d\nu)^{-1/3}\), which
annihilates the square in \(\mathcal T\). This gives the lower bound
\(q_Y\ge\int |K^\circ|^2w^2\,d\mu/\mathcal S[w]\).
It is strictly positive if the shear is nonzero anywhere, recovering
the E05 sign obstruction at small length.

## Constrained minimum and finite certificates

Write \(x=L^2\) and \(\Phi(L)=A L+B/L+C/L^3\).
Its derivative in \(L\) has sign given by \(A x^2-Bx-3C\).
If \(A>0\), define
\[
x_*=\frac{B+\sqrt{B^2+12AC}}{2A},\qquad x_{\rm opt}=\max(q_Y,x_*).
\]
For \(C>0\) the quadratic has one positive root \(x_*\) and the
energy decreases up to that root and increases afterward. For \(C=0\),
\(B\ge0\) and the same description holds with \(x_*=B/A\),
including the increasing case \(B=0\). The infimum on the positive
Yamabe interval is \(\Phi(\sqrt{x_{\rm opt}})\), interpreted as
a one-sided limit if \(x_{\rm opt}=q_Y\). At \(x_{\rm opt}=0\),
\(B=C=0\) and the limit is zero. If \(A=0\), then \(B,C\ge0\)
and the infimum is zero as \(L\to\infty\). The infimum in this
last case is attained only when \(B=C=0\). Replacing \(q_Y\)
by \(q_R\) gives the infimum on the strict positive scalar interval.

The desired exterior budget is
\(E_*=\tfrac23 T=8\pi^2/3\), with \(T=4\pi^2\).
For a specified marked smooth path and \(x>0\), the energy inequality
is exactly
\[
A x^2+B x+C<E_*x^{3/2}.
\]
Consequently, certified upper bounds on \(A,B,C\) and a certified
upper bound \(q^+\ge q_Y\) suffice if some \(x>q^+\) passes the
strict energy test with those upper coefficients. One can use \(q_R\)
in this role or certify the positive double's Yamabe numerator
directly at the proposed length. The exact constrained infimum
passes if and only if it is strictly below \(E_*\). Strictness
allows a nearby admissible length even when the infimum occurs at
an excluded endpoint. To require \(e_X>0\) as well, choose a passing
length away from the isolated zeros of \(Ax^2+Bx+C\), unless all
three coefficients vanish. The latter case is the zero-energy
problem of [E03](E03_EQUALITY.md) when its topology hypotheses hold.
Conversely, coefficient lower bounds and
a lower bound on \(q_Y\) can rule out the path if they certify
\(\Phi(L)\ge E_*\) on the resulting enlarged length interval.
A failed pointwise scalar test alone only excludes that
pointwise positivity certificate.

The curvature and sign tests preserve the actual reflected seam on
the given path. To use a passing length on a genuinely nonperiodic
marked monodromy as a homotopy-sphere exterior, its boundary and its
trivial meridian quotient must also have been verified topologically.
These coefficients certify the exterior budget and positive double.
They give no cap metric or smooth recognition theorem for its closing.
