# Lead assessment — E16 strain energy and E17 endpoint benchmark

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings retained; actual identifiers unavailable. Helpers configured gpt-6.2-sol/ultra, without independent runtime introspection. The lead read both derivations and recomputed the key algebra and estimates; this is not independent peer review or novelty certification.

## E16A and E16B accepted within their conditional scopes

The sign-calibrated curvature action is A=ΣJ_i⊗R_i with both factors skew. I checked the quaternionic product, the internal Casimir ΣR_i²=−6I, and the polynomial A²=A+6I. Zero trace on the 20-dimensional space gives eigenvalues −2 (12) and 3 (8), hence the round reaction −36K+8KA has upper bound −12K. This is an inequality on the full tensor space and so does not need the strain curl constraint.

In E16B the compact near-I coefficient argument is legitimate: Q is in the closed trace-three ball |q|≤1/8 contained strictly inside the positive cone, all matrix functions are smooth on a neighborhood, and the listed remainder terms have either K|q||T|, |T||∇T| or |T|³ degree. I checked the Ricci subtraction, internal curvature subtraction, determinant reaction derivative, derivative of G, velocity commutator and coefficient derivatives separately. No second derivative of T remains in the error. The inverse-metric Gram contraction is retained; volume conservation does not remove it.

Integration gives −7 D_T−24K E_T before error absorption. The displayed epsilon0 and C choices make
E_T'≤−D_T−K E_T+C∫|T|⁴ dV
valid on an interval where |q|≤epsilon0. Under a uniform scalar Sobolev constant and persistent ||T||4²≤(2CC_S)⁻¹, the squared L² strain decays at rate K/2. These are interval assumptions. They give no L∞ derivative bound or E14 temporal integral. B17/E19 next tests whether the critical-norm persistence can be derived from its initial value while retaining the other premises.

## E17 accepted as a fixed-reference benchmark

I independently integrated the radial round Green equation. The derivative is
−G′=(2−cos r)cos(r/2)/(6V0 sin³(r/2)), with pole flux one and no antipodal pole. Its bound C_G r⁻³, C_G=pi³/(2V0), and Vol(B_r)≤omega3 r⁴/4 give the stated weak L^{4/3} constant. The layer-cake intersection argument proves the pairing with the precise L^{4,1} convention. Punctured-sphere integration by parts extends it to the Lipschitz log D, so eigenvalue crossings are covered.

The tensor norm conversion costs sqrt(C0), while comparison of four-dimensional measures costs another sqrt(C0) in L^{4,1}; the total factor C0 is correct. Combining the oscillation estimate with the energy anchor gives the recorded eigenvalue floor. Applied to E12, it forces a positive lower Lorentz norm even though L⁴ tends to zero. This exhibits a stronger spatial quantity that survives that tested concentration family. The benchmark uses a supplied standard round reference geometry; it is not an initialization result on an unknown homotopy sphere and gives no norm evolution estimate.

## Reviewed versions

- [18A_ROUND_STRAIN_REACTION_20261122.md](../notes/18A_ROUND_STRAIN_REACTION_20261122.md) SHA-256 `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d`.
- [18B_STRAIN_ENERGY_ESTIMATE_20261122.md](../notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md) SHA-256 `8e64d9636552a2608bdb4f972ca2a9745f5698d709a7e651a01c43e394a83a87`.
- [19_LORENTZ_SPATIAL_BENCHMARK_20261122.md](../notes/19_LORENTZ_SPATIAL_BENCHMARK_20261122.md) SHA-256 `32294f3f9d29bac5077e0a03ccd6d2e81712313afe40059d052467e3a371bb21`.
