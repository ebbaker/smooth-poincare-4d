# E227 — Strict-interior degeneration of the pointwise absorption constant

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B107, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored E209 and E223, as well as the inherited E202 block reduction and E219 audit. E223 is historical context under separate audit. The family calculation below uses the assessed axial identity and rederives the full pairing and speed directly.

## Statement and conventions

In old \(K=1\) units consider only the specified axial family
\[
  3<s<7/2,\qquad t=\sqrt{s},\qquad
  \lambda=\frac{3}{s+2},\qquad D=\operatorname{diag}(1,1,t),\qquad
  Q_s=\lambda D^2 .
\]
The spectral ratio is \(s\). Use the older internal orthonormal frame with \([e_i,e_j]=\epsilon_{ijk}e_k\), positive oriented Euclidean covector frame at the point, \(F=-\sqrt{\lambda}\,D\Sigma\) and normalized self-dual \(\Sigma_i\) with squared norm two. Then \(\mu_{\rm old}=2dV_{\widehat g}\) in this calibration. Norms of matrix derivatives sum their Frobenius norms over the four old orthonormal axes. The velocity norm is that of the actual old \(E\)-valued one-form, including the \(\sqrt{\lambda}\) factor. Set \(Y=E_0\) in the zero-based E223 axis-major coordinates, so \(Y_1=\operatorname{diag}(1,0,-1)\) and other base slots vanish. The kernel vector \(N_s\) is the one with
\[
                  (Z_{12},Z_{13},Z_{23})=(-t/2,1,-1)dx^1 .
\]
No \(C\) independent of \(s\) can give \(R_{Q_s}(X)\ge-C|V_{Q_s}(X)|^2\) for all such locally pinched derivative arrays. All formulas below concern this one family. [B107](../brainstorm/notes/B107_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md).

## Stationary vector and its norm

Write \(J_i\alpha=*(\alpha\wedge\Sigma_i)\) in the matched orientation, so \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\). For any derivative array \(X\), let \(H_a=X_a-\operatorname{tr}(Q_sX_a)I/3\). The actual velocity is
\[
                V_i(X)=-4\sqrt{\lambda}\sum_{a,j}d_j(H_a)_{ij}J_jdx^a .
 \tag{1}
\]
In the kernel use \(H_{ii}=d_i^{-1}\sum_{j\ne i}d_j Z_{ij}\), \(H_{ij}=-J_iJ_j Z_{ij}\) off the diagonal, and \(Z_{ji}=-Z_{ij}\). Indeed applying \(J_i\) to the sum in (1) gives \(-d_i H_{ii}+\sum_{j\ne i}d_j Z_{ij}\). The weighted-trace condition holds by antisymmetry. For the indicated \(N_s\), the diagonal entries of \(H\) are \((t/2,-t/2,0)dx^1\), so ordinary trace also vanishes and \(X=H\). The off-diagonal covectors are \((N_s)_{12}=(t/2)J_3dx^1\), \((N_s)_{13}=J_2dx^1\), and \((N_s)_{23}=J_1dx^1\). Equivalently,
\[
       N_s=(t/2)E_0-(t/2)E_1+(t/2)E_7-E_{13}+E_{19}.
\]
The \(J_i\) are isometries, and the Frobenius norm counts each off-diagonal entry twice, so \(|N_s|^2=s/2+s/2+2+2=s+4\). These identities check \(V(N_s)=0\) for every \(s\) in the specified range.

The assessed stationary block is \(R(X)=4\lambda\sum_a Z_a^{\mathsf T}GZ_a\) on the kernel. For \(k(t)=(-t/2,1,-1)^{\mathsf T}\) the assessed coefficientwise axial identity is \(k(t)^{\mathsf T}G(1,t)k(t)=t^2(7-2t^2)\). Thus
\[
                       R(N_s)=4\lambda s(7-2s)>0 .
 \tag{2}
\]
This use of the axial identity needs no endpoint mixed-form result. [Assessed kernel and axial identity](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md).

