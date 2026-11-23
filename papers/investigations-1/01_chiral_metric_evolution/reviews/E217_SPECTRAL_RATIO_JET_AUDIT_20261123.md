# E217 — Independent spectral-ratio local-jet audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit under B103, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored the inherited E153 determinant-trace audit and the separate E203 stationary application. The local polynomial and derivative of E215 were checked independently of its author.

## Disposition

Pass. The explicit old-\(K=1\) polynomial connection gives a strict spatial maximum of the ratio \(9/4\) at its center, with simple eigenvalues there and on a sufficiently small neighborhood. Its spatial scalar Hessian for \(w=\log\rho(Q)\) is \(-788557\,g_{\rm e}/279936\). The exact old-clock derivative on the original vector field is \(8000/133-1001/27-(385/18)\sqrt{\det Q_*}\), strictly greater than \(12119/7182\). The native derivative is half that value and exceeds \(12119/14364\). This rules out the proposed local nonpositive scalar boundary derivative inference. The conclusion concerns a local connection and its flow-vector evaluation. [E215][e215]

## Scalar calculation on the specified boundary

At \(Q_*=\operatorname{diag}(48,75,108)/77\), the positive ordered eigenvalues are simple with gaps \(27/77\) and \(33/77\), and \(\lambda_3/\lambda_1=9/4\). In an open neighborhood the isolated eigenvalues are smooth by the simple roots of the characteristic polynomial. Differentiating the normalized eigenpair at the diagonal point gives \(d\lambda_i[U]=U_{ii}\). Thus for trace-free symmetric \(U\), the Frobenius representative of \(df\), \(f=\log(\lambda_3/\lambda_1)\), is
\[
 G=(D_g)_0,\qquad D_g=\operatorname{diag}(-1/\lambda_1,0,1/\lambda_3),
 \qquad G=\frac{77}{1296}\operatorname{diag}(-22,5,17).
\]
With \(P_Q(U)=U-\operatorname{tr}(QU)I/3\), \(\mathscr L_Q U=2(QP_Q(U)+P_Q(U)Q)\). The trace vanishes because \(\operatorname{tr}Q=3\), and the anticommutator and the symmetric rank-one term in the expanded expression are self-adjoint for the Frobenius pairing. Since \(\operatorname{tr}(Q_*D_g)=0\), \(P_{Q_*}(G)=D_g\), giving \(\mathscr L_{Q_*}G=\operatorname{diag}(-4,0,4)\).

For \(T=\operatorname{diag}(\lambda_1,-\lambda_1-\lambda_3,\lambda_3)=(12/77)\operatorname{diag}(4,-13,9)\), \(df[T]=-1+1=0\). The pairing with the principal image is \(\langle G,\mathscr L_{Q_*}T\rangle=4(\lambda_3-\lambda_1)=240/77\). The diagonal trace-free space has dimension two. Subtracting the \(G\)-component of \(\mathscr L_{Q_*}G\) gives the same \(Y\) as projecting onto \(T\), hence
\[
 Y=\frac{10}{133}\operatorname{diag}(4,-13,9),\quad
 \langle G,Y\rangle=0,\quad
 \langle G,\mathscr L_{Q_*}Y\rangle=|Y|^2=\frac{200}{133}.
\]
The squared gradient follows from \(22^2+5^2+17^2=798\), and the two other pairings follow from the diagonal principal image and \(\operatorname{tr}(Q_*D_g)=0\):
\[
 |G|^2=\frac{788557}{279936},\qquad
 \langle G,\mathscr L_{Q_*}G\rangle=\frac{1001}{108},\qquad
 \langle G,q_*\rangle=-\operatorname{tr}D_g=\frac{385}{432}.
\]
These are independent of any polynomial connection realization. [E02A principal map][e02a]

## Realization and affine curvature Hessian

