# SP4-CME-E21 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The proposed estimate holds for the explicit heat semigroup
solution of \(U_t=4\Delta_{\mathbb R^4}U-12KU\), with \(K\ge0\)
and smooth compactly supported \(\mathbb R^{20}\)-valued data.
In the Lorentz norm \(\int s^{1/4}f^*(s)\,ds/s\),
\[
\int_0^\infty
(\|\nabla U(t)\|_\infty+\|U(t)\|_\infty^2)\,dt
\leq C(\|U_0\|_{4,1}+\|U_0\|_{4,1}^2)
\]
uniformly in \(K\) and in the data.

The radial decreasing derivative majorant is a constant
times \(t^{-5/2}\exp(-|x|^2/(32t))\).
Translation-uniform layer-cake and rearrangement estimates
bound the spatial suprema at each time. Tonelli then
integrates the rearranged majorant to the \(s^{-3/4}\)
endpoint weight. The squared-supremum estimate follows by
multiplying \(\sup_t\sqrt t\,\|U\|_\infty\) and
\(\int t^{-1/2}\|U\|_\infty\,dt\), both bounded linearly by
the initial Lorentz norm. The positive damping only improves
these estimates.

Under \(U_\lambda(t,x)=\lambda U(\lambda^2t,\lambda x)\),
the parameter becomes \(\lambda^2K\) and both sides of the
estimate are invariant. The round strain equation lives on a
bundle, uses a chiral rough Laplacian and contains the
internal curvature action and the additional scalar
coefficient in E15. Nonlinear transfer additionally depends
on the evolving metric, ellipticity, regularity, gauge and
source estimates. No actual-flow bound is inferred.

## Input and evidence hashes

The frozen inputs matched when read. E15 is a supplementary
input for the stated round comparison.

| File | SHA-256 |
| --- | --- |
| `B18_LORENTZ_HEAT_BRIDGE_20261122.md` | `7e8d9c1a5ffd508f0411c98ba4d7511f5df659b7a5e6fbd6ac0aa4dfdff26cfb` |
| `19_LORENTZ_SPATIAL_BENCHMARK_20261122.md` | `32294f3f9d29bac5077e0a03ccd6d2e81712313afe40059d052467e3a371bb21` |
| `16_TEMPORAL_STRAIN_CRITERION_20261122.md` | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| `17_STRAIN_EVOLUTION_STRUCTURE_20261122.md` | `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3` |
| `SP4-CME-E21_REQUEST_v1.md` | `26d768100767c2e0ddaed21cdc0f5e817ca5ad210e51b6b571ae2148b20468bb` |
| `21_LORENTZ_HEAT_BENCHMARK_20261122.md` | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |

[note]: ../../notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md
[request]: SP4-CME-E21_REQUEST_v1.md
