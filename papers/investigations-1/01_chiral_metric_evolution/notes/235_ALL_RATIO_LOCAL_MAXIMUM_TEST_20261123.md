# E235 A local spectral-ratio maximum with positive original tangent at every \(r>1\)

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation under B109, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored the inherited E02C quotient-symbol
calculation. E215 and E217 were separately authored. The old
original gradient equation, positive curvature reconstruction and
constant native scale are the assessed inputs. I derive the scalar,
cubic and differentiated velocity identities below for the prescribed
family, comparing the tangent formula with E215/E217.

## Result and scalar data

For every finite \(r>1\), the B109 polynomial local connection
in the old \(K=1\) conventions has at its center
\[
 Q_r=\operatorname{diag}(a,1,b),\qquad
 a=\frac2{1+r},\qquad b=\frac{2r}{1+r},\qquad \rho(Q_r)=r .
\]
The positive-definite round-compatible class and the simple spectrum
hold on a sufficiently small ball where the ratio is strictly below
\(r\) away from the center. At the center the directional derivative
of \(f=\log\rho\) on the actual old original velocity is \(1\).
The native directional derivative is \(1/2\).
[B109](../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md).

We have \(a+b=2\) and \(0<a<1<b\). Thus \(Q_r\) is positive,
trace three and simple. Put \(q=Q_r-I\) and
\(d=\sqrt{\det Q_r}=2\sqrt r/(r+1)\).
The ordered eigenvalues are smooth in a neighborhood of \(Q_r\)
by simplicity. Differentiating a normalized eigenpair at the
diagonal point gives \(d\lambda_i[X]=X_{ii}\). Thus on symmetric
trace-free matrices \(X\),
\[
 df[X]=-\frac{X_{11}}a+\frac{X_{33}}b
      =\langle G,X\rangle_{\rm F}.
\]
Here \(D_f=\operatorname{diag}(-1/a,0,1/b)\),
\(m=\operatorname{tr}D_f/3\) and
\[
 G=D_f-mI
   =\frac{r+1}{6r}\operatorname{diag}(-2r-1,r-1,r+2),\qquad
 |G|^2=\frac{(r+1)^2(r^2+r+1)}{6r^2}>0 .
\]
The prescribed \(T=\operatorname{diag}(a,-2,b)\) is trace free and
\(df[T]=-1+1=0\).

For \(Q=Q_r\) write
\[
 P_Q(X)=X-\tfrac13\operatorname{tr}(QX)I,\qquad
 \mathscr L_Q X=2(QP_Q(X)+P_Q(X)Q).
\]
On symmetric trace-free matrices, expansion gives the anticommutator
minus \(\tfrac43\operatorname{tr}(QX)Q\). Each term defines a
self-adjoint Frobenius map on the ambient symmetric matrices,
and the sum preserves trace zero since \(\operatorname{tr}Q=3\).
Since \(QD_f=\operatorname{diag}(-1,0,1)\), we have
\(\operatorname{tr}(QG)=-3m\) and \(P_Q(G)=D_f\). It follows that
\[
 \begin{aligned}
 \mathscr L_QG &=\operatorname{diag}(-4,0,4),\\
 df[\mathscr L_QT] &=\langle\mathscr L_QG,T\rangle
                  =4(b-a)=\frac{8(r-1)}{r+1},\\
 \langle G,\mathscr L_QG\rangle &=4(1/a+1/b)
                              =\frac{2(r+1)^2}{r},\\
 df[q] &=1/a-1/b=\frac{r^2-1}{2r}.
 \end{aligned}
\]
All these pairings are of real trace-free tensors. Choose exactly
\[
 B=-G+\mu(r)T,\qquad
 \mu(r)=\frac{r+1}{32(r-1)}
    \left(\frac{8(r+1)^2}{r}+\frac{24(r-1)}{\sqrt r}+1\right),
 \qquad U=B-\tfrac d2q .
\]
The coefficients and \(U\) are finite for each such \(r\), and
\(B,U\) are symmetric trace free. In particular \(df[B]=-|G|^2\).

## Polynomial connection and true quotient Hessian

