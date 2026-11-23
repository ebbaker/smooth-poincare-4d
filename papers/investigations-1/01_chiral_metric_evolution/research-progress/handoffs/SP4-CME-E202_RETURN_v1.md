# SP4-CME-E202 return v1 — General stationary pinching test

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B98. Helper launch assigned gpt-6.2-sol/ultra. Independent runtime and lead settings are unavailable. I authored the inherited compatibility reconstruction, defect equation and E05 identity. E187/E189's finite algebra is separately assessed.

## Disposition

**Exact continuum positivity.** For \(D=\operatorname{diag}(1,u,v)\), \(1\le u\le v\le3/2\), \(c^2=3/(1+u^2+v^2)\) and \(Q=c^2D^2\), the actual zero-speed map has rank eight and twelve-dimensional kernel. On that kernel the full E187 derivative form, with both skew contributions, satisfies
\[
 R(X)\ \ge\ \frac{32768}{2205225}\sum_a |X_a|_{\mathrm F}^{\,2}.
\]
This is a non-optimal bound for the pointwise algebra throughout the closed triangle. Repeated spectra are included without imposing a repeated-eigenvalue assumption.

The quaternionic upper rank relation and an invertible \(8\times8\) lower block in weighted-trace coordinates give rank. The twelve edge-coordinate directions have a direct off-diagonal left inverse. In those coordinates the form is four copies of \(4c^2G\) for a scalar \(3\times3\) symmetric block \(G\). With \(L=12(uv)^3(1+u)(1+v)(u+v)\), all twelve signed row sums of \(2LG\) have positive exact Bernstein coefficients in \(u=1+ab/2,\ v=1+a/2\), \(a,b\in[0,1]\). Their minimum coefficient is \(384\). The degrees are \((14,8)\) or \((14,9)\), with zero elevation and zero subdivisions. All coefficients and denominators are retained in the JSON.

The verifier checks all twelve constraint-basis velocity, Sylvester, Bianchi and skew residuals symbolically, and the full original form's 144 polarizations against the reduced blocks. Round normalization and the E187 restricted entries agree exactly, and the six prescribed grid cases pass as sanity checks. Python 3.10.0 standard-library code reproduced byte-identical JSON. No further sample, new source, installation, global stationary theorem, classification outside the prescribed region, or flow conclusion enters.

## Frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [E202 request](SP4-CME-E202_REQUEST_v1.md) | 23f5cc5c0d1543f14f470b0982d74d1380cc3851b5c00d8578cbc8e1cccef815 |
| [B98](../../brainstorm/notes/B98_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 8619615c9a35c9c58cb834b277ebb1141a1f33f439283857bc2b42cab7553867 |
| [E187 note](../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E187 code](../../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E187 results](../../numerics/e187_stationary_kernel_results.json) | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [E187/E189 assessment](../../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [E189 verifier](../../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [E05](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E202 derivation](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 code](../../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E202 exact certificate](../../numerics/e202_general_stationary_pinching_results.json) | 2402caedf00f18274caecf494e4d8a44c520ea7aec4248cc9bc1dfb2ff85454e |

The return is the fourth owned output. Sole live status remains [REGISTER](../REGISTER.md). Independent assessment and any geometric application remain with the lead.
