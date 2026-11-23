# SP4-CME-E218 return v1 — Sharp stationary spectral region

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E algebra, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable. I
authored the inherited E204 audit and E189/E201 pointwise audits.
E202 and E199 were separately authored.

## Disposition

**Full closed region certified.** The assessed E202 stationary
derivative form is positive definite on the actual twelve-dimensional
velocity kernel for \(1\le u\le v\le\sqrt{7/2}\) except at
\((u,v)=(1,\sqrt{7/2})\). Its inertia at that spectrum is \((8,4,0)\).
The complete radical is one scalar edge line per tangent axis,
with generator \(k=(-\sqrt{7/2}/2,1,-1)\). The four E199 upper
endpoint vectors agree exactly.

The exact \(17\times17\) square screen found 289 points
(273 distinct spectra), no negative principal minor, and one
zero determinant at \((a,b)=(1,0)\). The separate continuum
proof uses the three leading principal minors. Their natural
tensor bidegrees are \((13,9),(26,16),(37,23)\). The exact
positive, zero, negative coefficient counts are respectively
\((140,0,0),(459,0,0),(911,1,0)\). Each uses one closed unit
square with zero subdivision depth and zero degree elevation.
The determinant's sole zero coefficient is at \((37,0)\).
The corresponding basis weight is \(a^{37}(1-b)^{23}\), so
the determinant is positive at every other point. The first two
minors are strictly positive throughout. A Schur complement
gives the scalar inertia and the four identical copies give
the inertia of \(R\).

The exact axial identity for \(k(v)=(-v/2,1,-1)\) is
\[
 k(v)^{\mathsf T}G(1,v)k(v)=v^2(7-2v^2).
\]
It gives a negative pointwise direction as soon as \(v^2>7/2\)
on that edge, so the universal stationary-form upper ratio is
sharp. This result concerns the abstract pointwise derivative
form on the stationary kernel. The packet includes the note,
generator, small exact record and this return. Replay matched
the JSON byte for byte.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E218 request](SP4-CME-E218_REQUEST_v1.md) | fcab9afee1ebf41e084f020c68f58d67354ade3e5be16801045d934b97eee639 |
| [B104](../../brainstorm/notes/B104_STATIONARY_SPECTRAL_RANGE_20261123.md) | 939088ae96bea13fe0f78639b7d90696c62fa0dbfc3a43cc757d430fdc2e2215 |
| [E202 note](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 generator](../../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E204 audit](../../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202–E204 assessment](../../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E199 note](../../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E199/E201 axial assessment](../../reviews/E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123.md) | 522b79b77dd001811541c4efa75c217fbfd96fee0faf6d732ab1905ad9521843 |
| [E218 derivation](../../notes/218_STATIONARY_SPECTRAL_RANGE_TEST_20261123.md) | 68525110f98c8fb66e1c68b472ae19d04bcc83726787336860eaedf999f81b83 |
| [E218 generator](../../numerics/e218_stationary_spectral_range.py) | a42c5f57f846dfaa33e5f73c875e4eccf8d6ba969a7ab377d298bdc000f14f40 |
| [E218 exact record](../../numerics/e218_stationary_spectral_range.json) | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
