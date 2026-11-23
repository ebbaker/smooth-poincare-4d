# E240 Closed cutoff realization of the near-round ratio germs

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B111, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored the E236 audit of the
local family and the earlier E215 local test. The present work
uses the assessed E235/E236 germ and proves its stated global
cutoff realization on the already standard smooth sphere.

For all sufficiently small \(\epsilon>0\), put \(r=1+\epsilon\)
and \(R=\epsilon^2\). The prescribed cutoff gives a smooth
globally positive definite, round-compatible connection
\(A_\epsilon\) on the standard positive chiral \(SO(3)\) bundle.
In fixed round background norms,
\[
 \|A_\epsilon-A_{\rm rd}\|_{C^0}\le C_0\epsilon^3,\qquad
 \|A_\epsilon-A_{\rm rd}\|_{C^1}\le C_1\epsilon,\qquad
 \|F_{A_\epsilon}-F_{\rm rd}\|_{C^0}\le C_2\epsilon,
 \qquad
 1+\epsilon\le\sup_{S^4}\rho(Q_{A_\epsilon})\le1+C_3\epsilon .
\]
The constants are independent of \(\epsilon\). On the inner
coordinate ball the connection agrees with the prescribed
E235 polynomial. At its center \(p\) the ratio is \(r\), is a
strict spatial local maximum, and the derivative of its logarithm
on the native original vector field is exactly \(1/2\).

## Fixed old round chart and radial gauge

Take the standard oriented Riemannian round sphere with unit
sectional curvature in the old \(K=1\) metric
\(\widehat g_{\rm rd}\). The native round metric is
\(g_{\rm rd}=2\widehat g_{\rm rd}\). Let \(P_{\rm rd}\) be its
positive chiral \(SO(3)\) bundle, with adjoint bundle \(E\),
and \(A_{\rm rd}\) the round-compatible perfect chiral connection.
Use the old internal pairing \(\delta\) and oriented bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\). Fix an oriented normal chart \(x\)
at \(p\) for \(\widehat g_{\rm rd}\). Its domain includes a closed
coordinate ball \(\overline B_{R_0}\) for some fixed \(0<R_0\le1\).
At \(p\) choose the internal frame by matching the round curvature
to the Euclidean chiral triple
\[
 \Sigma=(dx^{14}+dx^{23},dx^{24}+dx^{31},dx^{34}+dx^{12}).
\]
The old round calibration and sign give
\(F_{{\rm rd},i}(0)=-\Sigma_i\). The displayed constant coefficient
forms are the forms used in the polynomial. The background metric
on the chart is \(\widehat g_{\rm rd}\), with Euclidean value at
the center.

Extend the chosen frame by \(A_{\rm rd}\)-parallel transport along
the radial coordinate curves \(t\mapsto tx\). Smooth dependence of
the transport ODE on \(x\) gives a smooth trivialization at the
center as well. The local connection form has \(x^i(A_{\rm rd})_i=0\).
If \(F_{ij}=F_{\rm rd}(\partial_i,\partial_j)\) are the curvature
coefficients in this trivialization, differentiation of
\(x^i(A_{\rm rd})_i=0\) gives
\(x^iF_{ij}=x^i\partial_i(A_{\rm rd})_j+(A_{\rm rd})_j\).
The bracket term contracts to zero. Thus
\(\frac{d}{dt}(t(A_{\rm rd})_j(tx))=t x^i F_{ij}(tx)\), and
\[
 A_{\rm rd}(x)=\int_0^1 t\,\iota_x F_{\rm rd}(tx)\,dt
             =\tfrac12\iota_x F_{\rm rd}(0)+E_{\rm rd}(x).
\]
Here all coefficients, including the \(x\) in \(\iota_x\), use
the fixed coordinate frame. In coefficient Euclidean norms take
\[
 L=\sup_{|y|\le R_0}\ \sup_{|u|=|z|=1}
         |\iota_z(\partial_u F_{\rm rd})(y)|,\qquad
 C_{\rm rd}=L/3.
\]
The fundamental theorem of calculus gives
\(|E_{\rm rd}(x)|\le C_{\rm rd}|x|^2\).
Differentiating the integral for the remainder in direction \(u\)
gives the two terms \(t\,\iota_u(F_{\rm rd}(tx)-F_{\rm rd}(0))\)
and \(t^2\,\iota_x\partial_u F_{\rm rd}(tx)\). Each has integral
norm at most \(L|u||x|/3\). Hence
\(|DE_{\rm rd}(x)|_{\rm op}\le2C_{\rm rd}|x|\).
The derivative norm here is the operator norm from directions
to coefficient one-forms. This gives the linear coefficient of
the round connection with its precise \(1/2\).
[Assessed old and native calibration](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) ·
[Fixed cutoff choice](../brainstorm/notes/B111_CLOSED_REALIZATION_OF_LOCAL_RATIO_GERMS_20261123.md).