Use the stipulated positive Euclidean metric \(g_{\rm e}\)
on an oriented real four-chart, a trivial \(SO(3)\) bundle
with old internal pairing \(\delta\), and
\([e_i,e_j]=\epsilon_{ijk}e_k\). Write
\(\Sigma=(dx^{14}+dx^{23},dx^{24}+dx^{31},dx^{34}+dx^{12})\).
The forms are self-dual with
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\rm e}\).
The operators \(J_j\xi=*(\xi\wedge\Sigma_j)=\iota_{\xi^\sharp}\Sigma_j\)
are skew and satisfy \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\).
Set \(\lambda_i=(Q_r)_{ii}\), \(s_i=\sqrt{\lambda_i}\), and
\(F_i^*=-s_i\Sigma_i\), so \(\prod_i s_i=d\). The curvature plane
at this value is the Euclidean positive plane and the sign is
round-compatible. The old density
\(\tfrac13\sum_i F_i^*\wedge F_i^*=2dV_{\rm e}\) fixes the scale,
giving \(\widehat g(0)=g_{\rm e}\) at \(K=1\).

For nearby curvature fields use the fixed chart volume to write
\[
 \mathcal M_{ij}(F)=\frac{F_i\wedge F_j}{2dV_{\rm e}},\qquad
 Q(F)=\frac{3\mathcal M(F)}{\operatorname{tr}\mathcal M(F)} .
\]
At \(F^*\) one has \(\mathcal M=Q_r\), and the exact differential is
\[
 \delta\mathcal M_{ij}
 =-\tfrac12\big(s_j\langle\delta F_i,\Sigma_j\rangle+
                s_i\langle\delta F_j,\Sigma_i\rangle\big),
 \qquad
 \delta Q=\delta\mathcal M-\tfrac13
                       \operatorname{tr}(\delta\mathcal M)Q_r .
 \tag{1}
\]
The ordinary two-form inner products use the Euclidean metric,
with \(\|\Sigma_i\|^2=2\). This is the fixed-covector quotient
calculation from E02C, evaluated at the present \(F^*\).
[E02C](04C_VOLUME_AND_JETS_20261122.md).

Put
\[
 \alpha_a=\tfrac12\iota_{\partial_a}F^*,\qquad
 A^0=\sum_{a=1}^4 x^a\alpha_a,\qquad
 V_i^a=-\sum_j U_{ij}J_jdx^a/s_j,\qquad
 A=A^0+\tfrac16\sum_{a=1}^4 (x^a)^3 V^a.
 \tag{2}
\]
The \(V^a\) are constant coefficient one-forms of the polynomial
and are distinct from the original flow velocity. Since
\(\sum_a dx^a\wedge\iota_{\partial_a}F^*=2F^*\), \(dA^0=F^*\).
The exact curvature has expansion
\[
 F_A=F^*+\tfrac12[A^0\wedge A^0]
        +\tfrac12\sum_a (x^a)^2 dx^a\wedge V^a+O_r(|x|^4).
\]
The old connection satisfies \(A(0)=0\),
\(\partial_a A_b(0)=F^*_{ab}/2\), \(F_A(0)=F^*\) and
\(\partial F_A(0)=0\). The bracket cross terms of the affine and
cubic pieces start in order four. The full curvature satisfies
Bianchi. Smooth reconstruction around the positive curvature gives
\(\partial Q(0)=\partial\widehat g(0)=0\).

The affine curvature Hessian is \([\alpha_a\wedge\alpha_b]\).
To verify its self-dual contraction, use
\(\alpha_{a,i}=-(s_i/2)J_i dx^a\) and
\(\langle u\wedge v,\Sigma_j\rangle=\langle J_j u,v\rangle\).
The contraction of its internal component \(i\) with \(\Sigma_j\)
is the symmetrized \(a,b\) part of
\[
 \tfrac14\sum_{k,\ell}\epsilon_{ik\ell}s_k s_\ell
                   \langle J_jJ_k dx^a,J_\ell dx^b\rangle .
\]
The identity term of \(J_jJ_k\) pairs antisymmetrically in \(a,b\).
The symmetrized \(\langle J_n dx^a,J_\ell dx^b\rangle\) is
\(\delta_{n\ell}\delta_{ab}\) by the quaternion relation and
skew-adjointness. The remaining coefficient is therefore
\[
 \tfrac14\sum_{k,\ell}\epsilon_{ik\ell}\epsilon_{jk\ell}
                 s_k s_\ell\,\delta_{ab}
       =\frac{d}{2s_i}\delta_{ij}\delta_{ab}.
\]
For \(i=j\) both ordered complementary pairs contribute. For
\(i\ne j\) their common epsilon products vanish. By (1), the
affine \(\mathcal M\)-Hessian is \(-dI\delta_{ab}/2\). Its trace
correction yields the affine \(Q\)-Hessian \(dq\delta_{ab}/2\).

