# A closed test confined to one moving letter

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Bounded master B02, selected GPT-6.2 Astra/ultra scientific lead, separate serving telemetry unavailable. Checkout `48f36794f9b1`. Inputs are the [timed framed tubes](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md), the [fixed metric](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), [native fit](HOPF_CUFF_FIT_20261127.md) and the [physical curvature integration](NATIVE_RAYLEIGH_TRIAL_20261127.md). All signs below are for the numerator of \(-6\Delta+R\) on the original smooth Riemannian closed assembly.

Use just the first, inverse-\(x\), letter of the first band, with affine letter phase \(u=7\theta/(2\pi)\), and its angular sector \(63/128\le u\le65/128\). Put \(T=\sin(64\pi(u-63/128))\) there and zero on its complement. Let \(f=\chi(s)T(\theta)\) on that band. Use the [fixed 11-knot radial profile](NATIVE_RAYLEIGH_TRIAL_20261127.md) with its first value replaced by zero, leaving the other ten values unchanged. The entire attached cap has zero trace and zero test value. In the scalar-flat original exterior keep the same framed tube coordinates from \(r_0=9/8\) to \(R=3/2\), using
\[
 f=b(r)T(\theta),\qquad b(r)=\frac{r_0/r-r_0/R}{1-r_0/R}.
\]
Extend by zero beyond this annulus, including on the second complete band and cap and on all three original funnels. This is an admissible global \(H^1\) test. Longitude is a genuine coordinate of the outer sphere on the whole tube; the inverse framing recovers all three original displacements. These tube radii stay clear of the other surgery, the real boundary cuffs, and the compactification. The angular and outer radial edges have zero trace, and the step across the inner annular face matches the full band trace.

The entire planar projection of the support lies within Euclidean distance \(1/5\) of \((-2,0)\), the opposite point on the first letter circle. On this sector \(H'(u)\le [2(128/63)^2]/4\) and \(|u-1/2|\le1/128\), so the planar center moves by less than \(2\pi[2(128/63)^2]/512\). The normal planar displacement is at most \((3/2)/16\). The sum is less than \(1/5\). The half-turn identifies the corresponding metric data with the chart about the certified anchor \((2,0)\). The moving sector includes every sphere direction.

For an explicit quadrature, use the actual exterior coordinates \((x,y,\phi,\theta)\) on this band, as in the [curvature program](../numerics/native_rayleigh_fit.py). Write \(p\) for its unit framed normal, \(c=c(\theta)\) for the actual planar center, and
\[
 d r=16(p_1,p_2,p_3,-\langle(p_1,p_2),c'\rangle),\qquad
 d f=\chi' T\,dr+\chi T'\,d\theta .
\]
With \(g=(1-a)A+aB\) in the band, the integration density relative to \(dr\,d\theta\,dA_\sigma\) is \(16^{-3}r^2\sqrt{\det g}\). In the exterior annulus use the same formula for \(df\) with \(b\) and the same radial Jacobian with \(\sqrt{\det B}=\sqrt{\det q_L}\sin\phi\). Its Dirichlet term is thus determined by the values of \(q_L\) without its derivatives.

| Term of this single-band test | Fitted numerator contribution |
| --- | ---: |
| Band term from \((\chi' T)^2\) | \(+35.28054\) |
| Band radial--longitude cross term | \(+0.00005\) |
| Band term from \((\chi T')^2\) | \(+0.03347\) |
| Band scalar potential | \(-41.72831\) |
| Retained scalar-flat annulus out to \(R=3/2\) | \(+2.24018\) |
| Complete closed test | approximately \(-4.1741\) |

The band figures use the 64-by-56 native fit with 96 uniform radial cells augmented by the profile knots, two Gauss points per radial subinterval, 16 Gauss points in each half of the sector and 8 Gauss-in-height by 16 uniform azimuthal sphere points. The annular figure uses 15 radial Gauss points, five Gauss points in each half-sector, and 8 Gauss-in-height by 12 azimuthal sphere points. A separate band quadrature with 64 base cells, five nodes in each half-sector and a 4-by-8 sphere rule gave a band charge of \(-5.8023\), compared with \(-6.4142\) above. These are diagnostics on fitted coefficients. A combined rigorous upper error below four relative to the displayed closed numerator would prove a negative original sign. The pointwise anchor and the observed quadrature change do not establish that bound.

For comparison, extending an angular sine across the whole compact pants as \(\psi(\phi)T(\theta)\) and down the three funnels with their linear unscaled radial factor incurs appreciable angular energy. If \(w\) is the support length in the physical longitude and \(\psi=1\) on the tube latitude range, the funnels' angular contribution is at least
\[
 \frac{72L\log2}{\pi}\left(\pi+\frac{\pi^2}{2w}\frac9{64}\right).
\]
Indeed the conformal latitude \(\log\tan(\phi/2)\) changes by at least \(9/64\) over that range. The plateau contributes \((9/64)\int(T')^2\), and the two half-line Dirichlet extensions each cost at least \((\pi/w)\int T^2=\pi/2\). The compactly supported annular test incurs none of this funnel contribution.

## Certified charge on the entire retained exterior

Let \(J=\sqrt{\det q_L}\) and \(B_0\) bound the largest eigenvalue of \(Jq_L^{-1}\). The [physical rectangle enclosure](RADIAL_KINETIC_CERTIFICATE_20261127.md) gives \(J<J_0=0.254\) and \(B_0=2.336\) throughout \([9/5,11/5]\times[-1/5,1/5]\), hence on the whole support by the half-turn. Write \(w=2\pi/(7\cdot64)\), \(k=\pi/w=224\), and \(\delta=1/16\). For the exterior extension above, put \(A_r=\int r^2(b')^2\,dr=9/2\) and \(B_r=\int r^2 b^2\,dr=81/512\). The integrals run from \(9/8\) to \(3/2\). The physical latitude satisfies \(\sin\phi>4/5\), and on this particular sector \(|c'|\le(7/2)(128/63)^2<29/2\).

In the native exterior coordinates the planar and latitude components of the differential give the bound \(256 A_r(2B_0+J_0)/3\) after division by the sphere area and \(\int T^2\,d\theta=w/2\). For the longitude component, first bound \(J/\sin\phi\) by \(5J_0/4\) on the whole nonnegative square
\[
 \left(bT'-16b'T\langle (p_1,p_2),c'\rangle\right)^2 .
\]
The cross term then integrates to zero by the first moment of the complete sphere. Its second moments are \(1/3\) in all three normal directions. Since the original exterior is scalar-flat, its entire charge obeys
\[
 \begin{aligned}
 Q_{\rm ext}
 &\le 6\delta^3(4\pi)\frac w2
 \left[256A_r\bigg(\frac{2B_0+J_0}{3}
       +\frac54 J_0\frac{(29/2)^2}{3}\bigg)+\frac54 J_0 k^2B_r\right]\\
 &=\pi^2\left(\frac9{896}B_0+\frac{95337}{65536}J_0\right)<3.882 .
 \end{aligned}
\]
Every other exterior point, including all three genuine funnels, has zero test value. The radius-one caps also have the constant value zero. The angular bound, radial integrals and use of the full spherical square were independently checked. The [rectangle replay](../numerics/radial_kinetic_certificate.py) uses the options `--moving-rectangle --rectangle-cells 256`. For this particular complete test a certified band numerator at most \(-3.882\) suffices for *both* negative signs. Its fitted band numerator is about \(-6.4142\), leaving a one-sided integration allowance greater than 2.53. That band inequality remains open.
