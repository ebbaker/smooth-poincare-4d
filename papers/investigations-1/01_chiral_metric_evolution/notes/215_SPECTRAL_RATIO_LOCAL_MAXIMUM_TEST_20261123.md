# E215 — A local maximum test at spectral ratio \(9/4\)

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B103, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored the inherited E02A, E08, E11 and E152 calculations. Here I check the scalar and the actual cubic connection at the fixed simple-spectrum value rather than importing E11's near-round scalar hypothesis.

## Result

In an oriented Euclidean four-chart with a trivial \(SO(3)\) bundle there is a smooth local positive definite, round-compatible connection \(A\) with
\[
  Q_A(0)=Q_*=\operatorname{diag}(48,75,108)/77 .
\]
The function \(\rho(Q_A)=\lambda_{\max}(Q_A)/\lambda_{\min}(Q_A)\) is less than \(9/4\) off the center in a sufficiently small ball and equals \(9/4\) at the center. At that strict spatial maximum, the derivative of \(\log\rho\) on the actual original native flow vector is greater than \(12119/14364>0\). The datum is an explicit polynomial connection and the derivative is evaluated at that datum. The result tests only this local scalar maximum condition. [B103](../brainstorm/notes/B103_SPECTRAL_RATIO_MAXIMUM_TEST_20261123.md).

## Scalar algebra on the trace-three affine space

Write \(\lambda_i=(Q_*)_{ii}\), so \(0<\lambda_1<\lambda_2<\lambda_3\) and \(\lambda_3/\lambda_1=9/4\). Because the three roots of the characteristic polynomial at \(Q_*\) are simple and separated, the ordered eigenvalues and \(f(Q)=\log(\lambda_{\max}/\lambda_{\min})\) are smooth near \(Q_*\). For a symmetric tangent matrix \(U\), differentiation of each normalized eigenpair gives \(d\lambda_i[U]=U_{ii}\) in this eigenframe. On the trace-free tangent space \(V=\operatorname{Sym}_0(\mathbb R^3)\), with Frobenius pairing, the affine gradient is
\[
  G=\bigl(\operatorname{diag}(-1/\lambda_1,0,1/\lambda_3)\bigr)_0
       =\frac{77}{1296}\operatorname{diag}(-22,5,17).
\]
In particular \(G\ne0\). Put \(T=\operatorname{diag}(\lambda_1,-\lambda_1-\lambda_3,\lambda_3)\). Then \(T\in V\) and \(df[T]=-1+1=0\).

The actual principal map
\[
 \mathscr L_Q U=2(QU+UQ)-\tfrac43\operatorname{tr}(QU)Q
\]
preserves trace-free symmetric matrices because \(\operatorname{tr}Q=3\). The anticommutator is self-adjoint by cyclicity of the trace, and the rank-one term has symmetric matrix pairing, so \(\mathscr L_Q\) is self-adjoint on \(V\). Write \(G=D_g-mI\) with \(D_g=\operatorname{diag}(-1/\lambda_1,0,1/\lambda_3)\) and \(m=\operatorname{tr}(D_g)/3\). Then \(\operatorname{tr}(Q_*D_g)=0\) and \(Q_*D_g=\operatorname{diag}(-1,0,1)\), giving \(\mathscr L_{Q_*}G=\operatorname{diag}(-4,0,4)\). Self-adjointness yields
\[
     df[\mathscr L_{Q_*}T]
        =\langle\mathscr L_{Q_*}G,T\rangle
        =4(\lambda_3-\lambda_1)=240/77>0.
\]
Thus \(\mathscr L_{Q_*}G\) has a nonzero transverse part. Both \(G\) and its principal image are diagonal, so in the two-dimensional diagonal subspace of \(V\) the orthogonal projection is a multiple of \(T\). More explicitly,
\[
 \begin{aligned}
 Y&=\mathscr L_{Q_*}G
       -\frac{\langle G,\mathscr L_{Q_*}G\rangle}{|G|^2}G
      =\frac{\langle T,\mathscr L_{Q_*}G\rangle}{|T|^2}T
      =\frac{10}{133}\operatorname{diag}(4,-13,9),\\
 |Y|^2&=\frac{200}{133}=\langle G,\mathscr L_{Q_*}Y\rangle,\qquad
 |G|^2=\frac{788557}{279936},\\
 \langle G,\mathscr L_{Q_*}G\rangle&=\frac{1001}{108},\qquad
 \langle G,q_*\rangle=\frac{385}{432},\qquad q_*=Q_*-I .
 \end{aligned}
\]
The identity for the mixed \(G,Y\) pairing follows from the self-adjoint map and orthogonal projection. The last pairing is \(-\operatorname{tr}D_g\), since \(q_*\in V\) and \(\operatorname{tr}(Q_*D_g)=0\). [E02A exact operator](04A_NONLINEAR_Q_20261122.md).

