# E64 — Audit of the compact critical construction and its compatible identification

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
All five [frozen inputs][req] matched. This assistant authored
E36, E42, the flat estimates E53–E54, and the E62 implication.
It did not author E29, E57 or E60. The checks below concern E60
and its use of those inputs, with E42 taken as assessed.

**Disposition.** The E60 construction and weak–smooth comparison pass.
Its smooth-compatible conclusion supplies the exact \(H_{\rm crit}\)
in the [E62 request][hcrit]. I found no additional analytic premise
in the stated setting.

## Actual equation and fixed reference

For \(a=A-A_0\), E60 (1) keeps the E36 independent system,
with \(g=g(F)\), \(\beta=F-F_0+[a\wedge a]/2\),
\(C=F-F_A\) and \(\phi=d_A^{*g_0}a\).
Its physical summand is \(*_g((d_AB(F))\wedge F)\).
For independent \(F\) it differs from
\(-d_A^{*g}(B(F)F)\) by the Bianchi term
\(-*_g(B(F)d_AF)\). E60 keeps the actual reduced extension
in E36 (1), including its prescribed vertical and compatibility
terms and the independent curvature diffusion.

The first term of \(W\) has one derivative of \(F\).
In its second term the derivative of \(\beta\) and the live
Christoffel symbols are affine in the full first jet, with
smooth value coefficients. This uses \(g=g(F)\) independently
of \(A\). Writing \(W\) in a fixed chart as
\(W_0(x,U)+W_1(x,U)\partial U\), \(d_AW\) yields the
second jet only from differentiating \(\partial U\).
Differentiating \(W_1\) gives an explicit \(x\)-derivative
or a first jet through its value derivative, hence a lower
term through degree two in \(\partial U\).
In \(d_A^{*g}C\), \(C\) is affine in \(\partial A\).
The differentiated \(C\) gives a second \(A\) jet, while
the metric derivative in the adjoint multiplies \(C\) and
gives at most a first \(F\) jet times a first \(A\) jet.
The fixed metric in \(d_A\phi\) gives a fixed second-jet
coefficient, and \([F,\phi]\) is at most first order.
For \(d_A^{*g}d_AF\), differentiating the affine first-order
\(d_AF\) gives a second \(F\) jet and lower terms, and the
live Christoffel factors multiply the first-order \(d_AF\).
These terms exhaust E36 (1). Changing to the fixed
derivative \(D_0\) adds smooth fixed lower-order terms.
This verifies E60 (2) with value-only diffusion array \(P(x,U)\)
and lower polynomial \(h_0+h_1D_0U+h_2[D_0U,D_0U]\).

At \(U=0\), \(Q=I\), \(B=2I\) and \(d_{A_0}B=0\).
The fields \(\beta,C,\phi\) vanish identically and
\(d_{A_0}F_0=0\). Thus both rows vanish and \(h_0(x,0)=0\).
At the reference, E36 (4) supplies the diagonal connection
symbol and its completed curvature block, with
\(\lambda\) chosen by the fixed-pairing closed-symbol gap
and cross-block bound in E36. The resulting positive
Hermitian rank-one margin for \(P_0=P(x,0)\) is uniform
in the native reference pairing. It persists in a small
smooth definite value tube by continuity. There is
no change to a live pairing in this test.

The E57 frozen operator is \(L_0=P_0^{ij}D_{0i}D_{0j}\).
With the full \(h_j\) from the nondivergence expression,
E60 (3) is exactly the remaining source.
E42 instead freezes a divergence operator and assigns
the resulting first-order terms to its own lower source.
That split gives the same geometric equation on smooth
paths by the covariant product rule. Neither the nonlinear
comparison nor its uniqueness requires equality of those
linear splittings. [E36, (1)–(4)][e36] · [E57][e57] ·
[E60, (1)–(3)][e60] · [E42, (1)][e42].

## Localized composition, time factors and fixed point

For an output partition piece \(\eta_a\), use the nested
input \(\rho_aU\), where \(0\leq\rho_a\leq1\) and
\(\rho_a=1\) on a neighborhood of its support. The cutoff
preserves the Euclidean value ball in the orthonormal
fixed frames. The extra spatial cutoff on a coefficient
\(G(x,z)\) makes it periodic and smooth, and equals one
near the target support. The extension vanishes in a
neighborhood of the coordinate seam.
The E57 overlap estimate controls the nested input norm and
final partition multiplication, including for the derivative
tensor bundles with their smooth fixed frames.

