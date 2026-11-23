# E209 — Gradient domination under the \(9/4\) spectral ratio bound

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B101. Helper launch configured gpt-6.2-sol/ultra. Independent runtime and lead settings are unavailable. I authored the E202 kernel certificate and the older E01A, E02A and E05 calculations. E204 independently audited E202 and E203 and the lead assessed them. This note extends the assessed kernel estimate by pointwise algebra and checks the energy, metric and clock factors directly.

## Statement

Let \(M\) be a smooth closed connected oriented real four-manifold, \(P\to M\) a smooth principal \(SO(3)\) bundle, \(E=\operatorname{ad}P\) and \(A\) a supplied smooth definite connection with positive curvature planes and the round-compatible curvature-map sign. Assume
\[
 \sup_M\frac{\lambda_{\max}(Q)}{\lambda_{\min}(Q)}\ \le\ \frac94,\qquad
 Q>0,\qquad \operatorname{tr}Q=3 .
\]
Use the native negative-Killing pairing and native reconstructed metric \(g_A\) for the following quantities:
\[
 \mathcal E(A)=\int_M|Q-I|^2\,dV_{g_A},\qquad
 \mathscr D(A)=\int_M|V_{\rm native}(A)|_{g_A,\,2\delta}^2\,dV_{g_A},\qquad
 \mathscr G(A)=\int_M|\nabla^AQ|_{g_A}^2\,dV_{g_A}.
\]
Here the derivative norm is the full Frobenius endomorphism norm with the indicated metric on the single covector slot. With explicit constants
\[
 \begin{gathered}
 \kappa=\frac{32768}{2205225},\qquad L_0=81,\qquad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+\frac{\kappa}{2}\right),\\
 \gamma=\frac{48}{5(1+4C_0)},\qquad \beta=\frac{\kappa}{1+4C_0},
 \end{gathered}
 \tag{1}
\]
the static estimate is
\[
 \boxed{\quad \gamma\,\mathcal E(A)+\beta\,\mathscr G(A)\le\mathscr D(A).\quad}
 \tag{2}
\]
In particular \(\mathcal E(A)\le\gamma^{-1}\mathscr D(A)\). For any supplied smooth original native interval \([\tau_0,\tau_1]\) on which the same pinching and sign hold, one has for \(\tau\in[\tau_0,\tau_1]\)
\[
 \boxed{\quad
 e^{\gamma(\tau-\tau_0)}\mathcal E(A(\tau))
   +\beta\int_{\tau_0}^{\tau}e^{\gamma(s-\tau_0)}
                   \mathscr G(A(s))\,ds
       \le \mathcal E(A(\tau_0)).
 \quad}                                                            \tag{3}
\]
In particular the native defect energy decays at rate at least \(\gamma\) on that interval. These constants are coarse and do not depend on the old calibration \(K\). No topological assumption beyond the stated closed connected oriented base enters.

## Old conventions and the right inverse

Use any fixed \(K>0\) in the old normalization, with bracket \([e_i,e_j]=\epsilon_{ijk}e_k\) in oriented old orthonormal internal frames, pairing \(\delta\), reconstructed metric \(\widehat g\), and volume \(\mu_{\rm old}=2K^2dV_{\widehat g}\). Set \(q=Q-I\), \(S=Q^{1/2}\), \(H=q-|q|^2I/6\). At a point use the oriented diagonal frame and matched oriented \(\widehat g\)-orthonormal coframe from E203. This gives \(F=-KS\Sigma\) with \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\), \(S=cD\),
\[
 D=\operatorname{diag}(d_1,d_2,d_3)=\operatorname{diag}(1,u,v),
 \qquad 1\le u\le v\le 3/2,\qquad
 c^2=\frac{3}{1+u^2+v^2}\ge\frac6{11}.
\]
The positive eigenframe and the chiral action select this coframe pointwise even for repeated eigenvalues. The full expressions are frame covariant, so no eigenframe derivative is taken. Write \(X=(X_a)\) for a tuple of four symmetric trace-free matrices in this coframe. For actual derivatives \(X_a=(\nabla^A Q)_a\). All pointwise norms below before the native conversion are Frobenius and \(\widehat g\) on the covector slot. [E203 frame and scale check](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md).

