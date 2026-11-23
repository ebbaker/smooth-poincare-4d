# SP4-CME-E223 return v1 — Endpoint speed-only absorption test

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B106, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored inherited E01A, E02A, E05, E202, E209 and the E219 audit. This calculation uses the assessed true endpoint radical and recomputes the full form.

## Disposition

**The pointwise speed-only bound fails at the one endpoint.** In the requested old \(K=1\) coordinates with \(Q_0=\operatorname{diag}(6/11,6/11,21/11)\), all eighty full symmetric radical–standard pairings were evaluated exactly. Twenty are nonzero. For \(t=\sqrt{14}/2\), take
\[
   Y=E_0,\qquad N=(t/2)E_0-(t/2)E_1+(t/2)E_7-E_{13}+E_{19}.
\]
Here \(E_j\) are the zero-based axis-major original trace-free coordinates and \(N\) is the assessed first edge radical. The checked values are
\[
  V(N)=0,\quad R(N)=0,\quad |V(Y)|^2=3552/121,\quad
  R(Y)=888/121,\quad B(N,Y)=-9\sqrt{14}/11 .
\]
Thus \(R(Y+\sigma N)=888/121-(18\sqrt{14}/11)\sigma\) tends to \(-\infty\) as \(\sigma\to+\infty\) while its actual velocity equals \(V(Y)\). No finite constant \(C\) can give \(R\ge-C|V|^2\) over the full derivative space at this \(Q_0\).

The script checks the actual trace-corrected velocity, both skew contributions in \(\Xi\), Bianchi and Sylvester residuals, and the full symmetric form by two polarizations. The eighty entries also agree with full matrix contraction. The note gives an additional direct derivation of \(B(N,Y)\) and checks the local quadratic-connection realization for each finite array. Realization keeps \(Q_0\) at the center and claims no neighborhood-wide spectral bound. Python 3.10.0 exact replay matched the JSON byte for byte. The conclusion excludes this pointwise absorption strategy. An integrated endpoint inequality by another argument, actual critical or global flows, and nearby-spectrum questions are outside this test.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E223 request](SP4-CME-E223_REQUEST_v1.md) | 2294e81b0ec1465303d742699fae17d5eb7fc6129c6add954e8519347d5f0cc2 |
| [B106](../../brainstorm/notes/B106_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 2abc6e7fc730d4b2dffd86d5d475bd5ca92739750e46331ed38b32f9331ddce1 |
| [E218/E219 assessment](../../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209 derivation](../../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E202 derivation](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 generator](../../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E187 generator](../../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E219 verifier](../../numerics/e219_sharp_stationary_verify.py) | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |
| [E02C](../../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E223 derivation](../../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E223 script](../../numerics/e223_endpoint_speed_absorption.py) | a7e19e60f9d46e0445dade72d1658da19e528b61b39d3465511dee221391170e |
| [E223 exact record](../../numerics/e223_endpoint_speed_absorption.json) | 6460cc140328afbc3e40afc4afe231a35f7645c40c6b5c56eae181957e7306ee |

This return is the fourth owned output. No other artifacts were edited, and sole live status remains [REGISTER](../REGISTER.md). Independent audit is required before consumption.
