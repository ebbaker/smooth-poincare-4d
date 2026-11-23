# SP4-CME-E116 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E112 and continued that calculation here. This carries no independent-audit status. [Request][req], [B62][b62], [derivation][note].

## Disposition

On the actual compact oriented round \(S^4\) with the positive chiral bundle and native round metric, the frozen E112 atom error and the radial parallel frame yield a norm lower bound \(L/r_k\) for the unweighted initial strain on one fixed-shape subannulus of volume at least \(v r_k^4\). The corresponding whole-annulus upper bound is \(U/r_k\) with volume at most \(V r_k^4\), including the smooth support collars. A smaller fixed \(\sigma\) controls the \(O(r_k)\) strain error, and the E112 ratio \(R>2\) and time-window argument remain valid. [E112, (4)–(5) and time windows][e112].

For \(g_N=|T_N(0)|_G\) and \(r_k=\sigma R^{-k}\), disjoint supports give
\[
 v\sum_{k=1}^N r_k^4\mathbf 1_{\{\lambda<L\delta_N/r_k\}}
 \le\mu_{g_N}(\lambda)
 \le V\sum_{k=1}^N r_k^4\mathbf 1_{\{\lambda<U\delta_N/r_k\}} .
\]
The lower bands \([L\delta_N/(4r_k),L\delta_N/(2r_k)]\) are disjoint. The upper bands between consecutive \(U\delta_N/r_k\) thresholds use the whole geometric volume tail, including the initial band from zero, and the distribution vanishes at and above the highest threshold.

The exact convention is
\[
 \|g\|_{(4,q)}^q=4\int_0^\infty\lambda^{q-1}\mu_g(\lambda)^{q/4}\,d\lambda
 \quad(1\le q<\infty),\qquad
 \|g\|_{(4,\infty)}=\sup_{\lambda>0}\lambda\mu_g(\lambda)^{1/4}.
\]
In particular \(q=1\) gives exactly \(4\int_0^\infty\mu_g(\lambda)^{1/4}\,d\lambda\). The resulting initial norm is comparable to \(\delta_N N^{1/q}\) for each fixed finite \(q\), and to \(\delta_N=N^{-1/2}\) for the weak norm, with constants independent of \(N\).

E112's round linearized derivative integral is at least \(c\delta_N N\), already over its finite union of positive-time windows. The ratio to the initial norm diverges at least as \(N^{1-1/q}\) for \(1<q<\infty\) and as \(N\) at \(q=\infty\), excluding a uniform linear estimate for these indices on the tested linearized data. At \(q=1\) the proved lower bound has the same order as the initial norm. An upper budget estimate at \(q=1\) remains open in this calculation. The result concerns the round linearization. The rearrangement calculation uses no external theorem.

## File identities

The E112 digest matched at consumption. Only the designated note and return were edited.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E116_REQUEST_v1.md | `ac0995740e6634fd59e958c30a36c82a8323284389e19d910af68877eab085e8` |
| B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md | `2fc388067ee0a45b8da327547fb9e6ff1033a97299a80df4c3e37d247c8841e5` |
| 112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md | `f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856` |
| 116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md | `bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c` |

[req]: SP4-CME-E116_REQUEST_v1.md
[b62]: ../../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[note]: ../../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[e112]: ../../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
