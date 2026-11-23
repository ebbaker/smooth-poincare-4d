# E41–E44 — Lead assessment of the small continuous-data construction

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved; actual identifiers unavailable. The lead read E41 and E42 in full and reviewed the explicit E43 and E44 estimates. Configured helpers were gpt-6.2-sol/ultra; independent runtime introspection was unavailable. This is an internal research assessment, not external peer review or a novelty claim.

Accept the combined fixed-reference local result, with the completion qualifications below. E41 proves the two compact-bundle linear estimates assumed by E42. E43 checks their kernel, localized Gårding energy, parabolic singular integral, exact scaling and trace arguments. E44 checks E42 conditional on those inputs; its writer also wrote E41, so it is not independent review of E41. Acceptance rests on the displayed arguments, not agreement of assistants.

The accepted quantifiers are: for each fixed smooth definite reference connection, fixed sufficiently large Bianchi diffusion coefficient, fixed background pairing, and fixed p>6, there are positive epsilon, R and T depending on that fixed smooth structure and coefficient bounds. Every continuous pair within epsilon of the reference has a solution of E36 in the radius-R smooth completion of X_T, continuous to its datum, smooth at positive times, and unique in that ball. The solution is Lipschitz in the datum in X_T; all derivatives converge on compact positive-time strips when the continuous data converge. Distributionally compatible initial pairs stay compatible.

The linear proof uses Hermitian rank-one coercivity in a fixed pairing. It does not require positivity on arbitrary gradient arrays: local freezing and Plancherel give Gårding. The Levi series supplies only the first spatial kernel derivatives used directly; positive-time smoothness and the two-derivative singular integral have separate arguments. The upper forcing weight is r^(2−12/p), explicitly defined here; no ambiguous printed Koch–Lamm normalization is imported.

Two details are mandatory in integration:

1. The completed source spaces use sections smooth **through time zero**. Arbitrary finite source norms give only distributional zero trace. E43 supplies a flat heat example distinguishing this from uniform trace.
2. The linear evaluations must actually belong to the solution completion. For smooth u0, H(t)u0=u0+integral_0^t H(s)Lu0 ds; the first kernel derivative bounds its gradient correction by C sqrt(t) times the sup norm of Lu0. For smooth f,G on the closed slab, apply the same bound to f+div G. Both evaluations extend continuously in spatial C1 at zero and admit closed-slab smooth approximation in X_T. E41 estimates then pass to the completed inputs. E44 supplies this bridge explicitly.

E42's time-dependent lifted parameter maps give positive-time derivatives without differentiating continuous initial data. Its smooth compatible approximations have a common rough existence time, although their individual smooth comparison intervals may shrink. On each such comparison interval the connection principal coefficients depend only on A,F_A values; a cutoff around the compact initial jet image permits the smooth construction. Constraint propagation starts on a positive slice, avoiding an unjustified singular-time metric-derivative bound.

This establishes an adjusted local theorem in a small global C0 value neighborhood of one fixed reference. It does not show that an incoming unadjusted trajectory is in the adjusted uniqueness class, that recovery automorphisms extend smoothly across a singular endpoint, that the small value tube is preserved, or that arbitrary homotopy spheres admit definite initial data. E39's continuous heat example only obstructs one sufficient integrated-Hessian argument for the gauge.

## Frozen evidence

| Artifact | SHA-256 |
| --- | --- |
| [E41](../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md) | 8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3 |
| [E42](../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md) | 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77 |
| [E43](E43_COMPACT_LINEAR_AUDIT_20261122.md) | c649f1c7deef0c63acb48a37a21bf61cead23bdf9be9299287a3e0451924a43f |
| [E44](E44_ROUGH_SYSTEM_AUDIT_20261122.md) | ec0a69b82089c2c50230b590e5fcc03e57c47ce520fad78e951081133f1217b8 |

No source version changes: Koch–Lamm arXiv:1310.3658v1 and the undated author-hosted Taylor text remain the inspected versions. Their selected passages and these consumers belong to the [canonical source record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md).


## Manuscript compression audit disposition

The lead read [E46](E46_ROUGH_MANUSCRIPT_AUDIT_20261122.md), SHA-256 8fb18e7f32ffe8b7b8608c74002c0d0185e01b8ab8e99557e49a29ef4c769331, and integrated its concrete proof clarifications: approximate identity and causal residual, independent positive-time H1 start, finite-source truncation, parameter margins and strong continuity, joint value tube, completed short smooth comparison, final-slice compatibility closure, rough-field convention, and local-lifespan scope. Direct Taylor citation was added at the smooth comparison step; the exact inspected versions are unchanged. The theorem statement retains its assessed scope. E46 consumed manuscript hash56341f750e6f27353efa30571b542b590d1e5abbed82beb3237637039431736b before these changes and before the separate E45 corollary; its audit is not represented as covering that later corollary.
