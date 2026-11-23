# SP4-CME-E27 return v1 — live and fixed vertical adjoints

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E27_REQUEST_v1.md).
The [derivation note](../../notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md)
records the full calculation.

## Disposition

The literal live-adjoint operator in the displayed arXiv v2 formula has
a nonzero third-order linearized symbol at some \(a=A-\bar A\ne0\).
In Fine's native metric and the active-pullback real convention,
\(h_\xi(\iota_u F)=\xi\otimes u^\flat+u^\flat\otimes\xi\), giving the
vertical symbol \(-|\xi|^2\xi\otimes a(u)\). This can be nonzero at a
round current \(A\) with a smooth definite reference arbitrarily
close to it. Neither the physical nor the horizontal term has order
three there.

Freezing only the vertical codifferential metric at \(g_{\bar A}\)
makes the specified adjusted operator genuinely second-order
quasilinear, with smooth first-jet coefficients and an affine
second-jet dependence. The live codifferential of \(d_Aa\) in the
horizontal term differentiates its first-jet inputs only once.
At \(a=0\) the full linearizations agree and give the same negative
reference symbol. The fixed operator's symbol remains parabolic
in a sufficiently small \(C^1\) neighborhood of a compact reference.
The packet does not establish a local flow theorem in chosen spaces,
reverse automorphism recovery, or endpoint continuation. The order
finding pertains to the inspected v2 expression, with no claim
refuting Fine's short-time existence theorem.

## Frozen inputs and source

| Branch input | SHA-256 checked |
| --- | --- |
| `brainstorm/notes/B23_FIXED_ADJOINT_GAUGE_TEST_20261122.md` | `61522203b82dd7d4b789a193ac01069728f0bdb5d92b75e81dd59f3de4639a84` |
| `manuscript/chiral_curvature_and_metric_evolution.tex`, original §4 inspected before lead integration | `c3858e3ae0f1f0c5a5ab28bcbda461bf0070277a76d120c6da3225b0aa5b910b` |
| `reviews/E01_FOUNDATION_ASSESSMENT_20261122.md` | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| `research-progress/handoffs/SP4-CME-E27_REQUEST_v1.md` | `bea72c2f048004b20dcdf6afd4ed86edc3c26e049bf7492d24bf1931d43a4b7f` |

[Fine v2](https://arxiv.org/html/1111.5005v2), 29 November 2011, was
inspected for Definition 1.4, Lemma 3.2 and (3.4), Proposition 4.2,
Lemma 4.4, Proposition 4.5, Lemma 4.9, Theorem 4.10 and the relevant
automorphism equations in §4.2. The symbolic check is analytic
and used no numerical artifact.

## 22 November 2026 — convention clarification

The note now describes the native internal metric as the positive metric
given by the negative Killing form. This wording correction preserves the
calculation. Original note SHA-256 `0edfe5a28eb32dbab7b5d672282ffd7eec92ee2573863bda66a4f980c1bfb58c`. Corrected output
note SHA-256 `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590`. The original packet return SHA-256 was
`cc263e94658c3fd1f09c29cf4ebf0c05137afd6ed4c94bad2e3eb2232f0c3df0`.
