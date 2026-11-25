# E61r2 · Independent check of spectral windows and one charged disk

25 November 2026, for Edward B. Baker III with OpenAI Codex assistance.
Bounded independent review MASTER-E61r2 v1. Actual serving model and
reasoning effort are unavailable. Frozen candidate TeX SHA-256
ca01fa93840e6789cd6277d024c14ae4e9e2770dd1ccd9d57bb2cfebebb5e851.
The scientific antecedents are from
b5ce9f481a7604a411b9e1bde5383b2bc122fb5c. This is a direct analytical
check. [Candidate TeX](../manuscript/spectral_windows.tex) ·
[Physical-volume proof](../../manuscript/physical_volume.tex) ·
[Local replacement theorem](../../manuscript/variational_comparison.tex)

**Assessment.** The finite mask iteration, noncollapse, absolutely
continuous spectral mass and simultaneous raw residual estimates
follow throughout the strict band. At a differentiation point of
positive selected chiral density, one can choose a single standard
disk with an actual smooth bicollar whose physical chiral and
full-curvature measures are arbitrarily small relative to its
protected core charge. Both sides nevertheless have fixed positive
charge along the sequence. A locally conformally flat comparison
satisfying the inherited first-order hypotheses cannot capture this
positive mass in the image of a fixed compact comparison set. The
bicollar construction supplies the marking and the measure control
and leaves the first-order comparison and the cost of repair open.

## Iteration, retention and noncollapse

Use \(T=4\pi^2\), \(e_i=E_\pm(g_i)\to I<2T\) on the given fixed
oriented nonstandard smooth homotopy four-sphere. All metrics are
Riemannian. The source \(g_i\) is volume-one positive Yamabe and
\(Y_i\to y>0\) on the fixed subsequence. The \(q_i\) are the
volume-one modified Yamabe representatives with
\(R_{q_i}=6L_{q_i}+c_i\), \(c_i\le0\).
Put \(\mu_i=dV_{q_i}\), \(\sigma_i=L_{q_i}^2\mu_i\), and
\(\lambda_i^\pm=|W^\pm_{g_i}|^2_{\rm HS}dV_{g_i}\).
Both \(\lambda_i^\pm\) and \(\sigma_i\) are conformal measures.
The full curvature measure
\(\nu_i=|\mathrm{Rm}_{g_i}|^2_{\rm tens}dV_{g_i}\) remains
physical. The \(k_i\) are constant rescalings of smooth
positive-Ricci metrics conformal to \(g_i\), using the strict
band to obtain the positive-Ricci gauge. Its distances and volumes
are used only for the comparison.
[Gauge and normalization](../../manuscript/physical_volume.tex) ·
[Modified Yamabe representative](../manuscript/endpoint_charge.tex)

Fix \(0<6\sqrt\beta<Y_0\le Y_i\) eventually. At every finite stage the
mask \(0\le h_i\le1\) satisfies
\(\int h_i^4d\mu_i\to1\) and
\(\int|dh_i|^4dV_{q_i}\to0\). If the spectral mass of
\(\{h_i>0\}\) were at most \(\beta\) on a subsequence, ordinary
Yamabe, the inequality \(R_{q_i}\le6L_{q_i}\) and Hölder would
give
\((Y_0-6\sqrt\beta)\|h_i\|_{4,q_i}^2
\le6\|dh_i\|_{2,q_i}^2=o(1)\).
The norm estimate uses \(\mu_i(M)=1\). This contradicts the
retained total mask volume. Thus the restricted measure can be
normalized to have maximal unit-ball mass exactly \(\beta\),
attained at \(p_i\). Absolute continuity with respect to the
smooth comparison volume is sufficient for all distance
spheres to be null, and compactness gives attainment.

