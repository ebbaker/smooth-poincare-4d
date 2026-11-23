# E203 — Conditional stationary perfection from pointwise kernel signs

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B97/B98, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the E187 finite calculations and E199 axial proof. Both pointwise sign inputs below remain explicit hypotheses in this application. The frozen E199 claim was under E201 review at dispatch and the E202 calculation was active. This note uses no claim of new spectral positivity.

## Setting, conditional premises, and conclusion

Let \(M\) be a smooth closed connected oriented real four-manifold and \(A\) a smooth definite \(SO(3)\) connection on a fixed oriented Euclidean rank-three adjoint bundle \(E\to M\). Assume positive curvature planes and the round-compatible curvature-map sign. Use exactly E05's older conventions. In positively oriented internal orthonormal frames \([e_i,e_j]=\epsilon_{ijk}e_k\) with the older Euclidean bracket pairing. Fix \(K>0\) constant. The positive Riemannian reconstructed metric \(\widehat g\) and ordinary form pairings satisfy

\[
 Q>0,\qquad\operatorname{tr}Q=3,\qquad S=Q^{1/2},\qquad
 F=-KS\Sigma,\qquad F_i\wedge F_j=Q_{ij}\mu,\qquad
 \mu=2K^2dV_{\widehat g},\qquad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}.                \tag{1}
\]

Here \(F\) and \(\Sigma\) are internal columns. Base covector indices use \(\widehat g\), and matrix pairings are Frobenius. Let \(q=Q-I\) and \(\mathcal P(A)=\int_M |q|^2\mu\). Suppose \(A\) is critical under smooth independent connection variations. [E05][energy] · [Assessment][assessment]

For the pointwise algebraic premises use the E187/E199 sign form at \(K=1\), with the full compatibility recovery of \(b\) and exact velocity kernel, and each tested \(Q\) positive with trace three.

- **\(H_{\rm axial}\).** The form is nonnegative on the velocity kernel for \(Q=3\operatorname{diag}(1,1,t^2)/(2+t^2)\) at every \(t\) in the closed interval \([t_-,t_+]\), where \(t_- = \sqrt{(\sqrt{201}-13)/8}\) and \(t_+=\sqrt{7/2}\). This is the sign part of the frozen E199 claim. [B97][b97] · [E199][axial]
- **\(H_{\rm ratio}\).** The same form is nonnegative on the velocity kernel for every positive trace-three \(Q\) with \(\lambda_{\max}/\lambda_{\min}\le9/4\). This is the proposed region tested in the frozen E202 request, and no E202 result is assumed. [B98][b98] · [E202 request][ratio]

Under \(H_{\rm axial}\), suppose that at each point the spectrum, regarded as an unordered multiset, is the stated axial spectrum for some \(t\in[t_-,t_+]\). Alternatively, under \(H_{\rm ratio}\), suppose that at each point its eigenvalue ratio is at most \(9/4\). In either corresponding case \(Q=I\) on \(M\), and \(\widehat g\) is ASD Einstein with scalar curvature \(12K\). The proof uses the two alternatives separately.

## Criticality and the actual unadjusted velocity

The positive definite sign class is open under smooth variations. For a smooth \(E\)-valued one-form \(a\), \(\delta F=d_Aa\) and

\[
 \delta\mu=\tfrac23\langle d_Aa\wedge F\rangle
            =\tfrac23 d\langle a\wedge F\rangle.                 \tag{2}
\]

The last identity uses Bianchi and the invariant bracket pairing. Thus the integral of \(\mu\) is constant along variations on the closed base. Using \(\operatorname{tr}Q=3\) one can vary \(\int\operatorname{tr}(Q^2)\mu\) in place of \(\mathcal P\). From (1),

\[
 \mu\,\delta Q_{ij}=(d_Aa)_i\wedge F_j+F_i\wedge(d_Aa)_j-Q_{ij}\delta\mu.
\]

Contracting with \(2Q_{ij}\), adding the volume variation and using (2) give

\[
 \delta\mathcal P(a)=\int_M\Big\langle d_Aa\wedge
          \bigl(4Q-\tfrac23\operatorname{tr}(Q^2)I\bigr)F\Big\rangle.  \tag{3}
\]

