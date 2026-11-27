# A two-sided native metric bound on the long-cuff footprints

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance under master B02. Checkout `48f36794f9b1`. Selected Astra/ultra scientific lead and Sol/ultra independent derivations. Independent serving telemetry is unavailable. We use the original oriented planar coordinate and the [unchanged smooth trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md). The target vertices, reflections, chart radii and upper estimates are those of the [fixed-width enclosure](HARMONIC_MARKING_ENCLOSURE_20261127.md). All metric comparisons here use the Euclidean norm in that coordinate.

For the orientation-preserving harmonic diffeomorphism of the doubles write \(H,L_0\) for its squared holomorphic and antiholomorphic stretches in the planar coordinate (the cuff length is still denoted by \(L\)). Thus the singular values of the real differential are \(\sqrt H\pm\sqrt{L_0}\), \(J=H-L_0>0\), \(E=2(H+L_0)\), and \(|\Phi|^2=HL_0\) for the holomorphic Hopf coefficient. Here the capital \(H\) denotes a stretch only within this note. The identities \(\Delta\log H=2J\) and, off the zeros of \(\Phi\), \(\Delta\log L_0=-2J\) use the flat Laplacian and target curvature \(-1\). These follow by applying the harmonic map equation in a conformal target coordinate, or from the Bochner identities in [Wolf, §2](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf). Reflection in each source circle implies that \(H|dz|^2\) doubles smoothly and the circle is geodesic in that metric. The outward normal derivatives of \(\log H\) are consequently \(-1/2\) on the outer circle and \(+8\) on the two holes. Equivalently, differentiate the inversion factor \(R^4/|z-c|^4\).

## A lower bound for the larger stretch

Let
\[
h(z)=\frac{e^{|z|^2/64}}{256|z-1|^{3/2}|z+1|^{3/2}} .
\]
The two distances have sum at least 2 and are each at least \(1/4\), so their product is at least \(7/16\). Therefore \(2h<1/16=\Delta\log h\). On the outer circle the sum of the outward logarithmic distance derivatives is at least \(8/17\) (its exact value is \((136-16\cos^2\theta)/(289-64\cos^2\theta)\)). Thus \(\partial_\nu\log h\le1/8-12/17<-1/2\). On a hole the other center is at distance at least \(7/4\), and \(|z|\le5/4\), giving \(\partial_\nu\log h\le5/128+6+6/7<8\). On the set \(h>H\) one has \(\Delta\log(h/H)\ge 2(h-H)>0\). Integration against the positive part of this log ratio, with the outward inequalities, proves \(H\ge h\) everywhere. Throughout both footprints \(|z|\le265/128\), hence \(|z^2-1|<6\), so **\(H>1/4096\)** there.

## A lower bound for the smaller stretch

Put \(T=1-L_0/H\), so \(0<T\le1\). Where \(\Phi\ne0\), write \(v=\tfrac12\log(H/L_0)\). Then \(\Delta v=2J\) and
\[
\Delta T=4e^{-2v}(J-|\nabla v|^2)\le4HT .
\]
The inequality extends by smoothness at the zeros, including the conformal case. It holds in the slightly extended circular domain obtained by reflecting across each of its three cuffs. The extended map still has positive Jacobian, because the simultaneous source and target reflections preserve orientation of the map.

Here are explicit deliberately coarse constants on this domain. On every open \(1/16\)-disk centered in the closed original pants the reflected map lifts into at most four copies of the target hexagon sharing a vertex. A disk of this radius crosses at most one cuff. Inversion in a hole moves any point from the reflected sliver by at most \(1/3-3/16\), since its distance from the hole center is at least \(3/16\). The outer inversion moves a point of its sliver by at most \(2/16\). The unfolded planar footprint therefore lies within distance \(1/4\) of the disk center. It meets at most one real gap, because distinct gaps are separated by a removed diameter of at least \(1/2\). If both mirrors occur they are incident, since each nonincident real gap is farther than \(1/4\) from its opposite cuff. The four target copies share their right-angle vertex. The maximum distance from this vertex in each copy is \(\operatorname{arcosh}(29/4)<2.7\) by the vertex computation in the fixed-width enclosure. The disk-mean Bochner bound of that note gives \(E\le2(2.7)^2/(1/16)^2<4096\) on the original pants. On its open Euclidean \(1/16\)-neighborhood inversion increases this bound by at most \((4/3)^4<4\) (the outer inversion decreases it). Thus \(E<16384\), \(H<K=8192\) there.

For any disk of radius \(d\) in the extended domain the average of \(T\) is at most \(e^{\sqrt{4K}d}T(\text{center})\). Indeed its circular average \(m\) has \((rm')'\le4Kr m\), with zero first derivative at zero. Dividing by the positive radial solution \(I_0(\sqrt{4K}r)\) and differentiating the Wronskian shows the quotient is nonincreasing. The power series or circle integral gives \(I_0(t)\le e^t\). Integrate the circle bound to obtain the disk bound.

Take \(r=1/128\). Partition the bounding square into \(N=2048^2\) squares of side \(1/256\), using one center in the closed pants from each square that intersects it. The \(r\)-disks cover the pants. The change of variables and Gauss–Bonnet on the hyperbolic pants give \(\int_F HT\,dx\,dy=2\pi\). Hence some disk has \(T\)-mass at least \(2\pi/(KN)\). From its center travel inside the closed pants to any desired point by a curve of length less than 10. The straight segment in the outer disk has length at most 8 and bypasses each removed disk along its shorter boundary arc, of length at most \(\pi/4\). Subdivide with steps of length at most \(r\), giving at most 1280 steps. If successive centers are \(x,x'\), then for each \(y\in D_r(x')\) the preceding disk \(D_r(x)\) lies in \(D_{3r}(y)\). The latter disk remains in the extended domain. Since \(e^{3r\sqrt{4K}}<128\), the average over \(D_r(x)\) divided by \(1152=9\cdot128\) is a pointwise lower bound at \(y\). This also works with coincident centers, so 1281 steps including a last stationary step suffice. An explicit common bound is
\[
 T(z)\ge t_*:=\frac{2}{K N r^2}\,1152^{-1281}\qquad (z\in F).
\]
The reflection extension here is used only to estimate disk averages. The area input and the physical metric are on the original marked pants.

Consequently the whole-footprint enclosure is
\[
 \frac{t_*^2}{16384}\,|dz|^2\ \le\ q_L\ <\ 28\,|dz|^2 .
\]
Indeed the smaller eigenvalue is \(H(1-\sqrt{1-T})^2\ge HT^2/4\). This is a computable strict ellipticity margin. Its small size rules out using it alone for accurate inverse-metric arithmetic. The stretch barrier, which is much larger, separately improves the native first-derivative estimate in the [harmonic data calculation](NATIVE_HARMONIC_DATA_20261127.md). Neither bound evaluates a Rayleigh quotient.
