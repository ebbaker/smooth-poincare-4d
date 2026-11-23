# SP4-CME-E17 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

For the fixed unit round \(S^4\), the Green kernel with
\(-\Delta G_x=\delta_x-1/V_0\) satisfies
\[
-G'(r)=\frac{\int_r^\pi\sin^3 t\,dt}{V_0\sin^3r},
\qquad |G'(r)|\leq \frac{\pi^3}{2V_0}\,r^{-3}.
\]
The flux tends to one at the pole and vanishes at the
antipode. The polar ball bound gives weak \(L^{4/3}\) norm at
most \(B=(\pi^3/(2V_0))(\omega_3/4)^{3/4}\), where
\(\omega_3=2\pi^2\). The Lorentz pairing follows by layer-cake
and rearrangement with the requested \(\int s^{1/4}f^*(s)\,ds/s\)
convention. Punctured-ball integration by parts gives the
gradient representation at every point for Lipschitz \(\log D\).

Consequently \(\operatorname{osc}\log D\leq
C_{\rm round}\||T|_{g_0}\|_{4,1;dV_{g_0}}\) with
\(C_{\rm round}=2\sqrt2B\). If \(C_0^{-1}g_0\leq\widehat
g\leq C_0 g_0\), switching both the tensor norm and measure to
\(\widehat g\) costs at most the factor \(C_0\). The energy
anchor \(e<3/2\), \(r=\sqrt{2e/3}\) gives
\(D\leq D_*=\sqrt{(1+r)/(1-r)}
\exp(C_{\rm round}\||T|_{g_0}\|_{4,1;dV_{g_0}})\)
and \(m\geq3/(1+2D_*^2)\).

On the E12 logarithmic family, fixed \(\delta>0\) forces a
Lorentz reference norm at least
\(C_{\rm round}^{-1}\log((1+\delta)/(1-\delta))\).
The lower bound in reconstructed norms is half that value
by the family's \(C_0=2\) comparison. The ordinary \(L^4\)
norm tends to zero. This is a fixed-reference spatial
benchmark and supplies no progress on initialization on an
unknown sphere or on a dynamic bound for the Lorentz norm.

## Frozen inputs and evidence

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B16_ENDPOINT_SPATIAL_NORM_20261122.md` | `8aacbe956fe055e47dbb55789f19fbd38a844abd7f2c603e3eefbf3d23f8dc13` |
| `06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md` | `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb` |
| `14_CRITICAL_STRAIN_CONCENTRATION_20261122.md` | `9df659ec21fb1d511ef637dbd8ca6b3109ebad8252426135f46cf0986a9dd7fb` |
| `SP4-CME-E17_REQUEST_v1.md` | `3cfbfc5b13f0e634e011ca0a615da8935bdcf25f447f1c5707d2226e676fe6ce` |
| `19_LORENTZ_SPATIAL_BENCHMARK_20261122.md` | `32294f3f9d29bac5077e0a03ccd6d2e81712313afe40059d052467e3a371bb21` |

[note]: ../../notes/19_LORENTZ_SPATIAL_BENCHMARK_20261122.md
[request]: SP4-CME-E17_REQUEST_v1.md
