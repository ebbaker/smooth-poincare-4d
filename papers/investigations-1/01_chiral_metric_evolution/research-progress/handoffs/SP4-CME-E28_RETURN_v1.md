# SP4-CME-E28 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. See the
[frozen request](SP4-CME-E28_REQUEST_v1.md) and
[reverse gauge derivation](../../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md).

## Disposition

For the prescribed `xi_fixed`, the reverse equation in local
automorphism variables \(h(x,r)=(f(x),k(x)r)\) is quasilinear
second order. In the inverse-pullback action,
\(f^*\hat A=\operatorname{Ad}_kA-dk\,k^{-1}\),
\(f^*F_{\hat A}=\operatorname{Ad}_kF_A\), and
\(f^*g_{\hat A}=g_A\). The identity
\(d_{\hat A}\hat a=F_{\hat A}-F_{\bar A}
 +[\hat a\wedge\hat a]/2\)
makes the horizontal input a first-jet expression in \(h\).
Both codifferentials add at most one derivative, affinely in
the second jet. Target-coordinate conversion and left group
trivialization use inverse first jets as smooth multipliers.

At \(t=0,h=\mathrm{id}\) the principal blocks are
\[
  -|\zeta|_{\bar g}^2 I_{\operatorname{ad}E},
  \qquad -\mathsf S_{\bar A}^*(w_\zeta^1)^*w_\zeta^1\mathsf S_{\bar A}.
\]
The mixed terms are at most first order, using
\(d_{\bar A}^2\phi=[F_{\bar A},\phi]\).
The exact-sequence injection gives strict negative definiteness
of the horizontal block with its transverse projection retained.
The bound is uniform on the compact reference unit bundles and
persists in a short-time \(C^1\) symbol neighborhood.

For supplied smooth paths, the forward recovery
\(\ell(g^{-1})_*\dot g=\xi_{\rm fixed}(\hat A)\) reduces
for \(j=g^{-1}\) to a smooth time-dependent vector-field ODE on
the compact frame bundle. Along a supplied reverse solution
\(\hat A=h(A)\), the product \(gh\) is constant and starts at
the identity. Two unadjusted solutions with the same initial
connection therefore reduce to adjusted uniqueness if their
smooth reverse gauges are supplied. The cancellation uses
equivariance of the physical gradient and evaluates the fixed
generator at the common adjusted connection. The PDE existence
input is separate, and these results leave continuous endpoint
regularity and smooth continuation unresolved.
[Fine v2, Lemma 4.4 and equations (4.3), (4.4), (4.8)](https://arxiv.org/html/1111.5005v2).

## Input and output identities

All three frozen inputs matched. Relevant source passages were
checked in the same arXiv v2 full-text HTML.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E28_REQUEST_v1.md | `b6e1f8a608ac3b1b3b1d51b42bbb3391905ba96cee0d5523afaca59137139e99` |
| B24_LOCAL_GAUGE_CLOSURE_20261122.md | `d688094532c759d3b7cd1291723fba58a42b0e5f6f743e28f5ce18c593129055` |
| 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md | `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08` |
| 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md | `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175` |
