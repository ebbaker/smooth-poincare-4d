# SP4-CME-E22 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The actual round linear strain operator satisfies the endpoint
bound on every smooth section of
\(T^*S^4\otimes\operatorname{Sym}^2_0 E\):
\[
\int_0^\infty
\left(\|\nabla e^{tL_K}T_0\|_\infty+
      \|e^{tL_K}T_0\|_\infty^2\right)dt
\leq C(N_K+N_K^2),\qquad
N_K=\|T_0\|_{4,1;g_K}.
\]
The Lorentz integral uses the E21 rearrangement convention.
The constant is independent of \(K>0\): under the round
homothety \(L_K=K L_1\), the initial covector amplitude
scales by \(\sqrt K\), the measure by \(K^{-2}\), and both
time integrands by \(K\).

At unit scale, the parallel self-adjoint reaction yields
\(e^{tL_1}=e^{tZ}e^{-4tP}\) with
\(\|e^{tZ}\|_{\mathrm{op}}\leq e^{-12t}\).
Ludewig's Theorem 1.1 gives the differentiated Gaussian
quotient for the smooth metric bundle, on the compact
near-diagonal set \(r\leq\pi/2\). Theorem 3.5 gives the
global exponential with larger polynomial loss, which can
be absorbed into a wider Gaussian on \(r\geq\pi/2\).
After \(\sigma=4t\), this yields the short-time bundle
kernel bound \(Ct^{-2}e^{-r^2/(32t)}\) and covariant
derivative bound \(Ct^{-5/2}e^{-r^2/(32t)}\).
The gradient estimate is taken from the bundle result.
Round ball-volume comparison, rearrangement and Tonelli
produce the endpoint weight. Fixed-time smoothing and
\(L^1\) contraction supply the late-time estimate with
exponential reaction damping.

Three focused search queries led to one main primary text:
Matthias Ludewig, *Strong short-time asymptotics and
convolution approximation of the heat kernel*,
Ann. Glob. Anal. Geom. 55 (2019), 371–394, DOI
10.1007/s10455-018-9630-4. Read §2 for operator
conventions and Theorems 1.1 and 3.5 on pp. 372 and 382
respectively in the published PDF. No source hypothesis
remains unidentified for the stated round operator.
[Published Ludewig article][ludewig].

This result covers the full rank-twenty round linear
bundle and hence the strain variations within it.
It does not estimate the nonlinear flow with its moving
metric, variable principal matrix or gauge.

## Input and evidence hashes

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B19_ENDPOINT_TRANSFER_DECISION_20261122.md` | `da9868f2aeb22096f941beeb0ca44e351730d6fd4714e0b6c11884b38862af67` |
| `18A_ROUND_STRAIN_REACTION_20261122.md` | `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d` |
| `21_LORENTZ_HEAT_BENCHMARK_20261122.md` | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |
| `SP4-CME-E22_REQUEST_v1.md` | `d33837b91cb3f473948e80c85293e32d3ea051bbcf45db8f9e71df794c544bae` |
| `22_ROUND_LORENTZ_HEAT_20261122.md` | `6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b` |

[note]: ../../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[request]: SP4-CME-E22_REQUEST_v1.md
[ludewig]: https://pure.mpg.de/rest/items/item_3086319_4/component/file_3135346/content