## Full mixed pairing, \(R(Y)\), and velocity squared

With \(q=Q_s-I\), the older full derivative form and its symmetric polarization are
\[
 \begin{aligned}
 R(X)
 &=\sum_a\bigl(\langle X_a,\mathscr L_{Q_s}X_a\rangle
             -\langle q,[X_a,\Xi_a(X)]\rangle\bigr),
 \\[-2pt]
 \mathscr L_Q U&=2(QU+UQ)-\tfrac43\operatorname{tr}(QU)Q,\qquad
 \Xi_a(X)=2[U_a,D]+4\lambda D\operatorname{ad}(b_a)D,\qquad
 (U_a)_{ij}=(X_a)_{ij}/(d_i+d_j),\\
 B(X,Y)&=\tfrac12\bigl(R(X+Y)-R(X)-R(Y)\bigr).
 \end{aligned}
 \tag{3}
\]
Here \(b\) is the full Bianchi mismatch recovered from \(P_a=\lambda^{-1}D^{-1}U_a\), \(z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a\), \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\), and \(b=(I+\mathscr C)z/2\). In particular \(\Xi\) is linear in \(X\) at fixed \(Q_s\). These formulas apply to the full derivative space and keep the actual trace correction in (1). [E209 full form](209_PINCHED_GRADIENT_DOMINATION_20261123.md).

Put \(m=\operatorname{tr}(Q_sY_1)/3=(1-s)/(s+2)\). The only nonzero \(H\) of \(Y\) is \(Y_1-mI\), with diagonal \((2s+1,s-1,-3)/(s+2)\). Because \(Y_1\) and \(q\) commute, its commutator contributes zero to \(R(Y)\), giving
\[
 \begin{aligned}
 R(Y)
   &=4\lambda\bigl(1+s\bigr)-\tfrac43\lambda^2(1-s)^2
     =\frac{12(5s+1)}{(s+2)^2}.
 \end{aligned}
 \tag{4}
\]
In (1) \(V_i(Y)=-4\sqrt{\lambda}\,d_i(H_1)_{ii}J_i dx^1\). Thus the actual speed squared is \(16\lambda\sum_i d_i^2(H_1)_{ii}^2\), four times \(R(Y)=4\lambda\sum_i d_i^2(H_1)_{ii}^2\) by the weighted-trace formula for the principal pairing. In particular \(|V(Y)|^2=48(5s+1)/(s+2)^2>0\).

For \(B(N_s,Y)\), the principal operator is self-adjoint. Its pairing is \(2\lambda t\), from the first diagonal base slot of \(N_s\) and \((\mathscr L_{Q_s}Y_1)_{11}-(\mathscr L_{Q_s}Y_1)_{22}=4\lambda\). The order with \(Y\) first in the skew term vanishes pointwise because \([q,Y_a]=0\). In the other order, the Sylvester part of \(\Xi(Y)\) is zero because \(U(Y)\) and \(D\) are diagonal. The mismatch part does contribute. For \(Y\) the Bianchi source is \(z_i=\sigma_i J_i dx^1\) with
\[
             (\sigma_1,\sigma_2,\sigma_3)
                  =(-1/(2\lambda),\,0,\,1/(2\lambda t^2)).
\]
Indeed the nonzero \(U(Y)\) entries are \(1/2,-1/(2t)\) in the first and third diagonals of its first slot. For \(i\ne j\), \(\mathscr C_{ij}J_j=-J_i\), so \(b_i=\frac12(2\sigma_i-\sum_j\sigma_j)J_i dx^1\). This gives the off-diagonal covectors
\[
       \Xi(Y)_{13}=t(1-t^{-2})J_2dx^1,\qquad
       \Xi(Y)_{23}=t(1+t^{-2})J_1dx^1 .
\]
The \((1,2)\) component drops out because \(q_{11}=q_{22}\). For each remaining pair \((i,3)\), its contribution to \(\sum_a\langle q,[(N_s)_a,\Xi_a(Y)]\rangle\) is \(2(q_{33}-q_{ii})\langle (N_s)_{i3},\Xi(Y)_{i3}\rangle\) in covector pairing, by symmetry of \(N_s\) and skewness of \(\Xi\). The sum is \(2\lambda(s-1)\bigl(t(1-t^{-2})+t(1+t^{-2})\bigr)=4\lambda t(s-1)\). Symmetric polarization takes half of that contribution. Hence
\[
                    B(N_s,Y)=2\lambda t(2-s).
 \tag{5}
\]
This calculation includes the full reconstructed skew term and does not use the unassessed E223 mixed coefficients. [E223 historical endpoint calculation](223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md).