For each fixed \(a\), the \(J_jdx^a\) are orthonormal by the same
quaternion identities. Thus
\(\langle dx^a\wedge V_i^a,\Sigma_j\rangle=
\langle V_i^a,J_jdx^a\rangle=-U_{ij}/s_j\).
The cubic term contributes \(U\delta_{ab}\) to the
\(\mathcal M\)-Hessian and, since \(\operatorname{tr}U=0\),
also to the \(Q\)-Hessian. All first curvature derivatives are
zero, so the quotient Hessian has no second differential acting
on first curvature derivatives. Consequently at the center
\[
 \partial_a\partial_b Q=B\delta_{ab},\qquad
 \nabla_a^A\nabla_b^A Q
    =B\delta_{ab}+\tfrac12[\operatorname{ad}(F^*_{ab}),Q_r],
 \qquad \Delta_AQ=4B .
 \tag{3}
\]
The displayed covariant correction is the derivative of the
internal connection in \(D_b^AQ\). The base Levi–Civita term
multiplies the zero first derivative. This correction is
antisymmetric in \(a,b\), so its metric trace vanishes. Pairing
it with \(G\) also gives zero by trace cyclicity and \([Q_r,G]=0\).
These conclusions agree with the assessed affine correction in
E215/E217, here derived at the prescribed \(Q_r\).
[E215 Hessian method](215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) ·
[E215/E217 assessment](../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md).

## Negative scalar Hessian and small ball

Let \(w(x)=f(Q_A(x))\). The first derivative at zero is zero.
The scalar chain rule and (3) give
\[
 \operatorname{Hess}w(0)=df[B]\,g_{\rm e}=-|G|^2g_{\rm e}.
\]
The quadratic chain-rule term vanishes by \(\partial Q(0)=0\).
At zero the covariant and ordinary Hessians of the scalar agree.
Continuity and the positive simple spectrum at zero give a
neighborhood where the ordered eigenvalues stay simple and the
positive planes and round-compatible sign persist. Taylor's theorem, after shrinking
inside that neighborhood, gives a radius \(R_r>0\) with
\[
 w(x)\le \log r-\frac{|G|^2}{4}|x|^2
                  \qquad (|x|\le R_r).
\]
One may choose the closed ball within the neighborhood of smooth
positive reconstruction. Thus \(\rho(Q_A(0))=r\) and
\(\rho(Q_A(x))<r\) for \(0<|x|\le R_r\). All choices here can
depend on \(r\).

## Differentiated actual velocity

Take the old original vector field
\(v=V_{\rm old}(A)=-4d_A^{*\widehat g}(\mathcal H F_A)\), where
\(\mathcal H=q_A- |q_A|^2I/6\), \(q_A=Q_A-I\). The center value
of \(q_A\) is \(q\) used above. Self-duality and Bianchi give the
actual velocity \(v=4*((D^A\mathcal H)\wedge F_A)\).
Its components at the center use
\(v_{i,b}=4\sum_{p,j}(D_p^A\mathcal H)_{ij}F_{j,pb}\),
with the inverse metric contracting the \(p\) index away from
the Euclidean center. We evaluate the geometric derivative
on the affine path \(A+\sigma v\). By openness and compactness
of the chosen closed ball, the fields remain positive definite
there for small \(\sigma\). On this path \(\dot F=d_Av\), where the dot denotes
differentiation at \(\sigma=0\). Since \(D^A Q(0)=0\), also
\(D^A\mathcal H(0)=v(0)=0\). Derivatives of the metric and
curvature in the velocity formula are multiplied by
\(D^A\mathcal H(0)\).

Using the first connection derivative in (2) and the ordinary
Hessian in (3) gives at zero
\[
 \partial_a(D_p^A\mathcal H)
   =\delta_{ap}P_{Q_r}(B)
                   +[\operatorname{ad}(F^*_{ap}/2),\mathcal H(0)] .
 \tag{4}
\]
Here differentiating the scalar correction in \(\mathcal H\)
gives \(-\operatorname{tr}(Q_r B)I/3\) in the Hessian,
because \(B\) is trace free and the first jet vanishes.
The spatial term of (4) gives \(\dot F_{\rm sp}=8P_{Q_r}(B)F^*\)
upon antisymmetrizing. Its wedge-matrix derivative is
\(8(P_{Q_r}(B)Q_r+Q_rP_{Q_r}(B))\). This has trace zero
since \(\operatorname{tr}(Q_rP_{Q_r}(B))=0\); hence
\(\dot Q_{\rm sp}=4\mathscr L_{Q_r}B\).