## Curvature right inverse without a near-round restriction

Use the older calibration \(K=1\), pairing \(\delta\), internal bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), and fixed oriented coframe \(dx^1,\ldots,dx^4\) with Euclidean metric \(g_{\rm e}\). Choose the normalized self-dual triple
\[
 \Sigma_1^*=dx^{14}+dx^{23},\qquad
 \Sigma_2^*=dx^{24}+dx^{31},\qquad
 \Sigma_3^*=dx^{34}+dx^{12}.
\]
Let \(J_j\xi=\iota_{\xi^\sharp}\Sigma_j^*=*_{g_{\rm e}}(\xi\wedge\Sigma_j^*)\). Then \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\) and \(J_i^T=-J_i\). Put \(s_i=\sqrt{\lambda_i}>0\), \(d=s_1s_2s_3=\sqrt{\det Q_*}\), and \(F_i^*=-s_i\Sigma_i^*\). The curvature plane equals the Euclidean positive plane with the round-compatible sign, and its old quotient density is \(2dV_{g_{\rm e}}\), so the reconstructed metric at this curvature is \(g_{\rm e}\). In the fixed chart let
\[
 \mathcal M_{ij}(F)=\frac{F_i\wedge F_j}{2dV_{g_{\rm e}}},\qquad
 Q(F)=\frac{3\mathcal M(F)}{\operatorname{tr}\mathcal M(F)}.
\]
At \(F^*\), \(\mathcal M(F^*)=Q_*\) has trace three. The ordinary form pairing in \(g_{\rm e}\) gives the exact differential
\[
 \delta\mathcal M_{ij}=-\tfrac12\bigl(
       s_j\langle\delta F_i,\Sigma_j^*\rangle
      +s_i\langle\delta F_j,\Sigma_i^*\rangle\bigr),
 \qquad
 \delta Q=\delta\mathcal M-\tfrac13\operatorname{tr}(\delta\mathcal M)Q_* .
 \tag{1}
\]
For a unit covector \(\xi\), the three \(J_j\xi\) are orthonormal. For any \(H\in V\), set \(V_i=-\sum_j(H_{ij}/s_j)J_j\xi\) and \(\delta F_i=\xi\wedge V_i\). The pairing \(\langle\xi\wedge V_i,\Sigma_j^*\rangle=\langle V_i,J_j\xi\rangle\) gives \(\delta\mathcal M=H\), and trace-freeness gives \(\delta Q=H\). This argument uses only positivity of each \(s_i\), symmetry and trace three. No closeness condition enters either (1) or this inverse. [E02C fixed-covector symbol](04C_VOLUME_AND_JETS_20261122.md).

## Actual connection, affine baseline and first jets

Let \(p=0\) and take the smooth polynomial connection
\[
 \alpha_a=\tfrac12\iota_{\partial_a}F^*,\qquad
 A^0=\sum_a x^a\alpha_a,\qquad
 A=A^0+\tfrac16\sum_a(x^a)^3 V^a,\qquad
 V_i^a=-\sum_j(H_{ij}/s_j)J_jdx^a .
 \tag{2}
\]
Here \(H\) is a constant symmetric trace-free matrix to be chosen. The exterior derivative \(dA^0=F^*\) follows from \(\sum_a dx^a\wedge\iota_{\partial_a}F^*=2F^*\). Its full curvature is
\[
 F_A=dA+\tfrac12[A\wedge A]
     =F^*+\tfrac12[A^0\wedge A^0]
           +\tfrac12\sum_a (x^a)^2 dx^a\wedge V^a+O_H(|x|^4).
\]
Thus \(A(p)=0\), \(\partial_a A_b(p)=F^*_{ab}/2\), \(F_A(p)=F^*\), and \(\partial F_A(p)=0\). The cubic terms leave all of these lower jets fixed. The Bianchi identity \(d_A F_A=0\) holds for the exact curvature \(F_A\), including its higher terms. Smooth reconstruction is valid on the open positive definite sign class about \(F^*\). It gives \(\widehat g(p)=g_{\rm e}\), and \(\partial\widehat g(p)=\partial Q(p)=0\) by \(\partial F_A(p)=0\). For every finite \(H\), that class holds on a sufficiently small ball. The required neighborhood is local in curvature values about \(F^*\) and may shrink with the cubic coefficients. This works with the specified non-near-round \(Q_*\) because the center triple spans the Euclidean positive plane and has positive wedge Gram. [E08 cubic curvature calculation](10_SCALAR_PINCHING_JET_20261122.md).

