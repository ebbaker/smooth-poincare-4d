# SP4-CME-E119 — Uniform parabolic-scale Taylor remainder

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E63 and audited E41 in
E43 and the rough manuscript integration in E46. I did not author
E41 or E42. The three frozen note hashes matched at consumption.
This is the fixed E test in the [request][req] and [B63][b63].
No new source was inspected. [Return][ret].

## Result and fixed norms

Use the stationary native positive perfect chiral
\(\mathrm{SO}(3)\) reference on the smooth closed oriented round
Riemannian \(S^4\). Keep E42's fixed metric pair bundle
\(\mathcal W\), connection \(D\), density, \(p>6\), Bianchi
diffusion coefficient and coefficient cutoff. Write
\(\mathscr D=C^0(S^4;\mathcal W)\) in its fixed sup norm,
\(\mathscr X=X_T^\circ\), \(Z=\|\cdot\|_{Y_{1,T}}\),
and \(Y=\|\cdot\|_{Y_{0,T}}\). Work with the fixed E42 time
\(T\le1\), fixed ball of radius \(R\), and independent-pair solution
map \(\mathsf S:\mathscr D\supset B_\epsilon(0)\to\mathscr X\).
The linear Cauchy and Duhamel maps are denoted by \(H,\mathscr D_0\).
They use \(L=\operatorname{div}_D(P_0D)\) and the assessed completion
of the smooth estimates of E41. In particular \(\mathscr D_0\)
has strong zero trace on the completed source spaces.
[E41 (1)][e41] · [E42 (1)–(7)][e42] · [Completed-space assessment][a42].

There are a single smaller \(\epsilon>0\) and \(C<\infty\) such
that for every \(\|u\|_\infty<\epsilon\), and in particular
for smooth \(u\), one has
\[
 \begin{split}
 \sup_{0<t\le T/4}\ \sum_{k=0}^2 t^{k/2}
                  \|D^k\mathsf S(u)(t)\|_\infty
    &\le C\|u\|_\infty,\\
 \sup_{0<t\le T/4}\ \sum_{k=0}^2 t^{k/2}
       \|D^k\big(\mathsf S(u)-D_u\mathsf S(0)[u]\big)(t)\|_\infty
    &\le C\|u\|_\infty^2 .
 \end{split}                                                     \tag{1}
\]
Here \(D^2\) is the full ordered spatial Hessian for the fixed
bundle connection and the fixed Levi–Civita connection on
covector slots. Constants use only the fixed construction.

## The scale-local lift and its action on the spaces

Take the fixed finite spanning fields \(V_i\) of E42.
For a finite parameter \(z=(z_i)\), let \(\varphi_z\) be the
time-one flow of \(V_z=\sum_i z_iV_i\), and let
\(M_z(x):\mathcal W_{\varphi_z(x)}\to\mathcal W_x\)
be fixed-connection parallel transport back along that path.
For every \(0<r\le\sqrt{T/4}\), put
\[
 z(t)=r\eta(t/r^2)s,\qquad
 \mathcal T_{r,s}U(t,x)=M_{z(t)}(x)U(t,\varphi_{z(t)}(x)).
 \tag{2}
\]
Here \(\eta\) is smooth with compact support in \((1/2,2)\)
and equals one near 1. This is the requested lift of
\(\sum_i s_i V_i\) with time \(r\eta(t/r^2)\).
Its possible nonidentity band is
\(\mathcal I_r=[r^2/2,2r^2]\). It is the identity near
time zero and near \(T\). On one fixed small \(z\)-ball,
the flow, inverse spatial Jacobian, and transport are
smooth, with uniform finite-order spatial and parameter
bounds in fixed charts. These follow from the smooth
finite-dimensional flow and transport on compact sets.
At \(z=0\) the lift is the identity, so differences from
its identity coefficients are \(O(|z|)\) with the same
conclusion for any fixed finite number of spatial derivatives.

