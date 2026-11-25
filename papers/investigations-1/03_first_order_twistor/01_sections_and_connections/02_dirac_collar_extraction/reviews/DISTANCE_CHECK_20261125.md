# Physical distances on the whole weakly compared base

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [bounded EXTRACT-E15 request](../research-progress/handoffs/DISTANCE_CHECK_REQUEST_20261125.md)
specifies gpt-6.2-sol/ultra. Actual serving settings are unavailable.
Checked the [E14 note](../notes/E14_WEAK_MARKED_BASE_20261125.md) at SHA-256
71fa1d973301df7034e2ffdf935aca93a187103f6eb6d60cbcbbc0dd34dea4da, working
checkout 0c3399d831d71a1a17c29ffcba14ee0593315cbe.

## Result and hypotheses

Use the physical unit-volume positive Yamabe minimizers on the fixed smooth
oriented homotopy four-sphere from E14, with its fixed chiral energy band.
On the closed smooth marked base \((N,h;P)\), suppose the whole compatible
smooth embeddings obey \(\Phi_i^*g_i=u_i^2m_i\) with
\(m_i\to h\) in \(C^0_{\rm loc}(N-P)\). The recovered smooth factor
\(u>0\) on the completed base gives \(G=u^2h\) of volume one.
Use the frozen premise \(u_i\to u\) strongly in \(W^{1,p}_{\rm loc}\)
for \(p>3\) and in \(L^q_{\rm loc}\) for \(q>4\). Then for every compact
\(K\subset N-P\),
\[
 \sup_{x,y\in K}\big|d_{g_i}(\Phi_i(x),\Phi_i(y))-d_G(x,y)\big|
 \longrightarrow0. \tag{1}
\]
The closed metric measure spaces with physical Riemannian volume
converge in measured Gromov–Hausdorff distance to \((N,d_G,dV_G)\).
The distance proof uses the stated exponents, volume saturation and
physical ball noncollapse. The E14 Bach and curvature bounds belong
to the argument supplying the marked comparison.

## Lower distance and small exceptional content

Fix a small \(b>0\) for disjoint \(G\)-normal balls at the marks, and
put \(K_b=N\setminus\bigcup_{z\in P}B_G(z,b)\). Use embeddings on
larger truncations. Write \(w_i=u_i-u\) and, at fixed \(\eta>0\),
\(S_i=\{x\in K_b:|w_i(x)|\ge\eta\}\). This set has a finite open
coordinate ball cover whose \(G\)-diameters sum to at most
\(C_b\eta^{-p}\|dw_i\|_{L^p(K_{b/2},h)}^p=o_{i,b,\eta}(1)\).

Indeed, cover \(K_b\) by finitely many coordinate interiors with
fixed buffers in \(K_{b/2}\). In each chart choose a fixed radius
\(r_0\) so balls of radius \(5r_0\) about eligible centers stay in
the chart. For \(r_j=2^{-j}r_0\), Poincaré on the Euclidean balls
and telescoping their means give
\[
 |w_i(x)|\le C_{r_0}\|w_i\|_p+
 C\sum_{j\ge0}r_j^{1-4/p}
        \left(\int_{B(x,r_j)}|Dw_i|^p\right)^{1/p}.
\]
The difference of successive means is bounded by \(C\) times the
mean oscillation on the larger ball, and the means tend to \(w_i(x)\).
If every integral were at most \(c\eta^p r_j\), the sum would be
at most \(Cc^{1/p}\eta\sum_j r_j^{1-3/p}\). This is finite for \(p>3\).
Choose \(c\) so this term is less than \(\eta/2\), and then \(i\) large
so the first term is less than \(\eta/2\). Each bad point therefore has
a centered ball with integral \(>c\eta^p r_j\).
Select a finite subcover of the compact bad set, retaining each ball's
chart label. In each chart select disjoint balls by taking them in
decreasing radius order and discarding those that meet a previously
kept ball. The fivefold enlarged kept balls cover the discarded balls.
Their diameters sum to a constant times the sum of the kept radii,
which the disjoint energy integrals bound by
\(C\eta^{-p}\int |Dw_i|^p\). Summing over the atlas proves the
Hausdorff one-content bound.

