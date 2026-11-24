# SP4-FOT-SEC-E19 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification. This audit used a different helper from
the frozen E18 writer.

**Disposition: pass.** The fixed E18 exclusion is proved in the
stated unrestricted smooth collar class. For the specified fixed
nonzero axial seed, sufficiently \(C^{10}\)-small candidates at
the flat product metric with both ends exactly flat are excluded
for every \(0<\lambda\le1\). The radius is independent of the
parameter and of the widths of the flat ends.

| Requested check | Audit finding |
| --- | --- |
| Periodic extension | Exact flatness on both sides of the seam gives smooth periodic data for each candidate. The \(C^{10}\)-to-\(H^{10}\) estimate uses the same derivatives on the fixed fundamental interval and is uniform over end widths. |
| Fixed-volume log gauge | The closed oriented manifold and the \(\mathcal D^8\) chart meet Inci–Kappeler–Topalov Theorem 1.2(i). The \(C^1\) grades are \(H^{10}\) metric, \(H^8\) displacement, \(H^7\) adjusted logarithm and \(H^6\) divergence. The zero mode is removed by mean normalization. The log is trace-free and the divergence itself has zero mean. Translation covariance and the parameter implicit function theorem give smoothness for each smooth input. |
| Flat modes and nonlinear remainder | At each nonzero Fourier frequency the TT symbol has singular value \(|\xi|^2/4\) with the Hilbert–Schmidt convention. Constant logarithms give exactly flat metrics, so the nonlinear remainder has a factor of the mean-zero variation. |
| Moved target | The conformal weight is \(\rho^{-1}\), and \(J_O J_{r,g}^{-1}J_{r,\gamma}\), with the seed factors evaluated at \(\phi(x)\), is the ordered isometry. The normalized source is \(T\) at the flat metric and is locally Lipschitz into \(H^7\). |
| Seed and contradiction | The normalized mean has norm \((\sqrt6/2)\int_{-1}^{1}(f')^2ds>0\). The curvature estimate bounds the mean of the moved normalized source by a constant times the \(H^{10}\) distance to flat, independently of \(\lambda>0\). |

The [audit note][audit] recomputes the gauge, Fourier coefficient,
ordered transport and seed curvature. It records the exact
contradiction at fixed ends. Free-end matching and metrics outside
the small flat neighborhood remain separate problems.

Observed HEAD was `e76752648b69969b1234d0295530c87fce9fcdcb`.
The seven crosswalk, two SH and three E19 input hashes matched,
including the frozen [E18 proof][e18] at
`715a3554397ea36a2054e957038dc95814bfc7a77349b4db78802622bc0536a8`.
The primary inspection rechecked Inci–Kappeler–Topalov, arXiv:1107.0488v2,
printed pp. 4–5, Remark 1.3, the definition of \(\mathcal D^s\) and
Theorem 1.2(i). [Primary text][ikt]

The lead owns assessment and integration in the [SEC register][register].

[request]: SP4-FOT-SEC-E19_REQUEST_v1.md
[audit]: ../../notes/SEC_E19_20261124.md
[e18]: ../../notes/SEC_E18_20261124.md
[register]: ../REGISTER.md
[ikt]: https://arxiv.org/pdf/1107.0488#page=4
