# Round-conformal ball and pole traces — SP4-FOT-MATCH-E04

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort are
unavailable. This proves the matching assertion for the exact round-conformal
family in [request revision 1](../research-progress/handoffs/E04_REQUEST_20261125.md).
[B02 decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md)

## Geometry and common normal

Use the standard smooth oriented spin \(S^4\). An oriented stereographic
coordinate \(x=r\omega\) covers the complement of \(p=\infty\), where
\(\omega\in S^3(1)\). Cut at \(r=1\) and \(r=e^L\), \(L\ge2\).
The core is the Euclidean unit ball in \(x\).
Fix a unit vector \(\xi\), let \(S\) be reflection across \(\xi^\perp\),
and use the oriented cap coordinate
\[
 y=\frac{aSx}{r^2},\qquad a>0,\qquad
 \rho=|y|=a/r,\qquad \rho_L=a e^{-L}.
\]
The cap is the flat ball of radius \(\rho_L\) in \(y\), with the pole
at \(y=0\). For each \(L,a\) one can use a smooth positive conformal
factor in the \(x\) coordinate equal to \(1\) for \(r\le1\) and to
\(a/r^2\) for \(r\ge e^L\), interpolated in between. This gives a
smooth compact metric in the round conformal class, flat on both
specified balls. The collar calculation is in the conformal gauge
\[
 h_0=dt^2+\gamma_{S^3(1)}
     =r^{-2}|dx|^2=\rho^{-2}|dy|^2,\qquad t=\log r .
\]
Use the E01 increasing normal \(+\partial_t\) on both ends and its
operator \(L_0=\partial_t+A\), acting on positive spinors after
identifying the negative target by inverse normal Clifford
multiplication. The two outward collar normals have opposite signs.
All trace spaces below are transported to the same \(t\)-parallel
reference spin bundle, using the conformal Dirac weight and the
angular spin identification induced by the oriented inversion.
The trace norm is \(\mathcal T=H^{1/2}(S^3)\) with
\(\|g\|_{\mathcal T}=\||A|^{1/2}g\|_2\).
[E01](E01_ROUND_INVERSE_20261125.md)

