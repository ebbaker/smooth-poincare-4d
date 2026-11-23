# SP4-CME-E54 request v1 — small-data quasilinear critical calibration

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; actual lead identifiers unavailable. This is fixed E execution of B37, not a new geometric flow selection.

Own only notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md and research-progress/handoffs/SP4-CME-E54_RETURN_v1.md. No shared edits. Read B37 and the E53 lead assessment.

Frozen input: notes/53_CRITICAL_FINITE_P_HEAT_20261122.md SHA-256 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312. Use its exact torus, dyadic partition, finite-dimensional real Euclidean values, s=1/2, p=8 and E_T norm. Report consumption.

For fixed smooth coefficient maps A^{ij}(z):R^N→End(R^N), A^{ij}(0)=0, and fixed smooth bilinear maps Q^{ij}(z), defined on a neighborhood of zero, prove or precisely disprove a global small-data mild theorem for

    U_t=Delta U−U+sum_ij A^{ij}(U)partial_ij U
                    +sum_ij Q^{ij}(U)[partial_i U,partial_j U].

Initial data are real U0 in B^(1/2)_(8,1), small there. Work in the complete strongly traced E_infinity class from E53. Establish existence, uniqueness in a specified small ball, Lipschitz dependence, small values and uniform parabolicity, and integral ||D²U||infinity bounded by the initial critical norm. Combine with the E53 full-gradient embedding to state a small L8+gradient L^(4,1) sufficient condition. Do not claim a geometric-flow transfer, intrinsic strain estimate, general smooth uniqueness, or original-flow gauge result.

Required proof: supply product, smooth composition and difference estimates at positive critical order. A direct finite-difference or dyadic proof is allowed, with equivalence details if changing descriptions. For principal terms need ||A(U)D²U||L1 B^.5 ≤ C||U||tildeL∞B^.5 ||U||L1B^2.5 and the corresponding difference. For gradients derive the L2-time B^1.5 control by block interpolation and summation, then estimate quadratic products in L1B^.5, including coefficient differences. Track constants, low blocks, time-sum ordering, coefficient tube, contraction radius and strong trace. Any smoothness upgrade must be proved separately if stated; it is not required for acceptance of the mild theorem.

Use only a finite fixed coefficient tube and explicit smallness. If a product/composition bound fails, give the exact obstruction and return without changing p, s or the equation. New source dependencies require primary version, exact passage, hypotheses and inspection metadata for lead integration. No new source is required if the elementary estimates are derived completely. Return at the packet boundary with complete derivations.
