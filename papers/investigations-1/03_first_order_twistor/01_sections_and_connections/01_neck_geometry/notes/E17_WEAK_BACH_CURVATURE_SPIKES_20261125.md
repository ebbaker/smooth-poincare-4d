# Curvature spikes in the weak Bach band

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is the fixed-source and diagonal stress
test in [E17 revision 1](../research-progress/handoffs/E17_REQUEST_20261125.md).
Use smooth oriented Riemannian four-manifolds, positive chiral Weyl
Hilbert–Schmidt energy and the four-index full Riemann norm of SEC.
[SEC §11.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

## Statement

Fix \(p>4\) and \(0<\beta<4/p\). Suppose a sequence \(g_i\) of
smooth unit-volume positive Yamabe minimizers on smooth closed
oriented homotopy four-spheres is supplied, with each energy in the
interior of the SEC band and \(\int |B_{g_i}|\,dV_i\to0\).
Choose any point \(q_i\) in any prescribed nonempty open part
\(O_i\) of a selected low-energy block, or of the source.
There are smooth metrics \(m_i\) differing from \(g_i\)
only on arbitrarily small coordinate balls about \(q_i\), with
\(\|m_i-g_i\|_{C^1(g_i)}+\|m_i-g_i\|_{W^{2,p}(g_i)}\to0\).
For **every** choice of unit-volume Yamabe minimizing
representative \(\widehat g_i\in[m_i]\), the fixed band,
vanishing total Bach norm and any positive-class near-minimal
energy property of the original sequence persist. There are
radii \(\sigma_i\downarrow0\), independent of the choice of
minimizing representative, such that
\[
 B_{\widehat g_i}(q_i,2\sigma_i)\subset O_i,\qquad
 \int_{B_{\widehat g_i}(q_i,2\sigma_i)}
       |{\rm Rm}_{\widehat g_i}|_{\rm tens}^2\,dV_{\widehat g_i}
      \ \longrightarrow 0,\qquad
 \sigma_i^2|W_{\widehat g_i}(q_i)|_{\rm tens}
       \ \longrightarrow\infty .
\]
Thus even small local full curvature energy and small local
total Bach norm allow failure of a pointwise estimate at the
intrinsic ball scale in the actual Yamabe gauge.

## A localized nonconformal jet

Work first at one fixed \(g=g_i\) and point \(q=q_i\).
In oriented \(g\)-normal coordinates on a fixed ball, let
\(\chi\in C_c^\infty(B_1(0))\) be nonnegative and equal to
one near zero. Put
\[
 A_r=r^{2-\beta},\qquad
 v_r=A_r\,\chi(x/r)(x_1/r)^2\,dx^2\otimes dx^2,\qquad
 m_r=g+v_r .
\]
Here \(dx^2\) is the second Cartesian coordinate one-form.
Extend by zero outside the coordinate ball of radius \(r\).
For sufficiently small \(r\) this gives a smooth positive
metric. Its derivatives on the support obey
\(|D^j v_r|\le C_j A_r r^{-j}\). In fixed source norms,
\[
 \|v_r\|_{C^1(g)}=O_g(r^{1-\beta}),\qquad
 \|v_r\|_{W^{2,p}(g)}=O_g(r^{4/p-\beta}).
\]
Both exponents are positive. At \(q\) the perturbation and
its first jet vanish. Its only nonzero second metric
derivative there is \(\partial_1^2(v_r)_{22}=2r^{-\beta}\).
The normal-coordinate curvature formula therefore changes
only the \(12\)-plane algebraic curvature, by a sectional
component \(k=\pm r^{-\beta}\) according to sign convention.
For a curvature tensor supported on that one plane the
\(1212\) Weyl component is \(k/3\): the two Ricci
components in the plane equal \(k\) and the scalar trace
equals \(2k\). Hence
\[
 |W_{m_r}(q)|_{\rm tens}\asymp_g r^{-\beta}.
\]
A conformal change with the same metric value at \(q\)
would leave that Weyl tensor unchanged there. This verifies
that the inserted jet is nonconformal.

All curvature contributions outside the support agree with \(g\).
On the support the full Riemann tensor is \(O_g(1+r^{-\beta})\)
and the volume is \(O_g(r^4)\). Consequently the integrated full
curvature changes by \(O_g(r^{4-2\beta})\). The same bound holds
for the total variation of either chiral Weyl energy measure,
viewed as measures on the original manifold. Each term of
the covariant Bach tensor in coordinates has smooth
metric-dependent coefficients and is a combination of
derivative products of total differential order at most
four. This follows from the two covariant derivatives of
Weyl and the Ricci–Weyl term. Expanding the change, a term
with at least one perturbation factor of positive derivative
order is \(O_g(A_r r^{-4})\) on the support, because
\(A_r\le1\) and the total derivative count is at most four.
A difference involving only changed coefficients is \(O_g(A_r)\)
against the fixed metric jets. Norm and volume comparisons
are uniform. Thus
\[
 \left|\int |B_{m_r}|\,dV_{m_r}-\int |B_g|\,dV_g\right|
 \le C_g A_r .
\]
The same argument bounds the variation of the corresponding
norm measures on the source. These estimates concern a
fixed background as \(r\downarrow0\); the constants may
depend on \(g,q\).

## Normalization compactness at each fixed source

Write \(Y=Y([g])>0\). Positive chiral energy implies that
the class is nonround, so \(Y<Y_{\rm rd}\) by Schoen's strict
inequality. Fix any smooth \(m_j\to g\) in \(C^1\) and
\(W^{2,p}\), including a sequence of \(m_r\) above. Write
\(R_j=R(m_j)\), \(Y_j=Y([m_j])\). Then
\(R_j\to R_g=Y\) in \(L^p(g)\) by the coordinate scalar
curvature formula and uniform inverse metric bounds.
For the Yamabe quadratic forms
\(Q_m(f)=\int(6|df|_m^2+R_m f^2)\,dV_m\) this gives
\[
 |Q_{m_j}(f)-Q_g(f)|
   \le o(1)\left(\|df\|_{2,g}^2+\|f\|_{4,g}^2\right)
\]
uniformly in \(f\). The \(L^4\) denominators agree up to
multiplicative \(1+o(1)\). Since \(Q_g(f)\ge6\|df\|_2^2\)
and \(Q_g(f)\ge Y\|f\|_4^2\), these estimates bound
\(Y_j\) from below by \(Y-o(1)\). Testing with the constant
function gives \(Y_j\le Y+o(1)\). In particular all sufficiently
large \(j\) have \(0<Y_j<Y_{\rm rd}\).
[Schoen, Theorem 2](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf) · [Lee–Parker, §§2 and 4](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

Take an arbitrary choice of positive minimizer \(u_j\) with
\(\int u_j^4\,dV_{m_j}=1\). Then \(u_j^2m_j\) has unit
volume and scalar \(Y_j\). The form estimate and normalization
give boundedness in \(H^1(g)\) and \(Q_g(u_j)\to Y\).
By Rellich, on a subsequence \(u_j\rightharpoonup u\) in
\(H^1\), strongly in \(L^2\), and almost everywhere.
Write \(a=\int u^4\,dV_g\in[0,1]\). The fourth-power
splitting gives \(\|u_j-u\|_4^4=1-a+o(1)\).
The sharp local Sobolev constant on the fixed source yields,
for every \(\epsilon>0\),
\[
 (Y_{\rm rd}-\epsilon)\|w\|_4^2
 \le 6\|dw\|_2^2+C_\epsilon\|w\|_2^2 .
\]
Apply this to \(w=u_j-u\), whose \(L^2\) norm tends to zero.
Weak \(H^1\) convergence splits the gradient energy. The
Yamabe inequality for \(u\) and then \(\epsilon\downarrow0\)
give
\[
 Y\ge Y\sqrt a+Y_{\rm rd}\sqrt{1-a}.
\]
The right-hand side is strictly larger than \(Y\) when
\(a<1\), using \(Y>0\) and \(Y<Y_{\rm rd}\). Thus \(a=1\);
both the \(L^4\) difference and the remaining gradient
energy tend to zero. The limit \(u\) is a normalized
minimizer for \(g\). [Brezis–Lieb, Theorem 1](https://www.mat.ufpb.br/jmbo/papers/Brezis/Brezis-Lieb.pdf) · [Lee–Parker, Theorems 2.3 and 3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For the higher norm, the equation
\[
 -6\Delta_{m_j}u_j=(Y_j u_j^2-R_j)u_j=V_j u_j
\]
uses \(\Delta=\operatorname{div}\nabla\).
The strong \(L^4\) convergence and scalar convergence
give strong \(L^2(g)\) convergence of \(V_j\) along the
subsequence. For any fixed \(q\ge4\), truncate \(V_j\)
at a common finite level \(L_q\) so that the \(L^2\)
norm of its remainder is as small as needed for that \(q\).
Test the equation with \(u_j^{q-1}\), giving the positive
gradient coefficient \(24(q-1)/q^2\) on
\(\|d(u_j^{q/2})\|_2^2\). The uniform \(H^1\to L^4\) Sobolev
estimate for \(m_j\), Hölder on the \(L^2\)-small remainder
and absorption give
\(\|u_j\|_{2q}^q\le C_q\|u_j\|_q^q\).
Starting from \(q=4\), finitely many such steps bound
\(u_j\) in a high enough finite \(L^q\) that
\(Y_j u_j^3-R_j u_j\) is bounded in \(L^s\) for some \(s>2\).

Use the fixed \(g\) elliptic \(W^{2,s}\) estimate and
\(\|\Delta_{m_j}-\Delta_g\|_{W^{2,s}\to L^s}\to0\),
which follows directly from \(C^1\) convergence in the
global finite atlas. Absorption gives the same estimate
for \(m_j\). Consequently \(u_j\) is bounded in \(W^{2,s}\)
and hence \(L^\infty\). The full equation then has uniformly
bounded right-hand side in \(L^p\). The same argument
gives \(W^{2,p}\) bounds and compactness in \(C^1\).
In the fixed \(g\) equation the right-hand sides converge
in \(L^p\), using the \(C^0\) convergence and
\(R_j\to R_g\) in \(L^p\), with an additional \(o(1)\)
term from \(\Delta_{m_j}-\Delta_g\) on the \(W^{2,p}\)-bounded
solutions. The fixed elliptic estimate applied to
\(u_j-u\) gives strong \(W^{2,p}\) convergence.
The limiting normalized minimizer is smooth by its own
equation and bootstrapping, and strictly positive by the
strong maximum principle since it is nonnegative and
nonzero. [Lee–Parker, Theorems 2.2, 2.5 and 2.6](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

This subsequence argument applies to **every** sequence
of normalized minimizing factors. In particular for fixed
\(g\) and for all small \(r\), every such \(u_r\) for
\(m_r\) has a common positive lower bound, a common upper
bound and a common \(W^{2,p}\) bound. Any failure would
give a sequence contradicting convergence to a strictly
positive smooth \(u\). The same argument with constant
background \(g\) gives compactness of the set of its
normalized minimizing factors. Uniformly over the
minimizers for \(m_r\), their \(W^{2,p}\) distance to this
set therefore tends to zero. If the set consists just of
\(1\), then \(u_r\to1\) uniformly over these choices in
\(W^{2,p}\) and \(C^1\).

## The intrinsic diagonal

For fixed \(i\) the actual Yamabe metrics
\(\widehat g_{i,r}=u_{i,r}^2m_{i,r}\) are uniformly
bilipschitz to \(g_i\) and uniformly bounded in \(W^{2,p}\),
over all small \(r\) and all minimizing factors. The
curvature tensor formula gives a uniform \(L^p\) norm bound
for their full curvature, with a constant depending on \(i\).
Uniform metric equivalence and the smooth fixed source's
small-ball geometry give
\[
 \operatorname{Vol}_{\widehat g_{i,r}}
    B_{\widehat g_{i,r}}(q_i,2\sigma)\le C_i\sigma^4
\]
for all sufficiently small \(\sigma\), uniformly in \(r,u_{i,r}\).
Consequently Hölder bounds the full curvature energy on
that ball by \(C'_i\sigma^{4-8/p}\). First choose
\(\sigma_i\) small enough that this is at most \(1/i\)
and the metric ball is in \(O_i\) for every such
representative. The uniform equivalence allows this
by taking a small original \(g_i\)-ball about \(q_i\)
inside \(O_i\). The \(\sigma_i\) may be taken decreasing
to zero and below any prescribed positive scale ceilings.

Weyl norm is conformally covariant, so at the center
\[
 |W_{\widehat g_{i,r}}(q_i)|_{\rm tens}
   =u_{i,r}(q_i)^{-2}|W_{m_{i,r}}(q_i)|_{\rm tens}
   \ge c_i r^{-\beta} .
\]
Now choose \(r_i\) still smaller so the support has radius
much less than \(\sigma_i\) in all the metrics under
consideration and \(c_i\sigma_i^2 r_i^{-\beta}\ge i\).
At the same step make the original \(C^1,W^{2,p}\) errors,
chiral measure variation, Bach increment and Yamabe
constant difference at most \(1/i\), and choose the
energy deviation smaller than the distance to the two
band endpoints. These are finitely many conditions per
fixed source. The support can fit inside any further
prescribed open neighborhood of \(q_i\).

The chiral Weyl densities and total Bach norm are unchanged
by the conformal normalization. Thus \(\widehat g_i\)
retains the chiral band and vanishing total Bach norm.
The chiral energy differs from the original by \(o(1)\),
so near-minimality at the positive-class infimum survives
on a fixed source smooth type. For any unit-volume Yamabe
metric on an oriented homotopy four-sphere, SEC gives
\[
 \int |{\rm Rm}|_{\rm tens}^2\,dV
     =16E_++\frac{Y([g])^2}{3}-64\pi^2 .
\]
The equality uses the Gauss–Bonnet and signature formulas
and the curvature decomposition. It shows that the
**global** full curvature integral also changes by \(o(1)\)
after replacing \(g_i\) by any of the Yamabe minimizers,
regardless of possible multiplicity.
[SEC curvature budgets](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

## Quantiles and the extent of the stress test

Chiral masses of prescribed underlying subsets change
uniformly by \(o(1)\), by total variation and conformal
invariance. Their interpretation as distance-ball quantiles
requires additional control of distance in the chosen
Yamabe representatives. Before Yamabe normalization, the
diagonal can make \(m_i\) arbitrarily close to \(g_i\)
in bilipschitz distortion. The same is true after normalization
if each original unit-volume minimizing representative is
unique in its conformal class. In that case, or with
additional distance distortion control, suppose the original
radii \(a_i,b_i\) have quantile mass \(\eta\) on their two
radial sides and \(b_i/a_i\to\infty\). If distances in the
final and original gauges satisfy
\(l_i d_{g_i}\le d_{\widehat g_i}\le L_i d_{g_i}\)
and \(l_i b_i/(L_i a_i)\to\infty\), the inner ball of radius
\(L_i a_i\) and the outer complement at radius \(l_i b_i\)
retain mass at least \(\eta-o(1)\). Continuity and
monotonicity of the distance-ball mass give separated
exact quantiles for any fixed \(0<\eta'<\eta\).
Fixed-source compactness alone permits a change to a
different original minimizing representative. Its bounds
may depend on \(i\), so they do not imply the distance
criterion for the supplied \(g_i\)-quantiles.

The conclusion concerns the exact-style pointwise
curvature estimate under the weaker integrated Bach
hypothesis. The intrinsic energy of the witnessing balls
is arbitrarily small, and the dimension-four total Bach
norm is small even globally. A first-order chart on a
suitable strip remains compatible with these spikes.
On an already supplied fixed comparison annulus the
perturbation can be made arbitrarily small in \(C^1\)
in that chart by another constraint on \(r_i\), using the
modified metric before Yamabe normalization as a conformal
representative. No step requires a sequence in the band
to exist without the stated source premise.
[E07 first-order cut](E07_FIRST_ORDER_CAP_20261125.md) · [E12 exact benchmark](E12_EXACT_BACH_BALANCED_CUT_20261125.md)
