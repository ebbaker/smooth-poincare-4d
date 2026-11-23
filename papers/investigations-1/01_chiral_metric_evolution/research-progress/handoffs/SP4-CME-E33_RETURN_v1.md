# SP4-CME-E33 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper launch was
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. See the [frozen request][request] and
the [integration audit][audit].

## Fixed vertical adjoint

The live vertical term has the stated third-order symbol off the
reference. The fixed-adjoint operator is second-order quasilinear.
Its strict reference quadratic-form gap follows from the source
exact sequence and the \(\sqrt3\) cross-term bound. The audit
reopened Fine v2 §4.2 and Taylor's 1991 §7.3. E29's compact-bundle
argument supplies smooth short-time existence and uniqueness from
smooth data using the same symbol condition. The corrected reverse
system is second order with the stated transverse horizontal block
at \(\tau=0,h=\mathrm{id},A(0)=\bar A\). The ordinary recovery
equation is for \(j=g^{-1}\), with
\(\partial_\tau j=-\xi_{\rm fixed}(\hat A)\circ j\). Inverting
gives \(g\), and cancellation of the two group velocities gives
\(gh=\mathrm{id}\). The E30 coefficient-value gap along late
unadjusted fields does not amount to a continuous-endpoint restart.

The audit records exact edits for the metric variation notation,
the reference time, the inverse recovery flow and the sentence
counting derivatives of curvature in the principal coefficients.

## Finite-time sphere recognition

The static threshold \(\min\{2\pi,\sqrt3/(2C_S)\}\) checks
against Chang–Gursky–Yang's Theorem A, (0.3) and Remarks 1–2 on
printed p. 107. The Yamabe estimate, full Weyl norm factor and
strict inequality are as stated. On the supplied smooth interval
with common pinching and Sobolev bounds, the energy integration
gives the selected-slice gradient norm bound
\(\sqrt{2K E_{20}}e^{-Kt/4}\). Defect norm decay is \(18K\)
and squared \(L^4\) strain norm decay is \(K/4\). These give
the manuscript's \(A_*\) and waiting time in both cases
\(A_*>0\) and \(A_*=0\). The zero branch can be displayed
piecewise. All recognition constants and the averaging window
transform consistently under constant scale conversion. The
argument uses one supplied finite interval with its geometric
hypotheses and yields one qualifying slice.

The lead reported applying the wording and zero-branch edits after
input consumption. This return records the prior frozen TeX hash.
I wrote E26, E28 and E31 and participated in some underlying
estimates, so this audit is a check with prior participation.
No shared file was edited by this helper.

## Input and output identities

All ten frozen input hashes matched at consumption.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E33_REQUEST_v1.md | `3161d22eaefc9665b5b19a449a549efb7d03915c0d4942665e82a3920e0aa8d2` |
| chiral_curvature_and_metric_evolution.tex, consumed version | `6e2de7a2f3f5b5c4ebf6169b006b66baa708288c1313748d376d79b13138364d` |
| E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md | `c2d34ccb51417c0f7a99d932c8fa932ec8434630428a6ab5a0c720eaa666e3cf` |
| E30_E32_RECOGNITION_ASSESSMENT_20261122.md | `dba80a3e71b3a28367d4e5fec2ca6c7212c6931f8610fe6446fa8bfad55ac27f` |
| 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md | `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08` |
| 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md | `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175` |
| 29_LOCAL_PARABOLIC_INPUT_20261122.md | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |
| 30_CURVATURE_COEFFICIENT_REGION_20261122.md | `426b99a3e5cda892f192fc43a4e4efd8736bd44d11695daa3e44bef559fcf1cd` |
| 31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md | `bee7184d0bc257b4d173e105e75e25bd74349776d103c55db9777bcacb3451c8` |
| 32_ENERGY_SELECTED_SLICE_20261122.md | `98cfa4baaa4e3ba64dc9293888376660fab779e0bd395fcb8e4bab465ae4470e` |
| E33_INTEGRATION_AUDIT_20261122.md | `1ddda943054748a7f8471036fadfaae601042179928558df0c43d1755efe722c` |

[request]: SP4-CME-E33_REQUEST_v1.md
[audit]: ../../reviews/E33_INTEGRATION_AUDIT_20261122.md
