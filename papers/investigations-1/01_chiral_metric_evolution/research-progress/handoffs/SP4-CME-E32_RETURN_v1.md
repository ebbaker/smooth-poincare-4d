# SP4-CME-E32 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The proposed selected-time constants are valid. Assume the smooth
unadjusted solution, common pointwise pinching, and one scalar
Sobolev constant through \(t+1/K\), and
\(Y_0=\|T(0)\|_4^2<(2CC_S)^{-1}\).
The E19 energy and first-crossing argument give
\(Y(s)\leq Y_0e^{-Ks/4}\) for the squared \(L^4\) norm.
Then E16B absorption gives
\[
E_2(s)\leq E_{20}e^{-Ks/2},\qquad
\int_t^{t+1/K}\|\nabla^AT(s)\|_2^2\,ds
\leq2E_{20}e^{-Kt/2}.
\]
The common pinching threshold is at most \(1/8\), so E05
gives \(36K\) decay of \(\mathcal P=2K^2\|q\|_2^2\)
and \(18K\) decay of the \(q\) norm. The volume density is
fixed pointwise for this unadjusted flow. The tensor norms
still use the instantaneous reconstructed metric.

The continuous gradient energy attains a value no greater
than its mean at a time \(\tau\in[t,t+1/K]\), and this yields
\[
\|R_K(\tau)\|_2
\leq KQ_{20}e^{-18Kt}
+\bigl(6\sqrt{2KE_{20}}+(42+8\sqrt3)Y_0\bigr)e^{-Kt/4}.
\]
This gradient estimate is specific to the selected time.
If \(A_*\) is the sum of the two coefficients and
\(\theta>0\), take
\(t\geq(4/K)\max\{0,\log(2A_*/\theta)\}\) for \(A_*>0\),
or \(t=0\) if \(A_*=0\). The bound is at most
\(\theta/2\). Smooth existence, pinching and the uniform
Sobolev inequality are still needed through \(t+1/K\).
No static recognition conclusion or global flow theorem is
imported into this packet.

## Input and evidence hashes

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B26_GOOD_SLICE_SPHERE_ROUTE_20261122.md` | `22f9a19dbb36a9dfb4534ca16af8f7a7ee16953f75aaea098ef5d0a4c453f44c` |
| `07_PINCHED_ENERGY_GAP_20261122.md` | `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb` |
| `18B_STRAIN_ENERGY_ESTIMATE_20261122.md` | `713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437` |
| `20_CRITICAL_STRAIN_ENERGY_20261122.md` | `5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228` |
| `SP4-CME-E32_REQUEST_v1.md` | `f59ce529d9091db1b6b1a0d23961243600284e8dac343e340ddbd43213ef759a` |
| `32_ENERGY_SELECTED_SLICE_20261122.md` | `98cfa4baaa4e3ba64dc9293888376660fab779e0bd395fcb8e4bab465ae4470e` |

[note]: ../../notes/32_ENERGY_SELECTED_SLICE_20261122.md
[request]: SP4-CME-E32_REQUEST_v1.md
