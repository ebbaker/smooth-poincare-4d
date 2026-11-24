# SP4-FOT-SEC-E48 return v1 · Exact Yamabe zero and radial strain

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` helper configuration. Actual backend identifiers
and reasoning effort for the helper and retained author-selected
lead were unavailable for independent verification.

**Pass.** Every supplied smooth marked Yamabe-zero reference on a
closed oriented homotopy four-sphere admits arbitrarily close smooth
references with the same marking, volume form, exact zero Yamabe
sign, and surjective full chiral Weyl linearization. At a normalized
positive first zero eigenfunction \(u\), the [proof note][note] derives
\[
 d\lambda_1[h]=-\int\langle\operatorname{Ric}_{u^2r},u^2h\rangle_{u^2r}
                                                  \,dV_{u^2r}.
\]
The scalar-flat metric has nonzero Ricci somewhere in the true
exterior by the Bach-flat propagation theorem and round recognition.
A fixed exterior cutoff of \(u^{-2}\operatorname{Ric}_{u^2r}\)
therefore has nonzero first eigenvalue derivative. The E41 oscillatory
variation needs only an \(O(N^{-2})\) correction in this direction
to become tangent to \(\lambda_1=0\). Its contribution in the
fixed-column adjoint pairings is also \(O(N^{-2})\). The scalar
implicit equation keeps the eigenvalue exactly zero and E40 gives
surjectivity along the resulting small reference curve. Smooth
zero extension on the round sphere handles a marking given only
on the closed cap.

Every full trace-free preimage \(L_g h=-W_g^+\) satisfies
\(\|h\|_{L^\infty(g)}\int|B_g|_g\,dV_g\ge 4E_+(g)\).
The regular marked Yamabe-zero references obtained from E37/E38
retain energy \(8\pi^2+O(R^{-1})\) and total Bach norm \(O(R^{-1})\)
by per-reference \(C^4\) approximation. For these metrics, all
preimages of the actual radial target have strain at least \(cR\)
with \(c>0\) independent of \(R\). The same lower bound holds for
a regular marked E34-based sequence with \(0<Y=O(R^{-1/2})\).
A fixed subcritical margin, a finite radial step, and motions
without a differentiable initial tangent lie outside the estimate.

All eight working-file pins matched at HEAD
`e76752648b69969b1234d0295530c87fce9fcdcb`. The [proof note][note]
SHA-256 is `932c383c66c5e614712b29c545de85856556c4053914d89e3deb0d916005c74b`.
It records the primary passages and derives the scalar first
variation and local eigenpair construction. The lead owns the
[sole register][register].

[request]: SP4-FOT-SEC-E48_REQUEST_v1.md
[note]: ../../notes/SEC_E48_20261124.md
[register]: ../REGISTER.md
