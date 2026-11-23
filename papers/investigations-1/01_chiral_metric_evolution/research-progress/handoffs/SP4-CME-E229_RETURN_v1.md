# SP4-CME-E229 return v1 — Effective linear stationary coercivity

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E work under B108, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored E202 and E219. This packet reuses the frozen E219 conversion routines and independently checks the coefficient floor and the quantitative inequalities.

## Disposition

**Pass.** The natural \((37,23)\) determinant Bernstein numerator-pair array has its canonical SHA-256 9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978 and common positive denominator \(4311134142332645259085973815296000\). Its only zero is at \((37,0)\). All 911 positive coefficients are at least one by exact \(\mathbb Q(\sqrt{14})\) comparison, giving \(\delta_0=1\). The first test succeeded, so no minimum search or dyadic refinement was used. The small JSON records the result and script dependencies.

For every \(1\le r\le7/2\), every ordered model spectrum with \(v^2\le r\), and every actual zero-speed derivative array \(X\) there in old \(K=1\) units,
\[
          R_Q(X)\ge k(7/2-r)|X|^2,\qquad
          k=\frac{3}{704\cdot27648^3\cdot880^2}
            =\frac1{3840678118509930086400}.
\]
The determinant partition gives \(\det M\ge\delta_0(7/2-r)/4\). The scale \(L\) is at most \(27648\), \(|X|^2\le11|Z|^2\) by ordered diagonal reconstruction and ordinary projection, and the full-form operator bound \(120\) gives \(\lambda_{\max}(G)\le880\). The smallest eigenvalue is at least \(\det G/880^2\) by positive semidefiniteness. The bound covers repeated spectra and the collapsed round edge. At \(r=7/2\) it gives only nonnegativity. No upper bound, optimal constant, nonstationary coercivity, or analytical flow statement is claimed. E227 is not an input.

The script ran with Python 3.10.0 and produced byte-identical JSON on replay. No additional spectrum, source search, sampling, elevation, subdivision or shared edit entered. The next step is the separate E230 audit.

## Frozen and output identities

| Artifact | SHA-256 |
| --- | --- |
| [E229 request](SP4-CME-E229_REQUEST_v1.md) | 313d8a47b8acc218de7186274d0927dedde2f055b8a1675a42135894cdb3f15c |
| [B108](../../brainstorm/notes/B108_LINEAR_SPECTRAL_MARGIN_20261123.md) | f17210f4e9d9e5d2c8839b2413794cab0d03309368ce5d872b99cc35de385c6f |
| [E218/E219 assessment](../../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E220/E222 assessment](../../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E220 derivation](../../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E218 corrected generator](../../numerics/e218_stationary_spectral_range_v2.py) | da2fc957f844eecbd91a9366ee570b60eacd2352d0a92e3f289894a628516092 |
| [E218 canonical record](../../numerics/e218_stationary_spectral_range.json) | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
| [E219 verifier](../../numerics/e219_sharp_stationary_verify.py) | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |
| [E202 derivation](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E229 derivation](../../notes/229_LINEAR_SPECTRAL_COERCIVITY_20261123.md) | 64931775e41b7ec8d4954be80553ed68e7118611f866b2a951c4f6034d107471 |
| [E229 script](../../numerics/e229_linear_spectral_coercivity.py) | b7c82c99d8b9649faadf4e21fa5459881d7cca8db1d67af915166e17ac4d83f7 |
| [E229 exact record](../../numerics/e229_linear_spectral_coercivity.json) | b639ede02a3ff497e88d7efbfb9e6e28fb48ff261e6247c8a218c1fadba24e8b |

This return is the fourth owned output. Sole live status remains [REGISTER](../REGISTER.md).
