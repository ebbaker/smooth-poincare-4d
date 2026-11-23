# E228 — Independent strict-interior absorption audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E work under B107, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored E210, E222 and E224, which audited inherited gradient, sharp-application and manuscript inputs. I did not author E227 or the E218/E219 block. I used the assessed full-form and velocity conventions, independently solved Bianchi on the two prescribed arrays, and checked the inherited axial value by direct substitution. E223 supplies coordinate naming only. [Request][request] · [Frozen derivation][target]

## Disposition

Pass. For the fixed old \(K=1\) family \(3<s<7/2\), the two-array restriction has the stated mixed coefficient and constant-speed minimizing array. Every admissible pointwise speed-only constant \(C(s)\) has the asserted scaled liminf \(99/4736\) as a lower bound. The strict-region coercivity coefficient has the stated upper bound. Each optimizing array is the actual covariant first derivative of a smooth local connection with a strict spectral neighborhood. The calculation only evaluates the derivative form and velocity on local data.

## Conventions, stationary array and velocity norm

Work in the old orthonormal internal frame with \([e_i,e_j]=\epsilon_{ijk}e_k\), and in the matched positive Euclidean covector frame. Write \(w=dx^1\), \(t=\sqrt s\), \(\lambda=3/(s+2)\), \(d=(1,1,t)\), \(D=\operatorname{diag}d\), \(S=\sqrt\lambda D\), \(Q_s=S^2\) and \(F=-S\Sigma\). Use \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV\), \(J_i\alpha=*(\alpha\wedge\Sigma_i)\), and \(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\). Then \(J_1w=dx^4,\ J_2w=-dx^3,\ J_3w=dx^2\) for the standard ordered triple. Let \(X_{ij}\) denote the covector with entries \((X_a)_{ij}\), where each \(X_a\) is symmetric trace-free. The Frobenius sum counts each off-diagonal entry twice.

At the actual speed, \(H_{ij}=X_{ij}-\frac13\delta_{ij}\operatorname{tr}(Q_sX)\) and \(V_i=-4\sqrt\lambda\sum_j d_j J_jH_{ij}\). This follows from \(V=4*((D^A(q-|q|^2I/6))\wedge F)\), in which \(\operatorname{tr}(qX_a)=\operatorname{tr}(Q_sX_a)\). The sign and factor follow from \(F=-\sqrt\lambda D\Sigma\). [Full form and velocity][e209]

The prescribed edge data \((-t/2,1,-1)w\) give \(N_{ii}=(t/2,-t/2,0)_i w\), \(N_{12}=(t/2)J_3w,\ N_{13}=J_2w,\ N_{23}=J_1w\). The edge inverse gives these same entries by \(Z_{ij}=J_iJ_jN_{ij}\) and the diagonal weighted relation. The ordinary and weighted traces are zero. With \(H=N\), the three speed rows up to the common multiplier are \((t/2+t/2-t)J_1w,\ (-t/2-t/2+t)J_2w,\ (J_1J_2+J_2J_1)w\), so \(V(N)=0\). The coordinate expansion \((t/2)E_0-(t/2)E_1+(t/2)E_7-E_{13}+E_{19}\) follows from the three \(J_iw\) above and the five axis-major coordinates. Its squared norm is \(s/2+2(s/4+1+1)=s+4\). [Assessed edge block][axial] · [Coordinate convention][e223]

For \(Y\) the sole nonzero base slot is \(\operatorname{diag}(1,0,-1)w\). Its scalar trace correction is \(\lambda(1-s)/3\) along \(w\). Thus the diagonal of \(H(Y)\) is \((2s+1,s-1,-3)w/(s+2)\). Set \(Z=\sum_i d_i^2|H_{ii}(Y)|^2\). Direct summation gives
\[
 Z=\frac{(2s+1)^2+(s-1)^2+9s}{(s+2)^2}=\frac{5s+1}{s+2},
 \qquad |V(Y)|^2=16\lambda Z=\frac{48(5s+1)}{(s+2)^2}.
\]
Here the \(J_i\) act isometrically and the internal row norms are summed. Also \([q,Y_a]=0\), so the skew contraction vanishes in \(R(Y)\). The diagonal principal value \(4\lambda(1+s)-\tfrac43\lambda^2(1-s)^2\) is \(4\lambda Z=12(5s+1)/(s+2)^2\). In particular the actual speed squared equals \(4R(Y)>0\).

