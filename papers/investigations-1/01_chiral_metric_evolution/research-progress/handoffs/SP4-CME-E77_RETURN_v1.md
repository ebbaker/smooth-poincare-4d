# SP4-CME-E77 return v1 — high-order stability and smooth recovery audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and selected lead settings are
unavailable. I authored E47 and checked its application as an assessed
input. This audit independently checks E76.
[Frozen request][req] · [Detailed audit][review].

**Pass.** For a smooth datum in the existing E49 \(m=6\) basin, the
stable path decays at \(\alpha=\lambda_1(G_0)/2\) in every fixed \(H^k\),
with order- and datum-dependent higher constants. This yields smooth
exponential convergence of the actual stable recovery and its inverse
in each fixed spatial norm. The original connection and curvature
converge after the existing E50 transfer in the smooth fixed-round
small-value basin, using its \(m=6\) threshold.

- **High-order closure.** The chart product separates an \(H^s\)
  factor and an \(H^3\) factor. The \(H^5\) composition base case
  puts any derivative of order at least three in \(L^2\). Its higher
  induction includes explicit \(x\) and cutoff derivatives. The exact
  Taylor differences then give
  \(\|N(a)\|_{H^{k-1}}\le C_k\|a\|_{H^6}\|a\|_{H^{k+1}}\)
  on the same fixed tube.
- **Graph energy.** The paired exponents are \((k-1)/2\) and
  \((k+1)/2\) on the fixed positive graph operator \(J\).
  The low exponentially decaying \(H^6\) factor permits absorption
  after a finite \(U_k\). Smoothness on \([0,U_k]\) makes the
  higher starting energy finite, with no high-norm smallness.
- **Recovery.** Each \(r\)-th spatial derivative of the actual stable
  direct generator costs at most \(C^{r+2}\) of the connection
  difference and its square. The late-tail derivative ODE controls
  all derivatives, and positive determinant and compactness give a
  smooth inverse. Inverse rate estimates use one extra bounded
  derivative of the direct limit at moving inverse points.
- **Exact limits.** With \(c=g_{\rm loc}(\tau)\),
  \(j_\infty=j_{{\rm st},\infty}c^{-1}\) and
  \((A_\infty,F_{A_\infty})=j_\infty^*(A_0,F_0)\).
  The audit also makes explicit the metric consequence
  \(g_{A_\infty}^{\rm F}=\bar j_\infty^*g_0\) on the base.
  Smooth curvature reconstruction and pullback give the same
  exponential rate for the metric in each fixed \(C^r\).

All five frozen inputs matched. No new primary source was opened or
imported. Only the scoped audit and return were written.

| Artifact | SHA-256 |
| --- | --- |
| [E77 request][req] | `498cb72e99a29dfda642204c76dde72f4e48cc91b36301420806547311d37990` |
| [E76 derivation][note] | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| [E77 audit][review] | `e8776fd678cfb87b4361920db7053682eee5ee99151b8c086c70d0122c75543e` |

[req]: SP4-CME-E77_REQUEST_v1.md
[review]: ../../reviews/E77_SMOOTH_LIMIT_AUDIT_20261122.md
[note]: ../../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
