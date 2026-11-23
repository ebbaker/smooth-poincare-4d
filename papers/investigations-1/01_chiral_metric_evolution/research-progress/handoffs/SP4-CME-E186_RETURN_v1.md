# SP4-CME-E186 return v1 — Fine twistor-limit source audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Bounded E audit under B91, configured gpt-6.2-sol/ultra.
Independent runtime and lead-model attestation unavailable. I audited E165
in E167 and authored inherited E145/E155/E157. All frozen inputs match.

## Source and applicability

Fine arXiv:1602.03829v2, posted 15 November 2016, was checked in
HTML and indexed PDF. The inspected preprint is the accepted version
according to the arXiv record. The author index and DOI separately
identify the 2017 journal publication, whose body was not inspected.
The indexed PDF also displays a separate April 4, 2018 title-page date.
The relevant preprint locators are Theorem 1 and (2) on p. 2,
Theorem 3 and Corollary 4 on p. 3, Remark 5 on p. 4,
Lemma 6 and its proof on pp. 6–7, Proposition 7 and (3)–(5)
on pp. 7–8, and §§2.3–2.4 on pp. 8–11. No local source copy was
retained. [v2 PDF](https://arxiv.org/pdf/1602.03829v2).
[Version history](https://arxiv.org/abs/1602.03829).

Theorem 3 assumes tamed prelimit **metric** twistor spaces and pointed
\(C^2\) convergence to a locally hyperkähler limit. It excludes a
holomorphic sphere on the universal cover. The E165 limit fulfills the
locally hyperkähler input. The branch has neither prelimit metric
taming nor \(C^2\) convergence. The full-derivative estimate missing
in the source proof is the \(C^1\) twistor comparison used for the
differential of the Cauchy–Riemann persistence map in Proposition 7.
Strong \(W^{2,8}\) and \(C^{1,\alpha}\) metric convergence do not
supply it. Taming is needed separately for the strict positive area
of the perturbed curve in the fixed zero-area cohomology class.
[Fine v2, Remark 5 and §§2.1–2.4](https://arxiv.org/html/1602.03829v2).

The native sufficient inequality
\(\|W^+\|_{\mathrm{op}}+|s-6|/12+\|B\|_{\mathrm{op}}<1/2\)
gives \(J_+\) taming in the ordinary orthonormal two-form convention,
with \(\|B\|_{\mathrm{HS}}=|\operatorname{Ric}_0|/2\).
It is a sufficient extra hypothesis on the unscaled metric.
Its resulting taming inequality is preserved on rescaling.
Definiteness of the given connection alone does not verify
the metric Levi–Civita inequality. Corollary 4 retains ASD,
Einstein, nonzero scalar normalized in absolute value to one,
diameter and positive volume assumptions.

The indexed v1 PDF identifies the removed Corollary 6 on printed
p. 5 as the quadratic-null-direction claim under the specified
Einstein orbifold degeneration. The author withdrew it for a false
proof. It supplies no premise here. No new theorem or proof
strategy was imported into the branch.
[v1 PDF](https://arxiv.org/pdf/1602.03829v1).
[arXiv history](https://arxiv.org/abs/1602.03829).

## Outputs and frozen inputs

| Artifact | Verified SHA-256 |
| --- | --- |
| [E186 audit](../../reviews/E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md) | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |
| [E186 request v1](SP4-CME-E186_REQUEST_v1.md) | 44469ab52e2089f468a69e0e3b75335dca6b7b3d9e7a061f2c2b5e701c41cd53 |
| [B91](../../brainstorm/notes/B91_TWISTOR_BUBBLE_COMPARISON_20261122.md) | 568deca9a3c361c5cf760bf686beefe65fbb7fd4f61b14c2785792310e1cd203 |
| [E165/E167 assessment](../../reviews/E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md) | 2bbdb056d7a54440eccbf09ee65511252d71daa310f129a01718670aa08c8b63 |
| [E165](../../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md) | 3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2 |
| [E157/E159 assessment](../../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E168/E169 assessment](../../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) | 6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f |

Scope completed. Only the assigned review and return were written.