## Direct Bianchi solve and mixed form

Put \(U_{ij}(X)=X_{ij}/(d_i+d_j)\), so \(D^AS=U/\sqrt\lambda\) by the Sylvester equation. With \(b=A-\Gamma_A^+\) in the matched frame, \(D_{\Gamma_A^+}\Sigma=0\). Star the actual Bianchi equation for \(F=-S\Sigma\) after multiplying by \(S^{-1}\) on internal indices. This gives the three covector equations
\[
\sum_{j,k}\epsilon_{ijk}J_k b_j
 =-\lambda^{-1}d_i^{-1}\sum_j J_j U_{ij}.
\]
The full left-hand map is invertible because it satisfies \(\mathscr C^2+\mathscr C=2I\). For the two prescribed arrays each right-hand row has the form \(\zeta_i J_iw\). The ansatz \(b_i=\eta_iJ_iw\) solves the full equations when \(-\eta_j-\eta_k=\zeta_i\) for the other two distinct indices \(j,k\). This follows from the bracket sign and \(J_kJ_jw=-\epsilon_{ijk}J_iw\) for \(i,j,k\) distinct. Thus \(\eta_i=\zeta_i-\frac12\sum_\ell\zeta_\ell\). Uniqueness on the full space identifies this solution as the actual mismatch.

For \(Y\), \(U_{11}=w/2\), \(U_{33}=-w/(2t)\), and the other entries vanish. This gives \(\zeta=(-1,0,s^{-1})/(2\lambda)\), whence
\[
 (\eta_1,\eta_2,\eta_3)
 =\frac{1}{4\lambda}(-1-s^{-1},1-s^{-1},1+s^{-1}).
\]
The Sylvester skew term \(2[U(Y),D]\) vanishes since both factors are diagonal. In \(\Xi(Y)=2[U(Y),D]+4\lambda D\operatorname{ad}(b)D\), the \(13\) and \(23\) entries of \(\operatorname{ad}(b)\) are \(b_2\) and \(-b_1\), so
\[
 \Xi_{13}(Y)=t(1-s^{-1})J_2w,\qquad
 \Xi_{23}(Y)=t(1+s^{-1})J_1w.
\]
The \(12\) pair has equal \(q\) eigenvalues and contributes zero to the contraction. More generally, for symmetric \(X\), skew \(\Xi\) and diagonal \(q\), the contraction summed in base slots is \(2\sum_{i<j}(q_j-q_i)\langle X_{ij},\Xi_{ij}\rangle\), as the diagonal entries of \([X,\Xi]\) are \(-2\sum_j X_{ij}\Xi_{ij}\) in each slot. For \(X=N,\Xi=\Xi(Y)\) it therefore equals \(4\lambda t(s-1)\). For \(X=Y,\Xi=\Xi(N)\) it vanishes. The self-adjoint principal pairing is \(\langle N,\mathscr L_{Q_s}Y\rangle=2\lambda t\), since the only common diagonal slot has \(\operatorname{tr}(Q_sN_1)=0\). Half the sum of the two skew orders is subtracted in the symmetric polarization, yielding
\[
 B(N,Y)=2\lambda t-\tfrac12\,4\lambda t(s-1)=2\lambda t(2-s).
\]
This checks the mixed term from the full exterior equations with no input from the E223 endpoint mixed coefficients. [Full form][e209] · [E227 equations (3)–(5)][target]

For an additional check of the axial term, set \(a_t=t/2-1/(1+t)\). For \(N\) the right side in the same Bianchi equations has \(\zeta=(-a_t,a_t,0)/\lambda\). To see this, \(U_{11}=tw/4,\ U_{22}=-tw/4,\ U_{12}=(t/4)J_3w,\ U_{13}=J_2w/(1+t),\ U_{23}=J_1w/(1+t)\), and the third starred row cancels. Since \(\sum_i\zeta_i=0\), \(\eta=\zeta\). The \(13\) and \(23\) coefficients in \(\Xi(N)\) are both \(2(t-1)/(1+t)+4ta_t=2(s-1)\), multiplying \(J_2w\) and \(J_1w\) respectively. The trace pairing \(\operatorname{tr}(Q_sN_a)\) is zero on every slot, and the principal sum is \(2\lambda s+2\lambda s+8\lambda(1+s)=12\lambda s+8\lambda\). The skew contraction is \(8\lambda(s-1)^2\). Their difference is \(4\lambda s(7-2s)\), the value also supplied by the assessed axial identity \(k(t)^{\mathsf T}G(1,t)k(t)=s(7-2s)\) with \(k=(-t/2,1,-1)^{\mathsf T}\). [Assessed axial identity][axial]

