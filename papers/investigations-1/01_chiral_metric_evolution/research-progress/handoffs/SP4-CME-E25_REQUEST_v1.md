# SP4-CME-E25 request v1 — Endpoint second-derivative forcing obstruction

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized Sol 6.2/ultra; selected lead actual settings unavailable. Own notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md and research-progress/handoffs/SP4-CME-E25_RETURN_v1.md only. No shared edits. Read B21 and E21.

On flat T4=(R/2piZ)^4 with normalized probability volume, test the uniform estimate integral_0^1 ||Delta exp(4tDelta)f||_{L^{4,1}}dt <= C ||f||_{L^{4,1}}, where Lorentz norm is integral_0^1 s^(−3/4)f*(s)ds. Use exactly f_N(x)=sum_{j=1}^N cos(lambda_j x1), lambda_j=4^j, N arbitrary positive integer, smooth real data.

Proposed proof to verify: orthogonality gives L2=sqrt(N/2), Linfinity=N. Integrating f*(s)<=min(N,sqrt(N/2)/sqrt(s)) gives initial Lorentz norm <=C N^(3/4). On disjoint intervals [lambda_j^(−2),2lambda_j^(−2)] within (0,1), the lambda_j Fourier coefficient of Delta heat(f_N) gives a uniform positive lower bound for its time-integrated L1 norm, hence for its Lorentz norm. Summing yields cN. Derive all constants and norm comparisons, show normalized initial data can be arbitrarily small while the ratio diverges, and check that fixed nonnegative damping does not repair high-frequency failure.

Then state the precise consequence: no bound of this form supplies an L1_t L^{4,1}_x forcing estimate for a general small constant coefficient times Delta U using only the initial Lorentz norm. Do not call this a failure of the actual Fine flow, its compatible strain equation, or all variable-principal perturbation methods. A constant scalar coefficient can be absorbed into the heat generator, so this is failure of the proposed estimate only. Finite scope one family and this conclusion; no alternate function-space theorem.

## Frozen inputs

- `brainstorm/notes/B21_PRINCIPAL_PERTURBATION_TEST_20261122.md` SHA-256 `1576bcdaf6bbac6b3bf732c614d59715047d803c5c6907362ca062ae93b5f341`
- `notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md` SHA-256 `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2`