For the commutator term, write
\(\eta_{j,ab}=(\Sigma_j)_{ab}\) in matrix order \(a,b\).
Then \(J_j=-\eta_j\) as matrices and
\(\eta_k\eta_j=-\delta_{kj}I-\sum_\ell\epsilon_{kj\ell}\eta_\ell\).
The \(i,j\) entry of the commutator in (4) is
\((\lambda_j-\lambda_i)\sum_k\epsilon_{kji}F^*_{k,ap}/2\),
since the common scalar subtraction in \(\mathcal H(0)\) cancels
from its eigenvalue differences. Its velocity derivative is
\[
 \begin{aligned}
 (\partial_a v_{i,b})_{\rm comm}
  &=2\sum_{k,j,p}(\lambda_j-\lambda_i)\epsilon_{kji}
                            F^*_{k,ap}F^*_{j,pb}\\
  &=-2\frac d{s_i}\sum_{j\ne i}(\lambda_j-\lambda_i)\eta_{i,ab}
    =6\frac d{s_i}q_{ii}\eta_{i,ab}.
 \end{aligned}
\]
For every nonzero epsilon factor the indices \(k,j\) are
complementary to \(i\) and \(s_k s_j=d/s_i\). The last equality
uses \(\operatorname{tr}Q_r=3\). This derivative is skew in
\(a,b\), so \(\dot F_{{\rm comm},i}=12(d/s_i)q_{ii}\Sigma_i\).
In (1) its contraction is the diagonal wedge derivative
\(-24dq\), of trace zero. Because \(A(0)=v(0)=0\), there is no
bracket contribution from \(d_Av(0)\) beyond the exterior
derivative used here. We obtain
\[
 \dot Q(0)=4\mathscr L_{Q_r}B-24dq .
\]
This reproduces the assessed E215/E217 tangent identity by
direct differentiation for the present spectrum, including
the reaction from the differentiated internal connection.
[E217 direct tangent comparison](../reviews/E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md).

Pairing with \(G\) gives
\[
 \begin{aligned}
 df[\dot Q(0)]
 &=-4\langle G,\mathscr L_{Q_r}G\rangle
       +4\mu(r)\,df[\mathscr L_{Q_r}T]-24d\,df[q]\\
 &=-\frac{8(r+1)^2}{r}+\frac{32(r-1)}{r+1}\mu(r)
       -\frac{24(r-1)}{\sqrt r}=1 .
 \end{aligned}
\]
This checks the prescribed \(\mu(r)\), including the reaction
and positive unit offset.

In the native negative-Killing pairing \(2\delta\) the orthonormal
curvature components gain \(\sqrt 2\), so both wedge numerator and
volume double and the quotient is unchanged. For old \(K=1\),
the native metric is \(g=2\widehat g\). On two-forms the adjoint
to one-forms gains \(1/2\) under this metric scaling, and the
uniform internal doubling cancels in the adjoint. Hence the
native original velocity is \(v/2\), with native time \(\tau=2t\).
The native directional derivative is \(1/2\). The scalar
spatial Hessian at zero is the same tensor, written as
\(-|G|^2g/2\) in native metric units. The ratio itself has
corresponding old and native directional derivatives \(r\) and
\(r/2\). [Assessed old/native normalization](../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md).

## Scope and verified versions

This rules out a local nonpositive scalar boundary derivative
inference for the fixed B109 family at every nonround ratio.
The evaluation concerns the instantaneous direction of the
original vector field at a smooth local datum. A local PDE
solution, a closed-manifold extension, global nonpreservation,
initialization and singularity conclusions lie outside the
result. There is no uniform claim as \(r\) approaches one or
grows unboundedly. No new primary-source inspection or numerical
experiment entered the derivation.

| Artifact | SHA-256 |
| --- | --- |
| [E235 request](../research-progress/handoffs/SP4-CME-E235_REQUEST_v1.md) | efd0d4f15c737cbbbc4a15b2c09a58e03966ed63f8d5ae2a0c1cee9b63be53b0 |
| [B109](../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 64a38e686f1a56da4916fc534a51ded2d3c729cfab046a8afeb59dc84e56eaa4 |
| [E215/E217 assessment](../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md) | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |
| [E215 derivation](215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E217 audit](../reviews/E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md) | 3803d58e487706afce63bf4ae6062b8a3c5bef79c7ced3917da2b838e6e3721d |
| [E02C](04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
