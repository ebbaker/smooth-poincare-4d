# SP4-CME-E190 return v1 — Compact \(C^0\) curve persistence test

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E proof test under B93, configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I authored the inherited E186 source audit. This is the
fixed B93 construction, awaiting independent audit and lead disposition.

## Result

The construction succeeds at the given single-curve boundary.
The fixed target is obtained by the anti-linear projection
\(P_{K_0}\) after radial transport. Its restriction to each nearby
anti-linear fiber is injective. Differentiating the pulled-back
equation at its zero gives exactly \(D_0\). The residual is affine
in the first derivative of the section and obeys both requested
\(L^8\) bounds, without differentiating \(J'\).

The range of \(Q_0\) is the closed complement given by the
projection \(Q_0D_0\). The closed radius-\(r\) ball there is compact
and convex in ambient \(C^0\): boundedness gives relatively compact
images and the weak \(W^{1,8}\) limit proves closure. For fixed \(J'\),
coefficient convergence in \(C^0\), weak \(L^8\) gradients, and
compact embedding after \(Q_0\) give the required \(C^0\) continuity
of the self-map. Choosing \(r\) first and then the \(C^0\) threshold
\(\epsilon\) gives the self-map estimate. Schauder yields a fixed
point, and applying \(D_0\) and the projection injectivity gives
the full geometric weak equation.

The local first-order difference quotient yields \(W^{2,4}\)
by absorbing the small frozen-coefficient error and bounding
\((\delta_h a)u_x\) in \(L^4\) through \(L^8\cdot L^8\).
The constant coefficient \(L^4\) bounds are derived in the note,
and the resulting Poisson equation bootstraps to smoothness.
Individual regularity constants may depend on \(J'\). The radial
homotopy and the diameter margin give a nonconstant sphere.

Fine v2 Remark 5 and Proposition 7 (3)–(5) were reopened.
Laugesen's compact-map definition, Theorem 1.17, Morrey
Theorem 3.22 and difference quotient Proposition 5.7 were
verified in the 22 December 2020 author PDF. No additional
regularity theorem or local source copy is used. The packet
establishes no uniqueness, smooth dependence, uniform higher
estimates, metric taming or bubble theorem.
[Fine v2](https://arxiv.org/html/1602.03829v2).
[Laugesen](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).

## Outputs and frozen inputs

| Artifact | Verified SHA-256 |
| --- | --- |
| [E190 derivation](../../notes/190_C0_CURVE_PERSISTENCE_TEST_20261122.md) | c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea |
| [E190 request v1](SP4-CME-E190_REQUEST_v1.md) | 66e5c48eb1f5e8645d0a23c7600eacb0c3ba97f26393864a2f83a86d236f5701 |
| [B93](../../brainstorm/notes/B93_WEAK_COMPACT_CURVE_PERSISTENCE_20261122.md) | 4199ff5376d7d4cfb5c6555246089616f4e622ec28adb42ba07855d60e8f3c5b |
| [E186 assessment](../../reviews/E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md) | aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65 |
| [E186 source audit](../../reviews/E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md) | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |

Only the assigned note and return were written.
