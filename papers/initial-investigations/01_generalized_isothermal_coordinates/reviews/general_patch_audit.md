# General wave family twistor patch and splitting audit

This is an internal mathematical derivation for the manuscript. The construction works for every holomorphic germ H(u,z), with two bounded direction patches and a sufficiently small spacetime neighborhood. In particular, the full direction-fiber splitting need not be restricted to the quadratic example.

## Intrinsic metric class

The ansatz covers exactly, locally and after orientation choice, the holomorphic metrics admitting two linearly independent parallel vector fields V1,V2 whose span is totally null. It is essential to require the two vectors themselves parallel; a parallel null-plane distribution alone is weaker.

Proof: the dual one-forms g(V1,·),g(V2,·) are independent and closed, so write them du,dz. They annihilate both V1,V2. Parallel vector fields commute, so choose their flow coordinates v,w, with V1=∂v,V2=∂w and quotient coordinates u,z. Parallel vector fields are Killing, hence all metric coefficients are independent of v,w. The dual-form identities imply

\[
g=2du\,dv+2dz\,dw+A(u,z)du^2+2C(u,z)du\,dz+B(u,z)dz^2.
\]

Set v'=v+F(u,z), w'=w+G(u,z). The new coefficients of du²,2du dz,dz² are respectively A−2F_u, C−F_z−G_u, B−2G_z. Integrating the holomorphic equations G_z=B/2 and then F_z=C−G_u eliminates the last two coefficients and gives the ansatz with H=A−2F_u. Conversely, ∂v and ∂w are parallel and totally null for every g_H, as follows directly from the constant v,w rows of the metric and its independence of v,w.

The equivalent local restricted-holonomy condition is containment, after a spin-frame choice, in exp(CN) in one SL(2,C) factor and identity in the other. Indeed, the subgroup of SO(4,C) fixing a maximal null plane pointwise consists, in a null basis, of matrices [[I,B],[0,I]] with B antisymmetric 2×2, and is one-dimensional unipotent. Its spin lift is the stated subgroup. Conversely, the fixed tangent subspace of this spin subgroup is two-dimensional and totally null; on a simply connected neighborhood, holonomy invariance extends its basis to two parallel vector fields. The flat case is included. For a nonflat connected local germ the restricted holonomy is the nontrivial one-dimensional group.

Thus the manuscript's constructive theorem can cover an intrinsic special-holonomy class, while the actual transfer still depends on the chosen parallel null frame and adapted coordinates.

## Definitions and domain control

Fix R>1, and use direction patches |ζ|<R and |μ|<R, μ=ζ^{-1}. Suppose H is holomorphic in a bidisc |u|<r, |z|<r. Define

\[
J(u,z,\zeta)=\frac12\int_0^u H(t,z+\zeta(t-u))\,dt,
\]

and

\[
I(u,z,\mu)=\frac{\mu^2}{2}\int_0^z H(u+\mu(t-z),t)\,dt.
\]

The integrals mean the radial complex segments t=su or t=sz, 0≤s≤1. Thus the first is u/2 times an integral over a fixed real interval of a holomorphic integrand, and similarly for the second. They are holomorphic whenever the arguments of H stay in its bidisc. For |u|,|z|<δ and either direction coordinate bounded by R, it is enough that (1+R)δ<r. All subsequent constructions are germs near u=z=v=w=0 and may shrink these domains further.

The transport equations are

\[
J_u+\zeta J_z=\frac12H(u,z),
\qquad
I_z+\mu I_u=\frac{\mu^2}{2}H(u,z).
\tag{1}
\]

For J, p=z−ζu remains constant along ∂u+ζ∂z, so differentiating the upper endpoint gives the identity. The second follows with u−μz constant along ∂z+μ∂u.

## The two twistor charts

The alpha fields are

\[
L_0=\partial_u-\frac12H\partial_v+\zeta\partial_z,
\qquad L_1=-\partial_w+\zeta\partial_v.
\]

They commute because H depends only on u,z. Their first integrals in the northern chart are

\[
\zeta,\qquad p=z-\zeta u,\qquad q=v+\zeta w+J.
\tag{2}
\]

In the southern chart use the regular spanning fields μL0, μL1, and first integrals

\[
\mu,\qquad P=\mu z-u,\qquad Q=w+\mu v+I.
\tag{3}
\]

