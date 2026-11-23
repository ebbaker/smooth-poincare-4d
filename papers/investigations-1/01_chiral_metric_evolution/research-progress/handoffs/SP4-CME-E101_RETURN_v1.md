# SP4-CME-E101 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the inherited
E89 audit and E66 estimate. I did not author E98, E99 or E88.
See the [request][req] and [audit][review].

## E98 check — Finite internal gauge

Pass. The ordinary \(K=d_0^*d_0\) is kernel-free because a
parallel adjoint section commutes with the full perfect
curvature span. Its divergence estimate checks on its own
fixed symbol, including the signed cutoff and freezing fluxes,
removal of the \(L^8\) value remainder and the common \(L^2/L^8\)
extension. The layer integration gives the asserted
\(L^{4,1}\to W^{1,(4,1)}\) estimate.

The endpoint graph space is a complete algebra in the
endomorphism realization. The exact exponential derivative
gives the stated remainder and contraction for the chosen
action sign. Testing the weak Coulomb equation against
\(vu^\top\) gives \(D^i(b_i u)=b_iD^iu\), and hence
\[
 \Delta_0u=b_iD^iu-(D^iu)a_i-uD^ia_i .
\]
The fixed mass resolvent, with \(H^2\subset W^{1,4}\), first
gives \(H^2\). The perturbation is small in both \(H^2\) and
\(W^{2,3}\) operator norms from its \(L^4\) coefficient.
The \(W^{2,3}\) solution is identified by \(H^2\) uniqueness.
Then \(Dw,b\in L^{12}\) gives \(W^{2,6}\) and smoothness follows
by the \(W^{m,6}\) algebra and fixed higher estimates.
All smallness reductions use the initial \(L^{4,1}\) norm.
The qualitative higher regularity can depend on smooth input
derivatives. No Feehan theorem is used.

## E99 check — Static Coulomb gain

Pass. The symbol of \(d_0\oplus d_0^*\) has squared norm
\(|\xi|_{g_0}^2\) on each amplitude. The fixed
\(I+\mathcal D^*\mathcal D\) divergence estimate at
\(p=3,6,8\) keeps the lower \(L^2\) norm and has the signed
cutoff and fixed patch absorption of the note.
Here the \(L^4\) bracket factor absorbs into \(W^{1,3}\)
using \(L^{12}\). The \(L^{12}\) bound gives \(W^{1,6}\)
and \(C^0\). Then the bracket is bounded in \(L^8\) by
the \(C^0\) and \(L^8\) value norms, giving \(W^{1,8}\)
and the fixed \(1/2\) Morrey exponent. The only smallness
requirements on \(\eta\) are the first absorption and
\(\eta\le1\). No curvature derivative enters.

## Combined consequence

For \(\epsilon=\|a\|_\infty+\|\beta\|_\infty\) small,
E98 bounds \(\|u-I\|_\infty\) and \(\|b\|_4\) by
\(C\epsilon\). The exact algebraic transformation
\(\beta_b=u\beta u^{-1}+(uF_0u^{-1}-F_0)\)
bounds \(\|\beta_b\|_\infty\) by \(C\epsilon\), enabling
E99. Thus \(\|b\|_{W^{1,8}}+\|b\|_{C^{0,1/2}}\le C\epsilon\).
The exact relation \(d_0u=ua-bu\) yields
\(\|u-I\|_{W^{1,8}}+\|u-I\|_{C^1}\le C\epsilon\).
The derivative \(C^0\) bound uses \(a,b\) in \(C^0\).
It gives no quantitative \(C^{1,\alpha}\) estimate without
uniform Hölder control of \(a\). The conclusion is vertical
Coulomb placement. The horizontal slice, full finite slice
and intrinsic budget extension remain outside it.

No mathematical corrections were found. No primary source
was newly inspected or imported. Only the designated audit
and return were edited.

## File identities

Frozen and inherited digests matched before use.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E101_REQUEST_v1.md | `a328242b481641122e56840d9c8bd8267bde075084c5dde81557c96d1582d32b` |
| SP4-CME-E98_REQUEST_v1.md | `d381c51d891f922016a189b385b74ece7730bfac17b515bda5e68a641cbc7ef3` |
| SP4-CME-E99_REQUEST_v1.md | `6be0b2fac34803375ddfde0d16e32ac0106a2ff1730cc93cca1c0375fd5dec79` |
| 98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md | `06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4` |
| 99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md | `6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330` |
| B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md | `d3f7e1596d30e9a60811c4a3d60b0551708792d6df8bafeeaae64c378b7df85e` |
| 88_LORENTZ_ORBIT_SOLVER_20261122.md | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| E89_LORENTZ_ORBIT_AUDIT_20261122.md | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |
| 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| E93_CRITICAL_GAUGE_SOURCE_AUDIT_20261122.md | `19d15e665b7af7a0dabb21d6e8c0ed9797967d07aec5becc13ca9d824e43cc75` |
| E101_VERTICAL_GAUGE_STATIC_GAIN_AUDIT_20261122.md | `0eb42648ae64ab15e4c909a4e8b67ccb80b5717e6ae750493efec2f36593de30` |

[req]: SP4-CME-E101_REQUEST_v1.md
[review]: ../../reviews/E101_VERTICAL_GAUGE_STATIC_GAIN_AUDIT_20261122.md
