# SP4-CME-E66 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. See the [request][req]
and [derivation][note].

## Disposition

The static estimate holds for every smooth \(A=A_0+a\) on the
fixed oriented round sphere in the native normalization,
with \(\beta=F_A-F_0\), the exact conditions
\(S_0^*a=d_0^*a=0\), and
\(\|a\|_{\infty;0}+\|\beta\|_{\infty;0}\le\rho\).
The fixed \(\rho>0\) needs only value-tube and elliptic
absorption bounds. Both \(\|a\|_{W^{2,(4,1)}}\) and the
E59 localized \(\|(a,\beta)\|_{B^{1/2}_{8,1}}\) are bounded
linearly by \(\|T(A)\|_{4,1;g_A}\), with constants independent
of the given connection in that tube.

- The homogeneous frozen matrix multiplier
  \(-\xi_i\xi_j A_*(\xi)^{-1}\) has a dyadic kernel of size
  \(|x|^{-4}\) and first derivative size \(|x|^{-5}\).
  Dyadic cancellation, direct distribution integration at
  \(8/7\), and adjoint duality give the \(p=8\) bound.
  Freezing and cutoffs give the global estimate with
  first- and zero-order remainders. Mollifier interpolation
  absorbs the first-order term. E47's \(L^2/H^2\) inverse and
  the fixed \(H^2\to L^8\) kernel bound remove the zero-order
  inverse remainder.
- For each \(D_0^jG_0^{-1}\), apply
  \(\|h\|_{4,1}\le12\|h\|_2^{1/3}\|h\|_8^{2/3}\) to
  arbitrary vector layers. Integrating layers proves the
  complete Lorentz estimate, with inverse norm at most
  \(C_G=3\sum_{j=0}^2\|D_0^jG_0^{-1}\|_{2\to2}^{1/3}
  \|D_0^jG_0^{-1}\|_{8\to8}^{2/3}\).
- Set \(M=\operatorname{tf}L_0\) and
  \(B=[a\wedge a]/2\). On the imposed slice the exact
  \(P_0=\sqrt8\,M\) normalization gives
  \(G_0a=4d_0^*M^*(q-R(\beta)-2MB)\),
  where \(q=2M\beta+R(\beta)\).
  The derivative is
  \(D_0q=\nabla^A Q-[\operatorname{ad}(a),q]\).
  The geometric strain controls the first term by (15),
  with both tensor and volume comparisons. The other
  terms cost \(C_{\rm err}\rho\|a\|_{W^{2,(4,1)}}\).
  Choose \(\rho\le\min(\rho_{\rm geom},1,(2C_G
  C_{\rm err})^{-1})\) and absorb.
- The E53 high blocks use the layer exponent \(1/4\).
  The finite low block uses \(\|v\|_1\).
  Fixed localization retains cutoff, frame and density
  factors, and \(\beta=d_0a+B\) bounds its first derivative
  by the same \(W^{2,(4,1)}\) norm.

No slice-existence, flow or topology result is assigned to
this estimate. No new primary source was used. E41 was read
for the dyadic decomposition method and the elliptic version
is proved directly in the note. Only the owned files were edited.

## File identities

The four frozen note digests matched the request before use.
The B43 and E41 digests record the conceptual and method inputs.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E66_REQUEST_v1.md | `6691822e9090580aab3918124b4e6dacd3da4bddaeefbb7260157e3a30d69979` |
| B43_FIXED_SLICE_STRAIN_CONTROL_20261122.md | `47576ef7440ba6c5e9e20303f90ad62849ae2ec9a0ba11c4d54ed3178d6c2b59` |
| 47_ROUND_STABLE_LINEAR_20261122.md | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| 53_CRITICAL_FINITE_P_HEAT_20261122.md | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| 59_CRITICAL_PATH_STRAIN_20261122.md | `2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a` |
| 05A_REAL_TWISTOR_COMPARISON_20261122.md | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| 41_COMPACT_LINEAR_ESTIMATES_20261122.md | `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3` |
| 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |

[req]: SP4-CME-E66_REQUEST_v1.md
[note]: ../../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
