# E167 Independent minimum harmonic-radius extraction audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Bounded E audit under B84. Configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I authored the inherited E163 and E164 source audits and
did not author E165, B84 or E154. This audit is of the frozen E165
construction. All four frozen inputs and the request match their digests.

## Disposition

Pass at the stated pre-ALE boundary. The argument extracts a complete
smooth nonflat Ricci-flat ASD four-manifold of positive Euclidean volume
growth and finite full-curvature energy. It constructs smooth based,
orientation-preserving comparison embeddings of neighborhoods of fixed
compact sets, with strong \(W^{2,p}\) and \(C^{1,\alpha}\) convergence
for \(0<\alpha<1-4/p\). I found no missing compactness or
injectivity-radius hypothesis. The verifications below make the uniform
chart margins and embedding inverse arguments explicit.
[E165](../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md).

## Radius, chart margins and pointed compactness

For an individual smooth metric, normalize the metric at the center
of a smooth harmonic chart by an affine map. The distortion inequalities
are strict on a small closed subball and the derivative integrals
tend to zero on shrinking balls. A still smaller common ball is
admissible for all nearby centers by translation and restriction.
Compactness then yields a positive infimum. Radii exceeding the
diameter would require a single chart on the whole closed manifold,
so the supremum is finite. Restriction of an admissible larger radius
decreases the two weights \(r^{j-4/p}\), \(j=1,2\), as well as the
\(L^p\) domains. Thus every radius strictly below the supremum is
admissible even when the supremum is unattained.

