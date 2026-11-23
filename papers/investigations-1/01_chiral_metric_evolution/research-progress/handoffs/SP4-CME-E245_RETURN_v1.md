# SP4-CME-E245 return v1 — Conditional global cap crossings

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E implication, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings are
unavailable. I authored E235 and E49 and audited E240/E241 in E242.
The premise \(H_{\rm cap}\) stays explicit. This derivation consumes
no E243/E244 result.

## Disposition

**Conditional proof complete.** The small actual pair values and
the exact local germ in \(H_{\rm cap}\) supply \(H_{\rm cutoff}\)
for E241. The assessed fixed round basin gives a smooth global
original solution, smooth through zero in the original identification,
and the existing exponential \(H^m\) estimate modulo smooth
time-dependent bundle automorphisms.

For each sufficiently small \(\epsilon\), initial global
\(M_\epsilon(0)=\sup\rho(Q(A_\epsilon))=1+\epsilon\).
The continuing strict local maximum has native initial log-ratio
derivative \(1/2\). On a short individual interval its log-ratio
derivative is at least \(1/4\), so
\(M_\epsilon(t)\ge (1+\epsilon)e^{t/4}>1+\epsilon\) for every
positive time in that interval. This gives immediate exit from
each stated near-round closed cap.

For \(\epsilon_n=\epsilon_*4^{-n}\), continuity on each individual
trajectory permits a positive \(t_n\) in its growth interval
with \(M_{\epsilon_n}(t_n)<1+2\epsilon_n\).
Writing \(P_n\) for the later local-maximum ratio value, choose
\(R_n=(1+\epsilon_n+P_n)/2\). Then
\(M_{\epsilon_n}(0)<R_n<M_{\epsilon_n}(t_n)\)
and \(1+\epsilon_n<R_n<1+2\epsilon_n\).
These intervals are strictly ordered downward, so
\(R_n\downarrow1\). Thus the strict-cap failure thresholds occur
arbitrarily close to one. Each selection uses only its individual
trajectory.

The normalized wedge quotient transforms by adjoint conjugation
and composition with the base diffeomorphism under bundle
pullback. Consequently the spatial ratio supremum is invariant
at each time, including for the comparing automorphisms.
The cap crossings hold in the original paths and cannot be
removed by these comparisons.

The static premise stays pending in this packet. The only
written outputs are the derivation and this return.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E245 request](SP4-CME-E245_REQUEST_v1.md) | 7f74673dc27f3afadf1a6b7b34cf3deb53bae366b31eb8d62e5c2dee825cdf83 |
| [B112](../../brainstorm/notes/B112_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) | 65f4bc96b23c11bae954d31e81d0dd5e377a1ef8a08ee49ec24407c8677fc037 |
| [E241 conditional implication](../../notes/241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md) | fd11af9ac59082fc453b749cfd03ff7681dbb6f339c5827f7ce41a8a26370101 |
| [E49–E52 round-basin assessment](../../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E245 derivation](../../notes/245_CONDITIONAL_GLOBAL_RATIO_CAP_CROSSING_20261123.md) | 51bdbefca995164f60bde3557f23c74d7f964840602d0049fbeab275eebdc5e4 |
