# SP4-FOT-SEC-E27 · Exterior Weyl corrections · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request specifies helper routing
`gpt-6.2-sol` / `ultra`. Actual backend model identifiers and
reasoning effort for the helper and retained lead were unavailable
for independent verification.

[Request v1](SP4-FOT-SEC-E27_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Derivation and source passages](../../notes/SEC_E27_20261124.md)

**Completed, pending lead assessment.** For the supplied smooth \(M,r,K\),
round adjoint injectivity, via zero extension across the round collar,
implies that every nonzero \(Z\in\ker L^*\) restricts nontrivially to the
actual exterior. If \(w=0\) on \(K\) and \(w>0\) outside, both the ordinary
Gram matrix of \(wZ_i\) and the moment matrix
\(\Gamma_{ij}=\langle Z_i,wZ_j\rangle_{L^2(r)}\) are positive definite.

For \(s\ge5\), the augmented map with \(h=L^*u\) is locally invertible
from \((H^{s+4}\cap(\ker L^*)^\perp)\times\mathbb R^m\) to \(H^s\).
With \(\mathcal Wc=\sum_i c_iwZ_i\) and
\(b(y)_i=\langle Z_i,y\rangle_{L^2(r)}\), its solution satisfies
\(F_r(h)=F_r(0)+y-\mathcal Wc(y)\) and
\(c(y)=\Gamma^{-1}b(y)+O(\|y\|_{H^s}^2)\).
Thus the realized exterior change has the minus sign. Smooth
targets give smooth solutions via spatial translations with the
finite moment row included. The metric stays positive with
\(dV_{g_h}=dV_r\), and its restrictions and compatible chiral
connection match on the actual interface.

The uncorrected target is realized on this slice exactly when
\(b(y-N(h(y)))=0\), where \(N(h)=F_r(h)-F_r(0)-Lh\).
Changing the free \(\ker L\) parameter changes that nonlinear test.
The actual exterior is contractible with the prescribed \(S^3\)
boundary by van Kampen, Mayer–Vietoris and Whitehead. The lift uses
its existing smooth structure and holds for small targets at the
fixed reference. Quantitative control along a path and vanishing
of the compensator for a prescribed global target are separate.

HEAD `e76752648b69969b1234d0295530c87fce9fcdcb` and the 26 B16,
B18 and setup-crosswalk input pins matched. The derivation records
the signed inverse, exact source support, verified working versions
and source passages.
