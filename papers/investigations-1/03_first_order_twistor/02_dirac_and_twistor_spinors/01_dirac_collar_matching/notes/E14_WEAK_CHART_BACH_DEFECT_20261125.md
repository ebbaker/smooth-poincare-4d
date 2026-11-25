# Weak physical annulus and normalized spinorial defect — MATCH-E14

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort are
unavailable. This is an analytic estimate on one supplied coherent
physical chart. [Frozen request](../research-progress/handoffs/E14_REQUEST_20261125.md)

## Estimate and comparison gauge

Let a smooth closed oriented Riemannian four-manifold carry an
orientation-preserving embedded buffered annular chart
\[
 A^*=\{r/2<|x|<2R\},\qquad A=\{r\le |x|\le R\},\qquad R\ge2r>0 .
\]
Use the physical pullback metric, up to constant scale, in the
form \(m=\delta+v\). Put \(a=\|v\|_{\infty,A^*}\le1/4\).
Choose the SEC §14.3 radial cutoff \(0\le\eta\le1\),
equal to one on \(A\) with support compactly contained in \(A^*\).
Its two transitions use fixed profiles on shells of fixed ratios.
Let \(T\) be their union, including the supports of \(D\eta,D^2\eta\).
Set
\[
 d=\|\eta Dv\|_{L^4(dx)},\qquad d_T=\|\eta Dv\|_{L^4(T,dx)},\qquad
 K=\|\eta^2\mathrm{Rm}_{m}\|_{L^2(m)},\qquad
 \mathfrak B_{A^*}=\int_{A^*}|B_m|_m\,dV_m .
\]
The curvature norm here includes all four indices. The chiral energy
\(E_+\) below uses the Hilbert–Schmidt norm of the Weyl endomorphism
on real \(\Lambda^+\). There is a constant independent of \(r,R\)
and \(R/r\) such that
\[
 E_+(m;A)\le
 C\left[a\mathfrak B_{A^*}+(aK+d^2+d_T+a)^2\right].
 \tag{1}
\]
Thus the requested limit follows if \(a+\|Dv\|_4\to0\),
\(K\) stays bounded and the total source Bach norm tends to zero.
In fact \(a\mathfrak B_{A^*}\to0\) suffices. Both \(K\)
and the local Bach norm are controlled by their source integrals
in the constant-scale physical charts. A nonconstant conformal
chart would require the displayed bound on full curvature in that
representative. The chiral energy and \(L^1\) Bach density have the
four-dimensional conformal invariance used in SEC.

## The weighted first variation

Use the all-lowered curvature formula of NECK-E07,
\[
 R(m)=L(D^2v)+Q_m[Dv,Dv].
 \tag{2}
\]
Here \(L\) is constant and \(Q_m\) is bilinear with smooth
matrix coefficients. In Cartesian coordinates the second
derivatives come from differentiating the Christoffel symbols
of the first kind in the all-lowered expression. All remaining
terms are quadratic in first derivatives. This is the place
where cancellation avoids having to estimate \(D^2v\).
Metric equivalence follows uniformly from \(a\le1/4\).
[NECK-E07](../../../01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection)

Let \(\mathcal P_m\) send an all-lowered curvature tensor to
its positive-chiral Weyl matrix in the oriented symmetric
\(m^{-1/2}\) frame, times \((\det m)^{1/4}\). Its range is a
fixed Euclidean matrix space. Write \(F(m)=\mathcal P_m R(m)\).
Then \(|F(m)|^2dx=|W_m^+|_{\mathrm{HS}}^2\,dV_m\).
The projection, frame and density depend smoothly on \(m\),
and the derivative of this coefficient map is bounded uniformly
on the metric neighborhood. They are included in the variation.

