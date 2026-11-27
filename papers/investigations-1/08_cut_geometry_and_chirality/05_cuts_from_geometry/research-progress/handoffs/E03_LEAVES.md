# GEO-E03 — Scalar curvature near Morse–Bott critical sets

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex.
Bounded E execution, issued revision 1. Requested helper \( \text{GPT-6.2 Sol/ultra} \).
Actual serving model and reasoning effort are unavailable. This return contains
local proofs and exact models for independent replay.
[Issue](ISSUE_20261127.md) · [Child continuation](../../continuation-notes/CONTINUATION.md) ·
[Register](../REGISTER.md)

The [parent TeX](../../../manuscript/cuts_of_subcritical_conformal_classes.tex)
was checked against commit `bc2c1bb` and SHA-256
`ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`.
The calculation uses the restriction identity of Lemma 7.1 and the sign
convention of the Gauss equation in Theorem 4.1. Both identities are
recomputed below. Theorem 7.2 is the isolated critical-point case for its
strict signs.

## Local criterion

Let \(f\) and \(g\) be smooth on a Riemannian four-manifold, and let \(F\)
be a smooth embedded Morse–Bott critical submanifold of codimension \(m\ge1\).
Locally \(f|_F=f_0\). At \(p\in F\), write \(Q=\operatorname{Hess}^{\sharp}f(p)\),
so \(Q|_{T_pF}=0\) and \(A=Q|_{N_pF}\) is invertible. This \(A\) is the
normal Hessian. Use \(B(X,Y)=g(\nabla_X\nu,Y)\), the curvature sign for which the
unit sphere has sectional curvature \(1\), and \(P(\nu)=R-2\operatorname{Ric}(\nu,\nu)\).

For \(x=\exp_p(rv)\), \(v\in S(N_pF)\), transport all tensors back along the
normal geodesic. Set
\[
a=Av,\quad \ell=|a|,\quad n=a/\ell,\quad
D=\nabla_v(\operatorname{Hess}^{\sharp} f)(p),\quad b=Dv,\quad
\xi=\frac{b-\langle b,n\rangle n}{2\ell}.
\]
Taylor expansion yields \(\nabla f(x)=ra+\tfrac12r^2b+O(r^3)\),
\(Q_x=Q+rD+O(r^2)\) and, for \(r>0\), \(\nu(x)=n+r\xi+O(r^2)\).
The remainder estimates here and below are uniform over the normal sphere
bundle of a compact coordinate patch of \(F\). In particular all sufficiently
small \(r>0\) are regular in that patch.

Every normal \(n\) is accessible as a limit of gradient normals, via
\(v=A^{-1}n/|A^{-1}n|\). With a restriction to the family
\(\pm(f-f_0)>0\), the limiting normals are confined to
\(\pm\langle n,A^{-1}n\rangle\ge0\). Strict inequality gives a ray in that
family by the Taylor expansion of \(f\). For an indefinite \(A\) the equality
directions are limits of strict directions on either side, hence are
accessible by sequences in each family. This follows because a null
direction of a nondegenerate normal quadratic form is a regular point of its
restriction to the unit sphere.

