# SP4-FOT-SEC-E18 return v1 · Unrestricted flat-end exclusion

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured execution route was
`gpt-6.2-sol` / `ultra`. Actual backend model and effort were unavailable
for independent verification. Actual settings for the author-selected
lead were unavailable. [Frozen request v1](SP4-FOT-SEC-E18_REQUEST_v1.md)

The [proof][note] verifies the fixed-seed exclusion. There is a
\(C^{10}\)-open neighborhood of the product flat collar containing
no smooth real positive-definite metric that matches both flat end
collars and realizes the seed-target chord for any \(0<\lambda\le1\).
The metric may vary in all four coordinates with arbitrary cross terms.
The theorem uses \(W^+\) and the curvature-operator Hilbert–Schmidt
pairing with the product orientation. Lead assessment and the distinct
proof audit are pending.

| Check | Result |
| --- | --- |
| Gauge with spare derivatives | After periodic completion, \(g\in H^{10}\), the mean-zero displacement \(X\in H^8\), the adjusted logarithmic metric \(h\in H^7\), and its projected divergence is in \(H^6\). The gauge derivative \(\Delta X^\flat+\frac12d\operatorname{div}X\) is invertible on mean-zero fields by Fourier modes. Volume normalization gives \(\operatorname{tr}h=0\) and the gauge gives \(\delta h=0\). The gauge is smooth for smooth inputs by the translation argument. |
| Constant flat moduli and curvature mean | Keep \(c=\bar h\) and put \(v=h-c\). The flat metric with logarithm \(c\) has zero Weyl curvature. The mean-zero TT inverse has norm bounded by \(4(1+\mu_1^{-2})\). The remainder in \(H^5\) is bounded by \(C(\|c\|_{H^7}+\|v\|_{H^7})\|v\|_{H^7}\), making the mean higher order in the full realized curvature. |
| Moved source | The exact transported equation after gauge is \(\lambda^{-1}F_\gamma(h)=\rho^{-1}B_g(T\circ\phi)B_g^{-1}\). The map \(B_g=J_O(J_{r,g}\circ\phi)^{-1}(J_{r,\gamma}\circ\phi)\) uses the ordered noncommuting frame maps. The right side converges to the transported seed \(T\) in \(H^7\) and is uniformly bounded in \(H^5\). Its mean is bounded away from zero by the E16 seed moment, contradicting the curvature estimate. |

The seven crosswalk, two SH and three E13/E16/B14 pins matched at HEAD
`e76752648b69969b1234d0295530c87fce9fcdcb`. The [note][note] SHA-256 is
`715a3554397ea36a2054e957038dc95814bfc7a77349b4db78802622bc0536a8`.
The source check used Inci–Kappeler–Topalov arXiv:1107.0488v2,
Theorem 1.2(i), p. 5, and Remark 1.3, p. 4, for closed Sobolev
composition. The curvature and Fourier comparison uses E02 (5),
the E13 seed curvature, and E16 (1) and (3).

The radius depends on the fixed seed and periods, without a smallness
assumption on the seed. Free ends and unrestricted metrics farther
from the flat metric remain separate cases. The periodic completion
is auxiliary to this collar test. The lead owns integration in the
[sole register](../REGISTER.md).

[note]: ../../notes/SEC_E18_20261124.md
