# SP4-CME-E201 return v1 — Independent axial stationary-form audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B97, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored the inherited E189 exterior audit and
verifier and the E07 jet calculation. E187 and E199 are separately
authored. [Full audit][audit].

## Disposition

**Pass.** For all \(t>0\), the actual velocity map has rank eight
and its kernel has dimension twelve. The four-covector quaternion
relation is onto, and the fixed minor is
\(589824t^8/(t^2+2)^2>0\). The global kernel basis and every
polarized Gram entry check, including all six distinct off-block
pairs. The four changes have determinants \(2,-2,2,2\), with
diagonal signs \(+,P(s),L(s)\) in each block, where
\(P(s)=4s^2+13s-2\), \(L(s)=7-2s\), and \(s=t^2\).

The exact positive endpoints are
\(t_-=\sqrt{(\sqrt{201}-13)/8}\) and \(t_+=\sqrt{7/2}\).
In positive, zero, negative order the inertia is \((12,0,0)\)
between them, \((8,4,0)\) at either endpoint, and \((8,0,4)\)
outside their closed interval. The four vanishing directions at
each endpoint pair to zero with the entire basis and span the
bilinear radical there. The denominators are positive at both
endpoints. All seven E187 exact certificates agree.

The independent checker uses E189's signed exterior reconstruction
and constant unstarred Bianchi solve. The actual velocity minor
clears to polynomial degree at most 24, the kernel residual to
degree at most seven, and the polarized Gram to degree at most
19. Additional degree bounds cover the serialized bases, changes,
diagonals, and endpoint vectors. Therefore the 25 exact rational
nodes certify identities for every positive parameter. The checker
uses only the Python standard library and the inherited E189
geometry. It ran successfully under Python 3.10.0.
[Independent verifier][verify].

I read the complete E199 rational implementation and checked its
assertion coverage. Replay of the original generator separately
gave the frozen JSON digest. The global degree and inertia
arguments in the audit supply the independent evidence. No new
literature, general spectra, critical-connection realization,
spectral confinement, general pinching or flow theorem is claimed.
Only the three assigned artifacts were written.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E201 request][req] | cfc7899aab7551c288e40ced50fed4683e93c678b028e5835a364aa78f33c7fc |
| [E199 proof][e199] | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E199 generator][script] | 015822bfcb450d58a023688dc0ae73651cb9e83e2f3ae73ca88fd1ba033c9862 |
| [E199 certificates][results] | df3af1193ad64823c132a8a39c429f0343aace80166772479c0d2614f2e7bead |
| [E199 return][e199ret] | 5506d9dd58de70f062f4e48a75683e5bec7854771e0e0b3d000d8183b946369e |
| [E187/E189 assessment][assess] | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [E187 proof][e187] | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E189 verifier][e189] | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [E05 energy gap][e05] | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [Nested B97][b97] | 001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c |
| [Nested E199 request][e199req] | 392a5807c62d5301c0ef6baeec43491afe7869853078d859abd221e4462d6998 |
| [Nested E187 generator][e187script] | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [Nested E187 certificates][e187data] | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [E201 audit][audit] | c87ef42cf1daede198aa460fba6f0aec034e428551315f9a8462ef6cd9a82a1a |
| [E201 independent verifier][verify] | abfcd93dd0bd8e268b8d04b613c652033501407d5a5d3d571333fddb86b2d47c |

[req]: SP4-CME-E201_REQUEST_v1.md
[e199]: ../../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[script]: ../../numerics/e199_axial_stationary_sign.py
[results]: ../../numerics/e199_axial_stationary_sign_results.json
[e199ret]: SP4-CME-E199_RETURN_v1.md
[assess]: ../../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md
[e187]: ../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md
[e189]: ../../numerics/e189_stationary_kernel_verify.py
[e05]: ../../notes/07_PINCHED_ENERGY_GAP_20261122.md
[b97]: ../../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[e199req]: SP4-CME-E199_REQUEST_v1.md
[e187script]: ../../numerics/e187_stationary_kernel.py
[e187data]: ../../numerics/e187_stationary_kernel_results.json
[audit]: ../../reviews/E201_AXIAL_STATIONARY_SIGN_AUDIT_20261122.md
[verify]: ../../numerics/e201_axial_sign_verify.py
