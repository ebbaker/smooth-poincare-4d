# SP4-FOT-EXTRACT-E05 · Overlap of two embedded ends and the uncovered region

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E execution under EXTRACT-B04.
Helper selected as GPT-6.2 Sol, ultra. Exact serving variant and effort
are unavailable from the runtime. The [frozen request](../research-progress/handoffs/E05_REQUEST_20261125.md)
records the worktree and source hashes.

## Coverage on the original manifold

Let \(g_i\) be smooth Riemannian metrics on the smooth oriented
source. Let \(N_i\) be the closure of a connected interface component
on the source, bounded by its two prescribed, disjoint, separating
spherical faces \(\Sigma_{i,-}\) and \(\Sigma_{i,+}\). The faces
are chosen on the actual matched ends, and “inner” and “outer”
refer to traversal from the prescribed core to the prescribed exterior.
For this test assume these are the entire boundary of \(N_i\).
Use two smooth oriented buffered embeddings \(F_i^-,F_i^+\) of
closed cylindrical products, with image \(C_i^-,C_i^+\subset N_i\)
after restriction to the working intervals. The local buffer
charts exist across all faces. The first face of \(C_i^-\) is
\(\Sigma_{i,-}\), and the last face of \(C_i^+\) is
\(\Sigma_{i,+}\), each with its chart on the \(N_i\) side. Write
\(P_i\) for the last face of \(C_i^-\) and \(Q_i\) for the first
face of \(C_i^+\). One sufficient condition is
\[
  P_i\subset \operatorname{int}_{N_i} C_i^+,\qquad
  Q_i\subset \operatorname{int}_{N_i} C_i^- .                     \tag{1}
\]
For an analytic comparison one can additionally demand measurable
depth: the inverse image of the whole face in the other chart has
log coordinate at least a fixed positive distance from its two
working faces.

The union is compact, hence relatively closed in \(N_i\).
Every point in a chart interior has a neighborhood in the union.
Near \(\Sigma_{i,-}\) and \(\Sigma_{i,+}\), the one-sided boundary
charts include a relative neighborhood by the local inverse function
theorem and the inward-side assumption. At the other chart faces
(1) gives open neighborhoods. The union is therefore also relatively
open, so equals \(N_i\). This is a criterion on physical images.
An overlap at one point or on one angular patch, equality of
coordinate radii without matching their physical locations, and
convergence on two independently chosen compact truncations
give none of the face inclusions. If an interface has other
boundary faces, or if the residual has a separate component,
the criterion must be replaced by a cover that visits those
faces or components. Equivalently one may cover one connected
component at a time with collars that exhaust it. This is where
a chart on a side branch can fail even when its metric is close
to a cone.