Their differentials have rank three: at fixed direction p_z=1,q_v=1 in the north; P_u=−1,Q_w=1 in the south. They therefore provide local quotient charts for the alpha distribution.

On the overlap,

\[
P=p/\zeta,\qquad Q=q/\zeta+T(p,\zeta),
\tag{4}
\]

where

\[
T(p,\zeta)=\frac1{2\zeta^2}
\int_0^p H((t-p)/\zeta,t)\,dt.
\tag{5}
\]

Indeed, changing variable t=p+ζs in ζ^{-1}J gives

\[
\mu J=\frac{\mu^2}{2}\int_p^z H(\mu(t-p),t)\,dt,
\quad
I=\frac{\mu^2}{2}\int_0^z H(\mu(t-p),t)\,dt.
\]

Their difference is T. Equality follows initially in a convex small domain where the contours can be deformed inside H's domain, then by holomorphic continuation. On the overlap annulus R^{-1}<|ζ|<R, formula (5) is holomorphic for sufficiently small |p|. For example require |p|<ε with Rε<r, and subsequently δ(1+R)<ε. The coordinate transition is invertible because P=p/ζ and q occurs linearly in Q with nonzero coefficient.

These two charts glue to a germ of a twistor threefold Z near the zero twistor line. The projection ρ:Z→CP1 has affine fibers in the second vertical coordinate. Both Z and the flat twistor space project to

\[
B=\operatorname{Tot}\mathcal O(1),
\]

using (ζ,p) and (μ,P). The fact that T is independent of q is crucial.

## The derivative cocycle and its splitting

Let N be the matrix with N_{21}=1 and other entries zero, so N²=0. Differentiating (4) vertically yields

\[
\frac{\partial(P,Q)}{\partial(p,q)}
=\zeta^{-1}\bigl(I_2+\beta(p,\zeta)N\bigr),
\qquad \beta=\zeta T_p.
\tag{6}
\]

Thus E=T_vert Z⊗ρ*O(−1) has component transition g=I_2+βN. Since β is independent of q, E is the pullback of a rank-two bundle E_B on B. Pulling E_B back to flat twistor space defines the flat Ward bundle without a global map from Z to flat twistor space.

Along the curved line associated with x=(u,v,z,w), equation (4) reads

\[
T(z-\zeta u,\zeta)=I(u,z,\mu)-\mu J(u,z,\zeta).
\]

Differentiate with respect to z, holding u and ζ fixed, then use (1):

\[
\beta=\zeta T_p=\zeta I_z-J_z
=\frac\mu2H-I_u-J_z.
\tag{7}
\]

Define

\[
h_0=-J_z,
\qquad
h_\infty=I_u-\frac\mu2H.
\tag{8}
\]

Both are holomorphic on their complete respective direction discs; in particular h∞ is regular and vanishes at μ=0. Equation (7) is β=h0−h∞. Consequently

\[
g=(I_2+h_\infty N)^{-1}(I_2+h_0N).
\tag{9}
\]

Both factors are invertible everywhere, with determinant one, because N²=0. This is a holomorphic splitting over every complete projective direction fiber, not merely a Laurent-series factorization on an affine patch.

## Normal bundle and completeness

Every curve L_x given by (2)–(3) is a section of ρ, so its normal bundle is canonically isomorphic to T_vert Z restricted to L_x. The split bundle E|L_x is trivial by (9). Therefore

\[
N_{L_x/Z}\simeq\mathcal O(1)\oplus\mathcal O(1).
\tag{10}
\]

The four parameters form a complete local family. To see this, consider its Kodaira–Spencer map. If the associated infinitesimal normal section vanishes, then δp=δz−ζδu vanishes identically, hence δu=δz=0. Then δq=δv+ζδw vanishes identically, hence δv=δw=0. Thus the map from the four-dimensional parameter tangent space is injective. Since h0(N)=4, it is an isomorphism. Standard local deformation theory then gives completeness; the family and its normal bundle have already been constructed explicitly.

The conformal structure can be recovered directly from incidence. A deformation has a zero at finite ζ precisely when

\[
\delta z=\zeta\delta u,
\qquad
\delta v+\zeta\delta w+
(J_u+\zeta J_z)\delta u=0.
\]

Using (1) and eliminating ζ yields

\[
2\delta u\delta v+2\delta z\delta w+H\delta u^2=0.
\tag{11}
\]

