# Physical density in the normalized positive Ricci gauge

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [EXTRACT-E17 request](../research-progress/handoffs/E17_THIRD_REQUEST_20261125.md)
specifies GPT-6.2 Sol/ultra. Actual serving settings are unavailable.
Input checkout 0c3399d831d71a1a17c29ffcba14ee0593315cbe.
[Median normalization request](../research-progress/handoffs/E16_THIRD_REQUEST_20261125.md) ·
[Positive Ricci gauge and source versions](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md)

The raw sequence has a noncollapsed pointed metric limit in the
median-normalized positive Ricci representatives. Physical volume converges
to a locally bounded density relative to four-dimensional Hausdorff measure.
Some metric-regular point has arbitrarily small fixed gauge balls with
positive limiting physical volume and arbitrarily small full curvature
integral in the **physical** metric. An actual smooth source ball can
sandwich smaller and larger gauge balls at suitable radii. The resulting
local spherical face comes with measure control. Whole marked conformal
comparison and tensor estimates remain open.

## Gauge volumes from the physical median

Use the smooth closed oriented homotopy four-spheres of the frozen
request, with volume-one physical Yamabe minimizers \(g_i\), scalar
curvatures \(s_{g_i}=Y_i\), and Hilbert–Schmidt chiral energy
\(4\pi^2\le E_+(g_i)\le8\pi^2-\delta\). Thus
\(0<y_0=\sqrt{48\delta}\le Y_i\le Y_{\rm rd}\) and the physical full
tensor curvature integrals are bounded. Normalize any smooth positive
Ricci conformal representative supplied by NECK-E14 by a homothety
so that the least radius at which a ball attains half of physical
volume is one. Denote it by \(h_i\) and set
\[
 g_i=u_i^2h_i,\qquad \nu_i=dV_{h_i},\qquad
 \mu_i=dV_{g_i}=u_i^4\nu_i .
\]
For these complete smooth metrics, distance spheres have zero volume
because the distance gradient has unit norm almost everywhere off the
center, and a Lipschitz function has zero gradient almost everywhere on
each of its level sets. Thus the ball mass is continuous in center and
radius for each source. Compactness gives a median center \(p_i\) with
\(\mu_i(B_{h_i}(p_i,1))=1/2\). Every gauge ball of radius less than one has
physical mass at most \(1/2\).

The Yamabe inequality on \(1+tf\), with \(\int f\,d\mu_i=0\), gives at
order \(t^2\) the inequality \(3Y_i\int f^2\le6\int|df|_{g_i}^2+
Y_i\int f^2\). Subtract the mean and extend by density to get
\[
 \frac{y_0}{3}\operatorname{Var}_{\mu_i}(f)
 \le \int |df|_{g_i}^2\,d\mu_i
 =\int u_i^2|df|_{h_i}^2\,d\nu_i. \tag{1}
\]
If \(f=1\) on \(A\) and \(f=0\) on \(D\), its variance is at least
\(\mu_i(A)\mu_i(D)\) by the double-integral formula.