Take \(\chi=\eta^4\) and \(h=\chi v\). Product differentiation
of (2) gives
\[
 \begin{aligned}
 R'_m[h]-\chi R(m)={}&L(2D\chi\otimes Dv+D^2\chi\,v)
  +\chi Q_m[Dv,Dv]+Q'_m[h][Dv,Dv]\\
 &+2Q_m[D\chi\otimes v,Dv].
 \end{aligned}
\]
The first tensor expression indicates the usual symmetrization of
the two derivatives. Here \(Q_m\) can be taken symmetric in its two
first-derivative arguments. The derivative of \(F\) includes
\(\mathcal P'_m[h]R(m)\) in addition to the variation of (2).
Consequently
\[
 |F'_m[h]-\chi F(m)|\le
 C\bigl(\chi a|R(m)|+\chi|Dv|^2
    +|D\chi||Dv|+|D^2\chi||v|+|D\chi||v||Dv|\bigr).
 \tag{3}
\]
In particular there is no term requiring a bound on the full
coordinate Hessian \(D^2v\).

The powers in the cutoff give
\(D\chi=4\eta^3D\eta\) and
\(D^2\chi=4\eta^3D^2\eta+12\eta^2D\eta\otimes D\eta\).
Thus \(F'_m[h]-\chi F(m)=\eta^2 H\) with \(H\) defined to be
zero where \(\eta=0\), and
\[
 \|H\|_{L^2(dx)}\le C(aK+d^2+d_T+a).
 \tag{4}
\]
For example the first derivative cutoff product is bounded in
\(L^2\) by \(\|D\eta\|_4d_T\) after removing \(\eta^2\);
the second derivative products are bounded by
\(a(\|D^2\eta\|_2+\|D\eta\|_4^2)\).
Both cutoff norms are bounded independently of \(r,R\) since
each transition is a dilation of one fixed shell, and these
norms are scale invariant in dimension four. The factor \(a d_T\)
from the last term is absorbed in \(C d_T\). The \(\chi|Dv|^2\)
term becomes \(|\eta Dv|^2\). These are all the estimates on
the chart that enter the first variation.

Extend the pushed-forward \(h\) by zero on the closed source
in the same constant scale. The SEC full-tensor normalization
is \(\mathcal W=4(E_++E_-)\), with \(E_+-E_-\) topological,
so its compactly supported first variation
\(D\mathcal W[h]=-4\int\langle B,h\rangle\,dV\) gives
\(DE_+[h]=-\frac12\int\langle B,h\rangle\,dV\).
Since the variation is fixed off the chart, differentiation
of the density in the chart gives the same value. Hence, with
\(E_\eta=\int\eta^4|F(m)|^2dx\),
\[
 2E_\eta+2\int\langle\eta^2 F(m),H\rangle\,dx
     =-\tfrac12\int_{A^*}\langle B_m,\eta^4 v\rangle_m\,dV_m .
\]
The right side has absolute value at most \(Ca\mathfrak B_{A^*}\).
Apply Cauchy–Schwarz and Young with (4) to obtain (1).
Nonnegativity of the cutoff and \(\eta=1\) on the protected
annulus imply \(E_+(m;A)\le E_\eta\).
This combines the SEC §14 Euler variation with the NECK-E07
all-lowered decomposition, under the new input of first-order
critical smallness and bounded full curvature.
[SEC §14.1](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5220)
· [SEC §14.3](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5460)

The estimate remains valid on a supplied oriented annular
quotient by a fixed finite free spherical group of order \(N\).
Use the invariant radial cutoff and the lifted
\(\Gamma\)-equivariant Euclidean comparison. The variation
descends and all integrals divide by \(N\).
With \(d,d_T\) measured upstairs and \(K,\mathfrak B\) downstairs,
the bracket in (4), after dividing its norm by \(\sqrt N\), is
\(C[aK+N^{-1/2}(d^2+d_T+a)]\).
The orientation and a spin structure on the chart are only
needed for the chiral and spinorial statements.

## Full residual and field normalization

A fixed finite buffered cover gives vanishing total residual
energy if each chart satisfies (1) with vanishing right-hand
side. For a growing family of charts no length factor enters
an individual estimate, but sums must be controlled. For
example, if all have uniform cutoff constants, summing (1)
gives the upper bound
\[
 C\left[
 (\sup_j a_j)\sum_j\mathfrak B_j+
 (\sup_j a_j)^2\sum_j K_j^2+
 \sum_j d_j^4+\sum_j d_{T,j}^2+\sum_j a_j^2
 \right].
\]
Bounded overlap controls the two sums of geometric integrals
in physical constant-scale charts. It does not on its own
make the cutoff-end sums small. If the charts use different
coordinate gauges, their \(Dv_j\) terms must be measured in those
gauges. In particular, small first-order error on every slab
without critical summability does not supply the single coherent
whole-annulus hypothesis. No extraction or covering assertion is
used here.

On the protected region in a smooth oriented spin source,
take any smooth positive half-spinor \(\psi\), including an
actual positive Dirac-harmonic spinor in its gauge. With \(P\)
the twistor operator and \(\Pi\) the positive Clifford-kernel
projection as in DIR §2.3, its exact identity gives
\[
 \int_{\{|\psi|>0\}\cap A}
 \frac{|\Pi(d^\nabla P\psi)^+|^2}{|\psi|^2}\,dV
   =\tfrac12 E_+(m;\{|\psi|>0\}\cap A)
   \le\tfrac12 E_+(m;A).
 \tag{5}
\]
The same formula uses the ratio of the sums of the two squared
norms for any finite family, on its joint nonzero locus. The
estimate is uniform in the choice and normalization of fields.
At zeros the displayed ratio is undefined. Extending the
integrand by zero there gives the integral over the nonzero
locus. A nontrivial smooth Dirac-harmonic spinor on a connected
domain has a volume-zero nodal set by Bär's theorem, in which
case (5) has equality with the full half-energy. The inequality
requires no nodal-set theorem or uniform pointwise lower bound.
The projected ratio times \(dV\) on the nonzero locus is invariant
under harmonic conformal transport, as follows from its equality
to the chiral curvature density. The estimate controls that
normalized projected derivative, with no claim on the other
derivative components or pointwise spinor amplitude.
[DIR §2.3](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276)
· [Bär, Corollary 1 and Dirac unique continuation](https://arxiv.org/abs/math/9805065)

For E10, \(a=O(n^{-2})\), \(d=O(n^{-1})\) and \(K=O(1)\)
on a fixed coherent weak chart, while the protected energy
stays positive. Inequality (1) therefore forces
\(\mathfrak B_{A^*}\gtrsim a^{-1}\) for that family for large
\(n\), consistent with the directly calculated \(n^2\) growth.
Its finite nonzero oscillatory defect cannot persist with
the small Bach premise on the entire supplied weak chart.
Obtaining such charts for a degenerating critical sequence,
including any gaps between supplied charts, remains the
parent SEC-B36/E62 extraction problem.
[MATCH-E10](E10_INTERIOR_SPINOR_DEFECT_20261125.md)
· [SEC register](../../../01_sections_and_connections/research-progress/REGISTER.md)

## Inputs

Verified at checkout `6879850`: SEC manuscript SHA-256
`329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`,
DIR manuscript SHA-256
`71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`,
and NECK-E07 SHA-256
`350b86f03790daa347b2ee8d9ab6a75f2a4d58beed735a77b72608a984696257`.
Bär's Main Theorem, Corollary 1 and its introductory discussion
of strong unique continuation for Dirac operators were inspected.