Work in the stipulated oriented Euclidean chart and trivial bundle with the old internal metric \(\delta\) and bracket \([e_i,e_j]=\epsilon_{ijk}e_k\). Write \(s_i=\sqrt{\lambda_i}\), \(d=s_1s_2s_3\), and \(F_i^*=-s_i\Sigma_i^*\) for the normalized positive self-dual triple in E215. Its plane is Euclidean self-dual, its old volume is \(2dV_{\rm e}\), and its sign is round-compatible. For \(\mathcal M_{ij}=F_i\wedge F_j/(2dV_{\rm e})\), one has \(\mathcal M(F^*)=Q_*\) and \(Q(F)=3\mathcal M/\operatorname{tr}\mathcal M\). At \(F^*\) the true quotient differential is
\[
 \delta\mathcal M_{ij}=-\tfrac12\big(s_j\langle\delta F_i,\Sigma_j^*\rangle+
                                     s_i\langle\delta F_j,\Sigma_i^*\rangle\big),
 \qquad
 \delta Q=\delta\mathcal M-\tfrac13\operatorname{tr}(\delta\mathcal M)Q_* .
 \tag{1}
\]
Here the \(1/2\) comes from the volume in \(\mathcal M\). The pairing is the ordinary two-form norm counting one copy for each unordered pair. For a unit \(\xi\), \(J_j\xi=\iota_{\xi^\sharp}\Sigma_j^*\) are orthonormal by \(J_j^T=-J_j\) and the quaternion products. For any trace-free symmetric cubic coefficient \(U\), the choice \(V_i=-\sum_j U_{ij}J_j\xi/s_j\) makes \(\langle \xi\wedge V_i,\Sigma_j^*\rangle=-U_{ij}/s_j\). Thus \(\delta\mathcal M=U\) and \(\delta Q=U\), with only positive \(s_j\) required at the specified \(Q_*\). [E02C covector inverse][e02c]

Take \(\alpha_a=\tfrac12\iota_{\partial_a}F^*\), \(A^0=\sum_a x^a\alpha_a\) and \(A=A^0+\frac16\sum_a(x^a)^3 V^a\) with \(V^a\) from (1) for \(\xi=dx^a\). The exterior derivative of \(A^0\) is \(F^*\). The exact curvature \(F_A=dA+[A\wedge A]/2\) has constant \(F^*\) and vanishing first spatial derivative at zero. Its quadratic terms are \([A^0\wedge A^0]/2+\frac12\sum_a(x^a)^2dx^a\wedge V^a\). All mixed new bracket terms are order at least four, and the exact curvature satisfies full Bianchi. Also \(A(0)=0\) and \(\partial_aA_b(0)=F^*_{ab}/2\). Since the curvature plane and volume smoothly reconstruct the metric around this positive value, \(\widehat g(0)=g_{\rm e}\) and \(\partial\widehat g(0)=\partial Q(0)=0\). The positive plane, sign and simple spectrum are open and hold on some neighborhood for the fixed finite coefficients. [E08 inherited mechanism][e08] · [E215 actual connection][e215]

To check the affine Hessian directly, \(\partial_a\partial_b F_{A^0}=[\alpha_a\wedge\alpha_b]\), with \(\alpha_{a,r}=-(s_r/2)J_rdx^a\). Pairing a wedge of ordinary one-forms \(u\wedge v\) with \(\Sigma_j^*\) gives \(\langle J_j u,v\rangle\). Hence the \(i,j\) contraction is the symmetric \(a,b\) part of
\[
 \tfrac14\sum_{r,t}\epsilon_{irt}s_rs_t
   \langle J_jJ_r dx^a,J_tdx^b\rangle.
\]
In \(J_jJ_r=-\delta_{jr}I+\sum_\ell\epsilon_{jr\ell}J_\ell\) the first term pairs antisymmetrically in \(a,b\), and the symmetric part of \(\langle J_\ell dx^a,J_tdx^b\rangle\) equals \(\delta_{\ell t}\delta_{ab}\). Contraction leaves \(d\,\delta_{ij}\delta_{ab}/(2s_i)\), using the two ordered complementary pairs when \(i=j\). Formula (1) now gives the affine \(\mathcal M\)-Hessian \(-dI\delta_{ab}/2\) and the affine \(Q\)-Hessian \(d q_*\delta_{ab}/2\). First curvature derivatives are zero, so the chain rule has no further term. The cubic adds \(U\delta_{ab}\). Writing \(B=dq_*/2+U\),
\[
 \partial_a\partial_b Q=B\delta_{ab},\qquad
 \nabla_a\nabla_b Q=B\delta_{ab}
               +\tfrac12[\operatorname{ad}(F^*_{ab}),Q_*],\qquad
 \Delta_AQ=4B
 \tag{2}
\]
at the center. The commutator comes from differentiating the internal connection. It is skew in the base indices, and the base Levi–Civita term multiplies the zero first derivative. No near-round smallness is used to evaluate this affine baseline. [E08][e08] · [E215 Hessians][e215]

## Direct flow tangent and certificate check

