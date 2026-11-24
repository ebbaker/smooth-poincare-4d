# SP4-FOT-SEC-E04 return v1 · Quantitative radial correction

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper routing was configured as
`gpt-6.2-sol` / `ultra`. Actual backend identifier and effort were
unavailable for independent verification. The author-selected lead
was retained, with actual identifier and effort unavailable.
[Frozen request v1](SP4-FOT-SEC-E04_REQUEST_v1.md)

The [derivation and source record][note] verify the B03 criterion on
the full trace-free fixed-volume chart of a supplied smooth closed
oriented real Riemannian homotopy four-sphere. ASD means \(W^+=0\) and
the norms use the Weyl curvature-operator target. Lead assessment is
pending.

| Test | Checked result |
| --- | --- |
| Single chart in \(C^{k+2,\alpha}\to C^{k,\alpha}\) | Let \(q=\|Q\|H\rho<1\) and \(\eta=\|QW_r^+\|\). If \(\eta+q\rho/2\le\rho\), the prescribed map is a self-map and a \(q\)-contraction on the radius-\(\rho\) ball in \(\operatorname{im}Q\) for all \(t\in[0,1]\). Its unique fixed point in that ball lifts \((1-t)W_r^+\) exactly. |
| Parameter and geometry | The path is smooth in the fixed Banach grade and has Lipschitz constant \(\eta/(1-q)\), with \(h'(0)=-QW_r^+\). It preserves \(dV_r\) pointwise and has uniform metric equivalence, finite-order curvature bounds and a positive injectivity-radius bound in the chart. |
| Nonzero forcing near round | On standard \(S^4\), use common spaces via the reference symmetric frame maps. At the fixed \(C^{k+2,\alpha}\) grade, the round TT inverse gives \(\widetilde Q_r=Q_0(\widetilde L_rQ_0)^{-1}\), uniformly bounded with fixed image. The jointly smooth curvature map gives uniform \(H\) and \(\eta=O(\|r-r_0\|)\). The explicitly described same-volume family has nonzero forcing at all sufficiently small nonzero parameters. |
| Smooth profiles | The round image is the differential range of \(D_0^*\) and gives a fourth-order elliptic potential equation. The closure-of-smooth Hölder argument and translation IFT give spatially smooth profiles for smooth references in the calibrated neighborhood. The same smoothness proof applies to E03's canonical inverse wherever it meets the quantitative criterion in the frozen grade. The abstract bounded inverse criterion by itself supplies the Banach-grade result. |

The seven crosswalk pins, two shared pins and both E02/E03 pins matched
at HEAD `e76752648b69969b1234d0295530c87fce9fcdcb`. The [note][note]
SHA-256 is
`40f2ef90133f550e425389a376de2a09ae069f4fa4eda686cffa489d60f06770`.
The source check used Gover–Gursky §1.1, Kottke Propositions 1.21–1.28,
and Taylor §§0.4, 0.12 and Appendix (A.1.6)–(A.1.7) for the round
cokernel, closed elliptic inverse and noninteger Hölder gain.

The near-round test is on the known standard smooth sphere. There is
no arbitrary-reference estimate for the inverse or the directional
size in the frozen chart. B03's conditional thresholds remain the
premises for this mechanism on an arbitrary reference. The lead owns
integration in the [sole register](../REGISTER.md).

[note]: ../../notes/SEC_E04_20261124.md
