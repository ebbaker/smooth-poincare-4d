# Independent reading of the fixed-exterior wall and band variation

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance.
Bounded SP4-PSE-E03 reading, intake `1c81a3048c8c`. Exact serving model and effort
were unavailable. The [lead trial and variation](../notes/DIRECT_TRIAL_AND_VARIATION.md)
was first read at `2d974b900bbc` and replayed at `a1bd6ddf4091` after the
lower-limit and cuff-response clarifications. The other input blobs were `9c17db552c29` for the
[local wall](../notes/RETAINED_FLAT_WALL.md), `51f66f28665d` for the
[single-relator closures](../notes/SINGLE_RELATOR_CLOSURES.md), `4721e2a7789d`
for the [thin sign](../notes/THIN_DIRECT_SIGN.md), and `c1063b1ee987` for the
[thin energy](../notes/DIRECT_WIDTH_WEYL.md). This is an internal replay of the
arguments on the marked smooth oriented Riemannian assembly.

## Doubled marking and finite width

The three intervals on the real axis joining the boundary components of the
planar pants cut it into two disks with six sides each. Matching the labeled
cuff arcs and perpendiculars in the target, in cyclic order, gives a degree-one
homeomorphism of the closed genus-two doubles. It can be defined on one disk
and copied by both reflections. Edge homotopies relative to the vertices then
extend over the disks, and two disk extensions are homotopic relative to the
boundary. The Schottky involution and extension of planar conjugation are
anticonformal and hence isometric for the uniformizing metric. Both target
reflections are isometries by the gluing of geodesic sides. The unique harmonic
representative of the degree-one class is an orientation-preserving
diffeomorphism. Its two reflected conjugates represent the same class, hence
it intertwines both reflections. In particular it maps the fixed cuffs onto
the matching cuffs, distinguished by their free homotopy classes. The signed
cuff classes force the intended half. Each cuff is nonseparating in the double
because the other two still join its two pants, so its nonzero integral
homology class differs from its negative. Swapping halves by a globally
orientation-preserving map would reverse these boundary orientations. This
fixes \(q_L\) in the native interior coordinates without evaluating its jets.
[Schoen–Yau, *On univalent harmonic maps between surfaces*, §3 Corollary](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11042-Shing-Tung_Yau_47.pdf)

At the baseline width \(1/16\) the step agrees to all orders with the exterior
at the outer face. At the chosen narrow width both ends have open exact
germs. For the finite-width estimate, after scaling all four local coordinates
by \(z\) in the active layer, the metric jets used for \(z^4|W^\pm|^2\) are
smooth functions of \(z\), including at \(z=0\), by the explicit frozen-jet
formula. In an oriented atlas, inversion and the Hodge operator are smooth on
the compact family of positive-definite coefficient matrices. The volume
factor after dividing the original active layer measure by \(z\) is smooth as
well. Thus \(P_{i,\pm}\) has a bounded right derivative on the stated interval.
At \(\varepsilon\le K_i/(2D_i)\) its value is at least \(K_i/2\), so the extra
bound \(\varepsilon\le (K_i/(32\pi^2))^{1/3}\) gives \(c_i\ge16\pi^2\).
Independently, \(\varepsilon\le b_i\) makes the smooth supported sign test at most
\(-1\) in either band. All comparisons use the same center \(s_*=3/32\).
These bounds decide the specified narrow trial. The closed-response template
for the baseline has to use the changed cuff factor \(a_0=L/(2\pi)\) when
applied to the long-cuff metric. Its unknown band responses and sign remain
to be evaluated there, as do the two baseline chiral costs.
[Thin energy](../notes/DIRECT_WIDTH_WEYL.md) · [Thin sign](../notes/THIN_DIRECT_SIGN.md) · [Baseline response at cuff length one](../notes/DIRECT_CLOSED_SIGN.md)

## Fixed-scale obstruction and both Yamabe signs

