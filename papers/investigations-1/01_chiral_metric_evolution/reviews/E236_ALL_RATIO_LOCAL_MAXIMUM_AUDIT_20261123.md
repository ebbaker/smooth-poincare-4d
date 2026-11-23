# E236 Independent audit of the all-ratio local maximum family

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit under B109, configured
gpt-6.2-sol/ultra. Selected lead settings and independent runtime
attestation are unavailable. I authored E215 and the antecedent E02A,
E08, E11 and E152 calculations. E217 separately audited E215. I did
not author E235. This audit recomputes the all-\(r\) scalar algebra,
the affine curvature contraction by polarization of directional
Hessians, and the original velocity by differential-form and
component identities on the actual polynomial datum.

**Pass.** For each finite \(r>1\) the prescribed connection is
positive, definite and round-compatible on a sufficiently small
oriented four-ball. Its simple spectral ratio has a strict spatial
maximum \(r\) at the center. The original directional derivative of
\(\log\rho\) there is \(1\) in the old \(K=1\) clock and \(1/2\)
in the native clock. The derivative of \(\rho\) is correspondingly
\(r\) and \(r/2\). These are statements about a smooth local datum
and the original vector field evaluated on it. No mathematical
correction to the frozen proof is required.
[E235 derivation](../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md).

## Scalar gradient and the prescribed coefficient

Fix finite \(r>1\). Let \(a=2/(1+r)\), \(b=2r/(1+r)\),
\(Q=Q_r=\operatorname{diag}(a,1,b)\), \(q=Q-I\), and
\(d=\sqrt{\det Q}=2\sqrt r/(r+1)\). Then \(a+b=2\) and
\(0<a<1<b\), so the trace is three and the extremal roots of
the characteristic polynomial are simple. Normalized eigenpair
differentiation gives \(d\lambda_i[X]=X_{ii}\) at \(Q\). For
\(f=\log\rho\) write
\[
 D_f=\operatorname{diag}(-1/a,0,1/b),\qquad
 m=\operatorname{tr}D_f/3,\qquad
 G=D_f-mI=\frac{r+1}{6r}\operatorname{diag}(-2r-1,r-1,r+2).
\]
On the trace-free symmetric tangent space \(df[X]=\langle G,X\rangle\)
in the Frobenius pairing. The diagonal entries in the last display
have squared sum \(6(r^2+r+1)\) before the common factor is squared,
so \(|G|^2=(r+1)^2(r^2+r+1)/(6r^2)>0\).
The given \(T=\operatorname{diag}(a,-2,b)\) has trace zero and
\(df[T]=-a/a+b/b=0\).

With \(P_Q(X)=X-\operatorname{tr}(QX)I/3\), the operator
\[
 \mathscr L_QX=2(QP_Q(X)+P_Q(X)Q)
             =2(QX+XQ)-\tfrac43\operatorname{tr}(QX)Q
\]
is self-adjoint by trace cyclicity and the symmetric rank-one
contraction. Its trace is zero. Since
\(\operatorname{tr}(QD_f)=0\), \(P_Q(G)=D_f\), so
\(\mathscr L_QG=\operatorname{diag}(-4,0,4)\). The required pairings
reduce to
\[
 \begin{aligned}
 df[\mathscr L_QT]&=4(b-a)=8(r-1)/(r+1),\\
 \langle G,\mathscr L_QG\rangle&=4(1/a+1/b)=2(r+1)^2/r,\\
 df[q]&=1/a-1/b=(r^2-1)/(2r).
 \end{aligned}
\]
For example, applying \(df\) directly to the diagonal
\(\mathscr L_QT\) cancels the common \(P_Q\)-scalar correction
and gives \(4(b-a)\), confirming the mixed pairing independently.
Thus \(B=-G+\mu(r)T\) has \(df[B]=-|G|^2\). The prescribed
\[
 \mu(r)=\frac{r+1}{32(r-1)}
      \left(\frac{8(r+1)^2}{r}+\frac{24(r-1)}{\sqrt r}+1\right),
 \qquad U=B-\tfrac d2 q
\]
is finite at every permitted \(r\), and \(B,U\) are symmetric
trace free. The denominators require \(r>1\), and the
reconstruction below uses only fixed-\(r\) neighborhoods.
[Prescribed family](../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md).

## Curvature Hessian and metric of the polynomial

