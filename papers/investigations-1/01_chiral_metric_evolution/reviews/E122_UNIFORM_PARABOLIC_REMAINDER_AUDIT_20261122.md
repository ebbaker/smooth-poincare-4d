# E122 — Audit of the uniform parabolic-scale Taylor remainder

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E41, audited E42 conditional on the E41
inputs in E44, and audited the fixed-strip E63 argument in E67.
I did not author E119, E42 or E63. This audit concerns the new
scale-uniform inference, with the inherited fixed-space theorem
taken at its assessed scope. E121 was read for attribution only;
no primary source was newly inspected.
[Request][req] · [E119][e119] · [Packet return][ret].

## Disposition

Pass in the fixed E42 native round adjusted-pair problem. For one
fixed datum radius and \(0<t\le T/4\), the weighted norms of the
solution through two covariant spatial derivatives are bounded by
\(C\|u\|_\infty\), and those of its Taylor remainder relative to
the full derivative \(D_u\mathsf S(0)[u]\) are bounded by
\(C\|u\|_\infty^2\). The constants are independent of the
parabolic scale and the initial derivatives. The argument uses
the original closed-cylinder completions, their original trace
and the same fixed linear Cauchy and Duhamel operators. It is an
adjusted-pair estimate, without a nonlinear multiscale consequence
or a recovery estimate.
[B63][b63] · [E119 request][req119] · [E41–E44 assessment][a42].

## Lift and exact spatial conjugation

For a fixed \(0<r\le\sqrt{T/4}\), set
\(z(t)=r\eta(t/r^2)s\) and \(y=\varphi_{z(t)}(x)\).
The finite-dimensional flow is the time-one flow of \(V_z\);
along \(z=r\eta s\) it equals the flow of \(V_s\) for time
\(r\eta\). The value transport \(M_z(x)\colon\mathcal W_y\to
\mathcal W_x\) is by the fixed pair-bundle metric connection.
It acts linearly on the centered independent pair, including
all pair value slots. It is unrelated to an affine transformation
of an underlying nonlinear connection. Because \(z=0\) off the
band \([r^2/2,2r^2]\), the lift is identity near both endpoints
of the closed cylinder. Its fixed-time spatial displacement is
\(O(r|s|)\), and its spatial Jacobians and fiber matrices have
uniform finite-order spatial and parameter bounds on a fixed
small \(z\)-ball. These are bounds on the fixed flow and connection
transport on compact sets. No time derivatives of these spatial
coefficients are needed for their multiplier bounds.

Here is a local verification of the two inverse Jacobians and
the density and frame signs. Use \(J^i{}_j=\partial_j y^i\),
\(Q^j{}_i=(J^{-1})^j{}_i\), and a coordinate density \(\mu(x)\,dx\).
The pulled-back density is \(\mu(x)m_z(x)\,dx\), with
\(m_z=\mu(y)\det(J)/\mu(x)>0\). In a fixed orthonormal frame
\(D_j=\partial_j+\gamma_j\), the divergence on a contravariant
flux is \(\mu^{-1}\partial_j(\mu w^j)+\gamma_j w^j\).
For \(W^j=M_zQ^j{}_i w^i(y)\), change variables first in the
ordinary coordinate divergence with density \(\mu m_z\),
then move \(M_z\) into the derivative. This gives
\[
 \mathcal T_z(\operatorname{div}_D w)
       =\operatorname{div}_D W+B_{z,j}W^j,\qquad
 B_{z,j}=(\partial_j\log m_z)I+
           M_z\partial_j M_z^{-1}
          +M_z\gamma_i(y)M_z^{-1}J^i{}_j-\gamma_j(x).
\]
The density term has a plus sign because
\((\mu m_z)^{-1}\partial_j(\mu m_z W^j)
=\mu^{-1}\partial_j(\mu W^j)+(\partial_j\log m_z)W^j\).
The displayed frame derivative has a minus sign relative to
\((\partial_j M_z)M_z^{-1}\).
For \(V=M_z U(y)\), differentiating its components gives
\[
 D_j V=M_z(D_i U)(y)J^i{}_j+C_{z,j} V,\quad
 C_{z,j}=(\partial_j M_z)M_z^{-1}
       +\gamma_j(x)-M_z\gamma_i(y)M_z^{-1}J^i{}_j .
\]
In particular the divergence error equals
\(B_{z,j}=(\partial_j\log m_z)I-C_{z,j}\).
This relation is a direct consistency check between (4) and (5).

