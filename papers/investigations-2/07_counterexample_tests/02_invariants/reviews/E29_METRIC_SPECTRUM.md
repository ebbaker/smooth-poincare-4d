# Independent replay of the frozen metric and scalar threshold

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. WIN-E29 A, non-author analytical replay. Actual serving model and reasoning effort unavailable. Baseline `86b24d9f9c2d`. Inputs are the [frozen metric, revision 1](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md), the [E29 request](../research-progress/handoffs/REQUEST_B08_INPUT_REPLAYS_R1.md), and [E22](../notes/E22_METRIC_AND_SPECTRUM.md), SHA-256 `4a7a988d5db8d603000b8886687e143573d1a995ae96c24e657c7afb85402b4c` at intake.

The metric, curvature, volume estimates and scalar Rayleigh bounds replay with the stated constants. In particular, on the frozen physical metric,

\[
 \lambda_1(g)\sqrt{\operatorname{Vol}(g)}
 \le 4\sqrt{V_0}\left(1-\frac78 a^6\right)<4\sqrt{V_0},
 \qquad V_0=\frac{8\pi^2}{3}.
\]

## Metric and curvature

In the finite stereographic chart let \(s=|y|\), \(t=\min(s,s^{-1})\) with value zero at each pole, \(F=1+\eta(t)t^2\), and \(\alpha=\epsilon\chi(s)(y^1)^2\). The annulus around \(s=1\) has \(\rho=(1+s^2)^{-1}\) on both sides. The inversion-reflection chart makes the metric Euclidean near the point at infinity, where \(\rho=s^{-2}\). At the finite pole both cutoffs are constant, so the local formulas are smooth there. All perturbation is in \(s\le a\) with \(\rho=1\). Consequently \(\det g=\rho^8(1-\alpha^2)\), which gives E22's exact integral of \(\rho^4\sqrt{1-\alpha^2}\) against Euclidean volume. Positivity follows from \(|\alpha|\le\epsilon a^2=\tau<1\).

For the comparison metric \(\gamma=(\Omega/\rho)^2g\), \(q^{-1}\gamma\) is diagonal with entries \(1,1+\alpha,1-\alpha,1\). Thus \(G=4g=F^2\gamma\). On the anisotropic cap \(F=1+s^2\), and

\[
 F^2(1-\alpha)\ge(1+2s^2)(1-\epsilon s^2)
 =1+s^2[2-\epsilon(1+2s^2)]\ge1.
\]

On the rest of the sphere \(F\ge1\) and \(\gamma=q\), so \(G\ge q\) globally.

At the finite pole the only nonzero second derivatives of the physical metric are \(\partial_1^2g_{22}=2\epsilon\) and \(\partial_1^2g_{33}=-2\epsilon\). The first derivatives vanish. With the [DIR-E33 curvature convention](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md), the elementary curvature operator has only \(R_{1212}=-\epsilon\) and \(R_{1313}=\epsilon\) as nonzero diagonal entries. Its scalar curvature vanishes at the pole. Compressing the operator to the oriented self-dual basis gives the Weyl block \(\operatorname{diag}(-\epsilon/2,\epsilon/2,0)\) for \(g\). The conformal correction at the pole for \(\gamma=\Omega^2g\) has scalar two-form curvature because \(d\Omega=0\) there and the Hessian of \(\log\Omega\) is isotropic. The orthonormal scale contributes the factor \(\Omega(0)^{-2}=1/4\) to the Weyl block. This replays the nonzero curvature on the numerical metric. DIR-E33's Green-spinor conclusions use a sufficiently small parameter controlled by analytic bounds. The local curvature calculation supplies no such bounds at \(\epsilon=2^{-1024}\).

## Round comparison of the volume measures

Let \(d\nu=dV_q/V_0\) and \(J=dV_G/dV_q=F^4\sqrt{1-\alpha^2}\). Write \(d=\int(J-1)\,d\nu\). The two caps \(t\le2a\) exhaust the support of \(J-1\). Reversing the radial coordinate in the inverted chart gives the same volume integrals for each cap, since round volume on both charts is \(\Omega(t)^4\,dy\). On both caps \(0\le J-1\le8t^2\), using \(4(1+4a^2)^3\le8\). On the two inner caps \(t\le a\), the respective lower bounds are \(3t^2\) on the anisotropic cap and \(4t^2\) on the inverted one. The first follows by \(\sqrt{1-\alpha^2}\ge1-\alpha^2\), since \((1+4s^2)\epsilon^2s^2\le1\). The factor \(\Omega^4\) is between 1 and 16 on both caps. Hence, using \(2\pi^2/V_0=3/4\),

