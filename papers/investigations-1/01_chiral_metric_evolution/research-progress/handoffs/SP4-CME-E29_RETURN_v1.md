# SP4-CME-E29 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The fixed-vertical-adjoint E27 equation has a unique smooth short-time
solution for smooth definite initial data with reference \(\bar A=A_0\).
It is a rank-twelve, quasilinear second-order system on the closed
bundle \(T^*M\otimes\mathfrak{so}(E)\). In the fixed native reference
pairing, the possibly nonsymmetric Fourier symbol has uniformly
negative Hermitian part on a sufficiently small first-jet
neighborhood. Sobolev continuity preserves the definite and
parabolic region for a short time. The proof gives the strong
smooth initial trace, and uniqueness in
\(C_t H^6\cap C_t^1 H^4\) there.

Fine v2 cites Taylor's 2011 Proposition 8.1. The publisher verifies
Chapter 15, pp. 313–411, and Taylor's author page identifies §8.
The 2011 theorem itself was unavailable through the inspected
publisher and mirror paths, so its exact statement and page remain
unverified. The primary substitute is Taylor's author-hosted
*Pseudodifferential Operators and Nonlinear PDE* (1991),
Chapter 7, equations (7.3.1)–(7.3.2) and Propositions 7.3.A–B,
printed pp. 147–149. This is vector-valued, uses the Hermitian
principal part, and explicitly allows time-dependent coefficients.
Its proof takes a torus for simplicity. The note justifies the
needed smooth compact-bundle version using spectral Galerkin
projection, localized coercivity, tame estimates, compactness,
and an \(L^2\) uniqueness argument. Four focused queries and
two principal texts were used.
[Taylor 2011 publisher chapter][springer] ·
[Taylor 1991 author-hosted text][taylor].

The same time-dependent theorem supplies the analytic input
for a reverse equation once its section chart, jet order and
strict symbol are supplied. The local verification does not
give a smooth restart from E24's continuous limits, a lifespan
from just algebraic curvature bounds, or a global flow result.

## Input and evidence hashes

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B24_LOCAL_GAUGE_CLOSURE_20261122.md` | `d688094532c759d3b7cd1291723fba58a42b0e5f6f743e28f5ce18c593129055` |
| `26_FINE_GAUGE_ENDPOINT_GAP_20261122.md` | `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08` |
| `27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| `SP4-CME-E29_REQUEST_v1.md` | `f5143d72e8a3d5b9e34685ee86e3c86e0b75575bb454ecfaf2c48af1f86f2531` |
| `29_LOCAL_PARABOLIC_INPUT_20261122.md` | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |

[note]: ../../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[request]: SP4-CME-E29_REQUEST_v1.md
[springer]: https://link.springer.com/chapter/10.1007/978-1-4419-7049-7_3
[taylor]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