To evaluate the old original vector at this datum, set \(\mathcal H=q-|q|^2I/6\), distinguishing the flow weight from the cubic \(U\). Self-duality and Bianchi give
\[
 v_{i,b}=4\sum_{p,j}(D_p^A\mathcal H)_{ij}F_{j,pb}
\]
in an orthonormal old coframe, with the old inverse metric on the contracted \(p\) index in general coordinates. At zero \(D^A\mathcal H=0\), so \(v(0)=0\). Consequently \(d_Av(0)=dv(0)\). Differentiating the coefficient at zero gives
\[
 \partial_a(D_p^A\mathcal H)
   =\delta_{ap}P_{Q_*}(B)+[\operatorname{ad}(F^*_{ap}/2),\mathcal H_*].
 \tag{3}
\]
The derivative of \(P_Q\) along the first spatial derivative contributes zero. Derivatives of the metric contraction or curvature in \(v\) multiply \(D^A\mathcal H=0\). In particular the expression retains all other contributions when the metric-dependent adjoint is first reduced by self-duality and Bianchi.

The spatial part of (3) gives \(\dot F_{\rm sp}=8P_{Q_*}(B)F^*\) by antisymmetrizing \(a,b\). Its Gram derivative is \(8(P_{Q_*}(B)Q_*+Q_*P_{Q_*}(B))\), of trace zero, so \(\dot Q_{\rm sp}=4\mathscr L_{Q_*}B\).

For the commutator, write \(\eta_{j,ab}=\Sigma_{j,ab}^*\) as a skew matrix in the ordinary \(a,b\) arrangement. Then \(\eta_j=-J_j\) as matrices, so \(\eta_k\eta_j=-\delta_{kj}I-\sum_i\epsilon_{kji}\eta_i\). The internal \(i,j\) commutator coefficient in (3) is
\((\lambda_j-\lambda_i)\sum_k\epsilon_{kji} F^*_{k,ap}/2\). Therefore
\[
 \begin{aligned}
 (\partial_a v_{i,b})_{\rm comm}
 &=2\sum_{k,j,p}(\lambda_j-\lambda_i)
                       \epsilon_{kji}F^*_{k,ap}F^*_{j,pb}\\
 &=-2(d/s_i)\sum_{j\ne i}(\lambda_j-\lambda_i)\eta_{i,ab}
   =6(d/s_i)q_{*,i}\eta_{i,ab}.
 \end{aligned}
\]
It is skew in \(a,b\), so \(\dot F_{{\rm comm},i}=12(d/s_i)q_{*,i}\Sigma_i^*\). Contracting with \(F^*\) in (1) and using \(\|\Sigma_i^*\|^2=2\) gives the diagonal Gram derivative \(-24d q_*\), again of trace zero. Thus the direct affine baseline in the quotient is \(2d\mathscr L_{Q_*}q_*-24d q_*\), and the cubic adds \(4\mathscr L_{Q_*}U\). This reconstructs both the principal and full zeroth-order contributions without taking the result from E02A. [E02A comparison][e02a] · [E215 direct verifier][script]

I read the direct affine and cubic code paths. The sample \(F^*=cF_{\rm bar}\) has \(c^2=3/77\), roots in the ratio \(4,5,6\) and \(d=120c^3\). The affine curvature bracket Hessian has the factor \(c^2\), and the true quotient differential contributes one \(c\), so the affine \(Q\)-Hessian has factor \(c^3\). The code's derivative-of-weight array divides (3) by \(c\), which leaves \(c^2\) on the normalized spatial Hessian and the bare commutator formed with \(F_{\rm bar}/2\). Contraction to \(\dot F\) and the final quotient each supply one restored \(c\), giving the common \(c^3\) for the affine speed output. For either rational direction of the cubic, the realizing covector instead has factor \(c^{-1}\), which cancels the quotient's \(c\) in its spatial Hessian. The velocity and its quotient still contribute \(c^2\) together for any rational \(U\). Linearity in \(U\) at fixed lower jets justifies evaluating the rational and \(c^3\)-coefficient directions separately. The script antisymmetrizes the actual differentiated velocity before the quotient, and its expected formula is used for comparison after that computation.

As an independent exact arithmetic check, I used signed exterior volume products of form pairs and the coefficient cross product instead of the verifier's Hodge-contracted quotient and epsilon sum. It reproduced all sixteen affine Hessian slots and all four axiswise right inverse checks for each of the two directions in \(U\). With \(c^3\) stripped, the spatial and commutator quotient diagonals were respectively
\[
 (-18662400,-7776000,26438400)/65219,\qquad
 (83520,5760,-89280)/77.
\]
Their sum is \((52079040,-2897280,-49181760)/65219\), exactly the recorded affine vector. The scalar coefficients and strict native lower bound also matched. Replay of the unchanged verifier reproduced the stored JSON. The direct algebra and the independent arithmetic check supply the sign and factor verification. [Frozen verifier][script] · [Frozen certificate][cert]