Use \(dx^{1234}\) as the Euclidean orientation, old internal
pairing \(\delta\), and bracket \([e_i,e_j]=\epsilon_{ijk}e_k\).
The stipulated triple
\(\Sigma=(dx^{14}+dx^{23},dx^{24}+dx^{31},dx^{34}+dx^{12})\)
is self-dual with \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\rm e}\).
The map \(J_i\zeta=*(\zeta\wedge\Sigma_i)=\iota_{\zeta^\sharp}\Sigma_i\)
is skew. Its action on \(dx^1\) gives \(dx^4,-dx^3,dx^2\) for
\(i=1,2,3\), respectively. On the remaining basis covectors the
same triple gives \(J_i^2=-I\) and the ordered cyclic products
\(J_1J_2=J_3\), \(J_2J_3=J_1\), \(J_3J_1=J_2\), with opposite
sign in reverse order. In particular for an ordinary covector
\(\zeta\), \(\langle J_i\zeta,J_j\zeta\rangle=\delta_{ij}|\zeta|^2\).
Put \(s_i=\sqrt{Q_{ii}}\), so \(d=s_1s_2s_3\), and
\(F_i^*=-s_i\Sigma_i\). Its plane is the positive Euclidean
chiral plane. The map with columns \(-F_i^*/s_i=\Sigma_i\)
is oriented in the prescribed sign convention. Its old volume
\(\sum_i F_i^*\wedge F_i^*/3=2dV_{\rm e}\) gives
\(\widehat g(0)=g_{\rm e}\) when \(K=1\).

Take
\[
 \alpha_a=\tfrac12\iota_{\partial_a}F^*,\quad
 A^0=\sum_a x^a\alpha_a,\quad
 V_i^a=-\sum_j (U_{ij}/s_j)J_jdx^a,\quad
 A=A^0+\tfrac16\sum_a(x^a)^3V^a.
\]
The alternating derivative of \(A^0\) gives \(dA^0=F^*\)
and \(\partial_a A_b(0)=F^*_{ab}/2\). All coefficients are
smooth. At zero \(A=0\), \(F_A=F^*\), and \(\partial F_A=0\).
In fact the full quadratic terms are \([A^0\wedge A^0]/2\)
and \(\frac12\sum_a(x^a)^2dx^a\wedge V^a\).
The remaining brackets start at degree four. This is the actual
curvature of \(A\), so Bianchi holds. Smooth reconstruction gives
\(\partial Q(0)=\partial\widehat g(0)=0\).
[Realization conventions](../notes/04C_VOLUME_AND_JETS_20261122.md).

For the affine bracket coefficient, take a Euclidean vector \(z\)
with dual \(\zeta\), and restrict the coefficient functions to
\(x=tz\). For cyclic \(i,j,k\),
\(\tfrac12[A^0\wedge A^0]_i=A^0_j\wedge A^0_k\), since both
ordered bracket contributions agree. The second derivative in
\(t\) is \((s_js_k/2)J_j\zeta\wedge J_k\zeta\). The identity
\(\langle u\wedge v,\Sigma_\ell\rangle=\langle J_\ell u,v\rangle\)
gives its self-dual contraction
\[
 \frac{s_js_k}{2}\langle J_\ell J_j\zeta,J_k\zeta\rangle
   =\frac d{2s_i}\delta_{i\ell}|\zeta|^2.
\]
Here the identity part of \(J_\ell J_j\) pairs \(\zeta\) with
\(J_k\zeta\) and vanishes, and the chiral part contributes
\(\epsilon_{\ell jk}|\zeta|^2\). Real polarization therefore
gives \(d\,\delta_{i\ell}\delta_{ab}/(2s_i)\) in every Hessian
slot. The complementary cubic contraction in the diagonal \(aa\)
slot is
\(\langle dx^a\wedge V_i^a,\Sigma_j\rangle=-U_{ij}/s_j\)
and the mixed cubic slots vanish.

