# E56c · Two physical shell volumes and a radial comparison

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution under NECK-B04/B05 and
SP4-MASTER-E56c. Actual serving model and effort are unavailable.
Input HEAD `2fba0882dbf8766c95094ef4d1207190b0c24bc2`. The frozen master
and neck TeX bundle digests begin `15c0f568bb52bdde` and
`9531c2a1087d3a8e`. The owning radial TeX, E53a note, and master
critical annulus SHA-256 prefixes are `46067935de003f29`,
`eb8c6ac25055c987`, and `8fdb856aaac2dd9c1`.
[Input receipt](../../../../../master/research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md)
· [E53a](E53_PHYSICAL_SHELL.md)
· [Independent E53a check](../reviews/E53_RADIAL_CHECK.md)

**Result.** On an already supplied proper flat comparison band,
calibrated final segments of physical minimizing geodesics give a
one-sided shifted radial Laplacian comparison. Equality of two positive
normalized shell volume limits in one embedded source region then gives
the spherical cut, with both complete physical marks and the
first-order splice. This test uses volumes and allows a fixed shift of
the limiting radial origin. If the same comparison extends properly
down to radius zero, the unshifted comparison holds and supplies the
original E53a radial equation on the tested band if the unshifted
shell volumes saturate. The separated source
alone still needs a proper flat comparison and a volume saturation
condition for the finite-band test.

## The physical source and exact volume test

