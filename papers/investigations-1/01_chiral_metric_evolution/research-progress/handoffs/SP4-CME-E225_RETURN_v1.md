# SP4-CME-E225 return v1 — Independent endpoint speed-absorption audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable.
I authored E218, E220 and the local jet input E02C. E223 was
separately authored. The inherited edge radicals use the
assessed E218/E219 result.

## Disposition

**Pass.** An independent linear solve from all unstarred
exterior Bianchi components reproduced the exact full
twenty-dimensional form at the sole frozen \(Q_0\).
I found the integer Bianchi determinant \(16\), verified
the residual at each tested tensor, and included the
Sylvester and mismatch parts of \(\Xi\) in both orders.
The scratch arithmetic independently matches all 400
full coordinate Gram entries, all 240 entries of the
twenty \(V/c\) columns, all four original radical
coordinate vectors, and all eighty radical–standard
mixed pairings. There are five nonzero entries per
radical. Frozen-script replay also matches the JSON
byte for byte.

At \(t=\sqrt{14}/2\), take \(Y=E_0\) and
\(N=(t/2)E_0-(t/2)E_1+(t/2)E_7-E_{13}+E_{19}\).
The independent exterior equations for \(Y\) give
\(b=(-33e^4/56,-55e^3/168,33e^2/56)\). The principal
pairing is \(12t/11\) and the nonzero ordered skew
contraction before averaging is \(60t/11\).
Thus \(B(N,Y)=-18t/11\), \(R(Y)=888/121\), and the
actual old squared velocity is \(3552/121\).
The verified \(R(N)=V(N)=0\) gives unbounded negative
\(R(Y+\sigma N)\) at fixed velocity \(V(Y)\) as
\(\sigma\to+\infty\).

The pointwise bounds \(R\ge-C(Q_0)|V|^2\) and
\(R\ge\kappa|X|^2-C(Q_0)|V|^2\) with \(\kappa\ge0\)
therefore fail on the full first-derivative space at
this endpoint. The local quadratic connection realizes
each finite jet at its center, with the claimed old
metric, endpoint spectrum and actual curvature. Compatible
frame changes and finite normalization changes preserve
the pointwise conclusion. The witness gives neither a
neighborhood-wide pinching hypothesis nor an integrated
energy-gradient counterexample. Only the owned audit
and return were written.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E225 request](SP4-CME-E225_REQUEST_v1.md) | 2a85615f94ed6e03f6aeca8afc7a51fca6b7c3af36d88c6fefe762c44eebdba7 |
| [B106](../../brainstorm/notes/B106_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 2abc6e7fc730d4b2dffd86d5d475bd5ca92739750e46331ed38b32f9331ddce1 |
| [E223 note](../../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E223 generator](../../numerics/e223_endpoint_speed_absorption.py) | a7e19e60f9d46e0445dade72d1658da19e528b61b39d3465511dee221391170e |
| [E223 exact record](../../numerics/e223_endpoint_speed_absorption.json) | 6460cc140328afbc3e40afc4afe231a35f7645c40c6b5c56eae181957e7306ee |
| [E223 return](SP4-CME-E223_RETURN_v1.md) | 7530a2b1f3f898b76a97411fb1274df5f4a40d5745145261eb48f3424150bcc5 |
| [E218/E219 assessment](../../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209 derivation](../../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E02C](../../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E225 audit](../../reviews/E225_ENDPOINT_SPEED_ABSORPTION_AUDIT_20261123.md) | e1ca568a7071e7df06a3b6d3acb08d0876f44434c525b9b30a65a4a6c82bacd1 |