In the difference norm \(B^s_{8,1}\), \(s=1/2\), write
\(G(x,u)-G(x,v)=\int_0^1 G_z(x,z_\theta)w\,d\theta\)
with \(w=u-v\), \(z_\theta=v+\theta w\).
The increment of this formula contains
\(G_z(x+h,z_\theta(x+h))\delta_hw\),
the increment of \(G_z\) in \(x\) at fixed value times \(w\),
and the increment of \(G_z\) in value times \(w\).
Uniform \(G_z,D_xG_z,D_zG_z\) on the fixed convex ball
therefore give the three terms
\[
 C\|\delta_hw\|_8,\qquad C|h|\|w\|_8,\qquad
 C\|w\|_\infty(\|\delta_hu\|_8+\|\delta_hv\|_8).
\]
The explicit spatial term is integrable against
\(|h|^{-4-s}dh\) because \(s<1\).
The \(L^8\) term is bounded by \(C\|w\|_8\).
Consequently the chart increment proof gives the claimed
Lipschitz coefficient estimate with factor
\(C(1+\|U\|_{\mathcal B^s}+\|V\|_{\mathcal B^s})\).
Taking \(V=0\) subtracts the exact baseline \(G(x,0)\).
It remains zero for \(P-P_0\) and \(h_0\), including after
the spatial cutoff. The fixed smooth baselines for
\(h_1,h_2\) have finite inhomogeneous norm.
Products use the two-slot increment rule and
\(\mathcal B^s\hookrightarrow C^0\) in the same fixed pieces.

To check the time exponents, let \(M_Z=M_T(Z)\),
\(H_Z=H_T(Z)\) and \(I_Z=(M_ZH_Z)^{1/2}\).
Reconstruction differentiated in a source chart gives a
sum of ordinary derivative terms through the indicated
order multiplied by fixed frame and cutoff coefficients.
The E57 overlap estimate transfers each term to the target
norm. Ordinary dyadic derivative bounds cost one or two
powers of frequency, with finite low-block bounds.
Thus \(\|D_0^2Z\|_{L^1\mathcal B^s}\leq CH_Z\).
For a source piece \(z_a\), the block sum inequality
\(\|z_a(t)\|_{B^{s+1}}^2\leq
  \|z_a(t)\|_{B^s}\|z_a(t)\|_{B^{s+2}}\)
follows by Cauchy–Schwarz. Integrate in time with the
first factor controlled by the summed block suprema and
the second by the integrated sum, then apply Cauchy–Schwarz
over the pieces. This gives
\(\|D_0Z\|_{L^2\mathcal B^s}\leq CI_Z\).
All weights are inhomogeneous. These also give the
corresponding \(L^1_t\) uniform Hessian and \(L^2_t\)
uniform gradient bounds.

The four forcing differences, in \(L^1\mathcal B^s\)
and up to fixed constants on the radius-\(R\) ball,
are bounded as follows, with \(w=U-V\):
\[
 \begin{array}{c|l}
 (P-P_0)D_0^2 U & M_UH_w+M_wH_V\\
 h_0(x,U) & T M_w\\
 h_1(x,U)D_0U & \sqrt T\, I_w+\sqrt T\,M_w I_V\\
 h_2(x,U)[D_0U,D_0U] & (I_U+I_V)I_w+M_w I_V^2 .
 \end{array}
\]
For the last two lines change a derivative slot with
coefficient at \(U\), then change the coefficient on the
comparator derivative slots. A single time integration of
a first gradient costs \(\sqrt T\), while the product
of two gradients uses \(L^2_t\) on both slots.
With \(R\leq1\), the sum is at most
\(K(R+\sqrt T+T)E_T(w)\), and the size estimate follows
by setting \(V=0\). Strong measurability follows by the
finite block approximations and bounded products, since
the continuous value path yields continuous coefficients
in the low Besov norm. This verifies that the forcing is
in the E57 Bochner space rather than only a distribution.

If \(R\leq(12C_LK)^{-1}\), \(T\leq\min(1,R^2,T_{57},T_{42}/2)\),
the contraction factor satisfies
\(q=C_LK(R+\sqrt T+T)\leq 3C_LKR\leq1/4\).
The critical embedding keeps the ball in the tube for
\(R\leq\rho/C_{\rm emb}\). The datum bound
\(\epsilon\leq R/(4C_L)\) gives image norm at most \(R/2\).
The E57 inverse on the complete strongly traced class then
gives the fixed point with bound \(C_L/(1-q)\) times the
datum size, by \(N(0)=0\), and the same Lipschitz bound
for differences of data. The strong Besov trace gives
uniform trace by the embedding. A distributional solution
in that ball solves the same linear equation for its own
Bochner source, so E57 uniqueness identifies it with its
mild evaluation. This proves the stated uniqueness class.
[E60, (4)–(6)][e60] · [E57, (1)–(3)][e57].