## Uniform polynomial coefficients

For \(0<\epsilon\le1\) put \(h=\epsilon/(2+\epsilon)\). Then the
E235 spectrum is \(Q_r=\operatorname{diag}(1-h,1,1+h)\),
with \(h\le1/3\) and \(h\le\epsilon/2\).
Use \(q=Q_r-I\), \(d=\sqrt{\det Q_r}=\sqrt{1-h^2}\), and
\(s_i=\sqrt{(Q_r)_{ii}}\). Directly,
\[
 |q|\le\epsilon/\sqrt2,\qquad d\le1,\qquad
 |s_i-1|\le h,\qquad s_i^{-1}\le\sqrt{3/2}.
\]
The trace-free gradient
\(G=(\operatorname{diag}(-1/(1-h),0,1/(1+h)))_0\) has
\(|G|\le\sqrt{(3/2)^2+1}<2\) by contraction of the trace-free
projection. The prescribed \(T=\operatorname{diag}(1-h,-2,1+h)\)
has squared norm \(6+2h^2\), so \(|T|\le3\). From the exact
coefficient,
\[
 0<\epsilon\mu(r)
   =\frac{r+1}{32}
       \left(\frac{8(r+1)^2}{r}+\frac{24\epsilon}{\sqrt r}+1\right)
   \le\frac{3(72+24+1)}{32}<10 .
\]
It follows that \(B=-G+\mu(r)T\) has \(|B|\le32/\epsilon\),
and \(U=B-dq/2\) has \(|U|\le33/\epsilon\).
Since \(J_jdx^a\), \(j=1,2,3\), are orthonormal for each
unit axis covector \(dx^a\), the polynomial's adjoint-valued
one-forms \(V_i^a=-\sum_j U_{ij}J_jdx^a/s_j\) satisfy
\[
 |V^a|^2=\sum_{i,j}|U_{ij}|^2/s_j^2,\qquad
 |V^a|\le C_V/\epsilon,\qquad C_V=33\sqrt{3/2}.
\]
All constants here are uniform on \(1<r\le2\).
[Exact E235 coefficients](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md).

In the fixed frame use the prescribed polynomial
\[
 A_r^{\rm loc}(x)=\tfrac12\iota_x F^*
                       +\tfrac16\sum_{a=1}^4(x^a)^3V^a,\qquad
 F_i^*=-s_i\Sigma_i .
\]
The affine difference from the round linear term is
\(\frac12\iota_x(F^*-F_{\rm rd}(0))\), of norm at most
\(\epsilon|x|\) and derivative operator norm at most \(\epsilon\).
Indeed \(|\iota_x\Sigma_i|=|x|\), \(s_2=1\), and
\(|s_1-1|,|s_3-1|\le\epsilon/2\). The cubic term is bounded
by \(C_V|x|^3/(6\epsilon)\) since
\(\sum_a|x^a|^3\le |x|^3\). Its derivative in direction \(u\)
has norm at most \(C_V|x|^2|u|/(2\epsilon)\) by
\(\sum_a|x^a|^2|u^a|\le |x|^2|u|\).
Combining with the radial remainder gives
\[
 \begin{aligned}
 |A_r^{\rm loc}-A_{\rm rd}|
    &\le\epsilon |x|+C_{\rm rd}|x|^2+C_V|x|^3/(6\epsilon),\\
 |D(A_r^{\rm loc}-A_{\rm rd})|_{\rm op}
    &\le\epsilon+2C_{\rm rd}|x|+C_V|x|^2/(2\epsilon).
 \end{aligned}
\]
The polynomial is defined on this fixed chart as an ordinary
connection form. These coefficient bounds do not use a lower
bound for the strict-maximum neighborhood radius in E235.

