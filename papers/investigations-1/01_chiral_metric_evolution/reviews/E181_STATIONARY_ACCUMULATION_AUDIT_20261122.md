# E181 Independent stationary-accumulation audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E audit under B89, configured gpt-6.2-sol/ultra.
Independent runtime and lead-model attestation unavailable. I authored
inherited E01A normalization, E50/E76 round transfer and recovery,
E138/E148 local and sequential arguments, and E155/E157 pair work.
I audited E165 in E167 and the separate initial-energy theorem in E178.
I did not author E179 or the E174/E176 argument. The new late-sequence
and limiting-energy combination is checked here. E177 is not a premise.

## Disposition

Pass. The two bounds along one selected sequence exclude a finite
maximal time and give smooth normalized accumulation at shifted
times on the infinite actual trajectory. The accumulated connection
is critical for the original native energy at exactly the limiting
trajectory energy. Constant limiting adjusted energy forces
\(V=0\) by the invariant energy variation, leaving a possible Lie
derivative in the adjusted equation. At zero limiting energy the
smooth limit is perfect, identifies the actual smooth base with
standard \(S^4\), and gives one original round-basin tail and fixed
limiting pullback. At positive energy the conclusion is only a
nonperfect critical accumulation pair. No mathematical repair or
additional premise is needed.
[E179](../notes/179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md).

## Finite-time exclusion and unshifted compactness

The argument starts with one supplied maximal smooth original
native solution on the fixed smooth principal \(SO(3)\) bundle over
the closed connected oriented smooth homotopy four-sphere. Positive
curvature planes and the round-compatible component hold throughout.
The sequence in (1) supplies simultaneous bounds on \(\sup_M\Psi\)
and the live diameter at the same times, with \(t_n\uparrow T_*\).
For \(T_*<\infty\) this is exactly the assessed two-bound continuation
criterion. It extends the smooth definite solution in the original
identification, contradicting maximality. This argument has no
hypothesis on the intervals between the selected times.
[Metric and two-bound assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md).

For \(T_*=\infty\), at the unshifted slices put
\(k^2=4\pi/5\), \(B=(1+4\sqrt3)P_0/k^2\), and
\(Z_0=\sqrt6/2+(42+8\sqrt3)B\). The assessed local density
comparison gives \(\mathcal G\le B\) and the uniform
\(|T|+|\nabla^AT|\le\sqrt B+B\). Positivity and \(\operatorname{tr}Q=3\)
give \(|q|^2=\operatorname{tr}(Q^2)-3\le6\). The native chiral
block bound then gives \(|W^+|_{\mathrm{op,HS}}\le Z_0\),
\(|\operatorname{Ric}_0|\le2Z_0\), and
\(|s-6|\le4\sqrt3Z_0\). The trace contribution to the absolute
Ricci norm is \(|(s/4)g|=|s|/2\), so
\(|\operatorname{Ric}|\le3+(2+2\sqrt3)Z_0\).
No lower bound on the least eigenvalue was used.

In the native pairing the Gram trace gives
\(dV_g=\mu_A=\langle F_A\wedge F_A\rangle/3\).
Bianchi and \(\delta F_A=d_Aa\) give
\(\delta\mu_A=(2/3)d\langle a\wedge F_A\rangle\);
Stokes fixes its integral at the positive initial value.
The stated characteristic coefficient is correct because
\(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_i
\operatorname{ad}e_j)=-\delta_{ij}\) in the native frame,
giving \(p_1(E)=3[\mu_A]/(8\pi^2)\). Thus the fixed positive
volume, absolute Ricci/positive Weyl estimates and diameter
meet the fixed-base metric theorem's hypotheses.
[Native and pair assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md).

The metric theorem gives a positive \(C^{1,1/4}\) limit after
smooth orientation-preserving diffeomorphisms \(\varphi_n\) of
the same \(M\). The ensuing strong \(C^1\) convergence,
full strain bounds and simple connectivity with
\(H^2(M;\mathbb R)=0\) give the assessed topological case of
the pair theorem. Its lifts are global. In its construction
the tangent metric comparison gives the oriented isometry
\(J_n:\Lambda^+_{g_b}\to\Lambda^+_{\varphi_n^*g_{A(t_n)}}\).
The pulled-back polar isometry
\(\widetilde\sigma_n:\varphi_n^*E\to
\Lambda^+_{\varphi_n^*g_{A(t_n)}}\) then gives
\(\widetilde\sigma_n^{-1}J_n\sigma_b:E\to\varphi_n^*E\)
in one fixed adapted frame background. Its \(SO(3)\) frame
map gives a smooth equivariant \(h_n:P\to P\) over \(\varphi_n\).
The assessed pair limit is positive, continuous and in the
same sign component. Compatibility also follows directly:
write the normalized connection difference \(a_n\) from a
fixed smooth affine origin \(A_b\). Then
\[
 d_{A_b}a_n=\widetilde F_n-F_{A_b}
                          -\tfrac12[a_n\wedge a_n]
\]
passes to distributions by uniform convergence of both
pair values. No smoothness of the limiting metric in
this unsmoothed atlas enters.