For \(\mu_i^\pm=|W^\pm(g_i)|_{\rm HS}^2\,dV_{g_i}\), regarded
as measures on the original source, and
\(\mu_i^{\rm tens}=4(\mu_i^++\mu_i^-)\), coverage gives
\[
 \mu_i(N_i)\le \mu_i(C_i^-)+\mu_i(C_i^+)
\]
for any of these measures. The inequalities need no overlap
bound, since overlap only increases the right-hand side.
For a finite interface family sum the individual estimates.
A growing chain instead requires a summable total error,
such as the integrated decays in EXTRACT-E04. Bounded
multiplicity does not by itself make the sum of slab errors
small. Smooth faces are null sets for these measures. If
\(\mu_i\) is estimated by integration in a chart, the
four-dimensional conformal invariance gives the same value
for its physical image. No spin transition estimate is
needed for this measure argument.
[EXTRACT-E04, energy on the whole growing chart](E04_DIAGONAL_END_20261125.md#chiral-and-full-weyl-energy-on-the-same-annuli) · [SEC accounting and norm](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)

## Physical log scales and transition tests

A quantitative sufficient check uses a shared physical log height
\(\sigma_i\) on \(N_i\), with connected interior level sets and
constant distinct boundary values on the two end faces. For instance
this is available in a supplied common annular identification with
\(\sigma_i=\log\rho\). The maps need not respect its level sets.
Use log parameters \(t_\pm\) on the two charts both increasing
outward, and measured local physical scales
\(\rho_i^-=r_i e^{t_-}\), \(\rho_i^+=R_i e^{t_+}\).
Suppose
\[
 \bigl|\sigma_i(F_i^\pm(t_\pm,\omega))-\log\rho_i^\pm(t_\pm)\bigr|
       \le \eta_{i,\pm}
\]
at least at the working faces. If the core chart ends at
\(t_-=\log A_i\) and the exterior chart begins at
\(t_+=-\log B_i\), set \(p_i=r_i A_i\) and \(q_i=R_i/B_i\).
Thus
\[
 \inf_{P_i}\sigma_i-\sup_{Q_i}\sigma_i
   \ge \log(p_i/q_i)-\eta_{i,-}-\eta_{i,+}.                        \tag{2}
\]
A positive right-hand side suffices for coverage. In fact,
every interior level below \(\inf_{P_i}\sigma_i\) meets
\(C_i^-\) by the intermediate value theorem on a path from
its first to last face. It meets no face of \(C_i^-\), so
its intersection with \(C_i^-\) is relatively open and
closed in that connected level. Thus the entire level is
covered. The exterior chart covers every level above
\(\sup_{Q_i}\sigma_i\) by the same argument from its two
faces. A right-hand side at least \(2b>0\) gives a full
common level band of width up to \(2b\) in the shared height,
with any strictly smaller band interior to the overlap.
To infer a buffer in a particular working log parameter,
measure that parameter too. If a level has several
components, use this argument on each component after
verifying nonempty intersection, or use (1) on the actual
component. The shared-height hypothesis in (2) is a way to
verify ordering and full angular coverage. It is not inferred
from the scale labels.

On any overlap let \(\Psi_i=(F_i^+)^{-1}\circ F_i^-\).
With \(h_i^\pm=(\rho_i^\pm)^{-2}(F_i^\pm)^*g_i\), the exact
metric relation is
\[
 \Psi_i^*h_i^+
   =\left(\frac{\rho_i^-}{\rho_i^+\circ\Psi_i}\right)^2 h_i^- .
\]
The orientations are inherited from the source. Transport the
same source spin structure along the chart maps, preserving
the chosen lift and its signs on each overlap. In those lifts
the corresponding spinor weights between the two gauges are
\((\rho_i^+\circ\Psi_i/\rho_i^-)^{3/2}\) for fields and the
\(5/2\) power for their Dirac images. If the two height
estimates hold throughout an overlap, the absolute log of
this scale ratio is at most \(\eta_{i,-}+\eta_{i,+}\).
A bounded ratio controls pointwise weights. A common
first-order transmission estimate would also need
appropriate derivative and slice control of the actual
transition and conformal ratio, and consistency on all
overlap components. Re-centering the log coordinates
changes the numerical endpoint labels unless accompanied by
the inverse change of their reference scales. It never
changes the chart images or creates a physical overlap.
[EXTRACT-E01, first-order and trace comparison](E01_BUFFERED_SPIN_STRIP_20261125.md#conformal-weights-and-the-two-ends)

## What simultaneous compact comparison supplies

At a fixed pair \(A,B\) with \(r_i/R_i\to0\), the modeled
endpoint ratio \((r_i A)/(R_i/B)\) tends to zero. To meet
(2) with positive margin, diagonal radii would have to
satisfy
\(\log(A_iB_i)>\log(R_i/r_i)+\eta_{i,-}+\eta_{i,+}\).
Compact smooth convergence provides thresholds for each
fixed pair of domains and no bound that compares those
thresholds to the separation of the physical scales.
The exterior comparison of SEC §12.4 may use a
nonconstant conformal representative. Its radial parameter
can serve for curvature integration in that representative,
but its image on the source or an independent measurement
must supply its relation to the physical height.

As a scale model with actual curvature, fix a smooth
conformally round metric on \(S^4\) that is Euclidean in
a marked ball of radius one. Let \(\ell_i\to\infty\),
\(r_i=e^{-\ell_i}\) and \(R_i=1\). In the ball use
\(t=\log(\rho/r_i)\). Replace the product
\(d t^2+\gamma_{S^3(1)}\) on the punctured ball by the
translate, centered at \(t=\ell_i/2\), of one smooth positive
metric that equals this product outside \((-1,1)\times S^3\)
and has \(W^+\ne0\) somewhere inside. Multiply by \(\rho^2\)
and leave the source outside the ball unchanged. This gives
a smooth metric, equal to the Euclidean one near the origin
and near the outer face. Such a perturbation exists in a chart
where the product is conformal to the Euclidean metric. For
example add a small term proportional to \((x^1)^2(dx^2)^2\)
times a compactly supported cutoff to a Euclidean
representative, with cutoff one near the center. Modulo
curvature symmetries its only nonzero coordinate curvature
entry there is \(R_{1212}=k\ne0\). Consequently
\(W_{1212}=W_{3434}=k/3\), and the positive block is nonzero.
Restore the conformal multiplier in that chart. By
translation and conformal invariance the positive Weyl energy
of the translated support is a fixed \(m>0\). Its physical
radius is comparable to \(\sqrt{r_iR_i}\).
On each fixed compact inner domain in \(r_i\)-units the
dilated metrics are eventually Euclidean, and the exterior
metric is unchanged on every fixed compact set away from
the marked point. The two limits are smooth with conformally
flat ends. Yet the entire \(m\) lies in the fixed-\(L\)
annulus \(L r_i<\rho<R_i/L\) for all large \(i\).
In particular no pair of end collars with vanishing
summed tail energies can exhaust that annulus in the
neck limit. This tests the use of simultaneous smooth
comparison alone. The model is a smooth metric construction
on standard \(S^4\) with a flat inner limit. It is not
asserted to be an approximately Bach-critical family or a
positive-Yamabe minimizing sequence in the SEC band.
[SEC §§12.4 and 15](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)

## Slow separated endpoints on the actual source

Assume a shared interface is supplied with scales \(r_i\ll R_i\).
For the inner end use the differentiable ALE decay of
EXTRACT-E04 with exponent \(\alpha>0\). For the exterior
assume a smooth compactification with a normal-coordinate
radius \(s\) near its marked point and compact smooth
embedded comparisons in suitable conformal representatives.
In those coordinates \(h_{\rm ext}-\delta=O(s^2)\),
with \(s^jD^j(h_{\rm ext}-\delta)=O(s^2)\) through order
two, by smoothness and normal coordinates. On a fixed
punctured band \(e^{-m-\ell-2}\le s\le s_*\), impose the
finite weighted \(C^2\) bound \(O(e^{-2m})\) for the
comparison error by taking \(i\) sufficiently large at
that fixed \(m\). Longitudinal and angular log derivatives
of the normalized metric \(s^{-2}\widetilde g_i\), for
the matched representative \(\widetilde g_i\), are then
\(O(s^2)\) on the band through \(s=e^{-m}\), with constants
allowed to depend on the fixed buffer \(\ell\). This is the
inward analogue of EXTRACT-E04. Conformal invariance and
integration in radius give an exterior chiral or full Weyl
energy bound \(C\int_{0}^{1/L}s^4\,ds/s\le C L^{-4}\)
on the corresponding retained band. The ALE side has
bound \(C L^{-2\alpha}\) from its lower endpoint at radius
\(L\). These estimates concern the chart images even when
an exterior conformal factor is used.

Choose the required finite buffers first. At each integer
\(m\) take the fixed matched compact truncations, including
these buffers, at the two endpoint radii \(A=B=e^m\) in
their respective units. Require the corresponding weighted
comparison tolerances, the supplied physical ordering and
disjointness of the retained images, and
\(R_i/r_i\ge e^{4m}\) for large \(i\). On the prescribed
same interface, fixed-depth comparison, separation of the
scales, and the supplied placement data allow nested choices
with correct sides. If placement is not verified, it is a
separate premise at this step. Take strictly increasing
thresholds \(i_m\), and put \(A_i=B_i=e^{m(i)}\) where
\(m(i)=\max\{m:i_m\le i\}\). Then, in a synchronized scale
description, \(q_i/p_i\ge e^{2m(i)}\to\infty\).
These deliberately separated endpoints retain the vanishing
end tails and locate the two embedded endpoint faces, which
may be different from exact physical radial levels. In a
supplied common annulus with fixed-\(L\) boundary faces and
correctly nested chart images, let \(Z_i\) be its actual
complement after removing both collar images. This is the
region left between the endpoint faces, including any
uncovered components. With the face and nesting hypotheses
the same \(Z_i\) can be used for each fixed \(L\) once the
two diagonal collars extend to the fixed-\(L\) faces. The
target estimate is
\[
 \mu_i(N_i(L))\le C L^{-2\alpha}+C L^{-4}+\mu_i(Z_i).
 \tag{3}
\]
Here \(L\) is fixed before \(i\to\infty\), and the
diagonal comparison eventually includes the two fixed
truncation faces. Then \(L\to\infty\). One-ended convergence
and the described exterior convergence justify the two
displayed tail terms. Neither term bounds the last one.

## Quantiles and one separating weak cut

For the rest use the \(+\) measure and suppose
\(E_i=E_+(g_i)\to I^+(M)>0\) on a positive-Yamabe
minimizing sequence with a fixed positive margin to
\(8\pi^2\). If \(\limsup_i\mu_i^+(Z_i)>0\), pass to a
subsequence with \(\mu_i^+(Z_i)>2\eta\), for some fixed
\(\eta>0\) chosen with strict slack. Use a shared radial
function if supplied, or the physical distance \(d_{g_i}(x_i,\cdot)\)
from the marked center to measure the restricted mass on
\(Z_i\). This distribution has no atoms for a smooth
submersion. The distance is also admissible because it
is Lipschitz with unit gradient almost everywhere off
the center, whereas the gradient is zero almost everywhere
on a positive-volume level set. Smooth Weyl densities
are absolutely continuous with respect to volume.
Take two radius values attaining the lower and upper
\(\eta\) masses of the **restricted** distribution.
Their geodesic spheres need not be smooth or connected.
[NECK-E11, two positive masses](../../01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#a-region-with-two-positive-chiral-masses) · [Mantegazza–Mascellani–Uraltsev, §1, distance gradient](https://cvgmt.sns.it/media/doc/paper/2113/HessBV.pdf)

If the two quantile radii have ratio tending to infinity,
NECK-E11's fixed-width disjoint block selection applies
between them on the source full-curvature budget. For
sufficiently many blocks a block has full curvature
energy at most the total bound divided by the block
count. A block chart of the required first-order quality
does not follow from this averaging. The exact Bach-flat
comparison of Chang–Qing–Yang, Theorem 3.1, requires
additional annular hypotheses, including its inner area
condition and the appropriate component meeting the
outer sphere. A bounded ratio of quantile radii also
need not furnish any cheap block.
[Chang–Qing–Yang, Theorem 3.1](https://arxiv.org/pdf/math/0508621)

Suppose on the positive-middle-mass subsequence one
actually obtains a buffered weak spherical cut separating
the two restricted quantile sets in the original \(M\).
Each cut side then has raw chiral energy at least
\(\eta\). For NECK-E07 use the scalar sign test with
fixed sufficiently long buffer and the first-order
errors \(a_i+\|Dv_i\|_4\to0\) in the proper comparison
gauge, with its full incoming curvature bound. The
per-side excess is at most \(2\sqrt{q_{i,j}}d_{i,j}
+d_{i,j}^2\) for incoming splice energy \(q_{i,j}\) and
comparison remainder \(d_{i,j}\to0\). The total incoming
Weyl bound suffices for this excess to tend to zero.
Equivalently, assume directly the positive capped
Yamabe signs and vanishing excesses. Then NECK-E10 gives
\[
 \min(m_{i,\mathrm{left}},m_{i,\mathrm{right}})
 \le E_i-I^+(M)+\max_j\gamma_{i,j}\longrightarrow0,
\]
which contradicts the two fixed masses. This uses one
actual cut anywhere separating the measured sets,
without requiring a chart on the whole middle. It proves
vanishing of the middle \(+\) mass if such a cut is
available on every subsequence with positive middle mass.
The cut condition can be used without a wide quantile
gap whenever a valid cut is already supplied.
[NECK-E07, weak-cap estimate](../../01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md) · [NECK-E10, minimizing inequality](../../01_neck_geometry/notes/E10_NONSPLITTING_MINIMIZERS_20261125.md#chiral-recognition-and-the-minimizing-inequality)

There is a stronger test when an inherited end already
carries positive limiting chiral energy. A weak cut at
its slow diagonal endpoint separates that end's settled
mass from the entire positive middle, so replacement of
the middle by two quantiles is unnecessary. For the
embedded ALE end in EXTRACT-E04, first prescribe the cap
buffer \(\ell\) and enlarge each fixed source comparison
domain from a one-unit buffer to a buffer of width
\(\ell+2\). The diagonal argument keeps the same form
of weighted estimates. The physical chart at \(r_i A_i\)
then has vanishing zeroth- and first-order errors
on that fixed-width buffer, by ALE decay and the
comparison threshold. The source bound in the same
constant-rescaled representative supplies the curvature
bound for E07. With the uniform source Yamabe lower
bound, choose \(\ell\) to make the scalar localization
loss small before taking the sequence limit. The E07
cap test and E10 apply to this endpoint cut. In
particular, the existing smooth nonflat ALE case has
the required positive end mass. The separate, stronger
same-type descent of NECK-E02/E05 already treats the
strict residual in that class. A smooth exterior
limit with a positive mass gives an analogous endpoint
test if its comparison also supplies the relevant
weak metric and curvature bounds in the capping gauge.

For the full Weyl tensor apply the argument to both
chiralities, with vanishing cap excess in the chirality
being tested. On a homotopy sphere \(I^-=I^+\) by the
closed signature formula, and the capped energies agree
across chiralities, so the same cut has the same survivor.
In particular, an endpoint cut that discards the entire
middle bounds both chiral energies there if its cap errors
vanish in both. The quantile route requires a separating
cut for the chirality carrying positive middle mass. A
full finite-component accounting identity also needs every
complementary component covered or separately estimated.

The actual-source order is to fix the caps' finite
buffer lengths and any target end parameter \(L\),
select threshold-controlled diagonals on full
truncations, and take the source limsup at fixed
\(L\). For the weak-cut alternative choose the fixed
positive mass threshold on a putative bad subsequence
and test one separating cut there at fixed buffer
length. Exhaust the target end parameter only after
the source limit. No constructed comparison here
produces an overlapping pair or a new spherical cut
on an arbitrary approximately critical source. The
first open input for a diffuse leftover with no
usable positive-mass endpoint is the extraction of
a cut separating the two actual mass sets.
