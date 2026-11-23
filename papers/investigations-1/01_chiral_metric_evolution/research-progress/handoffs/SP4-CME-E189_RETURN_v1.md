# SP4-CME-E189 return v1 — Independent stationary-kernel audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B92, configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and selected lead
settings are unavailable. I authored inherited E07 and E02C. I
independently reconstructed and checked the new E187 certificates.
[Full audit][audit].

## Disposition

**Pass.** Using the exact older bracket, oriented Euclidean triple
and \(K=1\), the rational Sylvester and Bianchi factors, actual
velocity constraint and E05 commutator sign check. The independent
verifier constructs exterior wedges, solves the unstarred Bianchi
equation, and polarizes the scalar form. It verifies the complete
stored restricted matrices and the original-coordinate congruence
bases with the independent geometry. No repair was found.

All seven velocity ranks are eight and kernel dimensions twelve.
The restricted inertia is \((12,0,0)\) at \(1/2,1\) and
\((8,0,4)\) at \(1/8,1/4,2,4,8\), in positive, zero, negative
order. All five stored negative witnesses have zero velocity.
The explicit independent wedge contractions give
\(R=-1537/88\) at \(t=1/4\) and \(R=-8/19\) at \(t=2\).
At round the full form is \(4\) times Frobenius and the E07
kernel tensor gives \(R=16\).

Run `python3 numerics/e189_stationary_kernel_verify.py` from the
investigation directory to reproduce the independent checks on
the frozen JSON. Python 3.10.0 ran all of them successfully.
A separate original E187 script replay into temporary output
was byte-identical to that JSON. No original source or evidence
file was modified.

These results exclude pointwise nonnegativity on the abstract
stationary derivative kernel at the five tested spectra. They
do not realize the arrays on a critical connection, transfer
the sign between samples, or give a global critical classification
or singular trajectory. Only the three assigned outputs were
written. No new source search or further spectral case was used.

## Verified versions

| File | SHA-256 |
| --- | --- |
| [E189 request v1][req] | 6a07f5b8b7e73f64e48c7ae2c0b8c40bed644f2764211762aa5377a8ec844064 |
| [E187 note][e187] | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E187 script][script] | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E187 JSON][json] | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [B92][b92] | 4368eb9bf3ef70004be357711a42f926b314b2d037aa96482582755bbfa5d8a9 |
| [E05][energy] | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E01A][compat] | c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f |
| [E02A][defect] | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| [E189 audit][audit] | 7f8c8fd853d1eef2575917b95550670767db47e9488df4cd4be63217d7d24bea |
| [Independent verifier][verify] | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |

[req]: SP4-CME-E189_REQUEST_v1.md
[audit]: ../../reviews/E189_STATIONARY_KERNEL_AUDIT_20261122.md
[e187]: ../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md
[script]: ../../numerics/e187_stationary_kernel.py
[json]: ../../numerics/e187_stationary_kernel_results.json
[b92]: ../../brainstorm/notes/B92_STATIONARY_COERCIVITY_ALGEBRA_20261122.md
[energy]: ../../notes/07_PINCHED_ENERGY_GAP_20261122.md
[compat]: ../../reviews/E01A_AUDIT_20261122.md
[defect]: ../../notes/04A_NONLINEAR_Q_20261122.md
[verify]: ../../numerics/e189_stationary_kernel_verify.py
