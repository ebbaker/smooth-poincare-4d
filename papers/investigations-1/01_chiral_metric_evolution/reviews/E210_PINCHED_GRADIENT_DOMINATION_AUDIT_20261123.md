# E210 — Independent pinched gradient domination audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit under B101, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E203 and E205. The already assessed E202/E204 kernel estimate is an input to this audit. The extension to nonzero velocity and the native static and interval estimates were checked independently against the E209 derivation.

## Disposition

Pass. The weighted-diagonal right inverse, full quadratic-form bound, absorption, stationary-to-full-velocity extension and metric conversion give the constants in E209. In native notation,
\[
 (1+4C_0)\mathscr D\ \ge\ \kappa\mathscr G+\frac{48}{5}\mathcal E,\qquad
 \kappa=\frac{32768}{2205225},\qquad
 C_0=\frac{11}{32}\left(\frac{2(81)^2}{\kappa}+81+\frac{\kappa}{2}\right).
 \tag{1}
\]
This is a static estimate at every supplied smooth positive-plane, round-compatible definite \(SO(3)\) connection with pointwise \(\rho(Q)\le9/4\) on a closed connected smooth oriented real four-manifold. Its time-integrated consequence applies on any supplied smooth original native flow interval with the same condition at every slice. [E209 derivation][e209] · [Kernel assessment][kernel]

## Velocity image and minimal complementary preimage

Work first with \([e_i,e_j]=\epsilon_{ijk}e_k\) and internal pairing \(\delta\), the old positive metric \(\widehat g\) and \(\mu_{\rm old}=2K^2dV_{\widehat g}\) for fixed \(K>0\). At a point choose an ordered oriented eigenframe and its matching oriented tangent coframe. The round-compatible polar isometry and chiral \(SO(4)\) action permit the latter choice by E203. The curvature is \(F=-KcD\Sigma\), with \(D=\operatorname{diag}(1,u,v)\), \(1\le u\le v\le3/2\), and \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\). Thus \(Q=c^2D^2\) and \(c^2=3/(1+u^2+v^2)\ge6/11\). All estimates concern tensors at the chosen point. In particular choosing another oriented eigenframe in a repeated eigenspace leaves the norm and quadratic form estimates unchanged. The factor \(-K\) cancels from the Bianchi reconstruction and enters the velocity as an overall scalar. [E203 frame and scale check][e203] · [Stationary certificate][e202]

Let \(X_a\) be any tuple of four symmetric trace-free matrices and \(C_a=X_a-\operatorname{tr}(QX_a)I/3\). Then \(\operatorname{tr}(Q C_a)=0\). Conversely, \(X_a=C_a-\operatorname{tr}(C_a)I/3\) has \(\operatorname{tr}(Q X_a)=-\operatorname{tr}(C_a)\), so the forward substitution recovers \(C_a\). This is the ordinary Frobenius trace-free projection applied to the weighted-trace-free \(C_a\). If \(X_a=(\nabla^A Q)_a\), then \(C_a=(D^AH)_a\) for \(H=q-|q|^2 I/6\) and \(q=Q-I\), since \(\operatorname{tr}(qX_a)=\operatorname{tr}(QX_a)\). Write \(C_{ij}\) for the covectors from the four \(C_a\). In the coframe convention \(J_j\alpha=*(\alpha\wedge\Sigma_j)\) and \(J_i J_j+J_j J_i=-2\delta_{ij}I\), with \(J_i\) orthogonal and skew. Bianchi and self-duality give \(V_{\rm old}=4*((D^A H)\wedge F)\). The old speed divided by \(-4Kc\) is \(W_i=\sum_j d_j J_j C_{ij}\).