The second factor is self-dual, so the ordinary two-form pairing in \(\widehat g\) gives (3), with volume \(dV_{\widehat g}\) in the pairing. Integration by parts gives the gradient for the ordinary one-form \(L^2\) pairing. The scalar constant term is \(2F\), since \(4Q-\frac23\operatorname{tr}(Q^2)I=2I+4H\) with \(H=q-|q|^2I/6\). It contributes zero because \(d_A^{*\widehat g}F=0\) by self-duality and Bianchi. Thus criticality is the vanishing of the actual original velocity

\[
                 V(A)=-4d_A^{*\widehat g}(HF)=0 .                \tag{4}
\]

There is no projection to a gauge slice or quotient equation in (4). In the old unadjusted time the constant path \(A(t)=A\) is an original smooth definite solution. [E05][energy] · [E01A, variation and normalization][foundation]

Use self-duality of \(HF\) before differentiating. The adjoint in degree two is \(-*d_A*\), and \(d_AF=0\), so \(V=4*((D^AH)\wedge F)\). Put \(X_a=(\nabla^AQ)_a\) in a \(\widehat g\)-orthonormal coframe. Each is trace-free symmetric, and \((D^AH)_a=X_a-\operatorname{tr}(QX_a)I/3\), since \(\operatorname{tr}X_a=0\). With the ordinary contraction identity \(*(\alpha\wedge F_k)=\iota_{\alpha^\sharp}F_k\) for a self-dual two-form, the coefficient equation is

\[
 V_{i,b}=4\sum_{a,k}
           \left(X_a-\frac{\operatorname{tr}(QX_a)}3I\right)_{ik}F_{k,ab}.   \tag{5}
\]

This includes the spatial metric dependence through the full field identity. In particular (5) is precisely the velocity constraint used in the pointwise tests once the common curvature factor \(K\) is removed.

## Compatible diagonal frames at every point

Fix any point \(x\). Let \(F^\sharp:E_x\to\Lambda^+_{\widehat g,x}\) denote contraction into the internal curvature slot. By (1) and positive self-duality,

\[
 \langle F^\sharp v,F^\sharp w\rangle_{\widehat g}=2K^2\langle Qv,w\rangle_E .
\]

Thus \(U=-F^\sharp S^{-1}/(\sqrt2 K)\) is an isometry onto the ordinary unit positive two-form space. Use the orientation there defined by \((\Sigma_1,\Sigma_2,\Sigma_3)\) in the E187 standard coframe. The round-compatible sign is precisely that \(U\) is orientation preserving in this convention, equivalently \(F^\sharp\) has negative determinant sign against the corresponding adapted chiral orientation. This is the old coframe coefficient sign, with no change of the round scalar-curvature sign. [E01A, adapted coframe and sign][foundation] · [Foundation assessment][fa]

Choose an oriented orthonormal eigenframe \((e_i)\) of \(Q(x)\), with the desired order. Any permutation of real orthonormal eigenvectors can be made positively oriented by flipping one vector's sign, preserving the diagonal entries. Then \(\Sigma_i=\sqrt2\,Ue_i\) are the normalized positively oriented chiral forms for this internal eigenframe, and \(F_i=-K\sqrt{\lambda_i}\,\Sigma_i\).

The \(SO(4)\) action on the positive chiral three-plane reaches every oriented orthonormal change of its frame. Pointwise this follows using the endomorphisms \(J_i\alpha=*(\alpha\wedge\Sigma_i^{\rm std})\) on covectors from any oriented orthonormal real coframe and its standard triple. They satisfy \(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\) and are skew. For unit \(n\in\mathbb R^3\), the orthogonal map \(\cos(\theta/2)I+\sin(\theta/2)\sum_i n_iJ_i\) is in \(SO(4)\) by the identity-start path. Its conjugation on the span of the \(J_i\) is the rotation about \(n\) by \(\theta\), as follows from the quaternion products. Since Hodge star and wedge commute with this orthogonal change, this is precisely the induced chiral action. Axis-angle rotations exhaust \(SO(3)\). Apply the appropriate coframe change to realize the ordered forms \(\sqrt2\,Ue_i\) as