## Square completion, limiting constant and scaling

Linearity of velocity gives \(V(Y+\sigma N)=V(Y)\). Because \(R(N)=4\lambda s(7-2s)>0\), the exact restriction is
\[
 R(Y+\sigma N)=
 R(Y)-\frac{\lambda(s-2)^2}{7-2s}
 +4\lambda s(7-2s)\left(\sigma-\frac{s-2}{2t(7-2s)}\right)^2.
\]
The witness is the finite minimizing \(\sigma_*(s)\) at each interior \(s\). Applying \(R\ge-C(s)|V|^2\) there and dividing by \(4R(Y)>0\) gives
\[
 C(s)\ge c_{\rm test}(s)
 =\frac{(s+2)(s-2)^2}{16(5s+1)(7-2s)}-\frac14 .
\]
Multiply by \(7/2-s>0\) and use \((7/2-s)/(7-2s)=1/2\). The test has exact limit \((11/2)(3/2)^2/[32(37/2)]=99/4736\). The pointwise comparison proves a scaled liminf at least this value for any admissible \(C(s)\), even if it is chosen discontinuously in \(s\). The calculation minimizes along the specified line. The optimum constant over the full derivative space is unidentified.

For \(3<r<7/2\), take \(s=r\) in the compact unit-kernel minimum and test at \(N_r/\sqrt{r+4}\). Strict-region positivity is inherited from the assessed sharp algebra. This gives
\[
 0<\kappa(r)\le\frac{12r(7-2r)}{(r+2)(r+4)}\ \longrightarrow\ 0 .
\]
This is a bound from above for the rate of vanishing. [Strict-region assessment][applications]

For arbitrary fixed old \(K>0\), keep the coefficients of the arrays in the matching old orthonormal frames. The common \(K\) in \(F=-KS\Sigma\) cancels from Bianchi, and the old full \(R\) is unchanged on those coefficients. The actual old \(V\) is multiplied by \(K\), so the lower bound for the coefficient of its squared norm becomes \(K^{-2}c_{\rm test}(s)\). At the same connection the native pairing is \(2\delta\), and \(g=2K\widehat g\) with \(\tau=2Kt_{\rm old}\) and \(V_{\rm n}=(2K)^{-1}V_{\rm o}\) as a one-form. Hence the squared speed picks up \(2(2K)^{-3}\) relative to its matched old norm. Constant metric rescaling leaves \(\Gamma_A^+\) and the endomorphism pairing unchanged. Each of \(X\) and \(\Xi\) has one covector slot, so the displayed full derivative expression, evaluated using the rescaled covector metric, gains \((2K)^{-1}\). Their ratio changes by \(2K^2\) relative to that old ratio. These are fixed positive multipliers and preserve the divergence. [Old and native conversion][e209]

## Actual local realization and quantifiers

Fix one interior \(s\) and the corresponding finite array \(X=Y+\sigma_*N\). On an oriented coordinate ball with trivial \(SO(3)\) bundle, use a constant standard self-dual triple and put \(F_i^*=-s_i\Sigma_i\) with \(s_i=\sqrt{(Q_s)_{ii}}\). The center wedge matrix relative to \(2dV_{\rm eucl}\) is \(Q_s\), and \(\operatorname{tr}Q_s=3\). Thus \(\mu_{\rm old}(0)=2dV_{\rm eucl}\), \(Q(0)=Q_s\), and the induced center metric is \(g_{\rm eucl}\) at \(K=1\), since the plane determines its conformal class and the volume fixes scale. Define
\[
 U_i^a=-\sum_j \frac{(X_a)_{ij}}{s_j} J_jdx^a,\qquad
 A=\frac12\sum_a x^a\iota_{\partial_a}F^*
    +\frac12\sum_a(x^a)^2U^a .
\]
The exterior derivative of the affine term is \(F^*\). The quadratic term has derivative \(\sum_a x^a dx^a\wedge U^a\). Since \(A(0)=0\), the bracket in \(F_A=dA+[A\wedge A]/2\) vanishes to second order at the center. It follows that \(F_A(0)=F^*\) and \(\partial_aF_A(0)=dx^a\wedge U^a\). In particular \(d_AF_A(0)=\sum_a dx^a\wedge dx^a\wedge U^a=0\), and the exact curvature satisfies Bianchi on the entire ball.