The differentiated field becomes
\(M_z(D_i U)(y)=Q^j{}_i(D_j V-C_{z,j}V)\). Thus with old
principal flux \(w^i=P^{ib}(y,U(y))D_bU(y)\),
\[
 W^j=\widetilde P_z^{jk}(x,V)(D_kV-C_{z,k}V),
 \qquad
 \widetilde P_z^{jk}
  =Q^j{}_i Q^k{}_b M_z P^{ib}(y,M_z^{-1}V)M_z^{-1}.
\]
The first \(Q\) transforms the output flux, and the second
changes the derivative slot. Centering at the same operator
\(L=\operatorname{div}_D(P_0D)\) leaves the divergence source
\((\widetilde P_z-P_0)DV-\widetilde P_zC_zV\), with \(B_{z,j}W^j\)
in the value source. The other value terms are the conjugates
of \(h_0,h_1,h_2\) with each old \(DU\) replaced by the
expression above. All coefficients are smooth in \((x,z,V)\)
and agree with their original values at \(z=0\).
In particular \(B_z,C_z=O(|z|)\) and the non-speed coefficient
differences are \(O(|z|)\), including finitely many derivatives
in the value. No derivative is taken of the extra flux
\(-\widetilde P_zC_z V\) in its source norm. The density, frame
and inverse factors here follow from an intrinsic conjugation
so the formulas agree on chart overlaps.
[E119, (2), (4)–(6)][e119] · [E42, divergence form (1)][e42].

## Time-band speed and the original norm bounds

