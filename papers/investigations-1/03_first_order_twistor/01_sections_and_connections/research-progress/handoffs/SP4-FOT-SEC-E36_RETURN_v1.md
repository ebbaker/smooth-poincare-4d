# SP4-FOT-SEC-E36 · Subcritical Yamabe and \(\sigma_2\) gauges · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request specifies helper routing
`gpt-6.2-sol` / `ultra`. Actual backend identifiers and reasoning
effort for the helper and retained lead were unavailable for
independent verification.

[Request v1](SP4-FOT-SEC-E36_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Derivation and source passages](../../notes/SEC_E36_20261124.md)

**Completed, pending lead assessment.** For the supplied smooth
positive-Yamabe conformal class on a homotopy four-sphere with
\(E=E_+\le 8\pi^2-\delta\), the unit-volume Yamabe representative has
\(\sqrt{48\delta}\le R=Y\le8\sqrt6\pi\), the inhomogeneous bound
\(\|v\|_4^2\le6\|dv\|_2^2/\sqrt{48\delta}+\|v\|_2^2\),
\(\|\operatorname{Ric}_0\|_2^2\le4E\), and
\(\|\operatorname{Rm}\|_{L^2,4{\rm ind}}^2\le16E+64\pi^2\).

CGY Theorem 1.2 applies because
\(\int\sigma_2(A_{\rm CGY})=2(8\pi^2-E)>0\) and \(Y>0\).
In the separate unit-volume gauge, \(A=A_{\rm CGY}/2\) has
\(q=\sigma_2(A)=(8\pi^2-E)/2\) and positive
\(S=\sigma_1(A)=R/6\). The least Ricci eigenvalue satisfies
\(q\le m(3S-m)/6\), giving \(m\ge2q/S\) with sharp coefficient
\(2\). At fixed \(q\), algebraic spectra in the positive branch
have unbounded \(S\) and \(m\to0\).

An independent scalar bound \(R\le\Lambda\) in the
constant-\(\sigma_2\) gauge gives \(\operatorname{Ric}\ge
(6\delta/\Lambda)g_\sigma\), diameter at most
\(D=\pi\sqrt{\Lambda/(2\delta)}\), and
\(\operatorname{Vol}B(x,\rho)\ge(\rho/D)^4\) for \(0<\rho\le D\).
The Yamabe representative's constant scalar gives no such
upper estimate in the separate gauge. The interval \(E<4\pi^2\)
already satisfies SH-E01 recognition when \(Y>0\).

HEAD `e76752648b69969b1234d0295530c87fce9fcdcb` and all three
B22 pins matched. The proof records the verified CGY normalization,
existence hypotheses, positive scalar branch and comparison passages.
The construction of a qualifying class and control of \(\Lambda\)
remain separate premises.