With \(\mathcal M_{ij}=F_i\wedge F_j/(2dV_{\rm eucl})\), the variation at \(F^*\) is \(-\tfrac12(s_j\langle\delta F_i,\Sigma_j\rangle+s_i\langle\delta F_j,\Sigma_i\rangle)\). The contraction identity \(\langle dx^a\wedge U_i^a,\Sigma_j\rangle=\langle U_i^a,J_jdx^a\rangle=-(X_a)_{ij}/s_j\) follows from the quaternion isometries and orthogonality. Symmetry gives \(\partial_a\mathcal M=X_a\). The differential of \(3\mathcal M/\operatorname{tr}\mathcal M\) subtracts \(\tfrac13Q_s\operatorname{tr}X_a=0\), and \(A(0)=0\) gives \((\nabla^A_aQ)(0)=X_a\). Thus the algebraic \(V\) and \(R\) are evaluated on the actual derivative array of this connection. [Inherited curvature-symbol construction][jets]

Positivity and the round-compatible sign persist by openness. By the extreme Rayleigh quotients \(\rho=\lambda_{\max}/\lambda_{\min}\) is continuous also at the repeated eigenvalue, and \(\rho(0)=s<7/2\). For each fixed \(s\), choose any \(r'\in(s,7/2)\) and then a sufficiently small closed ball with \(\sup\rho\le r'\). The witness lower bound \(C(s)\ge c_{\rm test}(s)\) concerns the center spectrum. The proof needs no local bound \(\rho\le s\), common radius, or uniform derivative bound. Accordingly it excludes one finite pointwise speed-only constant on the union of these strictly locally pinched data. The covered region is local and the optimized test is pointwise. Integrated gradient inequalities, actual evolution, closed-manifold realization and critical classification lie outside this conclusion.

## Verified identities

All seven frozen inputs in the E228 request match. The three indirect files below were checked for the recorded B107 premise, E223 coordinate convention and E220 historical status. No new spectral family, source retrieval or numerical sampling was used. Only this review and its return were written.

| Input | SHA-256 |
| --- | --- |
| [E228 request v1][request] | 141b16535b2b0f0a6070fbd7b4a2661615f070cd6f884717617c34a83cfc4b67 |
| [E227 derivation][target] | f3d777307b40ea66d74f8f06432d08b839ab75e2c2804d3b1584ec91749e0412 |
| [E227 request][inner] | 59e58b09d514d85a48ae60eae7d87e24bc3803e61987472d261fa7cdd4d066fb |
| [E227 return][ereturn] | e18fdf8e7af806c5bb435121b027f22c558ee5400199f7e911df13e1cbe5d6d5 |
| [E218/E219 assessment][axial] | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209 gradient and conventions][e209] | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E220/E222 assessment][applications] | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E02C curvature jets][jets] | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [B107 conceptual frame][b107] | a069162a40595c55a1edab915e2e186d6cec479c3698936600be7f8d8d23ea44 |
| [E223 coordinate conventions][e223] | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E220 historical conditional][e220] | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |

[request]: ../research-progress/handoffs/SP4-CME-E228_REQUEST_v1.md
[target]: ../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md
[inner]: ../research-progress/handoffs/SP4-CME-E227_REQUEST_v1.md
[ereturn]: ../research-progress/handoffs/SP4-CME-E227_RETURN_v1.md
[axial]: E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md
[e209]: ../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md
[applications]: E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md
[jets]: ../notes/04C_VOLUME_AND_JETS_20261122.md
[b107]: ../brainstorm/notes/B107_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md
[e223]: ../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md
[e220]: ../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md
