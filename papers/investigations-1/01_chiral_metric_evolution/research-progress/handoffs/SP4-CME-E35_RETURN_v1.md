# SP4-CME-E35 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

The proposed scalar identity and Yamabe constants are valid.
With \(b=A-\Gamma^+\) and the ordinary two-form pairing,
\(F_{\Gamma^+}=F_A-d_{\Gamma^+}b-[b\wedge b]/2\) and
\(s=-2\langle F_{\Gamma^+},\Sigma\rangle_E\). Parallelness
of \(\Sigma\) under the transported chiral Levi–Civita
connection gives
\[
s=4K\operatorname{tr}S+2\operatorname{div}V+
             \langle[b\wedge b],\Sigma\rangle_E,\qquad
V^a=\sum_i\Sigma_i^{ab}b_{ib}.
\]
The contractions are frame invariant. The pointwise bounds
\(|V|\leq\sqrt3|b|\) and
\(|\langle[b\wedge b],\Sigma\rangle_E|
\leq2\sqrt3|b|^2\) follow from the normalized chiral symbol
isometries and cross product bound. With the E09 estimate
\(|b|\leq2\sqrt3|T|\), the scalar baseline is at least
\(4\sqrt3K\) and integration against \(u^2\) costs at most
\(24\int|u||du||T|+24\sqrt3\int |T|^2u^2\).
Young's inequality and the supplied scalar Sobolev bound give
\[
Y(M,[g])\geq 3/C_S-(48+24\sqrt3)\|T\|_4^2.
\]
The estimate is scale invariant and uses no uniform eigenvalue floor
or small pointwise \(q\). It gives positive Yamabe constant for
\(\|T\|_4^2<((16+8\sqrt3)C_S)^{-1}\).
It supplies no full Weyl-energy estimate, sphere recognition,
or persistence along a flow.

## Input and evidence hashes

All frozen inputs matched when read. No external analytic theorem
beyond the conformal quotient was imported.

| File | SHA-256 |
| --- | --- |
| `B28_CRITICAL_STRAIN_YAMABE_20261122.md` | `c60ac2dd2d350f77877611fbfa05f4875ee9c1b9f5180d9535415e423a0bccab` |
| `11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| `31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md` | `bee7184d0bc257b4d173e105e75e25bd74349776d103c55db9777bcacb3451c8` |
| `SP4-CME-E35_REQUEST_v1.md` | `6eee9442ff9de1be6b1347c17c38be7ad518052d688033b9706158fafb2240b0` |
| `35_CRITICAL_STRAIN_YAMABE_20261122.md` | `4dfeb6dd4a6395e21a0f37716eb142d46cbdbf04866649a889e80fe22efbddbf` |

[note]: ../../notes/35_CRITICAL_STRAIN_YAMABE_20261122.md
[request]: SP4-CME-E35_REQUEST_v1.md