For a symmetric \(Q\) and a unit \(n\), restricting the trace and the
squared norm to \(n^\perp\) gives
\[
\Phi(Q,n)=\sigma_2(Q|_{n^\perp})
 =\sigma_2(Q)-(\operatorname{tr}Q)\langle Qn,n\rangle+|Qn|^2
 =\sum_i n_i^2s_i(Q).
\]
Here \(s_i(Q)\) omits the eigenvalue \(q_i\) of \(Q\). Only normal
eigenvectors enter the last sum when \(n\in N_pF\). Contracting the Gauss
equation gives \(R_\Sigma=P(\nu)+(\operatorname{tr}B)^2-|B|^2
=P(\nu)+2\Phi(Q_x,\nu)/|\nabla f|^2\).
Consequently the first two singular coefficients are
\[
\begin{split}
R_\Sigma(\exp_p(rv))&=\frac{C_0(p,v)}{r^2}+\frac{C_1(p,v)}r+O(1),\\
C_0&=\frac{2\Phi(Q,n)}{\ell^2},\\
C_1&=\frac{2}{\ell^2}
 \left(d\Phi_{(Q,n)}(D,\xi)-\frac{\langle a,b\rangle}{\ell^2}\Phi(Q,n)\right).
\end{split}
\]
For explicit evaluation of the differential, set \(q=\langle Qn,n\rangle\).
Then
\[
d\Phi(D,\xi)=(\operatorname{tr} Q-q)\operatorname{tr}D-\operatorname{tr}(QD)
-(\operatorname{tr}Q)\langle Dn,n\rangle+2\langle Qn,Dn\rangle
+2\langle(Q^2-(\operatorname{tr}Q)Q)n,\xi\rangle.
\]
The parity is \(C_0(p,-v)=C_0(p,v)\), \(C_1(p,-v)=-C_1(p,v)\).

For all regular levels approaching \(F\), a negative \(s_i(Q)\) for any
normal eigenvector gives unbounded negative curvature along a corresponding
ray. Strictly positive \(s_i(Q)\) on the normal eigenspace gives positive
\(r^{-2}\) divergence, locally uniform near that core point. Weak
nonnegativity is exactly the absence of negative \(r^{-2}\) coefficients.
At a zero of \(C_0\), nonzero \(C_1\) forces negative divergence on one of
the two opposite rays.

More precisely, take a compact patch \(K\subset F\) and all
\(p\in K,\ v\in S(N_pF),\ 0<r<r_0\) for a common small \(r_0\).
A uniform lower bound holds exactly when \(C_0\ge0\), \(C_1=0\) on
\(C_0=0\), and \(C_1^2/C_0\) is bounded on \(C_0>0\).
Sufficiency follows by completing the square in \(1/r\). For necessity
in the unbounded-ratio case, use parity to choose \(C_1<0\) along a
sequence with \(C_1^2/C_0\to\infty\). Then \(r=2C_0/|C_1|\to0\)
and the two singular terms sum to \(-C_1^2/(4C_0)\).
On the normal sphere over one fixed \(p\), weak nonnegativity and
vanishing of \(C_1\) on \(C_0=0\) imply the ratio bound. Indeed
\(\Phi=\sum_i s_i n_i^2\) controls the squared distance to its null
sphere, and \(C_1\) is smooth and vanishes there. The same reasoning works
uniformly over a compact patch when the nonnegative form on the normal
space has constant rank. The ratio condition accounts for varying rank.

When \(C_0=C_1=0\) on a ray, its finite curvature limit is
\[
P(p,n)+\tfrac12 \partial_r^2
 \left[\frac{2\Phi(Q_x,G/|G|)}{|G|^2}\right]_{r=0},
\qquad G=r^{-1}\nabla f(x),
\]
where the fraction extends smoothly after parallel transport. Its sign
decides the sign along that ray if it is nonzero. If it vanishes, a
further coefficient can be needed.

| Codimension | Normal \(s_i\) and local consequence |
| --- | --- |
| \(4\) | The four omissions of Theorem 7.2. Index two has a negative omission. For index one or three the reciprocal inequalities there describe the weak threshold. |
| \(3\) | \(s_i=q_jq_k\) for the other two normal eigenvalues. Definite normal Hessian gives positive divergence. Every mixed sign gives a negative coefficient. |
| \(2\) | All accessible normal omissions are zero. The \(r^{-1}\) test is given below. |
| \(1\) | The restricted Hessian at \(r=0\) vanishes, so both singular coefficients vanish. The shape operator tends to \(-\langle \mathrm{II}_F,n\rangle\), and \(R_\Sigma\to R_F(p)\). |

For the last row the tangent-plane tilt is \(O(r)\) and gives an
\(O(r^2)\) correction in the restriction of \(Q\), whose kernel is
\(T_pF\). The restriction of \(D\) on \(T_pF\) is
\(-\langle Av,\mathrm{II}_F\rangle\) by the derivative identity below,
which gives the shape limit.

