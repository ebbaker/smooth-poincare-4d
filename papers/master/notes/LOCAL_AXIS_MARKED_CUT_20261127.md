# A marked small umbilic sphere at a rotational axis

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Master B05/B06, intake 48f36794f9b1. Selected scientific leadership GPT-6.2 Astra/ultra, bounded independent reading GPT-6.2 Sol/ultra. The derivation uses the [attained trace comparison](ROUND_CUT_TRACE_TEST_20261127.md), the [two cap and collar identifications](../manuscript/marked_cut.tex) and the [local product curvature equation](../manuscript/claude/symmetric_critical_classes.tex). All metrics are smooth and Riemannian and the closed manifold is oriented.

**Selection theorem.** Suppose a positive subcritical conformal class attaining \(I^+(M)\) on a smooth homotopy four-sphere admits a local \(SO(3)\) action by conformal maps on an invariant open tube about a segment of a fixed curve. Assume the isotropy acts in the standard way on the three normal directions. Every sufficiently small neighborhood of an interior axis point contains a marked conformally round umbilic three-sphere satisfying
\[
 \frac1{27}\int_\Sigma |H|^3\,dA_h < 2\pi^2
\]
in the same globally pinched representative. Thus \(M\) is standard and its minimizing conformal class is round. No symmetry outside the specified tube is required. The construction also gives these local spheres and this trace bound before attainment in every positive subcritical class with the stated local symmetry.

**The curve whose rotation gives the cut.** Average a representative over the compact local action. This gives a smooth local metric \(g_*\) in the class. Along the axis use arclength \(x\) centered at the point, a parallel orthonormal normal frame, normal distance \(r\), and angular variable \(\omega\in S^2\). The fixed curve is totally geodesic. Gauss's lemma and the isotropy of each sphere orbit give
\[
 g_*=dr^2+a(x,r)^2dx^2+b(x,r)^2\sigma_2,\qquad
 a=1+r^2 A(x,r^2),\quad b=r(1+r^2 B(x,r^2)).
\]
Indeed the stabilizer fixes no angular one-form and its only invariant angular quadratic forms are multiples of \(\sigma_2\). Smooth invariant scalars on the normal disk depend smoothly on \(r^2\); smoothness at its center and the radial unit speed give the displayed leading coefficients. In \(b^{-2}g_*\), the product of a geodesic of \((dr^2+a^2dx^2)/b^2\) with the orbit sphere is totally geodesic.

Write \(x=\epsilon u,r=\epsilon v\). In the quotient metric replace \(a,b\) by \(a_\epsilon=a(\epsilon u,\epsilon v)\) and \(b_\epsilon=b(\epsilon u,\epsilon v)/\epsilon\). The limit on \(v>0\) is the hyperbolic upper half-plane. Start the two halves of the geodesic at \((0,1)\) with the two horizontal unit tangent vectors. At \(\epsilon=0\) these halves form the unit semicircle. On a compact neighborhood of the part \(v\ge1/2\), geodesic ODE dependence gives difference \(O(\epsilon^2)\) in every fixed finite differentiability norm, up to a smooth parametrization, including the transverse hits of \(v=1/2\).