## Fixed reference and the actual shifted trajectory

Following E148, choose a compact positive tube around the
continuous compatible limiting graph in the fixed background.
Its value comparisons, native symbol margins and common
admissible parameter give the uniform adjusted datum and
completion radii and the smooth graph comparison radius.
Choose one smooth compatible approximation to the limiting
pair strictly inside both the tube and common datum radii
using the assessed compatible approximation. Only then
fix its derivative-dependent \(T_{\mathrm{ref}}>0\).
The limiting pair and sufficiently late normalized inputs
fit in this same reference ball. The reference need not
be stationary. This is the common-lifespan part of E148,
used for an entire smooth sequence and its compatible
continuous limit in the adjusted equation. Smooth
positive-time convergence on compact interior strips
is part of that assessed result.
[E148 common-lifespan construction](../notes/148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md).
[Uniform local assessment](E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md).

For each individual smooth datum, the graph comparison
through \(s=0\) identifies its short smooth compatible
graph lift with the adjusted path in the completed ball.
The comparison at zero may have a different length for
each datum. Together with interior smoothness this makes
its recovery generator \(\xi_n\) smooth throughout the
closed interval \([0,\theta]\), \(\theta=3T_{\mathrm{ref}}/4\).
The compact principal bundle supports the smooth
equivariant flow of the time-dependent vector field
\(-\xi_n\) individually on that interval, starting at
the identity. Thus \(j_n^*\mathcal A_n\) solves the
original equation, because the pullback derivative
subtracts the Lie transport. Orientation is preserved on
the base by isotopy. The recovered solution starts at
\(h_n^*A(t_n)\), and the pullback by the fixed \(h_n^{-1}\)
gives the actual initial value of the shifted original path.

To identify the whole slab, compare the two smooth original
solutions with common initial value \(A(t_n)\). They agree on
a nonempty initial interval by smooth original uniqueness.
A finite last agreement time before \(\theta\) would be a
common smooth slice, where uniqueness recentered there
extends the agreement. Both paths exist on the whole
interval, since the supplied trajectory is now known to
be infinite. They therefore agree through \(\theta\),
including its endpoint by continuity. The exact relation
is
\[
 A(t_n+s)=(h_n^{-1})^*j_n(s)^*\mathcal A_n(s)
         =(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s).
\]
Curvature obeys the same relation by naturality. There is
no supplied bound on the shifted slices or intervening
times. No common derivative estimates on the recovering
or normalizing maps are required.

## Limiting energy and stationary original velocity

For each smooth positive native slice,
\(\mathcal E=\int\operatorname{tr}(Q^2)\mu_A-3v_P\).
Varying \(Q_{ij}\mu_A=F_i\wedge F_j\) and contracting
by \(2Q_{ij}\) gives the \(4Q\) coefficient of
\(\langle d_Aa\wedge F_A\rangle\) and subtracts
\(2\operatorname{tr}(Q^2)\dot\mu_A\). The derivative of
the remaining volume factor adds one
\(\operatorname{tr}(Q^2)\dot\mu_A\). Using the volume
variation leaves the second wedge factor
\((4Q-\tfrac23\operatorname{tr}(Q^2)I)F_A\).
It is self-dual. Ordinary form norms and integration
by parts on the closed base give the native gradient,
with unit coefficient in the ordinary one-form
\(L^2(\mu_A)\) pairing. Since
\(4Q-\tfrac23\operatorname{tr}(Q^2)I=2I+4q-\tfrac23|q|^2I\)
and \(d_A^{*g}F_A=0\) by Bianchi and self-duality,
\[
 V(A)=-4d_A^{*g}[(q-|q|^2I/6)F_A],\qquad
 D\mathcal E_A[V(A)]=-\int_M|V(A)|_g^2\,dV_g .
\]
This second identity is a directional statement at any smooth
slice. Its use does not require that the slice be presented
as part of an original solution.
[Assessed native energy identity](E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md).