Set \(C_a=X_a-\frac13\operatorname{tr}(QX_a)I\). It is the actual \((D^A H)_a\) when \(X=\nabla^AQ\), and as a linear map it takes trace-free symmetric \(X_a\) isomorphically to symmetric matrices with \(\operatorname{tr}(D^2 C_a)=0\). Its inverse is \(X_a=C_a-\frac13\operatorname{tr}(C_a)I\), the ordinary orthogonal trace-free projection. Group entries \(C_{ij}\) as covectors. With \(J_j\alpha=*(\alpha\wedge\Sigma_j)\), the actual unadjusted speed and its scaled map are
\[
 V_{\rm old}(A)=-4d_A^{*\widehat g}(HF_A)=4*((D^AH)\wedge F_A),\qquad
 W_i=\sum_j d_j J_j C_{ij}=-\frac{V_{{\rm old},i}}{4Kc}.
 \tag{4}
\]
For abstract \(X\), \(V_{\rm old}\) in (4) denotes the corresponding linear velocity map. The first equality with the wedge uses self-duality and Bianchi. The quaternion products \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\) and weighted trace give \(\sum_i d_iJ_i W_i=0\). The map from all triples \((W_i)\) to \(\sum_i d_iJ_iW_i\) is onto, since \(J_1\) is invertible. Thus the velocity image is contained in an eight-dimensional relation space. [E202 kernel derivation](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md).

For any input \(W\) in that relation space, put all off-diagonal \(C_{ij}=0\) and set
\[
 C_{11}=-\frac{J_1W_1}{d_1},\qquad C_{22}=-\frac{J_2W_2}{d_2},\qquad
 C_{33}=-\frac{d_1^2 C_{11}+d_2^2 C_{22}}{d_3^2}.
 \tag{5}
\]
The first two rows of (4) are reproduced because \(J_i^2=-I\). The output \(W'\) satisfies the left relation since its \(C\) is weighted trace-free. With \(W'_1=W_1,W'_2=W_2\), the relation gives \(d_3J_3(W'_3-W_3)=0\), hence \(W'_3=W_3\). This supplies a right inverse throughout the relation space and proves the image has rank eight. Since \(d_i\le d_3\), \(|C_{33}|^2\le2(|C_{11}|^2+|C_{22}|^2)\). Since \(d_1,d_2\ge1\) and \(J_1,J_2\) are isometries, the trace-free projection \(X_{\rm right}\) of (5) satisfies
\[
 |X_{\rm right}|^2\le |C|^2\le3(|W_1|^2+|W_2|^2)\le3|W|^2
 \le\frac{11}{32K^2}|V_{\rm old}|^2 .
 \tag{6}
\]
The last inequality is \(3/(16K^2c^2)\le11/(32K^2)\). Orthogonal projection to \((\ker W)^\perp\) preserves the value of \(W\) and reduces the norm. It yields the unique minimal Frobenius norm preimage, as any other preimage differs by a kernel vector.

## Full form bound and absorption

Let \(b=A-\Gamma_A^+\), with the Bianchi-recovered mismatch for abstract \(X\) as well. The skew term and the old derivative form are
\[
 \begin{aligned}
 \Xi_a&=2[D_a^AS,S]+4S\operatorname{ad}(b_a)S,\qquad
 \mathscr L_Q T=2(QT+TQ)-\tfrac43\operatorname{tr}(QT)Q,\\
 R(X)&=\sum_a\left(\langle X_a,\mathscr L_Q X_a\rangle
                        -\langle q,[X_a,\Xi_a]\rangle\right).
 \end{aligned}
 \tag{7}
\]
The Sylvester equation \(S D_a^AS+(D_a^AS)S=X_a\) and the full Bianchi inverse are linear in \(X\) for fixed \(Q\). The common factor \(K\) cancels from Bianchi. In particular (7) is a real quadratic form on the whole twenty-dimensional \(X\) space.

For \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\), the Sylvester estimate is \(|D^AS|\le |X|/(2\sqrt m)\). The map \(b\mapsto*(d_A\Sigma)\) has inverse norm at most one: in the chosen frames its symmetric operator \(\mathscr C\) satisfies \(\mathscr C^2=2I-\mathscr C\), with eigenvalues in \(\{1,-2\}\). The Bianchi source is \(-*(S^{-1}D^AS\wedge\Sigma)\), whose norm is at most \(\sqrt3\,|S^{-1}D^AS|\) by the three \(J_j\) isometries. It follows that \(|b|\le\sqrt3\,|X|/(2m)\). Since \(|\operatorname{ad}(b_a)|_{\rm F}=\sqrt2|b_a|\), we obtain
\[
 |\Xi|\le 4\sqrt{M_*}|D^AS|+4\sqrt2 M_*|b|
       \le 2\left(\sqrt{\frac{M_*}{m}}+\sqrt6\,\frac{M_*}{m}\right)|X|
       \le(3+9\sqrt6/2)|X|.
\]
For the principal pairing, the weighted-trace identity gives \(0\le\langle X_a,\mathscr L_Q X_a\rangle\le4M_*|X_a|^2\le12|X_a|^2\). Also \(|q|^2=\operatorname{tr}Q^2-3\le6\), since \(\operatorname{tr}Q=3\) and \(Q>0\). Trace cyclicity and the Frobenius commutator estimate then give
\[
 \left|\sum_a\langle q,[X_a,\Xi_a]\rangle\right|
 \le 2|q|\,|X|\,|\Xi|
 \le(54+6\sqrt6)|X|^2 .
\]
Thus \(|R(X)|\le(66+6\sqrt6)|X|^2\le L_0 |X|^2\) on all \(X\). For the symmetric polarization \(\mathcal B\) of \(R\), the associated self-adjoint operator has spectrum in \([-L_0,L_0]\) by the quadratic bound, giving \(|\mathcal B(X,Y)|\le L_0|X||Y|\). [E05 full-form estimates](07_PINCHED_ENERGY_GAP_20261122.md) · [E04–E07 assessment](../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md).

