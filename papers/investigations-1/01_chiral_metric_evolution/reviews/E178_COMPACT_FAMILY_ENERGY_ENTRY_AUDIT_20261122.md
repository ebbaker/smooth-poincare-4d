# E178 Independent compact-family energy-entry audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E audit under B88, configured gpt-6.2-sol/ultra.
Independent runtime and lead-model attestation unavailable. I authored
the inherited E01A normalization, E50 round transfer, E76 smooth
recovery, E138 and E148 local interface, and E155/E157 pair work.
I audited E165 in E167 and E171 in E173. I did not author E174 or E177.
Those overlaps are disclosed because this is independent checking
of the new interface and energy combination, using the other
assessed theorems at their verified scope. No new primary work
was inspected and no numerics were used.

## Disposition

Pass of the fixed-family theorem and small-\(\Psi\) corollary.
The selectors, compatibility and compactness hypotheses, gradient,
strict smallness, topology, and fixed original splice all check.
No new premise has to be returned to B88. There is a local
typesetting error in E177 (9): change `,qquad` to `,\qquad` at
integration. For clarity of notation there, call the round bundle
\(P_{\mathrm{rd}}\) so the symbol \(P_0\) is reserved for the
scalar transport bound. The frozen E177 note is preserved.
[E177](../notes/177_COMPACT_FAMILY_DEFECT_ENERGY_ENTRY_20261122.md).

## Family quantifiers, geometry, and positive pair convergence

Fix \(M,P,P_0,D_0\) as in E177, including \(0\le P_0<\infty\)
and \(0<D_0<\infty\). The relevant family consists only of
smooth definite connections on this fixed bundle and this
smooth oriented homotopy four-sphere, in native negative Killing
pairing/time and the positive-plane round-compatible sign.
It is constrained by the initial uniform \(\Psi\) and diameter
bounds. If it is empty the universal claim is vacuous for any
positive threshold. Otherwise, the negation of the threshold
assertion gives, for every \(n\), a datum in the same family
with \(\mathcal E(A_n)<1/n\) failing the entire asserted property,
including the conclusion concerning the base. The proof may then
use a subsequence, because every member was assumed bad. Producing
one good subsequence contradicts this quantified negation.
There is no need to prescribe the subsequential reference or its
time before choosing this bad sequence.

With \(k^2=4\pi/5\) and \(C=(1+4\sqrt3)/k^2\), the local transport
comparison gives \(\mathcal G_n\le B=CP_0\), so
\(\sup(|T_n|+|\nabla^{A_n}T_n|)\le\sqrt B+B\).
The chiral block estimate in native units has scalar target \(6\)
and gives \(Z_0=\sqrt6/2+(42+8\sqrt3)B\), using only
\(|Q-I|^2=\operatorname{tr}Q^2-3\le6\) for the positive trace-three
matrix. In the ordinary self-dual endomorphism norm
\(|W^+|\le Z_0\), \(|\operatorname{Ric}_0|\le2Z_0\), and
\(|s-6|\le4\sqrt3 Z_0\). With \(|g|_g=2\) these give
\(|\operatorname{Ric}|\le3+(2+2\sqrt3)Z_0\) in the full symmetric
tensor norm. The estimates hold at \(P_0=0\), with \(B=0\).
Indeed the assessed small-strain statement also gives \(Q=I\)
there. Such data are already perfect and stationary, and the
round argument below applies to the datum itself in this edge case.
The proof of the family assertion does not divide by \(P_0\) or
assume a common positive eigenvalue floor.
[Geometric assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md).