There is a sharp equality example already for an isolated Morse critical
point in flat space. Take
\(f=\tfrac12(x^2+y^2+z^2-w^2/2)+\tfrac c2 xw^2\).
The Hessian at the critical point has spectrum \((1,1,1,-1/2)\) and
nonnegative omissions. On the \(x\)-axis the restricted Hessian is
\(\operatorname{diag}(1,1,-1/2+cx)\), with
\(|\nabla f|^2=x^2\). Thus \(R_\Sigma=4c/x\) there. When \(c=0\), the
restriction identity gives \(R_\Sigma\ge0\) everywhere regular instead.

## Critical surfaces

Write \(\mathrm{II}_F(X,Y)=(\nabla_XY)^\perp\) and
\(\vec H_F=\operatorname{tr}_{TF}\mathrm{II}_F\), with unnormalized trace.
For \(m=2\), choose the unit \(w\in N_pF\cap n^\perp\), and put
\(\lambda(n)=\langle Aw,w\rangle=(\det A)\langle n,A^{-1}n\rangle\).
On \(n^\perp=T_pF\oplus\mathbb R w\) the limiting restricted Hessian
has spectrum \((0,0,\lambda)\). The \(n\) differential of \(\Phi\) is
zero: \(A^2-(\operatorname{tr}A)A=-(\det A)I\) on \(N_pF\), so it maps
\(n\) onto its own span. The \(Q\) differential is
\(\lambda\operatorname{tr}_{TF} D\).

For tangent \(X,Y\) along \(F\), the covariant derivative of the Hessian
has the interchange symmetry \((\nabla_v\operatorname{Hess}f)(X,Y)
=(\nabla_X\operatorname{Hess}f)(v,Y)\) at \(p\). The curvature commutator
vanishes there since \(df(p)=0\). As \(\operatorname{Hess}f(v,Y)=0\) on
\(F\), differentiating in \(X\) gives
\[
(\nabla_v\operatorname{Hess}f)(X,Y)=-\langle Av,\mathrm{II}_F(X,Y)\rangle.
\]
It follows that
\[
 R_\Sigma(\exp_p(rv))
   =-\frac{2\lambda(n)}{r\ell}\langle\vec H_F(p),n\rangle+O(1).
\]
For a definite normal Hessian, \(\lambda(n)\) never vanishes. For an
indefinite normal Hessian, it vanishes only at the normal null directions
of \(A^{-1}\). If \(\vec H_F(p)\ne0\), some \(n\) has a nonzero coefficient
and the opposite normal has the opposite sign. For each incident family
of regular levels, one can choose such a direction in the open sign cone
of \(\langle n,A^{-1}n\rangle\). Thus on a core patch, uniform lower
boundedness for nearby regular leaves is equivalent to minimality
throughout the patch. Minimality then gives bounded curvature, with the
finite coefficient still to be evaluated for positivity.

## Exact cylinders and changes of the defining function

In flat \(\mathbb R^d_y\times\mathbb R^m_z\), \(f=\tfrac12|z|^2\)
has critical core \(\mathbb R^d\), with \(d=4-m\).
The leaves of radius \(r\) have \(m-1\) principal curvatures \(1/r\)
and \(d\) zero curvatures. This gives the exact table.

| \(m\) | Leaf | \(s_i(Q)\) on normal eigenvectors | Exact \(R_\Sigma\) |
| --- | --- | --- | --- |
| 4 | \(S^3(r)\) | \(3\) | \(6/r^2\) |
| 3 | \(S^2(r)\times\mathbb R\) | \(1\) | \(2/r^2\) |
| 2 | \(S^1(r)\times\mathbb R^2\) | \(0\) | \(0\) |

A monotone radial reparameterization retains these leaves. A constant
positive definite normal quadratic form gives homothetic ellipsoidal
cylinders. For \(m=4,3\) the leading sign stays positive by the normal
omissions, and homothety makes the \(r^{-2}\) scaling exact. For \(m=2\)
the product with the ellipse has zero scalar curvature.