Contract these open balls and the balls \(B_G(z,2b)\), \(z\in P\),
using the following pseudometric on \(N\). Let \(d_Q(x,y)\) be the
infimum of costs of finite chains that pay \(d_G\) for a usual step
and allow a free step between any two points of a single contracted
set. If two free steps use the same set, replace everything from the
first entry to the last exit by one free step. After finitely many
such replacements each set is used at most once. Paying its diameter
for each remaining free step gives
\[
 d_G(x,y)-D_{i,b,\eta}\le d_Q(x,y)\le d_G(x,y),\qquad
 D_{i,b,\eta}\le C|P|b+o_{i,b,\eta}(1). \tag{2}
\]
This proof allows overlaps and repeated visits.

Each closed source exterior is incident to one marked boundary
sphere. For \(P\ne\varnothing\), take the Mayer–Vietoris sequence in
degree zero for open thickenings of the core and its exterior.
Their intersection is a disjoint union of \(|P|\) boundary collars.
As the core and \(M\) are connected and \(H_1(M)=0\), the number of
exterior components is \(|P|\). Each component meets a boundary and
each connected boundary is incident to one exterior, giving the
bijection. For \(P=\varnothing\), the compact embedding of the entire
base is onto by openness and closedness.

Use \(\Phi_i^{-1}\) followed by the metric quotient projection for
the map on the core. Map each exterior to its mark's quotient point.
Near each core face this map is locally constant because the contracted
puncture ball includes the surrounding model collar. It is also locally
constant on the open exceptional balls. At a remaining core point
\(u_i\ge u-\eta\). Choose \(\eta<\inf_N u/2\), and set \(u_*=\inf_N u\).
Uniform convergence of \(m_i\) on the fixed core gives
\[
 |v|_{u_i^2m_i}\ge(1-\eta/u_*)(1-o_{i,b}(1))\,|v|_G .
\]
Along a piecewise smooth source path, compose the quotient map with
the distance from its starting point in the quotient. This real
function is locally Lipschitz for each fixed \(i\), since it is a
composition with the smooth inverse embedding, or locally constant.
Its a.e. derivative is bounded by the \(G\) tangent speed where the
map comes from a good core point, and is zero where locally constant.
Integrate, invoke (2) at the endpoints, and take the infimum over paths.
For \(x,y\in K_b\),
\[
 d_{g_i}(\Phi_i(x),\Phi_i(y))\ge
 (1-\eta/u_*)(1-o_{i,b}(1))
 \big(d_G(x,y)-D_{i,b,\eta}\big).
\]
The estimate includes paths taking any number of exterior and bad-set
shortcuts. For fixed \(K\subset N-P\), take \(i\to\infty\) at fixed
\(b,\eta\) before \(\eta\downarrow0\) and \(b\downarrow0\) with
\(K\subset K_b\). This proves the uniform lower part of (1).

## Upper distance by averaged broken lines

Take endpoints \(x,y\) in a buffered Euclidean coordinate region and
a positive-volume set of possible midpoints \(U\), such that both
segments through any \(z\in U\) stay in the region. With \(U\subset
B_R(x)\), integration in polar coordinates about \(x\) gives for \(f\ge0\)
\[
 \int_U\int_{[x,z]} f\,ds\,dz
 \le C R^4\int_{B_R(x)} f(v)|v-x|^{-3}\,dv
 \le C_q R^{4+1-4/q}\|f\|_{L^q(B_R(x))}. \tag{3}
\]
For the first step bound
\(\int_0^R r^3\,dr\int_0^r f(x+s\theta)\,ds\)
by \((R^4/4)\int_0^R f(x+s\theta)\,ds\) in each direction.
The second step uses \(q>4\). Add the estimate at \(y\) before
averaging over \(U\).

