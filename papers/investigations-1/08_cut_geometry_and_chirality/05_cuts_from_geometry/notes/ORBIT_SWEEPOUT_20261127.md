# A surface collapse and a meridional sweepout in the same metric

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex. Selected lead Astra/ultra, actual serving settings unavailable. GEO-B01/E08, local and global statements with the indicated symmetry. The input is the parent Sections 2, 6, 7 at bc2c1bb and its [cap construction](../../manuscript/cuts_of_subcritical_conformal_classes.tex). Independent reading is recorded in the [branch reviews](../reviews/README.md).

## The compact smooth test

Write the round four-sphere in the unit sphere of R²⊕R³ as
\[
 (\sin r\,e^{i\psi},\cos r\,\omega),\qquad 0\le r\le \pi/2,\quad \omega\in S^2.
\]
The group is SO(2)×SO(3). Here Ric=3g, W=0 and R=12, so this is a smooth entering metric. The principal orbits have mean curvature \(H=\cot r-2\tan r\) in the direction of increasing r and intrinsic scalar curvature \(2/\cos^2 r\). The unique minimal principal orbit is at \(\sin^2 r=1/3\). For ordinary mean curvature flow \(\dot r=-H\), the variable \(y=\sin^2 r\) satisfies \(\dot y=6y-2\). Start on nearby strictly mean-convex leaves on opposite sides of the minimal orbit. In forward finite time the inner branch reaches the great two-sphere at r=0, the outer branch the great circle at r=π/2. The minimal orbit itself is stationary. Every complete sweep by regular principal orbits has both endpoints. At the two-sphere the tangent flow is the shrinking circle times a plane and the regular scalars tend to 2. A critical manifold of normal rank two at an extremum differs from an isolated Morse saddle of index two.

The full Jacobi operator at that minimal orbit is \(-\Delta-6\). The eigenvalues of the positive Laplacian there are \(3m^2+3l(l+1)/2\). This gives full index 6 and nullity 6, counting multiplicities, and invariant index 1. Its area is \(16\pi^2/(3\sqrt 3)\). A meridional great three-sphere has area \(2\pi^2\) and is totally geodesic. Either the area comparison or the full index excludes the principal orbit from the first fundamental-class width. From the meridian, ordinary mean curvature flow starting on each nearby round latitude collapses to a point on each side. This example refutes ambient exclusion for principal-orbit flows. It leaves the first-width version of the exclusion open.

## The angular cut for the whole untwisted smooth family