On any connection on \(P\) the real four-form is
\(\mu_A=\langle F_A\wedge F_A\rangle/3\). Along a smooth
affine path, \(\dot F_A=d_Aa\) and invariant pairing with
Bianchi give \(\dot\mu_A=(2/3)d\langle a\wedge F_A\rangle\).
The affine path between two smooth connections need not stay
definite, since these formulas have no metric reconstruction in
them. Hence the integral is the same across all initial data.
On a member of the definite family the trace-three Gram identity
makes \(\mu_A=dV_{g_A}\). For the characteristic coefficient,
\(\operatorname{ad}e_i=e_i\times\cdot/\sqrt2\) in a native
orthonormal frame, so
\(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_i\operatorname{ad}e_j)
=-\delta_{ij}\). Thus the real Pontryagin form
\(-\operatorname{tr}(\operatorname{ad}F_A\wedge\operatorname{ad}F_A)/(8\pi^2)\)
is \(3\mu_A/(8\pi^2)\). The common volume is therefore
\(v_P=(8\pi^2/3)\langle p_1(E),[M]\rangle>0\) for a
nonempty definite family. This is also the precise reason
\(v_P\le0\) excludes such data.
[E01C normalization](E01C_AUDIT_20261122.md).

The assessed metric theorem applies to this fixed smooth base
with the displayed absolute Ricci and plus Weyl bounds, positive
common volume, and supplied diameter bound. Its normalizers
are smooth orientation-preserving diffeomorphisms of \(M\),
with strong positive \(C^{1,1/4}\) metric convergence. The
pair theorem takes the resulting \(C^1\) convergence and the
bounded live strain and full derivative, and uses the homotopy
sphere's simple connectivity and \(H^2(M;\mathbb R)=0\) for the
topological case. Its lifts are global. Concretely, the
positive tangent metric comparison induces
\(J_n:\Lambda^+_{g_b}\to\Lambda^+_{\varphi_n^*g_n}\)
as an oriented isometry. The normalized polar isometry
\(\widetilde\sigma_n:\varphi_n^*E\to
\Lambda^+_{\varphi_n^*g_n}\) and the fixed \(\sigma_b\)
give \(\widetilde\sigma_n^{-1}J_n\sigma_b:E\to\varphi_n^*E\).
On oriented adjoint frames this gives the required bundle
isomorphism over \(\varphi_n\). The pair theorem supplies
uniform convergence in a fixed affine background and a
positive limiting curvature in the same component. In that
background the affine curvature formula has uniform right
side convergence and distributional exterior derivative
convergence, yielding \(F_*=F_{A_*}\). These statements use
only the bounded initial family. No high regularity or
roundness of the unscaled metric limit enters.
[Metric assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md).
[Pair assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md).

## Fixed reference and each original head

Use the common original-lifespan part of E148, which applies
to arbitrary smooth compatible data in the chosen reference
ball. It does not require a supplied earlier original solution
for this use. Positivity, compatibility, and compactness of
the continuous graph give a closed positive tube and comparison
constants. The coupled closed-curvature symbol parameter and
the graph rank-one margin are fixed on the tube before the
reference. With the E148 notation one may take
\[
 r_{\mathrm{data}}=\min\{\epsilon/2,\rho_{\mathrm{gr}}/(2L_0),
                                          R/(4L_0)\}>0 .
\]
Here \(L_0\) converts pair sup norms and \(R\) is the radius
of the completed-space ball. E38 then gives
a single smooth compatible reference within one quarter of both
the tube and datum radii. Its time \(T_{\mathrm{ref}}\) may depend
on its derivatives; it need not be stationary. Now the limit
and all sufficiently late normalized data fit in that same
ball, with one adjusted slab. This ordering is essential:
choosing derivatives first would not give the radius used
for the compatible approximation.
[E148 common-lifespan lemma](../notes/148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md).
[Uniform local assessment](E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md).

