# SP4-CME-E199 return v1 — Axial stationary-kernel sign classification

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B97, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the inherited E187 seven-case calculation. The new identities are checked symbolically. [Request][req] · [Proof note][note] · [Checker][script] · [Certificates][results].

## Disposition

Pass on the exact axial family for all \(t>0\). The velocity map has rank eight and kernel dimension twelve, with no exceptional positive parameter. Its fixed minor is \(589824t^8/(t^2+2)^2\), and its four-dimensional left relation follows from the quaternion coframe identity. Four rational \(3\times3\) blocks have invertible congruences, with change determinants \(2,-2,2,2\). Each has one positive diagonal and two entries with signs of \(P(s)=4s^2+13s-2\) and \(L(s)=7-2s\), where \(s=t^2\). All denominator factors are positive for \(t>0\).

The transition roots are \(t_-=\sqrt{(\sqrt{201}-13)/8}\in(1/3,2/5)\) and \(t_+=\sqrt{7/2}\in(9/5,2)\). Inertia in positive/zero/negative order is \((12,0,0)\) on the open interval, \((8,4,0)\) at either endpoint, and \((8,0,4)\) outside the closed interval. Explicit four-vector radical bases at both transitions are given in the original derivative coordinates by the note and JSON.

The rational checker verifies the full Bianchi reconstruction and velocity residuals, the fixed minor, basis identities, congruence and endpoint signs. It reproduces every E187 basis and restricted Gram entry at the seven original cases and regenerated the final JSON byte for byte on Python 3.10.0. No symbolic-library install, floating-point eigenvalue test, new source or unrelated computation entered. This resolves one axial pointwise sign problem. It supplies no stationary spectral confinement, general spectra, critical-connection realization or flow conclusion. All frozen inputs matched.

| Input or output | SHA-256 |
| --- | --- |
| [E199 request][req] | `392a5807c62d5301c0ef6baeec43491afe7869853078d859abd221e4462d6998` |
| [B97][b97] | `001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c` |
| [E199 note][note] | `e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d` |
| [Exact checker][script] | `015822bfcb450d58a023688dc0ae73651cb9e83e2f3ae73ca88fd1ba033c9862` |
| [JSON certificates][results] | `df3af1193ad64823c132a8a39c429f0343aace80166772479c0d2614f2e7bead` |

[req]: SP4-CME-E199_REQUEST_v1.md
[b97]: ../../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[note]: ../../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[script]: ../../numerics/e199_axial_stationary_sign.py
[results]: ../../numerics/e199_axial_stationary_sign_results.json
