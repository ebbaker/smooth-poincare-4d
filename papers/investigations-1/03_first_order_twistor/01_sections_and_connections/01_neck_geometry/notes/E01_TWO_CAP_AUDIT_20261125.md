# Two-cap metric audit · SP4-FOT-NECK-E01

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Exact serving model and reasoning effort
are unavailable. This is a conditional proof for one supplied spherical
cut. The frozen input hashes and scope are in the [request](../research-progress/handoffs/E01_REQUEST_20261125.md).
The chiral norm and Bach normalization are those in SEC §§1.1, 8.1 and
14.1. [SEC working source](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)
· [Supplied cap construction](../brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md)

## Setting and bounds

Let \((M,g)\) be a smooth closed oriented Riemannian homotopy four-sphere
with \(Y_0=Y([g])>0\). Let \(\ell\ge1\) and suppose there is a smooth
oriented embedding of \((-\ell-2,\ell+2)\times S^3\). In this chart
assume a smooth conformal representative \(h=\omega^2g\), with the
pullback understood and any constant rescaling included in \(\omega>0\).
Write
\[
 h_0=dt^2+\gamma,\qquad \gamma=g_{S^3(1)},\qquad
 \eta_2=\|h-h_0\|_{C^2(h_0)}
\]
on the full strip. The norms sum the suprema of covariant derivatives
through the indicated order in \(h_0\). When testing Bach error also
assume \(\|h-h_0\|_{C^4(h_0;\,[-1,1]\times S^3)}\le\eta_4\).

Use inherited orientations on the two retained sides. For a region
\(U\), write \(E_\sigma(g;U)=\int_U|W^\sigma_g|_{\rm HS}^2\,dV_g\)
for \(\sigma=\pm\), with \(W^\sigma\) the endomorphism on the real
\(\Lambda^\sigma\). Then
\(|W|_{\rm tens}^2=4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)\).
Write \(\mathfrak B(g;U)=\int_U|B_g|_g\,dV_g\) with \(B\) covariant
and first variation of the full tensor Weyl functional equal to
\(-4\int\langle B,\dot g\rangle\,dV\) for compactly supported variations.

There are constants \(\eta_*>0,C_W,C_Y,C_I,C_B>0\), independent of
\(\ell\), the physical scale and the geometry of the core, with the
following properties. Keep \(\eta_2\le\eta_*\) and \(C_Y\eta_*\le1/2\).
The two caps constructed below give \(\widehat g_j\), \(j=1,2\).
Let \(T_j\) be the original unit splice strip on its side and \(U_j\)
the rest of that retained side, with common boundaries ignored in
integrals. There are nonnegative splice contributions \(a_{j,\sigma}\)
such that
\[
 \begin{split}
 E_\sigma(\widehat g_j)&=E_\sigma(g;U_j)+a_{j,\sigma},\\
 \sum_{j,\sigma}a_{j,\sigma}&\le C_W\eta_2^2,\\
 Y([\widehat g_j])&\ge
 \min\{Y_0,(1-C_Y\eta_2)Y_{\rm rd}\}-C_I\ell^{-3/2},
 \qquad Y_{\rm rd}=8\sqrt{6}\,\pi.
 \end{split}                                                    \tag{1}
\]
For \(\eta_4\le 1\) the same construction gives nonnegative \(b_j\)
with
\[
 \mathfrak B(\widehat g_j)=\mathfrak B(g;U_j)+b_j,\qquad
 b_1+b_2\le C_B\eta_4.                                         \tag{2}
\]
The constants depend only on the dimension, the unit round model, the
fixed smooth cap and cutoff profiles, and the tensor conventions.
The conclusions concern the capped conformal classes and the integrated
curvatures in any smooth representative of each class.

## Geometry and fixed cap

The slice \(\Sigma=\{t=0\}\) separates \(M\). If the complement were
connected, a curve crossing the slice once could be closed in the
complement, contradicting \(H_3(M;\mathbb Z)=0\) by intersection number.
The slice is two-sided and connected, so cutting gives two connected
compact manifolds \(P_j\) with boundary. Van Kampen for their union
along \(S^3\) makes each simply connected. In Mayer–Vietoris the
fundamental class boundary map \(H_4(M;\mathbb Z)\to H_3(\Sigma;\mathbb Z)\)
is an isomorphism. Together with the homology of \(M\) and \(\Sigma\)
this implies \(H_k(P_j;\mathbb Z)=0\) for \(k=1,2,3\).
Filling each boundary with \(B^4\) produces a simply connected
integral homology sphere. The Hurewicz and Whitehead theorems make it
a homotopy four-sphere. Identify each cap boundary by the supplied
sphere coordinates, choosing the cap orientation to give the inherited
orientation on the glued manifold.