## Cutoff, curvature and global positive sign

Fix the smooth cutoff \(\chi\) on \(\mathbb R^4\), equal to one
on \(|x|\le1/2\) and zero on \(|x|\ge1\), and write
\(M_\chi=\sup|\chi|\), \(L_\chi=\sup|D\chi|\).
Require \(R=\epsilon^2<R_0\). In the fixed chart set
\(a_\epsilon=\chi(x/R)(A_r^{\rm loc}-A_{\rm rd})\) and extend
by zero. On any chart overlap connection forms transform by
\(A\mapsto g^{-1}Ag+g^{-1}dg\). The inhomogeneous terms of the
two forms cancel in their difference, which therefore transforms
by the adjoint action. Scalar multiplication by \(\chi(x/R)\)
preserves this rule. Its support is contained in the interior of
the chart and it vanishes smoothly at \(|x|=R\) by smoothness
and the exterior plateau. The zero extension is a smooth global
section of \(T^*S^4\otimes E\). In particular
\(A_\epsilon=A_{\rm rd}+a_\epsilon\) is a smooth connection
on the same bundle.

Let \(P_0=\epsilon R+C_{\rm rd}R^2+C_V R^3/(6\epsilon)\)
and \(P_1=\epsilon+2C_{\rm rd}R+C_VR^2/(2\epsilon)\).
The product rule gives the uniform chart bounds
\[
 \|a_\epsilon\|_{C^0({\rm coeff})}\le M_\chi P_0,\qquad
 \|D a_\epsilon\|_{C^0({\rm coeff}),{\rm op}}
     \le M_\chi P_1+L_\chi P_0/R .
\]
With \(R=\epsilon^2\le1\), the first is bounded by
\(C_a\epsilon^3\) with \(C_a=M_\chi(1+C_{\rm rd}+C_V/6)\).
The second is bounded by \(C_b\epsilon\), where
\[
 C_b=M_\chi(1+2C_{\rm rd}+C_V/2)
             +L_\chi(1+C_{\rm rd}+C_V/6).
\]
On the fixed closed chart ball, coefficient norms and the round
tensor norms are uniformly comparable. In the first covariant
derivative the base Levi–Civita and adjoint reference corrections
are fixed bounded coefficients multiplying \(a_\epsilon\). Thus
for a constant \(C_{\rm bg}\ge1\) of the chart and reference,
the fixed-background \(C^1\) norm (using \(\widehat g_{\rm rd}\),
\(\delta\), and \(\nabla^{A_{\rm rd}}\)) is at most
\(C_1\epsilon\) with \(C_1=C_{\rm bg}(C_a+C_b)\).
This uses \(\epsilon\le1\), and the fixed \(C^0\) bound is
\(C_0\epsilon^3\) with \(C_0=C_{\rm bg}C_a\).
The native fixed-background norms differ only by fixed factors.

Expanding \(F=dA+\frac12[A\wedge A]\) gives the exact identity
\[
 F_{A_\epsilon}-F_{\rm rd}
    =d_{A_{\rm rd}}a_\epsilon+\tfrac12[a_\epsilon\wedge a_\epsilon].
\]
In the fixed old norms, alternation gives
\(|d_{A_{\rm rd}}a_\epsilon|\le\sqrt2\,|\nabla^{A_{\rm rd}}a_\epsilon|\).
The bracket term has \(ij\) coefficient \([a_{\epsilon,i},a_{\epsilon,j}]\)
for \(i<j\). The cross-product bound and
\(\sum_{i<j}|a_{\epsilon,i}|^2|a_{\epsilon,j}|^2
\le |a_\epsilon|^4/2\) give its norm at most
\(|a_\epsilon|^2/\sqrt2\). Therefore
\(\|F_{A_\epsilon}-F_{\rm rd}\|_{C^0}\le C_2\epsilon\)
for \(C_2=1+\sqrt2\,C_1+C_0^2/\sqrt2\).