On the actual original path this supplies nonincreasing
energy with finite nonnegative limit \(\mathcal E_\infty\).
A smooth equivariant map covering an orientation-preserving
base diffeomorphism conjugates the pulled-back \(Q\) by an
internal isometry and pulls back \(\mu_A\). The energy is
therefore invariant, even when such maps are chosen separately
at each time. The equality of actual and adjusted energies
on \([0,\theta]\) gives
\[
 0\le \mathcal E(\mathcal A_n(s))-\mathcal E_\infty
      \le\mathcal E(A(t_n))-\mathcal E_\infty\longrightarrow0 .
\]
This is uniform in the comparison time \(s\).
Smooth positive-time pair convergence on compact interior
strips passes the energy to the limiting adjusted solution:
the reconstructed volume and \(Q\) are smooth functions of
the positive curvature values, and the base is compact.
Thus the smooth limit path has constant energy
\(\mathcal E_\infty\) on \(0<s<\theta\).

For the crucial infinitesimal step, fix a single \(s\) strictly
inside that interval. The adjusted limit is then a smooth
compatible solution in the same value range, so its
\(\xi_*(s)\) is a smooth invariant vector field on \(P\).
In the E148 formula, the vertical term is the equivariant
section associated to \(-\phi\), and the horizontal term
is the negative horizontal lift of the smooth base vector
field \(z\). Each term is invariant under right
\(SO(3)\) translations. Freeze \(s\), and let \(\chi_\rho\)
be the autonomous flow of \(+\xi_*(s)\), starting at the
identity. Existence for small positive and negative \(\rho\)
holds smoothly on the compact bundle. Equivariance follows
because right translation carries its ODE to the same ODE
with translated initial point. The maps descend to a smooth
identity-start base isotopy and preserve the base orientation.
They also preserve definiteness and sign by naturality.

The family \(\rho\mapsto\chi_\rho^*\mathcal A_*(s)\)
is a differentiable variation of smooth connections in the
definite component, with derivative
\(\mathcal L_{\xi_*(s)}\mathcal A_*(s)\) at zero. The local
energy integrand is smooth in the curvature on this open
component, so the chain rule, or smooth differentiation of
its integral, gives
\(D\mathcal E(\mathcal L_{\xi_*}\mathcal A_*)=0\)
from pointwise-in-\(\rho\) invariance. This is an autonomous
flow at the fixed positive slice. It does not recover the
continuous trace at \(s=0\).

The adjusted equation is
\(\partial_s\mathcal A_*=V(\mathcal A_*)+
\mathcal L_{\xi_*}\mathcal A_*\). The limiting constant energy,
the two directional identities, and positive volume now give
\[
 0=\partial_s\mathcal E(\mathcal A_*)
   =-\int_M|V(\mathcal A_*)|^2\,dV_{g_{\mathcal A_*}}.
\]
The smooth velocity vanishes pointwise. This conclusion is
original criticality, while the adjusted representative can
still move by the Lie term. At \(s_0=T_{\mathrm{ref}}/2\),
the exact critical equation of \(A^\dagger=\mathcal A_*(s_0)\) is
\[
 d_{A^\dagger}^{*g_{A^\dagger}}
  [(q^\dagger-|q^\dagger|^2 I/6)F_{A^\dagger}]=0.
\]
The pair is smooth, compatible, positive and of the same
sign. Its energy is \(\mathcal E_\infty\).

Let \(G_n=j_n(s_0)\circ h_n^{-1}\), a map \(P\to P\).
Its inverse \(K_n=h_n\circ j_n(s_0)^{-1}\) gives
\(K_n^*G_n^*=(G_n\circ K_n)^*=\mathrm{id}^*\).
Thus applying \(K_n^*\) to the actual shifted pair at
\(t_n+s_0\) gives exactly the adjusted pair at \(s_0\),
which converges smoothly on the same bundle in the fixed
background. No convergence of \(K_n\) or of its derivative
is needed. If \(\mathcal E_\infty>0\), the limit has nonzero
defect energy, so is nonperfect. This is a critical
accumulation pair with no conclusion of uniqueness or
full positive-energy trajectory convergence.

## Zero energy and a single fixed original tail

