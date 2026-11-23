# SP4-CME-E11 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E11_REQUEST_v1.md) and
[proof and actual connection jets](../../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md).

## Disposition

For every \(C^3\), \(SO(3)\)-invariant \(f\) of trace-three
positive \(Q\) with \(df(I)=0\) and positive Hessian at \(I\),
the Hessian is \(aI\) on the trace-free symmetric matrices
for some \(a>0\). In the Frobenius pairing let \(G=\nabla f\)
on that trace-three space. The expansion is
\(\mathscr L_QG-4G=4a(q^2)_0+O(|q|^3)\), \(q=Q-I\).
For \(q=\varepsilon\operatorname{diag}(1,0,-1)\), projection
perpendicular to \(G\) gives
\[
 \Pi_G^\perp\mathscr L_QG
   =4a\varepsilon^2\operatorname{diag}(1/3,-2/3,1/3)
      +O(\varepsilon^3) .
\]
It is nonzero for sufficiently small positive \(\varepsilon\).
The projection eliminates any putative proportionality factor
pointwise, irrespective of its regularity.

At \(\nabla_AQ=0\), the actual E08 cubic connection can add
any \(H'\perp G\) to each diagonal spatial \(Q\)-Hessian
entry without changing the scalar Hessian or lower scalar
jets. The change in flow derivative of \(f(Q)\) is
\(4\langle G,\mathscr L_Q H'\rangle\). Thus a pointwise
scalar maximum argument based on closure of the principal
part requires \(G\) to be an eigen-covector. Taking
\(Y=\Pi_G^\perp\mathscr L_QG\) and adding \(L Y\)
to a fixed strict-maximum jet gives a fixed negative Hessian
\(-|G|^2g_{\rm eucl}\) and a flow derivative with positive
coefficient \(4|Y|^2\) in \(L\). Every finite \(L\) is realized
on a possibly shrinking definite neighborhood, so the
derivative is positive for some finite \(L\).

This excludes the specified scalar-only maximum mechanism
for this smooth nondegenerate class near perfection.
Global preservation on closed manifolds and arguments with
different quantities or additional premises remain open.

## Input and output identities

The three frozen hashes matched when read.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E11_REQUEST_v1.md | `c2b23a8f3214f4db3f7548d9c9f44bf1302257b009807c6523a96643cccb9403` |
| B10_SMOOTH_SCALAR_BARRIERS_20261122.md | `a75e63c2736b651f1b5fe9d8bbb617d24864451c3b1b38d6ef6118816247824f` |
| 10_SCALAR_PINCHING_JET_20261122.md | `2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| 13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md | `2b06dacb36205c2d4629d7169dc227c8b498d870ca05dba04f35e476aaa1c55a` |