The affine curvature bracket has Hessian \([\alpha_a\wedge\alpha_b]\). With \(\alpha_{a,r}=-(s_r/2)J_rdx^a\), its self-dual contraction is the symmetric \(a,b\) part of
\[
 \tfrac14\sum_{r,t}\epsilon_{irt}s_rs_t
                        \langle J_jJ_r dx^a,J_t dx^b\rangle .
\]
The \(-\delta_{jr}I\) term in \(J_jJ_r\) pairs antisymmetrically in \(a,b\), and the symmetric part of \(\langle J_\ell dx^a,J_t dx^b\rangle\) is \(\delta_{\ell t}\delta_{ab}\). The contraction therefore equals \(\tfrac14\sum_{r,t}\epsilon_{irt}\epsilon_{jrt}s_rs_t\,\delta_{ab}=(d/(2s_i))\delta_{ij}\delta_{ab}\). The factor two comes from the two ordered complementary pairs. Consequently the affine \(\partial_a\partial_b\mathcal M\) is \(-\tfrac d2 I\delta_{ab}\). Its trace correction in (1) changes the affine \(\partial_a\partial_bQ\) to \(\tfrac d2 q_*\delta_{ab}\). This is an identity for arbitrary positive \(s_i\) with \(\sum_i s_i^2=3\). Because \(\partial F_A(p)=0\), there is no second derivative of the quotient paired with first curvature derivatives.

The cubic addition in each diagonal \(aa\) Hessian slot gives \(H\) by (1), and the off-diagonal cubic slots vanish. Therefore
\[
 \begin{aligned}
 \partial_a\partial_b Q(p)
   &=\delta_{ab}(\tfrac d2 q_*+H),\\
 \nabla_a\nabla_b Q(p)
   &=\delta_{ab}(\tfrac d2 q_*+H)+
                \tfrac12[\operatorname{ad}(F^*_{ab}),Q_*],\\
 \Delta_A Q(p)&=2d q_*+4H.
 \end{aligned}
 \tag{3}
\]
The additional term in the covariant Hessian is the differentiated internal connection. It is skew in the base indices so it has zero contraction. The Levi–Civita coefficient multiplies the zero first derivative. These identities justify the use of the earlier jet mechanism at \(Q_*\): the positivity and local openness, direct quotient contraction and affine bracket have been checked before choosing \(H\), without the earlier small-parameter range. [E11 inherited jet formula](13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md).

## Strict maximum and exact original derivative

Set \(H=-dq_*/2-G+10Y\), so the requested finite \(L\) is \(10\). The scalar \(w(x)=f(Q_A(x))\) has zero first derivative at \(p\), and its spatial Hessian is the pairing of \(G\) with (3)'s coordinate Hessian, since \(\partial Q(p)=0\). This gives
\[
          \nabla^2 w(p)=-|G|^2 g_{\rm e}=-\frac{788557}{279936}g_{\rm e}.
\]
The covariant correction also pairs to zero with \(G\) since \([Q_*,G]=0\). The negative Hessian, Taylor's theorem, and \(w(p)=\log(9/4)\) show that the entire sufficiently small definite, simple-spectrum ball has \(w\le\log(9/4)\), strictly away from the center. Thus the eigenvalue ratio itself has the asserted strict local maximum.

