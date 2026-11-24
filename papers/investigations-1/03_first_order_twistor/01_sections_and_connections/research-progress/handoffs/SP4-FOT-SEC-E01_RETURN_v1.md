# SP4-FOT-SEC-E01 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The author-selected lead was retained.
The [request v1][request] specifies gpt-6.2-sol / ultra for the helper.
Actual backend identifiers and reasoning efforts for both helper and
lead were unavailable for independent verification.

## Result

The proposed full projected Frobenius estimate holds for the supplied
common smooth positive-definite metric and three local positive orthogonal
almost complex structures separated modulo antipodes. With Hermitian
exterior norms that count unordered pairs once, the [derivation][note]
proves the single-direction estimate

\[
 |\langle W^+\xi,\xi\rangle_{\mathbb C}|^2
 \leq \tfrac94\bigl(|\nabla\mathcal F|^2+
                             |\nabla J|^2|\mathcal F|^2\bigr)
\]

for a Hermitian-unit representative \(\xi\) of \(\Lambda^2 T^{0,1}_J\).
The contracted curvature identity retains \(+K_{T^0(X,Y)}\) in the
exterior derivative of the connection difference, which equals
\(-K_{\mathcal F(X,Y)}\) on \(T^{0,1}_J\). The adapted derivative of
the defect, restricted to its two \((0,1)\) inputs, is exactly the
output projection of the full Levi–Civita derivative. No additional
uncontrolled term or change of defect is required.

For separation by sine at least \(\varepsilon>0\), the uniform
reconstruction constant for the squared estimate is \(9/(4m_\varepsilon)\),
where \(m_\varepsilon>0\) is the minimum sum of squared null evaluations
over admissible triples and Hilbert–Schmidt unit Weyl blocks. Three
antipodal pairs would give six roots of the Weyl quartic and ensure
positivity by contradiction. The orthogonal
calibration gives \(m_1=1/2\), hence the admissible constant \(9/2\).
These bounds are frame invariant. The pointwise proof requires at
most two classical derivatives of \(g,J_i\).

For the finite cover, multiplying by the subordinate nonnegative
weights and summing gives the stated \(E_+\) bound for the common
metric. The product integral is controlled by the squared weighted
\(L^4\) norms of \(\nabla J\) and \(\mathcal F\), and the resulting
integrals are constant-scale invariant. The local PRE §4.3 example
also checks and rules out an undifferentiated pointwise estimate
that vanishes when the defects do. The exact and strict approximate
recognition consequences use [SH-E01][recognition]. The strict
alternative requires that the upper bound be below \(4\pi^2\) and
that the same conformal class have positive Yamabe constant.

## Inputs and disposition

Observed HEAD e76752648b69969b1234d0295530c87fce9fcdcb. All seven
crosswalk SHA-256 pins and both request-pinned SH digests matched.
The B01/B06 decision and request hashes are recorded in the
[derivation][note]. The source comparison was limited to PRE
§§4.1–4.4, the manuscript's local-section and projective formulations,
[GHN arXiv:0911.3364v3][ghn], equation (13), Propositions 5.1 and
5.3, the opening proof of Theorem 5.10 and Appendix (74), and
[Chang–Gursky–Yang][cgy], Theorem A and Remarks 1–2, p. 107.
Evidence consists of the tensor derivation, finite-dimensional
reconstruction, explicit local calculation and integration.

Returned for lead assessment and the SEC-B02 comparison with E02.
Construction of a common smooth metric with controlled defects
on each homotopy sphere and the approximate endpoint's Yamabe
hypothesis remain open. This return leaves shared status to the
lead and includes no numerical execution.

[request]: SP4-FOT-SEC-E01_REQUEST_v1.md
[note]: ../../notes/SEC_E01_20261124.md
[recognition]: ../../../notes/SH_E01_20261124.md
[ghn]: https://arxiv.org/pdf/0911.3364
[cgy]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