For a spatially varying squared radius on a product core
\((F^d,g_F)\times\mathbb R^m\), take
\(f(y,z)=|z|^2/(2\beta(y)^2)\), for smooth \(\beta>0\).
The leaf \(f=\varepsilon^2/2\) has radius \(\rho(y)=\varepsilon\beta(y)\)
and metric \(h_B+\rho^2g_{S^k}\), where \(h_B=g_F+d\rho^2\) and \(k=m-1\).
With \(\Delta=\operatorname{div}\nabla\), the horizontal sectional
curvatures are those of \(h_B\), mixed curvatures with horizontal unit
\(X\) are \(-\operatorname{Hess}_{h_B}\rho(X,X)/\rho\), and vertical ones
are \((1-|\nabla\rho|_{h_B}^2)/\rho^2\). These follow from the connection
formulas \(\nabla_X U=X(\log\rho)U\) for lifted horizontal \(X\) and
vertical \(U\), and \((\nabla_U V)^H=-h(U,V)\nabla\log\rho\) for vertical
\(U,V\). Summing the sectional curvatures and using
\(h_B=g_F+O(\varepsilon^2)\) in \(C^2\) gives
\[
 R_\Sigma=
 \frac{k(k-1)}{\varepsilon^2\beta^2}
 +R_F-2k\frac{\Delta_F\beta}{\beta}
 -k(k-1)\frac{|\nabla_F\beta|^2}{\beta^2}+O(\varepsilon^2).
\]
In the flat \(m=2\) model, use \(\beta(y)=1+\tfrac c2|y|^2\) near \(y=0\).
All choices have the same Hessian and same third derivatives of \(f\) at
\((0,0)\). At \(y=0\), \(d\rho=0\), \(\Delta_{h_B}\rho=2\varepsilon c\)
and \(R_{h_B}=2\varepsilon^2c^2\) by the Gauss equation for the graph
of \(\rho\). Thus the exact scalar curvature there is
\(-4c+2\varepsilon^2c^2\). Both signs and exact flatness occur among these
Morse–Bott profiles with a totally geodesic core.

A tangential quadratic perturbation instead changes the critical set.
For the flat model \(f=\tfrac12(|z|^2+\sum_{j=1}^d\eta_j y_j^2)\)
with every \(\eta_j\ne0\), the origin is Morse. For \(m=3\), normal
omissions are \(1+2\eta_1\) and the tangential omission is \(3\).
For \(m=2\) the two normal omissions are
\(\eta_1+\eta_2+\eta_1\eta_2\), while the other two are
\(1+2\eta_2\) and \(1+2\eta_1\). In particular
\(\eta_1=\eta_2=\eta\) gives opposite signs of the leading normal
coefficient for small positive and negative \(\eta\).
\(\eta_1=-\eta_2\ne0\) gives a negative normal omission \(-\eta_1^2\).
These are tests at each fixed perturbation.

## True geodesic tubes around surfaces