If \(u\) is a \(g_i\)-harmonic coordinate map then \(z=u/r_i\) is
\(\bar g_i\)-harmonic. In the scaled coordinates
\(\bar h(z)=h(r_i z)\) and
\(\|D^j\bar h\|_{L^p}=r_i^{j-4/p}\|D^jh\|_{L^p}\), which cancels
the factor from replacing \(r\) by \(r/r_i\). So the infimum-one
and near-minimal upper bounds in E165 (2) follow with no attainment
premise. The Ricci and \(W^+\) tensor norms each scale by \(r_i^2\).
The Hodge decomposition is unchanged under constant metric scaling
and the positive block uses the given orientation. E165 uses the same
scale-invariant harmonic-coordinate setup while imposing its explicit
two-derivative, coordinate-measure criterion (1). R29 (2.2) displays
the order-\(k\) seminorm using metric measure.
[Anderson, author text, Definition 2.1](https://www.math.stonybrook.edu/~anderson/cargese.pdf).

Taking \(D'>D\) puts the whole base in each radius-\(D'\) ball.
Bishop–Gromov at \(D'\) and \(r_i t\) gives the lower bound in
(3) for \(r_i t\le D'\), and comparison from zero gives the upper
bound. The radius condition holds eventually for each fixed \(t\).
For \(\delta\)-separated centers in a fixed radius-\(R\) ball, their
disjoint \(\delta/3\) balls fit in a radius-\(R+\delta\) ball.
Both volume bounds apply with constants uniform in the center.
For the diagonal metric construction, any countable label at limit
distance \(\le R\) lies in the approximating radius-\(j\) ball
eventually when \(j>R+1\), and is within \(2^{-j}\) of its \(j\)-net
there. Minima over each finite list commute with the distance
limits. This gives total boundedness of all bounded sets in the
completion. Matching finite nets with \(j>R+1\) gives both distance
distortion tending to zero and density on the buffered ball.
In particular points at bounded distance have comparison points
in both directions. The complete proper limit is geodesic:
approximate midpoints obtained from the approximating length
spaces have subsequential limits by properness, and exact
midpoints generate a constant-speed geodesic by dyadic subdivision.
This supplies connectedness and pointed metric compactness from
packing. [Anderson, author text, (2.12)–(2.13)](https://www.math.stonybrook.edu/~anderson/cargese.pdf).

In the full radius-\(a_0\) chart, a radial segment of Euclidean
length \(<a_0/\sqrt m\) has lifted length \(<a_0\). A first exit
would therefore converge to an interior point of the full chart
ball, contradicting its being a first exit. For
\(u,v\in B_{4\rho}\), the straight coordinate segment gives
\(d_i(\phi_i u,\phi_i v)\le\sqrt m\,|u-v|\). A minimizing geodesic
has length at most \(8\sqrt m\,\rho\) and starts within
\(4\sqrt m\,\rho\) of the center. It stays in the full chart
since \(12\sqrt m\,\rho<a_0\). Its coordinate displacement
gives \(d_i(\phi_i u,\phi_i v)\ge |u-v|/\sqrt m\).
For \(|u|\le b<B<4\rho\), paths of ambient length
\(<(B-b)/(2\sqrt m)\) from \(\phi_i(u)\) stay in the full
chart and their coordinate displacement is \(<(B-b)/2\).
The resulting \((b+B)/2\) bound leaves a closed coordinate
subball strictly inside \(B_B\). This is a uniform inclusion
of a surrounding intrinsic ball in the smaller coordinate image.

## Atlas, curvature equation and completeness

On the extracted subsequence the dense coordinate labels and the
bi-Lipschitz bounds extend each limit chart to a bi-Lipschitz
parameterization. For the above intrinsic-ball inclusion, choose
approximating points for an arbitrary limit point inside the
strict distance margin, find their coordinates using that
inclusion, and take a convergent subsequence in the closed
subball. This gives neighborhood surjectivity and hence openness
of each limit chart. The inclusion at the chart centers is
uniform in the center, so density supplies the cover. For
a compact part of a limit overlap, the inverse image in either
chart sits in a smaller coordinate subball. Uniform convergence
of the two parameterizations and the same inclusion place all
nearby approximate points in the required image with uniform
margin. Given \(\theta_{ab}=\phi_b^{-1}\phi_a\), the point
\(\phi_{i,b}(\theta_{ab}(u))\) is uniformly close to
\(\phi_{i,a}(u)\) in the approximating metrics on that compact
set. The lower bi-Lipschitz estimate bounds the corresponding
error in \(\theta_{i,ab}(u)\). This gives the stated local
uniform convergence and supplies fixed interior domains for
the transition PDE.

Uniform \(W^{2,p}\) bounds and compact Morrey embedding yield
weak \(W^{2,p}\) and strong \(C^{1,\alpha}\) chart limits.
In (4), \(a_i=h_i^{-1}\) converges uniformly and \(D^2h_i\)
converges weakly, so their product converges weakly in \(L^p\).
The quadratic first-derivative term converges uniformly. The
Ricci components are bounded by \(C(m)Kr_i^2\), so the limiting
equation has zero Ricci right side. With \(C^{1,\alpha}\)
coefficients and \(C^\alpha\) inhomogeneity, Schauder regularity
for this strong \(W^{2,p}\) solution gives \(C^{2,\alpha}\)
on smaller balls and bootstrap gives smoothness. For (5),
uniform ellipticity and a common coefficient \(C^\alpha\)
bound make the interior \(W^{2,p}\) estimate uniform.
Its source terms converge to zero in \(L^p\) on every fixed
interior ball, as does the \(L^p\) norm of the difference.
This proves the asserted strong convergence.
[Anderson, author text, (2.9)](https://www.math.stonybrook.edu/~anderson/cargese.pdf).

The components of each transition are harmonic with respect to
the source metric, whose first-order coordinate Laplace term is
zero. Their uniform bounds and the interior equation first
give weak \(W^{2,p}\), and the limit solves the equation with
smooth coefficients. The two limiting transitions are mutually
inverse because the limit charts are injective. To check the
third derivative in (6), differentiate the difference equation
on a smaller overlap. The right side is the derivative of
\((a-a_i)D^2\theta\) minus \((Da_i)D^2(\theta_i-\theta)\).
The former tends to zero in \(L^p\) by coefficient \(C^1\)
convergence and the latter by the already proved \(W^{2,p}\)
difference estimate. The interior \(W^{2,p}\) bound on the
differentiated difference yields \(W^{3,p}\) convergence on
compact subdomains. In particular convergence in \(C^1\) and
nonvanishing determinant of the limiting transition preserve
orientation. The tensor compatibility follows by passing the
metric transformations on the overlap.

For sufficiently close points the minimizing approximating
geodesics stay in a slightly larger interior chart by the
strict distance margin. Uniform positive metric convergence
controls the length of every curve there in both directions
and identifies the limiting local ambient distance with the
chart length metric. A \(d\)-geodesic in the proper limit can
be partitioned into such coordinate neighborhoods and replaced
there by short curves of the same length up to arbitrary
error. Conversely each Riemannian curve has the same length
as a curve in \(d\) by the same local equality. Hence \(d=d_h\)
globally and properness gives completeness.

## Smooth comparison embeddings and metric-ball coverage

Choose nested precompact neighborhoods of the fixed compact
set and the basepoint, covered by finitely many interiors of
the limit charts. Choose the compactly supported cutoffs in
(7) positive in union on a neighborhood of the larger compact
region. A positive scalar block recovers its chart point from
the ratio with the vector block. This proves injectivity among
all points with a positive block, immersion by differentiating
coordinate recovery, and continuity of the inverse locally
on the image by the same fixed block. Each \(I_i\) has the
same behavior. Zero extensions are smooth since every cutoff
support lies compactly in its chart.

On a smaller fixed chart neighborhood, a block is analyzed
either on a strict interior overlap containing its support
or on an open set separated from that compact support.
On the overlap the strong \(W^{3,p}\) transition estimate
and smooth cutoff composition give \(W^{3,p}\) block
convergence. Away from the support the block vanishes
eventually on a smaller closed region, since the
approximating image of the support converges uniformly
in metric distance and stays a definite distance away.
This also covers the boundary of the support via the
overlap case. Finite covers give convergence on every
required compact coordinate neighborhood.

A tubular projection can be chosen on an ambient open
neighborhood of \(I\) of the compact region with its image
in the larger embedded neighborhood. The image of the
compact region is separated from the image of the
complement of the larger neighborhood near the embedded
submanifold, by the embedding inverse property. The
tubular projection and \(I^{-1}\) are smooth there. Uniform
\(C^0\) closeness places the corresponding compact
approximating chart images in its domain, and strictly
inner chart balls keep the projected points in the same
limit chart. In those chart coordinates
\(f_{i,a}=\phi_a^{-1}P_i\phi_{i,a}\) tends to the identity
in \(W^{3,p}\) and \(C^2\) on the larger of the nested
coordinate balls by the composition rule for fixed smooth
maps. When \(\|Df_{i,a}-I\|_\infty<1/2\), integration along
a straight segment gives injectivity on each larger ball.
For any target in the corresponding smaller ball, the
fixed gap to its boundary lets the map
\(u\mapsto v-(f_{i,a}(u)-u)\) be a contraction of a closed
subball about \(v\) into itself. This constructs the
smooth inverse branch there.

To compare inverse branches, cover the compact region by
finitely many such smaller balls with larger concentric
balls of strictly greater radii. Both candidate preimages
are uniformly metrically close to the common target as a
limit point. The chart image inclusion puts **both** in the
larger approximating ball of a chart whose smaller ball
contains that target, with a margin independent of the
target by finiteness. They have the same \(P_i\)-image,
hence the local injectivity just proved makes them equal.
The glued map satisfies \(P_iF_i=\mathrm{id}\), so it is
globally injective on its open domain, with smooth local
inverses. Coordinate Jacobians are positive in the
chosen oriented charts. For the based adjustment the
tubular projection is defined at \(x_i\) by the basepoint
chart inclusion. Its image \(P_i(x_i)\) tends to \(x_\infty\).
The compactly supported coordinate translation \(T_i\)
is smoothly close to the identity and sends \(x_\infty\)
to that image. On smaller fixed domain neighborhoods,
\(F_iT_i\) sends \(x_\infty\) to \(x_i\) by the same local
injectivity.

For inversion in coordinates, \(g_i=f_i^{-1}\) has
\(Dg_i=(Df_i\circ g_i)^{-1}\), and \(D^2g_i\) is bounded
and tends to zero from the differentiated identity.
The equation for \(D^3g_i\) contains
\((D^3f_i\circ g_i)(Dg_i)^3\) and terms of the form
\((D^2f_i\circ g_i)D^2g_iDg_i\), all multiplied by bounded
inverse matrices. The Jacobian bounds and \(W^{3,p}\)
convergence of \(f_i\) prove strong \(W^{3,p}\) convergence
of \(g_i\) to the identity. For \(e_i=h_{i,a}-h_a\),
the second derivative of \(e_i\circ g_i\) consists of the
\(D^2e_i\) term composed with \(g_i\) times two first
derivatives and the \(De_i\) term times a second
derivative. The same bounds give \(W^{2,p}\) smallness,
and composition of the smooth \(h_a\) gives convergence.
The \(W^{2,p}\) algebra property controls the first
derivative factors of the pullback. Thus the gluing
preserves the desired metric regularity without assuming
higher derivatives of the source metrics.

For coverage in (9), fix \(t,\varepsilon\) and construct on
a neighborhood of the compact radius-\(t+1\) ball. Every
approximating point in the radius-\(t-\varepsilon\) ball
about \(F_i(y)\) has a limit comparison point in the
radius-\(t-\varepsilon/2\) ball for large \(i\). The finite
chart margin puts that approximating point in a larger
inverse-branch chart. Its \(P_i\)-image is close to the
comparison point and lies in the corresponding branch
domain, by choosing the branch cover with a smaller
buffered tier inside its domain. Local injectivity
returns the given approximating point under \(F_i\).
After basing, its domain preimage is \(T_i^{-1}P_i\)
of that point, still in the radius-\(t\) ball. The outer
inclusion follows from the uniform metric distortion
and near-identity basing. The finite chart construction
uses the already chosen subsequence. It applies to
each fixed compact and supplies maps for an exhaustion
by increasing the index cutoffs.

## Volume, energy and exclusion of a flat limit

Metric determinant convergence gives volume convergence
on fixed precompact regions. The ball inclusions sandwich
approximating ball volumes between volumes of the fixed
radius-\(t\pm\varepsilon\) domain balls up to errors tending
to zero. Distance spheres have zero four-dimensional
measure because completeness gives minimizing geodesics
and the exponential image of a tangent three-sphere has
zero four-dimensional measure. Sending \(\varepsilon\)
to zero proves (10) for every fixed center and radius
with the same lower constant, and forces noncompactness.

For the full \((0,4)\) norm, the Gauss–Bonnet density in
(11) is normalized by \(32\pi^2\). Using the uniform
Ricci-square integral and the uniform upper total volume
bounds the full energy. Under \(r_i^{-2}g_i\) the square
of the curvature norm gains \(r_i^4\) and the volume
element loses \(r_i^4\). On compact subdomains the metric
\(W^{2,p}\) convergence gives strong \(L^p\) curvature
convergence through its second-derivative and quadratic
first-derivative expression. Uniform orientation and
metric convergence also pass \(W^+\) to the limit.
Therefore \(W_h^+=0=\operatorname{Ric}_h\). Injectivity
of the compact maps bounds each compact curvature
integral by the original energy bound. Exhaustion gives
the asserted finite total energy.

If \(h\) is flat, completeness identifies its universal
Riemannian cover with Euclidean space. For a nonidentity
deck isometry \(Ax+b\), freeness forces the projection
of \(b\) to \(\ker(I-A)\) to be nonzero, since
\(\operatorname{im}(I-A)=\ker(I-A)^\perp\) for orthogonal
\(A\). A change of origin eliminates the other projection.
The cyclic quotient thus has a fundamental slab of
width \(\ell>0\) in a fixed translation direction. It
preserves the norm in the three perpendicular coordinates.
That norm is \(1\)-Lipschitz and zero at the chosen
origin, so the radius-\(t\) ball upstairs occupies at
most \(\ell\omega_3t^3\) volume in the slab. The cyclic
quotient covers \(N\) by a local isometry even if its
subgroup is nonnormal. Lifting each minimizing path
from the projected basepoint puts the radius-\(t\)
ball of \(N\) in the image of the corresponding upstairs
ball. Its volume is bounded by the upstairs volume.
This contradicts (10) for large \(t\). The flat case
is thus Euclidean.

In that case the based maps give \(k_i\to I\) in
\(W^{2,p}\) on the radius-4 closed ball inside the
larger comparison domain. Its positive inverse \(A_i\)
converges in \(W^{2,p}\), and the drift \(b_i\)
converges to zero in \(W^{1,p}\) and \(C^0\).
The Euclidean Dirichlet \(W^{2,p}\) inverse absorbs
the operator difference in (12) by the small
\(C^0\) coefficient and drift bounds. Its solution
\(w_i\) converges to zero in \(W^{2,p}\). In the
first derivative equation, \(Db_i\) times \(Dw_i\)
is small in \(L^p\), \(DA_i\) times \(D^2w_i\) is
small by the \(C^0\) bound on \(DA_i\), and the
remaining \(Db_i\) source is small in \(L^p\).
The uniform interior estimate therefore yields
\(W^{3,p}\) smallness on the radius-3 ball. Uniform
closeness of the derivative to identity on this
convex ball makes \(x+w_i\) a diffeomorphism onto its
image. Inverses and tensor pullback obey the preceding
change-of-coordinates estimates. For their varying
image domains the required \(L^p\) bounds follow by
changing variables back onto the fixed coordinate
ball with uniformly bounded Jacobians.

By (9) the image of the radius-3 ball contains the
full intrinsic radius-2 ball about \(x_i\). The
new chart restricts there, is centered by translation,
and has distortion strictly within the prescribed
\(m\) bounds and derivative terms in (1) tending to
zero with the fixed radius factors. This directly
gives \(r_h(\bar g_i,x_i)\ge2\), contradicting
\(r_h(\bar g_i,x_i)\le1+i^{-1}\).

## Source scope and audit boundary

I reopened the legible indexed text of the inherited undated R29
author PDF, Definition 2.1, Theorem 2.2 and (2.5)–(2.9),
and Bishop–Gromov (2.12)–(2.13), printed pp. 5–8. The
fresh parser did not locate these phrases; the existing
indexed author text did. No new primary work or search
query was used. Theorem 2.2 retains injectivity in (2.3),
uses it for the long minimizing geodesics in (2.8), and
refers to continuity of harmonic radius for its distinct
contradiction. E165 derives the necessary pointed compactness
and embeddings from the global normalized harmonic radius,
packing, and chart equations. Its flat-limit contradiction
constructs the admissible chart directly. The argument here
finishes at positive-growth finite-energy pre-ALE extraction.
[Anderson, author text](https://www.math.stonybrook.edu/~anderson/cargese.pdf).

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E167 request v1](../research-progress/handoffs/SP4-CME-E167_REQUEST_v1.md) | 0e68d21684de3fb9cf9e6cca5e11bf557c863dac2eda6790011f2ec9610b9194 |
| [E165](../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md) | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |
| [B84](../brainstorm/notes/B84_MINIMUM_HARMONIC_RADIUS_ALTERNATIVE_20261122.md) | b76959efa4ed2f4f6207a9b6b897f0f52b286adc735d2a0569a9c54ce02f13b6 |
| [E154 assessment](E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md) | ea4b36e70a665ade7fa143e97be1f3f2238db7657591f729b22b27802e4594ec |
| [E163](E163_TERMINAL_ALE_EXTRACTION_SOURCE_TEST_20261122.md) | fd599325e0e154f1feea7c392aafd2eaeaf7feb8282711d5df129e84b625e9c8 |