The left relation follows by expansion:
\[
 \sum_i d_iJ_i W_i
   =-\sum_i d_i^2 C_{ii}
       +\sum_{i<j}d_id_j(J_iJ_j+J_jJ_i)C_{ij}=0 .
\]
The map on the left from triples of covectors to one covector is onto because \(d_1J_1\) is invertible. Its kernel is eight-dimensional. Given such a \(W\), set \(C_{ij}=0\) off the diagonal, \(C_{ii}=-J_iW_i/d_i\) for \(i=1,2\), and \(C_{33}=-(d_1^2 C_{11}+d_2^2 C_{22})/d_3^2\). The first two rows are exact by \(J_i^2=-I\). In the third, the left relation gives
\[
 d_3^2 C_{33}=d_1J_1W_1+d_2J_2W_2=-d_3J_3W_3 ,
\]
so \(d_3J_3C_{33}=W_3\). The constructed array has weighted trace zero and hence projects back into the required \(X\)-space. This proves surjectivity onto the relation space and rank eight throughout the closed spectral region.

Orthogonal projection onto ordinary trace-free matrices is a contraction, and \(d_i\le d_3\) gives \(|C_{33}|^2\le2(|C_{11}|^2+|C_{22}|^2)\). Therefore
\[
 |X_{\rm right}|^2\le |C|^2\le3(|W_1|^2+|W_2|^2)
    \le3|W|^2=\frac{3|V_{\rm old}(X)|^2}{16K^2c^2}
    \le\frac{11|V_{\rm old}(X)|^2}{32K^2}.
 \tag{2}
\]
Here the Frobenius pairing counts both entries of each off-diagonal pair. Any two preimages differ by a kernel vector. The orthogonal projection of any preimage onto \((\ker W)^\perp\) therefore has the same image and is the unique preimage of smallest norm. Inequality (2) bounds that complementary component. [E202 velocity calculation][e202] · [E209 equations (4)–(6)][e209]

## Unrestricted form estimate and absorption

For \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\), the solution \(Y_a\) of \(S Y_a+Y_a S=X_a\) has entries \((X_a)_{ij}/(\sqrt{\lambda_i}+\sqrt{\lambda_j})\). This gives \(|Y|\le |X|/(2\sqrt m)\). The Bianchi inverse on internal triples of covectors has symmetric block operator \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\). Its square inserts \(J_jJ_i-\delta_{ij}\sum_kJ_k^2=2\delta_{ij}I-\mathscr C_{ij}\), so its eigenvalues lie in \(\{1,-2\}\) and \(\|\mathscr C^{-1}\|\le1\). Its right-hand side is \(-*(S^{-1}Y\wedge\Sigma)\) in the compact notation for the componentwise contractions. Cauchy–Schwarz over the three \(J_j\) isometries bounds its norm by \(\sqrt3|S^{-1}Y|\). Thus the full reconstructed \(b\) has \(|b|\le \sqrt3|X|/(2m)\). The reconstruction is linear in the arbitrary input \(X\), and the norm bounds require no velocity constraint.

With \(\Xi_a=2[Y_a,S]+4S\operatorname{ad}(b_a)S\), matrix multiplication and \(\|\operatorname{ad}(b_a)\|_{\mathrm F}^2=2|b_a|^2\) give
\[
 |\Xi|\le4\sqrt{M_*}|Y|+4\sqrt2M_*|b|
 \le2\bigl(\sqrt{M_*/m}+\sqrt6\,M_*/m\bigr)|X|
 \le(3+9\sqrt6/2)|X|.
\]
The principal pairing for a trace-free symmetric \(T\) is \(4\operatorname{tr}(QT^2)-4\operatorname{tr}(QT)^2/3\), equivalently \(4\operatorname{tr}(Q(T-\operatorname{tr}(QT)I/3)^2)\). It lies between zero and \(4M_*|T|^2\le12|T|^2\). Also \(|q|^2=\operatorname{tr}(Q^2)-3\le6\). By cyclicity the trace of \(q[X_a,\Xi_a]\) is the trace of \([q,X_a]\Xi_a\). Cauchy–Schwarz and \(|[q,X_a]|\le2|q||X_a|\) bound the summed skew term by \(2|q||X||\Xi|\le(54+6\sqrt6)|X|^2\). The full \(R\) in E05, with this Bianchi contribution, is a real quadratic form for fixed \(Q\) and coframe. Hence
\[
 |R(X)|\le(66+6\sqrt6)|X|^2\le81|X|^2.
\]
This holds on the full twenty-dimensional derivative space. The symmetric operator for its polarization \(\mathcal B\) has eigenvalues in \([-81,81]\), so \(|\mathcal B(X,Y)|\le L_0|X||Y|\) for \(L_0=81\) with no further factor. [E05 estimates][e05] · [E209 full-form bound][e209]