The southern chart covers the missing case at ζ=∞. Equivalently, the determinant of the two homogeneous linear equations gives (11) without division by δu. Thus the twistor family recovers exactly the conformal class of g_H.

## Ward connection on the flat base

Let flat coordinates be (a,b,c,d), with twistor lines p=a+ζb, q=c+ζd. In (8), substitute u=−b,z=a:

\[
h_0(y,\zeta)=-J_z(-b,a,\zeta),
\quad
h_\infty(y,\mu)=I_u(-b,a,\mu)-\frac\mu2H(-b,a).
\tag{12}
\]

These split the same β(a+ζb,ζ). For flat alpha fields

\[
K_0=\partial_b-\zeta\partial_a,
\qquad K_1=\partial_d-\zeta\partial_c,
\]

one obtains

\[
K_0h_0=\frac12H_z(-b,a),\qquad K_1h_0=0.
\]

The same equations hold for h∞: β is annihilated by both K_A, so apply K_A to β=h0−h∞. The formula for K0h0 follows by differentiating J_u+ζJ_z=H/2 in z. Define Ψ_i=I_2+h_iN. Then

\[
(K_A+A(K_A))\Psi_i=0
\]

for the ordinary connection

\[
A_H=-\frac12H_z(-b,a)\,db\,N.
\tag{13}
\]

Component convention: if s∞=g s0, common spacetime components are s=Ψ0s0=Ψ∞s∞, consistent with g=Ψ∞^{-1}Ψ0. The component evaluation matrices H_i=Ψ_i^{-1}=I_2−h_iN satisfy H∞=gH0; their logarithmic derivatives give A(K_A)=H_i^{-1}K_AH_i. This fixes all signs.

Since A∧A=0,

\[
F_{A_H}=-\frac12H_{zz}(-b,a)\,da\wedge db\,N.
\tag{14}
\]

It vanishes on every flat alpha plane. The operators D_A=K_A+A(K_A) have exactly the desired homogeneous degree-one form for π^{A'}=(−ζ,1), and are holomorphic over the entire direction sphere. The southern representatives are μD_A.

For completeness, the same splitting reconstructs the original spin connection on the curved base. Since L0h0=−H_z/2 and L1h0=0, the parallel-frame equation gives Γ(L0)=H_zN/2, Γ(L1)=0, which is the restriction of Γ=H_z du N/2.

## Relation to the Shaw chart

Using the curve and its ζ derivative gives

\[
a=z,\quad b=-u,\quad
c=v+J-\zeta J_\zeta,\quad d=w+J_\zeta.
\tag{15}
\]

The last two equations are affine in v,w, so (15), together with ζ unchanged, is locally invertible on its stated direction patch. Its inverse has u=−b,z=a. Consequently direct transport of Γ in the source spin frame gives exactly (13). The Ward reconstruction and direct transport therefore agree, with no guess about fiber triviality needed.

Since differentiating (1) in ζ gives L0Jζ=−Jz, direct pushforward yields

\[
f_*L_0=-K_0-J_zK_1,
\qquad f_*L_1=-K_1.
\tag{16}
\]

This proves preservation of the alpha distributions. The map's restriction to a source direction fiber is a flat null curve: a,b are constant and only c,d vary, so its tangent is null for 2(da dd−db dc).

The tangent-spinor matrix is T=−I_2−J_zN. It may be regular on one direction patch but generally does not extend over the complete sphere. In that frame the partial connection is zero because L0Jz=H_z/2. This does not make the globally reconstructed ordinary connection flat: the transformation is direction dependent and does not preserve the chosen regular holomorphic extension.

## Quadratic example and limitations

For H=z²,

\[
J=\tfrac12uz^2-\tfrac12\zeta u^2z+\tfrac16\zeta^2u^3,
\quad I=\tfrac16\mu^2z^3,
\quad T=p^3/(6\zeta^2).
\]

Equations (8) give h0=−uz+ζu²/2 and h∞=−μz²/2, matching the earlier computation. The general formulas show that this is the simplest case of a full wave-family construction.

The proof establishes a bundle transfer relative to the specified wave presentation and common surface B, not a canonical construction on every ASD manifold. It reconstructs the original conformal metric from the full twistor family and the metric profile from A_H in the fixed ansatz/gauge (up to a removable function of u). It does not prove a gauge-invariant inverse from arbitrary flat ASD connections, regular global identification with flat tangent spinors, or classification by holonomy alone.
