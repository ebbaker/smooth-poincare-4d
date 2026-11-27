# GEO-E15 · Independent replay of the trefoil’s radial cuts

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [request](../research-progress/handoffs/ISSUE_TREFOIL_FACE_20261127.md) specifies bounded Sol/ultra review. Actual serving model and effort were unavailable. I read the [lead note](../notes/TREFOIL_RADIAL_CUT_20261127.md) and its [script](../numerics/trefoil_radial_faces.py) at SHA-256 prefixes `4bda20726814a183` and `7d8dde3c84e16c31`, and the [TUBE-E01 note](../../03_tubes_and_exteriors/notes/E01_CAP.md) and [certificate](../../03_tubes_and_exteriors/numerics/trefoil_certificate.py) at SHA-256 prefixes `072391e9c8a4d2ee` and `2834f4d1d95d7624`. The base is `bc2c1bb`. The prescribed topology and marking are inputs from §6.2 of the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) and TUBE-E01. This replay concerns that one cap, outward-divergence mean curvature, and the curvature convention of positive unit spheres.

## Raw leaf and full Jacobi spectrum

The induced screw metric on each regular slice is
\[
h_s=a^2\,d\psi^2+d\vartheta^2+\sin^2\vartheta(d\phi+b\,d\psi)^2 .
\]
Its determinant in these angular coordinates is \(a^2\sin^2\vartheta\), so \(H=\partial_s\log\sqrt{\det h_s}=a'/a\). The unit normal \(\partial_s\) is geodesic. The traced Riccati equation gives \(q=\operatorname{Ric}(\nu,\nu)+|B|^2=-H'=-a''/a+(a'/a)^2\). At a root of \(H\), \(q=-a''/a\). The separate terms in \(q\) can depend on the twist even though their sum at the root is independent of \(b\).

On any fixed leaf, \(a\) and \(b\) are constant. The inverse angular metric and volume density give
\[
-\Delta_{h_s}=-\Delta_{S^2}-a^{-2}(\partial_\psi-b\partial_\phi)^2.
\]
The smooth product modes \(e^{im\psi}Y_j^n(\vartheta,\phi)\), with \(m,n\in\mathbb Z\), \(j\ge|n|\), form a complete complex basis. The azimuth mode includes the correct smoothness at both polar axes, and \(\psi\) has period \(2\pi\) in the product framing on the cap. The eigenvalues are \(j(j+1)+(m-bn)^2/a^2\). If \(j\ge1\) they are at least \(2\), attained for \(j=1,m=n=0\). If \(j=0\) and \(m\ne0\), the minimum is \(1/a^2\). Thus the first positive eigenvalue is exactly \(\min(2,1/a^2)\). The local change of angle \(\phi\mapsto\phi+b\psi\) also makes \(h_s\) a local product, giving scalar curvature \(2\) even for nonintegral twist.

Set \(x=s^2/4\) and \(p=1+ux+vx^2+kx^3\) as in the frozen input. Since \(a=sp\) and \(x_s=s/2\),
\[
D(x)=a'=1+3ux+5vx^2+7kx^3,\qquad
-a''/a=-D_x/(2p).
\]
I ran the lead interval script and reproduced the signs, the isolating bracket \(401/1000<x_*<402/1000\), \(6/5<q(x_*)<13/10\) and \(1/a(x_*)^2>8/5\). The sign of \(D_x\) is strictly negative on \([0,1/2]\) and \(D<0\) on \([1/2,1]\), so this is the unique regular radial zero in the cap. Independently of the lead's polynomial interval evaluation, I expanded the tested polynomials in Bernstein bases on sixteen equal subdivisions of each displayed interval. The range on each subinterval lies between its coefficient bounds since the basis sums to one and is nonnegative. With the frozen rational arithmetic and outward rounding to thousandths this gave \(p\ge301/1000\), \(D_x\le-287/250\) on the first half and \(D\le-131/1000\) on the second half. The trigonometric interval is in \((0,\min(\pi/2,11/10))\), so monotonicity and the alternating Taylor bounds for both endpoints apply.

At the unique raw leaf, \(J=-\Delta_{h_s}-q\) consequently has a simple negative constant mode and no kernel. The full physical index and nullity are \((1,0)\), including all angular variations. The root is strictly in the smooth cap, so this spectral calculation requires no seam Jacobi convention.

## Compactification, exterior collar, and collapse

For the specified factor \(w>0\), the new leaf volume density is \(w^3a\sin\vartheta\) and the unit normal is \(w^{-1}\partial_s\). Thus
\[
\widehat H=\frac{wD+3a w_s}{aw^2},\qquad
wD+3a w_s=wD+6xp w_x .
\]
Expanding this last polynomial in the same independent Bernstein check gave a global lower bound \(451/1000\), confirming the lead bound \(2/5\). There are no minimal regular radial leaves in the conformally compactified cap. In the matching exterior distance collar \(\theta\le r<\pi/3\), the raw gauge gives \(H=-\cos r<0\) from \(a_{\rm ext}=\ell/(2\pi\sin r)\) and \(dr/ds=\sin r\). The restored product gauge gives \(\widehat H=2\cot r>0\). These match their respective cap traces at \(s=2\) and also rule out a seam zero. The latter strict sign persists under the certified compact smoothing on a fixed small seam collar by \(C^1\) convergence. The distance collar does not supply a global regular radial foliation beyond the spherical quotient's cut locus.

On the raw inner basin \(0<s<s_*\), ordinary radial mean curvature flow obeys \(\dot s=-a'/a<0\). The mean curvature is bounded below positively on compact subintervals away from the pole and behaves as \(1/s+O(s)\) at the pole. This gives finite collapse onto the core \(S^2\), with \(s^2=2(T-t)+O((T-t)^2)\). Raw outer leaves move toward the seam. In the compact cap all regular radial leaves move inward under \(\dot s=-\widehat H/w\). The physical normal distance is \(\xi=\int_0^s w\,ds=w(0)s+O(s^3)\) and \(\widehat H=1/\xi+O(\xi)\). Hence \(\xi^2=2(T-t)+O((T-t)^2)\). Both blow-ups have the codimension-two cylindrical model \(S^1(\sqrt 2)\times\mathbb R^2\). In cap coordinates the cross term is smooth because \(b=O(s^2)\), and it does not change the leading Euclidean normal germ. The scalar curvature of a compact radial leaf is \(2/w(s)^2\). The exact raw minimal leaf itself is stationary, and the inward raw flows start on its inner parallels.

## Comparison with the energy certificate

I ran the 2,048-cell sibling certificate unchanged. It reproduced \(38411/5000\le e/\pi^2\le19281/2500<8\), \(R_g\ge819/625\) on the raw cap, and \((-6\Delta_g+R_g)w\ge3951/10000\) on the rescaled cap. This is a replay of its rational enclosure using the energy identity from parent Proposition 6.1. Independently, \(a\,ds=2p\,dx\), \(F=-c(1-x)\), and \((F_s)^2=c^2x\) give the substitutions used by the certificate. The determinant gives \(\Delta_g w=w_{ss}+(a'/a)w_s=xw_{xx}+(1+xp_x/p)w_x\). The factor \(w\) has the same value and first derivative as \(\sin r\) at the seam, so the scalar sign repair is the same compact gauge tested for radial minimality here. The energy is conformally invariant on each side and the restored product exterior is conformally flat. The original energy margin therefore persists for the positive-scalar smooth approximations described by TUBE-E01.

The repaired compact representative has exterior Ricci spectrum \((0,2,2,2)\), which gives \(|Z|^2=R^2/12\) on that open exterior. A smoothing supported only near the seam leaves this equality there. Thus the certificate gives an entering conformal class through positive scalar curvature and the subcritical energy margin. Its displayed compact metric is not a strict entering gauge. An interior cutoff conformal change can restore the raw representative near the regular minimal leaf without changing the global smooth class, but its local area criticality and ambient index do not identify any first-width realizer. The two gauge-specific radial conclusions in the lead note pass. Neither the test nor the certificate selects the radial faces of a smooth strict entering gauge or an unrestricted first-width hypersurface.
