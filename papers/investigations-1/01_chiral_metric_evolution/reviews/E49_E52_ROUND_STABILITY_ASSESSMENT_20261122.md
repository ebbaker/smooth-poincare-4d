# E49–E52 — Round stability and the small-value basin

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved; actual identifiers unavailable. Helpers were configured gpt-6.2-sol/ultra. The lead read E49/E50 and both complete focused audits and checked the weighted contraction, common smooth restart and automorphism order. This is internal research assessment, not external peer review or a novelty determination.

Accept [E49](../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md) and [E50](../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md), with [E51](E51_STABILITY_INPUTS_AUDIT_20261122.md) and [E52](E52_STABILITY_TRANSFER_AUDIT_20261122.md). E51 did not author E47/E48. E52 authored E47 and audits its use rather than independently verifying it. Mathematical acceptance rests on the displayed proofs and their checked dependencies.

| Frozen input | SHA-256 |
| --- | --- |
| E49 | 45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16 |
| E50 | ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf |
| E51 | 15f7ef87d7855b5011c53886016fcfe1bd66f050e9b3dd99e25a6d31481d4e4f |
| E52 | a5b19a37220c701154725ab7e2ca280a37a829aac06ae8b7a16203cdf9317a61 |

## Accepted inference

Fix the standard oriented round S4, its smooth positive perfect chiral connection A0, Fine's native pairing and time, and m≥6. In the explicitly corrected stability gauge, sufficiently H^m-small smooth perturbations have a global smooth solution with exponential H^m decay. The fixed-round linear operator, spectral trace and quadratic remainder are those in the [E47/E48 assessment](E47_E48_STABILITY_INPUTS_ASSESSMENT_20261122.md).

The half-line graph has strong H^m trace. The remainder estimate places one factor in unweighted L-infinity H^m and the other in weighted L2 H^(m+1), including the second term of the difference bound. With R≤1/(8KM) and initial norm<R/(4K), the map stays within 3R/8 and has Lipschitz constant≤1/4. Smoothness is separate: a fixed globally parabolic jet cutoff, scalar-principal powers of a fixed connection Laplacian, Taylor's tame bounds and Gårding yield a common local time controlled by H6. Higher smooth norms do not shorten that time. L2 comparison identifies each smooth solution with the global energy solution, and overlapping restarts cover the half-line.

The [small continuous-data adjusted theorem](E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md) then supplies a common positive smoothing time τ for inputs small in the fixed C0 norms of both A−A0 and F_A−F0. Its all-derivative continuity at the stationary zero datum makes the smoothed connection H^m-small. For each smooth input, the local path is also smooth through zero, with an individual short comparison interval that may depend on its higher derivatives.

Both adjusted paths recover the same original Fine equation by flows of smooth invariant vector fields on the compact principal SO(3) bundle. The local recovery exists slightly beyond τ. With c=g_loc(τ), the recovered stable tail is (c g_st(t−τ))·B(t−τ). Original smooth uniqueness, recentered at c·B(0), gives a genuine overlap and hence a smooth splice. The inverse comparison is h(t)=g_st(t−τ)^−1 c^−1. This gives global original-flow existence and exponential convergence modulo time-dependent smooth bundle automorphisms for **smooth** inputs in the stated small-value basin. E49 discharges E50's named stability hypothesis; the combined result is no longer conditional on an unproved H_st.

## Scope and references

The initial smallness requires no uniform bound on higher derivatives, but initial smoothness is required for recovery through time zero. No solution of the original equation from arbitrary continuous input, limiting automorphism, intrinsic-strain-only criterion, general finite-J restart, or initialization on arbitrary smooth homotopy spheres is obtained. Fine already states local stability; this work specifies a corrected gauge and trace construction and the stronger stated small-value entry criterion, without claiming certified novelty.

E51 rechecked the same Fine v2 selected passages and visually verified printed pp.33 and 38–40. E52 rechecked Fine Lemmas3.2/4.4 and equations(3.4),(4.3)–(4.4), and Taylor's inspected author text, printed pp.66,94,147,149. Exact hypotheses and version/provenance distinctions remain in the [canonical source record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#taylor-composition-and-commutator-input-for-stability). No new source version or PDF was retained. Manuscript integration belongs to the lead; its subsequent audit is separately recorded.


## E55 integration disposition

The lead read the entire focused manuscript audit E55, SHA-256 d0b4ec834da38ce9eca157076edd410bf9da660f1d3e3fd9f13f130b2a3d4f75. Its corrections were integrated after consumption of the frozen manuscript: live physical adjoint versus reference estimation norms; the derivative order of the outer d_A; exact Galerkin graph energy rather than differentiating an arbitrary equivalent norm; integer linear Sobolev order and explicit data/forcing/trace class; quantitative common H6 first-exit time; weak comparison in the same cutoff equation with justified energy pairing; a single B0 and smooth automorphism path for all later times; right-trivialized velocity and source attribution as statements. The assessed mathematics is unchanged. E55's frozen-input hash is preserved, and the final build identity is recorded separately in the integration record.
