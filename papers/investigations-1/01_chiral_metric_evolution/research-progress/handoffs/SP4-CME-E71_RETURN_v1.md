# SP4-CME-E71 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. See the [request][req]
and [derivation][note].

## Disposition

The fixed native round linear slice follows. Write \(d=d_0\),
\(S=S_0\), \(H=(S^*S)^{-1}S^*\), \(\Pi=I-SH\) and
\(K=d^*\Pi d\). The checked intersection of the vertical and
horizontal symbol images gives strict positivity. The native
self-dual normalization gives the exact symbol
\(\sigma_2(K)(\xi)=\tfrac23|\xi|^2 I\). The nonnegative
self-adjoint realization has domain \(H^2(E)\), compact
resolvent and a finite-dimensional smooth nullspace
\(N=\{\psi\in H^1(E):\Pi d\psi=0\}\).

For every \(a\in L^2\), the functional \(d^*\Pi a\in H^{-1}\)
vanishes on \(N\). Coercivity on \(H^1\cap N^\perp\) gives the
weak inverse and the endpoint \(H^1\) estimate for \(\phi\).
Set
\[
 \phi=K^\dagger d^*\Pi a,\qquad u=H(a-d\phi),\qquad
 a_{\rm sl}=\Pi(a-d\phi).
\]
The exact decomposition is \(a=d\phi+Su+a_{\rm sl}\). Its
residual satisfies \(S^*a_{\rm sl}=d^*a_{\rm sl}=0\).
The residual map is the \(L^2\) orthogonal projection onto
this simultaneous kernel, with closed kernel
\(d(H^1(E))+S(L^2(TS^4))\). The orbit parameter ambiguity is
precisely \((\psi,-Hd\psi)\) with \(\psi\in N\).
For each integer \(m\ge0\) these operators satisfy
\[
 \|\phi\|_{H^{m+1}}+\|u\|_{H^m}+\|a_{\rm sl}\|_{H^m}
      \le C_m\|a\|_{H^m}.
\]
The higher estimates follow by local quotient regularity,
commutation and the weak bound for the \(H^1\) remainder.
The case \(m=0\) uses the \(H^{-1}\) forcing estimate.

For the fixed \(A_0\)-horizontal lift, the derivative of the
smooth pullback of \(A_0+a\) in the direction \(X\) is
\(S X+\iota_X da+d(a(X))\). The last two terms contain
\(X^j(D_0)_j a_i+a_j\nabla^{g_0}_iX^j\).
The linear inverse therefore gives the regularity of the
infinitesimal parameters, while finite horizontal composition
has an additional derivative requirement. Nonlinear slice
existence remains open in this packet. No new primary source
was used. Only the named note and return were edited.

## File identities

The E47, E48 and E51 digests matched the frozen request.
The B44 digest records the observed conceptual input.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E71_REQUEST_v1.md | `fca807ee86c84eb49223feeaae29733cff93cbef171b067bc0b52be2d47c71de` |
| B44_LINEAR_SLICE_AND_REGULARITY_20261122.md | `d1d09e015aeb64bfe389bef958e32b7ab3e1ad147fe4e61de5a5a6d807d9a0fb` |
| 47_ROUND_STABLE_LINEAR_20261122.md | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| 48_FIXED_STABILITY_GAUGE_20261122.md | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| E51_STABILITY_INPUTS_AUDIT_20261122.md | `15f7ef87d7855b5011c53886016fcfe1bd66f050e9b3dd99e25a6d31481d4e4f` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |

[req]: SP4-CME-E71_REQUEST_v1.md
[note]: ../../notes/71_LINEAR_ROUND_SLICE_20261122.md
