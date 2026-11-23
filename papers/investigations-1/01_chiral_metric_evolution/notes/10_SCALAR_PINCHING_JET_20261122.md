# SP4-CME-E08 local maximum test for the scalar curvature defect

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This bounded execution
answers the [E08 request](../research-progress/handoffs/SP4-CME-E08_REQUEST_v1.md)
under the [B07 decision](../brainstorm/notes/B07_SCALAR_PINCHING_TEST_20261122.md).
The [return](../research-progress/handoffs/SP4-CME-E08_RETURN_v1.md)
identifies the frozen inputs.

For each \(0<\varepsilon\le1/8\), the construction below gives a
smooth local definite connection for which \(p\) is a strict spatial
local maximum of \(|Q-I|^2\), and the differential of that scalar
on the actual unadjusted Fine flow vector is strictly positive.
This disproves the proposed local nonincreasing-maximum inference.

## Fixed charts, norms and anisotropic data

Work on a smooth oriented Euclidean coordinate chart near \(p=0\) in
real dimension four. Take the trivial oriented Euclidean bundle
\(E=\mathbb R^3\), with \([e_i,e_j]=\epsilon_{ijk}e_k\).
Use the manuscript internal metric \(\delta\), Frobenius norms on
endomorphisms, \(K=1\), and the round-compatible sign.
The constant self-dual forms
\[
 \Sigma_1^*=dx^{14}+dx^{23},\quad
 \Sigma_2^*=dx^{24}+dx^{31},\quad
 \Sigma_3^*=dx^{34}+dx^{12}
\]
satisfy \(\Sigma_i^*\wedge\Sigma_j^*=2\delta_{ij}dV_{\rm eucl}\).
Set \(J_i\xi=\iota_{\xi^\sharp}\Sigma_i^*\), so
\(J_i^T=-J_i\) and
\(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\).
Write
\[
 \begin{aligned}
 Q_*&=\operatorname{diag}(1+\varepsilon,1,1-\varepsilon),\\
 q_*&=Q_*-I,\qquad
 H=\operatorname{diag}(1,-2,1)-q_*/2,\\
 s_i&=\sqrt{(Q_*)_{ii}},\qquad d=s_1s_2s_3=\sqrt{1-\varepsilon^2},\\
 F_i^*&=-s_i\Sigma_i^*.
 \end{aligned}
\]
Thus the curvature plane is positive, \(\mu_*=2dV_{\rm eucl}\),
and the metric reconstructed at this curvature is Euclidean.
Let
\(\mathscr L_Q(T)=2(QT+TQ)-\tfrac43\operatorname{tr}(QT)Q\).
Direct contractions give
\[
 \begin{aligned}
 \langle q_*,H\rangle&=-\varepsilon^2,\qquad
 \operatorname{tr}(Q_*H)=-\varepsilon^2,\qquad
 \operatorname{tr}(q_* Q_*H)=\varepsilon^2,\\
 \langle q_*,\mathscr L_{Q_*}(H)\rangle
    &=4\varepsilon^2+\tfrac83\varepsilon^4>0,\\
 |q_*|^2&=2\varepsilon^2,\qquad
 \langle q_*,\mathscr L_{Q_*}(q_*)\rangle
       =8\varepsilon^2-\tfrac{16}{3}\varepsilon^4 .
 \end{aligned}
 \tag{1}
\]
For the last identity,
\(\operatorname{tr}(Q_*q_*^2)=2\varepsilon^2\) and
\(\operatorname{tr}(Q_*q_*)=2\varepsilon^2\).

## Actual connection and all unscaled baselines

For a curvature triple \(F\) in these fixed coordinates, define
\(M_{ij}=(F_i\wedge F_j)/(2dV_{\rm eucl})\) and
\(Q=3M/\operatorname{tr}M\). At \(F^*\) the differentials are
\[
 \delta M_{ij}=-\tfrac12
   \left(s_j\langle\delta F_i,\Sigma_j^*\rangle
        +s_i\langle\delta F_j,\Sigma_i^*\rangle\right),
 \qquad
 \delta Q=\delta M-\tfrac13\operatorname{tr}(\delta M)Q_*.
 \tag{2}
\]
If \(\delta F_i=\xi\wedge V_i\) for a unit coordinate
covector, then \(\langle\delta F_i,\Sigma_j^*\rangle
=\langle V_i,J_j\xi\rangle\).
The \(J_j\xi\) are mutually orthonormal. Hence
\(V_i=-\sum_j(H_{ij}/s_j)J_j\xi\) gives
\(\delta M=H\) and, since \(\operatorname{tr}H=0\),
\(\delta Q=H\). This is the fixed-covector right inverse
of [E02C](04C_VOLUME_AND_JETS_20261122.md).

