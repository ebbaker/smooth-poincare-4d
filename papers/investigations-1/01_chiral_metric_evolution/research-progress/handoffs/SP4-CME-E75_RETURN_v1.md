# SP4-CME-E75 return v1 — independent critical recovery-limit audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
I authored E60 and E67 and use those as assessed inputs to this review
of E74. [Frozen request][req] · [Detailed audit][review].

**Pass.** For smooth compatible input with sufficiently small
fixed-round critical pair norm \(\delta\), the piecewise direct recovery
ODE has \(\int_0^\infty\|W\|_{C^1(P)}\,d\tau\le C\delta\).

- The direct sign follows by differentiating \(j^*A_{\rm adj}\)
  with \(R(\xi,A)=-\mathcal L_\xi A\). Both live base slots in the
  codifferential and the lift term \(-A_iY^i\) are accounted for.
  The first interval costs \(C(H+MH)\) in the critical path norm.
  The stable generator vanishes at the reference and costs
  \(C(q_b+q_b^2)\), with \(q_b\le C\delta e^{-\alpha u}\) from E63
  and E49 at fixed \(m\ge6\).
- The tail direct map is \(j_{\rm st}c^{-1}\), with inverse
  \(cg_{\rm st}\) and original connection \(j^*B\). Fixed chart
  derivative estimates, positive determinant bounds, and compact
  bijectivity give a \(C^1\) limit and \(C^1\) inverse. Their
  distances to identity are \(O(\delta)\). Inverse convergence
  uses uniform continuity at the moving inverse points and is
  qualitative in \(C^1\). The base limits preserve orientation.
- The original pair converges uniformly to \(j_\infty^*(A_0,F_0)\).
  Uniform convergence of the local potentials and curvatures
  passes the curvature identity to distributions. The limiting
  curvature is continuous, and it is definite with \(Q=I\).

These estimates use the actual direct generator \(W=-\xi\), smooth
compatible finite-time solutions and the fixed assessed estimates.
They establish \(C^1\) bundle maps and a \(C^0\) connection–curvature
limit. Detailing the covariant chain rule at E74 lines 120–122
would avoid suggesting a parallel frame on an open curved set.

All six frozen versions matched. The recorded reverse byte operation
reproduced the original E67 SHA from the corrected file and preserved
E74's historical consumption record. No new primary source was
opened or imported. Only the E75 audit and this return were written.

| Artifact | SHA-256 |
| --- | --- |
| [E75 request][req] | `ce06b79f3c6a1fc28fd05fa115f01a0003bc7cc62463ee5157e75d5a2467af83` |
| E74 | `b2178fb149712df61c6b660bca00e10451c1d38c5434bb562607d9ba369139fa` |
| E67 corrected, used here | `96a962b3c40f682443b4d52d021633a83f13bbf8b1d9d5ae8693b3bdc67eb357` |
| E67 original, consumed by E74 | `abfb4370645ac042a039629dd4725bf67a0bb81897f52cf4ac49fdbe26c0c0c8` |
| [E75 audit][review] | `6b499ac9696dedcb9c4147e6a61e35fdb7e50c0bf947185e160666de586b6d92` |

[req]: SP4-CME-E75_REQUEST_v1.md
[review]: ../../reviews/E75_RECOVERY_LIMIT_AUDIT_20261122.md
