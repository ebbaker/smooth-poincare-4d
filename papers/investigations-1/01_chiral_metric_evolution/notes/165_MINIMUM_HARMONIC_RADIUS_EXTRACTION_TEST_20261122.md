# E165 — Extraction at the minimum harmonic radius

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E execution under [B84][b84], configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and actual lead
settings are unavailable. I authored the E154 source review underlying
the frozen E154 assessment, and the separate E162 core topology proof.
I did not author B84, E160 or the lead assessment. E162 is outside
the present derivation. The [request][req] and all three frozen inputs
were verified. Digests are in the [return][ret].

## Claim and radius convention

Let \(g_i\) be smooth Riemannian metrics on a fixed closed connected
smooth oriented homotopy four-sphere \(M\), with pointwise
\(\lvert\operatorname{Ric}_{g_i}\rvert\le K\),
\(\lvert W^+_{g_i}\rvert\le K_+\), \(\operatorname{Vol}(M,g_i)\ge v>0\)
and \(\operatorname{diam}(M,g_i)\le D\). The \(+\) block refers to the
given orientation. Fix \(p>4\), \(m>1\), and \(\eta>0\). Use the
following scale-invariant \(W^{2,p}\) harmonic radius \(r_h(g,x)\).
An admissible radius \(r\) gives a smooth harmonic chart centered
at \(x\), on \(B_g(x,r)\), in which the matrix \(h=(g_{\mu\nu})\)
satisfies
\[
  m^{-1}I\le h\le mI,\qquad
  r^{1-4/p}\|Dh\|_{L^p}+r^{2-4/p}\|D^2h\|_{L^p}\le\eta .
  \tag{1}
\]
Use coordinate Lebesgue measure in (1) and take the supremum of
admissible radii. The argument also works with the comparable
Riemannian measure and separate fixed positive derivative
thresholds, by proving strict smallness of both derivatives in
the final test. Both powers in (1) are positive, so admissibility
passes to restriction. The radius is finite on the closed manifold
and its infimum is positive for each individual smooth metric.
Indeed, local smooth harmonic coordinates exist by the small-ball
Dirichlet construction for a smooth uniformly elliptic
Laplace–Beltrami operator. After an affine normalization at the
center, the inequalities hold strictly on a sufficiently small
ball and, by restriction and recentering, uniformly for centers
in a neighborhood. A finite cover gives the positive infimum.
This is the harmonic-coordinate radius convention of R29
(2.1)–(2.2) with the derivative thresholds specified in (1).
[R29, §2][r29].

Set \(r_i=\inf_M r_h(g_i,\cdot)\) and suppose \(r_i\to0\).
Take \(x_i\) with \(r_h(g_i,x_i)\le(1+i^{-1})r_i\), which
includes the choice of a minimizer when attained. Put
\(\bar g_i=r_i^{-2}g_i\). Rescaling the harmonic coordinates shows
\[
  r_h(\bar g_i,\cdot)\ge1,\qquad
  r_h(\bar g_i,x_i)\le 1+i^{-1},\qquad
  \lvert\operatorname{Ric}_{\bar g_i}\rvert\le Kr_i^2,\quad
  \lvert W^+_{\bar g_i}\rvert\le K_+r_i^2 .
  \tag{2}
\]
The powers of \(r_i\) in the tensor norm bounds are both two,
since the metric rescales by \(r_i^{-2}\). The Hodge star on
two-forms is invariant under positive constant rescaling.

**Result.** After a subsequence the pointed rescalings converge to
a connected complete smooth nonflat Ricci-flat ASD Riemannian
four-manifold \((N,h,x_\infty)\). There are smooth based
orientation-preserving comparison embeddings on open
neighborhoods of every fixed compact subset of \(N\).
On compacts their pulled-back metrics converge in strong
\(W^{2,p}\) and \(C^{1,\alpha}\) for every \(0<\alpha<1-4/p\).
There is a uniform \(c>0\) such that
\(\operatorname{Vol}_h B_h(y,t)\ge ct^4\) for every \(y\in N\)
and \(t>0\), and \(\int_N\lvert\operatorname{Rm}_h\rvert^2<\infty\).
The metric completeness and embeddings are established below.