## Optimized lower bound and endpoint limit

For each fixed \(s\), the ray \(Y+\sigma N_s\) has velocity \(V(Y)\) and
\[
 R(Y+\sigma N_s)=R(Y)+4\lambda t(2-s)\sigma
                                  +4\lambda s(7-2s)\sigma^2 .
\]
Since its quadratic coefficient is positive, the minimizer is finite and unique,
\[
              \sigma_*(s)=\frac{s-2}{2t(7-2s)} .
\]
At that parameter, completing the square gives
\[
               R(Y+\sigma_*(s)N_s)
                            =R(Y)-\frac{\lambda(s-2)^2}{7-2s}.
 \tag{6}
\]
If \(C(s)\) is any finite constant for a pointwise speed-only lower bound at \(Q_s\), evaluate it at (6) and divide by \(|V(Y)|^2=4R(Y)>0\). This yields
\[
         C(s)\ \ge\ c_{\rm test}(s)
            :=\frac{(s+2)(s-2)^2}{16(5s+1)(7-2s)}-\frac14 .
 \tag{7}
\]
The exact scaled limit of this optimized witness bound is
\[
             \lim_{s\uparrow7/2}(7/2-s)c_{\rm test}(s)
                =\frac{(11/2)(3/2)^2}{32(37/2)}
                =\frac{99}{4736}.
 \tag{8}
\]
Thus every choice of admissible \(C(s)\) has liminf at least \(99/4736\) after the same scaling. This is an exact limit for the necessary lower-bound function from this one family. It does not provide the limit of the best constant on the full derivative space.

