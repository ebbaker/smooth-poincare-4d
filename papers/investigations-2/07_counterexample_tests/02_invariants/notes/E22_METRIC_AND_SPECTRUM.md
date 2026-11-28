# WIN-E22 · Metric, normalized volume, and scalar threshold

28 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. This bounded E calculation uses the
[B08 revision 1 request][request], base
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`, the [DIR-E33 metric and
curvature conventions][e33], and the [scalar estimate][spectral]. The
frozen route specifies GPT-6.2 Sol / ultra. Actual serving variant and
effort were unavailable to this worker. The bounds below are analytical
on the one fixed closed, oriented, standard Riemannian four-sphere.

The physical metric has \(W_g^+(0)=\operatorname{diag}(-\epsilon/2,\epsilon/2,0)\).
Its first scalar eigenvalue satisfies
\[
 \lambda_1(g)\sqrt{\operatorname{Vol}(g)}
 \le 4\sqrt{V_0}\bigl(1-\tfrac78 a^6\bigr)<4\sqrt{V_0},
 \qquad V_0=8\pi^2/3.
\]
The scalar bound therefore returns zero on this model. The nonzero Weyl
value still gives the [strict qualitative centered gap][gap].

## Physical and auxiliary metrics

Write \(q=\Omega^2\delta\) with \(\Omega=2/(1+s^2)\), \(s=|y|\), and use
\(a=2^{-256}\), \(\epsilon=a^4\), \(\tau=a^6\), and the cutoffs of
[R1][request]. They are smooth, between zero and one, with \(\eta=1\)
on \(s\le a\), \(\eta=0\) on \(s\ge2a\), \(\chi=1\) on \(s\le a/2\),
and \(\chi=0\) on \(s\ge a\). Radial smoothness at the origin follows
from constancy near zero. The reciprocal definition of \(\rho\) agrees
with \(1/(1+s^2)\) on both sides of \(s=1\) near that interface. Near
infinity \(\rho=s^{-2}\). In the positively oriented inversion-reflection
chart, the metric is exactly Euclidean near the missing point.

Put \(t=\min(s,s^{-1})\) on the finite chart away from zero, extended by
zero at both poles. Define
\[
 F=2\rho/\Omega=1+\eta(t)t^2,quad
 \alpha=\epsilon\chi(s)(y^1)^2,quad
 \gamma=(\Omega/\rho)^2 g,quad G=4g=F^2\gamma .
\]
The eigenvalues of \(q^{-1}\gamma\) are \(1,1+\alpha,1-\alpha,1\).
Indeed, on the support of the perturbation \(\rho=1\), so
\(\gamma-q=\Omega^2\alpha((dy^2)^2-(dy^3)^2)\), and elsewhere
\(\gamma=q\). In particular \(0\le\alpha\le\tau\) and \(g\) and
\(\gamma\) are smooth and positive. On the support where \(\alpha\)
can be nonzero, \(F=1+s^2\) and
\[
 F^2(1-\alpha)\ge(1+2s^2)(1-\epsilon s^2)
 =1+[2-\epsilon(1+2s^2)]s^2\ge1.
\]
Together with \(F\ge1\) this proves \(G\ge q\) everywhere.

Near \(y=0\) the perturbation is exactly
\(\epsilon(y^1)^2((dy^2)^2-(dy^3)^2)\) in the flat background.
The first derivatives vanish, and \(R_{1j1j}=-\tfrac12\partial_1^2g_{jj}\)
for these jets in the [DIR-E33 sign][e33]. The only independent
entries are \(R_{1212}=-\epsilon\) and \(R_{1313}=\epsilon\). The scalar
curvature is zero at zero. In the positively oriented self-dual
basis \((e^{12}+e^{34},e^{13}-e^{24},e^{14}+e^{23})/\sqrt2\), the
self-dual curvature block is thus \(W_g^+(0)\) as displayed above.
The conformal scale taking \(g\) to \(\gamma\) has length factor \(2\)
there, so the same Weyl operator in the corresponding orthonormal
frame of \(\gamma\) has entries
\(\operatorname{diag}(-\epsilon/8,\epsilon/8,0)\). These curvature
statements use the positive-chirality convention in which
self-dual forms act on \(S^+\).

## Volume and centering measure

The determinant in stereographic coordinates is
\(\rho^8(1-\alpha^2)\), since \(\rho=1\) wherever \(\alpha\ne0\).
Consequently the exact physical volume is
\[
 \operatorname{Vol}(g)
   =\int_{\mathbb R^4}\rho^4\sqrt{1-\epsilon^2\chi(s)^2(y^1)^4}\,dy .
\]
Use round probability measure \(d\mu_q=dV_q/V_0\) and write
\(\langle\cdot\rangle_q\) for its integral. The scaled volume density
and its excess are
\[
 J=\frac{dV_G}{dV_q}=F^4\sqrt{1-\alpha^2},\qquad
 d=\langle J-1\rangle_q .
\]
Thus \(\operatorname{Vol}(g)=V_0(1+d)/16\), and scaling gives
\(d\mu_g/d\mu_q=J/(1+d)\). The excess \(J-1\) is nonnegative by
\(G\ge q\), and has support in the two caps described by \(t\le2a\).
On their union,
\[
 0\le J-1\le(1+t^2)^4-1\le8t^2 .
\]
The last inequality follows by bounding the derivative of
\((1+x)^4\) by \(8\) on \(0\le x\le 4a^2\le1/4\). For a lower
bound on the inner south cap \(s\le a\), use
\[
 J\ge(1+4s^2)(1-\epsilon^2s^4)\ge1+3s^2 ,
\]
where \(\sqrt{1-\alpha^2}\ge1-\alpha^2\) and
\(\epsilon^2s^2(1+4s^2)\le1\). On the reciprocal inner north cap
\(J=(1+t^2)^4\ge1+4t^2\).

In each cap use its own stereographic radial variable \(t\), the
unit \(S^3\) area \(2\pi^2\), and the round factor bounded by
\(1\le\Omega(t)\le2\). Inversion-reflection is a round isometry, so
the same radial integration applies in the north chart. These give
the exact rational estimates
\[
 \tfrac78 a^6
 =\frac{(3+4)2\pi^2}{V_0}\int_0^a t^5\,dt
 \le d\le
 \frac{2\cdot8\cdot16\cdot2\pi^2}{V_0}
       \int_0^{2a}t^5\,dt
 =2048a^6 .
\]
It follows that
\[
 \left\|\frac{d\mu_g}{d\mu_q}-1\right\|_{L^\infty}
 \le32a^2,\qquad
 \left\|\frac{d\mu_g}{d\mu_q}-1\right\|_{L^1(\mu_q)}
 \le\frac{2d}{1+d}\le4096a^6 .
\]
The \(L^1\) bound uses \(J\ge1\). For the auxiliary metric the
unnormalized density is \(J_\gamma=\sqrt{1-\alpha^2}\). Define
\(\kappa=\langle1-J_\gamma\rangle_q\). The perturbation cap has
round probability at most \(3a^4\), by \(\Omega^4\le16\), so
\(0\le\kappa\le3a^4\tau^2=3a^{16}\) and
\(\operatorname{Vol}(\gamma)=V_0(1-\kappa)\). In particular
\[
 \left\|\frac{d\mu_\gamma}{d\mu_q}-1\right\|_{L^\infty}
 \le2\tau^2,qquad
 \left\|\frac{d\mu_\gamma}{d\mu_q}-1\right\|_{L^1(\mu_q)}
 \le12a^{16}.
\]
The centering condition for this packet uses \(\mu_g\).

For the inclusion \(X:S^4\to\mathbb R^5\), one also has
\(\big|\int X\,d\mu_g\big|\le6a^{16}\). For the density \(F^4\),
coordinate reflection in \(y\) gives zero transverse moments and
reciprocal inversion gives zero polar moment. The correction
\(F^4-J\) is supported on the smaller cap of round probability at
most \(3a^4\), and is bounded by \(2\tau^2\) there. Divide its
integral against the unit vector \(X\) by \(1+d\).

## Rayleigh tests on the physical metric

The scalar threshold uses the scale-invariant quantity
\(L=\lambda_1(g)\sqrt{\operatorname{Vol}(g)}
     =\lambda_1(G)\sqrt{\operatorname{Vol}(G)}\).
Let \(u=X_5=(1-s^2)/(1+s^2)\) be the polar first harmonic.
For each unit linear coordinate \(v\) on the round sphere,
\(\langle v\rangle_q=0\), \(\langle v^2\rangle_q=1/5\), and
\(|dv|_q^2=1-v^2\) by tangential projection of its ambient gradient.
In particular, on the two caps \(1-u^2=4t^2/(1+t^2)^2\le16a^2\).
Set \(m=\langle Ju\rangle_q/(1+d)\), the mean of \(u\) for \(G\).
Since \(J-1\ge0\), \(|\langle Ju\rangle_q|\le d\). Define
\[
 \begin{aligned}
 D&=\langle J(u-m)^2\rangle_q
   \ge\tfrac15+(1-16a^2)d-\frac{d^2}{1+d},\\
 E&=\langle J|du|_G^2\rangle_q
   \le\tfrac45+16a^2d .
 \end{aligned}
\]
The denominator bound expands the weighted variance. The energy bound
uses \(G\ge q\) and then the round energy on the two caps. By the
Rayleigh principle,
\[
 L\le\sqrt{V_0}\frac{E\sqrt{1+d}}{D}.
\]
Here \(16a^2\le1/16\) and \(0<d\le1/16\), so
\(D\ge1/5+7d/8\) and
\(E\sqrt{1+d}\le(4/5+d/16)(1+d/2)\le4/5+d/2\).
Thus \(L/(4\sqrt{V_0})\le(4/5+d/2)/(4/5+7d/2)\le1-d\).

The suggested antisymmetric coordinate \(w=(X_2-X_3)/\sqrt2\),
with \(X_j=2y^j/(1+s^2)\), has mean zero for \(G\) by reflection
of all four \(y\)-coordinates. Its squared value on either cap is
at most \(16a^2\). The corresponding denominator is thus at most
\(1/5+16a^2d\). To bound its numerator from below, the least eigenvalue
of the Dirichlet density \(J G^{-1}\) relative to \(q^{-1}\) is
\[
 F^2\sqrt{\frac{1-\alpha}{1+\alpha}}\ge F^2(1-\alpha)\ge1 .
\]
The last inequality was proved pointwise above. Hence the numerator
is at least \(4/5\), and after multiplying it by
\(\sqrt{1+d}\ge1+d/3\) it exceeds four times the denominator,
since \(64a^2\le1/4<4/15\). The same argument applies to any unit
linear combination of the four transverse coordinates. The polar
trial determines the scalar-threshold disposition for this metric.

The Rayleigh calculation is a bound on the first eigenvalue of the
specific compact representative. It supplies no value of the
centered twistor gap. Weyl curvature and the fixed-metric theorem
give its sign, and the normalized-volume estimates quantify the
measure carried to estimates on \(\gamma\).

[request]: ../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md
[e33]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md
[spectral]: BALANCED_SPECTRAL_BOUND.md
[gap]: FIXED_METRIC_GAP.md