## Packing and the pointed metric space

Write \(\mathcal V_\kappa(t)\) for the ball volume in the
simply connected four-dimensional model of sectional curvature
\(\kappa\), and \(\omega_4\) for the Euclidean unit ball volume.
Take \(D'>D\) and \(\kappa=K/3\). For any \(y\in M\) and
\(r_it\le D'\), Bishop–Gromov at radii \(r_it\) and \(D'\)
and \(\mathcal V_{-\kappa}(r_it)\ge\omega_4(r_it)^4\) give
\[
 \frac{v\omega_4}{\mathcal V_{-\kappa}(D')}\,t^4
 \ \le\ \operatorname{Vol}_{\bar g_i} B_{\bar g_i}(y,t)
 \ \le\ \mathcal V_{-\kappa r_i^2}(t).
 \tag{3}
\]
For the upper bound use the ratio at arbitrarily small radius in
the smooth rescaled metric. The original total volume is at most
\(\mathcal V_{-\kappa}(D')\). Thus for each fixed \(R,\delta>0\)
there is a uniform packing bound on \(B_{\bar g_i}(x_i,R)\)
by using disjoint balls of radius \(\delta/3\) at
\(\delta\)-separated centers and applying (3) in \(B(x_i,R+\delta)\).
This uses no injectivity-radius estimate.
[R29, (2.12)–(2.13)][r29].

For clarity, the packing argument gives pointed compactness directly.
For each integer \(j\), list a \(2^{-j}\)-net in the closed
rescaled ball of radius \(j\), with uniformly bounded cardinality
by (3) for large \(i\), and include the basepoint. Pad lists with
repeated points to have fixed sizes. Diagonalize all distances
between the countably many labels. Complete the limit of this
pseudometric after identifying zero-distance labels. Its bounded
balls are totally bounded: the \(2^{-j}\)-net in the approximants
approximates all labels at bounded limiting distance for sufficiently
large \(j\), by passing the finite minimum of their distances to
the \(j\)-list to the limit. This argument extends to the completion.
Thus the pointed metric limit \((N,d,x_\infty)\) is proper.
Matching the finite lists and their nearest-net points gives
pointed Gromov–Hausdorff approximation on bounded balls, with
arbitrarily small distance distortion and image-density error on
slightly smaller balls. One can choose such approximations on
radii tending to infinity with errors tending to zero, by a diagonal
choice. Approximate midpoints of pairs of points pass to actual
midpoints by properness, because the approximants are geodesic.
Choosing repeated midpoints and completing the dyadic path makes
\(N\) geodesic. We use these metric approximations to compare points
in different manifolds throughout the chart and embedding arguments.

## Harmonic charts, metric convergence and transitions

Choose a countable dense set \(q_a\) in \(N\), including \(x_\infty\).
Choose comparison points \(q_{i,a}\) using the pointed metric
approximations, with \(q_{i,\infty}=x_i\). By (2), each point
has a chart satisfying (1) on the intrinsic ball of radius \(a_0=1/2\).
Choose all charts positive for the given orientation. Their coordinate
images contain the Euclidean ball of radius \(a_0/\sqrt m\).
To see this, lift a radial segment of length less than \(a_0/\sqrt m\)
as long as it remains in the chart image. The lifted length is
less than \(a_0\), so any first exit in the coordinate ball would
limit to a point inside the intrinsic chart ball by completeness.
The chart extends the lift there.

Fix \(\rho>0\) with \(16\sqrt m\,\rho<a_0\). Let
\(\phi_{i,a}:B_{\mathbb R^4}(0,4\rho)\to M\) be the resulting
coordinate parameterizations, with \(h_{i,a}=\phi_{i,a}^*\bar g_i\).
They are uniformly bi-Lipschitz for the ambient rescaled distance.
The upper estimate comes from the straight coordinate segment.
A minimizing geodesic between two such chart points has length
at most \(8\sqrt m\,\rho\), and its initial point is within
\(4\sqrt m\,\rho\) of the center, so it stays in the full
intrinsic chart ball. Its coordinate displacement is at most
\(\sqrt m\) times its length, which gives the lower estimate.
Also, any point sufficiently close in ambient distance to
\(\phi_{i,a}(u)\) with \(u\) in a compact interior subball
has coordinates in a slightly larger interior subball, by the
same short-geodesic estimate. For example, for \(|u|\le b<B<4\rho\)
the radius \((B-b)/(2\sqrt m)\) works for the inclusion into
\(\phi_{i,a}(B_B)\).

On the fixed coordinate balls the matrices are uniformly
elliptic and bounded in \(W^{2,p}\). A diagonal extraction using
the metric approximations and compact local Sobolev embedding
gives, on interior subballs, limit parameterizations \(\phi_a\)
uniformly in metric distance and matrices \(h_a\) with weak
\(W^{2,p}\) and strong \(C^{1,\alpha}\) convergence. The
parameterizations can be obtained first at a countable dense
set of coordinate points and then everywhere by the Lipschitz
bound. The interior-ball inclusion just proved passes to the
limit by taking coordinate preimages on the slightly larger
closed subball. Hence the bi-Lipschitz \(\phi_a\) are open and
their images of \(B_{3\rho}\) cover \(N\), since the centers
are dense. The same inclusion gives persistent overlap on
any compact subset of a limit overlap, with uniform distance
from the relevant chart boundaries.

In each chart the harmonic-coordinate Ricci formula is
\[
 -\tfrac12 a_{i,a}^{jk}\partial_j\partial_k h_{i,a}
       +Q(h_{i,a},Dh_{i,a})
       =\operatorname{Ric}(h_{i,a}),\qquad a_{i,a}=h_{i,a}^{-1},
 \tag{4}
\]
with \(Q\) smooth in the positive matrix and quadratic in its
first derivatives. The right side tends to zero uniformly in
components by (2). The coefficients converge strongly in
\(C^{1,\alpha}\), so weak \(W^{2,p}\) convergence gives (4)
with zero right side for \(h_a\). This \(W^{2,p}\cap C^{1,\alpha}\)
solution has \(C^\alpha\) coefficients and right side when the
second-order part is put on the left. Interior Schauder
regularity gives \(C^{2,\alpha}\), and it iterates to smoothness.
For strong convergence let \(e_i=h_{i,a}-h_a\). The equation
for \(a_{i,a}^{jk}\partial_j\partial_k e_i\) has right side
\[
 2\bigl(Q(h_{i,a},Dh_{i,a})-Q(h_a,Dh_a)\bigr)
 -2\operatorname{Ric}(h_{i,a})
 -(a_{i,a}^{jk}-a_a^{jk})\,\partial_j\partial_k h_a .
 \tag{5}
\]
It tends to zero in \(L^p\) on interior subballs. The interior
\(W^{2,p}\) estimate with uniformly elliptic \(C^\alpha\)
coefficients bounds the smaller-ball norm of \(e_i\) by the
\(L^p\) norm of (5) and the larger-ball \(L^p\) norm of \(e_i\).
Both vanish. This uses only the rescaled Ricci bound and no
derivatives of Ricci. [R29, proof of Theorem 2.2, (2.9)][r29].

For two charts, on compact limit overlap neighborhoods the
coordinate transitions
\(\theta_{i,ab}=\phi_{i,b}^{-1}\phi_{i,a}\) are defined for
large \(i\) by the interior-ball property. They converge in
\(C^0\) to \(\theta_{ab}=\phi_b^{-1}\phi_a\) by the
bi-Lipschitz estimates and metric convergence. Each component
obeys \(a_{i,a}^{jk}\partial_{jk}\theta_{i,ab}=0\).
Interior \(W^{2,p}\) bounds and weak convergence give the
harmonic equation for the limit. Its coefficients are smooth
by (4), so \(\theta_{ab}\) is smooth. Applying the same
argument to reversed overlaps shows its inverse is smooth.
On interior compact subsets the difference \(u_i=\theta_{i,ab}
-\theta_{ab}\) satisfies
\[
 a_{i,a}^{jk}\partial_{jk}u_i
        =(a_a^{jk}-a_{i,a}^{jk})\partial_{jk}\theta_{ab}.
 \tag{6}
\]
Its right side tends to zero in \(W^{1,p}\) by \(C^1\)
convergence of the coefficients. Interior \(W^{2,p}\) gives
strong convergence of \(u_i\) two derivatives deep. Apply
the interior estimate to \(\partial_\ell u_i\) on a smaller
set, with the extra term
\(-(\partial_\ell a_{i,a}^{jk})\partial_{jk}u_i\) tending to
zero in \(L^p\). This gives strong local \(W^{3,p}\)
convergence, in particular \(C^2\). The limiting transitions
are orientation-preserving since the approximating transitions
are positive and the inverses are smooth. Passing the metric
transition identity gives the smooth metric \(h\) on \(N\).

The claimed metric \(h\) induces \(d\). For sufficiently
nearby coordinates in an interior chart ball, minimizing
paths for the rescaled ambient distance stay in a larger
interior chart ball, by the short-geodesic bound. The distances
there converge to the local Riemannian distances, since the
uniform convergence of the uniformly positive matrices bounds
the ratios of lengths of all curves in that larger ball.
The distance \(d\) therefore agrees locally with the length
metric of \(h\). It agrees globally since \(d\) is geodesic
and Riemannian lengths are local. Properness of \(d\) gives
completeness of \(h\).

## Smooth embeddings on compact regions

Here is a construction of the comparison maps from the charts.
Fix a compact set \(L\subset N\), and include \(x_\infty\)
in the compact region used for the construction. Cover a
precompact open neighborhood of this region by interiors of
finitely many of the charts just obtained. In those charts
choose smooth nonnegative cutoffs \(\zeta_a\) of compact support
in \(B_{3\rho}\), such that at least one is positive near
each point of the compact region. Put
\[
 I(y)=\bigl((\zeta_a,\zeta_a u_a)(\phi_a^{-1}(y))\bigr)_a ,
 \tag{7}
\]
where \(u_a\) is the Euclidean coordinate vector, and each block
is extended by zero outside its chart. Define \(I_i\) with
the same functions in the \(\phi_{i,a}\) charts. The map \(I\)
is a smooth embedding on the open set where a cutoff is positive.
Indeed a positive scalar block and its vector block recover
the corresponding coordinates by division, giving local
immersion and injectivity and a continuous local inverse on the
image. The same holds for \(I_i\). On any smaller chart
neighborhood of the region, the components of \(I_i\phi_{i,a}\)
converge to those of \(I\phi_a\) strongly in \(W^{3,p}\).
For each nonzero block use the transition convergence (6).
At points outside the limiting cutoff support the block
is eventually zero locally away from the closed support,
by uniform metric chart convergence. Near the boundary of
the support its whole neighborhood is still inside the chart
on which the smooth cutoff is zero outside its support. These
two observations cover every compact set of the chart.

Take a smooth tubular projection \(\pi_{\mathrm{tub}}\) onto
the image of \(I\) over a neighborhood of the compact region.
It can be restricted to a smaller open neighborhood of that
image with projection landing where some cutoff is positive.
This is the ordinary tubular projection of the smooth embedded
submanifold near a compact subset. In the approximating charts
near this region the smooth maps
\[
        P_i= I^{-1}\pi_{\mathrm{tub}} I_i
 \tag{8}
\]
are defined for large \(i\) and converge in their local coordinates
to the identity in \(W^{3,p}\) and \(C^2\). Composition here
is with fixed smooth maps on compact sets, for which the product
and chain rules give the \(W^{3,p}\) convergence since \(p>4\).
To invert (8), use nested coordinate balls with compact closure,
an inner ball covering a piece of the compact region and
an outer one on which the derivative of
\(\phi_a^{-1}P_i\phi_{i,a}\) is uniformly close to the identity.
The coordinate map is injective on the outer ball by the
derivative bound on straight segments. Its range contains the
inner ball for large \(i\): one solves \(u+(f_i(u)-u)=v\)
for \(v\) in the inner ball by contraction on a closed ball
around \(v\) contained in the outer ball, using \(\|f_i-\mathrm{id}\|_{C^0}\to0\)
and \(\|Df_i-I\|_{C^0}\to0\).

These inverse branches agree on their common domain. Both
candidate preimages converge in the metric approximations to
the same point of the compact region, uniformly on their
respective inner subballs. Choose finitely many nested
coordinate balls covering the region with strict chart margins.
For a point of overlap pick one of these balls whose inner
part contains the point. Both candidate preimages are then
inside its larger approximating coordinate ball for all large
\(i\), by the uniform interior-ball inclusion and convergence.
Injectivity of \(P_i\) there gives equality. Thus the branches
define a single smooth map \(F_i\) on an open neighborhood
of \(L\), and \(P_iF_i=\mathrm{id}\) makes it a smooth
embedding. In coordinates the inverse branches converge in
\(W^{3,p}\) and \(C^2\), by differentiating the inverse
identity up to order three and changing variables with
uniformly bounded inverse Jacobians. Consequently
\(F_i^*\bar g_i\to h\) strongly in \(W^{2,p}\) on compacts.
In the coordinate pullback formula one uses the uniform
\(W^{3,p}\) and \(C^2\) control of the comparison maps and
the \(W^{2,p}\) convergence of \(h_{i,a}\). In particular
composition of \(h_{i,a}-h_a\) with these maps tends to zero
in \(W^{2,p}\) by the chain rule and bounded Jacobians,
while composition of the smooth \(h_a\) converges by the
same formulas. The Jacobian factors in the tensor pullback
are controlled in the algebra \(W^{2,p}\).
The embeddings preserve orientation by their positive local
Jacobians in the chosen charts.

The maps can be made exactly based. At \(x_i\), (8) gives
a point tending to \(x_\infty\). In a fixed local chart
centered at \(x_\infty\), use a compactly supported coordinate
translation that sends \(x_\infty\) to \(P_i(x_i)\) and
tends to the identity smoothly. Compose \(F_i\) with this
domain diffeomorphism. The already constructed local inverse
at \(P_i(x_i)\) is \(x_i\) by injectivity in the basepoint
chart. All metric convergence and metric-approximation
properties are preserved by this adjustment.

For later use, if the construction covers a compact
neighborhood of \(\overline B_h(y,t+1)\), then for every
fixed \(0<\varepsilon<\min(t,1)\) and all large \(i\),
\[
 B_{\bar g_i}(F_i(y),t-\varepsilon)
 \subset F_i(B_h(y,t))
 \subset B_{\bar g_i}(F_i(y),t+\varepsilon).
 \tag{9}
\]
The outer inclusion follows from uniform comparison of \(F_i\)
with the metric approximations. For the inner one, any
approximating point in the smaller ball is metrically close to
a limit point in \(B_h(y,t-\varepsilon/2)\), uniformly as
\(i\) grows. A finite chart cover with interior margins puts
that approximating point in one of the local domains of \(P_i\).
Its image under \(P_i\) is uniformly close to the limit point,
so belongs to \(B_h(y,t)\). The inverse branch there returns
the original approximating point by local injectivity. After
the based adjustment the same proof uses the near-identity
translated domain point. For any fixed compact \(L\) the maps
are obtained on the single chart subsequence already chosen.
If desired, an exhaustion by compact metric balls and a
diagonal choice of sufficiently late indices yield embeddings
on domains exhausting \(N\); no compatibility of maps for
different initial indices is needed.

## Volume, curvature and nonflatness

Since \(F_i^*\bar g_i\to h\) uniformly in charts, volume
converges on fixed precompact measurable regions under the
comparison maps. Applying (9) for \(t-\varepsilon\) and
\(t+\varepsilon\), or enclosing \(F_i(B_h(y,t\pm\varepsilon))\)
about the corresponding radius-\(t\) intrinsic ball, gives
convergence of the rescaled ball volumes. Every distance
sphere has zero four-dimensional volume: its points lie
in the image under the smooth exponential map of the
corresponding tangent three-sphere, by completeness. Thus
the enclosing volumes converge as \(\varepsilon\downarrow0\).
Equation (3) gives
\[
 \frac{v\omega_4}{\mathcal V_{-\kappa}(D')}\,t^4
 \le \operatorname{Vol}_{h} B_h(y,t)
 \le\omega_4 t^4
 \quad (y\in N,\ t>0).
 \tag{10}
\]
In particular \(N\) is noncompact.

For the curvature energy use the full \((0,4)\)-tensor norm.
Chern–Gauss–Bonnet for a closed oriented four-manifold gives
\[
 32\pi^2\chi(M)=\int_M
     \bigl(\lvert\operatorname{Rm}_{g_i}\rvert^2
       -4\lvert\operatorname{Ric}_{g_i}\rvert^2
       +\operatorname{Scal}_{g_i}^{\,2}\bigr)\,dV_{g_i}.
 \tag{11}
\]
This convention gives \(32\pi^2\chi(M)+
4K^2\mathcal V_{-\kappa}(D')\) as an upper bound on
\(\int_M\lvert\operatorname{Rm}_{g_i}\rvert^2\).
The same bound holds for each \(\bar g_i\) by scale invariance.
On compact domains the curvature of the pullback metrics
converges strongly in \(L^p\), hence \(L^2\), by the coordinate
expression from \(W^{2,p}\) and \(C^1\) convergence. Smooth
orientation and positive metric convergence give the same
for \(W^+\), so (2) proves \(\operatorname{Ric}_h=W_h^+=0\).
Each compact-domain energy is bounded by (11) via the
embedding. Monotone exhaustion yields finite energy on \(N\).

Suppose \(h\) is flat. The universal cover of a complete flat
manifold is Euclidean by the complete simply connected flat
case of Cartan–Hadamard. If there is a nontrivial deck isometry
\(\gamma(x)=Ax+b\), its translation component along
\(\ker(I-A)\) is nonzero. Otherwise \(b\) is in the range
of \(I-A\) and \(\gamma\) has a fixed point, contrary to a
free deck action. Translate the origin to remove the
orthogonal component of \(b\). Along a unit direction \(e\)
of the remaining nonzero translation, \(\gamma\) now acts
by \(s\mapsto s+\ell\), \(\ell>0\), and orthogonally on
\(e^\perp\). The cyclic quotient by \(\langle\gamma\rangle\)
has the fundamental slab \(0\le s<\ell\). The distance of
the transverse coordinate to the axis is an invariant
1-Lipschitz function that vanishes at the origin. A radius
\(t\) ball about the image of the origin is therefore
contained, up to the slab identification, in
\([0,\ell)\times B_{\mathbb R^3}(0,t)\). Its volume is at
most \(\ell\omega_3t^3\), where \(\omega_3\) is the
Euclidean three-dimensional unit ball volume. This cyclic
quotient covers \(N\) by a local isometry. The ball in \(N\)
is the image of the corresponding ball in the cover by lifting
minimizing paths. Its volume is at most the volume upstairs.
This contradicts (10) as \(t\to\infty\). Thus a flat limit
must be \(\mathbb R^4\) with its Euclidean metric.

To exclude that limit, use the based comparison embeddings
on a neighborhood of \(\overline B_{\mathbb R^4}(0,5)\).
Write \(k_i=F_i^*\bar g_i\), so \(k_i\to I\) strongly in
\(W^{2,p}\) on \(\overline B(0,4)\). In these coordinates
\(\Delta_{k_i}=A_i^{jk}\partial_{jk}+b_i^j\partial_j\),
where \(A_i=k_i^{-1}\to I\) in \(W^{2,p}\) and
\(b_i^\ell=-A_i^{jk}\Gamma^\ell_{jk}(k_i)\to0\) in
\(W^{1,p}\). Solve the \(k_i\)-harmonic Dirichlet problem
on \(B(0,4)\) with boundary values the Euclidean coordinate
functions \(x^\mu\). Writing each solution as \(x^\mu+w_i^\mu\),
the equation is
\[
 \Delta w_i^\mu
  =(\delta^{jk}-A_i^{jk})\partial_{jk} w_i^\mu
      -b_i^j\partial_j w_i^\mu-b_i^\mu,\qquad
    w_i^\mu|_{\partial B(0,4)}=0 .
 \tag{12}
\]
The Euclidean Dirichlet inverse is bounded
\(L^p\to W^{2,p}\cap W^{1,p}_0\) on the ball.
The \(C^0\) smallness of \(A_i-I,b_i\) makes the terms
linear in \(w_i\) a contraction in that space for large
\(i\). Thus \(w_i\to0\) in \(W^{2,p}\), and the solution
is smooth in the interior by elliptic regularity for each
smooth \(k_i\). Differentiating
\(\Delta_{k_i}w_i^\mu=-b_i^\mu\) once, the inhomogeneous
terms for \(\partial_\ell w_i^\mu\) are
\(-\partial_\ell b_i^\mu\),
\(-(\partial_\ell A_i^{jk})\partial_{jk}w_i^\mu\) and
\(-(\partial_\ell b_i^j)\partial_jw_i^\mu\).
They tend to zero in \(L^p\) using the uniform \(C^1\)
bound on \(A_i\), the \(W^{1,p}\) bound on \(b_i\) and
Sobolev embedding for \(w_i^\mu\). An interior estimate
then gives \(w_i\to0\) in \(W^{3,p}(B(0,3))\).

The vector map \(x+w_i(x)\) is a smooth diffeomorphism
onto its image on \(B(0,3)\) by the derivative estimate
and convexity. In these harmonic coordinates the components
of \(k_i\) tend to \(I\) in \(W^{2,p}\) and \(C^0\) on
the corresponding image domains, using the inverse map
and the same coordinate change estimates as after (8).
Translation of the coordinates centers them at \(x_i\).
By (9), \(F_i(B(0,3))\) contains
\(B_{\bar g_i}(x_i,2)\) for large \(i\). Restriction to
that intrinsic ball gives the strict distortion and
derivative inequalities of (1) at radius \(2\), since
the radius factors are fixed and the harmonic metric
components converge to the constant matrix. This contradicts
the upper bound in (2). It proves nonflatness without a
harmonic-radius semicontinuity theorem.

## Source use and scope

Reopened Michael T. Anderson, *Cheeger–Gromov theory and
applications to general relativity*, R29 undated author-hosted
PDF, by the legible indexed primary text on 22 November 2026.
Selected passages are Definition 1.1 (printed p. 2), harmonic
radius (2.1)–(2.2) (p. 5), Theorem 2.2 and (2.3)–(2.9)
(pp. 5–7), and volume comparison (2.12)–(2.13) (p. 8).
In its proof the injectivity premise gives the arbitrarily long
minimizing lines via (2.8). Here the global radius bound after
rescaling and (3) supply the chart and packing inputs instead.
The flat case is excluded by (10) and (12). The text's (2.7)
prints a single power of \(r_h\) in the bound tending to zero.
Equation (2) uses the direct constant-rescaling computation
with power two. The author-index publication crosswalk and
fresh-PDF parsing limitations remain as recorded by E154.
The E165 proof uses R29 as a method and for the specified
coordinate and volume comparison formulas. It does not import
the precompactness theorem with a deleted hypothesis. No other
primary work opened, zero discovery queries, no retained copy.
[Author PDF][r29] · [Canonical R29][r29record] · [E154 assessment][e154a].

This is a pre-ALE result. The embeddings are smooth and the
metric convergence asserted here is strong \(W^{2,p}\) and
\(C^{1,\alpha}\) on compacts in the indicated range. The
limit metric itself is smooth. ALE asymptotics, a combined
contradiction to a sequence of degenerating metrics, and any
flow improvement are separate dependencies under B84.
[B84][b84] · [E160][e160].

[req]: ../research-progress/handoffs/SP4-CME-E165_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E165_RETURN_v1.md
[b84]: ../brainstorm/notes/B84_MINIMUM_HARMONIC_RADIUS_ALTERNATIVE_20261122.md
[e160]: ../reviews/E160_FOUR_DIMENSIONAL_NONCOLLAPSE_SOURCE_TEST_20261122.md
[e154a]: ../reviews/E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md
[r29]: https://www.math.stonybrook.edu/~anderson/cargese.pdf
[r29record]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r29--anderson-author-survey-discovery