For the assessed strict-region coercivity constant \(\kappa(r)\), namely the minimum of \(R_Q(X)\) on unit stationary arrays with spectral ratio at most \(r\), use \(s=r\) and normalize \(N_r\). Equations (2) and its norm give
\[
    0<\kappa(r)\le \frac{R_{Q_r}(N_r)}{|N_r|^2}
     =\frac{12r(7-2r)}{(r+2)(r+4)}\qquad(3<r<7/2).
 \tag{9}
\]
Thus \(\kappa(r)\to0\) along the strict subregions. This is an upper bound for that coercivity constant, with no lower estimate of its vanishing order. [E220 strict-region construction](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) · [E220/E222 assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

The numbers in (4)–(8) use old \(K=1\) units and their model frames. Positively oriented orthonormal changes preserve the Frobenius pairings and the norm of the equivariant velocity. For other fixed old \(K>0\) and evaluated arrays in the corresponding reconstructed orthonormal frames, \(F=-KS\Sigma\) adds a factor \(K\) to the velocity map, and its common factor cancels from Bianchi, so the formula for \(R\) on those arrays is unchanged. This replaces the witness lower bound for a coefficient of \(|V_{\rm old}|^2\) by \(K^{-2}c_{\rm test}(s)\) and preserves divergence. In the native conversion \(g=2K\widehat g\) and \(V_{\rm native}=(2K)^{-1}V_{\rm old}\) with the internal pairing \(2\delta\). This changes the velocity norm squared by \(2(2K)^{-3}\) at the same connection. The full derivative expression, viewed with the rescaled covector metric, gains \((2K)^{-1}\). Its internal Frobenius pairing and the mismatch endomorphism are unchanged by the constant scale. These are fixed positive factors, so the qualitative failure does not depend on the frame or clock normalization. [E209 native scaling](209_PINCHED_GRADIENT_DOMINATION_20261123.md).

## Local realization with strict neighborhood pinching

For each fixed \(s\), let \(X=Y+\sigma_*(s)N_s\), which is finite. In the same \(K=1\) conventions use an oriented Euclidean chart and a trivial \(SO(3)\) bundle. Prescribe \(F_i^*=-s_i\Sigma_i\), with \(s_i=\sqrt{(Q_s)_{ii}}>0\) and the constant self-dual triple above. Then \(\mu^*_{\rm old}=2dV_{\rm eucl}\), \(Q(F^*)=Q_s\) and the reconstructed center metric is Euclidean. Define
\[
 \begin{aligned}
 A^0&=\tfrac12\sum_a x^a\iota_{\partial_a}F^*,\qquad
 (V^a)_i=-\sum_j\frac{(X_a)_{ij}}{s_j}J_jdx^a,\qquad
 A=A^0+\tfrac12\sum_a (x^a)^2 V^a .
 \end{aligned}
\]
Here the \(V^a\) are fixed coefficient one-forms for the polynomial connection. Then \(F_A(0)=F^*\), \(A(0)=0\) and \(\partial_aF_A(0)=dx^a\wedge V^a\), since \(dA^0=F^*\) and the bracket term is \(O(|x|^2)\). To check the first-derivative right inverse directly, use \(\mathcal M_{ij}=F_i\wedge F_j/(2dV_{\rm eucl})\) and \(Q=3\mathcal M/\operatorname{tr}\mathcal M\). Its Gram differential at \(F^*\) is
\[
 \delta\mathcal M_{ij}
  =-\tfrac12\left(s_j\langle\delta F_i,\Sigma_j\rangle
                   +s_i\langle\delta F_j,\Sigma_i\rangle\right).
\]
For \(\delta F=dx^a\wedge V^a\), the \(J_jdx^a\) are orthonormal, so \(\delta\mathcal M=X_a\). Since \(\operatorname{tr}X_a=0\), the normalized quotient differential gives \(\partial_aQ(0)=X_a=(\nabla_a^AQ)(0)\). The curvature is that of the actual polynomial connection and satisfies Bianchi, so the mismatch in (3) is the actual one. [E02C curvature symbol](04C_VOLUME_AND_JETS_20261122.md).

The curvature stays positive definite with the round-compatible sign near the center. Its \(Q\) is continuous there, and the ratio is continuous on positive matrices even at a repeated eigenvalue by the extreme Rayleigh quotients. At the center the ratio equals \(s<7/2\). Choose a sufficiently small Euclidean ball on whose closure the ratio is at most \(\frac12(s+7/2)<7/2\). This realizes the entire finite witness inside strictly locally pinched data. As \(s\uparrow7/2\) the chosen coefficient \(\sigma_*(s)\) and derivative size may grow without bound, and the ball can shrink. No uniform neighborhood or global extension is assumed.

This excludes a single finite pointwise speed-only absorption constant even over strictly locally pinched data with no fixed distance from the closed threshold. It does not exclude an integrated endpoint or uniform strict-region gradient theorem by a different argument. There is no global, trajectory, critical-connection, or singularity conclusion. No new source, numerical test or extra spectral family was used.

## Verified identities

| Input | SHA-256 |
| --- | --- |
| [E227 request](../research-progress/handoffs/SP4-CME-E227_REQUEST_v1.md) | 59e58b09d514d85a48ae60eae7d87e24bc3803e61987472d261fa7cdd4d066fb |
| [B107](../brainstorm/notes/B107_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) | a069162a40595c55a1edab915e2e186d6cec479c3698936600be7f8d8d23ea44 |
| [E223](223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E218/E219 assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209](209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E220](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E220/E222 assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E02C](04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |

The [E227 return](../research-progress/handoffs/SP4-CME-E227_RETURN_v1.md) records the note hash and scoped result.
