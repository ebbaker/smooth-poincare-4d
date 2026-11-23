# E168/E169 assessment — Metric compactness and two-bound continuation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Selected lead unchanged, actual lead model/effort
unavailable. Bounded helpers configured gpt-6.2-sol/ultra, without independent
runtime attestation. The lead read the full E168 construction, E169 audit
and both returns, and checked the recorded hashes.

Accept the combined result, with the historical H_pre premise now
discharged by the separate
[E165/E167 assessment](E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md).
The [ALE source assessment](E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md)
and [independent core audit assessment](E166_ALE_CORE_AUDIT_ASSESSMENT_20261122.md)
complete the other dependencies. Frozen conditional notes remain unchanged.

For a sequence of smooth Riemannian metrics on a fixed smooth closed
connected oriented homotopy four-sphere, uniform absolute Ricci and W+
bounds, positive total volume lower bound, and finite diameter upper
bound give a subsequence converging to a positive C1,1/4 metric after
smooth orientation-preserving diffeomorphisms of that same base. A weak
W2,8 subsequence exists in a fixed smooth atlas. This conclusion is
metric compactness at the stated regularity. No injectivity-radius
lower bound or full-curvature supremum estimate is asserted.

The contradiction to vanishing harmonic radius uses a full smooth ALE
core and the actual compact embeddings from E165. The complementary
case is also proved: a positive radius floor gives a finite atlas with
persistent overlaps, converging harmonic transitions and cutoff-coordinate
embeddings. The decisive uniform projection argument chooses its tube
radius before the smooth reference member. For local embedding derivative
bound L and cutoff separation constant C_b, the squared-distance Hessian
is at least I−Lr(1+2LC_b)I. At the foot equation the derivative estimate is
|Dq−I|≤4L(1+LC_b)delta. Uniform smallness gives local inverses; separation
places any two competing preimages in one convex chart, giving global
injectivity. Compactness and openness give surjectivity. Fixed-reference
smooth projection and inverse derivative estimates then give C1 metric
convergence. Smooth Einstein regularity is not used for this unscaled
limit.

Consequently, for a supplied smooth definite original Fine flow in native
time on a homotopy four-sphere in the chosen positive-plane,
round-compatible component, simultaneous bounds on sup Psi and diameter
along one sequence tending to a finite endpoint imply smooth definite
continuation in the original identification. Native volume conservation
supplies the positive volume bound. The assessed E159 constants supply
Ricci, W+ and strain bounds. The assessed E155/E157 topology supplies a
positive compatible pair accumulation sequence and E148 supplies original
continuation. No bound between the selected times is needed.

This strengthens the earlier criterion by removing its supplied
injectivity assumption on homotopy spheres. It supplies neither
Psi nor diameter estimates along a general flow, nor initial definite
data or long-time convergence. The proof is an assessed branch derivation,
not a novelty claim or external specialist verification.

## Verified inputs

| Evidence | SHA-256 |
| --- | --- |
| [E168 note](../notes/168_CONDITIONAL_METRIC_COMPACTNESS_CRITERION_20261122.md) | 110a1dfe4f288f82e93db40aace8972efe5aa02a3b61f6d96ab832e3aebda487 |
| [E168 return](../research-progress/handoffs/SP4-CME-E168_RETURN_v1.md) | 549ced4de48e0bb59adc1a18c9d1ef7858cd889445c233751e900e375ea63fbd |
| [E169 audit](E169_COMBINED_METRIC_COMPACTNESS_AUDIT_20261122.md) | 57a28fb97f88807273140f5dc948c9d7f1d9c3b13941c0698aec1782fcc1bf01 |
| [E169 return](../research-progress/handoffs/SP4-CME-E169_RETURN_v1.md) | aa4713fa835d53c0ed636d98d735668c237e207249e18b1dbeb5356b6c0aac8c |

E169 did not author E168's unscaled construction; it did author the
inherited E165/E162 inputs. Those inputs have their separate audits.
The detailed overlap is disclosed in the audit and is not presented
as complete independent rederivation of the whole dependency chain.
