# SP4-CME-E53 request v1 — finite-p critical embedding and heat estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper gpt-6.2-sol/ultra; lead identifiers unavailable.

Own only notes/53_CRITICAL_FINITE_P_HEAT_20261122.md and research-progress/handoffs/SP4-CME-E53_RETURN_v1.md. Read B37. No shared edits or nonlinear theorem.

Finite fixed problem: flat unit T4, Lebesgue measure volume one, finite-dimensional real vector fields U. Define one standard inhomogeneous smooth dyadic Fourier partition Delta_j, j≥0, with low block containing zero and high blocks at |k|~2^j; state exact support and overlap conditions. Put ||U||B^s_(8,1)=sum_j 2^(sj)||Delta_j U||L8, s=1/2.

Prove or give a counterexample to ||U||B^(1/2)_(8,1) <= C(||U||L8+||dU||L^(4,1)), with the E21 rearrangement convention and fixed-dimensional constants. Start smooth and extend to the actual completion/weak-derivative class with a precise trace statement. An allowed direct method is to express each high block as a frequency-localized inverse derivative of f=dU; its L2→L8 gain after the 2^(j/2) weight is O(2^j), and its L8→L8 gain is O(2^(−j/2)). Relate the dyadic infimum sum to the K-functional for (L2,L8) at theta=2/3 and prove the needed Lorentz bound via rearrangement/amplitude splitting. Do not merely cite an unverified endpoint embedding; no gradient-preserving splitting is needed if the multiplier acts on arbitrary tensor fields.

For U_t=(Delta−1)U+f, show a uniform-in-T estimate with

 E_T(U)=sum_j 2^(j/2) sup_(0≤t≤T)||Delta_j U(t)||8
       +sum_j 2^(5j/2) integral_0^T ||Delta_j U(t)||8 dt,

bounded by C(||U0||B^(1/2)_(8,1)+||f||L1_t B^(1/2)_(8,1)), for 0<T≤infinity. Include the low block, semigroup estimates, strong initial trace, distributional uniqueness in the relevant norm and initial/source completion if required. Deduce integral_0^T||D²U||infinity <= C E_T(U) by fixed dyadic Bernstein; no nonlinear principal perturbation is yet controlled.

Frozen inputs (branch relative):
- notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md SHA-256 c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2
- notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md SHA-256 fd84cf6012ca8b318fe9220db74ffe42e7fd1ae323c0eb4a56bf5b495043c156

Read the existing canonical Taylor record if using its Fourier/paraproduct conventions. New primary dependencies require exact version, passage, hypotheses and inspection level for lead integration; no local PDF retention is required. Acceptance requires actual scaling/low-block/trace arguments. If embedding fails, give the first precise obstruction or smooth family and return to lead; do not change p or the target norm without a new decision.
