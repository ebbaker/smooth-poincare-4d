# E243–E245 — Global spectral cap crossing near the round connection

23 November2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved/unavailable. Helpers configured gpt-6.2-sol/ultra with independent runtime attestation unavailable. The lead framed B112, read all three complete outputs and independently checked the exterior coefficient, spectral-gap estimates, scalar Taylor radius, parameter-segment signs and actual-flow inference. Internal assessment is distinct from external peer review and priority certification.

Accept [E243](../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) with the independent [E244 verification](E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md), and the application [E245](../notes/245_CONDITIONAL_GLOBAL_RATIO_CAP_CROSSING_20261123.md). E244 did not read E243; it recomputed the new exterior, quotient, eigenvector and Taylor estimates from the common B112 plan and assessed E235 germ. E240's independent audit was pending at their input freeze and has since been accepted in [E240–E242](E240_E242_CLOSED_LOCAL_FLOW_ASSESSMENT_20261123.md). That staging is preserved. The static cap now supplies H_cap in E245; the frozen conditional note is not rewritten.

## Accepted static construction

Fix standard oriented smooth round S4 and its positive chiral SO(3) bundle. For all sufficiently small epsilon>0 use exactly E235's polynomial at r=1+epsilon, radius R=epsilon^2 and the fixed radial nonincreasing cutoff with derivative bounded by5/2. Its actual connection and curvature remain O(epsilon) from round in fixed C1/C0 norms. The polynomial curvature has only even terms. The normalized quotient has remainder O(epsilon^-2 |x|^4) after its quadratic term; eigenvalue gaps comparable to epsilon give the scalar log-ratio remainder O(epsilon^-3 |x|^4). At radius epsilon^2 this is O(epsilon |x|^2), so the uncut germ decreases strictly on the entire ball.

For the annular parameters u=c(s),v=sc'(s), the exact curvature contains u(F_loc-F_rd), u(u-1)[a wedge a]/2 and (v/|x|)n-flat wedge a. Its quotient has leading term I+epsilon h D, h=u+v/4, D=diag(-1/2,0,1/2), with uniform O(epsilon^2) errors in value and both parameter derivatives. The coefficient1/4 retains the affine1/2 and self-dual projection1/2. At h>=1/2, ordered gaps and eigenvector control make both log-ratio parameter derivatives positive; the segment from(1,0) lowers the value relative to the exact local polynomial. At h<=1/2, |h|<=5/8 gives a strict smaller ratio by eigenvalue Lipschitz bounds, including multiplicities. All constants are independent of epsilon, angle and bounded parameters. Consequently the actual global supremum is exactly1+epsilon, uniquely at p. No uniform radius is borrowed from the earlier fixed-r local proposition.

## Actual evolution and precise limits

For every sufficiently small epsilon this smooth datum enters the assessed small-value basin, with individual original smoothness through zero and no uniform higher-norm assumption. The actual native derivative of log rho at p is1/2. Thus, for each datum, its global original solution exceeds the initial closed cap1+epsilon at every sufficiently small positive time. E241 also continues a strict local maximum; a fixed-point derivative and continuity suffice for the supremum inference. E245 selects thresholds R_n down to1 lying strictly between each initial global supremum and a later value, giving failure of strict global caps for thresholds arbitrarily close to1 without any parameter-dependence theorem. The wedge quotient conjugates under bundle pullback and its eigenvalues compose with the base diffeomorphism, so the spatial supremum and crossing are invariant under those comparisons.

These are globally smooth positive definite trajectories on the supplied standard sphere. They retain the assessed exponential Hm convergence modulo time-dependent smooth bundle automorphisms. There is no claim of cap failure for every larger r, a uniform crossing time, singularity, novelty, or initialization on an arbitrary smooth homotopy sphere. A fixed limiting automorphism is not imported in this application. The stationary7/2 and margin-weighted conditional theorems remain valid at their stated hypotheses.

## References and identities

The original gradient, recovery, smooth local and round-basin dependencies are unchanged from [E240–E242](E240_E242_CLOSED_LOCAL_FLOW_ASSESSMENT_20261123.md). The new cutoff/eigenvalue arguments are displayed branch proofs, not imports from a primary source. [Canonical consumer record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#global-cap-crossing-consumers--e243-through-e245).

| Input | SHA-256 |
| --- | --- |
| [243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md](../notes/243_RADIAL_CUTOFF_GLOBAL_RATIO_CAP_20261123.md) | 7c29df2ad8a5acd3aabcce9b79e5a9e9628c784028997ce8512421c4ded50cb0 |
| [E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md](../reviews/E244_RADIAL_GLOBAL_CAP_VERIFICATION_20261123.md) | 4ebd6efc628bbf9afa4aba141b7c8a85df11509d9059ca774699bb81af4f0eb2 |
| [245_CONDITIONAL_GLOBAL_RATIO_CAP_CROSSING_20261123.md](../notes/245_CONDITIONAL_GLOBAL_RATIO_CAP_CROSSING_20261123.md) | 51bdbefca995164f60bde3557f23c74d7f964840602d0049fbeab275eebdc5e4 |
| [SP4-CME-E243_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E243_RETURN_v1.md) | f7eb9549350ec7ce04f81a9854991aea02f010ca98d5a1d4c77143084b32edac |
| [SP4-CME-E244_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E244_RETURN_v1.md) | 5d32940524643c4d2fe2301c6d3023492c70c33f1c592d320cf9d4ce5cbadd5f |
| [SP4-CME-E245_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E245_RETURN_v1.md) | 7eb570b117f9d557297c9817e52fa81fcc053774bca0aab5f565bfcec3c754c1 |
