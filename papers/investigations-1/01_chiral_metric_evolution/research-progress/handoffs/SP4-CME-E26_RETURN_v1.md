# SP4-CME-E26 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The bounded E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E26_REQUEST_v1.md) and
[source and operator audit](../../notes/26_FINE_GAUGE_ENDPOINT_GAP_20261122.md).

## Native operator and derivative order

For \(a=A-\bar A\) the displayed adjusted operator has the
native terms
\(-d_A^*(B_AF_A)-d_A d_A^*a-\mathsf S_A\mathsf S_A^*d_A^*d_Aa\),
with the source generator
\(-d_A^*a-\chi_A(\mathsf S_A^*d_A^*d_Aa)\).
At \(a=0\) the three second-order Fourier terms have a strictly
negative total quadratic form. The horizontal term contributes a
cross term with the longitudinal component, controlled by the
pointwise bound on \(\mathsf S_A\). The exact sequence identifies
the joint kernel, so the estimate is strictly coercive. The
positive unadjusted factor follows directly from
\(\delta B_A=8D_Q^*D_Q L_A(d_A b)\). The reverse gauge reference
symbol is negative with the transverse wedge projection retained.
Uniformly bounded curvature \(F\) and a positive wedge Gram floor
in a fixed smooth metric give a compact family for these pointwise
reference-symbol estimates. [Fine v2, Sections 3.3 and 4.2](https://arxiv.org/html/1111.5005v2).

For live \(g_A^{\rm F}\) in the vertical codifferential, the full
adjusted operator contains \(a_j\partial_\ell\partial_i(\rho g^{ij})/\rho\),
\(\rho=\sqrt{\det g_A^{\rm F}}\). Its third-order linearized symbol
at nonzero \(a\) on \(b=\iota_u F\) is
\(-|\zeta|_g^2\zeta_\ell a(u)\) under real derivative replacement by
\(\zeta\). It is genuinely nonzero for suitable \(u\). The physical
and horizontal terms have order at most two. Therefore the
second-order calculation at \(a=0\) leaves a derivative-order issue
away from the reference for the displayed live-adjoint equation.
The note records this precise reading and the source's local
claims. A separate choice of gauge or restart theorem is beyond
this packet.

## Continuous endpoint

Theorem 4.3 is the short-time statement with definite data in
the source's smooth setup. Theorem 4.11 additionally assumes a
given perfect connection on a compact base and sufficient
fixed-background \(L_k^2\) closeness for integer \(k\ge3\);
its convergence is modulo bundle automorphisms. The source
uses native \(t_{\rm F}\). E01 converts corresponding unadjusted
trajectories by \(t_{\rm F}=2Kt\). [Fine v2, Theorems 4.3 and 4.11](https://arxiv.org/html/1111.5005v2).

E24 supplies the compact curvature range for the pointwise
reference symbols. Its continuous connection and curvature limits
and distributional equality do not yield a full first connection
jet, regularity of coefficients in a justified restart class, or
derivative control of the required base and bundle gauge maps.
The upgrade to a verified restart hypothesis and a compatible
continuation remains unresolved. No extension theorem was invoked.

## Input and output identities

All three frozen inputs matched. Fine v2 was checked in HTML and the
relevant printed displays were checked in the PDF version.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E26_REQUEST_v1.md | `23b62b3335c4104d5aa31cc0c0c15f3e4db02d11167de640897abf9e5f7580f1` |
| B22_GAUGE_CONTINUATION_DEPENDENCY_20261122.md | `88c9dba7a796c8578b68d416bcefad1d046223a03f95f2d7bb45cc6db70e7312` |
| 24_TEMPORAL_BOOTSTRAP_20261122.md | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
| E01_FOUNDATION_ASSESSMENT_20261122.md | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| 1111.5005v2.pdf | `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8` |
| 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md | `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08` |