At \(\mathcal E_\infty=0\) the smooth nonnegative defect
density vanishes, so \(Q^\dagger=I\) and \(T^\dagger=0\).
Compatibility identifies \(A^\dagger\) with the chiral
Levi–Civita connection under
\(\sigma^\dagger=-F_{A^\dagger}^{\sharp}\).
The native local chiral identity then gives \(W^+=0\),
\(\operatorname{Ric}_0=0\) and scalar curvature \(6\).
The assessed signature formula has coefficient \(12\pi^2\)
for the ordinary Hilbert–Schmidt chiral-block norms.
The zero intersection form makes the signature zero,
and \(W^+=0\) forces \(W^-=0\) by nonnegativity and
smoothness. Thus sectional curvature is \(1/2\).
This argument concerns the smooth positive-time pair.
It uses neither the raw limit's regularity nor E177.
[Assessed perfect-pair identification](E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md).
[E176 independent interface audit](E176_INTRINSIC_ROUND_ENTRY_AUDIT_20261122.md).

The local polar metric from the Jacobi equation is
\(dr^2+2\sin^2(r/\sqrt2)g_{S^3}\). Orientation-preserving
local isometries to \(S^4_{\sqrt2}\) therefore have
transitions extending uniquely to sphere rotations
on each connected overlap. They give a cocycle by
uniqueness from the value and the oriented frame.
Development along paths and simple connectivity give
one local isometry \(f\) on \(M\). Its image is open
and closed by local invertibility and compactness.
The map is a proper covering of the sphere; connectedness
and simple connectivity of the target give degree one.
This is an orientation-preserving smooth round isometry.
It is the assessed constant-curvature use of the
inherited development argument.

The forward map over \(f\) on positive two-forms is
\(((df_x)^{-1})^*\). Hence
\((\sigma_0)_{f(x)}^{-1}((df_x)^{-1})^*\sigma_x^\dagger\)
is an oriented isometry from \(E_x\) to the round adjoint
fiber at \(f(x)\). The faithful \(SO(3)\) adjoint-frame
representation gives the smooth equivariant
\(\Phi:P\to P_{\mathrm{rd}}\). Chiral connection naturality
and its polar identification give
\(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\).

The transfer \((\Phi^{-1})^*K_n^*\) of the actual pair at
\(t_n+s_0\) lies in the fixed round connection-and-curvature
\(C^0\) basin for all sufficiently late \(n\). Choose
one such \(n\), set \(t_b=t_n+s_0\), and let \(B(u)\)
be the assessed original round-basin solution from the
transferred smooth compatible datum. The fixed inverse
transfer is pullback by \(L=\Phi\circ K_n^{-1}:P\to
P_{\mathrm{rd}}\). Indeed
\((\Phi^{-1})^*K_n^*=(K_n\circ\Phi^{-1})^*=(L^{-1})^*\).
Thus \(L^*B(t-t_b)\) is an original solution and has
initial value \(A(t_b)\). Local original uniqueness
recentered at a putative finite last agreement slice
identifies the entire common tail. The actual trajectory
therefore converges smoothly and exponentially to
\((b_\infty\circ L)^*(A_0,F_0)\), where the round-basin
recovery limit \(b_\infty\) is one fixed smooth
orientation-preserving equivariant automorphism. The
time translation and fixed pullback preserve the native
exponent with datum-dependent higher constants.
[Round-basin assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md).
[Smooth limiting recovery](E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md).

This audit makes no assertion about initial smallness,
rough zero-trace recovery, bounds between selected times,
or a classification of nonperfect critical connections.
No new source search, numerics or shared-file edit was used.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E181 request v1](../research-progress/handoffs/SP4-CME-E181_REQUEST_v1.md) | 9d23810382f67ed7eef11241d6253c0e66ecfd7ed0d2d8cff196017ac90ea798 |
| [E179](../notes/179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md) | 7bc0ab37b5b6a787159aaaede0aceed413306049925d965b92fbc3436f7bd5da |
| [B89](../brainstorm/notes/B89_BOUNDED_SEQUENCE_STATIONARY_LIMITS_20261122.md) | a7c7f8a15cb1409d8916fce1aeb3e8e0ad1115be5ca522433e9f53ff1dddfaad |
| [E174/E176 assessment](E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md) | 45c8c59dac557d65d10b029f1e495a8a7d93899613cc68e923a372ab1d831c3a |
| [E168/E169 assessment](E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) | 6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f |
| [E157–E159 assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E148](../notes/148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md) | 526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894 |
| [E138–E143 assessment](E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md) | 10909e6810beed40a4b87efd00f21637d1a6b12b102bc9f3d6b84648a7124f1e |
| [E49–E52 assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E76/E77 assessment](E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md) | c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1 |
| [E176 audit](E176_INTRINSIC_ROUND_ENTRY_AUDIT_20261122.md) | dc6f146209da5e206f17df685cadeb2df126935bb5014fbe8a4946e7bc7bdf6a |
