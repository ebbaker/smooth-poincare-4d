# SP4-CME-E02A nonlinear curvature-defect evolution

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual model and effort were unavailable. See the
[frozen request](../research-progress/handoffs/SP4-CME-E02A_REQUEST_v1.md),
[B01 decision](../brainstorm/notes/B01_NONLINEAR_Q_DECISION_20261122.md),
and [return and input identities](../research-progress/handoffs/SP4-CME-E02A_RETURN_v1.md).

## Setup and equation

Let \(M\) be a smooth oriented real four-manifold and \(E\to M\) an
oriented Euclidean rank-three bundle. Use a smooth path of definite
\(SO(3)\) connections \(A(t)\) on its open interval of definiteness,
with positive curvature planes and round-compatible curvature-map sign.
Use a fixed internal frame and base identification in time. Denote by
\(\nabla\) the combined \(A\) and instantaneous reconstructed
Riemannian Levi–Civita derivative, with its induced action on each
tensor bundle. The internal metric is \(\delta_{ij}
=-2\operatorname{tr}_{\mathbb C^2}(T_iT_j)\) and
\([e_i,e_j]=\epsilon_{ijk}e_k\). The manuscript normalization is
\[
 F=-KS\Sigma,\quad S=Q^{1/2},\quad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\quad
 F_i\wedge F_j=Q_{ij}\mu,\quad
 \mu=2K^2dV_{\widehat g},\quad Q>0,\quad\operatorname{tr}Q=3
\]
with fixed \(K>0\). Frame computations below are performed at a point
in an oriented \(\widehat g\)-orthonormal coframe with \(\Sigma_i\)
given by the round-compatible self-dual symbols \(\eta_{i,ab}\).
They patch as tensor identities. Use the index order
\(F_i=\tfrac12F_{i,ab}e^a\wedge e^b\), with repeated indices summed.

Write \(q=Q-I\), \(H=q-|q|^2I/6\),
\(X_a=\nabla_a Q\), \(C_a=\nabla_a H=X_a-\operatorname{tr}(QX_a)I/3\),
and \(\Delta_A Q=\nabla^a\nabla_a Q\). Set
\[
 b=A-\Gamma^+_A,\qquad B_c=\operatorname{ad}(b_c),\qquad
 \Xi_c=2[\nabla_c S,S]+4S B_c S .
\]
Here \([X,Y]=XY-YX\) for matrices, so \(\Xi_c\) is skew. Define on
trace-free symmetric endomorphisms
\[
 \mathscr L_Q(T)=2(QT+TQ)-\frac43\operatorname{tr}(QT)Q.
\]
On the smooth definite interval, the unadjusted flow gives
\[
 \boxed{
 \begin{aligned}
 Q_t={}&\mathscr L_Q(\Delta_A Q)
        -24K\sqrt{\det Q}\,(Q-I) \\
     &+4\sum_c X_c^2-\frac43\sum_c\operatorname{tr}(QX_c)X_c
        -\frac43|\nabla Q|^2 Q+\sum_c[X_c,\Xi_c],\\
 \mu_t={}&0,\qquad \operatorname{tr}_{\widehat g}\widehat g_t=0 .
 \end{aligned} }
 \tag{1}
\]
All terms are evaluated in the reconstructed metric. The Laplacian
convention is \(\Delta_A=-\nabla_A^*\nabla_A\) on endomorphisms.
This is a local identity wherever a smooth solution is definite.
The fixed density statement also holds on a noncompact base, and
closedness gives the finite global volume consequence used in the
manuscript. Internal gauge rotations preserve \(\mu\). In a
moving base identification its expression includes the corresponding
Lie derivative.

## From the flow to the wedge quotient