For each fixed pair of endpoints in \(N-P\), choose a path there
with \(G\)-length arbitrarily close to \(d_G(x,y)\).
To avoid punctures, reroute the subarc from first to last contact
with each small puncture sphere along the sphere at cost
\(O(b)\) per sphere. Approximate this path by a finite coordinate
polygon away from \(P\). For each segment use a sufficiently small
midpoint ball \(U\) around its Euclidean midpoint. Model lengths
of the broken segments can be made arbitrarily close to the
original segment length by continuity. The physical-model length
difference is bounded by \(C\int|w_i|\,ds\) plus
\(C\|m_i-h\|_\infty\) times coordinate length, all on the fixed
buffered chart. Apply (3) to \(f=|w_i|\) and divide by \(|U|\)
to choose midpoints with error tending to zero. This yields the
sharp upper limsup for fixed endpoints.

For nearby \(x,y\) at coordinate distance \(r\) in a fixed buffered
chart, take the radius-\(r/4\) midpoint ball and \(R=2r\) in (3).
With \(f=u_i\) the average gives a physical path of length at most
\(C\|u_i\|_{L^q}\,r^{1-4/q}\). The protected chart norms are uniformly
bounded. A finite chart cover gives a uniform local modulus for
pairs in each fixed compact. The triangle inequality and finite
\(d_G\)-nets give the upper part of (1) uniformly.

## Exteriors and global convergence

On each fixed \(K_b\), the density
\(u_i^4dV_{m_i}\) converges in \(L^1\) to \(dV_G\), by strong
\(L^4\) convergence and uniform coefficient comparison. Both total
volumes equal one. Thus the total exterior volume tends to
\(\operatorname{Vol}_G(N\setminus K_b)=O(b^4)\).
The uniform physical noncollapse from
[NECK-E11](../../01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)
gives \(\operatorname{Vol}_{g_i}B(x,r)\ge c r^4\) for \(r\le r_0\),
with fixed physical \(r_0>0\). If a point of an exterior has
ambient distance \(d>0\) from the core, its ball of radius
\(\min(d/2,r_0)\) stays in that exterior. For small fixed \(b\),
the exterior volume estimate then puts every exterior point within
\(Cb\) of its marked boundary for large \(i\). A minimizing exit
arc stays in the exterior up to first contact with that boundary.

By (1) on \(K_b\), each boundary has ambient diameter at most
\(Cb+o_{i,b}(1)\), giving the same iterated bound on exterior
ambient diameter. This also holds intrinsically in the closed
exterior. Use the protected model annulus \(b/2<d_G(z,\cdot)\le b\)
on the exterior side of the face. Every face pair is joined there
by a model path of length \(Cb\), via radial arcs and a smaller
sphere. In flattened half-ball coordinates at the face, (3) remains
valid by zero-extending the integrand and choosing all segments
inside the half-ball, with endpoints on the face allowed.
The fixed-pair upper estimate and the uniform local modulus then
give intrinsic distances between face points at most
\(Cb+o_{i,b}(1)\). Append the two minimizing exit arcs.

Map \(M\) to \(N\) by the inverse comparison on the core and by
the corresponding mark on each open exterior. This Borel map
has distortion at most \(Cb+o_{i,b}(1)\), since exterior points
are near their marked face and every target face lies at distance
\(b\) from its mark. Its image is \(b\)-dense, and the pushed-forward
measure converges in total variation on the core and has exterior
mass \(O(b^4)+o_{i,b}(1)\). Choose \(b_i\downarrow0\) slowly
along fixed truncations. The maps have vanishing distortion and
density error with weakly convergent pushed-forward volumes,
giving measured Gromov–Hausdorff convergence.

The argument assumes whole compatible embeddings and the stipulated
strong factor convergence. It gives metric and measure convergence
with no physical \(C^0\) tensor bound and leaves construction of the
marking on the raw sequence open.
