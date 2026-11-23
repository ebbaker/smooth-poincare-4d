# SP4-CME-E35 — Scalar curvature and Yamabe positivity from critical strain

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite scalar calculation follows [B28][decision] and the
[frozen request][request]. Input identities are in the [return][return].

Let \(M\) be a smooth closed oriented real four-manifold with
a supplied smooth round-positive definite \(\mathrm{SO}(3)\)
connection \(A\) on an oriented Euclidean rank-three bundle \(E\).
Use the internal pairing
\(\delta_{ij}=-2\operatorname{tr}_{SU(2)}(e_i e_j)\), with
\([e_i,e_j]=\epsilon_{ijk}e_k\). Fix \(K>0\) and write
\[
F_A=-KS\Sigma,\qquad S=Q^{1/2},\qquad Q>0,\qquad
\operatorname{tr}Q=3,\qquad
\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_g,\qquad
dV_g=\mu/(2K^2).
\]
Here \(g=\widehat g_A\) is the smooth reconstructed Riemannian
metric and the \(\Sigma_i\) are self-dual.
Transport the chiral Levi–Civita connection to \(E\) by
\(\Sigma/\sqrt2\) and denote it by \(\Gamma\).
Put \(b=A-\Gamma\) and
\[
T_X=\tfrac12(S^{-1}(\nabla_X^A Q)S^{-1})_0 .
\]
The subscript \(0\) denotes internal trace-free projection.
All base contractions use \(g\), endomorphisms use their
Frobenius norm, and the ordinary two-form norm counts each
unordered pair of base indices once.

If the supplied scalar Sobolev constant \(C_S>0\) satisfies
\[
\|u\|_4^2\leq C_S\left(\int_M |du|^2\,dV_g
                               +K\int_M u^2\,dV_g\right),
\]
then the estimate is
\[
\boxed{Y(M,[g])\geq \frac3{C_S}
              -(48+24\sqrt3)\|T\|_4^2.}
\]
In particular \(\|T\|_4^2<((16+8\sqrt3)C_S)^{-1}\)
is sufficient for positive Yamabe constant. Positivity
of \(Q\) is used to define the reconstruction and strain.
No quantitative lower bound on its eigenvalues or
smallness of \(Q-I\) enters the estimate.

## Exact scalar trace and divergence

For adjoint-valued one-forms use
\(\bigl([b\wedge b]\bigr)_{ab}=2[b_a,b_b]\).
The curvature of \(\Gamma=A-b\) is
\[
F_\Gamma=F_A-d_A b+\tfrac12[b\wedge b]
        =F_A-d_\Gamma b-\tfrac12[b\wedge b].
\]
The last equality uses \(d_A b=d_\Gamma b+[b\wedge b]\).
The chiral block of \(F_\Gamma\) is
\(-(W^++sI/12)\Sigma\), where \(s\) is the scalar curvature
of \(g\). Its anti-self-dual two-form block is orthogonal
to \(\Sigma\). Since
\(\langle\Sigma_i,\Sigma_j\rangle=2\delta_{ij}\) and \(W^+\)
is trace-free, one gets
\[
\langle F_\Gamma,\Sigma\rangle_E
=\sum_i\langle (F_\Gamma)_i,\Sigma_i\rangle
=-2\operatorname{tr}(W^++sI/12)=-s/2.
\]
Likewise \(\langle F_A,\Sigma\rangle_E=-2K\operatorname{tr}S\).
[E09 chiral curvature convention and difference identity][curvature].

Use \(\nabla^\Gamma\) for the joint \(\Gamma\) and base
Levi–Civita derivative. The tautological \(\Sigma\) is parallel.
Define the vector field \(V\) by \(V^a=\sum_i\Sigma_i^{ab}b_{ib}\).
Since \(\Sigma_i^{ab}\) is antisymmetric, the two-form pairing gives
\[
\langle d_\Gamma b,\Sigma\rangle_E
=\tfrac12\sum_i\Sigma_i^{ab}
      \bigl((\nabla^\Gamma_a b)_{ib}-(\nabla^\Gamma_b b)_{ia}\bigr)
=\sum_i\Sigma_i^{ab}(\nabla^\Gamma_a b)_{ib}
=\operatorname{div}_g V .
\]
Thus the exact identity is
\[
\boxed{s=4K\operatorname{tr}S
           +2\operatorname{div}_g V
           +\langle[b\wedge b],\Sigma\rangle_E.}
\]
Both contractions are invariant under simultaneous rotation
of the internal frames of \(b\) and \(\Sigma\). The displayed
coordinate expression for \(V\) uses only raising with \(g\)
and those contractions, so the vector field is global.
In the round case \(S=I\) and \(b=0\), giving \(s=12K\).