Relative to \(2dV_{\widehat g_{\rm rd}}\) let
\(\mathcal M_{ij}(F)=F_i\wedge F_j/(2dV_{\widehat g_{\rm rd}})\)
in any old orthonormal internal frame. The perfect reference has
\(\mathcal M(F_{\rm rd})=I\). For a unit internal vector \(u\),
write \(F(u)=F_{\rm rd}(u)+b\). The first term has norm
\(\sqrt2\). The absolute coefficient of the wedge of two ordinary
two-forms relative to \(dV_{\widehat g_{\rm rd}}\) is at most
the product of their norms. Expanding \(F(u)\wedge F(u)\) gives
\[
 \|\mathcal M(F_{A_\epsilon})-I\|_{\rm op}
     \le\sqrt2\,C_2\epsilon+\tfrac12 C_2^2\epsilon^2.
\]
The same estimate holds along the pointwise segment from
\(F_{\rm rd}\) to \(F_{A_\epsilon}\). Put
\(C_M=(\sqrt2+1/2)C_2\) and choose
\[
 0<\epsilon<\epsilon_0
     =\min\{1,\sqrt{R_0},1/(2C_M)\}.
\]
Then \(C_2\epsilon\le1\) and the matrix difference norm is
at most \(C_M\epsilon<1/2\) at every point. All matrices
on the segment are positive definite, so their curvature maps
have rank three and positive planes. The orientation sign of
the curvature identification is continuous within this open class
and cannot change along the segment. It equals the reference
round-compatible sign. This verifies positive definiteness of
the actual curvature everywhere.

The normalized quotient is \(3\mathcal M/\operatorname{tr}\mathcal M\).
Its eigenvalue ratio is the ratio of the largest and smallest
eigenvalues of \(\mathcal M\), so
\[
 1\le\rho(Q_{A_\epsilon})
    \le\frac{1+C_M\epsilon}{1-C_M\epsilon}
    \le1+4C_M\epsilon.
\]
At the center the ratio equals \(1+\epsilon\), which gives the
lower bound for its supremum. One can take \(C_3=4C_M\). The
annulus estimate therefore uses only uniform closeness to the
round ratio.

## Exact local maximum and native tangent

For \(|x|<R/2\) the cutoff is one and the connection is exactly
\(A_r^{\rm loc}\). This equality on an open set gives equality of
the reconstructed data and of the local original vector field
there. In particular \(Q(p)=Q_r\) has simple positive spectrum,
and the scalar \(\log\rho\) has zero first spatial derivative and
Hessian \(-|G|^2\widehat g_{A_\epsilon}(p)\). The strict local
maximum holds on a sufficiently small ball inside \(B_{R/2}\) by
the assessed E235/E236 calculation. Its radius can depend on
\(\epsilon\).

The derivative of the local curvature quotient on the actual original
direction is local as well. The native pairing \(2\delta\) doubles
the wedge numerator and normalized volume, with \(Q\) unchanged.
The native reconstructed metric is twice the old metric and
the two-to-one-form adjoint gains \(1/2\), so the native original
direction is half the old one, corresponding to \(\tau=2t\).
The old directional derivative
of \(\log\rho\) was exactly \(1\). Thus the native one on
\(A_\epsilon\) at \(p\) is \(1/2\), and the derivative of
\(\rho\) itself is \(r/2\).
[Assessed local Hessian and velocity](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

This is a global connection construction and a local directional
evaluation. It bounds the annular ratio by \(1+C_3\epsilon\).
It assigns neither an exact global cap \(r\) nor a global maximum
to \(p\). It uses no flow existence or persistence assertion. The
round sphere and its standard chiral bundle are supplied throughout.

## Verified frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [E240 request](../research-progress/handoffs/SP4-CME-E240_REQUEST_v1.md) | 473e5f66d3dadfc663be385a6478eb4f7085bb8564e2f3f578c09a0b18c50792 |
| [B111](../brainstorm/notes/B111_CLOSED_REALIZATION_OF_LOCAL_RATIO_GERMS_20261123.md) | 15db8371803239f8e98f739b43100ca743909bce983fa3c922291268d3e094ca |
| [E235/E236 assessment](../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md) | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E235 derivation](235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |

The evidence is the explicit cutoff and fixed-background estimates.
Only the note and return were written.