For \(X=X_0+X_\perp\) the orthogonal kernel splitting, use the assessed \(R(X_0)\ge\kappa|X_0|^2\), the full diagonal bound on \(R(X_\perp)\), and \(2L_0 |X_0||X_\perp|\le(\kappa/2)|X_0|^2+(2L_0^2/\kappa)|X_\perp|^2\). This gives
\[
 R(X)\ \ge\ \frac{\kappa}{2}|X|^2
       -\left(\frac{2L_0^2}{\kappa}+L_0+\frac{\kappa}{2}\right)|X_\perp|^2
 \ \ge\ \frac{\kappa}{2}|X|^2-\frac{C_0}{K^2}|V_{\rm old}(X)|^2.
 \tag{3}
\]
The additional \(\kappa/2\) in \(C_0\) comes from replacing \(|X_0|^2\) by \(|X|^2-|X_\perp|^2\). This also explains why it is the minimal complementary preimage bounded in (2) that enters the estimate. [Assessed kernel estimate][kernel]

## Independent variation and static test

Let \(a\) be a smooth adjoint-valued one-form and vary \(A\) with velocity \(a\). From \(\delta F=d_Aa\), \(\delta\mu_{\rm old}=(2/3)\langle d_Aa\wedge F\rangle_\delta=(2/3)d\langle a\wedge F\rangle_\delta\), so the volume integral has zero variation on the closed base. The quotient derivative is
\[
 \delta Q_{ij}\,\mu_{\rm old}
 = (d_Aa)_i\wedge F_j+F_i\wedge(d_Aa)_j-Q_{ij}\delta\mu_{\rm old}.
\]
In the variation of \(\mathcal P_{\rm old}=\int(\operatorname{tr}(Q^2)-3)\mu_{\rm old}\), the first two terms contribute \(4QF\) to the second wedge factor. The last quotient term gives \(-2\operatorname{tr}(Q^2)\delta\mu_{\rm old}\), with one positive copy from the explicit volume variation. Substituting the remaining \(\delta\mu_{\rm old}\) gives
\[
 D\mathcal P_{\rm old}(a)
  = \int_M\langle d_Aa\wedge (4Q-\tfrac23\operatorname{tr}(Q^2)I)F\rangle_\delta .
\]
Because the second factor is self-dual in \(\widehat g\), the integrand converts to the ordinary metric two-form pairing times \(dV_{\widehat g}\). The volume in this adjoint computation is \(dV_{\widehat g}\). The matrix factor is \(2I+4H\), and \(d_A^{*\widehat g}F=0\). Thus
\[
 D\mathcal P_{\rm old}(a)
 =-\int_M\langle a,V_{\rm old}\rangle_{\widehat g,\delta}\,dV_{\widehat g},
 \qquad
 \mathscr D_{\rm old}=-D\mathcal P_{\rm old}[V_{\rm old}]
     =(2K^2)^{-1}\int_M |V_{\rm old}|_{\widehat g,\delta}^2\,\mu_{\rm old}.
 \tag{4}
\]
The ordinary form norm includes the usual skew-index normalization. Neither a factor \(2K^2\) in the old pairing nor a time derivative of its live metric enters this first variation. [E05 first variation][e05] · [E203][e203]