## Initial bridge in the two uniqueness classes

Restricting E36 (1) to \(F=F_A\) removes the \(C\)
correction. The remaining connection equation is E29's.
Its horizontal term differentiates the independent \(F\)
once before inserting \(F_A=F_0+d_{A_0}a+[a\wedge a]/2\).
The second derivative of \(a\) therefore enters by the
fixed exterior-part map. The remaining top vertical
coefficient has the fixed metric. Thus the principal
coefficient of the connection equation depends on
\(x,A,F_A\) values, and E29's strict reference symbol
persists on a small value tube. For an individual smooth
datum its compact first-jet image lies in that open
parabolic region, even if some symmetric first-jet
components are large. The E29 proof uses a smooth
cutoff equal to one near this image, blending the
coefficient to the fixed Laplacian in the same
rank-one inequality. The Galerkin proof gives
a smooth local solution up to zero on a possibly
datum-dependent interval. Jet continuity allows
restriction to its cutoff agreement region.
There is no uniform high-jet lifespan needed here.

Lift this connection path by its curvature. On the graph
\(d_AF_A=0\), \(\beta=d_Aa\), and
\(\partial_tF_A=d_AA_t=d_AW-[F_A,\phi]\),
where \(d_A^2\phi=[F_A,\phi]\). This is exactly the
independent curvature equation with Bianchi term zero.
Thus the lifted difference \(Z\) is a smooth solution
of both E60's nondivergence form and E42's divergence form.

For each block of every local piece of \(Z\), the
shrinking-interval time supremum tends to its value
at zero by continuity. For high \(j\) a uniform
\(W^{4,8}\) bound on the one fixed smooth slab gives
\(\|\Delta_j Z_a(t)\|_8\leq C_Z2^{-4j}\).
This follows from the same annular division by
\((-\Delta)^2\) as in E57. The weighted tail at \(s\)
is summable and the weighted integrated term at \(s+2<4\)
is \(O(\ell)\). The low block is bounded by continuity.
This verifies exactly
\(\lim_{\ell\downarrow0}E_\ell(Z)=\|U_{\rm in}\|_{\mathcal B^s}\)
with the supremum taken inside the block sum.
With \(\epsilon\leq R/(4C_L)\) there is a strict initial
margin to the critical uniqueness radius. The restriction
of E60's fixed point also lies in this ball.
In E42's norm the gradient term of \(Z\) is at most
\(C\sqrt{\ell}\sup_{[0,\ell]}|DZ|\), using the volume
bound for both anchored cylinders. Its value sup tends
to \(\|U_{\rm in}\|_\infty\). The lift belongs to the
closed-slab smooth completion. Shrinking \(\epsilon\)
to keep \(C_{\rm emb}\epsilon\) below the E42 data threshold
and strictly within its uniqueness radius gives the
other margin as well. Restricting E42's solution to the
shorter anchored interval preserves its ball and
completion by monotonicity. Thus both uniqueness
statements identify their respective paths with the
same \(Z\) on a nonzero initial interval.

The zero E42 datum is stationary, since the full equation
vanishes as checked above. Its E42 Lipschitz estimate
against that datum gives
\(\|V\|_{C^0}\leq C_{42}C_{\rm emb}\epsilon\)
for the E42 comparator \(V\) on the common interval.
This lets \(\epsilon\) be decreased once to put both
paths in the same small convex tube. The choices
are fixed independently of the individual smooth
comparison interval. [E29, smooth construction][e29] ·
[E36, compatible correspondence][e36] · [E42, (6)–(8)][e42] ·
[E60, (7)][e60].

## Weak–smooth comparison on the remaining slab