E148's continuity paragraph supplies smooth convergence of
the adjusted compatible pairs on each compact interior
positive-time strip. For each smooth approximant separately,
the graph construction stays in the open graph parabolic
region of its initial jet, and the graph lift and completed
ball uniqueness identify it with the adjusted path through
zero. That comparison length can depend on the individual
datum. Smoothness on the rest of the slab is already part of
the adjusted theorem. Therefore for fixed
\(\theta=3T_{\mathrm{ref}}/4\), the invariant vector field
\(\xi_n\) is smooth on \([0,\theta]\) for every such \(n\).
The principal bundle is compact, so each ODE
\(j'_n=-\xi_n\circ j_n\), \(j_n(0)=\mathrm{id}\), exists on
that common closed interval and gives smooth equivariant
orientation-preserving maps. The base orientation follows
from the identity-start isotopy. No derivative bounds on
the collection of \(j_n\)'s are needed for this argument.

The pullback derivative is
\[
 \partial_s(j_n^*\mathcal A_n)=
 j_n^*(\partial_s\mathcal A_n-\mathcal L_{\xi_n}\mathcal A_n)
      =V(j_n^*\mathcal A_n).
\]
It starts at \(h_n^*A_n\). Undoing the fixed normalizer on the
right of the composite map gives (6):
\[
 A_n^{\mathrm{loc}}(s)=(h_n^{-1})^*j_n(s)^*\mathcal A_n(s)
                    =(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s).
\]
The domain and target of both \(j_n,h_n\) are \(P\). The
composition gives \(A_n^{\mathrm{loc}}(0)=A_n\) by contravariance.
The native clock is unchanged. The argument uses no recovery
through zero from the merely continuous limiting pair. It
uses the limiting adjusted solution only in the interior.

## Gradient, invariant dissipation, and the smooth perfect limit

In native units, trace three and the common volume give
\(\mathcal E(A)=\int\operatorname{tr}(Q^2)\mu_A-3v_P\).
At a variation of the connection with velocity \(a\), use an
internal orthonormal frame independent of the variation and
differentiate \(Q_{ij}\mu_A=F_i\wedge F_j\).
Contraction by \(2Q_{ij}\) produces
\(4\sum_{i,j}Q_{ij}(d_Aa)_i\wedge F_j
-2\operatorname{tr}(Q^2)\dot\mu_A\).
The differentiated volume adds one
\(\operatorname{tr}(Q^2)\dot\mu_A\). With
\(\dot\mu_A=(2/3)\langle d_Aa\wedge F_A\rangle\), the
wedge factor in the variation is
\((4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A\).
It is self-dual in the live metric, so the wedge integral
is exactly the ordinary two-form \(L^2(\mu_A)\) pairing.
Formal adjunction has the positive sign on a closed base,
and its application to this second factor gives the gradient
in the native one-form \(L^2(\mu_A)\) norm. In the coefficient
\[
 4Q-\tfrac23\operatorname{tr}(Q^2)I
     =2I+4q-\tfrac23|q|^2I,
\]
the constant term drops out by \(d_A^{*g}F_A=0\), the
self-dual Bianchi consequence. The original native velocity
is the negative gradient, namely
\(-4d_A^{*g}[(q-|q|^2I/6)F_A]\).
Thus the dissipation is precisely
\(-\int|\partial_s A|_g^2\,dV_g\), with unit coefficient.
Equivalently the old calibrated energy doubles in the native
pairing, while \(g=c\widehat g\) and \(s=ct\), \(c=2K\).
The squared velocity integrand and integrated metric volume
together scale by \(2c^{-1}c^{-2}c^2=2/c\), the same factor
as the native energy derivative relative to the old one.

The curvature polar construction pulls back naturally by the
equivariant, orientation-preserving maps, taking \(Q\) to its
base pullback conjugated by an internal isometry, and pulling
back \(\mu_A\). Hence \(\mathcal E\) is unchanged under each
map in (6), even though the map varies with \(s\). Its
monotone bound (9) on each original head transfers at each
time to its adjusted counterpart. At fixed
\(s_0=T_{\mathrm{ref}}/2\in(0,\theta)\), the limiting adjusted
pair is smooth and definite. Its local \(Q\) and volume form
depend smoothly on curvature in the definite range. Convergence
at this interior slice on the compact base gives convergence
of the energies, so the limiting energy is zero. The same
reasoning works on each fixed interior slice. Positive volume
and the smooth nonnegative integrand imply pointwise perfection.
The proof needed \(\mathcal E(A_n)\to0\) only in passing the
scalar energy limit, with no assumed initial \(\sup|q_n|\)
smallness.

## Round identification, original splice, and fixed limit

At the smooth perfect connection \(A^\dagger\), \(Q=I\) and
\(T=0\). The compatibility estimate identifies it with the
chiral Levi–Civita connection under
\(\sigma^\dagger=-F_{A^\dagger}^\sharp\).
Then \(F_{\Gamma^+}+\sigma^\dagger=0\) in the native
block identity, so \(W^+=0\), \(\operatorname{Ric}_0=0\)
and \(s=6\). The signature formula with the ordinary
Hilbert–Schmidt block norms has coefficient \(12\pi^2\)
on \(\operatorname{sign}(M)=0\), since the middle cohomology
vanishes. Thus \(W^-=0\), and the full curvature operator is
\(I/2\). This is the signature normalization already checked in
E01C. [E01C signature and development](E01C_AUDIT_20261122.md).

The polar metric from the constant-curvature Jacobi equation
is \(dr^2+2\sin^2(r/\sqrt2)g_{S^3}\) in small normal balls.
It gives positive local isometries to the round sphere of radius
\(\sqrt2\). A transition on a connected overlap is the restriction
of the unique sphere rotation with the same value and oriented
frame at one point, by local isometry uniqueness and continuation
within the overlap. Uniqueness on open pieces supplies the
cocycle in the development. Continuation along paths is
independent of homotopy by a chart subdivision, as in the
inherited E01C method. The simply connected base gives a single
valued map \(f\). It is a local isometry and its image is open
and closed by compactness, hence onto. The proper local
diffeomorphism is a covering. Connectedness and simple
connectivity of the target give one sheet. The resulting
orientation-preserving isometry is an actual smooth
diffeomorphism from \(M\) to standard \(S^4\).
Schoen–Yau supplies the previously inspected conformal development
method in E01C. The isometric transitions here follow from the
Jacobi formula and uniqueness, without a new source hypothesis.

The adjoint fiber map (10) is well typed: \(\sigma_x^\dagger\)
lands in the source positive two-forms,
\(((df_x)^{-1})^*\) sends them to the target positive two-forms,
and \((\sigma_0)_{f(x)}^{-1}\) lands in \((E_0)_{f(x)}\).
All are oriented isometries. The adjoint representation
identifies \(SO(3)\) with the oriented orthonormal-frame
group of its native model and hence identifies \(P,P_0\)
with their adjoint frame bundles. The fiber map induces the
smooth equivariant \(\Phi:P\to P_0\) over \(f\).
Naturality of the chiral Levi–Civita connection under \(f\)
and faithfulness of the adjoint action give
\(\Phi^*A_0=A^\dagger\) and the matching curvature pullback.

Because \(\Phi\) is fixed after the limit is chosen,
\((\Phi^{-1})^*(\mathcal A_n(s_0),\mathcal F_n(s_0))\)
converges smoothly to \((A_0,F_0)\) on \(P_0\).
The prescribed basin asks for small \(C^0\) of both
connection and curvature in that fixed round reference.
Every sufficiently late datum there is smooth and curvature
compatible. The E49–E52 basin supplies the global original
solution \(B_n(t)\), \(t\ge0\). For the fixed map
\(L_n=\Phi\circ j_n(s_0)\circ h_n^{-1}:P\to P_0\),
\[
 L_n^*B_n(0)
    =(\Phi^{-1}\circ L_n)^*\mathcal A_n(s_0)
    =(j_n(s_0)\circ h_n^{-1})^*\mathcal A_n(s_0).
\]
This is the actual head value at the splice time. Time
independence of \(L_n\) and original naturality
give the original tail \(L_n^*B_n(s-s_0)\). Smooth original
uniqueness, recentered at any common smooth endpoint, gives
equality on the overlap \([s_0,\theta]\). In particular the
glued smooth global solution lies in its original identification,
and the actual pair at \(s_0\) is identified with the basin
by \(L_n\). The E76/E77 fixed smooth round limit
\(b_{n,\infty}^*(A_0,F_0)\) becomes
\((b_{n,\infty}\circ L_n)^*(A_0,F_0)\). A fixed pullback for
each datum and the time translation preserve each
exponential rate with possibly different higher constants.
This proves the entire property for all sufficiently late
members of the purported bad sequence.
[Round basin assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md).
[Smooth limiting recovery](E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md).

## Small-\(\Psi\) corollary and scope

By assessed E171/E173, \(C\sup\Psi\le\varepsilon_{171}\)
implies \(|q|\le72C\sup\Psi\) and \(\operatorname{Ric}\ge(3/4)g\).
Along a unit-speed minimizing segment of length \(L>0\),
choose three parallel orthonormal normal vectors times
\(\sin(\pi t/L)\), with zero endpoint values. The sum of
the derivative integrals is \(3\pi^2/(2L)\), while the
curvature term is at least \((3/4)(L/2)=3L/8\) from
the Ricci inequality. Nonnegative total index gives
\(L^2\le4\pi^2\). The manifold is compact and every pair
is joined by a minimizing geodesic, so the diameter bound
is \(2\pi\) in native units.

The pointwise pinching and fixed volume give
\(\mathcal E(A)\le v_P(72C\sup\Psi)^2\).
With \(P_0=1\), \(D_0=2\pi\), a positive family threshold
\(\delta_0\), and \(v_P>0\), the threshold (12) is half
the minimum of \(1,\varepsilon_{171}/C,
\sqrt{\delta_0/v_P}/(72C)\). Thus \(\sup\Psi<\epsilon(M,P)\)
supplies the static threshold and both geometric bounds,
and gives \(\mathcal E(A)<\delta_0\) even with the stronger
margin from the factor \(1/2\). When \(v_P\le0\) the
corollary's definite class is empty, and \(v_P>0\) alone
need not imply nonemptiness. There is one dynamical proof
and one static corollary using the assessed pinching result.
[Small-strain assessment](E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md).

The parameter \(\delta(M,P,P_0,D_0)\) is a non-effective
threshold on a fixed family. The positive entry time in the
contradiction is common to a selected subsequence after its
reference is fixed; the proof gives no universal positive
entry time for the theorem's family. Higher constants may
depend on the datum. The theorem concerns initial energy and
initial geometric bounds for existing smooth definite data.
It asserts no initial pair orbit approximation and supplies
no initialization. E174 was used only as a template.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E178 request v1](../research-progress/handoffs/SP4-CME-E178_REQUEST_v1.md) | 520f441385e6d38198234ef7d3b8a17506fe67ce7efdc293c4bd4bffb6a9a001 |
| [E177](../notes/177_COMPACT_FAMILY_DEFECT_ENERGY_ENTRY_20261122.md) | 1df79e8cc4397dccd9760acc57a68a36c352866e44f1976aadec09f4c0654d0a |
| [B88](../brainstorm/notes/B88_COMPACT_FAMILY_DEFECT_ENERGY_GAP_20261122.md) | da91bb21677d7e41a2cd21386ce52bedd361b9207a25a066663f617250f5e0cd |
| [E174 template](../notes/174_CONDITIONAL_INTRINSIC_SMALL_STRAIN_ROUND_ENTRY_20261122.md) | aa3fc40ff05bf3cc2abc5c0862176301915efb52a667e2a7bd7f7428ffd54e56 |
| [E171/E173 assessment](E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) | f8a1e2e86f0fdcd0d7b29ad915e6a249d6caed13d753befd140920a22cd12a9d |
| [E168/E169 assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) | 6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f |
| [E157–E159 assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E148](../notes/148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md) | 526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894 |
| [E138–E143 assessment](E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md) | 10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e |
| [E49–E52 assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E76/E77 assessment](E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md) | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |
| [E01C](E01C_AUDIT_20261122.md) | 9b725bd3e3d56248a7276dadf712deb976518210bc9596f309ed42f0df28f0ca |
