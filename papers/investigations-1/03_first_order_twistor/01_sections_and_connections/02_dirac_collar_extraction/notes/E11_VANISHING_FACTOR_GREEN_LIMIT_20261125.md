# The Green limit of an evacuated conformal base

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Exact serving model and reasoning effort
are unavailable. This is the bounded proof in
[EXTRACT-E11 revision 1](../research-progress/handoffs/E11_REQUEST_20261125.md).

## The normalized equation

Use the oriented whole compact comparisons of
[EXTRACT-E09](E09_CONFORMAL_BASE_VOLUME_DICHOTOMY_20261125.md)
on \(N^\circ=N\setminus P\), where \(N\) is a smooth closed
homotopy four-sphere and \(P=\{p_1,\ldots,p_k\}\) is finite.
In the smooth closed conformal gauge \(h\) used there, write
\[
 F_i^*g_i=u_i^2h_i,\qquad h_i\longrightarrow h
       \quad\text{in }C^\infty_{\rm loc}(N^\circ).
\]
The source has unit volume and constant scalar curvature
\(Y_i\to y>0\). Its positive Yamabe inequality gives
\(Y([h])\ge y\). Here assume \(y<Y_{\rm rd}\), the weak-zero
branch for \(u_i\), and that \([h]\) is nonround for the
energy consequence below. E09 gives strong local \(L^4\)
decay by the local sharp Sobolev cutoff inequality. Its
local absorption and elliptic estimates then yield
\(u_i\to0\) smoothly on every fixed compact in \(N^\circ\).