## Strict maximum, native normalization and scope

Use \(U=-dq_*/2-G+10Y\). In (2), \(B=-G+10Y\). The scalar gradient vanishes because \(\partial Q(0)=0\). The scalar Hessian has no quadratic chain-rule term, and the internal commutator also pairs to zero with \(G\) since \(G\) and \(Q_*\) commute. Thus \(\nabla^2 w(0)=\langle G,B\rangle g_{\rm e}=-|G|^2g_{\rm e}\). Taylor's theorem gives \(w(x)\le w(0)-|G|^2|x|^2/4\) after shrinking the neighborhood. By further shrinking within the open positive, round-compatible, simple-spectrum class, the ordered extrema stay the indicated first and third eigenvalues. The whole small ball therefore obeys the ratio bound, strictly off its center.

The direct result \(\dot Q=4\mathscr L_{Q_*}B-24d q_*\) gives
\[
 dw_A(v)=-4(1001/108)+40(200/133)-24d(385/432)
        =\frac{82867}{3591}-\frac{385}{18}d
        >\frac{12119}{7182}>0 .
\]
The last strict comparison uses \(0<d^2=388800/456533<1\). This checks the chosen finite coefficient \(10\). In the native negative-Killing pairing \(2\delta\), curvatures in orthonormal labels have their old components multiplied by \(\sqrt2\). Numerator and volume both double, so \(Q\) and its ordering are unchanged. For \(K=1\) the native base metric is \(g=2\widehat g\) and the two-to-one form adjoint scales by \(1/2\), with the internal common factor cancelling. Thus the native geometric speed is \(v/2\), corresponding to \(\tau=2t\). The spatial scalar Hessian at the center is \(-|G|^2g/2\) in native metric units. The native scalar derivative is \(>\!12119/14364\), and multiplying by \(\rho(Q_*)=9/4\) gives the same sign for the ratio derivative. [Normalization assessment][det]

The calculation is a directional derivative of the smooth local curvature quotient at a supplied polynomial connection. Its scope is the single prescribed boundary spectrum and a strict local spatial maximum in a coordinate ball. No globally defined datum, evolved solution, closed-manifold preservation counterexample or singularity follows. The integrated stationary and gradient estimates remain separate.

## Verified frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E217 request][request] | e99e94f0b6b9fc8865e883e79032164dbde4a5ac7cf660a53e5e7fe4a3f277b6 |
| [B103][b103] | 3948c94087b7af0125c440986a4aa1c1880c6e3d7652d25dfcaf3e0d9a4d9445 |
| [E215][e215] | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E215 script][script] | 401ec6be0070d88b6d068a56679dcaca9461321e5397781c0904cb31321c3d3c |
| [E215 certificate][cert] | 9802650145d78991c086ba324125730e61a741885c7b607b73718f5fb35cd458 |
| [E215 return][r215] | a75badd53940d6843fb55db6e8396b71900c650ff9ce270d8e4976d1ff4f6ceb |
| [E08][e08] | 2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06 |
| [E02A][e02a] | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| [E152/E153 assessment][det] | 3f9d176349ec78f9d7a083769695cc50ce139b6ba0fbe0fa7b89fba7e30b81d1 |
| [E02C inherited algebra][e02c] | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E11 inherited setup][e11] | 91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7 |

No external source retrieval, broader spectral search or shared edit was used.

[request]: ../research-progress/handoffs/SP4-CME-E217_REQUEST_v1.md
[b103]: ../brainstorm/notes/B103_SPECTRAL_RATIO_MAXIMUM_TEST_20261123.md
[e215]: ../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[script]: ../numerics/e215_spectral_ratio_jet.py
[cert]: ../numerics/e215_spectral_ratio_jet.json
[r215]: ../research-progress/handoffs/SP4-CME-E215_RETURN_v1.md
[e08]: ../notes/10_SCALAR_PINCHING_JET_20261122.md
[e02a]: ../notes/04A_NONLINEAR_Q_20261122.md
[det]: E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md
[e02c]: ../notes/04C_VOLUME_AND_JETS_20261122.md
[e11]: ../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md
