# Independent check of EXTRACT-E14

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [bounded request](../research-progress/handoffs/VOLUME_CHECK_REQUEST_20261125.md)
specifies GPT-6.2 Sol/ultra. Exact serving model and reasoning effort
are unavailable. Checked [EXTRACT-E14](../notes/E14_WEAK_MARKED_BASE_20261125.md)
at SHA-256 prefix `71fa1d97` from checkout `7db310a2`. This checks a
conditional implication for a supplied oriented whole marked comparison.

The weak Yamabe argument, the fixed-buffer modification and the
evacuation contradiction hold. The sentence following E14 equation (2)
should specify **strong convergence of both Weyl components**. Bounded
total Bach norm under (1) does not imply strong \(L^2\) convergence of
full comparison curvature. Locally \(m_n=e^{2f_n}h\), with
\(f_n=n^{-2}\zeta\sin(nx_1)\) for a smooth cutoff \(\zeta\), has a
strong first-order limit and bounded full curvature. Its Bach integral
and Weyl densities are unchanged, while its trace-free Ricci has a
nonvanishing oscillatory \(L^2\) term
\(-2(\nabla_h^2 f_n)^\circ\). This test concerns the comparison gauge.

## Weak Yamabe limit

In the scalar density the coefficients of the divergence term converge
in \(L^4\), while the quadratic first-derivative terms converge in
\(L^2\). Pairing against products of \(H^1\) tests proves the claimed
form bound. Applying it to the cutoff equation absorbs the form
error against the smooth-background gradient. Thus the unit physical
volume controls the factors in \(H^1_{\rm loc}\), and the same form
comparison passes the equation to the weak limit. Finite point
capacity removes the marked points. The source lower bound on the
closed Yamabe quotient then forces unit mass for a nonzero factor.

For the subround absorption put \(w_i=u_i-u\) and take one fixed small
ball \(D\). Local fourth-power splitting and unit source volume give
\(\|w_i\|_{L^4(D,h)}^2\le1+o(1)\). In the localized equation the pure
cubic term satisfies
\[
 Y_i\int \eta^2w_i^4\,dV_h
 \le Y_i\|w_i\|_{L^4(D,h)}^2\|\eta w_i\|_{4,h}^2.
\]
The two mixed terms tend to zero by truncating the fixed \(u\) in
\(L^4\) and then using subcritical convergence of \(w_i\). Cutoff
derivative and smooth scalar terms vanish by strong local \(L^2\)
convergence. The Sobolev constant on \(D\) can be made strictly
larger than \(y\), so the inequality gives strong \(H^1_{\rm loc}\)
and \(L^4_{\rm loc}\) convergence. This uses only the local form
comparison before testing the limit across the punctures.
[Lee–Parker, Theorem 3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Marked caps and evacuation

At fixed \(\ell,b\), take one global representative \(\bar g_i\)
conformal to \(g_i\) and equal to \(m_i\) on the modified patches and
their spare buffers. Smooth extension of the positive conformal
factor on these compact supports suffices. Denote the splice-to-\(h\)
metric by \(\widetilde g_i\). Choose smooth \(\alpha,\beta\) with
\(\alpha^2+\beta^2=1\), \(\alpha=1\) on the modified patches and
\(\alpha\) supported in the spare buffers. The source Yamabe
inequality gives \(Q_{\bar g_i}(\beta f)\ge0\). The localization
identity then gives
\[
 Q_{\bar g_i}(\alpha f)\le Q_{\bar g_i}(f)
      +C_{b,\ell}\|f\|_{4,\bar g_i}^2.
\]
The localized form estimate and smooth-background coercivity bound
the gradient of \(\alpha f\) by the right side, up to a fixed
multiple of \(\|f\|_{4,\bar g_i}^2\). Substitution into the form
error bounds \(Q_{\widetilde g_i}(f)\) below by
\((1-o_i(1))Q_{\bar g_i}(f)-o_i(1)\|f\|_{4,\bar g_i}^2\).
The volume-density error in the denominator is uniform in \(f\).
This verifies \(Y([\widetilde g_i])\ge Y_i-o_i(1;b,\ell)\).
The strong Weyl limits and bounded comparison curvature verify
the \(o_i(1;b,\ell)\) chiral cost of the initial transition. The
exact \(h\) buffers then allow the ordinary cap construction
with a positive lower Yamabe bound and the residual chiral budget.
[Finite-puncture cap and marking](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md)
· [Chang–Gursky–Yang, Theorem A](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

If \(u=0\), all fixed compared compacts have vanishing physical
volume. At fixed \(b,\ell\) put every exterior's test transition
strictly deeper into the retained side than the splice-to-\(h\)
and cap modifications. Its critical gradient norm is uniformly
bounded, so its physical Dirichlet energy tends to zero.
The original Yamabe inequality forces one exterior to have unit
limiting volume along a subsequence of the finite volume vector.
The same test, transported conformally on the unchanged support,
gives \(\limsup Y_{\rm cap}\le y\) there. Since the cap has
positive Yamabe constant, its own Gauss–Bonnet identity gives
\(48E_+(\mathrm{cap})\ge Y_{\rm rd}^2-Y_{\rm cap}^2\).
Comparing to the summed residual budget and taking \(i\to\infty\)
before \(b\downarrow0\) gives \(e-e_N\ge(Y_{\rm rd}^2-y^2)/48\).
A common limiting exterior label across all radii is unnecessary
for this summed lower bound. If there are no punctures, the
whole comparison carries unit volume and \(u=0\) is excluded
directly by the strong subround convergence.
[Independent cap calculation](../../../reviews/SECOND_COLLAR_LEAD_CHECK_20261125.md#what-an-evacuated-exterior-must-carry)

## Physical topology of convergence

In the nonzero subround branch the physical tensors converge
strongly in \(L^2_{\rm loc}\) and also in
\(W^{1,4/3}_{\rm loc}\) relative to a fixed smooth background.
To see the latter, differentiate \(u_i^2m_i\). The product
\(2u_i\,du_i\,m_i\) converges strongly in \(L^{4/3}\) by
strong \(L^4\) convergence of \(u_i\), strong \(L^2\)
convergence of \(du_i\) and uniform convergence of \(m_i\).
The term \(u_i^2Dm_i\) converges strongly in the same norm
by strong \(L^2\) convergence of \(u_i^2\) and strong
\(L^4\) convergence of \(Dm_i\). Physical volume densities
and scalar-square densities converge in \(L^1_{\rm loc}\).
No uniform control of distances or physical smooth convergence
is established by these tests. Producing the whole marked
comparison from the original approximate sequence remains B05.
