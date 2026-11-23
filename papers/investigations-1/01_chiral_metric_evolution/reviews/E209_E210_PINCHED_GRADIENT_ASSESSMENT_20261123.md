# E209/E210 — Lead assessment of quantitative pinched gradient control

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Actual selected lead model and effort unavailable; helpers configured gpt-6.2-sol/ultra without independent runtime attestation. Root reviewed the full E209 derivation and return and E210 independent audit and return; all frozen identities matched. The new quantitative extension was checked separately from the assessed stationary certificate.

Accepted for every supplied smooth positive-plane round-compatible definite SO(3) connection on a smooth closed connected oriented real four-manifold satisfying sup lambda_max(Q)/lambda_min(Q)≤9/4. With native negative-Killing pairing and reconstructed metric, let E=∫|Q-I|²dV, D=∫|V_native|²dV and G=∫|nabla^A Q|²dV (Frobenius endomorphism norm). The exact explicit constants
\[
 \kappa=32768/2205225,\quad L_0=81,\quad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+\frac\kappa2\right),
 \quad \gamma=\frac{48}{5(1+4C_0)},\quad\beta=\frac{\kappa}{1+4C_0}
\]
give D≥gamma E+beta G. They are deliberately non-optimal, finite, positive and independent of K, base and bundle. On any supplied smooth original native interval pinched throughout, the integrating-factor bound is e^{gamma(t-t0)}E(t)+beta∫_{t0}^t e^{gamma(s-t0)}G(s)ds≤E(t0). The energy hence decays exponentially on that interval. No homotopy-sphere assumption enters this theorem.

The full speed map has an explicit diagonal right inverse on its eight-dimensional image. Its first two rows are inverted by -J_i/d_i and the weighted-trace third row agrees by the quaternion relation. Ordinary trace-free projection contracts norm, giving the squared bound 11|V_old|²/(32K²). Projecting a preimage orthogonally to the kernel gives its minimum norm, without requiring a differentiated eigenframe or projection. The full quadratic operator norm is at most 66+6sqrt(6)<81 on all twenty derivative components, using the complete Bianchi mismatch, not only the zero-speed kernel. Symmetric polarization and Young's inequality then prove R≥(kappa/2)|X|²-C0 K^(-2)|V_old|².

I checked the integrated normalization directly. Old independent variation converts the wedge expression to the ordinary dV_hat pairing, so DP_old(V_old)=-D_old with D_old=∫|V_old|²dV_hat. The exact E05 identity uses mu_old=2K²dV_hat on the derivative and reaction integrals. The negative speed cost is consequently 4C0 D_old. The ratio hypothesis gives lambda_min≥6/11 and sqrt(detQ)≥2/5. Thus (1+4C0)D_old≥kappa G_old+(96K/5)P_old, where G_old uses mu_old.

The instantaneous identity can be tested on A+sigma V_old(A). This smooth affine curve stays in the definite sign class near zero by openness on compact M; only its tangent at zero enters the E02 quotient and volume identities. It need not remain spectrally pinched away from zero, and no flow existence theorem is imported for the static inequality. The independent audit explicitly checks the pointwise volume law at that tangent.

Under native pairing 2delta, g_native=2K g_hat, V_native=V_old/(2K), native time tau=2Kt and dV_native=2mu_old. The internal factor two in the velocity norm is essential: D_native=D_old/K. The endomorphism norm is unchanged by internal rescaling, giving G_native=G_old/K; E_native=2P_old. Dividing the old inequality by K gives the stated native constants. Native E'=-D and the positive integrating factor yield the interval estimate at all its smooth endpoints.

This supplies a static gradient bound and an interval energy estimate, not a pinching preservation law, continuation theorem, Ck limit or initialization. E212 separately explores the conditional consequence of intermittent pinched times. The present assessment supplies its proposed H_grad premise at the exact gamma,beta above. Frozen E209/E210 and conditional E212 files retain their original wording. No new reference inspection or numerical experiment was needed; Fine's exact functional and gradient receipts are tracked in E207 and the canonical reference notes.

## Frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [209_PINCHED_GRADIENT_DOMINATION_20261123](../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [SP4-CME-E209_RETURN_v1](../research-progress/handoffs/SP4-CME-E209_RETURN_v1.md) | a04ec7893204e08a7fb21163b01170054f813c07e04045a9f081b2752dc0934d |
| [E210_PINCHED_GRADIENT_DOMINATION_AUDIT_20261123](../reviews/E210_PINCHED_GRADIENT_DOMINATION_AUDIT_20261123.md) | 5c925f2832e106ffccee368c9027d5632eb20c2525993d942dc45f717ded753d |
| [SP4-CME-E210_RETURN_v1](../research-progress/handoffs/SP4-CME-E210_RETURN_v1.md) | 54626da7e2a1714c90a6632cd1c025f47599f7d6aa9e9a3635b6ca22d6e5da12 |
| [E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [07_PINCHED_ENERGY_GAP_20261122](../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E01_FOUNDATION_ASSESSMENT_20261122](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