\[
 \frac34(3+4)\frac{a^6}{6}\le d
 \le\frac34\,2\cdot8\cdot16\frac{(2a)^6}{6},
 \qquad\text{or}\qquad \frac78a^6\le d\le2048a^6 .
\]

Thus \(\operatorname{Vol}(g)=V_0(1+d)/16\), and the centering density is \(d\mu_g/d\nu=J/(1+d)\), with \(L^\infty\) difference at most \(32a^2\) and \(L^1(\nu)\) difference at most \(2d/(1+d)\le4096a^6\). For \(\gamma\), the density before dividing by its total mass is \(\sqrt{1-\alpha^2}\). The cap \(s\le a\) has probability at most \(16(\pi^2 a^4/2)/V_0=3a^4\). The mass loss \(\kappa=\int(1-\sqrt{1-\alpha^2})\,d\nu\) is at most \(3a^{16}\), and the normalized density has \(L^\infty\) error at most \(\tau^2/(1-\kappa)\le2\tau^2\) and \(L^1(\nu)\) error at most \(2\kappa/(1-\kappa)\le12a^{16}\).

For the round embedding \(X\), the \(F^4\)-weighted mean vanishes by individual coordinate reflections and reciprocal inversion for the polar component. The error \(F^4-J\) is at most \(2\tau^2\) and supported in \(s\le a\), since \(F^4\le2\) there. Thus \(|\int X\,d\mu_g|\le6a^{16}\). For any unit-valued pencil map \(f\) with \(\int f\,d\mu_g=0\), the physical density comparison also gives \(|\int f\,d\nu|\le4096a^6\).

## Scalar Rayleigh bounds

For the polar coordinate \(u=X_5=(1-s^2)/(1+s^2)\), the uniform mean and variance are 0 and \(1/5\) by round symmetry. Its round Dirichlet density is \(1-u^2\), at most \(16a^2\) on the two caps. Subtract its actual mean \(m=\int Ju\,d\nu/(1+d)\), with \(|m|\le d/(1+d)\). The variance and the numerator of the Rayleigh quotient then satisfy

\[
 \begin{aligned}
 D&=\int J(u-m)^2\,d\nu
 \ge \tfrac15+(1-16a^2)d-\frac{d^2}{1+d},\\
 N&=\int J|du|_G^2\,d\nu
 \le\tfrac45+16a^2d .
 \end{aligned}
\]

The second inequality uses the inverse metric bound from \(G\ge q\). Since \(16a^2,d\le1/16\), the first gives \(D\ge1/5+7d/8\), and the second gives \(N\sqrt{1+d}\le(4/5+d/16)(1+d/2)\le4/5+d/2\). Scale invariance and Rayleigh give

\[
 \frac{\lambda_1(g)\sqrt{\operatorname{Vol}(g)}}{4\sqrt{V_0}}
 \le\frac{N\sqrt{1+d}}{4D}
 \le\frac{4/5+d/2}{4/5+7d/2}\le1-d .
\]

For the last step, subtract \(4/5+d/2\) from \((1-d)(4/5+7d/2)\) to get \(d(11/5-7d/2)\ge0\). The lower bound for \(d\) proves the stated strict upper bound.

The transverse unit coordinate \(v=(X_2-X_3)/\sqrt2\) has mean zero by reflection and satisfies \(v^2\le16a^2\) on the caps. Its weighted variance is at most \(1/5+16a^2d\). The smallest eigenvalue of the matrix density \(J G^{-1}\) relative to \(q^{-1}\) is \(F^2\sqrt{(1-\alpha)/(1+\alpha)}\ge F^2(1-\alpha)\ge1\). Thus its numerator is at least \(4/5\). The corresponding numerator times \(\sqrt{1+d}\) is at least \(4/5+(4/15)d\), whereas four times the variance is at most \(4/5+64a^2d\). This confirms why the transverse trial gives no certificate of a value below the threshold. The polar trial gives the strict upper bound and makes the earlier [scalar lower bound](../notes/BALANCED_SPECTRAL_BOUND.md) equal to zero on this physical metric. The [qualitative fixed-metric theorem](../notes/FIXED_METRIC_GAP.md) still applies through the nonzero Weyl curvature.