If no bounded window about \(p_i\) retains a positive lower
bound of \(\theta_i=h_i^4\mu_i\) on a subsequence, every fixed
window has \(\theta_i\)-mass tending to zero. One can choose
\(R_i\to\infty\) slowly enough that
\(\theta_i(B_{R_i^2}(p_i))\to0\). Multiply the mask by the
cutoff zero through \(R_i\), increasing linearly in log radius
to one at \(R_i^2\). Bishop area comparison gives the
fourth-power gradient bound \(2\pi^2/\log^3R_i\). The removed
mask volume is bounded by \(\theta_i(B_{R_i^2})\), and the
gradient remains \(o(1)\) in \(L^4\) by the product rule and
Minkowski. Each new positive set excludes at least the
\(\beta\) of restricted spectral mass in \(B_1(p_i)\).
The normalization may vary between stages, but the measures
\(\sigma_i\) and the now nested source sets do not. Since
\(\sup_i\sigma_i(M)<\infty\), more than
\(\sup_i\sigma_i(M)/\beta\) such removals are impossible.
This argument needs no common subsequence over infinitely
many stages.

At the retained scale, each comparison unit ball carries at
most \(\beta\) of \(\sigma_i\) on the positive mask. For a
cutoff \(\chi\) there, the ordinary Yamabe inequality gives
\[
 (Y_0-6\sqrt\beta)
   \left(\int\chi^4d\theta_i\right)^{1/2}
 \le 6\|d(h_i\chi)\|_{2,q_i}^2,\qquad
 \|d(h_i\chi)\|_{2,q_i}\le o(1)+\|d\chi\|_{4,k_i}.
\]
Taking an inward logarithmic cutoff shows that the supremum
of the limiting small-ball masses vanishes, uniformly in center,
since one can hold its outer radius below one. An independent
linear cutoff in a half-ball which contains a quarter-ball
carrying definite \(\theta_i\)-mass gives a positive volume
lower bound for that half-ball. Such a quarter-ball exists
by relative Bishop packing of the retained bounded window,
which uses a ratio comparison and applies before noncollapse.
The lower bound for the linear cutoff follows by reversing
the displayed inequality and using the gradient upper bound
on the half-ball. Relative volume comparison then gives
noncollapse on each fixed bounded window. Pointed convergence
and local weak measure convergence give a limit with
\(v=\theta(X)>0\), witnessed by a compactly supported test
equal to one on the retained window. The logarithmic estimate
gives \(\theta(\{x\})=0\) at every point.
[Noncollapsed volume and almost-everywhere regularity, Cheeger–Colding I, Theorems 2.1, 5.9 and 5.11](https://doi.org/10.4310/jdg/1214459974)

## Absolute continuity and both residual estimates

Use the full local weak spectral limit \(\sigma\), not its
restriction to the mask. Off its countable atom set take a
small fixed continuity ball in each bounded window.
For \(q_i=w_i^2k_i\), the scalar conformal equation gives
\(-\Delta_{k_i}w_i\le(L_{q_i}w_i^2)w_i\) and
\(\|L_{q_i}w_i^2\|_{2,B}^2=\sigma_i(B)\).
The fixed-radius absorption uses a strict smallness margin
for \(\sigma(B)\), transferred to the source ball by weak
convergence. The inherited \(p=4\) local estimate then bounds
\(w_i^4\) in \(L^2\) on the half-ball, since
\(\int w_i^4dV_{k_i}=1\). Weak comparison-volume convergence
and Cauchy–Schwarz give \(\mu\ll m\) there. A countable
subcover, \(\theta\le\mu\), and nullity of the atoms for
\(\theta\) give \(\theta\ll m\) on \(X\).
There is no asserted tightness of the full modified volume.
[Local \(p=4\) estimate and comparison Sobolev bound](../../manuscript/physical_volume.tex)

The local weak limit of \(\alpha_i=L_{q_i}h_i^2\mu_i\)
exists on a further subsequence by its bounded total mass.
The measure matrix with diagonal \(\theta_i,\sigma_i\) and
off-diagonal \(\alpha_i\) has each constant quadratic test nonnegative,
since the density is a square. Weak testing with nonnegative
compactly supported functions preserves this property. Relative
to \(\theta+\sigma\), this gives a positive semidefinite matrix
of densities almost everywhere by a countable rational test.
Where the \(\theta\)-density vanishes the \(\alpha\)-density
vanishes. On the remaining set write \(\alpha=f\theta\);
the determinant gives \(\sigma\ge f^2\theta\).
Now test Yamabe on \(h_i\chi_R\), with \(\chi_R\) the
centered cutoff equal to one through \(R\) and zero after
\(R^2\), linear in log radius. For fixed \(R\) the radial
tests transfer in the common pointed realization. The squared
gradient upper bound tends to zero by first letting \(i\)
and then \(R\) tend to infinity. Thus \(y\sqrt v\le6\alpha(X)\).
Since \(\theta\ll m\), Cauchy–Schwarz gives
\[
 \sigma_{\rm ac}(X)\ \ge\ \int f^2d\theta\
 \ge\ \alpha(X)^2/v\ \ge\ y^2/36.
\]
The pointwise Weyl spectral inequality
\(\lambda_i^++\lambda_i^-\ge(3/2)\sigma_i\) passes to weak
limits and their absolutely continuous parts. This yields
combined diffuse mass at least \(y^2/24\), and a sign \(s\)
fixed along the subsequence with diffuse mass at least \(y^2/48\).

Take one bounded window and the sum of the absolutely
continuous chiral limit measures as the finite target
measure, up to any prescribed tolerance. At its positive
density points one has the Euclidean regularity and shrink
ratio needed in the existing finite ball selection. Excluding
atoms of \(\nu\) costs no target mass. For a fixed ratio
close to one, all small radii at almost every such center
have nearly the expected fourth-power shrink ratio. They
can also meet the strict comparison volume threshold and
physical curvature ceiling at fixed continuity radii.
The disjoint Vitali selection can be seen directly using
a greedy disjoint selection and fivefold dilates: at the
positive-density points, restrict to small enough radii so
the target measure of each dilate is at most a uniform
multiple of the measure of its ball. Every point not covered
by the selected closed balls belongs to the dilates of every
tail, by fineness. Their target measure tends to zero because
the balls are disjoint. A finite subfamily retains the
required target mass. The shrink error for the sum bounds
the error of either chiral absolutely continuous part.

The outer limit balls are disjoint. After a fixed slight
shrink, their source counterparts remain disjoint by
convergence of the finitely many center distances. The
embedded source disks contain the still smaller fixed balls
and lie in the outer ones as in the proof of the physical
volume theorem. Lower estimates transfer using the *full*
chiral weak limit at the inner continuity radius. The
physical upper ceiling transfers using \(\nu_i\) at the
outer radius. The weak gauge does not replace the physical
full-curvature measure. Finally use \(Y_i\to y\) to absorb
the difference between the limiting and source lower bounds
into the prescribed error. The selected sign carries at least
\(Y_i^2/48-\epsilon\ge 2T-e_i-\epsilon\). The summed lower
bound \(Y_i^2/24-\epsilon\) minus the opposite closed total
\(e_i\) gives the lower bound on the same union for each sign,
and hence both upper residuals \(2e_i-Y_i^2/24+\epsilon\).
The single-sign residual is also bounded by
\(2(e_i-T)+\epsilon\), strictly below \(T\) if \(I<3T/2\)
and the error is small. Escape plus the selected sign's
singular mass is at most \(I-y^2/48\).
[Cheeger–Colding I, Appendix A.1.8–A.1.9, inner coverage and smooth source embedding](https://doi.org/10.4310/jdg/1214459974)

## One marked disk with a small measured surrounding shell

Choose a Euclidean regular point \(x\) which differentiates
the **full** measures \(\lambda^s,\nu\) with respect to \(m\),
and write
\[
 0<F=\frac{d\lambda^s_{\rm ac}}{dm}(x)<\infty,\qquad
 0\le G=\frac{d\nu_{\rm ac}}{dm}(x)<\infty .
\]
Such a point exists because \(\lambda^s_{\rm ac}(X)>0\).
The differentiation includes the singular parts, each of
which has zero density at \(m\)-almost every point. The
Euclidean volume density at the regular point is one.
Fix any desired relative shell tolerance \(\eta>0\) and
radius ceiling. Take \(0<\tau<1/6\) so that, for
\(a=1-3\tau\), \((F+G)(1-a^4)<\eta F a^4/8\).
Then choose a single sufficiently small fixed joint
continuity radius \(r\) and its dilates \(ar,(1-\tau)r\).
Differentiation gives
\[
 (\lambda^s+\nu)(B_r(x)\setminus B_{ar}(x))
 <\tfrac{\eta}{4}\lambda^s(B_{ar}(x)),\qquad
 \lambda^s(B_{ar}(x))>0 .
\]
Also arrange \(\nu(B_r(x))<\zeta<2I\) by any fixed
\(\zeta\) below this threshold and below a requested
full-curvature ceiling. Euclidean density at \((1-\tau)r\)
gives a strict margin for the Cheeger–Colding embedding
threshold with buffer \(\tau\). The radii and \(x\) are
now fixed before taking the source limit.

For \(x_i\to x\), use the oriented smooth model embedding
into \(B_{(1-\tau)r}(x_i)\). Its image contains
\(B_{(1-\tau)^2r}(x_i)\), and
\(ar<(1-\tau)^2r\). The preimage of
\(\overline B_{ar}(x_i)\) is a compact subset of the
open model ball. Three strictly nested concentric closed
model disks can be chosen with that preimage in the
interior of the smallest, giving their images
\(C_i\Subset D_i\Subset D_i^+\).
The seam is \(\partial D_i\), and the shell
\(D_i^+\setminus\operatorname{int} C_i\) is an actual
two-sided marked bicollar of it. The radial product
coordinates in the model disks provide the smooth
parametrization, with only positive width for each source
required. The shell stays within
\(B_r(x_i)\setminus B_{ar}(x_i)\). The selected core mass
is at least \(\lambda^s(B_{ar}(x))/2>0\) on the late
sources. Fixed-radius weak transfer and the strict
limiting margin give
\[
 (\lambda_i^s+\nu_i)
   (D_i^+\setminus\operatorname{int} C_i)
 <\eta\,\lambda_i^s(C_i)
\]
eventually. If needed the other sign's shell charge is
bounded by \(\nu_i/4\), so one can prescribe its tolerance
as well by tightening \(\eta\).
The entire exterior of \(D_i\) carries at least
\(e_i-\zeta/4\), a fixed positive lower bound at late
indices. This uses \(4|W^s|_{\rm HS}^2\le|\mathrm{Rm}|_{\rm tens}^2\)
and the strict physical ceiling in \(B_r(x_i)\).
The relative shell tolerance is chosen before taking the
source limit. Changing it can change \(r\) and the
positive core-mass lower bound.

A compatible smooth comparison as in the local replacement
theorem has oriented embeddings \(\Psi_i\) on neighborhoods
of fixed compact sets, with
\(\Psi_i^*g_i=u_i^2m_i\), \(u_i>0\),
\(m_i\to h\) locally in \(C^0\cap W^{1,4}\), and bounded
full curvature in the \(m_i\) gauge on compact sets.
Suppose there is one fixed compact \(K\) in the comparison
domain on which \(h\) is locally conformally flat in a
neighborhood, and whose transported image captures a
uniformly positive part of the selected core charge, for
example \(C_i\subset\Psi_i(K)\). Strong local chiral
convergence in the local replacement theorem gives
\(\lambda_i^s(\Psi_i(K))\to0\), a contradiction. This
argument also applies if the captured charge is known
directly without set inclusion of the entire core. The
curvature bound for \(m_i\) is a separate condition for
a variable conformal gauge. The conclusion covers a
fixed compact capturing positive charge. An identification
that allows the core to escape through an exhaustion, or
controls only the measured small collar without capturing
charge, does not imply the contradiction.
[Strong local chiral convergence in Theorem local-min](../../manuscript/variational_comparison.tex)