In the manuscript's own time, the negative gradient is
\(v=-4d_A^{*\widehat g}(HF)\). Self-duality and Bianchi give
\(\nabla^aF_{j,ab}=0\). Thus \(v_{i,b}=4(C^c)_{ik}F_{k,cb}\).
This is Fine's Proposition 4.2 in the manuscript's fixed metric and
internal norm. Proposition 4.5 computes the linearized principal
operator on connection variations, whereas (1) concerns the
curvature-derived endomorphism \(Q\) with instantaneous covariant
coefficients. Its dependence on \(C=\nabla H\) uses the same
Bianchi reduction and variation of the endomorphism in the flow
functional. [Fine v2, Proposition 4.2, equation (4.1), Proposition 4.5 and equations (4.5)–(4.7)](https://arxiv.org/html/1111.5005v2).

Since the reconstructed tangent connection is torsion-free,
\(F_{t,i,ab}=\nabla_a v_{i,b}-\nabla_b v_{i,a}\) at each time.
The cyclic Bianchi identity
\(\nabla_aF_{k,cb}-\nabla_bF_{k,ca}=\nabla_c F_{k,ab}\) then yields
\[
 F_{t,i,ab}
  =4\bigl((\nabla_a C^c)_{ik}F_{k,cb}
     -(\nabla_b C^c)_{ik}F_{k,ca}
     +C^c_{ik}\nabla_cF_{k,ab}\bigr).
 \tag{2}
\]
Set \(Z_{ij}=F_{t,i}\wedge F_j/\mu\). Using \(*F_j=F_j\), the
ordinary two-form inner product and the volume ratio,
\[
 Z_{ij}=\frac1{4K^2}F_{t,i,ab}F_{j,ab}
 =\frac2{K^2}(\nabla_a C^c)_{ik} F_{k,cb}F_{j,ab}
   +\frac1{K^2}C^c_{ik}(\nabla_cF_{k,ab})F_{j,ab}.
 \tag{3}
\]
The symbols satisfy
\(\eta_{r,ab}\eta_{s,cb}=\delta_{rs}\delta_{ac}
+\epsilon_{rst}\eta_{t,ac}\) and
\(\eta_{r,ab}\eta_{s,ab}=4\delta_{rs}\). Define
\[
 \Omega_{jk,ac}=S_{jr}S_{ks}\epsilon_{rst}\eta_{t,ac},\qquad
 Y_{kj,c}=K^{-2}(\nabla_cF_{k,ab})F_{j,ab}.
\]
The product \(K^{-2}F_{j,ab}F_{k,cb}=Q_{jk}\delta_{ac}+
\Omega_{jk,ac}\) has \(\Omega\) skew in \(j,k\) and in \(a,c\).
Consequently (3) is
\[
 Z_{ij}
 =2((\nabla^a C_a)Q)_{ij}+
  \Omega_{jk,ac}([\nabla_a,\nabla_c]H)_{ik}
    +(C^cY_c)_{ij}.
 \tag{4}
\]
The antisymmetric derivative of \(\nabla C=\nabla^2 H\) gives
the indicated curvature action on \(\operatorname{End}E\).
The torsion-free tangent connection cancels in the antisymmetrization
of the Hessian of a zero-form valued in \(\operatorname{End}E\).

Since \(\Sigma\) is parallel for the joint connection using
\(\Gamma^+_A\), its joint derivative using \(A\) is
\(\nabla_c\Sigma=B_c\Sigma\). Therefore
\[
 \nabla_c F=-K\big((\nabla_c S)\Sigma+S B_c\Sigma\big),\qquad
 Y_c=4((\nabla_c S)S+S B_c S)=2X_c+\Xi_c .
 \tag{5}
\]
The identity \(Y_c+Y_c^T=4X_c\) also follows by differentiating the
two-form inner product of the \(F_i\). Equation (5) keeps the full
spatial connection mismatch. In particular \(B_c\) depends on
horizontal derivatives through
\(d_A\Sigma=-[S^{-1}(\nabla S)]\wedge\Sigma\) and the algebraic
compatibility inverse. [E01A compatibility calculation](../reviews/E01A_AUDIT_20261122.md).

## Trace, principal, quadratic and curvature terms

The quotient identity gives
\(Q_t=Z+Z^T-(2/3)\operatorname{tr}Z\,Q\) and
\(\mu_t/\mu=(2/3)\operatorname{tr}Z\).
Here \(\operatorname{tr}(QC_c)=0\), so
\[
 \operatorname{tr}(Q\nabla^a C_a)=-\operatorname{tr}(X^a C_a)
                               =-|\nabla Q|^2 .
\]
Equivalently,
\(\nabla^a C_a=\Delta_A Q
-\tfrac13\operatorname{tr}(Q\Delta_A Q)I-\tfrac13|\nabla Q|^2I\).
The first trace in (4) thus has no Hessian and is \(-2|\nabla Q|^2\).
The commutator \([\nabla_a,\nabla_c]H\) is symmetric in its internal
indices since the connection acts on a symmetric endomorphism.
Hence its trace contraction with \(\Omega\) vanishes. The last trace
is \(\sum_c\operatorname{tr}(C^c Y_c)=2|\nabla Q|^2\) by (5) and
symmetry of \(C_c\). This proves \(\operatorname{tr}Z=0\).

Independently, Bianchi gives
\(\mu_t=(2/3)d\sum_i v_i\wedge F_i\). At every definite connection
the flow vector has
\[
 \sum_i v_i\wedge F_i
 =2\sum_{c,i,k}(C^c)_{ik}\,
       \iota_{e_c}(F_k\wedge F_i)
 =2\sum_c\operatorname{tr}(C^c Q)\,\iota_{e_c}\mu=0.
 \tag{6}
\]
The first equality uses symmetry in \(i,k\) and the derivation rule
for interior multiplication on the wedge of two two-forms.
This directly verifies the pointwise volume law, including at
nonperfect connections. The formula for an arbitrary connection
path in E01 still allows a varying volume density.

Write \(P_Q(T)=T-\operatorname{tr}(QT)I/3\). Symmetrizing
\(2P_Q(\Delta_A Q)Q\) as \(Z+Z^T\) gives exactly the B01
candidate \(\mathscr L_Q(\Delta_A Q)\). The remaining
\(-|\nabla Q|^2I/3\) part of \(\nabla^a C_a\) contributes
\(-4|\nabla Q|^2Q/3\). Also (5) gives
\[
 C^cY_c+Y_c^T C^c
   = 4X_c^2-\frac43\operatorname{tr}(QX_c)X_c+[X_c,\Xi_c]
\]
for each \(c\) in the chosen orthonormal frame. This gives
all first-derivative products in (1).

For the curvature term let \(D_m=\operatorname{ad}(e_m)\),
\((D_m)_{ik}=\epsilon_{imk}\). The induced curvature acts by
\[
 [\nabla_a,\nabla_c]H=[\operatorname{ad}F_{ac},Q]
     =-KS_{mu}\eta_{u,ac}[D_m,Q].
\]
Contracting the two \(\eta\)'s and using the three factors of \(S\),
\[
 \Omega_{jk,ac}([\nabla_a,\nabla_c]H)_{ik}
  =-4K\,\det S\,\epsilon_{jkm}([D_m,Q])_{ik}.
\]
Indeed \(S_{jr}S_{ks}S_{mt}\epsilon_{rst}=\det S\,\epsilon_{jkm}\).
The two parts of \([D_m,Q]_{ik}=\epsilon_{im\ell}Q_{\ell k}
+\epsilon_{km\ell}Q_{i\ell}\) contract respectively to
\(Q_{ji}-\delta_{ij}\operatorname{tr}Q\) and \(2Q_{ij}\).
Thus the curvature term of \(Z\) is
\(-12K\det S (Q-I)\), symmetric and trace-free, giving
\(-24K\sqrt{\det Q}(Q-I)\) in (1). On a minimum eigendirection
the reaction is \(24K\sqrt{\det Q}(1-m)\ge0\), with \(m\le1\)
by the trace constraint. Its coefficient tends to zero at the
boundary.

## Ellipticity, round check and limits of the identity

Use the Frobenius pairing on matrices and the reconstructed metric
on covector indices. Let \(m=\lambda_{\min}(Q)>0\),
\(M_*=\lambda_{\max}(Q)\le3\). The operator \(\mathscr L_Q\)
maps symmetric trace-free tensors to themselves and is self-adjoint
there. For \(T\) in this space and \(u=\operatorname{tr}(QT)/3\),
\[
 \langle T,\mathscr L_Q(T)\rangle
   =4\operatorname{tr}(QT^2)-\tfrac43(\operatorname{tr}(QT))^2
   =4\operatorname{tr}(Q(T-uI)^2),\qquad
 4m|T|^2\le\langle T,\mathscr L_Q(T)\rangle\le4M_*|T|^2 .
\]
The spatial principal symbol in the \(Q\) Hessian is
\(-|\xi|_{\widehat g}^2\mathscr L_Q\) using the Fourier derivative
convention. For the projector \(P\) onto a line in the minimum eigenspace,
\(T=I-3P\) gives Rayleigh quotient \(2m(3-m)\), which tends
to zero at the boundary. At a point where a simple eigenvalue
\(\lambda_i\) is evaluated in a \(Q\)-eigenframe,
\((\mathscr L_Q(T))_{ii}=4\lambda_i(T_{ii}-\operatorname{tr}(QT)/3)\).
This includes the weighted trace of the Hessian of the other
components. The positive quadratic form alone does not give an
independent scalar equation for the smallest eigenvalue.

The Sylvester equation \(S\nabla_c S+(\nabla_c S)S=X_c\)
gives \(|\nabla S|\le|\nabla Q|/(2\sqrt m)\).
For the compatibility three-form, the wedge followed by Hodge
star replaces wedge with \(\Sigma_j\) by an isometry on
one-forms. Cauchy–Schwarz over three values of \(j\), and the
compatibility inverse, give
\[
 |b|\le |d_A\Sigma|\le\sqrt3\,|S^{-1}(\nabla S)|
           \le\frac{\sqrt3}{2m}|\nabla Q|.
\]
With the Frobenius norm \(|\operatorname{ad}(b_c)|=\sqrt2|b_c|\),
\[
 |\Xi|\le 2\Bigl(\sqrt{\frac{M_*}{m}}+
                      \frac{\sqrt6\,M_*}{m}\Bigr)|\nabla Q|.
\]
The complete first-derivative remainder in (1) has norm at most
\[
 \left[4+\tfrac43(|q|+|Q|)
         +4\Bigl(\sqrt{M_*/m}+\frac{\sqrt6\,M_*}{m}\Bigr)\right]
             |\nabla Q|^2 .
\]
All these estimates are pointwise, in the instantaneous metric.

At round \(Q=I+\varepsilon q_1+O(\varepsilon^2)\) in a smooth
variation has \(\operatorname{tr}q_1=0\).
Then \(\mathscr L_I=4I\) on trace-free matrices,
\(\sqrt{\det Q}=1+O(\varepsilon^2)\), and the first-derivative
remainder is \(O(\varepsilon^2)\). The connection and metric
variations inside \(\Delta_A\) multiply derivatives of the
identity, which vanish for every \(A\) and \(\widehat g\).
Thus, writing \(L_E=\nabla_{A_0}^*\nabla_{A_0}\),
\[
 (q_1)_t=-4(L_E+6K)q_1 .
\]
At the perfect round field itself all terms vanish. The trace of
(1) is zero since its principal and curvature terms are
trace-free, \(\operatorname{tr}X_c=0\) and
\(\operatorname{tr}(4\sum_cX_c^2)=4|\nabla Q|^2\) cancels the
\(-4|\nabla Q|^2Q/3\) term. This and the independent source
calculation (6) verify the nonlinear trace normalization as well
as its round specialization.

The fixed density determines the volume form from the initial
connection in this base identification. It supplies neither a
bound on the reconstructed metric relative to a reference metric
nor a bound on its spatial derivatives. Equation (1) uses the
metric in its principal symbol and contractions, the adapted
chiral form identification in \(b\), and \(A\) in its bundle
derivatives. The pointwise formula for \(b\) explains its
dependence on horizontal first derivatives of \(Q\) but still
uses the adapted geometry. A continuation estimate requires
noncircular control of \(m\), the geometric coefficients and
enough derivatives to control the evolution. These are open
estimate dependencies for the lead's later B03 selection.