Define a polynomial connection in the prescribed chart by
\[
 \alpha_a=\tfrac12\iota_{\partial_a}F^*,\qquad
 A^0=\sum_a x^a\alpha_a,\qquad
 V_i^a=-\sum_j(H_{ij}/s_j)J_jdx^a,\qquad
 A^L=A^0+\tfrac L6\sum_a(x^a)^3 V^a ,
 \tag{3}
\]
where \(L>0\) is finite. The curvature
\(F^L=dA^L+\tfrac12[A^L\wedge A^L]\) has expansion
\[
 F^L=F^*+\tfrac12[A^0\wedge A^0]
       +\tfrac L2\sum_a(x^a)^2dx^a\wedge V^a+O_L(|x|^4).
 \tag{4}
\]
In particular \(A^L(p)=0\), \(\partial_a A^L(p)=\alpha_a\),
\(F^L(p)=F^*\) and \(\partial F^L(p)=0\).
Since reconstruction and the curvature quotient are smooth algebraic
functions of \(F\) locally, \(Q(p)=Q_*,\ \nabla_A Q(p)=0\),
\(\widehat g(p)=g_{\rm eucl}\), and \(\partial\widehat g(p)=0\).
The curvature at \(p\) has positive wedge Gram matrix and the correct
orientation sign, so these persist in some smooth definite
neighborhood for each chosen \(\varepsilon,L\). Its radius can
depend on the parameters. The full Bianchi identity holds because
\(F^L\) is taken from an actual connection.

For the unscaled quadratic curvature, the Hessian is
\(\partial_a\partial_bF^0(p)=[\alpha_a\wedge\alpha_b]\).
In internal components
\(\alpha_{a,i}=-(s_i/2)J_i dx^a\). Since the wedge Lie bracket
of these one-forms is symmetric in \(a,b\), its self-dual
contraction is computed with the symmetric part of
\[
 \tfrac14\sum_{r,t}\epsilon_{irt}s_rs_t
                 \langle J_jJ_r dx^a,J_t dx^b\rangle .
\]
The quaternionic product and skew symmetry give
\[
 \operatorname{sym}_{ab}
       \langle J_jJ_r dx^a,J_t dx^b\rangle
        =\epsilon_{jrt}\delta_{ab}.
\]
Indeed the scalar part \(-\delta_{jr}I\) of \(J_jJ_r\)
gives an antisymmetric pairing in \(a,b\), and the symmetric
part of \(\langle J_\ell dx^a,J_t dx^b\rangle\) is
\(\delta_{\ell t}\delta_{ab}\).
The contraction therefore equals
\((d/(2s_i))\delta_{ij}\delta_{ab}\), with a contribution
from each of the two complementary ordered pairs. Substitution into (2)
gives
\[
 \partial_a\partial_bM^0(p)=-\tfrac d2 I\,\delta_{ab},
 \qquad
 \partial_a\partial_bQ^0(p)=\tfrac d2 q_*\,\delta_{ab}.
\]
The curvature's first derivatives vanish, so no quadratic
chain-rule term in them enters these Hessians.
The cubic part of (4) contributes \(L\delta_{ab}H\)
by (2). Thus the coordinate and covariant Hessians are
\[
 \begin{aligned}
 \partial_a\partial_bQ^L(p)&=\delta_{ab}(\tfrac d2q_*+LH),\\
 \nabla_a\nabla_bQ^L(p)&=\delta_{ab}(\tfrac d2q_*+LH)
                +\tfrac12[\operatorname{ad}(F^*_{ab}),Q_*],\\
 \Delta_AQ^L(p)&=2d q_*+4L H .
 \end{aligned}
 \tag{5}
\]
The extra covariant term is the differentiated connection
\([\operatorname{ad}(\partial_a A_b),Q_*]\).
It is skew in the tangent indices and gives zero in the
rough Laplacian. The reconstructed Levi–Civita coefficient
multiplies a vanishing first derivative at \(p\).

## Exact spatial and initial-flow signs

