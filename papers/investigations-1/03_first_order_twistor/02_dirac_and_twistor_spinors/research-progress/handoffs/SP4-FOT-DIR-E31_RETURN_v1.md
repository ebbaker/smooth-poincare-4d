# SP4-FOT-DIR-E31 · Unit harmonic spinor and conformal scalar energy · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing was `gpt-6.2-sol` / `ultra`.
Actual helper and selected lead model identifiers and reasoning efforts
were unavailable. [Request v1](SP4-FOT-DIR-E31_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Technical note](../../notes/DIR_E31_20261124.md).

**Completed.** HEAD and all five frozen working-tree digests matched.
For the supplied nowhere-zero harmonic field with $\sigma=|\Psi|_h$,
the complete metric $k=\sigma^{4/3}h$ carries the unit harmonic
$\xi=\sigma^{-1}\beta\Psi$. It has $k-\delta=O_2(R^{-3})$ on the end and
zero ADM mass. Pointwise $s_k=-4V$ for $V=|\nabla^k\xi|^2$.

For $g'=v^{-4}k$ and $\Psi'=v^3\beta\xi$, both the connection
calculation and scalar-curvature transformation yield

\[
\int_N|\nabla^{g'}\Psi'|^2\,dV_{g'}
=\int_N(12|dv|_k^2+Vv^2)\,dV_k .
\]

The scalar integration-by-parts term and spinor flux cancel on every
truncation. Each vanishes on large spheres for compact variations.
If $v=1+aR^{-2}+O_2(R^{-2-\epsilon})$, the spinor flux tends to
$-6a\,\operatorname{Vol}(S^3)$, and $m_{\rm ADM}=-4a$ in the
normalization of equation (7) in the technical note.

The critical functional under harmonic transport satisfies
$J_{g'}(\Psi')^4=\int_N(V+12|d\log v|_k^2)^2\,dV_k$.
E10's unit twistor-weight scale for the same input is $\sigma^{-4}h$.
Its unit field is harmonic exactly when $\sigma$ is constant.
Hitchin's conformal weights, Lee–Parker's scalar and mass formulas,
and Friedrich's twistor normalization were checked at the passages
recorded in the note.

B16 can use the quadratic functional on this supplied class.
The zero-free input and the fixed smooth end remain hypotheses.