Take \(t_*>0\) inside the initial agreement interval.
The comparator \(V\) is smooth on the closed slab
\([t_*,T]\) because \(T\leq T_{42}/2\).
Put \(w=U-V\). Expanding E60 (8) gives exactly
\[
 \tfrac12(P_U+P_V)D_0^2w+
 \tfrac12(P_U-P_V)(D_0^2U+D_0^2V),
 \qquad P_U=P(x,U),\quad P_V=P(x,V).
\]
The fixed \(P_0\) obeys the integrated Gårding form
\(\operatorname{Re}\langle P_0D_0w,D_0w\rangle_{L^2}
\geq\gamma\|D_0w\|_2^2-C_0\|w\|_2^2\)
by freezing and Plancherel using the rank-one symbol.
The averaged array \(\overline P=(P_U+P_V)/2\) differs
from \(P_0\) by at most \(\gamma/4\) in the operator
norm on all gradient arrays after one fixed tube reduction.
Thus replacing the array in this integrated form costs
at most \((\gamma/4)\|D_0w\|_2^2\).
This perturbation bound uses an array norm and requires
no pointwise positivity on general arrays.

Write \(p_U=\|D_0U\|_\infty\), \(a_U=\|D_0^2U\|_\infty\),
and similarly for \(V\). The integration by parts of
the first principal term gives the quadratic form
with \(\overline P\) and an additional term with
\(D_0\overline P\) bounded by \(C(1+p_U+p_V)\).
The latter pairs with \(w\) at cost
\(C(1+p_U+p_V)\|D_0w\|_2\|w\|_2\).
The second principal term costs
\(C(a_U+a_V)\|w\|_2^2\) since
\(|P_U-P_V|\leq C|w|\).
Subtracting the \(h_1\) gradient slot and both \(h_2\)
gradient slots at \(U\) gives the same cross bound.
Their coefficient differences at the \(V\) slots, and
the \(h_0\) difference, cost
\(C(1+p_V+p_V^2)\|w\|_2^2\).
Young's inequality absorbs at most another
\((\gamma/2)\|D_0w\|_2^2\). The remaining coefficient is
\[
 k(t)=C(1+p_U^2+p_V^2+a_U+a_V).
\]
It is time-integrable before comparison, by the critical
gradient and Hessian bounds and the smooth comparator
on this slab.

At almost every time the localized \(B^{5/2}_{8,1}\)
norm is finite. The second derivative block bounds
give a spatial \(C^2\) representative there, or the
\(W^{2,8}\) representative suffices for integration
by parts with spatially Lipschitz \(\overline P\).
Also (2) and the Bochner estimates give
\[
 \|U_t\|_{L^1_tL^2_x}
   \leq C\bigl(\|a_U\|_{L^1_t}
          +T+\sqrt T\,\|p_U\|_{L^2_t}+\|p_U\|_{L^2_t}^2\bigr)
\]
on the slab. The same property holds for smooth \(V\).
The distributional time derivative of \(w\) is thus
in \(L^1_tL^2_x\). The indefinite Bochner integral of
that derivative differs from \(w\) by a distributionally
constant \(L^2\) field, and continuity of \(w\) in \(L^2\)
fixes it by the initial trace at \(t_*\).
This proves absolute continuity in \(L^2\) and
the chain rule for \(\|w\|_2^2\).
The preceding estimates now give
\(\frac12(\|w\|_2^2)'+\frac{\gamma}{4}\|D_0w\|_2^2
  \leq k(t)\|w\|_2^2\) almost everywhere.
Since \(w(t_*)=0\), the integrating factor gives
\(w=0\) on the slab, and the initial equality gives
agreement throughout \([0,T]\).
This proves smooth-compatible identification without an
embedding between the two solution spaces.
[E60, (8)–(9)][e60] · [E57, fixed Gårding form][e57].

## Exact premise and scope

For \(H_{\rm crit}\) take \(T_{\rm crit}=T\),
\(\epsilon_{\rm crit}=\epsilon\), and
\(C_{\rm crit}=C_L/(1-q)\), using the fixed E57 atlas
at \(p=8,s=1/2\).
The constants are independent of the smooth compatible
datum, and the required strict condition \(\delta<\epsilon_{\rm crit}\)
is included in the proved threshold. The solution is the
native E36 pair, is identical to E42 throughout
\([0,T_{\rm crit}]\), is smooth through zero by the lift,
and is compatible with \(E_{T_{\rm crit}}\leq C_{\rm crit}\delta\).
A different fixed E59 atlas only requires the finite
overlap comparison in E57 (3), which is valid at both
orders with the blockwise placement of the time sup.
The independent-pair critical theorem has broader trace
data, while this audited identification uses smooth
compatible input. No new primary source or new evolution
claim is needed for this check.
[E62 request][hcrit] · [E60][e60].

[req]: ../research-progress/handoffs/SP4-CME-E64_REQUEST_v1.md
[hcrit]: ../research-progress/handoffs/SP4-CME-E62_REQUEST_v1.md
[e60]: ../notes/60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
[e57]: ../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e36]: ../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