Use the E53a source. The `g_i` are smooth unit-volume positive Yamabe
minimizers on one closed oriented smooth Riemannian nonstandard homotopy
four-sphere \(M\), with \(R_{g_i}=Y_i\ge y_0=\sqrt{48\delta}\) and
\(4\pi^2\le e_i=E_+(g_i)\le8\pi^2-\delta\), \(e_i\to I^+(M)\).
The chiral measure is \(|W^+|_{\mathrm{HS}}^2dV\) in the fixed
orientation. At \(0<\theta<1/2\) fix \(a_i=r_i(\theta)\),
\(b_i=r_i(1/2)\) and an attaining center \(x_i\) for the smaller
quantile. Assume \(a_i/b_i\to0\). The complete physical marks are
\(B_{g_i}(x_i,a_i)\), of chiral mass \(\theta e_i\), and
\(M\setminus B_{g_i}(x_i,b_i)\), of chiral mass at least \(e_i/2\).
Use the selected physical scale \(\rho_i\) with \(a_i/\rho_i\to0\),
\(\rho_i/b_i\to0\), \(\rho_i\to0\). For \(h_i=\rho_i^{-2}g_i\) and
\(d_i=d_{h_i}(x_i,\cdot)\), the full tensor curvature integral tends
to zero on each fixed compact strip of positive \(d_i\)-radii. This
rescaling changes the fourth-dimensional volume by \(\rho_i^{-4}\)
and leaves the full and chiral curvature integrals invariant.
[Block and marks](E53_PHYSICAL_SHELL.md#source-block-and-the-missing-transition-volume)

Let \(J=(\alpha,\beta)=(1/16,2L)\), for \(H=A_0=2\) and \(L>8\)
satisfying both inequalities of the
[anchored-width test](../manuscript/anchored_physical_shell.tex).
Suppose a nonempty connected oriented boundaryless smooth flat
four-manifold \((U,h)\) carries a proper continuous map \(r:U\to J\).
For every compact subset use oriented smooth embeddings \(F_i\) of
one neighborhood of that subset into \(M\), for all sufficiently
large \(i\), with \(F_i^*h_i\to h\) locally in \(C^0\cap W^{1,4}\)
and \(d_i\circ F_i\to r\) locally uniformly. One compact strip
includes every level needed for each comparison. Changing the
comparison on other compact sets is permitted.

Choose fixed \(t_0<t_1<t_2\) in \(J\) with
\(t_0<\alpha+1/8\) and \(t_2>\alpha+L\). Fix \(a<t_0<t_2<b\) in
\(J\), use one comparison on a neighborhood of \(r^{-1}([a,b])\),
and set \(V=r^{-1}((a,b))\). For \(t_0\le u<v\le t_2\), define
\[
 Q_i(u,v)=
 \frac{4\rho_i^{-4}\operatorname{vol}_{g_i}
        (F_i(V)\cap\{u\rho_i<d_{g_i}(x_i,\cdot)<v\rho_i\})}
 {(v-\alpha)^4-(u-\alpha)^4}.
\]
The additional volume premise is
\[
 Q_i(t_0,t_1)-Q_i(t_1,t_2)\longrightarrow0,\qquad
 \liminf_i Q_i(t_0,t_1)>0.                                    \tag{1}
\]
These are physical volumes restricted to the chosen source image.
One may use the entire source annuli if the two normalized omitted
volumes tend to zero, or if coverage is exact. A through-component
count or a bound on the volume of the entire distance annulus does
not give that identification.

## Backward calibration and the one-sided defect

The pulled-back distances are locally Lipschitz with converging
length bounds, so \(r\) is \(1\)-Lipschitz for \(h\)-path lengths.
For \(p\in U\), compare on a small buffered flat coordinate ball
about \(p\). The backwards final segment of a source minimizing
geodesic ending at \(F_i(p)\) lifts for a fixed short time. It cannot
exit the ball earlier because uniform ellipticity gives a positive
first-exit length. Take this time also less than \(r(p)/2\).
The lifts have a uniformly convergent subsequence, with limiting
speed at most one by uniform metric convergence. Along the limit
\(r\) drops at unit speed by uniform distance convergence. The
local Lipschitz bound and convexity of the coordinate ball force
the limit to be a unit-speed flat geodesic. At differentiability
points of \(r\) this gives \(|dr|_h=1\), hence a.e.

One backward calibrated geodesic from \(p\) can continue for
every length \(\ell<r(p)-\alpha\). Local continuation at an
endpoint uses the preceding segment construction. A concatenation
has no corner, since the radius difference of two nearby points
straddling the endpoint is the full path length and is bounded
above by their straight-line distance in a convex flat chart.
Before reaching the lower endpoint of \(J\), unit-speed
continuation stays in a compact radial strip by properness.
The geodesic ODE extends across each such finite time and
continuity preserves calibration at its endpoint.

Fix \(q\) on this backward geodesic at length \(\ell\) from
\(p\). For \(z\) near \(p\) choose the local inverse branch of
\(\exp_q\) determined by that geodesic. Nearby initial velocities
remain defined up to their endpoint, since the segment lies in
a compact interior subset. Flatness makes the differential of
\(\exp_q\) parallel transport there by the Jacobi equation,
so this branch is a local isometry. In its Euclidean coordinates
\(z'\) at the endpoint, the function
\(\psi(z)=r(q)+|z'|\) lies above \(r(z)\) by the path-length
Lipschitz bound, and equals \(r(p)\) at \(p\), where \(|z'|=\ell\).
Consequently \(\Psi=(\psi-\alpha)^2/2\) is an upper support to
\(f_\alpha=(r-\alpha)^2/2\) on a neighborhood of \(p\), with
\[
 \Delta_h\Psi(p)=1+3\frac{r(p)-\alpha}{\ell}.
\]
The factor \(\psi-\alpha\) is positive near \(p\).
Any smooth lower test touching \(f_\alpha\) at \(p\) lies below
each \(\Psi\), so its Laplacian there is at most four upon
letting \(\ell\uparrow r(p)-\alpha\).

For clarity this is a distributional upper comparison. In a
flat chart \(w=f_\alpha-|z|^2/2\) has nonpositive Laplacian on
every smooth lower test. On a closed Euclidean ball, let \(H\)
be its harmonic replacement with continuous boundary values.
If \(w-H<0\) somewhere inside, then for small \(\epsilon>0\)
the negative minimum of
\(w-[H+\epsilon(|z-z_0|^2-R^2)]\) is attained in the interior.
Adding that minimum to the bracket gives a lower test with
strictly positive Laplacian. This contradiction gives the
super-mean inequality for \(w\). Multiply it by a smooth
nonnegative compactly supported test in the chart, integrate,
move the spherical mean to the test by Fubini, divide by the
square of the mean radius and take it to zero. This yields
\(\Delta w\le0\) in distributions. In particular
\[
 \mu_\alpha=4\,dV_h-\Delta_h f_\alpha\ \ge 0                   \tag{2}
\]
as a Radon measure, where the distributional Laplacian is
paired using \(dV_h\) and \(\Delta=\operatorname{div}\nabla\).
This argument includes the cut-locus contribution and needs
no comparisons through the omitted core.

## Two shell volumes detect all the local defect

For almost every \(t\), set \(A(t)=\mathcal H_h^3(r^{-1}(t))\).
By coarea and \(|dr|=1\) a.e., \(A\) is the locally integrable
density of \(r_*dV_h\). Every fixed level has zero four-volume,
by the same coarea formula applied to the indicator of that
level. For \(\eta\in C^\infty_c(J)\), the compactly supported
Lipschitz test \(\eta(r)\) gives
\[
 \begin{aligned}
 (r_*\mu_\alpha)(\eta)
 &=\int_U [4\eta(r)+(r-\alpha)\eta'(r)]\,dV_h\\
 &=\int_J [4\eta(t)+(t-\alpha)\eta'(t)]A(t)\,dt\\
 &=\left\langle -(t-\alpha)^4
              \left(\frac{A(t)}{(t-\alpha)^3}\right)',\eta\right\rangle .
 \end{aligned}
\]
The first line follows by uniformly smoothing the test on a
compact neighborhood of its support, also with strong
\(W^{1,2}\) convergence. This preserves both the Radon measure
pairing and the first-order distributional pairing. Thus
\(A(t)/(t-\alpha)^3\) has a nonincreasing representative.

Pulling the physical volumes in \(Q_i\) back to \(V\), uniform
metric and radial convergence and the zero-volume level sets
give \(Q_i(u,v)\to Q(u,v)\). The limit is the weighted mean
of \(A(t)/(t-\alpha)^3\) on \((u,v)\), with weight
\((t-\alpha)^3dt\). The difference of the means on the two
ordered intervals is the integral, against the two normalized
positive weights, of the nonnegative difference of the
density at the two sampled radii. Equality implies the
density is constant a.e. on their entire union. Monotonicity
also rules out a jump at \(t_1\).
Equation (2) now gives \(\mu_\alpha=0\) on
\(r^{-1}((t_0,t_2))\), since a nonnegative measure whose
pushforward vanishes there has no mass on that preimage.
The common positive mean in (1) makes the preimage nonempty.
Equivalently one can use one radial volume moment
\(\int [4\eta(r)+(r-\alpha)\eta'(r)]\,dV_h=0\)
with \(\eta\ge0\) compactly supported and strictly positive
on the desired open band. Its source counterpart is the
same integrand with \(r\) replaced by \(d_i\), integrated
on the comparison image in \(h_i\).
In either case the comparison of volumes uses only
\(C^0\) convergence. The stronger \(W^{1,4}\) input
is used later to splice.

If the same proper comparison is available on \((0,\beta)\),
apply the argument with \(\alpha=0\). More generally, an
independent one-sided distributional comparison
\(\Delta_h r\le 3/r\) yields \(4\,dV_h-\Delta_h(r^2/2)\ge0\),
by the weak chain rule with the positive multiplier \(r\)
and \(|dr|=1\). Then the unshifted normalized shell volumes
test the E53a PDE directly. On the finite band the two
defects differ by
\[
 4\,dV_h-\Delta_h(r^2/2)
   =\frac{r}{r-\alpha}\mu_\alpha
         -\frac{3\alpha}{r-\alpha}\,dV_h .
\]
For this identity one can first derive
\(\Delta_h r=(\Delta_h f_\alpha-dV_h)/(r-\alpha)\) from
the weak chain rule. Local uniform and strong
\(W^{1,2}\) smoothing lets these Lipschitz multipliers act
on the Radon measures. The unshifted defect can have either
sign. An averaged cancellation without a one-sided comparison
does not give the local PDE.

## The cut in the original metric

On the equality region, flat interior regularity gives smooth
\(f_\alpha\), hence smooth \(s=r-\alpha>0\).
There \(\Delta f_\alpha=4\) and \(|df_\alpha|^2=2f_\alpha\).
Bochner and equality in the trace inequality give
\(\nabla^2 f_\alpha=h\). Choose one connected component.
It is closed relative to \(r^{-1}((t_0,t_2))\) and proper
on compact subintervals of \((t_0,t_2)\). The unit gradient
flow of \(s\) exists across every such subinterval and
identifies the component with the cone over a compact
connected orientable link, with \(s\) as cone radius.
Flatness gives sectional curvature one on the link,
so it is \(S^3/\Gamma\) for a finite free oriented action.

Restrict one comparison of a compact buffered strip to
the complete quotient cone annulus \(1/8\le s\le L\).
The source image lies in the selected physical block,
since \(d_i\circ F_i\to\alpha+s\), and its lifted rescalings
converge uniformly and strongly in \(W^{1,4}\) to Euclidean.
The invariant curvature integral on the entire image
tends to zero. A fixed short equivariant straightening
near \(s=1\) costs \(o(1)\) in the full critical curvature
norm on the transition. In the original metric the
conformal factor \((\rho_i s)^{-2}\) near that middle
slice gives an exact round quotient product.
The closed source comparison has \(E_+\le e_i+o(1)<9\pi^2\),
so the existing product-boundary obstruction forces
\(\Gamma=1\). This uses the unchanged smooth type and the
orientation of the source comparison.
[Quotient and splice](E53_PHYSICAL_SHELL.md#scalar-test-and-the-source-embedding)

Use the original, unstraightened chart for the marks.
Its ellipticity bound is \(H=2\) and
\(d_{g_i}(x_i,S_i(1))=(1+\alpha+o(1))\rho_i<2\rho_i\).
The anchored-width argument locates the entire small
quantile ball and the entire median exterior on opposite sides,
with both disjoint from the closed trim \(1/4\le s\le4\).
This works through the global sides of the embedded sphere.
It requires no chart on an additional connected component
of the source distance annulus. The spherical chart on
\(A(1/8,8)\) already meets the first-order splice alternative.
The harmonic alternative would still require its own
reparametrization input. The two cap allowances satisfy
\(\gamma_{i,\pm}=o(1)\) over their actual raw side energies.
The joined path lies in positive classes, both completed
caps are positive, and
\[
 e_i+\gamma_{i,+}+\gamma_{i,-}<8\pi^2,\qquad
 e_i-I^+(M)+\max(\gamma_{i,+},\gamma_{i,-})<4\pi^2\theta
\]
eventually. Both raw side charges are at least \(\theta e_i\).
The fixed-type short-cut argument contradicts near-minimality.
[First-order alternative](../../../../../master/manuscript/critical_annulus.tex)
· [Cap positivity and fixed-type comparison](../../../../../master/manuscript/variational_comparison.tex)

## Scope of the remaining input

The finite radial shift cannot be removed by protected
flatness and volume bounds alone. Fix \(0<3c<\alpha\)
and choose a smooth cutoff \(0\le\chi\le1\), equal to zero for
\(t\le2c\) and one for \(t\ge3c\). The complete smooth
rooted metric on \(\mathbb R^4\)
\[
 h=dt^2+(t-c\chi(t))^2 g_{S^3(1)}
\]
has exact distance \(r=t\) from the origin, because every path
costs at least its radial displacement and each radial path
attains that bound. The metric is Euclidean near the origin
and on the entire protected band \(J\), where Euclidean
radius is \(t-c\). The underlying manifold is simply
connected, the protected annulus is a single complete radial
preimage, and bilipschitz control gives uniform Euclidean-type
upper and lower ball volumes at every center and scale.
The centered upper bound is even the Euclidean one, since
\(t-c\chi(t)\le t\). Nevertheless on \(J\)
\[
 \Delta_h(r^2/2)=4+\frac{3c}{r-c},\qquad
 \frac{A(t)}{(t-\alpha)^3}
   =|S^3|\left(\frac{t-c}{t-\alpha}\right)^3 ,
\]
and the second expression is strictly decreasing.
This example establishes a failure of the unshifted
comparison and of automatic volume equality on the finite
geometric band. It already has a shifted round shell,
and its compact core can have curvature on other positive
rescaled radii. It carries no Yamabe-infimum or separated
chiral marks claim and does not test non-extraction from the
full budget-selected source.

The presently available source upper estimate
\(\operatorname{vol}_{g_i}\{t\rho_i<d_{g_i}<2t\rho_i\}=o(1)\)
supplies neither normalized shell volume convergence on a
comparison image nor equality of its limiting ratios. The
protected supercritical physical Ricci premise permits local
integral volume comparison and local harmonic coordinate
limits. Those local conclusions do not supply the proper
embedded comparison in this test or an initial comparison
through the core. Petersen–Wei Lemma 2.3 integrates the
negative Ricci deficit over the entire corresponding ball
with exponent greater than two. Yang Theorem 7.1 uses a
buffered ball with a Sobolev bound and curvature hypotheses
to give coordinates on a smaller ball. Neither result is
applied as an extraction theorem here.
[Petersen–Wei, §2](https://www.math.ucla.edu/~petersen/Papers/28.pdf)
· [Yang, Theorem 7.1](https://www.numdam.org/item/10.24033/asens.1647.pdf)
· [Existing physical volume assessment](../../../../../master/reviews/E25_ANNULAR_VOLUME.md)
