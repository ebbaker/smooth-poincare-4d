# GEO-E07 — Stable prescribed-curvature cuts and their limits

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution requested as GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Inputs are [GEO-E07, revision 1](ISSUE_SECOND_20261127.md), the [parent conventions and Gauss identity](../../../manuscript/cuts_of_subcritical_conformal_classes.tex) at bc2c1bb (SHA-256 ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0), and the [marked intermediate-cut criteria](../../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/POSITIVE_SCALAR_INTERMEDIATE_CUTS.md). The calculations use smooth oriented Riemannian four-manifolds and two-sided cuts. The explicit flows are on the unit round \(S^4\).

## Band comparison and variation signs

Read Daniel Räde, *Scalar and mean curvature comparison via \(\mu\)-bubbles*, arXiv:2104.10120v4, 23 May 2022, on 27 November 2026. The passages inspected were Definition 1.1 and Remark 1.4, Theorems 2.7–2.8 and Corollaries 2.9 and 2.25, Proposition 3.7, Remark 4.1, Lemmas 4.2–4.4 and (11), Lemma 5.2, and the projection statement of Lemma 6.3. This is a passage-level check. [Primary text](https://arxiv.org/pdf/2104.10120v4) · [Canonical source record](../../../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md)

Let \(X\) be a smooth compact oriented band with sides \(\partial_\pm X\). Put \(B(v,w)=g(\nabla_v\nu,w)\), \(H=\operatorname{div}_\Sigma\nu\), and \(\Delta=\operatorname{div}_\Sigma\nabla_\Sigma\). Räde's convention gives the same numerical boundary mean curvature as the divergence of the outward boundary normal. For \(\Omega\) containing a neighborhood of \(\partial_-X\) and avoiding \(\partial_+X\), use the outward unit normal of \(\Omega\) at its interior boundary and the functional
\[
\mathcal A_h(\Omega)=\operatorname{Area}(\partial^*\Omega\cap X^\circ)-\int_{\Omega}h\,dV .
\]
At the lower end the normal into the band points toward the upper end. Its divergence is \(-H_{\partial_-X}^{\rm out}\). At the upper end the same coorientation has divergence \(H_{\partial_+X}^{\rm out}\). Thus Lemma 4.2 requires \(H_{\partial_-X}^{\rm out}>-h\) and \(H_{\partial_+X}^{\rm out}>h\), or \(H_\nu<h\) at the lower end and \(H_\nu>h\) at the upper end, both measured with the normal pointing toward the upper end. In ambient dimension four the strict inequalities give a smooth interior minimizing separator. [Räde, Remark 4.1 and Lemma 4.2](https://arxiv.org/pdf/2104.10120v4#page=12)

For normal velocity \(u\nu\), the first variation is \(\int_\Sigma(H-h)u\,dA\). At a critical point \(H=h\), the variations of \(H\) and \(h\) are \(-\Delta u-(\operatorname{Ric}(\nu,\nu)+|B|^2)u\) and \(u\partial_\nu h\), respectively. Hence for every smooth \(u\), including constants,
\[
Q_h[u]=\int_\Sigma\bigl[|\nabla u|^2-
  (\operatorname{Ric}(\nu,\nu)+|B|^2+\partial_\nu h)u^2\bigr]\,dA .
\]
The exact Gauss identity \(R_\Sigma=R_g-2\operatorname{Ric}(\nu,\nu)+H^2-|B|^2\) then gives from \(Q_h\ge 0\)
\[
\int_\Sigma(2|\nabla u|^2+R_\Sigma u^2)\,dA
\ \ge\
\int_\Sigma(R_g+h^2+|B|^2+2\partial_\nu h)u^2\,dA .
\]
A positive lower bound for the right-hand coefficient also bounds \(-8\Delta+R_\Sigma\) below. The positive first eigenfunction produces a metric with positive scalar curvature (PSC). Replacing \(|B|^2\) by \(h^2/3\) gives the sufficient coefficient \(R_g+\tfrac43h^2+2\partial_\nu h\). The lower bound \(R_g+\tfrac43h^2-2|\nabla h|\) works independently of the orientation of a candidate separator. A negative outward derivative helps stability and reduces both scalar-curvature coefficients. [Räde, Lemmas 4.3–4.4, (11), and Lemma 5.2](https://arxiv.org/pdf/2104.10120v4#page=13)

## Independently marked bands can be arbitrarily thin

In dimension four, if a marked product \(X=Y\times[a,b]\) has closed connected oriented \(Y\) admitting no PSC metric, and \(R_g\ge\rho>0\), Corollary 2.25 applied to \((\rho/12)g\) gives
\[
d\sqrt{\rho/12}<\pi/2,\qquad \rho d^2<3\pi^2 .
\]
Here \(d\) is the distance between the two sides measured within \(X\). The contrapositive certifies that \(Y\) admits a PSC metric when \(\rho d^2\ge3\pi^2\), including equality. For the finite-end comparison, let \(m_\pm=\inf_{\partial_\pm X}H^{\rm out}\). Under the hypothesis that \(X\) has no PSC separator, Corollary 2.9 first gives \(m_-+m_+<0\). The endpoints \(\frac12\arctan(2m_-/\sqrt{3\rho})\) and \(-\frac12\arctan(2m_+/\sqrt{3\rho})\) then form an ordered model interval for Theorem 2.7 in the scaled metric. Its bound is
\[
\arctan\!\frac{2m_-}{\sqrt{3\rho}}
 +\arctan\!\frac{2m_+}{\sqrt{3\rho}}
 +\sqrt{\rho/3}\,d\ \le\ 0.
\]
The finite-end bound is non-strict. The flat-torus models \(dt^2+\cos(2t)g_{T^3}\) on \([-\pi/4+\delta,\pi/4-\delta]\) have \(R=12\) and widths \(\pi/2-2\delta\). They approach the width threshold as \(\delta\downarrow0\), when the warping degenerates at the limiting ends. [Räde, Theorems 2.7–2.8 and Corollary 2.9](https://arxiv.org/pdf/2104.10120v4#page=4) · [Corollary 2.25](https://arxiv.org/pdf/2104.10120v4#page=6)

In the round entering gauge take the independently marked equatorial band \(|t|\le\varepsilon<\pi/4\) with metric \(dt^2+\cos^2t\,g_{S^3}\). Every joining curve has length at least \(2\varepsilon\) by its \(t\) displacement, attained by the meridians. Thus \(\rho d^2=48\varepsilon^2<3\pi^2\), with limit zero. The round gauge has \(R=12\), \(\operatorname{Ric}=3g\), and zero Weyl curvature, so the entering-gauge conditions allow independently marked bands with arbitrarily small normalized width. In this equatorial example the finite-end expression is \(2\varepsilon>0\) because \(m_\pm=-3\tan\varepsilon\).

## A prescription that stabilizes a distance leaf

Let \(X=Y\times[a,b]\) have \(g=dr^2+g_r\) in a distance coordinate, let \(r_0\in(a,b)\), and set \(V=\partial_r\), \(H_r=\operatorname{div}V\) on the leaves. For \(\kappa>0\) define the fixed ambient function
\[
h(r,\theta)=H_r(\theta)-\kappa(r-r_0) .
\]
The signs of \(H_r-h=\kappa(r-r_0)\) give both strict barriers. The leaf \(Y_{r_0}\) satisfies \(H=h\). The normal Riccati equation gives \(\partial_rH_r=-\operatorname{Ric}(V,V)-|B_r|^2\), so
\[
Q_h[u]=\int_{Y_{r_0}}(|\nabla u|^2+\kappa u^2)\,dA .
\]
The bound holds for arbitrary smooth normal variations. The exact scalar-curvature coefficient above is \(R_{Y_{r_0}}-2\kappa\). The sufficient coefficient using only the trace is \(R_{Y_{r_0}}-|B^\circ|^2-2\kappa\).

The calibration by \(V\) identifies the minimizing region in this band. Write \(\Omega_0=\{a\le r\le r_0\}\) and \(A_-=\operatorname{Area}(\partial_-X)\). For any admissible finite-perimeter \(\Omega\), its trace is full on the lower boundary and zero on the upper one. The flux of \(V\) across its interior boundary is \(\int_\Omega H_r\,dV+A_-\) and is bounded above by the interior perimeter. This gives
\[
\mathcal A_h(\Omega)\ge A_-+\int_\Omega \kappa(r-r_0)\,dV .
\]
There is equality for \(\Omega_0\). The integrand is negative below \(r_0\) and positive above it, so equality in the minimization forces \(\Omega=\Omega_0\) up to volume zero. The construction also works when \(H_r\) varies along the leaf. It stabilizes a selected leaf regardless of its induced scalar-curvature sign.

## The round \(SO(2)\times SO(3)\) cuts

In \(S^4\subset\mathbb R^2\oplus\mathbb R^3\), write a point as \((\cos r\,u,\sin r\,v)\), with unit \(u\in S^1\), \(v\in S^2\), and \(0<r<\pi/2\). The metric is \(dr^2+\cos^2 r\,g_{S^1}+\sin^2r\,g_{S^2}\). The principal curvatures with normal \(V\) are \(-\tan r,\cot r,\cot r\), so
\[
H(r)=2\cot r-\tan r,\qquad R_{Y_r}=2/\sin^2r .
\]
On any compact subband \([a,b]\subset(0,\pi/2)\) the radial prescription above makes each selected interior orbit, with its own \(h\), an unconstrained strictly stable PSC minimizer. For every \(\kappa<1/\sin^2r_0\) the exact right-hand coefficient is positive. The trace-only coefficient is
\[
\frac{2}{\sin^2r_0}
\left(1-\frac{1}{3\cos^2r_0}\right)-2\kappa .
\]
It is negative whenever \(\sin^2r_0\ge2/3\). The trace-only test can therefore fail on the strictly stable positive cut.

For an orbit band \([a,b]\), the two outward means are \(-H(a)\) and \(H(b)\), and \(d=b-a\). At \(\rho=12\) the finite-end expression is \(F(b)-F(a)\) with \(F(r)=2r+\arctan(H(r)/3)\). Writing \(x=\tan^2r\), direct differentiation gives
\[
F'(r)=\frac{(2-x)(1+x)}{x(9+H(r)^2)} .
\]
Every band with \(a>\arctan\sqrt2\) has a strictly negative finite-end expression, despite the positive induced scalar curvature of every orbit. Such bands can be chosen arbitrarily short in the same round gauge.

Unforced forward mean curvature flow (MCF) has velocity \(-H\nu\), independent of normal orientation. The explicitly evolving family has \(\dot r=-H(r)\), so \(y=\sin^2r\) satisfies \(\dot y=6y-4\) and \(y(t)=\tfrac23+(y_0-\tfrac23)e^{6t}\). The endpoints of this family are as follows.

| Initial orbit | Forward endpoint | Time from the initial orbit |
| --- | --- | --- |
| \(0<y_0<2/3\) | \(r=0\), the great \(S^1\), with \(S^2\) collapsing | \(\frac16\log\!\big((2/3)/(2/3-y_0)\big)\) |
| \(y_0=2/3\) | Stationary minimal orbit | Infinite |
| \(2/3<y_0<1\) | \(r=\pi/2\), the great \(S^2\), with \(S^1\) collapsing | \(\frac16\log\!\big((1/3)/(y_0-2/3)\big)\) |

At the first finite endpoint \(y\sim4(T-t)\), giving the parabolically scaled cylinder \(S^2(2)\times\mathbb R\) along the great \(S^1\). At the second, \(1-y\sim2(T-t)\), giving \(S^1(\sqrt2)\times\mathbb R^2\) along the great \(S^2\). The latter is a codimension-two collapse onto the normal-index-two maximum of the smooth orbit function \(y\). The induced scalar curvature \(2/y\) remains positive and tends to \(2\) there. On a fixed subband containing the minimal orbit, as \(r_0\) tends to that orbit from either side the prescriptions converge smoothly and keep the same stability lower bound \(\kappa\). Finite-time flow tends to the stationary orbit on bounded time intervals while the distinct collapse times tend to infinity. The two collapses arise from different initial cuts. Reversing the choice of normal on a fixed cut leaves its forward velocity unchanged. The stationary orbit is unstable for area, as seen by the constant normal variation with \(h=0\).

## A positive local cut in every smooth entering gauge

For any point \(p\), use polar coordinates for \(0<r<r_{\rm inj}(p)\). The Jacobi tensor of the radial geodesics is \(rI+O(r^3)\) with radial derivative \(I+O(r^2)\) in parallel frames, uniformly in direction. Thus the shape operator of the geodesic sphere \(S_r(p)\) is \(r^{-1}I+O(r)\), its principal curvatures are positive for small \(r\), and
\[
R_{S_r(p)}=(R_g-2\operatorname{Ric}(\partial_r,\partial_r))+H_r^2-|B_r|^2
=6/r^2+O(1)>0 .
\]
This argument uses smoothness and works in particular in every smooth entering gauge. Choose a sufficiently small \(r_0>0\) and any closed polar annulus about \(r_0\) inside the injectivity radius. The same prescription with \(H_r(\theta)\) gives strict barriers and the same quadratic lower bound \(\kappa\int u^2\) on all normal variations. A smooth cutoff equal to one near the annulus extends \(h\) to the ambient manifold if needed. This produces a smooth strictly stable prescribed-curvature boundary of the small ball, and the calibration gives the minimizing separator of its own annulus. For fixed \(\kappa\), \(|B^\circ|=O(r_0)\), so both scalar-curvature coefficients are positive for sufficiently small \(r_0\). The shrinking family is local: the spheres limit to \(p\) and the prescribed value on them grows like \(3/r_0\).

If the ball is contained inside a separately marked product band \(Y\times[a,b]\), its boundary has zero class in \(H_3(Y\times[a,b];\mathbb Z)\), and its projection to \(Y\) has degree zero. By comparison, the oriented interior boundary of an admissible band region represents the slice class and its components have total projection degree one. The small cut gives a PSC sweepout inside the coordinate ball via the distance leaves and the nondegenerate minimum of \(r^2\) at \(p\). Its exterior requires a separate construction.

## Decision returned to G5

Existence of a strictly stable PSC cut with a locally chosen prescription holds without a width hypothesis. The marked route still needs a positive separator with nonzero degree for the actual target marking, or a width or boundary comparison verified in that marking. The sweepout route still needs control of the complement and of singular events for a specified flow. Even strict prescribed stability and positive intrinsic scalar curvature along the full regular round orbit flow allow a normal-index-two event on the \(S^2\) side. This example tests that orbit family and its unforced MCF. On the same round sphere, concentric distance spheres about a point instead give point endpoints at the center and antipode, with a stationary equator between the two forward families.
