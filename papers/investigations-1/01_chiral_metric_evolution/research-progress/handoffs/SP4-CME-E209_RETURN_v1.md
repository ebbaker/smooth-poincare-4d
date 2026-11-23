# SP4-CME-E209 return v1 — Pinched gradient domination

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E derivation under B101. Configured gpt-6.2-sol/ultra. Independent runtime and lead settings are unavailable. I authored E202 and the older compatibility, defect evolution and integrated identity inputs. E202/E204 is assessed evidence.

## Disposition

**The proposed constants hold.** For every supplied smooth positive-plane, round-compatible definite \(SO(3)\) connection on a smooth closed connected oriented real four-manifold with \(\lambda_{\max}(Q)/\lambda_{\min}(Q)\le9/4\), put
\[
 \kappa=\frac{32768}{2205225},\qquad L_0=81,\qquad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+\frac\kappa2\right).
\]
The native estimate is
\[
 (1+4C_0)\int_M |V_{\rm native}|_{g_A,\,2\delta}^2\,dV_{g_A}
 \ \ge\ \kappa\int_M |\nabla^A Q|_{g_A}^2\,dV_{g_A}
                      +\frac{48}{5}\mathcal E(A).
\]
Thus \(\gamma=48/[5(1+4C_0)]>0\) gives static gradient domination. On any supplied smooth original interval where the ratio bound holds everywhere, the energy decays at least as \(e^{-\gamma(\tau-\tau_0)}\) in native time. The accompanying exponentially weighted time integral of \(\int_M|\nabla^AQ|^2_{g_A}dV_{g_A}\) has coefficient \(\kappa/(1+4C_0)\) in integrating-factor form.

The weighted-diagonal inverse reproduces all three velocity rows and bounds the minimal complementary preimage by \((11/(32K^2))|V_{\rm old}|^2\) in squared norm. \(|R|\le81|X|^2\) holds on the full derivative space with the complete Bianchi mismatch. Its symmetric polarization yields \(R\ge\frac\kappa2|X|^2-(C_0/K^2)|V_{\rm old}|^2\). Independent variation gives \(D\mathcal P_{\rm old}[V_{\rm old}]=-\int|V_{\rm old}|^2dV_{\widehat g}\). Using \(\mu_{\rm old}=2K^2dV_{\widehat g}\) moves exactly \(4C_0\) times this dissipation to the left in the integrated estimate. Under the native conversion the dissipation and derivative integral each become their old counterparts divided by \(K\), and \(\mathcal E=2\mathcal P_{\rm old}\). The static computation evaluates the exact E05 directional identity on the affine path with tangent \(V_{\rm old}\) at its initial point, so it needs no local existence theorem for a noncritical test datum.

No homotopy-sphere condition, ratio preservation, lifespan, initialization or \(C^k\) convergence is asserted. No new source or numerical search entered.

## Frozen identities

| Artifact | Verified SHA-256 |
| --- | --- |
| [E209 request](SP4-CME-E209_REQUEST_v1.md) | 7ed9300526d60b72dee0035fc512dc889271356ecb5ca23be28b80a518ed12ab |
| [B101](../../brainstorm/notes/B101_PINCHED_GRADIENT_DOMINATION_20261123.md) | a60adc8b1f68e7ccbebaf039e19d99d8e367c35bb2c973c6b0f75b3e5a840722 |
| [E202 note](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E204 audit](../../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202–E204 assessment](../../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E05](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04–E07 assessment](../../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E01 assessment](../../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
| [E203 note](../../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E206 audit](../../reviews/E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123.md) | 2fe692ce764688a97eab6f7e25b680eeaafdd4a8ea50b61e953b10e1fe756e19 |
| [E209 derivation](../../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |

This return is the second owned output. Sole live status remains [REGISTER](../REGISTER.md). Independent audit and lead assessment follow separately.