Use \(\ell\) for a cylinder radius in (3) of E42.
For \(t\le\ell^2\), either the lift is the identity or
\(\ell^2\ge r^2/2\). In the latter case its displacement is
at most \(Cr|s|\le C'\ell\). Thus images of \(B_\ell(x)\)
are contained in \(B_{C''\ell}(x)\), covered by a
uniformly bounded number of fixed-metric \(\ell\)-balls.
This holds for every time in the upper slab and tent, with
one cover for the full cylinder, and their time intervals
are unchanged. The fixed-density Jacobian is bounded
above and below. These facts give uniform \(Y\) and \(Z\)
bounds for composition by \(\varphi_{z(t)}\) followed by
any of the value, fiber or flux transports here. Multiplying
by uniformly bounded matrices preserves those bounds.
The derivative of \(\mathcal T_{r,s}U\) is the transported
\((DU)\circ\varphi_z\) composed with \(D_x\varphi_z\)
plus a bounded multiplier on the transported value.
The second term contributes at most \(C\sqrt T\|U\|_\infty\)
to \(Z\), by E42 (4). Hence
\[
 \|\mathcal T_{r,s}U\|_{\mathscr X}\le C_X\|U\|_{\mathscr X}
 \tag{3}
\]
uniformly in \(r\) and in the fixed small \(s\)-ball. The
source transports and the lift map smooth closed-cylinder
sections to smooth closed-cylinder sections for every fixed
\(r>0\). Thus the uniform bounds extend to the completions by
density. No convergence of the time derivatives of the lifts
as \(r\downarrow0\) is used. [E42 (3)–(4)][e42].

## Divergence, principal array and band speed

Compute first on smooth test sections. Write \(y=\varphi_z(x)\),
\(J^i{}_j=\partial_{x^j}\varphi_z^i\), and \(m_z\) for the
ratio of pulled-back to fixed density. In local coordinate
frames with fixed density \(\mu(x)\,dx\), this is
\(m_z(x)=\mu(y)\det J/\mu(x)\). If \(w^i\) is a flux, put
\[
 (\Pi_z w)^j=M_z(J^{-1})^j{}_i\,w^i(y).
\]
The coordinate change formula for divergence, first with
the pulled-back density \(\mu m_z\,dx\), gives
\[
 \mathcal T_z(\operatorname{div}_D w)
     =\operatorname{div}_D(\Pi_z w)+B_{z,j}(\Pi_z w)^j.              \tag{4}
\]
Indeed, in fixed frame coefficients \(\gamma_i\) for \(D\),
\(B_{z,j}\) is the sum of
\[
 \partial_j\log m_z,\qquad M_z\partial_j M_z^{-1},\qquad
 M_z\gamma_i(y)M_z^{-1}J^i{}_j-\gamma_j(x).
\]
The scalar term acts by identity. To check the density term,
before differentiating \(M_z\) the coordinate divergence is
\((\mu m_z)^{-1}\partial_j((\mu m_z)(J^{-1})^j{}_i w^i\circ
\varphi_z)\). Moving \(M_z\) inside the derivative gives the
displayed frame term. Replacing the pulled-back density
by the fixed one adds \(\partial_j\log m_z\).
All these coefficients are smooth and \(O(|z|)\), vanish
at \(z=0\), and agree with the intrinsic connection calculation
on overlaps.

If \(V=\mathcal T_z U\), the exact gradient identity is
\[
 D_j V=M_z(D_iU)(y)J^i{}_j+C_{z,j}V,\qquad
 C_{z,j}=(\partial_jM_z)M_z^{-1}+\gamma_j(x)
           -M_z\gamma_i(y)M_z^{-1}J^i{}_j.                         \tag{5}
\]
Thus \(C_z=O(|z|)\) and the transformed principal flux is
\(\widetilde P_z(x,V)(DV-C_zV)\), where \(\widetilde P_z\)
uses both inverse spatial Jacobian factors on \(P(y,M_z^{-1}V)\)
and the conjugation by \(M_z\) on the fiber. In particular
\(\widetilde P_0(x,V)=P(x,V)\).
Subtracting the same fixed principal \(L\), the new divergence
source is
\[
 q_{r,s}(V)=(\widetilde P_z(x,V)-P_0(x))DV
                      -\widetilde P_z(x,V)C_zV .                  \tag{6}
\]
Keeping the final term in divergence form avoids a new derivative
on it in the source norm. The spatial value source is (4)'s
zero-order term applied to the transformed flux, plus the
transported \(h_0,h_1,h_2\) of E42 with (5) inserted.
It has degree at most two in \(DV\). Its coefficients and
those of (6) are uniformly smooth in \((z,x,V)\) inside
the fixed value tube. Their differences from the coefficients
at \(z=0\), with any fixed finite order of value derivatives,
are \(O(|z|)\). The cutoff stays the E42 cutoff, transported
in these expressions. The fiber transport preserves \(|V|\),
and all fixed points remain in the smaller agreement region.

Differentiating the lift in time adds to the value source
\[
 \dot z^i(t)\bigl(b_i(z,x)DV+c_i(z,x)V\bigr),\qquad
 \dot z^i(t)=r^{-1}\eta'(t/r^2)s_i.                                \tag{7}
\]
Here \(b_i\) comes from multiplying \(\partial_{z_i}\varphi_z\)
by \(J^{-1}\), with (5) used to convert to \(DV\);
\(c_i\) also includes the derivative of \(M_z\).
These arrays are smooth uniformly bounded coefficients on the
fixed parameter ball. This identity follows by the chain rule
at fixed \((t,x)\), differentiating the point \(y\) and
the transport separately. For instance in local frames the
derivative of the transport with respect to \(z_i\) combines
with the old \(\gamma(y)\) term and the \(C_zV\) term in (5),
so it acts by a smooth zero-order endomorphism. No derivative
of \(\dot z\) occurs in (4)–(7).

For a coefficient array \(m(t,x)\) with
\(|m|\le M r^{-1}\mathbf1_{\mathcal I_r}(t)\), the exact
norms give
\[
                   Z(m)\le C M,\qquad Y(m)\le C M r.              \tag{8}
\]
For the upper slab \(t\in[\ell^2/2,\ell^2]\), a nonempty
intersection with \(\mathcal I_r\) requires
\(r/\sqrt2\le\ell\le2r\). The integrated spatial volume
is at most \(C\ell^4\) and the time interval at most \(\ell^2\).
The upper terms thus cost at most \(CM\ell/r\) in \(Z\)
and \(CM\ell^2/r\) in \(Y\), giving (8). For tents,
\(\ell<r/\sqrt2\) gives zero. In the comparable and larger
cases their intersection length is at most
\(\min(\ell^2,2r^2)\). After cancellation of \(\ell^4\)
against \(\ell^{-4}\), the squared tent contribution to
\(Z\) is at most \(CM^2r^{-2}\min(\ell^2,2r^2)\).
The \(Y\) tent term is at most
\(CM r^{-1}\min(\ell^2,2r^2)\). This also covers the larger
tents whose upper slabs miss the band.

For the drift in (7), Hölder on the upper slab gives the product
of the two \(\ell(\ell^{-6}\int|\cdot|^p)^{1/p}\) factors
for \(m,DV\). On the tent Cauchy–Schwarz gives the product
of the two \((\ell^{-4}\int|\cdot|^2)^{1/2}\) factors.
Thus its \(Y\) norm is at most \(CZ(m)Z(DV)\).
The value term instead costs \(CY(m)\|V\|_\infty\).
In (7) take \(M=C|s|\), yielding a uniform source
Lipschitz constant \(C|s|\) on \(\mathscr X\).
For every fixed nonzero order of \(s\)-derivatives of the
speed coefficients the same bounds use \(M=C_\alpha\).
Indeed \(\partial_sz=r\eta(t/r^2)I\), \(\dot z\) is
linear in \(s\), and all finite derivatives of \(b_i,c_i\)
in \(z\) are fixed. All such coefficients are smooth on
the closed cylinder for each \(r>0\), so the products act
on the completed spaces by the same estimates.

Let \(f_{r,s}\) be the combined spatial and speed value
source. By E42 (4) applied to the regular terms of (6)
and the regular value terms, the differences from the
untransformed sources have Lipschitz constants at most
\(C\sup_t|z(t)|\le Cr|s|\) on the radius-\(R\) ball.
For example the terms with one \(DV\) use \(Z\) in a flux
or \(Y(DV)\le C\sqrt T Z(DV)\) in a value term, and the
quadratic terms use \(Y(DV\,DV)\le CZ(DV)^2\).
The derivative-free flux term uses
\(Z(k)\le C\sqrt T\|k\|_\infty\). Its coefficient and its
value derivatives have the \(O(|z|)\) factor from \(C_z\).
Together with (8) this gives a total added Lipschitz
constant \(C|s|\) in the sum of the two source norms,
independent of \(r\). The stationary reference gives
\(h_0(x,0)=0\). Equations (6)–(7) therefore give zero
source at \(V=0\) in each transformed equation. In
particular the source size difference is at most
\(C|s|\|V\|_{\mathscr X}\).
[E42 (4)–(5), stationarity and transformation][e42].

## Uniform fixed points and mixed derivatives

At each fixed \(r\) put
\[
 \Phi_r(s,u,V)=H u+\mathscr D_0\big(f_{r,s}(V),q_{r,s}(V)\big).
\]
Let \(A\) be the fixed linear estimate constant and \(\vartheta\)
the untransformed contraction constant on the original radius-\(R\)
ball. Since \(\vartheta<1\) has the margin in E42 (6), fix
a uniform \(s\)-radius so that
\(\vartheta+AC|s|\le\vartheta_*<1/2\).
Then shrink the datum radius inside E42's radius so
\(A\epsilon\le R/4\) and
\(C_X A\epsilon/(1-\vartheta)\le R/4\).
The map contracts on the original radius-\(R\) ball and its
fixed point lies in its interior with a uniform margin.
The datum enters through the unchanged \(H u\) because the
lift is the identity at zero time. For \(u=0\) the centered
fixed point is zero for every \(r,s\).

For smooth test sections the transformed residual is exactly
the lift of the original residual by (4)–(7). Approximate
an \(X_T^\circ\) section by smooth closed-cylinder sections.
The bounded lift and the source estimates give convergence
of the transformed quantities in the completed norms and
hence in distributions. For each fixed \(r,s\), pullback is
continuous on distributions under the smooth spacetime
diffeomorphism preserving time, followed by smooth fiber
transport. The residual identity extends to this limit.
The initial trace is unchanged, and (3) and the datum
choice keep \(\mathcal T_{r,s}\mathsf S(u)\) in the ball.
E42's distributional-to-mild identification uses uniqueness
for the same \(L\) at zero trace and applies with the
transformed terms as sources. Thus the fixed point satisfies
\[
 \Psi_r(s,u)=\mathcal T_{r,s}\mathsf S(u),\qquad \Psi_r(s,0)=0 .
 \tag{9}
\]
[E42 (2), (7)–(8) and transformed uniqueness][e42].

Every mixed \(\partial_s^\alpha D_V^j\) derivative through
total order four of the source maps is bounded in operator
norm on the fixed balls, uniformly in \(r\). For the regular
terms this follows from their fixed smooth coefficient bounds
and the relation \(z=r\eta s\). Differentiation in \(V\)
inserts either bounded values or a first derivative of a
direction. It leaves at most one first derivative factor in
a flux term and at most two in a value term. E42 (4), also
applied componentwise to the multilinear derivatives, bounds
these products. The differentiated versions of (7) are
bounded by (8) and are linear in \(V\). The same argument
with any additional finite order gives the Taylor estimates
in these Banach spaces proving smoothness for fixed \(r\).
Smooth density gives the completed-space multilinear maps
and the remainder bounds. Derivatives of \(H u\) are
bounded by \(A\) in its one nonzero order.

The operator \(I-D_V\Phi_r(s,u,\Psi_r)\) has Neumann inverse
of norm at most \((1-\vartheta_*)^{-1}\).
First differentiation of the fixed-point equation uses this
inverse on the partial derivatives of \(\Phi_r\).
At order \(m=2,3,4\), the chain rule gives a single highest
derivative of \(\Psi_r\) multiplied by \(D_V\Phi_r\).
All remaining terms are finite products or compositions of
derivatives of \(\Phi_r\) through order \(m\) and derivatives of
\(\Psi_r\) of orders below \(m\). Moving the highest term
and applying the same inverse proves by induction
\[
 \|\partial_s^\alpha D_u^j\Psi_r(s,u)\|_{\mathrm{op},\mathscr X}
     \le C_{\alpha,j},\qquad |\alpha|+j\le4,\quad |\alpha|+j\ge1 .
 \tag{10}
\]
The differentiability can be obtained as in E42 by difference
quotients and inversion, or by the Banach implicit function
theorem at each fixed \(r\). The bounds above are all uniform
on one common open pair of parameter and datum balls.
They do not require compactness of an infinite-dimensional
datum ball or any continuity at \(r=0\).
[E42, implicit derivatives][e42] · [E63 (4)–(5)][e63].

## Weighted jets and Taylor subtraction

Let \(W(u)=D_u\mathsf S(0)[u]\in\mathscr X\), the
untransformed derivative. By (9) and bounded linearity
of the lift for fixed \(r,s\),
\(D_u\Psi_r(s,0)[u]=\mathcal T_{r,s}W(u)\).
This derivative solves the full linearization, namely
\[
 \partial_t W=L W+h_1(x,0)DW+(D_Uh_0)(x,0)W,\qquad W(0)=u.
 \tag{11}
\]
The flux correction of the untransformed equation is quadratic
at zero, so its first derivative vanishes. Equation (11) follows
by differentiating the untransformed mild identity in
\(\mathscr X\), with the common trace. In particular the
Taylor subtraction uses every linear lower term.

For each fixed \(t=r^2\), the spatial sections
\(\mathsf S(u)(t)\) and \(W(u)(t)\) can be read from the
smooth parameter functions in (9) and its datum derivative:
evaluation at \((r^2,x)\) is bounded on \(\mathscr X\), and
\(s\mapsto\varphi_{rs}(x)\) has derivative
\(r(a\mapsto V_a(x))\) at zero. It is locally invertible on
a four-dimensional complement to its kernel. Inverting it
locally and undoing smooth transport gives the needed
spatial smoothness of both sections at each fixed \(r^2\).
Uniform estimates can be extracted directly at \(s=0\).

For any spatial section \(Z_0\), the parameter directional
derivatives of \(\mathcal T_{r,s}Z_0\) at \(t=r^2,s=0\)
are \(rD_{V_a}Z_0\) and \(r^2D_{V_a}D_{V_a}Z_0\) in
direction \(a\), because \(\eta(1)=1\) and parallel transport
along the fixed flow identifies these covariant derivatives.
The map \(a\mapsto V_a(x)\) has a right inverse of uniformly
bounded norm, for example its adjoint times the inverse of
its product with that adjoint, by spanning and compactness.
For a unit \(X\in T_xS^4\) take the resulting fixed parameter
\(a\) with \(V_a(x)=X\). Then
\[
 D_{V_a}D_{V_a}Z_0
     =(D^2 Z_0)(V_a,V_a)+D_{\nabla^0_{V_a}V_a}Z_0 ,
\]
where \(\nabla^0\) is the fixed Levi–Civita connection.
The last field has pointwise bound \(C|a|^2\) from the
fixed spanning fields. Thus its weighted cost is controlled
by the first-derivative bound, since \(r\le1\).
Polarization recovers the symmetric part of \(D^2 Z_0\).
The antisymmetric part is controlled by the fixed curvature
action on \(Z_0\), using torsion-freeness on base slots.
Consequently a uniform bound for the value and two parameter
derivatives of the lifted section bounds
\(\sum_{k=0}^2r^k\|D^k Z_0\|_\infty\), uniformly in \(x,r\).
This uses the full Hessian, including its ordered slots.
[E63, fixed transport and local inverse][e63].

For \(|\alpha|\le2\), (10) and \(\Psi_r(s,0)=0\)
give \(\|\partial_s^\alpha\Psi_r(s,u)\|_{\mathscr X}
\le C\|u\|_\infty\) by integration along the datum segment.
Taylor's integral formula with the mixed derivatives
\(\partial_s^\alpha D_u^2\Psi_r\) gives
\[
 \big\|\partial_s^\alpha\big(\Psi_r(s,u)
                  -D_u\Psi_r(s,0)[u]\big)\big\|_{\mathscr X}
      \le C\|u\|_\infty^2
 \quad (|\alpha|\le2).                                            \tag{12}
\]
Apply the jet comparison to these two lifted sections at
\(s=0,t=r^2\). Taking the supremum over
\(0<r\le\sqrt{T/4}\) proves both bounds (1) on one fixed ball.
For originally compatible input, this is the very E42 path whose
curvature compatibility is proved there. Equation (9) identifies
the auxiliary fixed points by exact conjugation of the independent
system. No additional graph premise on a transformed pair is used.
This is a local adjusted-pair estimate. No recovery or
nonlinear multiscale trajectory estimate is part of E119.

[req]: ../research-progress/handoffs/SP4-CME-E119_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E119_RETURN_v1.md
[b63]: ../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[e41]: 41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e63]: 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[a42]: ../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