\[
               (dx^{14}+dx^{23},\ dx^{24}+dx^{31},\ dx^{34}+dx^{12})
\]

in the new oriented orthonormal real coframe at \(x\). This construction is pointwise and needs no global spin lift or eigenframe.

For the axial spectrum assign the repeated eigenvalues the first two slots and the remaining eigenvalue the third. For the ratio alternative choose nondecreasing eigenvalues. Then \(\sqrt Q=c\operatorname{diag}(1,u,v)\), with \(1\le u=\sqrt{\lambda_2/\lambda_1}\le v=\sqrt{\lambda_3/\lambda_1}\le3/2\) and \(c^2=3/(1+u^2+v^2)\), as in the E202 formulation. Both choices cover coincidences including \(Q=I\). The evaluated \(\nabla^AQ\) is a tensor on the point, so \(X_a\) need not be diagonal and no derivative of a pointwise eigenframe is taken.

## Bianchi recovery, scale and scalar invariance

Let \(\Gamma_A^+\) denote the chiral Levi–Civita connection transported to \(E\) by the adapted isometry, and let \(b=A-\Gamma_A^+\). The chiral exterior identity is \(d_{\Gamma_A^+}\Sigma=0\), so \(d_A\Sigma=[b\wedge\Sigma]\). With \(D^A_aS\) obtained from \(S D^A_aS+(D^A_aS)S=X_a\), Bianchi for (1) gives

\[
 0=-K\bigl((D^AS)\wedge\Sigma+S[b\wedge\Sigma]\bigr).          \tag{6}
\]

Because \(K\) is constant and positive, it cancels exactly. Put \(P_a=S^{-1}D^A_aS\), \(J_j\alpha=*(\alpha\wedge\Sigma_j)\) and \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\) in these matched frames. The starred (6) gives \(\mathscr Cb=z\) with \(z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a\). The assessed identity \(\mathscr C^{-1}=(\mathscr C+I)/2\) reconstructs this actual \(b\) uniquely. Accordingly the terms used in E05 are exactly those in the pointwise tests:

\[
 \begin{aligned}
 \Xi_a&=2[D_a^AS,S]+4S\operatorname{ad}(b_a)S,\\
 \mathscr L_QX&=2(QX+XQ)-\tfrac43\operatorname{tr}(QX)Q,\\
 R_Q(X)&=\sum_a\bigl(\langle X_a,\mathscr L_QX_a\rangle
                     -\langle q,[X_a,\Xi_a]\rangle\bigr).
 \end{aligned}                                                     \tag{7}
\]

Thus there is no explicit \(K\) in the derivative form with the evaluated orthonormal coefficients \(Q,X\). In (5), replacing \(F=-KS\Sigma\) by \(-S\Sigma\) merely divides \(V\) by \(K>0\), preserving its zero set. This is a comparison of pointwise algebra for the actual coefficients at the chosen scale. As a separate check, for the same connection under a change of normalization from \(K=1\) to \(K>0\), the reconstructed metric becomes \(K^{-1}\widehat g_{1}\), because its four-volume changes by \(K^{-2}\) and its conformal class is fixed. In corresponding orthonormal coframes \(X_a\) gains \(\sqrt K\), and \(b_a\) and \(\Xi_a\) do as well by the linear reconstruction. The two terms of \(R_Q(X)\) both gain \(K\). The sign is unchanged in either reading. [E05 conventions][energy] · [E01A compatibility][foundation]

