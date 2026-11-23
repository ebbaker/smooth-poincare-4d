# SP4-CME-E99 return v1 — static Coulomb representative estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Frozen request][req] · [Full derivation][note].

**Pass.** For a supplied smooth exact Coulomb representative \(b\)
on the fixed native round bundle, set
\(\beta=F_{A_0+b}-F_0\) and
\(\eta=\|b\|_4+\|\beta\|_\infty\). For
\(\eta\le\min\{1,(2C_3C_{\rm br}S_3)^{-1}\}\) the estimate is
\[
       \|b\|_{W^{1,8}}+\|b\|_{C^{0,1/2}}\le C\eta .
\]
All constants use the fixed reference. Here \(C_3\) is the \(p=3\)
elliptic constant, \(C_{\rm br}\) bounds the quadratic bracket, and
\(S_3\) is the fixed \(W^{1,3}\to L^{12}\) embedding constant.

- For \(\mathcal D=d_0\oplus d_0^*\), the symbol of
  \(I+\mathcal D^*\mathcal D\) has ordinary positive scalar
  principal part. The proof retains the fixed lower terms and
  the \(\|v\|_2\) remainder, so no vanishing of the kernel of
  \(\mathcal D\) is assumed. It derives
  \(\|v\|_{W^{1,p}}\le C_p(\|\mathcal Dv\|_p+\|v\|_2)\) for
  \(p=3,6,8\) by fixed-chart localization, the distinct gradient
  multiplier for flux forcing, and two mollifier absorptions.
- The exact curvature equation gives
  \(\mathcal Db=(\beta-\tfrac12[b\wedge b],0)\).
  The \(p=3\) estimate absorbs the \(L^4\) coefficient multiplying
  \(\|b\|_{12}\). The resulting \(L^{12}\) norm bounds the bracket
  in \(L^6\), yielding \(W^{1,6}\) and \(C^0\). The \(C^0\) bound
  and \(L^{12}\) then bound the bracket in \(L^8\). No further
  datum threshold is needed.
- Fixed-chart Sobolev and Morrey estimates are proved from
  coordinate integration and Hölder. The \(p=8\) endpoint
  exponent is \(1-4/8=1/2\), with fixed cutoff, frame and
  reference transport terms controlled.

This estimate concerns the supplied exact Coulomb representative
and is independent of E98. It uses the actual curved covariant
exterior derivative and retains the curvature bracket. No new
primary source or shared edit was needed.

| Artifact | SHA-256 |
| --- | --- |
| [E99 request][req] | `6be0b2fac34803375ddfde0d16e32ac0106a2ff1730cc93cca1c0375fd5dec79` |
| B57 | `d3f7e1596d30e9a60811c4a3d60b0551708792d6df8bafeeaae64c378b7df85e` |
| E88 | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| E89 | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |
| E66 | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| [E99 note][note] | `6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330` |

[req]: SP4-CME-E99_REQUEST_v1.md
[note]: ../../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
