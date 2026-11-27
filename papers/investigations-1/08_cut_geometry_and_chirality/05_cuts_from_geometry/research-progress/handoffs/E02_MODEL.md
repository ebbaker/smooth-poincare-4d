# GEO-E02 return · The equality tube and its exterior

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested in the [packet](ISSUE_20261127.md). Actual serving model and effort were unavailable. Input checked against the [parent manuscript](../../../manuscript/cuts_of_subcritical_conformal_classes.tex), §6.2, at `bc2c1bb`, SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`. The calculations are exact, in positive Riemannian signature, with fixed orientation and the manuscript's outward-divergence convention. An independent replay is pending.

## Representatives and seam

Take the frozen parameters \(\theta=\pi/2\), \(\ell=2\pi\), and \(\varphi=1\), with the untwisted product coordinates \(\beta=b=0\). The strict requirement \(\theta<\operatorname{inj}(p)\) in §6.2 forces \(\Gamma=1\). A nonidentity deck transformation has displacement at most \(\pi\) on the unit sphere, and the projected segment to its translate gives injectivity radius at most \(\pi/2\). The exterior before conformal rescaling is \(S^1\) times the complementary hemisphere of \(S^3\), hence \(S^1\times D^3\). Its untwisted joining to \(D^2\times S^2\) is the rounded boundary of \(D^2\times D^3\), a standard \(S^4\).

Write \(d\omega^2\) for the unit \(S^2\) metric and \(\psi\) for the coordinate of period \(2\pi\). The cap metric is
\[
 g_T=ds^2+\sin^2s\,d\psi^2+d\omega^2,\qquad 0\le s\le\pi/2.
\]
The raw exterior in §6.2 has \(x=\log\tan(r/2)\), where \(r\in[\pi/2,\pi)\) is the original distance from \(p\) and \(\sin r=\operatorname{sech}x\). It is
\[
 g_X=dx^2+\cosh^2x\,d\psi^2+d\omega^2,\qquad 0\le x<\infty.
\]
It has a complete infinite end. Undoing the exterior conformal rescaling by the factor \(u=\sin r\) gives a distinguished compact representative with exterior
\[
 \widehat g_X=u^2g_X=dr^2+d\psi^2+\sin^2r\,d\omega^2,
 \qquad \pi/2\le r\le\pi.
\]
Here and below, the factor acts on the metric as \(g\mapsto u^2g\). Smoothness at the circle at \(r=\pi\) follows by writing \(\rho=\pi-r\), so its normal metric is the usual smooth spherical polar metric \(d\rho^2+\sin^2\rho\,d\omega^2\).

Both joins have \(h=d\psi^2+d\omega^2\), \(R_h=2\), and \(B=0\), with a common signed unit normal pointing into the exterior. They are \(C^{1,1}\). The raw cap and exterior values of the normal sectional curvature in the circle direction are \(+1\) and \(-1\); in the compact join those values are \(+1\) and \(0\) and the two normal–sphere curvatures change from \(0\) to \(+1\). Thus the classical curvature has two distinct traces. The first derivatives of the metric are continuous, so distributional second derivatives have no surface delta term. The cap Weyl operators on \(\Lambda^\pm\) have eigenvalues \(2/3,-1/3,-1/3\) in the manuscript's normalization and the exterior has zero Weyl curvature. A finite positive conformal factor smooth up to the seam on each side cannot make this exact join \(C^2\), since it preserves the vanishing of Weyl curvature on the exterior and the nonzero cap trace. For reference, the cap has volume \(8\pi^2\) and energy \(E_+=E_-=16\pi^2/3\).

## One-sided Jacobi problems

Use \(J=-\Delta_h-\operatorname{Ric}(\nu,\nu)\) at this totally geodesic seam. The eigenvalues of \(-\Delta_h\) are \(m^2+j(j+1)\) with \(m\in\mathbb Z\) and \(j\ge0\), each Fourier sector having sphere multiplicity \(2j+1\). In real notation the \(m\ne0\) pair has two angular modes. The ambient derivative in each row is the trace from the indicated side.

| Side | \(\operatorname{Ric}(\nu,\nu)\) | One-sided operator | Spectral index, nullity |
| --- | ---: | --- | --- |
| Cap, both joins | \(1\) | \(-\Delta_h-1\) | \((1,2)\) |
| Raw exterior | \(-1\) | \(-\Delta_h+1\) | \((0,0)\) |
| Compact exterior \(u=\sin r\) | \(2\) | \(-\Delta_h-2\) | \((3,3)\) |

These are the spectral counts of the operators from each smooth side. A normal graph with velocity \(f\nu\) has one-sided area second derivative \(\int(|\nabla f|^2-qf^2)\,d\mu_h\), where \(q\) is taken from the side entered at each point. For example, constant \(f=1\) gives distinct derivatives on the two sides of either join. There is no two-sided quadratic area Hessian or intrinsic Jacobi index and nullity at the exact seam. The first variation exists and vanishes there.

## Invariant minimal hypersurfaces

Principal orbits refer to the full \(SO(2)\times SO(3)\) action. Full \(SO(3)\) invariance alone gives more possibilities. On the regular \(SO(3)\) orbit region a connected invariant hypersurface lifts a quotient curve \(\gamma\). In a conformal product \(u^2(dx^2+a^2d\psi^2+d\omega^2)\) the lifted area is \(4\pi\int_\gamma u^3\,d\ell_{dx^2+a^2d\psi^2}\). The hypersurface mean curvature is invariant along each \(SO(3)\) fibre, so testing all normal variations of the quotient curve detects minimality. The curve is therefore a geodesic of the weighted quotient metric
\[
 d\eta^2+b(\eta)^2d\psi^2,\qquad d\eta=u^3dx,\qquad b=u^3a.
\]
With unit speed in this metric and conserving angular momentum \(c\) (replace \(\psi\) by \(-\psi\) if necessary),
\[
 b^2\dot\psi=c,\qquad \dot\eta^2=1-c^2/b^2.
\]
The geodesic equation is unique through the seam because its Christoffel symbols are locally Lipschitz there. The equation also holds in the cap coordinates with \(u=1\), \(\eta=s\) up to an additive constant, and \(b=\sin s\).

**Raw model.** The radius \(b\) is strictly increasing away from the cap centre, with its only positive stationary point at the seam, where \(b=1\). For \(0<c<1\) a quotient trajectory turns at most once, in the cap, and extends out the exterior. For \(c>1\) it turns once in the exterior, and the nonparallel \(c=1\) trajectories are exterior trajectories asymptotic to the seam in one direction. A meridian with \(c=0\) traverses the smooth cap centre and runs out to infinity in both directions. Thus only the seam gives a closed connected invariant minimal hypersurface in the raw model.

**Compact representative \(u=\sin r\).** The weighted radius is \(b=\sin s\) on the cap and \(b=\sin^2r\), \(d\eta=\sin^2r\,dr\), on the exterior. It increases from zero to one and decreases back to zero. For \(0<c<1\) the turning points are \(s=\arcsin c\) and \(r=\pi-\arcsin\sqrt c\). The angular advance per complete radial oscillation is
\[
 \Delta(c)=\pi+2I(c),\qquad
 I(c)=\int_{\pi/2}^{\pi-\arcsin\sqrt c}
       \frac{c\,dr}{\sqrt{\sin^4r-c^2}} .
\]
The cap contributes \(\pi/2\) between its turning point and the seam, from its great-circle geometry. In the exterior use \(-\cos r=\sqrt{1-c}\sin\alpha\) to obtain
\[
 I(c)=\int_0^{\pi/2}\frac{d\alpha}{\sqrt{(1+(1/c-1)\cos^2\alpha)
 (2+(1/c-1)\cos^2\alpha)}}.
\]
The integrand increases strictly with \(c\) for \(\alpha<\pi/2\) and is bounded by \(1/\sqrt2\). The rotation number \(\Delta/(2\pi)\) therefore increases from \(1/2\) to \((1+1/\sqrt2)/2\). The rational values give immersed closed lifts. If the rotation number is \(p/q\) in lowest terms, the closed quotient winds \(p\) times about the cap centre. An embedded simple closed quotient of nonzero winding winds once, but \(1/q\) is outside this open range for every integer \(q\ge1\).

The case \(c=1\) gives only the seam. For \(c=0\) the quotient is a meridional diameter through the cap centre, with a fixed-circle endpoint at each end, at angles differing by \(\pi\). These lifts are embedded totally geodesic \(S^3\)s, one for each angle modulo \(\pi\). The meridional reflection in \(\psi\) fixes them. At the exterior fixed circle an invariant three-dimensional tangent plane must be the standard \(\mathbb R^3\) normal to that circle. Thus an embedded invariant hypersurface meets the circle at isolated points. Its quotient then has \(b\to0\), forcing \(c=0\), which completes the embedded list.

| Metric | Closed connected minimal principal orbits | Closed connected embedded \(SO(3)\)-invariant minimal hypersurfaces |
| --- | --- | --- |
| Raw | Seam \(S^1\times S^2\) | Seam |
| Compact, \(u=\sin r\) | Seam \(S^1\times S^2\) | Seam and meridional \(S^3\)s |

## Principal mean curvature flows and end germs

Every exact minimal leaf gives a stationary mean curvature flow. The outgoing flows here mean flows of nearby principal orbits, or equivalently the ancient solutions asymptotic to the seam as time tends to \(-\infty\). Exact meridional minimal leaves are stationary too. Their distinct parallel-angle representatives are again minimal, so the family of meridional angles supplies no mean-convex departure from one of them.

| Metric and direction | Equation and time law | Limit and end germ |
| --- | --- | --- |
| Raw and compact, into cap | \(s'=-\cot s\), \(\cos s(t)=\cos s_0\,e^t\) | Finite time \(T=-\log\cos s_0\), core \(S^2\). \(s\sim\sqrt{2(T-t)}\), rescaled cylinder \(S^1(\sqrt2)\times\mathbb R^2\). |
| Raw, exterior leaves | \(x'=-\tanh x\), \(\sinh x(t)=\sinh x_0\,e^{-t}\) | Seam approached as \(t\to+\infty\). No outgoing exterior principal branch from the seam. |
| Compact \(u=\sin r\), into exterior | \(\rho'=-2\cot\rho\), \(\cos\rho(t)=\cos\rho_0\,e^{2t}\), \(\rho=\pi-r\) | Finite time \(T=-\tfrac12\log\cos\rho_0\), core \(S^1\). \(\rho\sim2\sqrt{T-t}\), rescaled cylinder \(S^2(2)\times\mathbb R\). |

The arrival times extend smoothly at their respective cores. Their deficits are \(-\log\cos s=s^2/2+O(s^4)\) and \(-\tfrac12\log\cos\rho=\rho^2/4+O(\rho^4)\). The cap collapse has a two-dimensional normal Hessian and the exterior collapse a three-dimensional one. The two-sided sweepout reverses one arrival-time sign. In either overall orientation, a Morse perturbation obtained by adding a small Morse function on the cap \(S^2\) has an index-two critical point there: it is the core maximum when the normal Hessian is positive, and the core minimum when the normal Hessian is negative. The exact cap model is Morse–Bott, with positive regular-leaf scalar curvature \(2\) all the way to the collapse. Compact exterior principal leaves have scalar curvature \(2/\sin^2r\).

## Dependence on compactification and entering gauge

In the raw exterior let \(u=e^w\) satisfy \(u(0)=1\), \(w'(0)=0\), and take \(u=\operatorname{sech}x\) near the infinite end to give the same smooth circle collapse. This preserves \(h\) and \(B=0\) at the seam. The sphere and circle factors give the mean curvature of a principal orbit with exterior-pointing normal and the normal Ricci trace there as
\[
 H(x)=u^{-1}(3w'(x)+\tanh x),\qquad q(0)=-1-3w''(0).
\]
For the latter identity, write the ordinary normal derivative as \(u^{-1}\partial_x\) and use \(\partial_\nu H=-|B|^2-\operatorname{Ric}(\nu,\nu)\) on the exterior. One may prescribe \(w''(0)\) freely and join to the fixed end expression with a smooth cutoff. For instance, \(u\equiv1\) on a seam collar makes the seam exterior-attracting in forward time, while \(u=\operatorname{sech}x\) makes it repelling there. In the former case \(b=u^3\cosh x\) increases near the seam and tends to zero at infinity, so there is at least one additional minimal principal orbit in the compact exterior. Thus the seam Jacobi data, the closed minimal list, and the outgoing flow from the seam depend on the compact conformal factor.

Neither exact join is a smooth entering gauge. The raw exterior has \(R=0\). The compact product exterior has Ricci eigenvalues \((0,2,2,2)\), so \(R=6\) and \(|Z|^2=R^2/12=3\). The frozen input gives neither a specified smooth interpolation at the seam nor a specified smooth entering representative or its min-max hypersurface. Even when a smoothing and an entering gauge are chosen, these one-sided spectral counts do not determine the index or location of a minimal cut for the smooth metric.

There is a separate conditional conclusion for smooth \(SO(2)\times SO(3)\)-invariant metrics with the given orbit action and \(\operatorname{Ric}>0\). The principal mean curvature is strictly decreasing along the unit normal orbit coordinate, by \(H'=-|B|^2-\operatorname{Ric}(\nu,\nu)\). It has opposite infinite limits near the two smooth end orbits, with \(+1/s+O(s)\) at the \(S^2\) end and \(-2/\rho+O(\rho)\) at the \(S^1\) end. There is one minimal principal orbit, and its two outgoing principal flows have the same codimension-two and codimension-three end germs. This identifies the constraint within the principal family. It does not identify the min-max cut, classify nonsymmetric flows or give an obstruction to another sweepout.
