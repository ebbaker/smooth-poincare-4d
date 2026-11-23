# E202–E204 — Lead assessment of stationary spectral pinching

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort unavailable; bounded helpers configured gpt-6.2-sol/ultra, independent runtime attestation unavailable. Root is sole integrator. E202 and E203 were separately authored, and E204 independently checked their algebra and geometric application. Original frozen notes retain their historical conditional wording.

## Accepted results

For the full older-normalization E05 derivative form, the actual pointwise zero-speed constraint has rank eight and a twelve-dimensional kernel. Throughout the ordered square-root spectral triangle d=(1,u,v), 1≤u≤v≤3/2, Q=3 diag(1,u²,v²)/(1+u²+v²), it obeys
\[
 R(X)\ge\frac{32768}{2205225}\sum_a|X_a|_{\mathrm F}^2.
\]
This is an exact continuum result including coincident eigenvalues, with a non-optimal constant. It includes the Sylvester and Bianchi-recovered contributions to Xi.

Consequently, every supplied smooth positive-plane, round-compatible definite SO(3) connection critical under independent connection variations on a closed connected smooth oriented real four-manifold is perfect if sup_M lambda_max(Q)/lambda_min(Q)≤9/4. The reconstructed positive Riemannian metric is ASD Einstein with scalar 12K in the older normalization for any fixed K>0. The alternative axial hypothesis in E203 also forces perfection when the repeated-eigenvalue parameter belongs pointwise to the exact closed E199 interval. Its semidefinite endpoints suffice because the reaction has a strictly positive coefficient at every positive Q. This assessment discharges H_ratio and, with the separately accepted E199/E201 assessment, H_axial. It imports no classification of the underlying base.

## Review and executable evidence

I read the complete E202 derivation, 349-line generator and return, E203 proof and return, and E204 audit, independent verifier and return. All reported hashes matched. The root generator replay reproduced the frozen JSON byte for byte. The root independent E204 verifier completed successfully: it inverted all 1,740 exact Bernstein coefficients back to the twelve signed-row polynomials, reconstructed every full Gram entry on the degree-certified 16×16 rational grid, and matched the six supplementary grid records. The latter are not the continuum proof.

The H-coordinate trace isomorphism, the surjective quaternion row relation and the invertible eight-dimensional diagonal source block give rank exactly eight. Edge covectors Z_ij give the nonsingular twelve-dimensional kernel with the direct left inverse J_i J_j X_ij. Their real scalar coefficients reduce the full form to four identical 3×3 blocks. With L=12(uv)³(1+u)(1+v)(u+v), the matrix M=2LG has twelve signed row sums, whose tensor Bernstein coefficients after v=1+a/2, u=1+ab/2 are all at least 384. The closed square covers the entire triangle. Symmetric diagonal dominance, lambda≥6/11, L≤164025/64, and ||X||²≤11||Z||² give the stated constant.

I independently checked the degree accounting used by E204. After scaling the basis by L, H and X have bidegree at most (6,6). All Sylvester/Bianchi divisions are exact in Q[u,v], so these divisions do not increase either individual degree. Xi has bound (7,7), and the full form R/lambda has bound (15,15). The claimed block 2LM has degree at most (14,14). Sixteen distinct nodes in each variable thus prove equality as a polynomial; the full Cartesian grid is inside the ordered triangle. The inverse Bernstein formula in the independent verifier is distinct from the generator's forward conversion. This supplements the displayed scalar derivation rather than replacing its sign and factor checks.

## Actual critical connections and normalization

The first variation of the defect energy gives the unprojected original speed V=-4d_A^*(HF), H=q-|q|²I/6. Self-duality and Bianchi yield V=4*((D_AH) wedge F), with D_AH_a=X_a-tr(QX_a)I/3. Thus its vanishing imposes the exact kernel tested above.

The polar isometry -F^sharp S^(-1)/(sqrt(2)K) is oriented in the selected round-compatible sign. At a single point, a positive ordered eigenframe and the surjective SO(4) action on positive chiral frames give the matching coframe. No differentiation of eigenframes is used. All quantities entering R and V transform tensorially, including the uniquely recovered mismatch. The common -K cancels from Bianchi, while V has only the positive scalar K. Equivalently constant rescaling of the reconstructed metric multiplies R by K. These statements cover arbitrary K and repeated spectra.

A critical connection gives a constant original path. The exact integrated identity is
\[
 0=-2\int_M R\,\mu-48K\int_M\sqrt{\det Q}|Q-I|^2\,\mu.
\]
The accepted derivative sign makes both right-hand integrals nonpositive, so the strictly positive smooth reaction weight forces Q=I everywhere. Compatibility then gives A=Gamma^+, W^+=0 and Ric_0=0. For the native negative-Killing pairing, mu_native=2mu_old, g_native=2K g_old and Q is unchanged; E_native=2P_old on the same open definite class. Independent criticality is therefore equivalent and the stationary theorem gives the H_gap premise of E205, with native scalar curvature 6.

No assumption or proof of preservation of the spectral ratio along a nonstationary flow is made. This theorem neither supplies initial definite data nor excludes all nonperfect critical connections. The reviewed late-sequence implication is handled separately by E205/E206. No new primary-source inspection is claimed here; the exact Fine2011 functional comparison is assigned to E207 under REFERENCE_WORKFLOW.

## Frozen input identities

| Artifact | SHA-256 |
| --- | --- |
| [202_GENERAL_STATIONARY_PINCHING_TEST_20261122](../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [e202_general_stationary_pinching](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [e202_general_stationary_pinching_results](../numerics/e202_general_stationary_pinching_results.json) | 2402caedf00f18274caecf494e4d8a44c520ea7aec4248cc9bc1dfb2ff85454e |
| [SP4-CME-E202_RETURN_v1](../research-progress/handoffs/SP4-CME-E202_RETURN_v1.md) | d11f6517edeea09b177f2cffb41ce78e9832dc88615fe6272874b04ffb5b04a0 |
| [203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122](../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [SP4-CME-E203_RETURN_v1](../research-progress/handoffs/SP4-CME-E203_RETURN_v1.md) | 05a9597f790f87992de97d8d4c86a32b9a397f64ac89ce8f149e3471752e0c8f |
| [E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122](../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [e204_general_pinching_verify](../numerics/e204_general_pinching_verify.py) | 685a3824b0cd09829eff26d7b55947ea5b235cbed3822fa0fb44a6428ca1a5cb |
| [SP4-CME-E204_RETURN_v1](../research-progress/handoffs/SP4-CME-E204_RETURN_v1.md) | fed3e0233e40e87ae0d054c547f8b1188e08aa574cd2a5d07a605bc8501bb63c |
| [E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123](../reviews/E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123.md) | 522b79b77dd001811541c4efa75c217fbfd96fee0faf6d732ab1905ad9521843 |
| [E04_E07_ESTIMATES_ASSESSMENT_20261122](../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E01_FOUNDATION_ASSESSMENT_20261122](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