Write \(X=X_0+X_\perp\) with \(X_0\in\ker W\) and \(X_\perp\in(\ker W)^\perp\). Equation (6) bounds the second, minimal preimage of \(W(X)\). The assessed E202/E204 estimate gives \(R(X_0)\ge\kappa|X_0|^2\). Then
\[
 \begin{aligned}
 R(X)&\ge\kappa |X_0|^2-2L_0|X_0|\,|X_\perp|-L_0|X_\perp|^2\\
     &\ge\frac\kappa2|X_0|^2
                       -\left(\frac{2L_0^2}{\kappa}+L_0\right)|X_\perp|^2\\
     &\ge\frac\kappa2|X|^2-\frac{C_0}{K^2}|V_{\rm old}(X)|^2.
 \end{aligned}
 \tag{8}
\]
Here the second line uses Young's inequality and the third uses orthogonality and (6). The tensorial pointwise argument applies to the actual first derivatives everywhere on \(M\), without selecting a smoothly varying eigenframe. [Stationary pinching assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

## Old first variation and static integrated estimate

Set \(\mathcal P_{\rm old}(A)=\int_M |q|^2\mu_{\rm old}\). For any smooth independent connection variation with tangent \(a\), \(\delta F=d_Aa\), and Bianchi gives the exact volume variation \(\delta\mu_{\rm old}=\frac23 d\langle a\wedge F\rangle_\delta\). Its integral is zero on the closed base. Differentiating \(Q_{ij}\mu_{\rm old}=F_i\wedge F_j\) in \(\int_M\operatorname{tr}(Q^2)\mu_{\rm old}\) therefore yields
\[
 D\mathcal P_{\rm old}(a)
   =\int_M\left\langle d_Aa\wedge
                   \left(4Q-\tfrac23\operatorname{tr}(Q^2)I\right)F
              \right\rangle_\delta .
\]
The matrix factor times \(F\) is self-dual for \(\widehat g\). Converting the wedge pairing to the ordinary two-form pairing uses \(dV_{\widehat g}\) as the measure. Integration by parts thus uses the formal adjoint for \((\widehat g,\delta,dV_{\widehat g})\). The matrix is \(2I+4H\), and \(d_A^{*\widehat g}F=0\) by self-duality and Bianchi. It follows that \(D\mathcal P_{\rm old}(a)=-\int_M\langle a,V_{\rm old}\rangle_{\widehat g,\delta}dV_{\widehat g}\). In particular
\[
 D\mathcal P_{\rm old}[V_{\rm old}]=-\mathscr D_{\rm old},
 \qquad
 \mathscr D_{\rm old}=\int_M|V_{\rm old}|_{\widehat g,\delta}^2\,dV_{\widehat g}
                 =\frac{1}{2K^2}\int_M |V_{\rm old}|_{\widehat g,\delta}^2\,\mu_{\rm old}.
 \tag{9}
\]
This first variation involves no derivative of the instantaneous inner product.

The exact integrated E05 computation also evaluates the same directional derivative at a fixed smooth \(A\). Indeed take the smooth affine path \(A_\sigma=A+\sigma V_{\rm old}(A)\) for \(\sigma\) near zero. It stays in the open definite sign class for a sufficiently small interval, because the base is compact, and \(\partial_\sigma F_{A_\sigma}|_0=d_A V_{\rm old}(A)\). At this one slice all E02 derivative identities, including \(\partial_\sigma\mu_{\rm old}|_0=0\), use only that first temporal tangent and spatial identities at \(A\). The integration in E05 then gives the fixed-time directional identity
\[
 \mathscr D_{\rm old}
   =2\int_M R(\nabla^A Q)\,\mu_{\rm old}
       +48K\int_M \sqrt{\det Q}\,|q|^2\,\mu_{\rm old}.
 \tag{10}
\]
This needs no local evolution theorem to test a noncritical datum. It also holds at each time of any smooth old original solution. The affine variation may leave the spectral region away from \(\sigma=0\), which is irrelevant to this instantaneous identity. [E02A derivative identity](04A_NONLINEAR_Q_20261122.md) · [E05 integrated identity](07_PINCHED_ENERGY_GAP_20261122.md) · [E203 independent variation](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md).

