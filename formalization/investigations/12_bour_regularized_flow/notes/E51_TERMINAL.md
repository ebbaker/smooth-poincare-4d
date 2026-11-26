# Stationarity through the terminal comparison slice

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort were
unavailable. Bounded E51 Route 12 calculation at intake HEAD
`1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`. The working attainment
manuscript, terminal dissipation module and original gradient module
have SHA-256 prefixes `719bbea527c6`, `deafbe5fbbbe` and
`db3c8d394baf`. [Packet](../../research-progress/handoffs/ED06_E51_PACKETS_20261126.md) ·
[Working attainment manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) ·
[E50 terminal dissipation](E50_TERMINAL.md) · [E50 actual gradient](E50_ORIGINAL_GRADIENT.md)

## Physical backward window

Fix one smooth original solution on a closed oriented Riemannian
four-manifold at fixed \(0<\alpha<1\). Write \(G_t\) for the computed
covariant gradient, so \(\partial_tg_t=-2G_t\). Let \(b_i\) be regular
times, let \(c_i>0\) be the normalization constants, and use a common
\(A<0\) in the normalized coordinate \(s\). For late indices the
original endpoints
\[
 a_i=b_i+A/c_i^2,\qquad b_i
\]
must both be cofinal in the same order-connected set of regular times.
In the curvature blow-up application \(b_i\) is an original first hit
at level \(c_i\), based at a curvature maximum. The first-hit property
controls the normalized curvature on the entire backward window. With
cofinality and regularity supplied, the local transfer argument also
works for an unscaled terminal sequence. If the maximum curvature is
continuous on the forward regular interval and unbounded above there,
each level above its value at a fixed regular \(t_0\) is attained at a
first time in some compact interval starting at \(t_0\). Continuity
bounds the maximum curvature on every such fixed interval. Thus the
first hits of diverging levels eventually follow any later regular time.
Given a regular cutoff \(\tau\), choose a further regular \(\tau'>\tau\).
Eventually \(b_i>\tau'\) and \(|A|/c_i^2<\tau'-\tau\), so \(a_i>\tau\)
as well, with the whole backward window regular. [Bour v1, Theorem 1.9 and §8](https://arxiv.org/pdf/1012.0342v1#page=28)

With \(t=b_i+s/c_i^2\) put \(h_i(s)=c_i g_t\) and
\(K_i(s)=c_i^{-1}G_t\), as a covariant two-tensor. The chain rule gives
\(\partial_s h_i=-2 K_i\). The squared ordinary tensor norm gains
\(c_i^{-4}\) and volume gains \(c_i^2\). The time Jacobian \(c_i^2\)
cancels the remaining factor. By E50 the original energy drop between
the two cofinal times tends to zero, hence
\[
 \int_A^0\!\int_M |K_i(s)|^2_{h_i(s)}\,dV_{h_i(s)}\,ds\longrightarrow 0 .
\]
The formula contains the exact factor one-half between dissipation
and functional drop. This follows from Bour's negative twice-gradient
normalization even though the integrated display in the proof of
Theorem 1.11 omits that factor. [Bour v1, §1 and §8](https://arxiv.org/pdf/1012.0342v1) ·
[Physical scaling and regular slab](../../../SmoothPoincare/Variational/BourTerminalDissipation.lean)

## Local volume and the spacetime lower bound

On any fixed compact neighborhood \(L\) in the limit, take one
time-independent partial diffeomorphism \(\Phi_i\) on an open
neighborhood of \(L\), common to all \(s\in[A,0]\). The spatial
pullbacks are actual metrics on that neighborhood. Assume
\(h(0)\le B\Phi_i^*h_i(s)\) there on \(L\), for some \(B>0\) fixed
on the compact, and uniform convergence on \([A,0]\times L\) of
\[
 \bigl|K_i(s)\bigr|^2_{h_i(s)}\circ\Phi_i
 \quad\longrightarrow\quad
 \bigl|G^\alpha(h(s))\bigr|^2_{h(s)} .
\]
The limit here is the computed gradient of the limiting metric,
with its own norm. The source norm is evaluated in its actual
normalized metric. A time-dependent identification would insert
a Lie derivative in a pulled-back velocity. Joint \(C^4\) spatial
metric-jet convergence on fixed markings and the gradient expression
are the intended source of the norm comparison.

The pullback formula for the Riemannian volume gives
\(\operatorname{Vol}_{h_i(s)}(\Phi_i(L))
=\operatorname{Vol}_{\Phi_i^*h_i(s)}(L)\).
The inverse density against \(h(0)\) is at most \(B^2\) in four
dimensions. Its reciprocal gives the time-uniform lower bound
\[
 \operatorname{Vol}_{h_i(s)}(\Phi_i(L))
 \ \ge\ B^{-2}\operatorname{Vol}_{h(0)}(L).
\]
The image is compact and measurable. The volume on the right is
positive whenever \(L\) has nonempty interior. This calculation
uses no convergence theorem for the local spacetime integrals.
[Partial diffeomorphism and physical volume](../../../SmoothPoincare/Variational/BourTerminalStationarity.lean)

Suppose the continuous squared limit gradient is positive at one
interior spacetime point. A compact time interval \(J\subset(A,0)\)
of positive length and a compact spatial neighborhood \(L\) with
nonempty interior lie in a cylinder on which the limit square is
larger than \(2\eta>0\). Uniform convergence gives source square
at least \(\eta\) on \(J\times\Phi_i(L)\) for every sufficiently
late \(i\). The full physical dissipation on \([A,0]\) is therefore
at least
\[
 |J|\,\eta\, B^{-2}\operatorname{Vol}_{h(0)}(L)>0 .
\]
This contradicts its vanishing. The square vanishes at every
interior point. Continuity on \([A,0]\) for each fixed spatial point
extends the equality to \(s=0\), and positive definiteness of the
actual limiting metric gives \(G^\alpha(h(0))=0\) as a covariant
tensor. No assertion about integrals on an individual normalized
time slice follows from the time integral alone.

## Extraction inputs

The terminal application uses a regular original interval, the native
equation with the checked gradient, cofinal original endpoints and a
fixed nondegenerate backward duration \(A<0\). The same spatial
partial diffeomorphism compares all times for each compact. Its
pullback metrics must have a common positive quadratic-form lower
bound relative to \(h(0)\). The squared rescaled speeds must converge
on the compact spacetime domain to the squared actual gradient of
the limit, which must be continuous through the final slice.
Continuity in the formal statement is relative to the closed time
interval. It does not require regularity of the original flow at its
possibly singular maximal time.

Bour's compactness theorem is stated for an open time interval. The
working one-sided extraction uses derivative estimates on a longer
backward slab, terminal-slice markings, the evolution identity for
the connection and uniform metric equivalence integrated backwards.
Construction of these joint jet comparisons up to the closed end,
including gradient identification, remains a geometric supplier for
this packet. The kernel-checked transfer uses only the consequences
above on each compact. Noncompactness, scalar-flatness from the trace
and inherited scalar integral, Bach identification and an oriented
whole-core comparison remain separate consequences of the extraction.
[Bour v1, Theorem 7.2](https://arxiv.org/pdf/1012.0342v1#page=27) ·
[Measured comparison and original-flow application](../../../SmoothPoincare/Variational/BourTerminalStationarity.lean)

The pinned Lean target `lake build +SmoothPoincare.Variational.BourTerminalStationarity` passed. A direct-module probe confirms the actual comparison types and the standard axiom union `propext`, `Classical.choice` and `Quot.sound`.

## Constancy of the limiting metric

On the same fixed spatial markings, the limit is constant as a
metric in normalized time. At a point \(x\) fix tangent vectors
\(v,w\) and use the vectors \(d\Phi_i(v),d\Phi_i(w)\) at the source
point \(\Phi_i(x)\). The spatial map is fixed in time. The derivative
of the pulled-back bilinear component is therefore its evaluation
against the native velocity \(-2K_i\).

The physical tensor Cauchy–Schwarz inequality bounds this derivative
in absolute value by \(2|K_i|\) times the product of the source
lengths of the two comparison vectors. A quadratic-form upper bound
by \(B h(0)\) on their pulled-back metric bounds that product uniformly
in time and in the comparison index. Uniform convergence of the
compared squared speeds to the now zero limiting gradient gives
uniform smallness of the source speed norm. The scalar mean-value
bound between any fixed \(s\in[A,0]\) and \(0\) then gives vanishing
differences of the bilinear components. Passing their values at the
two times proves \(h(s)=h(0)\). The Lean theorem takes only the native
source derivative, its uniform smallness, the upper comparison, and
value convergence at the compared times. [Fixed-gauge constancy](../../../SmoothPoincare/Variational/BourTerminalMetricStatic.lean)

## Infinite physical volume of the pointed model

Suppose the limiting manifold is noncompact, its closed physical
balls of radius two are compact, and every open unit ball has
physical volume at least \(c>0\) in the limit metric. Given finitely
many chosen centers, the union of their closed radius-two balls is
compact and therefore misses a new center. Its unit ball is disjoint
from all previous unit balls by the physical distance triangle
inequality. Induction constructs arbitrarily large finite packings.
Volume additivity on these measurable balls gives total volume at
least \(nc\) for every \(n\), which forces infinite physical volume.
This is the volume input for the later vanishing of a constant
scalar in \(L^2\). [Bour v1, Lemma 8.1](https://arxiv.org/pdf/1012.0342v1#page=29) · [Physical packing proof](../../../SmoothPoincare/Variational/BourPointedVolume.lean)