For \(\mathcal M_{ij}=F_i\wedge F_j/(2dV_{\rm e})\), the fixed
volume differential at \(F^*\) is
\[
 \delta\mathcal M_{ij}
    =-\tfrac12\big(s_j\langle\delta F_i,\Sigma_j\rangle+
                   s_i\langle\delta F_j,\Sigma_i\rangle\big).
\]
Because \(\mathcal M(F^*)=Q\) and \(\operatorname{tr}Q=3\),
the derivative of \(3\mathcal M/\operatorname{tr}\mathcal M\)
is \(\delta Q=\delta\mathcal M-Q\,\operatorname{tr}(\delta\mathcal M)/3\).
The affine contraction contributes \(-dI/2\) to each diagonal
spatial Hessian slot for \(\mathcal M\), hence \(dq/2\) for \(Q\).
The cubic contributes \(U\) to both by symmetry and trace-freeness.
First curvature derivatives vanish, so there is no second
differential of the quotient on a pair of first spatial derivatives.
Thus \(\partial_a\partial_b Q=B\delta_{ab}\).
Differentiating the internal covariant derivative gives the full
covariant Hessian
\[
 \nabla_a^A\nabla_b^AQ
      =B\delta_{ab}+\tfrac12[\operatorname{ad}(F^*_{ab}),Q].
\]
The base Christoffel term multiplies \(D^AQ(0)=0\).
The commutator is antisymmetric in \(a,b\) and has zero pairing
with \(G\) since \(GQ=QG\). In particular \(\Delta_AQ(0)=4B\).
[Earlier fixed-spectrum convention check](E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md).

## Direct differentiation of the original flow vector

Set \(\mathcal H=q_A-|q_A|^2 I/6\), \(q_A=Q_A-I\), and
\(v=-4d_A^{*\widehat g}(\mathcal H F_A)\). By
\(d_A^{*\widehat g}=-*d_A*\) on two-forms, self-duality
and \(d_AF_A=0\), this is \(v=4*((D^A\mathcal H)\wedge F_A)\).
Using the coordinate Euclidean basis \((e_p)\) at zero, its
components there satisfy
\[
 v_i(z)=4\sum_{p,j}(D^A_{e_p}\mathcal H)_{ij}F_j(e_p,z).
\]
Away from the center this formula uses the old inverse metric
on the contracted written basis slot. At zero \(D^A\mathcal H=0\),
so differentiating the inverse metric and \(F_j\) contributes zero.
Writing \(H_*=\mathcal H(0)\) and using the computed first
connection derivative,
\[
 \partial_a(D^A_p\mathcal H)(0)
     =\delta_{ap}P_Q(B)+[\operatorname{ad}(F^*_{ap}/2),H_*].
\]
The scalar differentiation subtracts
\(I\,\operatorname{tr}(qB)/3=I\,\operatorname{tr}(QB)/3\).
In the bracket term the scalar part of \(H_*\) cancels, so
its \(ij\) entry is
\(\frac12(\lambda_j-\lambda_i)\sum_k\epsilon_{kji}F^*_{k,ap}\)
with \(\lambda_i=s_i^2\).

On the affine curve of connections \(A+\sigma v\), the first
curvature derivative is \(d_Av\), which at zero equals \(dv\).
The first term of the last display gives
\(\dot F_{\rm sp}=8P_Q(B)F^*\) by alternating the two basis
slots of \(\partial v\). Its wedge derivative is
\(8(P_Q(B)Q+QP_Q(B))\), whose trace is zero because
\(\operatorname{tr}(QP_Q(B))=0\). Hence its quotient
contribution is \(4\mathscr L_Q B\).

For the bracket term use the contraction as a bilinear form on
vectors \(u,z\):
\[
 \sum_p F_k^*(u,e_p)F_j^*(e_p,z)
    =s_ks_j\langle J_jJ_k u,z\rangle .
\]
Here \(J_j\) is identified with its Euclidean vector action.
The order \(J_jJ_k\) follows by first applying \(J_k\) to \(u\)
and then expanding it in the \(e_p\)'s. When
\(\epsilon_{kji}\ne0\), this product is \(-\epsilon_{kji}J_i\)
and \(s_ks_j=d/s_i\). Thus the commutator part of
\(\partial_u v_i(z)\) is
\[
 -2(d/s_i)\sum_{j\ne i}(\lambda_j-\lambda_i)\Sigma_i(u,z)
   =6(d/s_i)(\lambda_i-1)\Sigma_i(u,z).
\]
The sum is \(3-3\lambda_i\) because the trace is three.
Antisymmetrizing doubles this skew form, so
\(\dot F_{{\rm comm},i}=12(d/s_i)(\lambda_i-1)\Sigma_i\).
Since \(F_i^*=-s_i\Sigma_i\) and \(\|\Sigma_i\|^2=2\),
the diagonal wedge derivative is
\(-s_i\langle \dot F_{{\rm comm},i},\Sigma_i\rangle
=-24d(\lambda_i-1)\). The off-diagonal entries vanish by
orthogonality. This wedge derivative already has trace zero.
The full quotient derivative is therefore
\(\dot Q=4\mathscr L_Q B-24dq\), derived from the given connection
and original velocity. The old evolution formula is unnecessary
for the reaction calculation.
[Comparison with the earlier direct calculation](E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md).