Since \(m=c^2\ge6/11\), \(\det Q\ge(6/11)^3=216/1331>4/25\), so \(\sqrt{\det Q}\ge2/5\) suffices here. Substitute (8) into (10) and use (9). The negative velocity cost is exactly \(2(C_0/K^2)\int|V_{\rm old}|^2\mu_{\rm old}=4C_0\mathscr D_{\rm old}\). Thus with \(\mathscr G_{\rm old}=\int_M|\nabla^A Q|_{\widehat g}^2\mu_{\rm old}\) the old inequality is
\[
 (1+4C_0)\,\mathscr D_{\rm old}
  \ \ge\ \kappa\,\mathscr G_{\rm old}+\frac{96K}{5}\,\mathcal P_{\rm old}.
 \tag{11}
\]

## Native conversion and conditional decay

The native internal pairing is \(2\delta\), so old orthonormal curvature components gain \(\sqrt2\) on passing to native orthonormal labels. The wedge numerator and volume both double, preserving \(Q\), its eigenvalue ratio, the positive plane and the round sign. Thus \(\mu_{\rm native}=dV_{g_A}=2\mu_{\rm old}=4K^2dV_{\widehat g}\) and within the same conformal class \(g_A=2K\widehat g\). This gives \(\mathcal E=2\mathcal P_{\rm old}\) and native time \(\tau=2K t\) for old time \(t\). Equivalently, the adjoint from two-forms to one-forms scales by \((2K)^{-1}\) under constant metric rescaling, and the constant internal metric factor cancels in the adjoint. Hence as an \(E\)-valued one-form \(V_{\rm native}=(2K)^{-1}V_{\rm old}\). [E01 normalization assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) · [E206 normalization audit](../reviews/E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123.md).

The velocity's pointwise squared norm therefore gains \(2(2K)^{-3}\) from its internal pairing, covector slot and speed scaling. Integration against \(dV_{g_A}=(2K)^2dV_{\widehat g}\) gives \(\mathscr D=\mathscr D_{\rm old}/K\). The internal Frobenius norm of an endomorphism is unchanged by multiplying the metric on \(E\) by a constant, so \(|\nabla^A Q|_{g_A}^2=(2K)^{-1}|\nabla^A Q|_{\widehat g}^2\). The measure in \(\mathscr G_{\rm old}\) was \(\mu_{\rm old}\), hence \(\mathscr G=\mathscr G_{\rm old}/K\). Dividing (11) by \(K\) and using \(\mathcal E=2\mathcal P_{\rm old}\) proves
\[
 (1+4C_0)\mathscr D\ \ge\ \kappa\mathscr G+\frac{48}{5}\mathcal E ,
\]
which is (2). The old/native directional gradient identity is likewise \(D\mathcal E[V_{\rm native}]=(1/K)D\mathcal P_{\rm old}[V_{\rm old}]=-\mathscr D\). On a supplied native original interval with the pointwise spectral bound this gives \(\partial_\tau\mathcal E+\gamma\mathcal E+\beta\mathscr G\le0\). Multiplication by \(e^{\gamma(\tau-\tau_0)}\) and integration yields (3) for the indicated \(\mathscr G\) in the native metric and volume.

The static estimate applies to every supplied smooth connection in the stated region, critical or noncritical. The interval result presupposes both smooth existence and the spectral bound on that interval. It gives no preservation of the ratio, lifespan, initialization or \(C^k\) convergence claim. No external source, numerical search or change to the spectral region was used.

## Verified identities

| Input | SHA-256 |
| --- | --- |
| [E209 request](../research-progress/handoffs/SP4-CME-E209_REQUEST_v1.md) | 7ed9300526d60b72dee0035fc512dc889271356ecb5ca23be28b80a518ed12ab |
| [B101](../brainstorm/notes/B101_PINCHED_GRADIENT_DOMINATION_20261123.md) | a60adc8b1f68e7ccbebaf039e19d99d8e367c35bb2c973c6b0f75b3e5a840722 |
| [E202 note](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E204 audit](../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E05](07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04–E07 assessment](../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E01 assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
| [E203 note](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E206 audit](../reviews/E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123.md) | 2fe692ce764688a97eab6f7e25b680eeaafdd4a8ea50b61e953b10e1fe756e19 |

The [E209 return](../research-progress/handoffs/SP4-CME-E209_RETURN_v1.md) carries the result and the derivation's hash.