For a fixed supplied smooth \(A\), the affine curve \(A+\sigma V_{\rm old}(A)\) is smooth and stays positive definite with the same sign for small \(|\sigma|\) by compactness and openness. Its curvature derivative at zero is \(d_AV_{\rm old}(A)\). All E02A terms at that slice use this derivative, its spatial calculation from \(V_{\rm old}\), and the instantaneous identity \(d_A F=0\). In particular the E02A volume law is instantaneous. Symmetry of \(C_a\) and \(\operatorname{tr}(Q C_a)=0\) give \(\sum_i V_{{\rm old},i}\wedge F_i=2\sum_a\operatorname{tr}(QC_a)\iota_{e_a}\mu_{\rm old}=0\), hence \(\partial_\sigma\mu_{\rm old}=0\) at zero. The reaction in the curvature quotient has coefficient \(-24K\sqrt{\det Q}\,q\) at the same tangent. Differentiating \(\mathscr L_Q\) in \(X_a=\nabla_a^AQ\) and applying it to \(X_a\) gives \(4X_a^2-\frac43\operatorname{tr}(QX_a)X_a-\frac43|X_a|^2Q\), exactly the noncommutator quadratic terms in E02A. Thus integration of the divergence against \(2q\) on the closed base gives the negative of the principal term in \(2\int R\,\mu_{\rm old}\), while its skew sign and the reaction follow directly from \(2\langle q,\partial_\sigma Q\rangle\). This verifies E05 on the affine tangent:
\[
 \mathscr D_{\rm old}
  =2\int_M R(\nabla^A Q)\,\mu_{\rm old}
    +48K\int_M\sqrt{\det Q}\,|q|^2\,\mu_{\rm old}.
 \tag{5}
\]
Only the \(\sigma=0\) slice needs the \(9/4\) bound. This identity uses the prescribed tangent and smooth spatial identities, with no existence theorem for the flow invoked. [E02A derivation][e02a] · [E05 assessed identity][e04e07]

Since \(m=c^2\ge6/11\), one has \(\det Q\ge216/1331>4/25\), the strict numerical comparison being \(5400>5324\) after cross multiplication. Thus \(\sqrt{\det Q}\ge2/5\) holds including at the \(9/4\) spectral endpoint. Substitution of (3) into (5) yields a velocity cost \((2C_0/K^2)\int_M|V_{\rm old}|^2\,\mu_{\rm old}=4C_0\mathscr D_{\rm old}\) by (4). With \(\mathscr G_{\rm old}=\int_M|\nabla^A Q|_{\widehat g}^2\mu_{\rm old}\) this gives
\[
 (1+4C_0)\mathscr D_{\rm old}\ge
   \kappa\mathscr G_{\rm old}+\frac{96K}{5}\,\mathcal P_{\rm old}.
 \tag{6}
\]
The measures in \(\mathscr D_{\rm old}\) and \(\mathscr G_{\rm old}\) differ by the stated \(2K^2\) factor. [E209 equations (9)–(11)][e209]

## Native conversion and interval conclusion

Under the native pairing \(2\delta\), native orthonormal curvature components are \(\sqrt2\) times the old ones. The normalized wedge matrix \(Q\) and sign condition are unchanged. Put \(\ell=2K\). The native measure is \(2\mu_{\rm old}=\ell^2 dV_{\widehat g}\), so the native reconstructed metric in the same conformal class is \(g_A=\ell\widehat g\). Then \(\mathcal E=2\mathcal P_{\rm old}\). Under \(g_A=\ell\widehat g\), the formal adjoint from two-forms to one-forms acquires the factor \(\ell^{-1}\). This follows by comparing the integrated one-form and two-form pairings, whose conformal factors for a constant metric rescaling in dimension four are \(\ell\) and \(1\) respectively. The overall doubling of the internal metric cancels across the adjoint identity. As a geometric one-form \(V_{\rm native}=\ell^{-1}V_{\rm old}\), hence \(\tau=\ell t\) up to the time origin. [Foundation normalization][foundation]