Pairing with \(df\) gives
\[
 -4\langle G,\mathscr L_QG\rangle
       +4\mu(r)\,df[\mathscr L_QT]-24d\,df[q]
   =-\frac{8(r+1)^2}{r}+\frac{32(r-1)}{r+1}\mu(r)
                      -\frac{24(r-1)}{\sqrt r}=1.
\]
The positive mixed coefficient exactly cancels the specified
terms, leaving the unit offset.

## Maximum, native conversion and scope

Write \(w(x)=f(Q_A(x))\). The first derivative vanishes at zero.
The ordinary scalar Hessian is \(df[B]\delta_{ab}=-|G|^2\delta_{ab}\).
The quadratic chain-rule term is zero since \(\partial Q(0)=0\),
and the ordinary and covariant scalar Hessians agree there.
Positivity, the round-compatible sign and simple spectrum are
open at \(F^*\). By continuity of the scalar Hessian, shrink to a
closed ball strictly within this neighborhood so that on every
radial segment the ordinary Hessian is at most
\(-|G|^2g_{\rm e}/2\). Integrating twice yields
\(w(x)\le \log r-|G|^2|x|^2/4\) throughout the ball, giving
\(\rho<r\) for every noncentral point. All neighborhood and
coefficient choices are for the fixed finite \(r\).

Compactness of that closed ball and openness of definiteness
and sign allow the smooth affine curve \(A+\sigma v\) for small
\(|\sigma|\) in the same local connection class. Differentiating
its curvature quotient evaluates the vector field on the
datum without assuming a local PDE solution. The native internal
pairing \(2\delta\) multiplies the old orthonormal curvature
components by \(\sqrt2\), doubling the wedge numerator and the
normalized volume. The quotient is unchanged. The metric is
\(g=2\widehat g\) in dimension four. The adjoint from two-forms
to one-forms gains the factor \(1/2\), since their squared
pointwise norms gain \(1/4\) and \(1/2\) relative to each other
and their pairings have the same volume and internal factors.
Thus the geometric velocity is \(v/2\) and native time satisfies
\(\tau=2t\). The native log-ratio derivative is \(1/2\), and
\(d\rho=\rho\,df\) gives the old and native ratio derivatives
\(r\) and \(r/2\). The spatial scalar Hessian is
\(-|G|^2g/2\) at the center in native units.
[Assessed old/native convention](E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md).

This defeats the local inference of a nonpositive original
direction from a scalar ratio contact and nonpositive spatial
Hessian at any of the stated thresholds. The result is pointwise
on an explicit local datum. A produced original flow, global
extension of the datum and global preservation failure would be
separate claims. The proof gives no uniform size or radius
as \(r\downarrow1\) or \(r\to\infty\). E215/E217 remains a
separate fixed \(9/4\) check.

## Verified frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [E236 request](../research-progress/handoffs/SP4-CME-E236_REQUEST_v1.md) | 2e4d110ef98c4d0246d55fdd142b25ad144aa559c08a4fb0167612e9539c94ef |
| [B109](../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 64a38e686f1a56da4916fc534a51ded2d3c729cfab046a8afeb59dc84e56eaa4 |
| [E235 proof](../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E235 return](../research-progress/handoffs/SP4-CME-E235_RETURN_v1.md) | c1e994a85760e68007b6865b929fe728e840ef95fcc6a5e59b1344e22031f357 |
| [E215/E217 assessment](E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md) | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |
| [E215 derivation](../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E217 audit](E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md) | 3803d58e487706afce63bf4ae6062b8a3c5bef79c7ced3917da2b838e6e3721d |
| [E02C](../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |

The packet uses exact symbolic verification. Only its review and
return were written.