For tensorial invariance write \(G\in SO(3)\) and \(O\in SO(4)\) for the induced transformations on internal and base components. Then \(Q'=GQG^{-1}\), \(S'=GSG^{-1}\), \(X'_a=\sum_b O_{ab}G X_bG^{-1}\), and \(b'_a=\sum_b O_{ab}G b_b\), since \(b\) is the difference of two connections. The induced \(D^AS\) obeys the same tensor law as \(X\). Because \(\operatorname{ad}(Gv)=G\operatorname{ad}(v)G^{-1}\) for this oriented bracket, \(\Xi'_a=\sum_b O_{ab}G\Xi_bG^{-1}\). The Bianchi construction itself is equivariant by wedge, Hodge star and the bracket, and its unique reconstruction therefore gives the same transformed \(b\). For \(V\), the field expression before (5) uses those same covariant operations, so its transformation is by \(G\) and \(O\) as an \(E\)-valued covector. In particular its vanishing is invariant. Trace cyclicity gives \(\mathscr L_{GQG^{-1}}(GXG^{-1})=G\mathscr L_Q(X)G^{-1}\), and both Frobenius terms of (7) are unchanged after summing the base indices using \(\sum_a O_{ab}O_{ad}=\delta_{bd}\). This proves invariance of \(R_Q(X)\). No derivatives of the chosen transformations enter these tensor formulas. As a result the supplied pointwise spectral assumptions give \(R_Q(X)\ge0\) on the actual critical connection at every point, including at repeated eigenvalues and crossings.

## Integrated stationary consequence

Apply the exact E05 identity to the constant original solution given by (4). That identity uses the full nonlinear defect divergence and the spatially constant factor \(\mu/dV_{\widehat g}=2K^2\) in integration by parts. The later E05 \(|q|\le1/8\) estimate is a distinct sufficient hypothesis and is not used here. In the notation of (7),

\[
 0=\frac{d}{dt}\mathcal P(A(t))
       =-2\int_M R_Q(X)\,\mu-48K\int_M \sqrt{\det Q}\,|q|^2\,\mu .  \tag{8}
\]

Both integrands are nonnegative in the corresponding conditional case. Since \(K>0\), \(Q>0\) and \(\mu\) is a smooth positive volume, vanishing of the reaction integral implies \(q=0\) everywhere. In fact if \(q\ne0\) at any point, continuity makes the reaction density positive on a neighborhood. This uses no positive derivative coercivity in (7). In particular the same argument works when the axial form is only semidefinite at either endpoint. [E05, exact identity (3)][energy] · [Assessment][assessment]

With \(Q=I\), \(D^AS=0\) and the compatibility inverse gives \(b=0\). Thus \(A=\Gamma_A^+\) under the adapted identification and \(F_{\Gamma_A^+}=-K\Sigma\). In the already assessed chiral curvature decomposition this makes the off-diagonal Ricci block vanish, the trace-free positive Weyl block vanish, and the scalar block \(s/12\) equal to \(K\). Hence \(\widehat g\) is ASD Einstein with scalar \(12K\). This is the reconstructed metric in (1). [E01A, perfect reconstruction][foundation] · [Foundation assessment][fa]

The two conclusions require the specified spectra of a supplied smooth critical connection. A negative abstract direction of (7) outside a region only removes this sufficient pointwise sign. It gives no actual connection solving the critical partial differential equation on a neighborhood or the closed manifold, and in particular gives no nonperfect critical example. Existence, spectral preservation in nonstationary flow, all-spectrum critical exclusion, and further compact classification are outside the packet. No new algebraic sign test, source inspection, or numerical work was used.

## Checked versions

| Input | SHA-256 |
| --- | --- |
| [E203 request][req] | `be387dc1d44830ef90a6db1b447229a5607e2dc62141b5a8ec8e0185ae899245` |
| [B97][b97] | `001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c` |
| [B98][b98] | `8619615c9a35c9c58cb834b277ebb1141a1f33f439283857bc2b42cab7553867` |
| [E05][energy] | `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb` |
| [E04–E07 assessment][assessment] | `1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c` |
| [E199 claim][axial] | `e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d` |
| [E202 request][ratio] | `23f5cc5c0d1543f14f470b0982d74d1380cc3851b5c00d8578cbc8e1cccef815` |
| [E01A inherited normalization and compatibility][foundation] | `c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f` |
| [Inherited foundation assessment][fa] | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |

[req]: ../research-progress/handoffs/SP4-CME-E203_REQUEST_v1.md
[b97]: ../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[b98]: ../brainstorm/notes/B98_GENERAL_STATIONARY_PINCHING_TEST_20261122.md
[energy]: 07_PINCHED_ENERGY_GAP_20261122.md
[assessment]: ../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md
[axial]: 199_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[ratio]: ../research-progress/handoffs/SP4-CME-E202_REQUEST_v1.md
[foundation]: ../reviews/E01A_AUDIT_20261122.md
[fa]: ../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md
