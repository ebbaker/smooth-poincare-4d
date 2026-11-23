# B111 — Realize the local ratio germs inside convergent closed flows

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved; actual settings unavailable. B work is lead-owned; fixed E helpers are configured gpt-6.2-sol/ultra, with independent runtime attestation unavailable.

## Decision and restricted question

E235/E236 is a local vector-field result. Test whether its r-down-to-one family embeds in a globally definite connection on the already standard round sphere, with small connection/curvature values. This is a concrete route to an actual evolved local maximum, and does not require solving the harder global ratio-cap gluing problem. The small-value round basin already accepts smooth inputs without a uniform bound on higher derivatives. A singular third-jet size therefore need not prevent entry.

Fix standard oriented S4, its round-compatible perfect chiral SO(3) connection A_rd, and an old K=1 normal chart with a smooth radial bundle gauge at p. Arrange F_rd(p)=-Sigma and A_rd(x)=one-half sum x^j contraction_j(-Sigma)+O(|x|^2), with first derivative remainder O(|x|). Let r=1+epsilon, 0<epsilon<epsilon0, and let A_r^loc be exactly E235's polynomial germ in that chart/gauge. Its linear coefficient differs from the round one by O(epsilon), while its cubic coefficient is O(epsilon^-1). Select one fixed smooth cutoff chi on R4, equal to1 on |x|<=1/2 and0 for |x|>=1. Set R=epsilon^2 (shrink the fixed chart once if needed) and

    A_epsilon=A_rd+chi(x/R)(A_r^loc-A_rd)

inside the chart, extending the difference by zero. The target estimates are sup|A_epsilon-A_rd|=O(epsilon R+R^2+R^3/epsilon) and fixed-background C1 difference O(epsilon+R+R^2/epsilon)=O(epsilon). Constants depend only on the fixed chart/reference/cutoff and bounded r in (1,1+epsilon0). Thus the actual curvature difference is O(epsilon), and definiteness/sign follow from openness at the compact round reference. Exact agreement near p retains the E235 quotient Hessian and native derivative.

## Conditional flow consequence and scope

E240 derives this cutoff estimate with the exact connection transformation, actual curvature and jet agreement. E241, independently of that unfinished estimate, takes an explicit H_cutoff premise with these conclusions and applies assessed E49–E52 small-value stability. It must verify smooth recovery through time zero, so the actual original solution has the E235 native derivative1/2 at p. By the ordinary finite-dimensional implicit-function theorem, the negative scalar Hessian should continue the strict local maximum along a smooth p(t) for a datum-dependent interval, with initial log-ratio derivative1/2. This gives actual short-time growth of a local maximum inside a global round-attracting flow (at least modulo the time-dependent automorphisms provided by that specific assessed theorem).

No claim is proposed that p is a global initial maximum, that sup rho initially equals r, or that a globally pinched region fails to be preserved. The annulus is controlled only by C1 smallness; sup rho=1+O(epsilon) is enough. No uniform crossing time, higher-norm bound, arbitrary-r global embedding or initialization on an unknown homotopy sphere is proposed. This fixed near-round cutoff is separate from the earlier naive affine-averaging obstruction. If an estimate fails, return that specific obstruction instead of enlarging the gluing class. A separate independent audit is required before assessment or manuscript integration.

Inputs: [E235/E236](../../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md), [E235](../../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md), [E49–E52](../../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md), [E50](../../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md). No new external theorem is being imported; the local implicit-function argument will be displayed.