Fix \(x_0\in N^\circ\) and put \(c_i=u_i(x_0)>0\) and
\(w_i=u_i/c_i\). Then \(c_i\to0\) and
\[
 -6\Delta_{h_i}w_i+(R_{h_i}-Y_i u_i^2)w_i=0,\qquad
 w_i(x_0)=1 ,
\]
with \(\Delta=\operatorname{div}\nabla\). On each fixed
compact all coefficients are smoothly bounded and uniformly
elliptic in fixed charts. The zeroth-order coefficient is
bounded with no sign requirement for the Harnack inequality
for positive solutions. On a slightly larger connected
precompact set joining the compact to \(x_0\), a finite
chain of interior Harnack balls gives uniform positive
lower and finite upper bounds. Interior elliptic estimates
and a subsequence then give
\[
 w_i\longrightarrow w>0 \quad\text{in }C^\infty_{\rm loc}(N^\circ),
 \qquad w(x_0)=1,\qquad L_h w=0,\quad L_h=-6\Delta_h+R_h .
\]
In particular the comparisons in constant physical rescaling
satisfy
\[
 c_i^{-2}F_i^*g_i=w_i^2 h_i\longrightarrow w^2h .
 \tag{1}
\]
No metric or spin gauge at the omitted points enters the
Harnack chains. [Gilbarg–Trudinger, Theorem 8.20, conditions (8.5)–(8.6)](https://djvu.online/file/jxRRleAzbYjsl) · [Lee–Parker, Theorems 2.4–2.5](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Positive isolated singularities

Here the positive singular-solution calculation uses the
smoothness of \(h\) at the punctures, even when its scalar
curvature has variable sign. The Yamabe inequality gives
\[
 Q_h(v)=\int_N(6|dv|_h^2+R_h v^2)\,dV_h
 \ge Y([h])\|v\|_4^2
 \ge Y([h])\operatorname{Vol}_h(N)^{-1/2}\|v\|_2^2 .
\]
Since \(R_h\) is bounded, combining this bound with the
definition of \(Q_h\) gives coercivity on \(H^1(N)\).
The same holds with Dirichlet conditions on a smooth
small ball, by extension by zero. Near each \(p\in P\)
solve the smooth Dirichlet problem \(L_h q=0\) with
boundary value \(1\) on such a ball. Testing with the
negative part and using coercivity gives \(q\ge0\). The
strong maximum principle applied after adding a sufficiently
large bounded constant potential gives \(q>0\).

On its punctured ball set \(f=w/q>0\). A direct expansion
of \(L_h(qf)\) gives
\[
 -\operatorname{div}_h(q^2\nabla_h f)=\frac q6 L_h(qf)=0 .
\]
Let \(r\) be \(h\)-normal radius about \(p\).
The outward flux
\(\mathcal F=\int_{S_r}q^2\partial_r f\,dS_h\)
is independent of \(r\). In polar coordinates let
\(J(r,\omega)\,d\omega\) be the surface measure. The weighted
angular density \(q^2 J/r^3\) is bounded above and below,
with bounded radial logarithmic derivative as \(r\to0\).
Indeed \(J/r^3=1+O(r^2)\) and \(q\) is smooth positive.
Define \(M(r)=r^{-3}\int_{S_r}q^2 f\,dS_h\).
Differentiation and positivity give
\[
 M'(r)=r^{-3}\mathcal F+b(r)M(r),\qquad |b(r)|\le C .
\]
With \(B(r)=\int_0^r b(s)\,ds\), the integrating factor
is \(e^{-B(r)}=1+O(r)\). Integrating from \(r\) to a
fixed small radius gives
\[
 M(r)=-\frac{\mathcal F}{2}r^{-2}+O(|\mathcal F|r^{-1})+O(1).
\]
Thus \(\mathcal F\le0\). Rescaled annular Harnack with
uniform coefficients compares the maximum on \(S_r\)
to its weighted mean, so \(f=O(r^{-2})\), and \(f=O(1)\)
if \(\mathcal F=0\). Rescaled interior estimates give
\(df=O(r^{-3})\) in the first bound. These bounds also
ensure that \(f\) and \(df\) are locally integrable across
\(p\), with \(df\) its weak derivative because the
boundary term of \(f\) on \(S_r\) is \(O(r)\).

Integrating against a smooth test on the punctured ball
with inner outward normal \(-\partial_r\) and letting
the radius tend to zero gives
\[
 -\operatorname{div}_h(q^2\nabla_h f)
           =-\mathcal F\,\delta_p
\]
as distributions on the ball. In this step replacing the
boundary test by its value at \(p\) costs \(O(r)\), using
the \(O(r^{-3})\) derivative bound and the \(O(r^3)\)
boundary area. Using the exact transformation through
the smooth positive \(q\) gives
\[
 L_h w=-\frac{6\mathcal F}{q(p)}\delta_p .
 \tag{2}
\]
This proves the positive Bôcher conclusion with the sign
and coefficient in the \(-6\Delta_h+R_h\) convention.
In particular no derivatives of a delta occur.

## Green kernels and the differentiated ends

Normalize the positive Green function by
\(L_hG_h(p,\cdot)=24\pi^2\delta_p\). To check the
differentiated leading term in ordinary normal coordinates,
use a cutoff \(\zeta\) equal to one near \(p\).
The distribution \(L_h(\zeta r^{-2})\) is
\(24\pi^2\delta_p+F\), where \(F\) is smooth off \(p\),
\(F=O(r^{-2})\), and \(D^jF=O(r^{-2-j})\) for each
fixed order near zero. The point mass is the flux
of \(-6\,d r^{-2}\) through a small sphere, with
\(\operatorname{Vol}(S^3(1))=2\pi^2\). For the remainder,
\(h-\delta=O(r^2)\), the first-order Laplacian
coefficients are \(O(r)\), and \(R_h\) is bounded.
The corresponding differentiated estimates follow
from ordinary normal-coordinate Taylor bounds.

As \(F\in L^{4/3}\), coercivity solves \(L_h V=F\)
with \(V\in H^1(N)\subset L^4(N)\). Set
\(G_h=\zeta r^{-2}-V\). On an annulus rescaled by \(r\),
the \(L^4\) norm of \(V(r\,\cdot)\) is \(O(r^{-1})\)
and the rescaled forcing \(r^2 F(r\,\cdot)\) has bounded
derivatives on slightly larger fixed model annuli.
Interior elliptic estimates there give
\[
 D^j(G_h-r^{-2})=O(r^{-1-j}),\qquad j\ge0
\]
for each fixed order near the pole. In particular \(G_h\)
is positive on all sufficiently small spheres. Testing
the Green equation away from the pole with its negative
part on their closed exterior gives nonnegativity by
the same coercivity, and the strong maximum principle
gives \(G_h>0\) there. The kernel of \(L_h\) is zero,
and a distribution in this kernel is smooth by elliptic
regularity. Equation (2) at the finitely many points
therefore gives the global representation
\[
 w=\sum_{j=1}^k a_j G_h(p_j,\cdot),\qquad
 a_j=-\frac{\mathcal F_j}{4\pi^2 q_j(p_j)}\ge0 .
 \tag{3}
\]
At least one \(a_j\) is positive, since \(w(x_0)=1\).
Thus \(P\) cannot be empty in this branch. A zero residue
gives a smooth positive extension at its marked point
because each other Green kernel is smooth and positive there.
[Lee–Parker, §6 for the Green construction and the sharper conformal normal-coordinate expansion](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

At \(a_j>0\), \(w=a_j r^{-2}+O(r^{-1})\) with the
same differentiated estimates. In the reflected inversion
coordinate \(z\) the metric \(w^2h\) is
\(a_j^2\delta+O(|z|^{-1})\). Differentiating the inversion
gives \(D_z^\gamma(w^2h-a_j^2\delta)=
O(|z|^{-1-|\gamma|})\) for each fixed order, including
through order five. The dilation \(z'=a_j z\) sets its
leading metric to \(\delta\). Each positive residue gives
a complete asymptotically Euclidean end of order at least
one with trivial link group. Radial lengths diverge since
\(w\asymp r^{-2}\). Filling the zero residues gives a
smooth complete Riemannian manifold \(X\), scalar-flat by
\(L_h w=0\) and Bach-flat by the conformal invariance in
the E09 comparison. It has one Euclidean end per positive
residue. The convergence in (1) currently compares only
the original domain \(N^\circ\).

## The physical volume exit is the only Green pole

For a small fixed \(r>0\) with disjoint normal balls, let
\(K_r=N\setminus\bigcup_j B_h(p_j,r)\).
The complement of its full embedded image has one component
\(V_{ij}(r)\) per puncture, labeled by its original boundary
sphere. This follows from the Mayer–Vietoris \(H_0\)
sequence using \(H_1(M)=0\), connectivity of \(K_r\), and
the fact that each complementary component meets the
boundary. With the coherent comparisons on larger
truncations, \(V_{ij}(r)\subset V_{ij}(2r)\) and their
difference, up to boundaries, is the image of that
coordinate shell about \(p_j\).
[NECK finite-puncture transfer, complement topology](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md#simultaneous-cuts-and-complement-topology)

On each such shell use a fixed smooth radial cutoff
\(\chi_{ij}\in[0,1]\) equal to one in \(V_{ij}(r)\), zero
outside \(V_{ij}(2r)\), extended by constants, with
derivative supported inside the shell. Since the physical
pullback is \(u_i^2 h_i\), the physical Dirichlet cost is
\[
 \int_M |d\chi_{ij}|_{g_i}^2\,dV_{g_i}
     =c_i^2\int_{\text{shell}} w_i^2
             |d\chi_j|_{h_i}^2\,dV_{h_i}
     =O_r(c_i^2).
 \tag{4}
\]
Every fixed compared compact, including the transition
shell, has vanishing physical volume. Pass to a subsequence
on which \(\operatorname{Vol}_{g_i}(V_{ij}(r))\to\alpha_j\)
for the finite set of \(j\). The same limits hold at every
other small fixed cutoff radius, since the differences
are fixed compared shells with volume tending to zero.
Also \(\sum_j \alpha_j=1\), because the core has
vanishing physical volume. The source Yamabe inequality
for \(\chi_{ij}\) reads
\[
 Y_i\|\chi_{ij}\|_{4,g_i}^2
 \le 6\int |d\chi_{ij}|_{g_i}^2\,dV_{g_i}
      +Y_i\|\chi_{ij}\|_{2,g_i}^2 .
\]
The shell volume tends to zero, so the limit is
\(y\sqrt{\alpha_j}\le y\alpha_j\).
Since \(y>0\), every \(\alpha_j\) is zero or one.
Exactly one, say \(\alpha_{j_*}\), is one.

Set \(\chi=1-\chi_{ij_*}\) at the same fixed radius.
Its physical support volume tends to zero because
\(\chi\) vanishes on \(V_{ij_*}(r)\), which carries unit
volume in the limit. Hölder and the source Yamabe
inequality give
\[
 Y_i\left(1-\operatorname{Vol}_{g_i}(\operatorname{supp}\chi)^{1/2}\right)
       \|\chi\|_{4,g_i}^2
 \le 6\int |d\chi|_{g_i}^2\,dV_{g_i}
 \le C_r c_i^2 .
\]
The coefficient on the left is bounded away from zero.
Thus the volume of \(\{\chi=1\}\) in the constant
rescaling \(c_i^{-2}g_i\) is uniformly bounded:
\[
 \operatorname{Vol}_{c_i^{-2}g_i}(\{\chi=1\})
       \le c_i^{-4}\|\chi\|_{4,g_i}^4\le C'_r .
\]
In particular, for every \(j\ne j_*\), the same bound
holds on the source images of compact subannuli exhausting
the punctured ball about \(p_j\). Each fixed subannulus
compares smoothly by (1), and taking its sequence limit
first and then exhausting gives finite volume of that
punctured ball in \(w^2h\). A positive \(a_j\) would give
volume density comparable to \(r^{-8}\,dV_h\) there and
infinite volume. Hence \(a_j=0\) for \(j\ne j_*\).
By (3), \(a_{j_*}>0\), and \(w(x_0)=1\) gives
\(w=G_h(p_{j_*},\cdot)/G_h(p_{j_*},x_0)\).
The unique genuine pole is precisely the puncture
whose physical exterior carries all the original volume.

## Residual and smooth-type consequence

The filled limit is \(X=N\setminus\{p_{j_*}\}\) with
the one Euclidean end above. Write
\(e_N=E_+(h)=E_-(h)\), using signature zero of \(N\).
The two total Weyl integrals are conformally invariant
on \(N^\circ\), and the finitely many smooth omitted
points have zero energy measure in the filled metric
\(g_X=w^2h\). They therefore equal \(e_N\) on \(X\).
By (1) on fixed truncations avoiding all marks, followed
by exhaustion, \(e_N\le e\) and
\[
 d:=\int_X|\operatorname{Ric}_{g_X}|^2\,dV_{g_X}
 \le D:=\lim_i\int_M|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}.
\]
The latter uses scalar-flatness on \(X\), invariance
of the trace-free Ricci squared integral under constant
rescaling, and that smooth filled marks have measure zero.
Here the limit \(D\) exists by SEC's scalar and chiral
band identity. This measure exhaustion requires no
extension of a source map across the smooth filled marks.

Since \(\chi(X)=1\), the single trivial Euclidean end
contributes one to the normalized Euler identity.
Scalar-flat Gauss–Bonnet in the SEC normalization
therefore gives \(d=4e_N\). Substituting in the source
Euler identity gives
\[
 e-e_N\ \ge\frac{Y_{\rm rd}^2-y^2}{48}>0 .
\]
When \([h]\) is nonround, its closed positive-Yamabe
Bach-flat energy satisfies \(e_N>4\pi^2\) by SEC §12.1.
It follows from the upper margin that
\(0<e-e_N<4\pi^2-\delta\). The original whole conformal
comparisons of \(N\setminus P\) meet the finite-puncture
transfer lemma in exactly this residual range, so
\(M\cong N\) by an oriented diffeomorphism. The class
of \(h\) on \(M\) gives \(I^+(M)\le e_N<e\).
Thus positive-class minimizing selection \(e=I^+(M)\)
excludes the evacuated nonround branch. The strict
residual also excludes it for near-minimal excess below
\((Y_{\rm rd}^2-y^2)/48\).
[SEC §§11.1–11.2 and 12.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868) · [NECK finite-puncture transfer](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md)

This supplies a complete scalar-flat Bach-flat end model
and a constant-scale smooth comparison on \(N^\circ\).
The zero-residue points become smooth points of the filled
metric. The given hypotheses may still omit their images,
so a comparison embedding on an entire filled compact
truncation remains an additional geometric input.
