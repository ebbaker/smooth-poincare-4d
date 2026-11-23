# E126 — Integration audit of the nonlinear multiscale budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E41 and E122, audited E42/E63 dependencies
in E44/E67, and previously audited the round and Lorentz inputs and
their earlier integration in E114/E117/E120. I did not author E119,
E123 or E124. This is an integration audit of the assessed results.
No primary source was newly inspected and no build was run.
[Request][req] · [Packet return][ret].

## Disposition and consumed scope

Pass at the assessed mathematical scopes, with precision edits below.
I found no blocking gap in either proof. The exact frozen manuscript
is 350225 bytes with SHA-256
9e581aa885cc1b312872cf12b15f81e1338885e8f3bc06b486e143d3d719e1aa.
I consumed the added abstract and introduction text, the preceding
linear-bound transition, both complete new subsections, and the
specified internal dependencies. The lead was notified after
consumption. All line numbers below refer to the frozen bytes.
[Manuscript location][ms] · [E119/E122 assessment][a119] ·
[E123/E124 assessment][a123].

## Uniform Taylor lemma

At frozen lines 7379–7409 the two weighted bounds are stated on
one common datum ball and \(0<\tau\le\mathcal T/4\), in the same
fixed round independent-pair spaces. The exponent of \(\tau\)
is \(k/2\) in both statements. \(D^2\) retains the ordered
spatial derivative slots. The subtracted derivative is the full
linearized adjusted solution map. These quantifiers match the
assessed statement, including the continuous initial value
space and independence of spatial derivatives of the datum.
[E119, (1)][e119] · [E122][e122].

The lift at frozen lines 7416–7446 uses \(z=r\eta(\tau/r^2)s\)
and fixed parallel transport on the centered pair. This is
linear in the pair and is identity near both time endpoints
since \(2r^2\le\mathcal T/2\). The only nonidentity times are in
the prescribed band. If an anchored cylinder at radius \(\ell\)
meets it, then \(\ell\ge r/\sqrt2\), so the fixed-time displacement
\(O(r|s|)\) is \(O(\ell)\). Covering by balls of the same radius
\(\ell\) leaves all time ranges and allowable cylinder radii
unchanged. The bounded fixed-density Jacobian and bounded
spatial matrices give the source bounds. For the lifted first
derivative the extra value coefficient costs
\(C\sqrt{\mathcal T}\|U\|_\infty\) in \(Z_{\mathcal T}\).
Smooth fields on the closed cylinder are preserved at each
fixed \(r,s\), so all these estimates extend to the same
completions. No bound on a high time derivative of the lift
is used. [E119, (2)–(3)][e119] · [E122, lift and bands][e122].