Let a smooth cohomogeneity-one metric on the standard join with these two singular orbits be written in arclength from the two-sphere as
\[
 g=dr^2+a(r)^2 d\psi^2+b(r)^2 g_{S^2},\qquad 0<r<L .
\]
This form follows for the indicated untwisted invariant metrics after orthogonal transport of the angular coordinate. The two warp factors are positive inside. At the left endpoint \(a=r+O(r^3)\) is odd and \(b=b_0+O(r^2)\) is even. At the right endpoint, writing \(s=L-r\), \(b=s+O(s^3)\) is odd and \(a=a_L+O(s^2)\) is even. These parity statements concern smooth radial germs. Suppose Ric>0. The radial variation of the orbit area and the Ricci component in the unit circle direction give
\[
 H=(\log(ab^2))',\qquad H'=-|B|^2-\operatorname{Ric}_{rr}<0,
 \qquad (b^2 a')'=-ab^2\operatorname{Ric}_{\psi\psi}^{\rm unit}<0.
\]
The last identity follows by summing the radial-circle curvature \(-a''/a\) and two copies of the circle-sphere curvature \(-a'b'/(ab)\). Since \(b^2a'\) tends to zero at the right, \(a'>0\) inside. The asymptotic values of H are \(1/r+O(r)\) and \(-2/s+O(s)\). There is exactly one minimal principal orbit. Every orbit flow from its two sides ends as in the round test, with finite travel time from any noncritical interior starting leaf.

Choose a meridian, equivalently a phase \(\psi_0\), and take the real angular component of the circle Killing field length,
\[
 f=a(r)\cos(\psi-\psi_0).
\]
The phase is measured using the arclength section of the orbit map. Changing it gives an isometric sweepout. The function is smooth at the two-sphere because it is a Cartesian normal coordinate times the even smooth factor \(a/r\). Its differential is nonzero there. Where \(0<r<L\), the two components \(a'\cos(\psi-\psi_0)\) and \(-a\sin(\psi-\psi_0)\) cannot vanish together. On the singular circle the angular derivative vanishes at exactly the two extrema. Smoothness gives
\[
 \operatorname{Ric}_{\psi\psi}^{\rm unit}(L)=-3a''(L)/a_L>0.
\]
At the maximum the Hessian has one strictly negative circle entry and three equal strictly negative normal entries. At the minimum all signs reverse. Thus f is a Morse function with just two critical points. Its central level is the fixed hypersurface of angular reflection across the corresponding diameter. It is a smooth totally geodesic three-sphere, hence has pointwise positive scalar in an entering gauge by the hypersurface Gauss equation. The normalized gradient flow between regular levels yields a sweepout of both sides. Each level has scalar curvature uniformly bounded below over the whole sweepout: this follows on compact regular regions by continuity, and near either extremum the Hessian has a fixed definite sign, so every tangential two-fold symmetric sum stays positive and the scalar tends uniformly to positive infinity. This argument uses the length of a Killing field and the positive Ricci equation. The resulting flow on general members is the gradient flow of f.

A reflection meridian supplies the global width upper bound
\[
 W_1(M,g)\le 2|S^2|\int_0^L b^2\,dr .
\]
Its right side is the area of the fixed three-sphere. The inequality uses Zhou's least-area characterization among embedded minimal hypersurfaces. It does not assert that this meridian realizes the width. The action and its two specific singular-orbit types are hypotheses of this construction.

## Passing from an entering class to an invariant gauge

Suppose a compact group G acts isometrically on a smooth reference metric h in an entering class. Chang–Gursky–Yang, Theorem A, supplies an admissible metric \(v^{-2}h\), with v positive. In the parent normalization the Schouten tensor multiplied by v is
\[
 K(v)=v A_h+\nabla^2v-\frac{|dv|^2}{2v}h .
\]
At each point it belongs to the positive cone \(\{\operatorname{tr}K>|K|\}\), equivalent to positive trace and positive \(\sigma_2\) in the background inner product. This is an open convex cone, invariant under positive scaling and orthogonal pullback. Average the positive factors \(v\circ\gamma\) over normalized Haar measure. Weighted Cauchy–Schwarz gives \(|d\bar v|^2/\bar v\le\overline{|dv|^2/v}\), so \(K(\bar v)\) is the average of admissible tensors plus a nonnegative multiple of h. The strict cone inequality persists. Therefore \(\bar v^{-2}h\) is an invariant entering gauge. Both the admissible metric and the smooth group-invariant reference metric are essential to the argument. [Chang, Gursky and Yang, Theorem A](https://arxiv.org/pdf/math/0409583#page=4)

For the equality cap choose the compact representative which multiplies the exterior by \(\sin^2 r_{\rm ext}\) and leaves the cap unchanged. The cap scalar is 4 and the compact exterior scalar is 6. In arclength at the seam the two warps and their first derivatives match, and the second derivatives have bounded one-sided limits. Smooth the warps in a shrinking interior seam collar by one-dimensional convolution with a positive kernel, using a fixed cutoff supported away from the two ends to localize the convolution. In the cutoff transition all jets converge smoothly; near the seam the scalar is affine in the two second derivatives with continuous coefficients. The mollified expression is the mollified scalar up to o(1) there, and stays positive. Curvatures stay bounded and converge off the seam, so dominated convergence gives both chiral energies converging to the equality value \(16\pi^2/3<8\pi^2\) (product curvatures 1 and 1 on the cap give \(|W^\pm|^2=2/3\) and its volume is \(8\pi^2\); the exterior is conformally flat). This yields smooth untwisted entering classes to which the invariant-gauge argument applies. Equality of energies after smoothing is unnecessary. The product representative itself has no classical two-sided Jacobi operator at the join. [One-sided calculation](../research-progress/handoffs/E02_MODEL.md)

## Which Section 6 examples the test reaches

For every regular radial slice of the stated **cap metric**, including the twist, the area density is \(a(s)\sin\vartheta\), \(H=a'/a\) and the intrinsic metric is locally the product of the unit two-sphere and a circle (untwist the constant b(s) on this slice). Its scalar is exactly 2. Starting sufficiently close to a smooth core, \(a=s+O(s^3)\), the inward MCF obeys \(\dot s=-a'/a\) and reaches the two-sphere in finite time. If \(a'(S)<0\), the first zero of \(a'\) from the center is an interior minimal radial slice. Its inner parallels in the component where \(a'>0\) have the same finite future endpoint. For nonsmooth trial profiles these are classical statements on their smooth pieces and the core asymptotics require regular core data. The cap calculation is local to the supplied representative.

| Section 6 input | Geometric result and extent |
| --- | --- |
| Equality half-product, length 2π | Exact product-gauge table in E02. The smooth invariant entering gauges obtained above have a unique minimal principal orbit and the angular replacement. |
| Untwisted spherical exterior, θ=π/3, π/4, π/5 | For every admissible profile the cap derivative at the matching end is negative. The first zero of the radial mean curvature from the core bounds the inward basin. On any **smooth entering** untwisted join the global angular result applies, independently of the numerical energy values. |
| Flat exterior trial, positive finite radius | The outward exterior circle radius decreases in the rescaled near-face metric. The radial inner cap computation applies. The reported trials above the wall give no smooth entering example from those trials. |
| Two-twist trefoil and figure-eight, three-twist trefoil both framings, four-twist trefoil both framings, five-twist trefoil | Same inner radial result whenever a smooth cap with the stated boundary data is used. The reduced symmetry and the actual knot exterior supply neither the global untwisted join coordinate nor the first-width surface. The original Section 6 values are numerical. TUBE has since certified the two-twist trefoil with an explicit profile: [its actual radial cuts](TREFOIL_RADIAL_CUT_20261127.md) are now computed in both cap gauges. No global entering-gauge MCF is identified by the cap energies. |

The closing observation of Section 6 also mentions Fuchsian exteriors attached to a hemisphere. The cap-side radial result holds for the indicated product hemisphere. Rotation invariance of the sphere factor alone supplies no global product action or angular height on its exterior.

Changing the initial regular orbit while retaining the orbit foliation cannot remove the codimension-two end of a full sweep. A change to the angular cut does remove it in the specified smooth untwisted metrics. Neither conclusion determines the topology of an arbitrary homotopy four-sphere.