Let \(w=|Q-I|^2\). The spatial derivative of \(w\) at \(p\)
is zero. In its Hessian the terms quadratic in \(\nabla Q\)
vanish, and the internal connection commutator also pairs
to zero with \(q_*\), since \(q_*\) commutes with \(Q_*\).
Using (1) and (5) gives the spatial Hessian
\[
 \nabla^2w(p)=2\varepsilon^2(d-L)\,g_{\rm eucl}.
 \tag{6}
\]
Thus \(L>d\) makes \(p\) a strict spatial local maximum.

For the time derivative, evaluate the unadjusted vector
\(v=-4d_A^{*\widehat g}[(q-|q|^2I/6)F]\) at \(A^L\).
In the full \(Q\) equation all first-derivative products
vanish at \(p\). The momentary reaction retains the value
\(-24d q_*\), incorporating the internal curvature commutator.
Together with (5) this gives the fixed-baseline formula
\[
 Q_t(A^L)(p)=2d\mathscr L_{Q_*}(q_*)-24d q_*
                       +4L\mathscr L_{Q_*}(H).
 \tag{7}
\]
This evaluates a directional derivative of \(Q\) on the
flow vector field. To check its dependence on the chosen
connection and adjoint, set \(R=q-|q|^2I/6\). Bianchi and
self-duality give \(v_i=4\sum_j J_{F_j}(D_AR)_{ij}\), with
\(J_G\xi=*_{\widehat g}(\xi\wedge G)\).
At \(p\), \(D_AR=0\) and \(A=0\), so \(v(p)=0\) and
\(F_t(p)=dv(p)\). Each axis in the jet adds
\(L(H-\operatorname{tr}(Q_*H)I/3)\) to the corresponding
diagonal entry of the Hessian of \(R\). The unchanged first
jets of \(F\) and \(\widehat g\) contribute no additional
\(L\)-dependent term to \(dv(p)\). Insertion into (2) yields
\(L\mathscr L_{Q_*}(H)\) in \(Q_t\) per axis, as in (7).
The first two terms of (7) are the entire unscaled vector,
evaluated from (5) and the curvature reaction.
[E02A exact evolution](04A_NONLINEAR_Q_20261122.md),
[E02C direct jet differentiation](04C_VOLUME_AND_JETS_20261122.md),
and [Fine v2, Proposition 4.2](https://arxiv.org/html/1111.5005v2#S4.SS1).

Using (1) in twice the pairing of (7) with \(q_*\) gives
\[
 \left.dw\right|_{A^L}(v)(p)
  =32\varepsilon^2\left[
        L(1+\tfrac23\varepsilon^2)
           -2d(1+\tfrac13\varepsilon^2)\right].
 \tag{8}
\]
The unscaled term is \(-64d\varepsilon^2(1+\varepsilon^2/3)\).
Equations (6) and (8) are both strict with \(L=3\) throughout
the frozen parameter range. In fact \(d<1\) and
\(1+2\varepsilon^2/3>1+\varepsilon^2/3\).
The instantaneous scalar derivative is invariant under
internal gauge conjugation. Adding an infinitesimal base
gauge contributes its directional derivative of \(w\), which
vanishes at this spatial critical point.

For the prescribed exact sample \(\varepsilon=1/16\) and \(L=3\),
\(Q_*=\operatorname{diag}(17/16,1,15/16)\),
\(H=\operatorname{diag}(31/32,-2,33/32)\), and \(d=\sqrt{255}/16<1\).
The pairings in (1) are \(-1/256\) and \(385/24576\).
The Hessian coefficient is \((d-3)/128<-1/64\).
The scalar flow derivative is
\((1155-769d)/3072>193/1536>0\).
Moreover \(|q_*|^2=1/128<1/64\).
Within the symbolic family, \(\varepsilon\le(8\sqrt2)^{-1}\)
puts a sufficiently small neighborhood in the E05 pinching
range. At equality the strict spatial maximum supplies
the same local pinching on a sufficiently small neighborhood.

## Evidence boundary

These are spatial jets of an actual smooth local connection
and an exact evaluation of one initial flow vector. They
show the local spatial maximum sign can fail arbitrarily
close to perfection and at the E05 threshold. They leave
global forward invariance on a closed manifold, existence of
an evolved solution from these chart data, and any boundary
hitting unresolved. The [E05 integrated energy estimate](07_PINCHED_ENERGY_GAP_20261122.md)
continues to hold on a smooth closed interval throughout
which its pointwise pinching premise is satisfied.
