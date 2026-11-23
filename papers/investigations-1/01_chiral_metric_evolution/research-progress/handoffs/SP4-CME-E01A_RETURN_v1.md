# SP4-CME-E01A return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E execution launched with
`gpt-6.2-sol` / `ultra` configured. Independent runtime introspection and
the lead's actual model and effort were unavailable. See the [frozen
request](SP4-CME-E01A_REQUEST_v1.md) and [audit](../../reviews/E01A_AUDIT_20261122.md).

## Disposition

Claims 1–2 pass the assigned derivation checks on the open definite region.
The explicit graph inverse verifies the conformal reconstruction and its
smoothness. The fixed-volume representative and adapted chiral frame
have the stated round normalization. In a fixed internal frame, for
\(F=-KS\Sigma_A\) and \(d_Av=U\Sigma_A+V\Sigma^-\), the recomputation gives
\[
 \beta(h_0)=-K^{-1}S^{-1}V,\quad
 \operatorname{tr}_{\widehat g_A}h=-\frac4{3K}\operatorname{tr}(SU),\quad
 Q_t=-K^{-1}(US+SU^T)+\frac2{3K}\operatorname{tr}(SU)Q.
\]
The integrated reconstructed volume is constant on a closed base. The
moving-frame formula uses the covariant time derivative. The compatibility
inverse checks with \(\mathscr C^2+\mathscr C-2I=0\) and
\(\mathscr C^{-1}=(\mathscr C+I)/2\). In the column convention,
\(\mathcal T_A=-[S^{-1}(\nabla_A S)]\wedge\Sigma_A\).

The independent-connection gradient for the manuscript's metric and
internal norm is exactly
\(-4d_A^{*\widehat g_A}[(q-|q|^2I/6)F]\).
The external scale comparison immediately after `flow:energy-and-metric`
(lines 1502–1506) needs an explicit correction or qualification. Using
Fine's printed \(\mu_{\rm F}=(8\pi^2/3)p_1(A)\) and the standard
rank-three real trace gives \(\mu_{\rm F}=2\mu\) in manuscript variables,
\(g_A^{\rm F}=2K\widehat g_A\), and
\(A_{\rm manuscript}(t)=A_{\rm F}(2Kt)\). The printed
\(\sqrt2 K\widehat g_A\) comparison corresponds to using the
manuscript's bracket-orthonormal internal norm from the outset in both
definitions. This finding applies to cross-source scale and time
comparisons. B01 and E02 can use the manuscript's fixed internal equation
and time. [Fine v2, Definitions 1.3–1.4 and Propositions 1.12 and 4.2](https://arxiv.org/html/1111.5005v2).

For B01, \(Q_t\) uses the self-dual part of \(d_Av\), while trace-free
metric velocity uses its anti-self-dual part. The algebraic recovery
of \(b\) uses a first derivative of \(S\) and an inverse \(S\). Any
continuation criterion must justify the required scale, definiteness,
and derivative bounds. The exact identities apply on the assumed smooth
definite interval. The audit leaves initialization on an arbitrary smooth
homotopy sphere, preservation of definiteness and analytic closure open.

## Inspected input identities

SHA-256 values were checked in the worktree. The mathematical files
frozen in the request matched. The live register advanced after the
request was frozen. Its observed hash is recorded separately as status
context. Fine's passages were read in full-text HTML and its local
reading copy was hashed.

| Input | SHA-256 |
| --- | --- |
| AGENTS.md | `6da55071c2312c204bed5cb716bc2cc71bf86b81034147f888918692e885997b` |
| GPT_RESEARCH_MODEL_WORKFLOW.md | `e62039b694fbd4032fee9c003cd07b2391c3f4007a03e2c3511dcbac9277541a` |
| PLAN.md | `0e723e1d0ffaa38e6923c7bf47cf8299aff0ab7f144d5aa16530bf067585dd57` |
| OVERVIEW.md | `23019fd47b2d1ec67604b914427c941479fd896c081230de04fc9c6492c04274` |
| REGISTER.md, frozen by request | `9426bb859c0a339b97c1a711fb67da500dfa654f04f84963c71e2a64a1dea28e` |
| REGISTER.md, observed on read | `7e1f260158220a5cd732f7c7ba3efcc680e1cf7a0e2964bfa9d306a5ea5b6b20` |
| SP4-CME-E01A_REQUEST_v1.md | `7159d5f73030cb9da4170a2bcb47ccec75ae9eb5f316ba09607712da51055756` |
| chiral_curvature_and_metric_evolution.tex | `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0` |
| 01_riemannian_s4_exploration_20261121.md | `472aa87038d7c6060ca6431c6b166b54110ed77005155eeb0094d131d7e6e416` |
| 02_riemannian_s4_metric_evolution_20261121.md | `fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347` |
| SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md | `e779af7b70312f9ac8c1ba6e84599c1e4da4e63b5639562dfe122368997e27f4` |
| SOURCE_NOTES_CME_BACKGROUND_20261121.md | `839f7dfd6ed536cfe8daa0efa745d7fcd9bbfdce6a19da6d0e700950cafe0be0` |
| 1111.5005v2.pdf | `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8` |