The retained \(K\Subset\Omega_1\Subset\Omega\) misses both enlarged tubes and
contains the once-around left cuff loop. On the lifted scalar-flat product,
\((x,z,p)\mapsto(x,zp)\) develops the conformal class and makes cuff holonomy a
dilation of multiplier \(e^{\pm L}\). Any Möbius conjugate has a finite fixed
point with this multiplier or its reciprocal. A Euclidean isometry has an
orthogonal derivative at a fixed point. A flat conformal metric would have
Euclidean holonomy by developing parallel coframes, regardless of
completeness. Möbius uniqueness of the two developments gives a contradiction.
Normalized positive harmonic scales on the fixed connected \(\Omega_1\) are
precompact locally in \(C^2\) with positive limits, by Harnack and interior
estimates. If their local \(L^2\) trace-free Ricci infimum were zero, a limit
would be scalar flat, Ricci flat and Weyl flat, violating the holonomy
condition. This proves \(\kappa>0\) as an existence constant for this fixed
\(q_L\). [Frances, §4.2, Fact 4.1 and (8)](https://ems.press/content/serial-article-files/43352#page=21)

For \(-6\Delta u=Yu^3\), a smooth cutoff \(\zeta\) and \(w=u^2\), the test
\(\zeta^2u^3\) gives the exact left side
\((9/2)\int\zeta^2|dw|^2+6\int\zeta w\langle d\zeta,dw\rangle\). Young's
inequality therefore yields
\[
 \tfrac94\int\zeta^2|dw|^2
 \le |Y|\,\|w\|_2\|\zeta w\|_4^2+4\int |d\zeta|^2 w^2.
\]
The local Sobolev bound absorbs the first term for sufficiently small
\(|Y|\), since the global unit-volume normalization gives \(\|w\|_2\le1\).
On nested smaller sets this first bounds \(u\) in \(L^8\), then in
\(W^{2,8/3}\), then in \(C^{0,\alpha}\) for \(0<\alpha<1/2\). Hence the
potential \(V=Yu^2/6\) in \((\Delta+V)(u/u(o))=0\) tends to zero locally in
\(C^{0,\alpha}\). Harnack applies uniformly to the positive normalized
solutions. One can use a formulation with nonpositive zeroth-order
coefficient by applying it to \(e^{At}u(x)/u(o)\) for the product operator
\(\Delta+\partial_t^2+V-A^2\) with \(A^2\ge\sup V\). Interior Schauder
estimates and exhaustion of \(\Omega_1\) give a positive harmonic local
\(C^2\) limit with value one at \(o\). Apply this extraction to a subsequence
realizing the liminf of the local curvature integral. Its limit is at least
\(\kappa\), because the integral is continuous under positive
\(C^2(\overline K)\) convergence and invariant under constant rescaling of
\(u\). This yields the uniform \(\kappa/2\) floor across both signs close to
zero.
[Lee–Parker, conformal covariance (2.7) and the closed Yamabe problem](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) · [Gilbarg–Trudinger, interior estimates and Harnack inequality](https://doi.org/10.1007/978-3-642-61798-0)

In the real two-form operator norm, signature gives \(E_+=E_-=e\) and
Gauss–Bonnet at unit volume reads \(16\pi^2=2e-\tfrac12\int|S|^2+Y^2/24\),
where \(S\) is trace-free Ricci. Thus the floor gives \(e\ge 8\pi^2+\kappa/16\)
if \(|Y|<\eta\le\sqrt{3\kappa}\). At \(Y=0\) the margin is \(\kappa/4\).
Along a \(C^2\)-continuous path of metrics retaining the fixed product, a
change in sign crosses zero by continuity of the first conformal-Laplacian
eigenvalue. The wall gives an existence bound for the fixed exterior and
leaves Yamabe constants away from zero to separate estimates.
[Chang–Gursky–Yang, equation (0.2)](https://arxiv.org/pdf/math/0409583#page=2)

## Compactly supported descent at equality

The signature of each single-relator closure \(N_i\) is zero. Its only possible
Weyl contribution is the one varied band, so the closed full-Weyl functional
is \(2c_i\) under any compactly supported band variation. Its metric gradient
\(G\) is a nonzero universal multiple of Bach. If \(G\) vanished throughout
the band interior, it would vanish on the rest of \(N_i\) by the Weyl-flat
germs and smoothness. Theorem 3.8 applies to this smooth connected closed
Riemannian four-manifold, since Bach-flatness is obstruction-flatness in
dimension four. It would propagate the full \(W=0\) from the open complement
onto the band. The exterior relator longitude has nonidentity conformal
holonomy, while the same longitude bounds a disk in the cap. This is the
holonomy contradiction needed here. The cuff multiplier used for the Ricci
floor establishes a different property. [Chang–Gursky–Yang, before Theorem C](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=6) · [Lassas–Liimatainen, arXiv v2, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27) · [Longitude comparison](../notes/HYPERBOLIC_EXTERIOR.md)

With a nonnegative bump supported in a small neighborhood of a point of
\(G\ne0\) strictly inside the band and positive there, the direction
\(-\chi G\) decreases \(c_i\) to first order by \(-\tfrac12\int\chi|G|^2\).
The perturbation on \(N_i\) is literally transplanted to that band on \(M\).
A closed strictly positive conformal Laplacian has a strict \(H^1\) form
lower bound, which persists because the coefficients of the form change
continuously for a \(C^2\)-small metric perturbation on the compact manifold.
Consequently a smooth positive class at equality enters after a sufficiently
small supported perturbation. In the short-cuff range the equatorial test
excludes strict entry, including at the cuff bound via its interior bump.
It follows that all positive two-band completions in that range have strictly
supercritical chiral cost. The weak obstruction remains the statement for
arbitrary completions covered by the seam test alone. The local descent gives
a strict decrease whose size depends on the original bands and supplies no
threshold crossing from the known positive cylindrical metric.
[Equatorial obstruction and endpoint test](../notes/EQUATOR_FORM.md#smooth-witnesses-and-cuff-range)