In the older clock the actual vector is \(v=-4d_A^{*\widehat g}\bigl[(q-|q|^2I/6)F_A\bigr]\). All first-derivative terms in E02A vanish at \(p\), so by (3) the original flow-direction derivative of the matrix is
\[
                   Q_t(p)=2d\mathscr L_{Q_*}q_*-24d q_*+4\mathscr L_{Q_*}H .
 \tag{4}
\]
Here \(2d\mathscr L_{Q_*}q_*\) is the affine Hessian contribution and \(-24d q_*\) is the full curvature reaction, including the internal curvature commutator. The latter remains after the affine Hessian cancellation by \(H\). In particular the cubic addition changes only the final term in (4). Pairing with \(G\) at the chosen \(H\) gives the exact older derivative
\[
 \begin{aligned}
 \left.dw_A(v)\right|_p
   &=-4\langle G,\mathscr L_{Q_*}G\rangle
         -24d\langle G,q_*\rangle+40|Y|^2\\
   &=\frac{8000}{133}-\frac{1001}{27}-\frac{385}{18}d
      >\frac{12119}{7182}>0 .
 \end{aligned}
\]
Indeed \(\det Q_*=388800/456533<1\), so \(0<d<1\), and \(\langle G,q_*\rangle>0\). This is a directional derivative on the open set of local definite data, evaluated using the actual unadjusted vector field. [E02A full evolution](04A_NONLINEAR_Q_20261122.md).

## Native normalization and direct check

The native negative-Killing internal metric is \(2\delta\), so both the wedge numerator and the density double and \(Q\) is unchanged. At \(K=1\), the native reconstructed metric is \(g=2\widehat g\) and the native time is \(\tau=2t\). The two-form formal adjoint under this constant base rescaling gains a factor \(1/2\), and the constant internal scale cancels in the adjoint. Consequently the native derivative of \(w\) is half the value above, with strict lower bound \(12119/14364\). The spatial Hessian becomes \(-|G|^2 g/2\) at \(p\) as a metric multiple, and the sign for \(\rho=e^w\) follows from its positive derivative as a function of \(w\). [Assessed E152 scale comparison](../reviews/E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md).

The [exact verifier](../numerics/e215_spectral_ratio_jet.py) also computes the affine baseline directly from \(v_i=4\sum_j J_{F_j}(D^A(q-|q|^2I/6))_{ij}\) and \(\dot F=d_A v\). At the center the weight's first covariant derivative vanishes. Its differentiated derivative retains the connection commutator \([\operatorname{ad}(\partial_a A_b),q-|q|^2I/6]\). The checker keeps it and recovers the first two terms of (4) without taking them from (4) as input. To use only rationals it writes \(s_i=c(4,5,6)_i\), \(c^2=3/77\), \(d=120c^3\), keeps the common \(c^3\) factor of the affine answer, and tests the rational and \(c^3\)-coefficient cubic directions separately. All sixteen coordinate affine slots and both cubic directions along all four axes check exactly. Python 3.10.0 reproduced the [certificate JSON](../numerics/e215_spectral_ratio_jet.json) byte for byte. From the investigation directory use

```sh
python3 -B numerics/e215_spectral_ratio_jet.py > numerics/e215_spectral_ratio_jet.json
```

The local datum and the unadjusted vector evaluation contradict a nonpositive local scalar derivative inference at this spectral-ratio boundary. They do not provide a closed-manifold datum, a global maximum argument, an evolved solution, global failure of preservation or a singularity. The integral stationary and gradient estimates under a supplied ratio bound are separate. No new source or spectral-family search entered.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E215 request](../research-progress/handoffs/SP4-CME-E215_REQUEST_v1.md) | aafcb474470caeb6153662945a3161c1ad63ca7158d979c2d84092ccbd6088ad |
| [B103](../brainstorm/notes/B103_SPECTRAL_RATIO_MAXIMUM_TEST_20261123.md) | 3948c94087b7af0125c440986a4aa1c1880c6e3d7652d25dfcaf3e0d9a4d9445 |
| [E11](13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md) | 91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7 |
| [E08](10_SCALAR_PINCHING_JET_20261122.md) | 2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06 |
| [E02C](04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E02A](04A_NONLINEAR_Q_20261122.md) | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| [E152](152_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md) | d860eb8260834bd65283e727a3574c8580a4b7890bfc1b9d87075fd82672e5d4 |
| [E152/E153 assessment](../reviews/E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md) | 3f9d176349ec78f9d7a083769695cc50ce139b6ba0fbe0fa7b89fba7e30b81d1 |
| [E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E215 script](../numerics/e215_spectral_ratio_jet.py) | 401ec6be0070d88b6d068a56679dcaca9461321e5397781c0904cb31321c3d3c |
| [E215 certificate](../numerics/e215_spectral_ratio_jet.json) | 9802650145d78991c086ba324125730e61a741885c7b607b73718f5fb35cd458 |

The [E215 return](../research-progress/handoffs/SP4-CME-E215_RETURN_v1.md) records the derivation hash and scoped outcome.
