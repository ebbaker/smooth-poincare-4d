# SP4-CME-E38 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper launch was
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. See the [frozen request][req] and
the [density and closure proof][note].

## Verified result

For \(A=A_{\rm ref}+a\) continuous with continuous distributional
curvature \(F\), every fixed smooth coordinate and bundle chart has
\[
 d a_\alpha=(F-F_{\rm ref})_\alpha-
 [\Gamma_\alpha\wedge a_\alpha]-\tfrac12[a_\alpha\wedge a_\alpha]
 =G_\alpha
\]
continuous in distributions. The proof cuts off each local difference
form, convolves the coefficients and their distributional exterior
derivative, and sums with a subordinate partition to give smooth
global affine differences. The exact error in the fixed covariant
exterior derivative is the sum of terms
\(\eta_\alpha(du_{\alpha,\epsilon}-G_\alpha)\),
\(d\eta_\alpha\wedge(u_{\alpha,\epsilon}-a_\alpha)\), and
\(\eta_\alpha[\Gamma_\alpha\wedge(u_{\alpha,\epsilon}-a_\alpha)]\)
converted back to global forms. The proof includes the derivative
of the local cutoff and the cancellation of the derivative of the
bundle transition against the inhomogeneous connection term.
It uses only \(d a_\alpha\) and the values of \(a_\alpha\).

Consequently \(A_\epsilon\to A\) and \(F_{A_\epsilon}\to F\)
uniformly. Convolution preserves the continuity modulus of the
globally extended cutoff inputs, including their exterior
derivatives. Products and composition with fixed smooth local
comparisons give the common modulus
\(C(\omega(Cr)+r)\) at small \(r\), with \(C\) controlled by
the fixed choices and input sup norms. Compactness and the
strict value margin preserve the specified definite component
and open value tube for all small \(\epsilon\).

If continuous compatible pairs converge uniformly in both entries,
testing with the fixed formal adjoint gives convergence of
\(d_{A_{\rm ref}}a_j\) in distributions. The algebraic curvature
terms converge uniformly, proving \(F=F_A\) distributionally
for the limit. The argument supplies compatible traces and the
closure identity. It gives no rough parabolic solution, gradient
class, positive-time convergence, or gauge recovery.

## Input and output identities

All three frozen input hashes matched.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E38_REQUEST_v1.md | `7f04fb3f3d99735f28ec78e97b6b70511a2fc339b7f9af88f4ef378cf7f8c282` |
| B31_CONTINUOUS_COMPATIBLE_DATA_20261122.md | `ba43c4002a4549ec229ce9593e35a8eb98a4cf60061ea301f129f7764719f4df` |
| 24_TEMPORAL_BOOTSTRAP_20261122.md | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
| 36_COUPLED_CURVATURE_SYSTEM_20261122.md | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| 38_CONTINUOUS_COMPATIBLE_DATA_20261122.md | `cbc7dc854602fe2271503663900e35d2ad874116ccb1871ec4bbccdb802e73c7` |

[req]: SP4-CME-E38_REQUEST_v1.md
[note]: ../../notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