I checked the signs in frozen lines 7448–7491 against the
coordinate divergence
\(\mu^{-1}\partial_j(\mu w^j)+\gamma_jw^j\) in a fixed
metric frame. The change to the pulled-back density
\(\mu m_z\) adds \(+(\partial_j\log m_z)I\).
The product derivative of the inverse frame is the
negative of \((\partial_jM_z)M_z^{-1}\). The old
connection transported back is
\(M_z\gamma_i(y)M_z^{-1}J^i{}_j\), and subtracting the
fixed \(\gamma_j(x)\) leaves exactly \(-C_{z,j}\).
The printed \(B_{z,j}=(\partial_j\log m_z)I-C_{z,j}\)
therefore has the correct density and frame signs.
The flux factor \(K^j{}_i\) acts on its vector slot,
and \(K^k{}_b\) converts the old derivative slot after
solving the gradient identity. Their product and the
fiber conjugation give the displayed \(\widetilde P_z\).
Replacing its flux by the fixed principal one leaves
\((\widetilde P_z-P_0)DV-\widetilde P_zC_zV\) in divergence
form. The remaining \(B_zW\) is a value term. The extra
time derivative of the lift has the positive sign on
the right. Passing from \(\partial_{y^a}U\) to \(D_aU\)
gives the last negative term in \(c_i\); solving the
gradient identity gives the other negative term
\(-b_i^j C_{z,j}\). The multiplication by
\(r^{-1}\eta'(\tau/r^2)s_i\) introduces no additional
differentiation. [E119, (4)–(7)][e119] ·
[E122, exact coefficient check][e122].

Frozen lines 7493–7517 keep the E42 weights. For any
envelope \(M/r\) on the band, upper slabs smaller than
\(r/\sqrt2\) or larger than \(2r\) miss it, and comparable
slabs cost \(CM\ell/r\) and \(CM\ell^2/r\) in \(Z,Y\).
The tent's \(\ell^{-4}\) weight cancels the spatial
\(\ell^4\); the length bound
\(\min(\ell^2,2r^2)\) gives the claimed squared \(Z\)
and unsquared \(Y\) contributions, including larger
tents. Hölder on upper slabs and Cauchy–Schwarz on
tents split the weights for \(Y(mDV)\) into the two
\(Z\) weights. For \(mV\) the value norm is the other
factor. A derivative in \(s\) either acts once on
\(s_i\) in the speed or supplies a factor \(r\eta\)
when differentiating its smooth coefficient. All finite
orders thus have the same time support and an envelope
\(C_\alpha/r\); the coefficient itself has envelope
\(C|s|/r\). Hence the stated \(C|s|\) perturbation
of the source Lipschitz bound is uniform. The remaining
terms use the unchanged E42 product bounds, finite
degree in \(DV\), and \(O(\sup|z|)\) coefficient
changes. [E119, (8)][e119] · [E122, full norm check][e122].

The frozen contraction argument at 7519–7538 has one
fixed parameter ball and datum radius. Stationarity
makes the transformed forcing zero at the centered
zero section. The added Lipschitz constant can be
absorbed into the original E42 margin to obtain
\(\vartheta_*<1/2\). With \(\|Hu\|\le R/4\), stationarity
also gives a fixed-point image bound \(R/4+\vartheta_*R<R\).
The \(C_XA\epsilon/(1-\vartheta)\) bound is for the
lifted original fixed point in that same ball. The
residual identity passes to distributions at fixed
\(r,s\) via the smooth lift and the completed source
bounds, and it keeps the strong initial trace.
Subtracting the fixed mild path with the transformed
sources reduces to the same homogeneous linear
\(L\)-equation with zero strong trace. Thus the earlier
energy uniqueness argument applies. No auxiliary weak
uniqueness class or \(r\)-dependent norms are introduced.
[E119, (9)][e119] · [E122, fixed radius and residual][e122].

At 7540–7572 the source derivatives leave at most
one gradient in fluxes and two in value sources;
differentiation in the values otherwise needs only
bounded directions. The product bounds control these
maps and Taylor remainders in the completions.
The fixed-point inverse bound \((1-\vartheta_*)^{-1}\)
then applies at each mixed order because the only
top-order derivative of the fixed point is multiplied
by \(D_V\Phi_r\). Induction covers total order four
and hence two parameter and two datum derivatives.
The datum enters linearly via the fixed \(H\), so there
is no other high-order datum term. At \(s=0\) the
untransformed nonlinear flux has vanishing linear part,
and the surviving additions are \(h_1(x,0)DW\) and
\(D_Uh_0(x,0)W\), as in the manuscript. At
\(\tau=r^2\), evaluation of a lifted section and its
directional derivatives gives the weighted first
derivative and repeated-direction second derivative.
Uniform spanning at a fixed point and the fixed
Levi–Civita acceleration correction give the symmetric
Hessian by polarization, and the antisymmetric part
comes from the fixed curvature of the pair bundle.
The corrections cost only the lower jets with the
stated weights. The local inverses provide spatial
smoothness at each fixed positive time; their domains
need not be uniform in \(r\). Apply the mean value
formula through two parameter derivatives and the
quadratic Taylor formula through total order four
to get exactly the two lemma estimates. In particular
there is no compactness or continuity assumption at
\(r=0\). [E119, (10)–(12)][e119] ·
[E122, full Hessian and Taylor check][e122].

## Nonlinear family, live distribution and weighted comparison

At frozen lines 7580–7633, the actual connections
\(A_{\delta,N}=A_0+\delta b_N\) use the unweighted
finite annular sum. The smooth collars keep all
pointwise bounds on each annulus and give zero
perturbation off the support. The displayed bounds
\(Cr,C,C/r\) through two ordered derivatives of the
one-form follow from the atom estimates already
proved in the manuscript. Alternation gives
\(|d_0a^{(r)}|\le C\), \(|D_0d_0a^{(r)}|\le C/r\).
The fixed covariant derivative preserves the bracket,
so the bracket and its first derivative are \(O(r^2),O(r)\).
This verifies the factor \(1/2\) in the exact curvature
polynomial, with \(|\zeta|\le C\delta\),
\(|D_0\zeta|\le C\delta/r\). The same fixed threshold
puts the data in a positive tube and in the established
smooth value basin. The scales and \(\delta_*\) are chosen
independently of \(N\) and \(\delta\).
[E123, (1), (5)–(6)][e123] · [E124, initial atom check][e124].

The Taylor map \(L(x)\) in 7635–7648 is the actual
curvature-to-Gram derivative \(2\operatorname{tf}L_0\).
Taylor's product rule gives the remainder and its
covariant derivative in terms of \(\zeta,D_0\zeta\) as
displayed. Thus the linear bracket term costs \(O(\delta^2r)\)
after one derivative and the Gram remainder costs
\(O(\delta^2/r)\). The internal action
\([\operatorname{ad}(\delta a^{(r)}),Q-I]\) has the
correct sign in \(\nabla^A Q\) and size \(O(\delta^2r)\).
Both factors \(Q^{-1/2}-I=O(\delta)\) multiply
derivatives bounded by \(C\delta/r\). The trace-free
part preserves the leading linear derivative.
This proves the claimed fixed-norm
\(O(\delta^2/r)\) strain error without a flow estimate.
The metric and volume ratios are \(1+O(\delta)\) because
the reconstruction is smooth in the nearby curvature
values. A fixed \(\delta_*\) preserves the fixed positive
lower subsets and total support bounds from the preceding
subsection in the actual live norm and measure.
Disjointness gives the strict superlevel sandwich at
7653–7655, including at the thresholds. In the
finite-index norm, the already displayed factor-four layer
formula applies to this full distribution, with summed
upper volume tails and disjoint lower bands. In the weak
index, the same level estimates control the supremum.
Thus the actual live Lorentz orders, including
ordinary \(L^4\), are uniform in \(N,\delta\).
[E123, (7)–(8)][e123] · [E124, actual initial Lorentz check][e124].

The exact static bracket response in 7663–7688 is on
the independent pair domain:
\(u_{\delta,N}=\delta v_N+\delta^2 w_N\) with both
directions uniformly bounded in sup norm. Although
\(w_N\) need not be a compatible tangent by itself,
\(W[w_N]=D_u\mathsf S(0)[w_N]\) is defined on
independent pairs. The two lemma inequalities imply
the same weighted linear estimate for \(W[h]\) on
any direction \(h\): apply them to a small
\(\varepsilon h\), use linearity of \(W\) and divide by
\(\varepsilon\). This gives the required \(O(\delta^2)\)
bound for \(\delta^2 W[w_N]\) uniformly through order
two, independent of derivatives of \(w_N\). It also
gives the bound for \(V_N=W[v_N]\).
The lemma's quadratic remainder on the full compatible
datum plus this bracket response is exactly
\(U-\delta V_N\). Replacing the fixed pair connection
by \(D_0\) changes the first derivative by fixed
zeroth order and the second by fixed first and
zeroth order, harmless for the stated weights
when \(\tau\le1\).
[E123, (9)–(10)][e123] · [E124, uniform pair control][e124].

At 7690–7722 the strain is affine in the first pair
jet, with coefficients smooth in values. The formula
for its full covariant derivative retains
\(+[\operatorname{ad}(a_i),T_j]\) internally and
\(-(\Gamma(G(U))-\Gamma(G))^k{}_{ij}T_k\) on the
covector slot. The standard connection-difference
formula with one \(D_0G(U)\) is affine in the first
pair jet. Its derivative-free term vanishes at zero
value. Applying \(D_0\) to \(T\) and inserting both
connection differences gives exactly one second-jet
term and a quadratic first-jet term, plus the
displayed lower orders. At the reference zero jet
the strain vanishes, so the variations of its two
connections multiply zero, and \(Q=I\) gives
\(\mathcal K_1(U)=\tfrac12D_0^2(L(x)\zeta)\).
The quadratic geometric error is therefore the sum
\(|U||D_0^2U|+|D_0U|^2+|U||D_0U|+|U|^2\) up to a
fixed coefficient. Substituting the weighted pair
bounds and \(0<\tau\le1\) gives \(C\delta^2/\tau\),
also for the contribution of \(\mathcal K_1(U-\delta V_N)\).
The two-slot norm comparison costs \(O(\delta)\) times
the size of \(\delta\mathcal K_1(V_N)\), which is
\(O(\delta/\tau)\), hence the required additional
\(O(\delta^2/\tau)\). This treatment includes metric
derivatives in the geometric tensor before comparing
its norm. [E123, (11)–(14)][e123] · [E124, full geometric jet][e124].

## Signed windows, finiteness and exclusions

The identification in 7724–7729 uses the derivative at
zero of the compatible smooth curve \(A_0+\varepsilon b_N\)
at each fixed \(N\), with initial pair
\(\varepsilon v_N+\varepsilon^2 w_N\). Its tangent
is \(V_N\), so the already proved reference orbit
annihilation and continuous trace identify its defect
with the native heat solution from
\(DQ_{A_0}(b_N)=\sum_jq^{(r_j)}\). This yields exactly
the claimed \(e^{-12\tau}\) times the full ordered
Hessian of the linear heat sum in heat time \(4\tau\),
with factor \(1/2\) inside the Hessian. The argument
at fixed \(N\) only identifies the linear solution.
The scale-uniform bounds already proved control the
nonlinear difference without interchanging limits.
[E123, (15)][e123] · [E124, signed windows][e124].

The fixed frame projection of \(\mathcal K_1(V_N)\)
on its own window survives all other atoms by the
previously proved absolute scale bounds. Damping
has the common lower bound \(e^{-3\beta r_1^2}\),
independent of \(N,\delta\). The projected lower bound
\(c_0 r_j^{-2}\) gives a true lower bound for the
fixed tensor norm, and the live norm estimate gives
\(c_0\delta r_j^{-2}-C\delta^2/\tau\) in the original
live sup after slice comparison. Integration of
the leading term over its native window contributes
\(c_0(\beta-\alpha)\delta/4\). The integral of
\(1/\tau\) over that same window is
\(\log(\beta/\alpha)\), not the interval length times
an upper derivative loss at a different scale.
The full covariant tensor, its live norm, and its
spatial sup are natural under the exact per-slice
orientation-preserving bundle pullback at the
same native time. No derivative estimate for
the recovering automorphism is assumed. The
windows are disjoint and within the head; discarding
the nonnegative squared-strain term yields the
claimed \(cN\delta-CN\delta^2\).
[E123, (16)][e123] · [E124, signed and recovered windows][e124].

For each fixed finite datum the smooth initial
trajectory and splice give compact-interval finiteness.
The cited smooth limit theorem gives exponential
tail convergence, and its proof supplies \(C^3\)
control of the tail connection and therefore \(C^2\)
of curvature. The displayed geometric formulas, their
vanishing at the perfect reference, and slice
naturality give exponential integrable bounds for
the strain and its full derivative. These constants
can depend on the datum and do not enter the uniform
lower bound. Thus each trajectory is smooth for all
time and has finite \(J\).

For fixed \(1<\theta\le\infty\) and \(1/\infty=0\),
\(\max(1/\theta,1/4)<a<1\) is possible.
For all large \(N\), \(\delta=N^{-a}\) is below
the common threshold. Its two initial strain norms
and the connection and curvature value differences
tend to zero. The lower bound is
\(N^{1-a}(c-CN^{-a})\), which tends to infinity
even if the error \(N^{1-2a}\) also grows. The
separate choice \(\delta=N^{-1/2}\) gives
\(J\ge c\sqrt N-C\) with small initial \(L^4\) and
value norms. Along the stated diverging sequences
the initial \(L^{4,1}\) size grows like \(N\delta\).
Thus the result excludes every upper bound by a
function of the three specified small sizes that
is locally bounded at their common zero, for
each fixed \(\theta>1\). It is a statement about
a family of smooth global finite-budget flows.
It asserts neither an individual trajectory
singularity nor failure of small intrinsic
\(L^{4,1}\) control in its existing domain.
[E123, finiteness and consequences][e123] ·
[E124][e124] · [E123/E124 assessment][a123].

The transition at 7372–7375 correctly preserves the
older fixed-\(N\) exclusion of a uniform linear
bound as a separate argument. The abstract and
introduction correctly attribute the stronger
conclusion to the uniform Taylor estimate and say
“across a family” or its equivalent. They keep
Lorentz index one as the threshold for the
fixed round linearized estimate, and the
nonlinear counterfamily at indices \(>1\). These
statements imply no qualitative assertion about
initial structures on another homotopy sphere.
[Frozen front matter and transition][ms].

## Precision edits for lead integration

1. At frozen 7428–7430 identify the uniformly bounded
   arrays as the spatial flow, inverse spatial Jacobians
   and fixed fiber transport and their finite spatial
   and parameter derivatives. The time speed is treated
   separately by the band estimates. The current
   paragraph can otherwise appear to include derivatives
   of the time-speed coefficient.
2. At 7612–7618 write that \(\alpha,\beta\) are the
   endpoints \(a,b\) of the preceding heat-window proof,
   with \(R>2\) and \(R^2>\beta/\alpha\). At 7657–7660
   explicitly say the finite-index proof integrates the
   bands, while the weak proof takes the supremum of
   \(\lambda m(\lambda)^{1/4}\) over those bands.
3. At 7673–7688 give the short homogeneity argument for
   \(W=D_u\mathsf S(0)\): applying both lemma bounds to
   \(\varepsilon h\), dividing by \(\varepsilon\), and
   taking \(\varepsilon\downarrow0\) proves the same
   weighted linear estimate for every direction \(h\).
   This makes the estimate for \(w_N\) explicit. At
   7724–7729 write that differentiating the actual
   curve \(A_0+\varepsilon b_N\), with centered pair
   \(\varepsilon v_N+\varepsilon^2 w_N\), gives \(V_N\)
   and initial defect \(\sum_jq^{(r_j)}\). These
   clarifications make the independent bracket response
   and the compatible tangent identification distinct.
4. At 7699–7700 replace “vanishes at the zero pair” by
   “its derivative-free term vanishes at \(U=0\)” or
   “vanishes at the reference zero jet.” A first
   derivative of \(U\) may be nonzero at a point with
   value zero. The connection-difference formula
   \(\tfrac12G(U)^{k\ell}((D_0)_iG(U)_{j\ell}
   +(D_0)_jG(U)_{i\ell}-(D_0)_\ell G(U)_{ij})\)
   makes the asserted affine dependence immediate.
   Also define \(L(x)=2\operatorname{tf}L_0\) at its
   first use at 7635. It is a pointwise Gram derivative,
   distinct from the prior principal evolution operator.
5. At 7758–7764 restrict the example amplitudes to
   sufficiently large \(N\), to express the fixed
   \(\delta_*\) requirement explicitly. At 7769–7770
   specify that the initial \(L^{4,1}\) sizes grow
   along the stated diverging sequences. The formula
   \(\asymp N\delta\) itself holds for the entire
   admitted family. For front-matter precision,
   the new nonlinear sentence can say “for each fixed
   \(1<\theta\le\infty\) on the round value basin”;
   the final open question can say “intrinsic
   \(L^{4,1}\) control” to identify the endpoint
   while distinguishing the proved obstruction at
   the larger indices.

All five groups clarify the proof or notation without
altering the mathematical conclusions.

## References and identities

The frozen text has 295 unique labels and 33 unique
bibliography keys, with no unmatched explicit references or
citations and correct first-citation order. The new internal
references locate the fixed spaces, quantitative parameter
patches, attained round windows, earlier derivative test,
uniform Taylor lemma and smooth tail where used. The
Koch–Lamm citation at 7412–7415 expressly attributes a
method from the inspected preprint; the mixed-datum estimate
is derived in the manuscript. Its bibliography entry
distinguishes the journal metadata from arXiv:1310.3658v1.
Canonical R20 records the unavailable final-text comparison
and the limits of the preprint inspection. I used that local
source record without new primary inspection.
[Manuscript location][ms] · [R20 record][r20].

| Consumed file | SHA-256 |
| --- | --- |
| [E126 request][req] | 6cdf82bc0663db99c9aca2f4cf498f09112db0eb481d9207d1bd06ef102eed67 |
| Frozen manuscript (350225 bytes) | 9e581aa885cc1b312872cf12b15f81e1338885e8f3bc06b486e143d3d719e1aa |
| [E119][e119] | 4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea |
| [E122][e122] | d60a910e0007d4e469ffae84bea67d0153556da11461d9d05466d079cdd70ac7 |
| [E119/E122 assessment][a119] | 0f3d1c976e6f244e42498ca6cc9a749001a6b73aef06c21be8e97c2a1dfc0174 |
| [E123][e123] | 8d2e32f25ad75eae6bdc21d1df374d804b82464b96de95268c56d20162837064 |
| [E124][e124] | 0ed1670007d4256483773b622b81ff9d2112a913bfea92aa7bc534805033c726 |
| [E123/E124 assessment][a123] | 86e700801c8444ad36aeb7eebeb494d3357103e9da2af3f51843e850dc62ff75 |

[req]: ../research-progress/handoffs/SP4-CME-E126_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E126_RETURN_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e119]: ../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[e122]: E122_UNIFORM_PARABOLIC_REMAINDER_AUDIT_20261122.md
[a119]: E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md
[e123]: ../notes/123_CONDITIONAL_NONLINEAR_MULTISCALE_BUDGET_20261122.md
[e124]: E124_NONLINEAR_MULTISCALE_AUDIT_20261122.md
[a123]: E123_E124_NONLINEAR_MULTISCALE_ASSESSMENT_20261122.md
[r20]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