## Algebraic bounds

Each normalized \(\Sigma_i\) acts on a one-form by an isometry
after raising its contracted index. In a compatible orthonormal
coframe this is the corresponding self-dual symbol matrix,
orthogonal with square \(-I\). The triangle inequality and
Cauchy–Schwarz over \(i\) give
\(|V|\leq\sum_i |b_i|\leq\sqrt3|b|\).
For the bracket, in an orthonormal base frame the internal
bracket is the Euclidean cross product, so
\[
|[b\wedge b]|^2
=4\sum_{a<b}|b_a\times b_b|^2
\leq4\sum_{a<b}|b_a|^2|b_b|^2\leq2|b|^4 .
\]
Since \(|\Sigma|^2=6\) in the \(E\)-valued two-form norm,
\[
|\langle[b\wedge b],\Sigma\rangle_E|
\leq 2\sqrt3\,|b|^2.
\]
The compatibility estimate \(|b|\leq 2\sqrt3|T|\)
from E09 gives the two bounds needed below:
\[
|V|\leq6|T|,\qquad
|\langle[b\wedge b],\Sigma\rangle_E|
\leq 24\sqrt3\,|T|^2 .
\]
If \(\lambda_i\) are the eigenvalues of \(Q\),
\((\sum_i\sqrt{\lambda_i})^2\geq\sum_i\lambda_i=3\), so
\(\operatorname{tr}S\geq\sqrt3\).
[E09 compatibility bound][curvature].

## Integrated bound and conformal scale

For any smooth real test function \(u\), closedness gives
\[
2\int_M u^2\operatorname{div}_g V\,dV_g
=-4\int_M u\,du(V)\,dV_g .
\]
This uses \(d(u^2)=2u\,du\) at every point, including the zeros
of \(u\). Hence the integrated scalar expression satisfies
\[
\begin{aligned}
\int_M(6|du|^2+s u^2)\,dV_g
&\geq 6\int_M |du|^2\,dV_g
     +4\sqrt3 K\int_M u^2\,dV_g\\
&\quad -24\int_M |u||du||T|\,dV_g
     -24\sqrt3\int_M |T|^2u^2\,dV_g .
\end{aligned}
\]
Young's inequality \(24xy\leq3x^2+48y^2\) applies with
\(x=|du|\), \(y=|T||u|\).
Since \(4\sqrt3\geq3\), this gives
\[
\begin{aligned}
\int_M(6|du|^2+s u^2)\,dV_g
&\geq 3\left(\int_M|du|^2\,dV_g+K\int_M u^2\,dV_g\right)\\
&\quad -(48+24\sqrt3)\int_M |T|^2u^2\,dV_g\\
&\geq \left(\frac3{C_S}-(48+24\sqrt3)\|T\|_4^2\right)
          \|u\|_4^2 .
\end{aligned}
\]
The last line uses the supplied Sobolev inequality and Hölder,
\(\int |T|^2u^2\leq\|T\|_4^2\|u\|_4^2\).
For smooth \(u>0\), the quotient of the left-hand side by
\(\|u\|_4^2\) is the normalized total scalar curvature of
\(u^2g\) in real dimension four, by the conformal scalar
formula and integration by parts. Taking its infimum gives
the stated Yamabe constant of this conformal class.
[E31 conformal quotient normalization][quotient].

At fixed \(A\), replacing \(K\) by \(\lambda K\) with
\(\lambda>0\) gives \(g'=\lambda^{-1}g\) and
\(dV_{g'}=\lambda^{-2}dV_g\). The tensor \(T\) is unchanged,
as \(Q,S\), and the connection are fixed.
Its squared pointwise norm gains a factor \(\lambda\), so
\(\int|T|^4dV_g\) and \(\|T\|_4^2\) are invariant.
The three quantities \(\|u\|_4^2\), \(\int|du|^2dV_g\),
and \(K\int u^2dV_g\) all gain the same factor
\(\lambda^{-1}\), so the same \(C_S\) works. The conformal
class and Yamabe constant are unchanged.

This is a static sufficient criterion for positive Yamabe
constant with a supplied Sobolev bound. It gives no
full Weyl-energy bound, sphere-recognition conclusion,
or persistence estimate along a flow.

[decision]: ../brainstorm/notes/B28_CRITICAL_STRAIN_YAMABE_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E35_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E35_RETURN_v1.md
[curvature]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[quotient]: 31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md