At either hit use \(v\) as parameter. Suppress the subscript \(\epsilon\). The length density is \(b^{-1}\sqrt{1+a^2u'^2}\) and its momentum \(p=a^2 u'/(b\sqrt{1+a^2u'^2})\) obeys
\[
 u'=\frac{pb}{a\sqrt{a^2-p^2b^2}},\qquad
 p'=-\frac{b_u}{b^2}\sqrt{1+a^2u'^2}
       +\frac{aa_u u'^2}{b\sqrt{1+a^2u'^2}} .
\]
On the two limiting branches \(p=\pm1\), and \(a^2-p^2b^2\ge3/4\) for \(0\le v\le1/2\). After substituting \(u'\) from the first equation, both right-hand sides are \(v\) times smooth functions of \((u,v^2,p)\): \(b=v(1+O(\epsilon^2v^2))\), \(b_u=O(\epsilon^2v^3)\), and \(a_u=O(\epsilon^2v^2)\), with smooth remainders. In the coordinate \(v^2\) this is a regular ODE up to zero. Continuous dependence on that closed interval keeps the denominator positive and gives the same \(O(\epsilon^2)\) estimate through either pole in every fixed finite norm. In Cartesian normal variables these pieces are the smooth graphs \(u=u(|y|^2)\). Their endpoints are distinct. The lifted compact hypersurface is embedded, is a \(C^k\)-small perturbation of the unit sphere after dilation, and bounds the small coordinate ball it encloses. Radial projection from the centered origin, followed by inversion of this projection, fixes a parametrization close to the unit sphere; the family is star-shaped by \(C^1\) closeness.

Umbilicity on the open orbit set extends across the two poles. The induced metric of \(g_*\) is rotationally symmetric and conformally round. In meridian arclength \(t\) it reads \(dt^2+d(t)^2\sigma_2\) with simple smooth poles. Set \(d\log\tan(\theta/2)=dt/d(t)\). This gives \(0<\theta<\pi\); \(d(t)/\sin\theta\) extends positively and smoothly across the poles since \(d(t)\) is odd to all orders in distance and has inward derivative \(1\). Together with the framed angular coordinates this fixes a round conformal parametrization on choosing the additive constant of the integral. The decreasing-\(r\) radial normal of a sphere about the origin is not the increasing quotient parameter on both geodesic halves. Use the smooth normal pointing **out of the enclosed ball** and its negative on the complement. Under these normals the two induced traces are opposite on the same \((\Sigma,h)\). Use the actual round parametrization and its inverse at the two closed faces, composing with a round reflection for the opposite boundary orientation. Both inward collar germs for the caps are then determined by the corresponding outward side traces. [First-jet cap construction](ROUND_CUT_TRACE_TEST_20261127.md)

**The physical trace.** Choose the globally pinched \(g=w^2g_*\) on the tube, with \(w_0=w(0)>0\). It has \(S_\nu=R_g-2\operatorname{Ric}_g(\nu,\nu)\ge\delta>0\) uniformly on a smaller compact tube for every unit normal, by \(|\operatorname{Ric}_0|^2<R_g^2/12\) and Cauchy–Schwarz on trace-free tensors. On the unit sphere the rescaled induced metric is
\[
 k_\epsilon=(\epsilon w_0)^{-2}h_\epsilon
 = (1+2\epsilon L)\sigma_3+O_{C^2}(\epsilon^2),\qquad
 L(\xi)=dw_0(\xi)/w_0 .
\]
Here \(dw_0\) means the differential of \(w\) at the axis point in axial and Cartesian normal coordinates. The rescaled graph and the ambient \(g_*\) each differ from the Euclidean model by \(O(\epsilon^2)\) through the required derivatives. \(L\) is a first spherical harmonic, possibly zero. Pullback by the time-\(\epsilon\) flow of \(\nabla L\) removes its linear contribution since \(\nabla^2 L=-L\sigma_3\).

The functional \(J(k)=\int (R_k/6)^{3/2}\,dA_k\) is twice differentiable in a \(C^2\) neighborhood of \(\sigma_3\). Its first variation there vanishes: the integrated scalar variation contributes \(-\tfrac12\int\operatorname{tr}\dot k\) and the volume variation contributes the opposite term. Thus \(J(k_\epsilon)=2\pi^2+O(\epsilon^4)\). Umbilic Gauss on the physical cut gives the exact identity
\[
 \frac1{27}\int_\Sigma |H|^3\,dA_h
 =\int_{S^3}\left(\frac{R_{k_\epsilon}-(\epsilon w_0)^2 S_\nu}{6}\right)^{3/2}dA_{k_\epsilon}.
\]
Here \(R_{k_\epsilon}\) tends uniformly to 6 and \(S_\nu\) is uniformly bounded above and bounded below by \(\delta\). The mean value theorem gives an upper bound \(2\pi^2-c\epsilon^2+O(\epsilon^4)\) with \(c>0\). This pays the original physical trace test simultaneously for both outward signs on the actual cut. At an attained minimum the two positive marked caps approach their raw signed costs and the marked reassembly and Weyl continuation prove the theorem. [Physical cap comparison](ROUND_CUT_TRACE_TEST_20261127.md) · [Independent reading](../reviews/WEIGHTED_CAP_INDEPENDENT_READING_20261127.md)

There is a shorter curvature check when the class is already Bach-flat. In the above optical product the quotient curvature \(K=b^2K_{dr^2+a^2dx^2}+b\Delta b-|db|^2\) extends smoothly with boundary value \(-1\). The product Bach equation gives \(\nabla^2K=(1-K^2)q/2\) for the optical quotient \(q\), so \(J\nabla^q K=b^2J\nabla^{dr^2+a^2dx^2}K\) is a local Killing field of \(q\), conformal for the compact metric and zero on the open axis segment. In local isothermal coordinates of the smooth reflection double of the compact quotient, reflection can be straightened to complex conjugation (for example, symmetrize a centered complex coordinate whose differential maps the fixed tangent to the real line). The coefficient of the conformal field is holomorphic on the half disk, continuous and zero along its diameter. Schwarz reflection and the identity theorem give zero in an open half disk. Thus \(K=-1\) there and the four-metric is Weyl-flat on an open set. This localizes the earlier product calculation to a fixed arc. The explicit sphere construction above also supplies both physical collar data prior to criticality. No local rotation action has been deduced on an arbitrary attained class. [Product equation in the master](../manuscript/claude/symmetric_critical_classes.tex) · [Weyl continuation, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)