At fixed \(x\), the time differentiation terms beyond \(M_z U_t(y)\)
are
\[
 \dot z^i\big((\partial_{z_i}M_z)U(y)
                       +M_z(\partial_{y^a}U)(y)\partial_{z_i}y^a\big).
\]
Expressing \(\partial_{y^a}U=D_aU-\gamma_a(y)U\) and using
the converted gradient gives the added **positive** value source
\(\dot z^i(b_i^j D_jV+c_iV)\), with
\[
 b_i^j=Q^j{}_a\partial_{z_i}y^a,\qquad
 c_i=(\partial_{z_i}M_z)M_z^{-1}
        -b_i^j C_{z,j}
        -(\partial_{z_i}y^a)M_z\gamma_a(y)M_z^{-1}.
\]
These formulas confirm the degree and the sign of the drift.
They are smooth bounded arrays on the fixed \(z\)-ball.
Only \(\dot z^i=r^{-1}\eta'(t/r^2)s_i\) carries the inverse
\(r\). Spatial derivatives leave \(z(t)\) fixed, and no
derivative of \(\dot z\) is needed. A finite derivative in
\(s\) either differentiates the linear \(s_i\) factor once
or inserts factors \(r\eta\) when differentiating in \(z\).
At each fixed positive derivative order the resulting
coefficient is bounded by \(C_\alpha/r\) on the same
band. At order zero the bound is \(C|s|/r\).
[E119, (7)–(8)][e119].

To check the lift at cylinder radius \(\ell\), first observe
that at all times \(t\le\ell^2\) outside the band it is identity.
If the band is met then \(\ell\ge r/\sqrt2\), so the displacement
is at most \(C\ell\) on that cylinder, even for the larger
tents whose upper slabs miss the band. The images of all
the cylinder balls lie in one fixed enlargement of the
same base ball. Cover the enlargement by a bounded number
of \(\ell\)-balls using fixed metric doubling. This uses
the same allowed radius \(\ell\le\sqrt T\) for each new
ball, and does not alter the time ranges. At each time
the pulled-back density Jacobian is uniformly bounded
above and below. Thus the fixed \(L^p,L^{p/2},L^2,L^1\)
cylinder norms transfer to the corresponding norm bounds
for transported arrays. Matrix factors from the fixed flow,
transport and \(J\) are bounded, so the same argument works
on the value and flux source spaces. For the solution gradient,
the displayed gradient formula uses one transported old
gradient and a controlled multiple of the value. The
last costs \(C\sqrt T\|U\|_\infty\) in \(Z\).
Since the lift maps smooth closed-cylinder fields to smooth
closed-cylinder fields for each \(r>0\), the bounds extend
to \(X_T^\circ,Y_{1,T}^\circ,Y_{0,T}^\circ\) by completion.
Unbounded time derivatives as \(r\) tends to zero play no
role in this extension.

For a scalar or tensor coefficient bounded by
\(M r^{-1}\mathbf1_{[r^2/2,2r^2]}(t)\), the small upper slabs
\(\ell<r/\sqrt2\) miss the support, as do the large upper
slabs \(\ell>2r\). On a comparable upper slab the volume
bound is \(C\ell^6\). The \(Z\) and \(Y\) weights give
\(CM\ell/r\) and \(CM\ell^2/r\), respectively, hence
\(CM\) and \(CMr\). A small tent misses the band as well;
for comparable and larger tents its overlap length is
at most \(L_\ell=\min(\ell^2,2r^2)\). After cancellation
of the spatial \(\ell^4\) with the tent weight, the two
tent terms satisfy
\[
  Z_{\rm tent}(m)^2\le CM^2 r^{-2}L_\ell,\qquad
  Y_{\rm tent}(m)\le CM r^{-1}L_\ell .
\]
The conclusion is again \(Z(m)\le CM\),
\(Y(m)\le CMr\), including every tested cylinder.
These are estimates on a smooth speed coefficient using
an indicator envelope, so no nonsmooth coefficient is
needed in the completed spaces.

The drift bound is the product \(Y(mDV)\le C Z(m)Z(DV)\).
On the upper slab this is Hölder with exponents \(p,p\),
and the two factors of \(\ell\) give the \(\ell^2\) weight.
On tents it is Cauchy–Schwarz, with the two factors of
\(\ell^{-2}\) giving the \(\ell^{-4}\) weight. The zeroth
order speed instead costs \(Y(m)\|V\|_\infty\).
Thus the extra source Lipschitz constant due to the speed
is \(C|s|\) uniformly in \(r\). The non-speed terms have
uniform Lipschitz difference at most \(C\sup|z|\).
For the divergence terms use the \(Z(DV)\) and bounded-value
\(Z\) estimates from E42 (4). For spatial value terms use
\(Y(DV)\le C\sqrt T Z(DV)\) or the product bound above,
and for bounded values use \(Y(k)\le CT\|k\|_\infty\).
All terms retain the equation's polynomial degree in
the single spatial derivative. These are the original
E41/E42 weights and spaces throughout.
[E41, norm convention][e41] · [E42, (3)–(5)][e42] ·
[E119, (3), (7)–(8)][e119].

## Fixed contraction radius, residual and trace

At the stationary round reference, the independent E42
equation has zero right side at the centered zero pair:
the physical coefficients have \(Q=I\), the gauge and
constraint inputs vanish, and \(d_{A_0}F_0=0\).
Hence \(h_0(x,0)=0\) there. Conjugation on the centered
pair and the two speed terms leave this zero solution
unchanged. The parameter map has unchanged initial
trace since the lift is identity near zero.

E42's choices \(R\le(64AK)^{-1}\), \(T\le R^2\le1\)
in (6) give the original contraction margin
\(\vartheta\le1/16\). Indeed the untransformed estimate
is at most \(AK(T+\sqrt T+R)\), with the same \(K\)
used in (5)–(6). The new source perturbation adds
at most \(AC|s|\). Fix an \(s\)-radius with
\(\vartheta+AC|s|\le\vartheta_*<1/2\), uniformly in \(r\),
and stay inside the original smooth coefficient tube.
The transformed map has norm at most
\(A\|u\|_\infty+\vartheta_*R\) on the old radius-\(R\)
ball, by stationarity. Taking \(A\epsilon\le R/4\)
maps that ball strictly into its interior, with uniform gap.
The original solution satisfies
\(\|\mathsf S(u)\|_{X_T^\circ}\le A\|u\|_\infty/(1-\vartheta)\).
Taking \(C_XA\epsilon/(1-\vartheta)\le R/4\)
puts every lifted original solution in the same ball.
These inequalities use fixed \(T,R,A,C_X\) and a single
datum radius throughout. The contraction does not call
for a radius that depends on \(r\).

For smooth approximations the exact identity is that
the transformed residual of the lift equals the lift of
the original residual. The time derivative uses the speed
source just computed. On the smooth completion, bounded
lift and source maps give convergence of values and
residuals in distributions. For each fixed \(r,s\), the
smooth invertible spacetime map preserving time and
its smooth fiber multiplier act continuously on
distributions. No estimate on their time derivatives
uniform in \(r\) is needed to pass the identity at fixed
\(r,s\). The trace is exactly the input. For a transformed
distributional solution in the ball, subtract the
fixed mild solution with its own transformed sources.
The difference solves the same unchanged linear
\(L\) equation with zero strong trace. The completion
gives \(L^2_t H^1_x\) by a finite cover of radius \(\sqrt T\);
the equation gives \(L^2_t H^{-1}_x\) for the time
derivative. The E42 fixed Gårding calculation and
time-regularized energy test with the continuous trace
give zero difference. This identifies the distributional
lift with the unique transformed mild fixed point
\(\Psi_r(s,u)=\mathcal T_{r,s}\mathsf S(u)\), in the actual
completed-space uniqueness class. It uses neither a
rough pullback differentiability assumption nor an
unproved weak uniqueness premise.
[E42, (6)–(8)][e42] · [E119, fixed-point identification (9)][e119] ·
[E41–E44 assessment][a42].

## Uniform derivatives and the full linearized subtraction

On the fixed \(V\)-ball every coefficient has finitely
many bounded derivatives in its values. A derivative in
\(V\) of the nonlinear source puts undifferentiated
direction fields into coefficients or differentiates one
linear \(DV\) factor. Thus mixed derivatives of the
flux have at most one spatial gradient factor, and mixed
derivatives of the value source have at most two. Products
of the remaining bounded values cost only their sup
norms. The speed terms are linear in \(V\) and use the
same band estimates after parameter differentiation.
The smooth coefficient Taylor remainders on the fixed
value tube and these estimates give Fréchet derivatives
in the original completed source norms. To see preservation
of the spaces, approximate base points and direction
fields by smooth closed-cylinder fields. Uniform
convergence controls the coefficients and the gradient
norm estimates pass every product; the derivatives and
their Taylor remainders thus lie in the source completions.
The asserted bounds through any specified finite order
are uniform in \(r\), by the coefficient and band bounds.

In the mild equation \(\Psi_r=\Phi_r(s,u,\Psi_r)\),
the datum occurs through the same \(H u\). The
Neumann inverse \( (I-D_V\Phi_r)^{-1}\) is bounded by
\((1-\vartheta_*)^{-1}\) everywhere in the uniform
interior fixed-point region. The implicit function
argument for each fixed \(r>0\) uses smooth maps on
open balls. At total order \(m\) of parameter and
datum differentiation, only \(D_V\Phi_r\) multiplies
a derivative of \(\Psi_r\) of order \(m\). The other
terms involve only derivatives of the source map
through \(m\) and iterated derivatives of \(\Psi_r\)
of strictly lower order. Applying the same inverse
then gives uniform bounds up to total order four,
including \(\partial_s^2 D_u^2\Psi_r\).
This proof does not require compactness in the
datum space, uniform continuity at \(r=0\), or direct
differentiation of the lift on arbitrary rough inputs.
[E119, mixed derivatives (10)][e119] · [E63, fixed-strip method][e63].

At \(s=0\), differentiating the untransformed mild
equation gives \(W(u)=D_u\mathsf S(0)[u]\), with trace
\(u\). The factor \((P(x,V)-P_0(x))DV\) vanishes
to second order in \(V\), and \(h_2(x,V)[DV,DV]\)
does as well, by the same product bounds.
The remaining derivative is
\(h_1(x,0)DW+D_Uh_0(x,0)W\), in addition to \(LW\).
Thus the subtracted linear solution is exactly the
full adjusted linearization. It cannot be replaced
by the bare principal Cauchy operator \(H\).
Since the lift is bounded and linear at every fixed
\(r,s\), its application to \(W(u)\) equals
\(D_u\Psi_r(s,0)[u]\) in the same completed space.
[E119, (11)][e119].

## Full weighted Hessian and Taylor bound

At \(t=r^2\), \(\eta(1)=1\), and evaluating at
\((t,x)\) is bounded by the value part of \(X_T^\circ\).
For a fixed parameter direction \(a\), the path
\(s=\lambda a\) evaluates the section along the
flow of \(V_a\) for time \(r\lambda\) and parallel
transports back along that same path. Its first two
derivatives at zero are precisely \(rD_{V_a}\)
and \(r^2 D_{V_a}D_{V_a}\) on the section, including
covariant transport. A local inverse on four spanning
directions, at fixed positive \(r\), derives spatial
smoothness of \(W(u)(r^2)\) from the smooth evaluated
parameter derivative \(D_u\Psi_r(s,0)[u]\).
No uniform inverse-function radius as \(r\downarrow0\)
is needed for the quantitative estimates.

At each \(x\), the map \(a\mapsto V_a(x)\) has a right
inverse with uniformly bounded operator norm by spanning
and compactness of the fixed base. Take \(a\) fixed
at that point to lift any unit vector. This gives the
first covariant jet and the weighted repeated-direction
second jet. To get the true Hessian subtract
\(D_{\nabla^0_{V_a}V_a}\) from \(D_{V_a}D_{V_a}\),
using the fixed Levi-Civita connection \(\nabla^0\).
The difference costs at most \(Cr^2\|DZ\|_\infty\)
on a section \(Z\), controlled by the first weighted
estimate since \(r\le1\). Polarization gives the
symmetric Hessian. The antisymmetric difference is
\(R^D(X,Y)Z\) since \(\nabla^0\) is torsion-free.
Here \(R^D\) is the fixed curvature of the whole
pair-bundle connection, including curvature on any
pair value slots. Its weighted cost is controlled by
\(Cr^2\|Z\|_\infty\). This verifies the full ordered
Hessian estimate; symmetry of that Hessian is not
assumed.

The identity \(\Psi_r(s,0)=0\) gives vanishing parameter
derivatives there. Integrating \(D_u\partial_s^\alpha
\Psi_r\) on the datum segment yields the linear
estimate for \(|\alpha|\le2\). Using the integral Taylor
remainder with \(\partial_s^\alpha D_u^2\Psi_r\) gives
the quadratic bound on the lifted difference
\(\mathsf S(u)-W(u)\); the datum segment stays on the
same fixed ball. Taking the weighted jets through two
at \(s=0\), \(t=r^2\), and taking the supremum over
\(0<r\le\sqrt{T/4}\) proves both E119 (1) estimates.
All constants are independent of the input's spatial
derivatives. For compatible input this is the original
E42 compatible branch; the auxiliary fixed points
were identified on the independent pair and did not
need a curvature graph condition on the lifted field.
[E119, (1), (12) and weighted jets][e119] ·
[E63, inverse transport patches][e63].

## Source scope and consumed identities

E121 distinguishes the attribution of the parameter method
from the new uniform mixed derivative estimates. No
external weighted estimate or source normalization is
a premise here. The norm conventions, contraction and
unique residual identification are the assessed E41/E42
ones, and the independent checks above provide the new
scale-uniform part. No shared file was edited and no build
was performed.
[E121, attribution only][e121] · [E41–E44 assessment][a42] ·
[E62–E67 assessment, E63 scope][a63].

| Consumed file | SHA-256 |
| --- | --- |
| [E122 request][req] | 4cf7f66fe689e74d8d4e2a750f26264e25cad329a0d8e6debc73ee7b2b5ffbd3 |
| [E119 request][req119] | fce7d9d0dc3804e137342e7e1197412108bcb89759e865397f7dadaaf373f062 |
| [E119 return][ret119] | 49fa30409a59f3bdf40d7b094672e65a98e85d83e33485a79f46250a36019b39 |
| [B63][b63] | ab7254b83dd4c099b5953d530025e85f6325df5f664320e88eaf2d1860106a6f |
| [E119][e119] | 4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea |
| [E41][e41] | 8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3 |
| [E42][e42] | 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77 |
| [E63][e63] | 427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb |
| [E41–E44 assessment][a42] | cd4081efe286ebe299a911b4a79c3fe9904ec84601c9a1e6ddc0209c1fb6eb75 |
| [E62–E67 assessment][a63] | 69d4009570d50e810533fd1f37eb4cba7907690b39ce830774f109ed9053e70f |
| [E121][e121] | 2f628e07e312b1d902636d666729197f6666bf352d3de5e3505e99e52ce821e4 |

[req]: ../research-progress/handoffs/SP4-CME-E122_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E122_RETURN_v1.md
[req119]: ../research-progress/handoffs/SP4-CME-E119_REQUEST_v1.md
[ret119]: ../research-progress/handoffs/SP4-CME-E119_RETURN_v1.md
[b63]: ../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[e119]: ../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[a42]: E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[a63]: E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md
[e121]: E121_ROUGH_DERIVATIVE_SOURCE_AUDIT_20261122.md