In four dimensions, when \(\widehat g=\sigma^2 g\), a Dirac field
is transported by \(\widehat\psi=\sigma^{-3/2}\beta\psi\),
with \(D_{\widehat g}\widehat\psi=\sigma^{-5/2}\beta D_g\psi\);
\(\beta\) is the pointwise spin isometry. For the two flat pieces,
the factors taking their Dirac spinors to the cylindrical gauges are
\(r^{3/2}\) and \(\rho^{3/2}\), respectively. In particular the
right endpoint uses the factor \(\rho_L^{3/2}\).
The comparison uses boundary data after these weights.
[Hitchin, §1.4 Proposition 1.3](https://users.math.msu.edu/users/parker/GT/Harmonic%20Spinors.pdf)
· [DIR §3.1](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L339)

## Actual regular Cauchy data and the affine pole space

For the core, a spinor regular at \(x=0\) becomes \(u=O(r^{3/2})\)
as \(t\to-\infty\) in its cylinder gauge. Each mode is
\(u_j(t)=e^{-\lambda_j t}u_j(0)\). The modes with \(\lambda_j>0\)
grow in this direction, so \(P_+u(0)=0\).
For a spinor regular at the cap center \(y=0\), \(t\to+\infty\),
the same argument uses \(O(\rho^{3/2})\) and excludes
\(\lambda_j<0\) from the right trace. These two restrictions use
the same increasing normal, with \(t=L+\log(\rho_L/\rho)\)
on the cap.

Both spaces are realized for every datum in their indicated projections
of \(\mathcal T\). In fact, for either ball set \(s\ge0\) equal to the
logarithmic distance from its seam into the ball and write
\(q=q_0e^{-s}\) for its Euclidean radius, where \(q_0=1\) on the
left and \(q_0=\rho_L\) on the right. Extend the allowed trace
by \(u_j(s)=e^{-\mu_js}g_j\), \(\mu_j=|\lambda_j|\).
The half-cylinder weighted \(H^1\) bound follows from
\[
 \int_0^\infty e^s(1+\mu_j^2)e^{-2\mu_js}\,ds
       =\frac{1+\mu_j^2}{2\mu_j-1}\le C\mu_j
       \qquad (\mu_j\ge3/2).
\]
Indeed the flat field is \(q^{-3/2}\beta^{-1}u\) and the flat volume
has factor \(q^4\). The flat derivative is bounded by
\(Cq^{-5/2}(|\nabla^{h_0}u|+|u|)\) by the conformal spin connection
formula. The link gradient is controlled by \(A\) through the
Schrödinger–Lichnerowicz formula in E01. Summing the mode estimate
gives flat \(L^2\) and covariant gradient bounds by
\(Cq_0^{1/2}\|g\|_{\mathcal T}\) and
\(Cq_0^{-1/2}\|g\|_{\mathcal T}\), respectively.
The distributional Dirac equation extends across the center since
a cutoff at Euclidean radius \(\epsilon\) has
\(\|d\chi_\epsilon\|_{L^2}=O(\epsilon)\), and the field is \(L^2\).
The same cutoff shows that the displayed \(L^2\) derivative is
the derivative on the whole ball. Elliptic regularity gives
smoothness inside. Thus the Cauchy data of the \(H^1\) harmonic
spinors on the two balls are exactly \(P_-\mathcal T\) and
\(P_+\mathcal T\) after conformal transport.

Fix \(\eta\in S^-_p\) in the flat cap frame, and put
\(\omega_3=2\pi^2\). The Euclidean Green spinor of singular part
prescribed by \(D^+G_\eta^y=\delta_0\eta\) is
\[
 G_\eta^y(y)=-\frac{c_y(y)\eta}{\omega_3\rho^4}.
\]
For \(D^2=-\sum_i\partial_i^2\) this is \(D\) applied to
\((2\omega_3\rho^2)^{-1}\eta\), which fixes the normalization and sign.
Require a smooth harmonic remainder at the pole, or equivalently
a distributional solution with this point source, by elliptic
regularity after subtracting \(G_\eta^y\). In the common cylinder
gauge this singular solution on \(t\ge L\) has the form
\(e^{3(t-L)/2}p_\eta\), with \(p_\eta\) the transported right trace.
Because this homogeneous field solves \(L_0u=0\) on that half-cylinder,
\[
 p_\eta\in \ker(A+\tfrac32),\qquad
 |p_\eta|=\frac{\rho_L^{-3/2}|\eta|}{\omega_3},\qquad
 \|p_\eta\|_{\mathcal T}
   =\sqrt{\frac{3}{2\omega_3}}\,\rho_L^{-3/2}|\eta| .
 \tag{1}
\]
The norms use the unitary spin marking and the fact that Clifford
multiplication by a unit vector is an isometry. The actual core
and actual cap traces with this pole are therefore
\[
 \mathcal C_\ell=P_-\mathcal T,\qquad
 \mathcal C_{r,\eta}=p_\eta+P_+\mathcal T .
 \tag{2}
\]
[DIR §4.1, Green pole and reflected inversion](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L529)

## Exact matching and its bound

In the E01 variables \(b_+\in P_+\mathcal T\), \(b_-\in P_-\mathcal T\)
for the incoming data of the collar solution,
\[
 u(0)=b_+ + e^{-L|A|}b_-,\qquad
 u(L)=e^{-L|A|}b_+ + b_- .
 \tag{3}
\]
The requirements (2) reduce exactly to \(b_+=0\) and \(b_-=p_\eta\).
The quotient-coordinate matching matrix is the identity. In
particular, there are no kernel or compatibility directions and the
matched collar field is
\[
 u(t)=e^{-\frac32(L-t)}p_\eta .
 \tag{4}
\]
It has left trace \(e^{-3L/2}p_\eta\) in the regular core space and
zero regular correction on the cap. In the \(H^1\) trace class the
solutions on the pieces with these traces are unique by the
mode extension argument. In the common metric gauge the seam traces
agree. The piecewise solution solves Dirac distributionally across
both cuts by the cancellation of the seam terms. Elliptic
regularity makes it smooth off the cap pole.

One can also prescribe arbitrary seam discrepancies \(d_\ell,d_r\)
in \(\mathcal T\). If \(v_\ell\in P_-\mathcal T\) and
\(v_r\in P_+\mathcal T\) denote the regular core and cap traces,
solve \(u(0)-v_\ell=d_\ell\) and \(u(L)-(p_\eta+v_r)=d_r\) by
\[
 \begin{aligned}
 b_+&=P_+d_\ell,&
 b_-&=p_\eta+P_-d_r,\\
 v_\ell&=e^{-L|A|}b_- -P_-d_\ell,&
 v_r&=e^{-L|A|}b_+ -P_+d_r.
 \end{aligned}
\]
Relative to the zero-discrepancy solution the four trace parameters
have joint norm at most
\((1+e^{-3L/2})(\|d_\ell\|_{\mathcal T}^2+\|d_r\|_{\mathcal T}^2)^{1/2}\).
The block of four projections is an isometry, and the two additional
blocks are damped by \(e^{-3L/2}\) with orthogonal sign projections.
The pole is an affine translation in this estimate. This illustrates
uniform transversality of these actual spaces in the reference norm.

The explicitly matched spinor is especially simple in the flat
\(x\) gauge. In Cartesian spin frames choose the lift
\(K(\omega)=c(\xi)c(\omega)\) of the orthogonal part of the map
\(x\to y\). The derivative has orthogonal part \(S\) composed with
reflection across \(\omega^\perp\), so \(K\) is its ordered lift.
Clifford compatibility gives
\(K(\omega)^{-1}c_y(S\omega)=c_x(\xi)\).
The Dirac conformal factor from \(x\) to \(y\) is
\(\sigma=a/r^2\). Thus
\[
 \Psi_x=\sigma^{3/2}K(\omega)^{-1}G_\eta^y(y(x))
       =-\frac{a^{-3/2}}{\omega_3}c_x(\xi)\eta .
 \tag{5}
\]
The other sign choice of spin frame changes the corresponding
coordinate sign of the source and field. In the chosen frames
(5) is constant and nonzero for \(\eta\ne0\), hence regular on
the whole core. Its harmonic transport to \(h_0\) is exactly (4).
On the compact metric obtained by the conformal interpolation, the
matched field has just the prescribed distributional point source.
The homogeneously matched field is zero, and so this is the
normalized chiral Green field of the compact metric.

## Midpoint normalization and the twistor projection

For one pole, the field in (4) has constant norm on every link.
In particular,
\[
 \left|u\!\left(\tfrac L2,\omega\right)\right|
    = e^{-3L/4}\,\frac{\rho_L^{-3/2}|\eta|}{\omega_3}
    = \frac{a^{-3/2} e^{3L/4}|\eta|}{\omega_3}.
 \tag{6}
\]
A bounded incoming cylinder trace gives exact
\(e^{-3L/4}\) attenuation in supremum norm relative to the
right endpoint. A unit \(\mathcal T\) norm on that trace gives
midpoint value \(\sqrt{2/(3\omega_3)}e^{-3L/4}\).
A fixed \(|\eta|\) gives the same decay in \(L\) when \(\rho_L\)
is fixed. When \(a\) is fixed, the flat cap radius shrinks
and a fixed \(|\eta|\) yields the larger amplitude in the last
expression of (6). This distinction is a consequence of the
physical pole-to-cylinder weight in (1). Uniform solvability in
the reference trace norm permits either normalization.

Write \(P_g\) for the twistor projection of \(\nabla^g\) onto the
kernel of Clifford contraction on \(T^*\otimes S^+\). In the cylinder
gauge \(D_{h_0}u=0\), so \(P_{h_0}u=\nabla^{h_0}u\).
At each \(t\), \(A^2u=(9/4)u\), and constant norm on the link gives
\(|\nabla^Y u|^2=(3/4)|u|^2\) by the pointwise Bochner identity
and \(A^2=(\nabla^Y)^*\nabla^Y+3/2\).
Together with (4) this gives
\[
 |P_{h_0}u|^2=3|u|^2.
 \tag{7}
\]
For \(\eta\ne0\) the collar integral of
\(|P_{h_0}u|^4/|u|^4\) is \(9\omega_3 L\), independently of the
pole amplitude.
The conformal twistor transport uses
\(\widehat\psi=\sigma^{1/2}\beta\psi\) under
\(\widehat g=\sigma^2g\). Applied to the flat parallel spinor (5)
it gives the exact twistor spinor \(r^{-2}u\) on \(h_0\).
In the cap gauge its expression is instead
\[
 \psi^{\mathrm{tw}}_y=\sigma^2G_\eta^y
   =-\frac{c_y(y)\eta}{a^2\omega_3},
 \qquad \sigma^2=\frac{\rho^4}{a^2}.
\]
The differential at the cap center is an isomorphism from the
real tangent four-plane to the spinor fiber when \(\eta\ne0\).
It extends smoothly as an exact flat twistor spinor through the
center. This calculation depends on the exactly parallel field in
the flat \(x\) representative. The reference cylindrical metric is
conformally flat, so the Weyl-containing differentiated component
of \(P_{h_0}u\) vanishes in this model despite (7).
The fixed-reference inverse and estimate (6) alone supply neither
a joint lower bound nor a curvature estimate on a different collar.
[Friedrich, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf)
· [DIR §§2.2–2.3, 3.1 and 4.1](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex)

## Inputs and scope

The model and trace spaces are fixed in
[the B02 decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md)
and [request revision 1](../research-progress/handoffs/E04_REQUEST_20261125.md).
The proof uses [E01](E01_ROUND_INVERSE_20261125.md) for the round
product signs, spectrum and reference norm. DIR at source commit
`0a0abde6f5481fc564d8ca159769cb092e1996d2` and verified SHA-256
`71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`
provides the flat pole convention and conformal spin formulas.
Hitchin §1.4 Proposition 1.3 and Friedrich §1 were inspected in
the linked primary texts for conformal Dirac and twistor transport.
The geometry throughout is the standard smooth four-sphere with
the two explicitly supplied flat balls and exact round cylinder gauge.