Now \(f=\tfrac12 d(F,\cdot)^2\) in a smooth normal tube and the outward
normal is \(\nu=\dot\gamma(r)\) for \(\gamma(r)=\exp_p(rn)\).
The normal Hessian on \(F\) is the identity, giving
\(\sigma_2(B)=-\langle\vec H_F,n\rangle/r+O(1)\), as proposed in the
child continuation. Let \(A_n:T_pF\to T_pF\) be defined by
\(\langle A_n X,Y\rangle=\langle\mathrm{II}_F(X,Y),n\rangle\).
Set \(\mathcal R_nX=\operatorname{Rm}(X,n)n\), with
\(\langle\mathcal R_nX,X\rangle=K(X,n)\) for unit \(X\) perpendicular
to \(n\). For \(e\in T_pF\), take the Jacobi field from varying \(p\)
with \(n\) normal-parallel at \(p\), and take \(J_w\) from varying
\(n\) towards \(w\in N_pF\cap n^\perp\). In a parallel frame their
initial data and Jacobi equation give
\[
 J_e=e-rA_ne-\tfrac12r^2\mathcal R_n e+O(r^3),\qquad
 J_w=rw-\tfrac16r^3\mathcal R_n w+O(r^4).
\]
The shape operator sends \(J_e\) to \(J_e'\) and \(J_w\) to \(J_w'\).
Using columns \((J_e,J_w/r)\) to compute it in the parallel
\(T_pF\oplus\mathbb Rw\) frame gives
\[
 B_{TT}=-A_n-r(A_n^2+(\mathcal R_n)_{TT})+O(r^2),\quad
 B_{Tw}=O(r),\quad B_{ww}=1/r+O(r).
\]
For example the inverse column matrix has tangent block
\(I+rA_n+O(r^2)\), with off-diagonal blocks \(O(r^2)\).
Then \(\sigma_2(B)=\det B_{TT}+B_{ww}\operatorname{tr}B_{TT}-|B_{Tw}|^2\),
so the full expansion through the finite term is
\[
 R_{\operatorname{tube}(r)}(\exp_p(rn))
 =-\frac{2\langle\vec H_F,n\rangle}{r}
    +P(p,n)+2\bigl(\det A_n-\operatorname{tr}A_n^2
                    -\operatorname{tr}_{T_pF}\mathcal R_n\bigr)+O(r).
\]
For minimal \(F\), the finite term is
\(P(p,n)-3|A_n|^2-2\sum_{i=1}^2 K(e_i,n)\), since \(\operatorname{tr}A_n=0\).

For an explicit nonminimal example, the tube about
\(S^1(1)\times\mathbb R\subset\mathbb R^4\) has metric
\(dy^2+r^2d\theta^2+(1+r\cos\theta)^2du^2\), with \(\theta=0\) the
outward radial angle of the core circle. Its scalar curvature is
\(2\cos\theta/(r(1+r\cos\theta))\), exhibiting the opposite divergences.

The unit round \(S^4\) gives exact minimal examples. Its equatorial
\(S^2\) has leaves with metric \(\cos^2 r\,g_{S^2}+\sin^2r\,d\theta^2\)
and \(R_\Sigma=2\sec^2 r\). For the Clifford torus in the equatorial
\(S^3\), let \(n_1\) be its \(S^3\)-normal and \(n_2\) the normal
to the equator. The normal \(n=\cos\theta\,n_1+\sin\theta\,n_2\) has
shape eigenvalues \(\pm\cos\theta\). Then \(P=6\) and the finite term is
\(2-6\cos^2\theta\). One can check it using the exact tube metric
\[
 \sin^2 r\,d\theta^2
 +\tfrac12(\cos r+\sin r\cos\theta)^2du^2
 +\tfrac12(\cos r-\sin r\cos\theta)^2dv^2.
\]
For a metric \(dt^2+a(t)^2du^2+b(t)^2dv^2\), the three sectional
curvatures are \(-a''/a,-b''/b,-a'b'/(ab)\), obtained from the
Levi-Civita connection. Here \(t=\theta\sin r\), so the exact scalar
curvature is \((2-6\cos^2\theta)/(\cos^2r-\sin^2r\cos^2\theta)\)
for sufficiently small positive \(r\). Thus even in the round entering
gauge a minimal surface can have tubes with scalar curvature of both
signs. The positive-type topology test suggested in the child continuation
would use the closed circle-bundle argument of parent Corollary 4.3
separately from the pointwise curvature calculation. Its cited
classification is outside this local execution.

## Scope for GEO-B01

A smooth Morse–Bott model with a codimension-two minimal core can
satisfy uniform lower boundedness and even have strictly positive
regular levels, as the equatorial sphere model shows. The isolated
index-two obstruction of parent Theorem 7.2 therefore gives no
exclusion of those collapses. The calculation applies to an actual
flow only after a smooth Morse–Bott defining function or an actual
tube description has been justified. A cylindrical tangent model by
itself specifies only the leading cylindrical coefficient. The
regularity of a flow through a singular set and the global recognition
problem are outside this packet.