Bishop–Gromov in \(h_i\) gives \(\operatorname{Ric}_{h_i}\ge0\) volume
doubling and \(\nu_i(B_{h_i}(x,r))\le\omega_4r^4\). To see the finite
cover explicitly, fix \(0<a<1/4\) and take an \(a\)-separated maximal set
of centers in the median ball. Its \(a/2\)-balls are disjoint within
\(B_{h_i}(p_i,1+a/2)\), and the latter ball lies within the \(2+a\)-ball
about each center. By Bishop each disjoint ball has volume at least
\((a/(4+2a))^4\) times the common enclosing volume. The radius-\(a\)
balls therefore cover the median ball with uniformly bounded multiplicity
in the number of centers. Equality on a boundary sphere does not affect
mass. Some radius-\(a\) ball has physical mass at least a uniform \(m_*>0\).
A cutoff on this ball supported inside the \(2a\)-ball, with
\(|df|_{h_i}\le C/a\), vanishes on physical mass at least \(1/2\).
Equations (1) and Hölder imply
\[
 \frac{y_0m_*}{6}\le C a^{-2}\mu_i(B_{2a})^{1/2}\nu_i(B_{2a})^{1/2}.
\]
That \(2a\)-ball lies inside \(B_{h_i}(p_i,2)\), so this last gauge
ball has volume at least \(c>0\). For \(x\in B_{h_i}(p_i,L)\),
use containment in \(B_{h_i}(x,L+3)\) and Bishop again to obtain
\[
 c_L r^4\le\nu_i(B_{h_i}(x,r))\le\omega_4 r^4
 \qquad(0<r\le1). \tag{2}
\]
The lower bound follows without scalar-square control in \(h_i\).
[Volume comparison in Saloff-Coste, §1 equations (1)–(3)](https://pi.math.cornell.edu/~lsc/papers/uniformly-jdg.pdf)

For \(r<R\) use a cutoff which is one on \(B_{h_i}(x,r)\), zero
outside \(B_{h_i}(x,R)\), and linear in log gauge radius in between.
Writing \(T=\log(R/r)\ge1\), the bound
\(|df|_{h_i}^4\le T^{-4}d_{h_i}(x,\cdot)^{-4}\) and the Euclidean upper
volume bound on dyadic shells give \(\int|df|_{h_i}^4\,d\nu_i\le CT^{-3}\).
Hölder and unit physical volume give a physical Dirichlet cost at most
\(CT^{-3/2}\). With \(R=1/2\), the physical mass outside the outer ball
is at least \(1/2\), so (1) gives uniform small physical mass in every
sufficiently small gauge ball. With \(x=p_i\) and \(r=1\), the physical
mass in the inner ball is half and \(R\to\infty\) gives uniform physical
tightness on the pointed gauge windows.

## Finite and infinite Moser iteration

Saloff-Coste, *Uniformly elliptic operators on Riemannian manifolds*,
J. Differential Geom. 36 (1992), 417–450, Theorem 3.1, p. 423, uses a
complete smooth manifold, a lower Ricci bound on the twice enlarged ball
as specified in §1, and the actual ball volume \(V\). In dimension four
with nonnegative Ricci curvature its coefficient is \(C V^{-1/2}r^2\)
for the inhomogeneous Dirichlet inequality. Thus (2) yields, for
\(x\in B_{h_i}(p_i,L)\) and \(0<r\le1\),
\[
 \|v\|_4^2\le C_L\int(|dv|^2+r^{-2}v^2)\,d\nu_i
 \qquad(v\in W^{1,2}_0(B_{h_i}(x,r))). \tag{3}
\]
The compactly supported smooth form of the theorem extends by density.
[Saloff-Coste, Theorem 3.1](https://pi.math.cornell.edu/~lsc/papers/uniformly-jdg.pdf)

With \(\Delta=\operatorname{div}\nabla\), the scalar equation is
\(-6\Delta_{h_i}u_i+R_{h_i}u_i=Y_i u_i^3\). Since \(R_{h_i}\ge0\),
\(-\Delta_{h_i}u_i\le V_i u_i\) for \(V_i=(Y_{\rm rd}/6)u_i^2\).
In the \(h_i\) metric, testing with \(\chi^2u_i^{\beta-1}\) for
\(\beta\ge2\) and absorbing the mixed cutoff term into the positive
gradient term gives, for \(v=\chi u_i^{\beta/2}\),
\[
 \int|dv|^2\le C\beta^2\int (|d\chi|^2u_i^\beta+V_i v^2). \tag{4}
\]
Fix \(\beta=4\), and choose \(s=s(L)>0\), \(2s\le1\), so the uniform
physical mass bound on \(2s\)-balls is below the absorption threshold.
Use a cutoff in the \(2s\)-ball equal to one in the \(s\)-ball.
In (3)–(4) the term
\(\int V_i v^2\le (Y_{\rm rd}/6)\mu_i(B_{2s})^{1/2}\|v\|_4^2\)
is then absorbed. The remaining terms are controlled by unit total
physical volume, giving \(\|u_i\|_{L^8(B_s)}\le C_{L,s}\).
In particular \(\|V_i\|_{L^4(B_s)}\le C_{L,s}\).

For \(s/2<r'<r''\le s\), take a cutoff between \(r'\) and \(r''\).
Hölder and interpolation yield
\(\int V_i v^2\le\|V_i\|_4\|v\|_{8/3}^2
\le\|V_i\|_4\|v\|_2\|v\|_4\).
Young's inequality in (3)–(4) absorbs a fixed fraction of \(\|v\|_4^2\)
and gives
\[
 \|u_i\|_{2\beta,B_{r'}}
 \le [C_{L,s}\beta^4(1+(r''-r')^{-2})]^{1/\beta}
       \|u_i\|_{\beta,B_{r''}}. \tag{5}
\]
Take \(\beta_j=8\,2^j\) and radii decreasing geometrically to \(s/2\).
The logarithms of the multiplying constants have finite sum since they
are bounded by \(C_{L,s}(1+j)/2^j\). The center \(x\) was arbitrary in
the fixed window, so \(\sup_{B_{h_i}(p_i,L)}u_i\le C'_L\).
The argument yields the upper factor bound and the local measure bound
\(\mu_i\le(C'_L)^4\nu_i\). It gives no uniform lower factor estimate.

## A regular point of the actual metric limit

Bishop doubling gives local covering bounds and pointed
Gromov–Hausdorff precompactness. Cheeger–Colding, *On the structure of
spaces with Ricci curvature bounded below. I*, J. Differential Geom. 46
(1997), 406–480, Theorem 1.6 applies to complete connected pointed
\(n\)-manifolds with \(\operatorname{Ric}\ge -(n-1)\).
Passing to a subsequence gives a proper pointed length limit \((X,d,p)\).
The unit-volume lower bound at the basepoint in (2) verifies the
noncollapse hypothesis (5.1) in that paper. Its Theorem 5.9 and (5.10)
give unrenormalized volume convergence to \(\nu=\mathcal H^4\), normalized
as Lebesgue measure in Euclidean space. They also give convergence of
volumes of fixed-radius gauge balls with converging centers. Theorem 2.1
puts zero renormalized limit measure on the singular set. Theorem 5.9
identifies that measure up to scale with \(\nu\), and Theorem 5.11
identifies the regular set with points having all tangent cones
Euclidean of dimension four. These inputs are lower Ricci and unit-scale
noncollapse. [Publisher record](https://doi.org/10.4310/jdg/1214459974) ·
[Inspected full text of Cheeger–Colding I](https://www.researchgate.net/publication/315331142_On_the_structure_of_spaces_with_Ricci_curvature_bounded_below_I)

Along the same pointed comparison take local weak limits \(\mu\) of
the physical probabilities and \(\lambda\) of
\(\lambda_i=|\operatorname{Rm}_{g_i}|_{\mathrm{tens}}^2\,d\mu_i\).
The latter has bounded total mass and may lose some mass at infinity.
Physical tightness gives \(\mu(X)=1\). Testing the local bound from (5)
against nonnegative continuous compactly supported functions gives
\(\mu\le(C'_L)^4\nu\) in each fixed pointed window. Consequently \(\mu\)
is carried by the metric-regular set and gives zero mass to points.

Choose \(x\in\operatorname{supp}\mu\) that is regular and lies away from
the countable atoms of \(\lambda\), and choose source centers \(x_i\)
converging to \(x\) in the pointed gauge comparison. For any
\(\varepsilon>0\), fix a small \(r>0\) with
\(\lambda(\overline B_X(x,2r))<\varepsilon\).
There is always positive \(\mu\)-mass in \(B_X(x,r/4)\).
The spare radial room gives from pointed weak convergence
\[
 \liminf_i\mu_i(B_{h_i}(x_i,r/3))\ge\mu(B_X(x,r/4))>0,\qquad
 \limsup_i\lambda_i(B_{h_i}(x_i,r))\le
               \lambda(\overline B_X(x,2r))<\varepsilon. \tag{6}
\]
The ball in each bound is measured in \(h_i\), while both measures come
from \(g_i\). The positive mass bound can depend on the fixed radius.
NECK-E11 physical noncollapse concerns \(g_i\)-balls and is compatible
with this selection on the actual source.

## A spherical source face and the remaining marking

At \(x\), \(\nu(B_X(x,r))/r^4\to\omega_4\). One proof fixes any
\(r_j\downarrow0\), then selects source indices \(i_j\) sufficiently
large that the rescaled source balls approximate the tangent
comparisons along \(r_j\) and their unit volumes approximate
\(r_j^{-4}\nu(B_X(x,r_j))\) by Theorem 5.9. The rescaled sequence
is noncollapsed by (2). Regularity gives the Euclidean tangent
on all convergent subsequences, and Theorem 5.9 applied again gives
the asserted ratio. Thus the source-index limit is taken at fixed
radius before the small-radius limit.

Choose \(r\) in (6) small enough that the gauge volume of
\(B_{h_i}(x_i,r)\) is almost Euclidean for large \(i\), using the
density and fixed-radius volume convergence. Cheeger–Colding I
Appendix Theorem A.1.8 gives a bi-Hölder embedding of a model ball
into the tested pointed ball, containing a concentric ball with
relative radius as close to one as prescribed when the deficit
and scale are small. Its assumptions are the pointed Ricci lower
bound and noncollapse, small radius, and near Euclidean volume
(or the quantitative weak regularity alternative). Theorem A.1.9
gives a smooth embedding when the tested space is itself a smooth
\(n\)-manifold with the Ricci lower bound. Thus on the actual sources
choose a smooth embedded open ball containing \(B_{h_i}(x_i,r/2)\)
and contained in \(B_{h_i}(x_i,r)\). Restrict the model to a compact
smaller ball containing the preimage of
\(\overline B_{h_i}(x_i,r/3)\). Its spherical face bounds a region
with positive physical mass and small physical curvature by (6).
The complement carries at least half the physical mass for \(r<1\)
by the median condition. Choose the model orientation to match the
source. [Cheeger–Colding I, Appendix Theorems A.1.8–A.1.9 and Remark 5.13](https://doi.org/10.4310/jdg/1214459974)

The local embedding theorem gives topological marking on the source,
with no \(C^0\cap W^{1,4}\) pullback convergence or compatible
exhaustion of a smoothly removable conformal base. The small physical
curvature in (6) does not bound comparison-gauge curvature after a
variable conformal change. Theorem 7.2 of Cheeger–Colding I reaches
\(C^{1,\alpha}\) convergence on its regular set under a two-sided Ricci
bound. Theorem 7.3 adds the Einstein assumption for smooth convergence.
Those upper Ricci or exact Einstein hypotheses are absent here.
The tensor and whole-embedding requirements of EXTRACT-E14 remain B05.
