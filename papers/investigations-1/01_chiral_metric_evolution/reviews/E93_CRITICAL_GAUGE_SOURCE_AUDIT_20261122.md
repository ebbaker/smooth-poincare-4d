# E93 — Applicability of Feehan's critical Coulomb gauge theorem

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Frozen request][req] · [B54][b54] · [Reference workflow][workflow].

**Disposition.** This is a vertical Coulomb gauge result under the
paper's own hypotheses. The fixed-reference value and critical pair
smallness supplied here control the value term in its weaker norm.
The weighted divergence term and either required quotient-distance
bound remain unproved from those pair hypotheses. The extra
\(S_0^*(B-A_0)=0\) equation also requires a separate argument.

## Primary locators and applicability checklist

| Source locator, printed pages | Check |
| --- | --- |
| §§1.1–1.2, pp. 72–75, and §2, pp. 77–78 | A fixed closed connected Riemannian four-manifold, compact matrix structure group, \(H^k\) connections and \(H^{k+1}\) fixed-base gauges for \(k\ge2\) in the results. The quotient carries its \(H^k\) quotient topology. The action is \(u(A)=A-(d_Au)u^{-1}\). |
| (1.3), pp. 73–74, and §4 (4.1)–(4.4), pp. 86–87 | The two input costs both add the weighted divergence norm below. The norms use fixed geodesic distance and measure. The gauge estimate uses the two-derivative mixed norm of (4.2)–(4.3), which contains a weighted covariant Laplacian term. |
| Theorems 1.1–1.2, pp. 74–75, and §3, Proposition 3.4, pp. 80–81 | Theorem 1.1 assumes small quotient distance, produces a Coulomb representative and gives bounds in \(L^{2\sharp,4}\), also \(H^1\) for the stronger distance. The stated gauge ambiguity is its reference stabilizer. Theorem 1.2 describes the small \(L^4\) Coulomb ball modulo that stabilizer and its neighborhood inclusions. The differentiable assertion is restricted to its free stratum. |
| Theorems 8.2 and 8.4, pp. 111 and 115, with (8.5) and (8.20), pp. 112 and 115 | These use a chosen \(H^2\) representative and the stronger and weaker norms, respectively, with their quotient counterparts in (1.3). They give \(H^3\) gauges, with mixed two-derivative bounds near identity. Their exponential chart is fiberwise in \((\ker d_{A_0})^\perp\) and has a Coulomb one-form parameter. The end of the proof on p. 116 returns to the quotient via a minimizing representative and bootstraps the gauge to \(H^{k+1}\) for \(H^k\) input. |

Here \(H^k\) denotes the article's \(L^2_k\). Feehan's constants \(c,z\)
use the fixed \((X,g),G\). Its reference dependence is displayed via
\(\nu_0\), the first positive eigenvalue of \(d_{A_0}^*d_{A_0}\) on
adjoint zero-forms, and
\(K_0=(1+\nu_0^{-1})(1+\|F_{A_0}\|_2)\). For Theorem 1.1 and
Theorem 1.2(2) the threshold is bounded by
\(zK_0^{-2}(1+\nu_0^{-1/2})^{-1}\). The local representative results
of §8 use the \(zK_0^{-2}\) bound. These are fixed reference
parameters in the proposed round comparison. The paper imposes no
definite-curvature or chiral normalization assumption. One can choose
its fixed metric to be the native round \(g_0\) and use an orthogonal
realization of \(\mathrm{SO}(3)\), with fixed equivalent internal
norms. The ordinary reference scalar
Laplacian here differs from E79's projected operator
\(d_0^*\Pi_0d_0\) and its kernel.
[Feehan, §§1–2 and 8][paper] · [E79][e79].

To avoid ambiguity in the extracted norm labels, the two costs in
(1.3), before taking the infimum over gauges, have respectively
\(\|a\|_{L^{2\sharp,4}}\) and \(\|a\|_{H^1_{A_0}}\)
as the first term. Both add \(\|d_0^*a\|_{L^\sharp\cap L^2}\).
Here \(L^\sharp\) uses the supremum of potential integrals with weight
\(\operatorname{dist}(x,\cdot)^{-2}\), and \(L^{2\sharp,4}\) combines
\(L^4\) with the weighted \(L^2\) norm with weight
\(\operatorname{dist}(x,\cdot)^{-1}\). The extracted PDF text does
not reliably distinguish the two superscripts in (1.3) and Theorem
1.1. The two explicit formulas, the order of the inclusions in
Theorem 1.2, and (8.5), (8.20) with the proof on p. 116 distinguish
the hypotheses. This is an extraction limitation, with no claim
of a verified typographical defect in the printed version.
[Feehan, (1.3), (4.1)–(4.4) and (8.20)][paper].

