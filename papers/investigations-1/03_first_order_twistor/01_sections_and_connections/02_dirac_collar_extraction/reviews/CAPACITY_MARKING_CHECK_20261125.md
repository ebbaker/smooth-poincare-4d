# Independent check of EXTRACT-E16

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Independent bounded derivation under the
[revision 1 request](../research-progress/handoffs/E16_THIRD_REQUEST_20261125.md)
at `7db310a2`. GPT-6.2 Sol/ultra requested for the check. Exact serving
model and reasoning effort are unavailable. Reviewed the initial
spectral-gap test and the subsequent proposed power-law test.

## Capacity and probability at the normalized scale

Let \(g_i\) be the physical smooth volume-one positive Yamabe
metrics on the fixed oriented smooth homotopy four-sphere, with
\(\mu_i=dV_{g_i}\) and \(s_{g_i}=Y_i\ge Y_0>0\).
In the stated Hilbert–Schmidt chiral band one can use
\(Y_0=\sqrt{48\delta}\). Let \(h_i\) be any smooth conformal
representative with \(\operatorname{Ric}_{h_i}\ge0\).
The strict band and positive Yamabe sign give the positive Ricci
representative by the positive total \(\sigma_2\) criterion.
[NECK-E14](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md#existence-and-normalization)
· [Chang–Gursky–Yang, Theorem A and Corollary B](https://arxiv.org/pdf/math/0409583#page=4)

Use an \(h_i\)-distance logarithmic cutoff on \(r<d_{h_i}(x,\cdot)<R\),
with length \(L=\log(R/r)\), equal to one inside and zero outside.
Bishop comparison gives the almost-everywhere radial area upper
bound \(2\pi^2\rho^3\). Integration against \(L^{-4}\rho^{-4}\)
gives \(\int|d\chi|_{h_i}^4dV_{h_i}\le2\pi^2 L^{-3}\).
The quartic integral is invariant under smooth conformal changes
in dimension four, and the cutoff is admissible by Lipschitz
approximation. The same estimate holds for the reversed cutoff.
[Wei, Theorem 4.1](https://web.math.ucsb.edu/~wei/paper/06survey.pdf#page=5)

The second variation of the physical Yamabe quotient along
\(1+t f\), \(\int f\,d\mu_i=0\), gives
\(6\int|df|^2d\mu_i\ge2Y_i\int f^2d\mu_i\).
Thus the first positive Laplacian eigenvalue is at least \(Y_i/3\).
For inner and outer masses \(a,b\), the variance of \(\chi\)
is at least \(\min_c[a(1-c)^2+bc^2]=ab/(a+b)\) for \(a+b>0\).
Hölder bounds its Dirichlet energy by
\(\sqrt{2\pi^2}L^{-3/2}\sqrt{\mu_i(T)}\), with \(T\) the
transition annulus. This verifies the logarithmic estimate.

For the stronger test, the original Yamabe inequality and Hölder
give for any cutoff with nonzero set of mass at most \(1/2\)
\[
 Y_0(1-1/\sqrt2)\|\chi\|_{4,g_i}^2
 \le 6\int |d\chi|_{g_i}^2d\mu_i .
\]
For the logarithmic cutoff or its reversal, squaring yields
\[
 \mu_i(\{\chi=1\})\le C L^{-3}\mu_i(T),\qquad
 C=\frac{72\pi^2}{Y_0^2(1-1/\sqrt2)^2}.                         \tag{1}
\]

Let \(a_i\) be the least \(h_i\)-radius of a ball with physical
mass \(1/2\), choose a minimizing center \(x_i\), and set
\(\bar h_i=a_i^{-2}h_i\). The radius is positive and attained.
For each fixed \(i\) the mass is continuous in center and radius
since distance spheres have zero smooth volume. Compactness of
\(M\) gives attainment and continuity rules out a radius-\(a_i\)
ball of mass larger than \(1/2\). Thus every \(\bar h_i\)-unit
ball has mass at most \(1/2\), with equality at \(x_i\).
Use \(\bar h_i\) for all balls below.

For fixed \(L>0\), set \(\rho=C/(C+L^3)\) and
\(\alpha=-L^{-1}\log\rho>0\). Apply (1) inward about every
center with outer radius at most one, and outward about \(x_i\)
with inner radius at least one. Each step of ratio \(e^L\)
contracts the corresponding mass by \(\rho\). Iterating gives
\[
 \sup_x \mu_i(B(x,r))\le C_*r^\alpha\quad(0<r\le1),\qquad
 \mu_i(M\setminus B(x_i,R))\le C_*R^{-\alpha}\quad(R\ge1),
 \qquad C_*=(2\rho)^{-1}.                                     \tag{2}
\]
In particular the physical measures are uniformly tight on
bounded pointed balls and uniformly exclude atoms in these
distances. The elementary choice \(L=C^{1/3}\) gives
\(\rho=1/2\) and \(\alpha=C^{-1/3}\log2\).
To maximize the exponent produced by this fixed-ratio
iteration, put \(t=L^3/C\). The positive maximizing \(t\) is
the unique positive solution of \(3t/(1+t)=\log(1+t)\).
Indeed derivative signs are determined by the difference of
these two sides, which increases up to \(t=2\), then decreases
to \(-\infty\).

## A protected physical-volume witness

Fix a buffer factor \(A\ge1\), an energy tolerance \(\varepsilon>0\)
and at most \(k\) arbitrary marked points for each \(i\).
Let \(\nu_i\) be any supplied sequence of positive Borel measures
with \(\nu_i(M)\le\Lambda\). Fix \(R\ge1\) so (2) bounds the
mass outside \(B(x_i,R)\) by \(1/4\). Choose a fixed
\(0<r<(2A)^{-1}\) satisfying
\[
 C_*(2Ar)^\alpha(k+\Lambda/\varepsilon)\le1/4 .
\]
Fubini and (2) give
\[
 \int \nu_i(B(x,Ar))\,d\mu_i(x)
 =\int\mu_i(B(z,Ar))\,d\nu_i(z)\le\Lambda C_*(Ar)^\alpha .
\]
Markov's inequality and the small-ball bounds about the marked
points leave a set of centers of mass at least \(1/2\) in
\(B(x_i,R)\), with distance at least \(2Ar\) from the marks
and \(\nu_i(B(x,Ar))\le\varepsilon\).

Take a maximal \(r\)-separated net of these good centers.
Its disjoint radius-\(r/2\) balls are inside \(B(x_i,R+r/2)\).
Relative Bishop comparison around each center, with outer radius
\(2R+r/2\), lower bounds the volume of each packing ball by
\((1+4R/r)^{-4}\operatorname{Vol}_{\bar h_i} B(x_i,R+r/2)\).
The net therefore has at most \((1+4R/r)^4\) points and its
radius-\(r\) balls cover the good centers. At one center \(z_i\),
\[
 \mu_i(B(z_i,r))\ge \tfrac12(1+4R/r)^{-4},\qquad
 \nu_i(B(z_i,Ar))\le\varepsilon .
\]
The enlarged ball misses the marked radius-\(Ar\) balls.
Its size and the positive physical mass lower bound are uniform
in \(i\) after fixing \(\Lambda,\varepsilon,A,k,Y_0\).
The curvature measure \(|\mathrm{Rm}_{g_i}|^2dV_{g_i}\) is an
example by the source budget. The estimate uses relative
\(\bar h_i\)-volume for packing and physical \(g_i\)-volume
for the witness.

## Consequences on a supplied comparison in this gauge

Suppose actual whole compact truncations of a smooth closed
base \((N,h)\) minus finitely many ordinary points are embedded
with \(F_i^*\bar h_i\to h\) locally uniformly. Each complementary
piece of the whole truncation has one spherical face by the
homotopy-sphere topology. The following argument uses this
comparison at the same length scale as (2).
[Complement topology](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md#simultaneous-cuts-and-complement-topology)

Take one marked face \(\Sigma_i=F_i(S_h(p,b))\) at fixed
small radius \(b\), and \(q_i\in\Sigma_i\).
Its induced \(\bar h_i\)-diameter is at most \(C_1 b\).
For fixed small \(s\) with \(b\ll s\), the compared annulus
\(b<d_h(p,\cdot)<s-C_2b\) lies in \(B_{\bar h_i}(q_i,s)\)
for large \(i\), by a face path followed by a normal radial
path and uniform metric comparison. Choose \(C_2>C_1+1\).
Its \(\bar h_i\)-volume is at least
\(\omega_4 s^4(1-O(s^2)-O(b/s)-o_i(1;b,s))\).

If a point of the complementary piece has distance at least
\(s/2\) from \(\Sigma_i\), choose a point \(p_i'\) of exact
depth \(s/2\) by continuity along a path to the face. Then
\(d_{\bar h_i}(p_i',q_i)\le s/2+C_1b\).
The ball \(B_{\bar h_i}(p_i',s/8)\) lies in the exterior
and within \(B_{\bar h_i}(q_i,s)\). Its volume is at least
\(16^{-4}\) times the compared annulus volume, by relative
Bishop comparison with \(B_{\bar h_i}(p_i',2s)\), which
contains the annulus. The annulus and exterior ball are
disjoint. For \(s\) first sufficiently small and then
\(b/s\) sufficiently small, their combined volume exceeds
the Bishop upper bound \(\omega_4s^4\) for large \(i\).
Consequently the entire exterior is contained in
\(B_{\bar h_i}(q_i,s)\). Applying (2) at each mark gives
physical volume saturation as \(i\to\infty\) at fixed
truncation, followed by exhaustion. The argument needs no
bound on curvature of \(\bar h_i\) near the marked points.

If the local first-order comparison and curvature hypotheses
of [EXTRACT-E14](../notes/E14_WEAK_MARKED_BASE_20261125.md)
also hold in this gauge, (2) excludes local factor
concentration even at \(y=Y_{\rm rd}\). Indeed each
sufficiently small fixed coordinate ball maps into a small
actual \(\bar h_i\)-ball by the uniform metric comparison.
Hence \(\int u_i^4dV_{\bar h_i}\) on that ball is
uniformly small. The pure cubic term in E14's critical
absorption has coefficient \(Y_i\|u_i-u\|_{L^4(D,h)}^2\),
which is then below the local sharp Sobolev coefficient
even at the round limit. Thus the factors converge strongly
in \(H^1_{\rm loc}\cap L^4_{\rm loc}\), and volume
saturation gives the unit-mass positive factor.

The unconditional result is the volume and energy marking of
actual balls for the normalized positive Ricci distances.
Identifying comparable whole compact truncations in those
distances remains the geometric premise for the last two
conclusions. A conformal chart in a separately chosen length
normalization need not be at the half-volume scale.
