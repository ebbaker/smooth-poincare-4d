# SP4-CME-E25 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The proposed endpoint second-derivative estimate fails on the
normalized flat four-torus. For the prescribed
\(f_N=\sum_{j=1}^N\cos(4^j x^1)\), orthogonality and the
supremum give \(\|f_N\|_2=\sqrt{N/2}\) and \(\|f_N\|_\infty=N\).
Splitting the rearrangement at \(s=1/(2N)\) gives
\(\|f_N\|_{4,1}\leq 8\,2^{-1/4}N^{3/4}\).
The positive-frequency Fourier coefficient of
\(\Delta e^{4t\Delta}f_N\) yields
\((e^{-4}-e^{-8})/8\) as a lower bound for the integrated
Lorentz norm on each disjoint interval
\([4^{-2j},2\cdot 4^{-2j}]\). The total integral is at
least \((e^{-4}-e^{-8})N/8\).

The ratio therefore grows at least as a positive constant times
\(N^{1/4}\). The scaled data \(N^{-7/8}f_N\) have vanishing
initial Lorentz norm and divergent forcing integral. Fixed
nonnegative damping \(\kappa\) only changes the lower bound
by the positive factor \(e^{-\kappa/8}\), so it does not
restore the estimate.

This rules out the proposed \(L^1_tL^{4,1}_x\) forcing estimate
for a general nonzero small constant times \(\Delta U\) based
only on the initial Lorentz norm. A small scalar diffusion
perturbation can be incorporated into the generator itself.
The test supplies no counterexample to Fine's flow, its
compatible strain system, or variable-principal methods in
general.

## Input and evidence hashes

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B21_PRINCIPAL_PERTURBATION_TEST_20261122.md` | `1576bcdaf6bbac6b3bf732c614d59715047d803c5c6907362ca062ae93b5f341` |
| `21_LORENTZ_HEAT_BENCHMARK_20261122.md` | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |
| `SP4-CME-E25_REQUEST_v1.md` | `240c885bcce11bfe3fad4601d59c0435a258505c5d07b5696087bd74204262a5` |
| `25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md` | `fd84cf6012ca8b318fe9220db74ffe42e7fd1ae323c0eb4a56bf5b495043c156` |

[note]: ../../notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md
[request]: SP4-CME-E25_REQUEST_v1.md
