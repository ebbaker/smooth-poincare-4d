# SP4-CME-E127 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E02C (04C), E36, E42 and E102, and audited E60 in E64 and E123 in E124. I did not author E125, E02A, E02B, E60 or E104. The independent check concerns E125's new compatible-gauge combination. [Request][req], [audit][audit], [E125][e125], [B65][b65].

## Disposition

**Pass.** At the actual smooth positive-chiral round reference with native negative-Killing normalization, \(g=(2K)\widehat g\) and \(\tau=(2K)t\). The native orthonormal curvature form components are \(-S_{mn}\eta_{n,ab}/\sqrt2\), and the bracket matrices are \(J_m/\sqrt2\). The antisymmetric physical Hessian contraction gives \(-6\det S\,q\) in the one-sided wedge derivative, or \(-12\sqrt{\det Q}\,q\) after symmetrization. The exact skew covector coefficient is \(\Xi_{mn,i}=4\langle\nabla_iF_m,F_n\rangle_g-2X_{mn,i}\). The four physical products are \(4X_iX_j\), \(-\frac43\operatorname{tr}(QX_i)X_j\), \(-\frac43\operatorname{tr}(X_iX_j)Q\) and \([X_i,\Xi_j]\), contracted with \(g^{ij}\). The physical trace vanishes.

On the compatible graph \(\beta_{\rm h}=d_Aa\), \(\phi=d_0^{*G}a\), and \(u=-S_F^*d_A^{*g}\beta_{\rm h}\). The added velocity \(-d_A\phi+\iota_uF\) gives \(+[\operatorname{ad}\phi,q]+\nabla_uq\). The first sign is from \(-d_A^2\phi=[\phi,F]\) and the second from the covariant Cartan formula and Bianchi. The normalized wedge quotient cancels the entire \(Q\mathcal L_u\mu\) contribution, including every derivative of \(u\), while the actual adjusted density obeys \(\mu_\tau=\mathcal L_u\mu=(\operatorname{div}_g u)\mu\). Its compatible linear density symbol has order three in the connection amplitude. Substituting \(B=S_0\xi^\sharp\), homogeneous of degree one in \(\xi\), gives \(-\frac32 i|\xi|_G^4\). A localized cubic connection jet gives real first variation \(+\frac32|\xi|_G^4\) at the center. Thus adjusted pointwise volume preservation does not follow from the physical density identity.

The principal coefficient on the fixed Hessian is \(g^{ij}\mathscr L_Q\), differing from \(4G^{ij}\mathrm{Id}\) by \(O(|U|)\). Explicit expansion retains the \(D_0a\) commutator, both internal first derivative terms, double connection action and live base-slot Christoffel correction. Keeping one \(X=D_0q+[\operatorname{ad}a,q]\) as an explicit defect factor in each quadratic physical product makes the other factor affine in the first pair jet with smooth value dependence. The same holds for surviving gauge coefficients. Curvature compatibility, Bianchi, the vertical exterior square and the horizontal top-form quotient produce the claimed higher-jet cancellations. After \(-12q\), the total lower coefficients vanish at the full zero jet and their sizes are \(O(|U|+|D_0U|)\). Their first-jet coefficient maps themselves may have nonzero value at \(U=0\). No second pair jet or quadratic first-pair coefficient remains outside \(D_0^2q\).

The homogeneous energy inequality with the supplied smooth path's coefficient bounds preserves a perfect initial defect. It gives no uniform mixed-norm bound, rough-time uniqueness statement or endpoint estimate. I found no mathematical correction needed to the frozen E125 derivation. No new primary source was used and only the designated audit and return were written.

## File identities

All nine E127 frozen inputs matched, as did the nine inputs of the consumed E125 request. The following includes the packet, directly checked supporting files and the completed audit.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E127_REQUEST_v1.md | `faeeb631c14a6dd3c9eb55292bd32955f410303093f5e9d01619aca9533f6d69` |
| 125_ADJUSTED_DEFECT_EQUATION_20261122.md | `74480ee1c5700672acd651820f2b64df2e4159ccd0f08aa478abdaffe0340c11` |
| SP4-CME-E125_REQUEST_v1.md | `01edfb12b18354a9d868f0922a26e38b5b27a5822e186d88a9002f61eed5fc4d` |
| SP4-CME-E125_RETURN_v1.md | `8c5595981e918da1f2aa82f06138b9f8004b470055b08b5c9bc5e0aba0f3a1f6` |
| B65_DEFECT_ONLY_ENDPOINT_ROUTE_20261122.md | `1a9372728c2dc316ac8d027d8da15aadeda10a79af188333255101f1c810bdb5` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| 04B_NONLINEAR_Q_20261122.md | `2f764d314f9d886ecdc62191e9109a00db50f4a1e4f557c0af11ff568d5d769a` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 36_COUPLED_CURVATURE_SYSTEM_20261122.md | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| 60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md | `c34bf22a1f80092a1ba33b154e4c2b308db1907ad56727099675321865a0246d` |
| 102_STRAIN_DEFECT_PINCHING_20261122.md | `783daa8875728a6265b0632829d57dae4f72522897bb8f052c79cdf841260c3b` |
| 104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md | `d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981` |
| E02_NONLINEAR_ASSESSMENT_20261122.md | `ba9ac8cbeaf11cf8b47286fc384e72445fa97bfde10660f327fb5a8c1ac63279` |
| E36_COUPLED_SYSTEM_ASSESSMENT_20261122.md | `025adc76f67336e875018c5dbd10420485c1450eec9c0b8750049daa2067ec07` |
| E127_ADJUSTED_DEFECT_EQUATION_AUDIT_20261122.md | `8e603a665b29683b3c1b94d8397d3a43d7ecb52392b3f1721cb4939cf78683a6` |

[req]: SP4-CME-E127_REQUEST_v1.md
[audit]: ../../reviews/E127_ADJUSTED_DEFECT_EQUATION_AUDIT_20261122.md
[e125]: ../../notes/125_ADJUSTED_DEFECT_EQUATION_20261122.md
[b65]: ../../brainstorm/notes/B65_DEFECT_ONLY_ENDPOINT_ROUTE_20261122.md
