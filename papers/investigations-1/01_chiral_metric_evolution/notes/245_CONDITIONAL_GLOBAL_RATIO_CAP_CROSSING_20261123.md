# E245 Conditional crossing of closed and strict global ratio caps

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E implication under B112, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored the E235 local germ and E49 stability
argument and audited the earlier E240/E241 combination in E242.
The new argument below uses the supplied cap premise, the E241
conditional flow implication and the assessed basin. It consumes
no result from E243 or E244.

## Premise

Fix the standard smooth oriented round \(S^4\), its positive chiral
principal \(SO(3)\) bundle \(P\), its round-compatible perfect
connection \(A_{\rm rd}\) and curvature \(F_{\rm rd}\), and the
fixed point \(p\) and local identification of B112. Take the
following premise as conditional.

**\(H_{\rm cap}\).** For every sufficiently small \(\epsilon>0\)
there is a smooth connection \(A_\epsilon\) on \(P\) with
\[
 \|A_\epsilon-A_{\rm rd}\|_{C^0}
   +\|F_{A_\epsilon}-F_{\rm rd}\|_{C^0}\longrightarrow0
                      \qquad(\epsilon\downarrow0)
\]
in the fixed reference norms and with actual curvature. Its
global ratio supremum is \(r_\epsilon=1+\epsilon\), with a
unique maximizing point \(p\). Near \(p\) the connection
agrees with the E235 germ at \(r=r_\epsilon\), and its
directional derivative of \(\log\rho\) on the original
native velocity at \(p\) is \(1/2\).
[B112 static premise](../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md).

Uniform curvature closeness to the fixed round datum ensures
the requisite positive definite, round-compatible class for
sufficiently small \(\epsilon\). Indeed, in the fixed native
pairing the wedge Gram relative to the round volume is
uniformly close to \(I\). The same holds on each pointwise
curvature segment from \(F_{\rm rd}\) to \(F_{A_\epsilon}\),
so the Gram stays positive and the curvature-map orientation
sign cannot change. Thus the smoothness, sign, actual
curvature, uniform smallness and local germ required by
E241's \(H_{\rm cutoff}\) all follow from \(H_{\rm cap}\).
The additional information used here is the exact initial
global cap.

## Original flow and immediate exit from the closed cap

Fix one \(m\ge6\), for instance \(m=6\), in the assessed round
basin, using native time and the negative-Killing pairing with
fixed round background norms. For every sufficiently small
\(\epsilon\), the compatible smooth datum
\((A_\epsilon,F_{A_\epsilon})\) is in its strict fixed \(C^0\)
pair neighborhood. E241 and E49–E52 therefore give a global
smooth positive round-compatible original solution
\(A_\epsilon(t)\), with \(A_\epsilon(0)=A_\epsilon\).
The individual smooth comparison of the adjusted head
through \(t=0\) and its identity-start recovery give
\(\partial_t A_\epsilon(0)=V_{\rm n}(A_\epsilon)\) in the
original base and bundle identification. The neighborhood
threshold uses only small pair values.

The fixed common adjusted smoothing time \(\tau>0\) and exact
modulo-automorphism estimate are those of E50/E241. For its
local and stable recoveries \(g_{{\rm loc},\epsilon}\) and
\(g_{{\rm st},\epsilon}\), let
\(c_\epsilon=g_{{\rm loc},\epsilon}(\tau)\) and, for \(t\ge\tau\),
\[
 h_\epsilon(t)=g_{{\rm st},\epsilon}(t-\tau)^{-1}c_\epsilon^{-1}.
\]
With multiplication given by composition and
\(g\cdot A=(g^{-1})^*A\), this is the ordered inverse of
the tail recovery. In the fixed round norms it gives
\[
 \|h_\epsilon(t)\cdot A_\epsilon(t)-A_{\rm rd}\|_{H^m}
 \le C_m e^{-\alpha(t-\tau)}
          \|\widehat A_\epsilon(\tau)-A_{\rm rd}\|_{H^m},
 \qquad \alpha=\lambda_1(G_0)/2>0,\qquad t\ge\tau .
\]
Here \(\widehat A_\epsilon\) is the adjusted head and \(G_0\)
is the assessed stable round linear operator. The estimate
compares along time-dependent smooth bundle automorphisms.
[E241 conditional implication](241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md) ·
[E49–E52 round-basin assessment](../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md).

