# SP4-CME-E227 return v1 — Strict-interior absorption degeneration

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B107, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored E223 and E209, along with the inherited E202 reduction and E219 audit. The E223 endpoint test is historical context under separate audit, and the family identities here are rederived.

## Disposition

**All B107 constants check for the one family.** At old \(K=1\), \(Q_s=3\operatorname{diag}(1,1,s)/(s+2)\), \(3<s<7/2\), let \(t=\sqrt{s}\), \(\lambda=3/(s+2)\), \(Y=E_0\), and \(N_s\) be the edge vector \((-t/2,1,-1)dx^1\). Then
\[
 \begin{gathered}
 V(N_s)=0,\quad |N_s|^2=s+4,\quad
 R(N_s)=4\lambda s(7-2s),\quad B(N_s,Y)=2\lambda t(2-s),\\
 R(Y)=12(5s+1)/(s+2)^2,\qquad |V(Y)|^2=4R(Y).
 \end{gathered}
\]
The mixed pairing uses the full Bianchi mismatch contribution \(4\lambda t(s-1)\) before symmetric polarization and subtraction. The assessed axial identity supplies \(R(N_s)\); the new calculation needs no E223 mixed coefficient.

At constant \(V(Y)\) the minimizing parameter is \(\sigma_*=(s-2)/(2t(7-2s))\), with \(R(Y+\sigma_*N_s)=R(Y)-\lambda(s-2)^2/(7-2s)\). Every admissible pointwise speed-only constant \(C(s)\) is bounded below by
\[
       c_{\rm test}(s)=\frac{(s+2)(s-2)^2}{16(5s+1)(7-2s)}-\frac14 .
\]
The exact limit of \((7/2-s)c_{\rm test}(s)\) is \(99/4736\); it is a liminf lower bound for any admissible \(C(s)\) after the same scaling. The full-space optimum is not identified. The assessed strict-region coefficient satisfies \(\kappa(r)\le12r(7-2r)/[(r+2)(r+4)]\) for \(3<r<7/2\). Thus it tends to zero.

Each finite optimizing array is realized by a smooth local quadratic connection. The center is strictly inside the region, so for each fixed \(s\) continuity gives a whole ball with \(\rho<7/2\). The ball can shrink toward the endpoint. The result excludes a uniform pointwise speed-only bound on this strictly locally pinched class. It leaves integrated estimates and global-flow behavior unresolved. No numerical sampling, external source or extra spectral family was used.

## Frozen identities

| Artifact | Verified SHA-256 |
| --- | --- |
| [E227 request](SP4-CME-E227_REQUEST_v1.md) | 59e58b09d514d85a48ae60eae7d87e24bc3803e61987472d261fa7cdd4d066fb |
| [B107](../../brainstorm/notes/B107_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) | a069162a40595c55a1edab915e2e186d6cec479c3698936600be7f8d8d23ea44 |
| [E223](../../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E218/E219 assessment](../../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209](../../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E220](../../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E220/E222 assessment](../../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E02C](../../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E227 derivation](../../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) | f3d777307b40ea66d74f8f06432d08b839ab75e2c2804d3b1584ec91749e0412 |

This return is the second owned output. No shared artifact was edited. Sole live status remains [REGISTER](../REGISTER.md), and independent audit follows separately.