Extend the incoming conformal gauge to all of \(M\) by multiplying
\(\log\omega\) in the collar by a smooth cutoff equal to one on
\([-\ell-1,\ell+1]\times S^3\), extending by zero, and exponentiating.
Call the global representative \(g_*\). On each side use the
coordinate \(x=|t|\) increasing away from the cap. Interpolate on
\(T_j=(0,1)\times S^3\) using one fixed smooth
\(0\le\theta\le1\) equal to zero near \(x=0\) and one near \(x=1\),
\[
 k_j=h_0+\theta(x)(h-h_0).
\]
Here on each side \(h,h_0\) denote the pulled-back tensors in its
coordinates. The interpolation is positive by convexity. On the
rest of \(P_j\) use \(g_*\). The unmodified buffer
\((1,1+\ell)\times S^3\) is therefore shared by both the source
and the corresponding capped metric. There is spare collar width
to extend smooth tests beyond the endpoint.

For both caps fix \(b=ds^2+a(s)^2\gamma\), \(0\le s\le s_b\).
One construction starts with \(\widetilde a'(s)=\cos(s)\zeta(s)\)
on \(0\le s<\pi/2\), where \(\zeta\) is smooth nonnegative,
nonincreasing, equal to one near zero and zero near \(\pi/2\).
Continue the derivative by zero thereafter. Take
\(\widetilde a(0)=0\), let \(A>0\) be the eventual constant
\(\widetilde a\), and set \(a(s)=A^{-1}\widetilde a(As)\).
Choose \(s_b\) in the constant region. Thus the center has a
smooth round germ \(a(s)=A^{-1}\sin(As)\), the boundary has
\(a=1\) on a neighborhood, and \(0\le a'<1\), \(a''\le0\)
away from the center. The three radial sectional curvatures are
\(-a''/a\) and the three tangential ones are \((1-(a')^2)/a^2\).
Consequently
\[
 R_b=6\left(\frac{1-(a')^2}{a^2}-\frac{a''}{a}\right)>0
\]
away from the center, with \(R_b(0)=12A^2\). The cap glues
smoothly because \(k_j=h_0\) near the attaching slice. The
reference cap extended beyond \(s_b\) by the unit product on
\([0,\infty)\times S^3\) is denoted \(b_\infty\), and its scalar
curvature is bounded below by a fixed \(m_0>0\).

In the radial coordinate \(\rho=\exp(\int_{s_0}^s a(v)^{-1}\,dv)\)
on \(b_\infty\), \(\rho\) ranges from zero to infinity and the
metric is \((a/\rho)^2(d\rho^2+\rho^2\gamma)\). The round germ
gives \(\rho=c\tan(As/2)\) near zero for a constant \(c>0\),
so \(a/\rho\) extends smoothly and positively at zero. This
is a global conformal identification with \(\mathbb R^4\), and
the exact cap and product have \(W=B=0\).

## Weyl cost

Product differentiation gives
\(\|k_j-h_0\|_{C^m(h_0;T_j)}\le c_m\|h-h_0\|_{C^m(h_0;T_j)}\)
for the fixed \(\theta\). Use translated product-coordinate charts
on the cylinder with a fixed finite angular atlas. In these charts
the Weyl tensor and scalar curvature are smooth functions of the
metric two-jet on a bounded neighborhood of the product jets,
with a uniform inverse metric bound. Their differences from the
product values are bounded in pointwise norm by \(C\eta_2\), by
the mean-value theorem. In particular on \(T_j\),
\[
 |W_{k_j}|_{{\rm tens},k_j}\le C\eta_2,\qquad
 \operatorname{Vol}_{k_j}(T_j)\le C.
\]
The Hodge star on two-forms in dimension four is unchanged under
\(g\mapsto f^2g\) with \(f>0\). The Weyl endomorphism scales by
\(f^{-2}\) while \(dV\) scales by \(f^4\), so each chiral energy
density is pointwise invariant. Set \(a_{j,\sigma}=E_\sigma(k_j;T_j)\).
The four-index norm conversion and bounded splice volumes give
\(\sum_{j,\sigma}a_{j,\sigma}\le C_W\eta_2^2\).
The cap contributes zero and the shared \(U_j\) has its incoming
energy. Thus the net change for either chirality is
\[
 \sum_{j=1}^2 E_\sigma(\widehat g_j)-E_\sigma(g)
   =\sum_{j=1}^2\big(a_{j,\sigma}-E_\sigma(g;T_j)\big).
\]
The single-side bound uses only its unchanged region. A
constant physical scale factor \(r^2\) makes the Weyl norm
\(r^{-2}\) times its product-scale value and the volume \(r^4\)
times its product-scale value. Their powers cancel in the
energy. The same calculation with \(f\) pointwise covers the
full collar factor.

## Yamabe localization on each side

Use \(\Delta_g=\operatorname{div}_g\nabla\) and define
\[
 L_g=-6\Delta_g+R_g,\qquad
 Q_g(u)=\int(6|du|_g^2+R_gu^2)\,dV_g,\qquad
 N_g(u)=\|u\|_{L^4(g)}^2.
\]
The conformal relation \(L_{f^2g}u=f^{-3}L_g(fu)\) yields
\(Q_{f^2g}(u)=Q_g(fu)\) and \(N_{f^2g}(u)=N_g(fu)\) for smooth
tests on closed manifolds or with compact support. On a closed
manifold the Yamabe inequality holds for signed smooth tests by
approximating \(|u|\) with \(\sqrt{u^2+\varepsilon^2}\).
Under constant scaling \(r^2g\), both \(Q_g(u)\) and \(N_g(u)\)
scale by \(r^2\) at fixed \(u\). [Lee–Parker, §2 Eq. (2.7), §3 Theorems
3.2–3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

The compactly supported Yamabe constant of \(b_\infty\) equals
\(Y_{\rm rd}=12\,\operatorname{Vol}(S^4(1))^{1/2}\).
The conformal identification carries compactly supported tests
to compactly supported Euclidean tests with the same quotients.
By stereographic projection each such test is equivalent to one
on \(S^4\) supported off the projection point, where the sharp
round Yamabe inequality applies. Conversely, on the round
sphere cut the constant function off inside a ball of radius
\(2\varepsilon\) about the projection point, with gradient
bounded by \(C/\varepsilon\). The lost volume is
\(O(\varepsilon^4)\) and the extra Dirichlet energy is
\(O(\varepsilon^2)\), giving quotients tending to the round
value. [Lee–Parker, §3 Theorems 3.2–3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

Fix a smooth angle \(\alpha\) on \(\mathbb R\) equal to zero
near and below zero and equal to \(\pi/2\) near and above one.
In the buffer let
\[
 \chi=\sin\alpha((x-1)/\ell),\qquad
 \xi=\cos\alpha((x-1)/\ell).
\]
Extend them as constants towards the core and the cap. For a
smooth real test \(u\) on the capped manifold,
\(\chi u\) extends by zero to a smooth function on \(M\).
Because its support avoids the splice, its numerator and
denominator agree with those in \(g_*\). Hence
\(Q_{\widehat g_j}(\chi u)\ge Y_0 N_{\widehat g_j}(\chi u)\).
The test \(\xi u\) can be transplanted to \(b_\infty\) and
extended by zero since it vanishes near the far end of the
buffer. Its support consists of the cap, splice and part of the
product buffer. On this comparison region the \(C^2\) deviation
from \(b_\infty\) is at most \(C\eta_2\), and it vanishes on the
cap. The estimates on scalar curvature and the uniform
positive \(m_0\) give \(R_{\widehat g_j}\ge(1-C\eta_2)R_{b_\infty}\)
there. The inverse metric and volume comparisons give gradient
density control from below by \(1-C\eta_2\) and yield
\(N_{\widehat g_j}(v)\le(1+C\eta_2)N_{b_\infty}(v)\)
on this region. Thus for \(v=\xi u\),
\[
 Q_{\widehat g_j}(v)\ge(1-C_Y\eta_2)Y_{\rm rd}N_{\widehat g_j}(v).
\]
All comparison constants are pointwise and independent of
the buffer length.

The identity \(\chi^2+\xi^2=1\) cancels the cross terms in
the two Dirichlet forms, giving the exact IMS identity
\[
 Q_{\widehat g_j}(u)
  =Q_{\widehat g_j}(\chi u)+Q_{\widehat g_j}(\xi u)
       -6\int F u^2\,dV_{\widehat g_j},
 \qquad F=|d\chi|^2_{\widehat g_j}+|d\xi|^2_{\widehat g_j}.
\]
On the buffer \(F=\ell^{-2}|\alpha'((x-1)/\ell)|^2|dx|^2_{\widehat g_j}\).
Here \(|dx|\le C\) and the buffer volume is at most \(C\ell\),
so \(\|F\|_2\le C\ell^{-3/2}\). Hölder bounds the loss by
\(C_I\ell^{-3/2}N_{\widehat g_j}(u)\). Equivalently, at constant
physical scale \(r\), \(F=O(r^{-2}\ell^{-2})\) and the buffer
volume is \(O(r^4\ell)\). Even for a variable factor \(f\),
\(F_{f^2\widehat g_j}=f^{-2}F_{\widehat g_j}\) and its \(L^2\)
norm is unchanged. The error form in the new gauge is the
old error form evaluated at \(fu\).

The power \(\ell^{-3/2}\) is attained in the raw error
estimate relative to \(N\) on the exact round product.
Choose an interval of fixed positive length in the angle
variable on which \(|\alpha'|\) is bounded below, and let
\(u(x)=\varphi((x-1)/\ell)\) for a nonzero smooth \(\varphi\)
supported in that interval. Then \(\int F u^2\) is a positive
constant times \(\ell^{-1}\) and \(N(u)\) is a positive constant
times \(\ell^{1/2}\). This tests the multiplier bound for the
chosen cutoff. Finally,
\[
 N_{\widehat g_j}(u)
 \le N_{\widehat g_j}(\chi u)+N_{\widehat g_j}(\xi u)
\]
by the \(L^2\) triangle inequality applied to the squares.
Multiply by \(\min\{Y_0,(1-C_Y\eta_2)Y_{\rm rd}\}>0\),
use the two form bounds, subtract the IMS error and take the
infimum. This proves (1) on each side.

## Bach cost and its gauge

The covariant tensor
\(B_{ij}=\nabla^k\nabla^lW_{ikjl}+\tfrac12\operatorname{Ric}^{kl}W_{ikjl}\)
is a smooth function of the metric jets through order four.
The \(C^4\) cutoff estimate and the same bounded-neighborhood
argument as for Weyl yield \(|B_{k_j}|_{k_j}\le C\eta_4\)
relative to \(B_{h_0}=0\). The splice volumes are bounded,
giving \(b_j=\mathfrak B(k_j;T_j)\) with \(b_1+b_2\le C_B\eta_4\).
[SEC §14.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5195)

For the conformal weight, vary a metric \(k\) by an arbitrary
compactly supported symmetric covariant \(v\). The Weyl
functional in the variation \(f^2(k+\tau v)\) equals that in
\(k+\tau v\) for fixed positive smooth \(f\). In the first
variation, \(\langle B_{f^2k},f^2v\rangle_{f^2k}dV_{f^2k}
=f^2\langle B_{f^2k},v\rangle_kdV_k\). Equality for all \(v\)
gives \(B_{f^2k}=f^{-2}B_k\) as a covariant tensor. Its pointwise
metric norm therefore scales by \(f^{-4}\), and
\[
 |B_{f^2k}|_{f^2k}\,dV_{f^2k}=|B_k|_k\,dV_k .
\]
This applies in particular to \(f=r\) and on \(U_j\) to the
change between \(g\) and \(g_*\). On the exact cap \(B=0\).
These give (2) without a pointwise estimate on the physical
conformal factor. A subsequent Yamabe gauge on a capped piece
has the same total Bach norm. Small normalized \(C^2\) error
alone leaves \(\nabla^2W\) in the central splice uncontrolled
by this jet estimate. [Bahuaud–Guenther–Isenberg–Mazzeo,
§1, first variation and Eq. (1.1), arXiv:2508.06633v1](https://arxiv.org/html/2508.06633v1)

## Strict margins and order of choices

If \(Y_0\ge y_0>0\), put \(y_*=\min\{y_0,Y_{\rm rd}/2\}\).
For a prescribed positive chiral energy margin \(m_E\), first
choose a finite \(\ell\ge1\) with \(C_I\ell^{-3/2}\le y_*/2\).
Then ask for a strip of that length with
\[
 \eta_2\le\min\{\eta_*,(m_E/(2C_W))^{1/2}\}.
\]
Both capped Yamabe constants are at least \(y_*/2\), and the
added energy in any one chirality is at most \(m_E/2\) in
total. For example, from \(E_+(g)\le8\pi^2-\delta\) and
\(Y_0\ge\sqrt{48\delta}\) in the source band, take
\(m_E=\delta\). The sum of the two positive chiral energies is
at most \(8\pi^2-\delta/2\). If the energy on one unchanged
side is at most \(4\pi^2-m_E\), that particular capped side
has \(E_+\le4\pi^2-m_E/2\). The margin is measured against
a supplied incoming budget on the stated domain. [SEC §11.1,
band estimate](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

For a supplied smoothly convergent sequence at a Euclidean end,
the usage is to fix \(\ell\) and the error thresholds first,
then choose a fixed large end radius where the entire strip
meets them, then take large sequence index using smooth
convergence on the fixed truncation. If a Bach allowance is
needed, set the extra central \(C^4\) threshold at that same
stage, or explicitly retain \(C_B\eta_4\) in the bound.
A fixed positive \(\eta_4\) controls a fixed Bach allowance.
To infer vanishing total Bach norm of the capped sequence
from (2), require \(\mathfrak B(g_i)\to0\) and vanishing
transition errors, for instance in an iterated comparison
with end radius tending to infinity after the sequence
limsup at each fixed truncation. The estimates depend on one
unit splice per side and on a supplied buffer for each side.
Deriving these strips from the sequence is the geometry
task in NECK-B01. [Supplied-collar end comparison](../brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md#how-to-obtain-a-collar-with-these-hypotheses)