## Comparison with the supplied hypotheses

For a chosen \(a=A-A_0\), compactness in dimension four gives
\(\|a\|_{L^{2\sharp,4}}\le C(g_0)\|a\|_\infty\), because
\(\operatorname{dist}(x,\cdot)^{-2}\) has a uniformly bounded
integral in \(x\). The fixed localized E53 critical pair norm
also bounds \(\|a\|_\infty\) by its zeroth-order Bernstein estimate.
The curvature identity supplies
\(d_0a=F_A-F_0-\tfrac12[a\wedge a]\). This is the exterior
derivative, whereas the common scalar term in the two Feehan
costs is \(d_0^*a\). At a nonzero covector \(\xi\), the symbol of
\(d_0\) kills \(\xi\otimes e\) and the symbol of \(d_0^*\) maps it
to \(-i|\xi|^2e\). Thus recovering the divergence from the
curvature identity is unavailable even at the symbol level.
The stronger cost also needs the full \(H^1\) norm. This is an
unmet estimate on the supplied representative. Quotient distances
take an infimum over gauges, so a missing estimate for this
representative does not establish an obstruction to small quotient
distance. To invoke the source directly would require a proof of
a qualifying representative bound or of the corresponding
quotient-distance bound.
[E53, dyadic norm and (2)][e53] · [E79, weak equation][e79] ·
[Feehan, (1.3)][paper].

E88 estimates an **infinitesimal parameter** \(\phi\) in
\(W^{1,(4,1)}\cap C^0\) from a supplied \(r\) and leaves the horizontal
parameter in \(L^{4,1}\). This gives neither the missing input
divergence bound nor the paper's finite gauge regularity estimate.
Conversely Feehan's chart varies an internal gauge over the
identity on the base. There is no base vector \(u\) and thus no
\(S_Bu\) direction of the full bundle action. Even with verified
Feehan smallness, the output condition is fixed-base Coulomb and
does not imply the horizontal slice equation used here. No result
from Feehan is imported into the branch by this audit.
[E88, (1) and scope][e88] · [E79, decomposition (6)][e79] ·
[Feehan, (8.5), (8.20)][paper].

## Provenance

Paul M. N. Feehan, *Critical-exponent Sobolev norms and the slice
theorem for the quotient space of connections*, Pacific J. Math.
200(1), September 2001, 71–118, DOI
[10.2140/pjm.2001.200.71][doi]. The web tool opened and read
selected text of the linked publisher PDF on 22 November 2026
(America/New_York). It indexes 49 pages, including the unnumbered
cover. The published volume, issue, month and pagination agree
with R25. Direct terminal download failed DNS resolution.
No local bytes were retained and no visual page inspection or
full-paper proof verification is claimed. No arXiv version was
used. The checklist gives the new checked passages for the
lead's canonical integration. [Publisher PDF][paper] ·
[R25 provenance][canon].

| Frozen input | SHA-256 |
| --- | --- |
| [Request][req] | `86969a3830b83ca6449b8cd23b32962d6824902283bcd7afa4269a357cb231fa` |
| [B54][b54] | `fc8493e5e6cd3f28f756c93fcbfe726cddbf2703a62b304d76e4f151371e82d0` |
| [E79][e79] | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| [E88][e88] | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| [E53][e53] | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |

[req]: ../research-progress/handoffs/SP4-CME-E93_REQUEST_v1.md
[b54]: ../brainstorm/notes/B54_CRITICAL_GAUGE_SOURCE_COMPARISON_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e88]: ../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[workflow]: ../../../../REFERENCE_WORKFLOW.md
[canon]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#critical-gauge-source-discovery--feehan-2001
[paper]: https://msp.org/pjm/2001/200-1/pjm-v200-n1-p05-s.pdf
[doi]: https://doi.org/10.2140/pjm.2001.200.71