Let \(p_\epsilon(t)\) be E241's continuing strict local
maximum in the original identification, with \(p_\epsilon(0)=p\).
Set
\[
 u_\epsilon(t)=\log\rho\bigl(Q(A_\epsilon(t))(p_\epsilon(t))\bigr),
 \qquad
 M_\epsilon(t)=\sup_{x\in S^4}\rho\bigl(Q(A_\epsilon(t))(x)\bigr).
\]
The derivative of \(u_\epsilon\) at zero is \(1/2\). The
term from the spatial motion of \(p_\epsilon(t)\) vanishes
by spatial criticality. The native initial flow derivative
is the one stipulated in \(H_{\rm cap}\). For this smooth
datum, after shortening its positive interval to some
\(\eta_\epsilon>0\), continuity yields
\(u_\epsilon'(t)\ge1/4\) on \(0\le t\le\eta_\epsilon\).
Since \(u_\epsilon(0)=\log r_\epsilon\), integration gives
\[
 M_\epsilon(t)\ \ge\ e^{u_\epsilon(t)}
                \ \ge\ r_\epsilon e^{t/4}
                \ >\ r_\epsilon
             \qquad (0<t\le\eta_\epsilon).
\]
By \(H_{\rm cap}\), \(M_\epsilon(0)=r_\epsilon\). Thus for
every sufficiently small \(\epsilon\) the original flow
leaves the closed class \(\sup\rho\le1+\epsilon\) at every
sufficiently small positive native time for that datum.
The point used after zero is a local maximum, which
suffices for the displayed lower bound on the supremum.
[E241 local maximum branch](241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md).

## Strict caps accumulating at one

For each fixed datum, \(M_\epsilon(t)\) is continuous at
zero. The smooth positive \(Q\) on every compact initial
time slab has a positive minimum eigenvalue on that slab.
The extreme eigenvalues are continuous, including through
multiplicities, by the Rayleigh quotients. This gives uniform
continuity of \(\rho(Q(t,x))\) on the slab, and
\[
 |M_\epsilon(t)-M_\epsilon(s)|
  \le\sup_x|\rho(Q(t,x))-\rho(Q(s,x))|
\]
gives the claim. This argument only uses the one trajectory
at a time.

Pick \(\epsilon_*>0\) small enough for the above application
and set \(\epsilon_n=\epsilon_*4^{-n}\), \(n\ge1\).
For each \(n\), choose an individual
\(0<t_n<\min\{\eta_{\epsilon_n},2^{-n}\}\) small enough that
\(M_{\epsilon_n}(t_n)<1+2\epsilon_n\). Such times exist by
continuity and \(M_{\epsilon_n}(0)=1+\epsilon_n\).
Writing \(P_n=e^{u_{\epsilon_n}(t_n)}\), we have
\[
 1+\epsilon_n<P_n\le M_{\epsilon_n}(t_n)<1+2\epsilon_n .
\]
Take \(R_n=(1+\epsilon_n+P_n)/2\). Then
\[
 M_{\epsilon_n}(0)<R_n<M_{\epsilon_n}(t_n),\qquad
 1+\epsilon_n<R_n<1+2\epsilon_n.
\]
The intervals \((1+\epsilon_n,1+2\epsilon_n)\) are strictly
ordered downward because \(2\epsilon_{n+1}<\epsilon_n\).
Hence \(R_n\downarrow1\). These trajectories start strictly
inside their corresponding open global cap classes
\(\sup\rho<R_n\) and later exceed \(R_n\).
The selection gives strict thresholds arbitrarily close to
one. The time choices are individual and do not use any
continuity of the flows across the family.

## Invariance under bundle automorphisms

For a smooth orientation-preserving equivariant bundle
automorphism \(j\), let \(\bar j\) be its base diffeomorphism
and \(j_E(x):\operatorname{ad}P_x\to\operatorname{ad}P_{\bar j(x)}\)
its forward adjoint isometry. Curvature of the pullback
connection is \(j^*F_A\), with fiber components carried by
\(j_E(x)^{-1}\). Its wedge Gram numerator pulls back in
the base slots and conjugates in the internal slots.
The volume used for the trace-three quotient is one third
of the trace of that numerator, so it pulls back by
\(\bar j\). Division therefore gives
\[
 Q(j^*A)(x)=j_E(x)^{-1}Q(A)(\bar j(x))j_E(x).
\]
The ratio is composed with \(\bar j\), and surjectivity of
\(\bar j\) preserves its spatial supremum. Apply this
pointwise in time with \(j=h_\epsilon(t)^{-1}\), or with
any other smooth orientation-preserving time-dependent
automorphism. The cap crossing is unchanged by these
comparisons. The identity is algebraic at each slice.

## Scope and verified versions

The conclusion is conditional on \(H_{\rm cap}\) until
the separate static construction is assessed. It concerns
the supplied standard sphere and its near-round caps.
The strict selection concerns a sequence of thresholds,
and the crossing intervals depend on the data. The round
estimate is the stated modulo-automorphism Sobolev estimate.
The argument uses the existing basin, the local branch
and elementary compactness and pullback identities, with
no new source or parameter-dependent evolution theorem.

| Artifact | SHA-256 |
| --- | --- |
| [E245 request](../research-progress/handoffs/SP4-CME-E245_REQUEST_v1.md) | 7f74673dc27f3afadf1a6b7b34cf3deb53bae366b31eb8d62e5c2dee825cdf83 |
| [B112](../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) | 65f4bc96b23c11bae954d31e81d0dd5e377a1ef8a08ee49ec24407c8677fc037 |
| [E241 conditional implication](241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md) | fd11af9ac59082fc453b749cfd03ff7681dbb6f339c5827f7ce41a8a26370101 |
| [E49–E52 round-basin assessment](../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |

Only this note and its return were written.