In the squared norm of \(V_{\rm native}\), the internal factor is \(2\), the inverse metric for its single covector slot contributes \(\ell^{-1}\), and its own scale contributes \(\ell^{-2}\). The volume contributes \(\ell^2\), so \(\mathscr D=(2/\ell)\mathscr D_{\rm old}=\mathscr D_{\rm old}/K\). The Frobenius norm on endomorphisms of \(E\) is unchanged by the internal constant rescaling. The single covector slot of \(\nabla^AQ\) gives \(\ell^{-1}\), and the measure relative to \(\mu_{\rm old}\) gives \(2\), so \(\mathscr G=(2/\ell)\mathscr G_{\rm old}=\mathscr G_{\rm old}/K\). Equation (6) divided by \(K\) is exactly (1). The chain rule for the native tangent gives \(D\mathcal E[V_{\rm native}]=(2/\ell)D\mathcal P_{\rm old}[V_{\rm old}]=-\mathscr D\). This independently checks the dissipation normalization and the clock. [E209 native conversion][e209]

Let \(\gamma=48/[5(1+4C_0)]\) and \(\beta=\kappa/(1+4C_0)\). On every supplied smooth original native interval \([\tau_0,\tau_1]\) pinched throughout, \(\partial_\tau\mathcal E+\gamma\mathcal E+\beta\mathscr G\le0\). Multiplying by the positive integrating factor and using smoothness at the endpoints gives, for each \(\tau\in[\tau_0,\tau_1]\),
\[
 e^{\gamma(\tau-\tau_0)}\mathcal E(A(\tau))
  +\beta\int_{\tau_0}^{\tau}e^{\gamma(s-\tau_0)}\mathscr G(A(s))\,ds
  \le \mathcal E(A(\tau_0)).
\]
In particular \(\mathcal E(A(\tau))\le e^{-\gamma(\tau-\tau_0)}\mathcal E(A(\tau_0))\). The underlying base hypothesis is just the stated smooth closed connected oriented four-manifold, with closedness used in both integration identities. The estimate works at coincident eigenvalues and the closed ratio boundary since no division by a spectral gap is used. The interval estimate presupposes its entire smooth pinched interval. It supplies energy and integrated derivative control within it. No ratio preservation, continuation or \(C^k\) convergence follows from this audit.

## Checked identities

| Input | SHA-256 |
| --- | --- |
| [E210 request][request] | eabf5f7b54f21940a5ac9e6291b0408c7ec940e5e147464d1663b2f5e8f0f947 |
| [B101][b101] | a60adc8b1f68e7ccbebaf039e19d99d8e367c35bb2c973c6b0f75b3e5a840722 |
| [E209 derivation][e209] | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E209 return][r209] | a04ec7893204e08a7fb21163b01170054f813c07e04045a9f081b2752dc0934d |
| [E202/E204 assessment][kernel] | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E202][e202] | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E05][e05] | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04/E07 assessment][e04e07] | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E203][e203] | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E01 foundation][foundation] | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
| [E02A, inherited derivative calculation][e02a] | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |

The E05 file is the frozen current byte version in the request. The E04/E07 assessment retains the pre-typesetting digest from its own review. The documented correction disambiguates mathematical brackets, leaving the formulas and scope unchanged. No new external source inspection, numerical work or shared edit was used. [Typesetting record](BROAD_RUN_TYPESETTING_CORRECTIONS_20261122.md)

[request]: ../research-progress/handoffs/SP4-CME-E210_REQUEST_v1.md
[b101]: ../brainstorm/notes/B101_PINCHED_GRADIENT_DOMINATION_20261123.md
[e209]: ../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md
[r209]: ../research-progress/handoffs/SP4-CME-E209_RETURN_v1.md
[kernel]: E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md
[e202]: ../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md
[e05]: ../notes/07_PINCHED_ENERGY_GAP_20261122.md
[e04e07]: E04_E07_ESTIMATES_ASSESSMENT_20261122.md
[e203]: ../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md
[foundation]: E01_FOUNDATION_ASSESSMENT_20261122.md
[e02a]: ../notes/04A_NONLINEAR_Q_20261122.md
