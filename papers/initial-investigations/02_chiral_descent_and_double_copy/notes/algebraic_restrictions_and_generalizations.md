# Algebraic restrictions and possible generalizations of the wave construction

21 November 2026

The wave construction belongs to a natural but restrictive sector of holomorphic vacuum gravity. Two different Lie algebras become abelian: the matrix algebra actually used by the connection, and the algebra of Hamiltonian shears used to glue twistor charts. These restrictions explain the explicit factorization and the common-surface transfer. They do not invalidate a classical double copy; they limit what this family can establish about interactions and about a general geometric correspondence.

The calculations below distinguish the manuscript's established construction, direct consequences of its formulas, and possible extensions. The source manuscript is [Generalized isothermal coordinates and chiral connection descent](../../01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex). All coordinates, functions, and bundles are holomorphic and local unless otherwise stated. ASD means anti-self-dual, with the chirality convention of the manuscript. References sometimes interchange the words self-dual and anti-self-dual by choosing the opposite orientation.

**The matrix algebra used by the connection is one-dimensional and abelian.** Let \(u,v,z,w\) be the source spacetime coordinates, let \(H(u,z)\) be the arbitrary metric profile, and let a subscript on a function denote a partial derivative. The metric and its unprimed spin connection are

\[
g_H=2\,du\,dv+2\,dz\,dw+H\,du^2,
\qquad
\gamma=\frac12H_z\,du\,N,
\qquad
N=\begin{pmatrix}0&0\\1&0\end{pmatrix}.
\]

Here \(\gamma\) is a matrix-valued one-form and \(N\) is a fixed matrix. After the manuscript's correspondence-space construction, the flat connection is

\[
A_H=-\frac12H_z(-b,a)\,db\,N,
\]

where \(a,b,c,d\) are coordinates on the auxiliary flat spacetime with metric \(2(da\,dd-db\,dc)\).

The ambient Lie algebra is \(\mathfrak{sl}(2,\mathbb C)\), the traceless complex \(2\times2\) matrices with bracket \([X,Y]=XY-YX\). It is a simple Lie algebra in the technical sense. The construction uses only its subalgebra

\[
\mathfrak n=\{sN:s\in\mathbb C\},
\qquad [sN,tN]=0\quad(s,t\in\mathbb C).
\]

Thus “simple” in the earlier discussion meant elementary or reduced, not a simple Lie algebra. The precise adjective is abelian. Allowing scalar coefficients to vary over spacetime gives an infinite-dimensional space of fields, but their pointwise color brackets still vanish.

For any scalar one-form \(\alpha\), a connection \(A=\alpha N\) has curvature \(F_A=dA+A\wedge A=d\alpha\,N\). Abelianity does not imply zero curvature. In this manuscript,

\[
F_{A_H}=-\frac12H_{zz}(-b,a)\,da\wedge db\,N.
\]

The separate matrix identity \(N^2=0\), called nilpotency, explains the finite formulas

\[
\exp(hN)=I+hN,
\qquad
(I+hN)^{-1}=I-hN,
\]

where \(h\) is a scalar function and \(I\) is the identity matrix. A fixed generator need not be nilpotent for its one-dimensional Lie algebra to be abelian. In the particular ansatz \(A=a_0\,du\,N\), where \(a_0\) is a scalar coefficient, \(A\wedge A=0\) also follows from \(du\wedge du=0\).

**The overlap Hamiltonian describes a second, different abelian algebra.** The twistor space has a projection to the projective line \(\mathbb{CP}^1\), the sphere of chiral directions. Choose a northern direction coordinate \(\zeta\), a southern coordinate \(\mu\), and \(\mu=1/\zeta\) on their overlap. Let \(p,q\) be the two remaining coordinates in the northern twistor chart, and \(P,Q\) their southern counterparts. They are twistor fiber coordinates, not spacetime coordinates or physical canonical momenta.

The manuscript glues the charts by

\[
P=\frac p\zeta,
\qquad
Q=\frac q\zeta+\mathcal T(p,\zeta).
\]

The scalar function \(\mathcal T\) is the shear in the transition. It depends on \(p\) and \(\zeta\) and is independent of \(q\). Put \(s(p,\zeta)=\zeta\mathcal T(p,\zeta)\). Removing the ordinary line-bundle scaling gives the map

\[
S_\zeta(p,q)=(p,q+s(p,\zeta)).
\]

At each fixed \(\zeta\), the fiber has symplectic form \(dp\wedge dq\). For scalar functions \(f,g\) on this fiber, define the vertical Poisson bracket by

\[
\{f,g\}_{\rm vert}=f_p g_q-f_q g_p.
\]

The word vertical means that only \(p,q\) are differentiated. The direction parameter \(\zeta\) is held fixed. In particular this is not a bracket on the spacetime variables \(u,z\).

A Hamiltonian is a scalar function \(K(p,q,\zeta)\) whose associated vector field is, with the chosen sign convention,

\[
X_K=\{K,\cdot\}_{\rm vert}
=-K_q\,\partial_p+K_p\,\partial_q.
\]

For the manuscript choose a local primitive satisfying

\[
K_q=0,
\qquad K_p=s=\zeta\mathcal T.
\]

Then \(X_K=s\partial_q\). Its flow leaves \(p\) fixed and translates \(q\); its time-one map is exactly \(S_\zeta\). Adding a function of \(\zeta\) to \(K\) changes no vector field. “Overlap Hamiltonian” refers to this local generator on the overlap annulus; it does not claim a global scalar Hamiltonian on the entire twistor space.

For any two allowed Hamiltonians \(K_1(p,\zeta)\) and \(K_2(p,\zeta)\),

\[
\{K_1,K_2\}_{\rm vert}=0,
\qquad [X_{K_1},X_{K_2}]=0.
\]

This is an infinite-dimensional commuting family, since the functions of \(p,\zeta\) are arbitrary within their holomorphic domains. It is different from the one-dimensional matrix algebra \(\mathfrak n\). The overlap maps can be nonlinear functions of coordinates while still commuting. Nonlinearity of a map, noncommutativity of a Lie algebra, and nonzero metric curvature are distinct properties.

**Differentiating the shear links these two reductions.** Write \(D\) for the Jacobian with respect to \(p,q\), holding \(\zeta\) fixed. The normalized derivative of the transition is

\[
G=\zeta\frac{\partial(P,Q)}{\partial(p,q)}
=DS_\zeta
=\begin{pmatrix}1&0\\s_p&1\end{pmatrix}
=I+\beta N,
\qquad \beta=s_p=\zeta\mathcal T_p=K_{pp}.
\]

The manuscript uses \(G\) as the bundle transition matrix. If its scalar coefficient splits along a twistor line as \(\beta=h_0-h_\infty\), where \(h_0\) is holomorphic on the northern disc and \(h_\infty\) on the southern disc, then

\[
G=(I+h_\infty N)^{-1}(I+h_0N).
\]

This reduces a matrix factorization problem to additive splitting of a scalar function. The manuscript additionally supplies explicit holomorphic formulas for both factors on complete direction patches.

**The same restriction enables the common-surface transfer.** Define \(B\) to be the two-complex-dimensional space with charts \((p,\zeta)\) and \((P,\mu)\), glued by \(P=p/\zeta\), \(\mu=1/\zeta\). It is locally the total space of \(\mathcal O(1)\), the degree-one holomorphic line bundle over \(\mathbb{CP}^1\). The notation \(\mathcal O(n)\) means the degree-\(n\) line bundle.

Both curved and flat twistor spaces project to \(B\) by forgetting their second fiber coordinate. Since \(G\) is independent of \(q\), it defines a bundle on \(B\), and that bundle can be pulled back to either twistor space. This is a genuine geometric bridge between the two different base spaces.

There is a sharp constraint here. Keep \(P=p/\zeta\) and require the fiber symplectic scaling

\[
d_{\rm vert}P\wedge d_{\rm vert}Q
=\zeta^{-2}dp\wedge dq,
\]

where \(d_{\rm vert}\) differentiates only fiber coordinates. Substitution gives \(Q_q=1/\zeta\), hence necessarily

\[
Q=q/\zeta+\mathcal T(p,\zeta).
\]

Therefore, preserving this exact common projection and symplectic structure forces the shear form. One cannot add arbitrary \(q\)-dependence while retaining the same mechanism unchanged. A different quotient or additional structure might still be possible.

**General Hamiltonian gluing is natural, but its tangent action includes motion of the base point.** If \(K\) depends on both \(p,q\), both coordinates can move. For example, at a fixed direction let

\[
K_1=p^3/3,
\qquad K_2=q^3/3.
\]

Then

\[
X_{K_1}=p^2\partial_q,
\qquad X_{K_2}=-q^2\partial_p,
\qquad \{K_1,K_2\}_{\rm vert}=p^2q^2\ne0.
\]

These are local algebra examples. A complete twistor deformation must also have suitable holomorphic dependence on the direction, valid patch domains, and the required family of projective lines. Introducing \(q\)-dependence permits noncommutativity; it does not guarantee it, since other commuting subfamilies exist.

For general fiber maps \(\Phi,\Psi\) and a fiber point \(\xi=(p,q)\), the chain rule reads

\[
D(\Phi\circ\Psi)(\xi)
=D\Phi(\Psi(\xi))\,D\Psi(\xi).
\]

Thus the derivative construction transports the evaluation point as well as multiplying matrices. The Jacobians alone, with pointwise matrix commutator, do not reproduce the entire Hamiltonian Lie algebra. In the shear family all maps preserve \(p\), and all Jacobians depend only on \(p\), so this extra evaluation dependence disappears.

There is a standard broader gravitational setting: a twistor threefold fibering over \(\mathbb{CP}^1\), with a nondegenerate \(\mathcal O(2)\)-valued symplectic form on its two-dimensional fibers and a suitable four-parameter family of sections with normal bundle \(\mathcal O(1)\oplus\mathcal O(1)\). This is the holomorphic Ricci-flat ASD, or complex hyperkähler, setting. Compatible reality data are additional requirements for real metrics. The Hamiltonian description and its double-copy role are developed, in a supersymmetric twistor-action formulation, in [Borsten et al.](https://arxiv.org/abs/2307.10383).

On such a curved twistor space let \(\rho\) denote the projection to \(\mathbb{CP}^1\), and let \(T_{\rm vert}Z=\ker d\rho\) denote the bundle tangent to its fibers. The derivative bundle

\[
E=T_{\rm vert}Z\otimes\rho^*\mathcal O(-1)
\]

still restricts trivially to each such section: its restriction is the normal bundle tensored with \(\mathcal O(-1)\). This part is not restricted to the wave case. What requires a new argument is its transfer to flat twistor space with the desired relation to the original gravitational transport and geometry.

**Obtaining some auxiliary flat ASD connection is weaker than transporting the full source connection.** With two chosen twistor charts one can try reusing a general holomorphic invertible matrix transition \(G(p,q,\zeta)\) on the corresponding flat overlap. If the reference curved section is represented by \(p=q=0\), and its normalized derivative bundle is trivial there, the reused matrix is trivializable on the reference flat line. Triviality persists for nearby lines after shrinking under the usual holomorphic splitting hypotheses. The Ward construction then gives a local flat ASD connection.

This is a possible local, chart-dependent extension of the auxiliary-bundle construction. It does not by itself identify the result with the full pulled-back source spin connection, show invariance under changes of twistor coordinates, or provide an inverse recovering the source metric. Losing \(B\) therefore removes the manuscript's particular compatibility mechanism, not every possible way to manufacture flat Ward data.

There is also a direct necessary condition for literal full-connection transport. Let \(f^{-1}\) be a local inverse generalized chart from target correspondence space into source correspondence space, let \(y\) collectively denote its four flat spacetime coordinates, and write \(x(y,\zeta)\) for its source spacetime projection. Let \(R^S\) be the curvature two-form of the source chiral spin connection \(\gamma\). If the full pulled-back connection is gauge-equivalent to one from flat spacetime, its curvature must annihilate the target vertical vector \(\partial_\zeta\). Thus

\[
R^S_x(x_\zeta,\xi)=0
\quad\text{for every source tangent vector }\xi,
\qquad x_\zeta=\frac{\partial x}{\partial\zeta}\Big|_y.
\]

The quantifier over all \(\xi\) follows because the source spacetime projection of a correspondence-space local biholomorphism is a submersion. This condition is gauge-invariant: gauge transformations conjugate curvature and cannot remove a nonzero mixed curvature component.

In ordinary tensor notation, Ricci-flatness and this requirement use different contractions. Let \(R_{abcd}\) be the Riemann tensor with all indices lowered, let \(g^{ac}\) be the inverse metric, and let \(V\) be the specified tangent vector \(x_\zeta\). The indices \(a,b,c,d\) each range over the four spacetime coordinates, and repeated indices are summed. Then

\[
\operatorname{Ric}_{bd}=\sum_{a,c}g^{ac}R_{abcd}=0
\]

is a trace condition, whereas curvature nullity requires

\[
\sum_c V^c R_{abcd}=0
\quad\text{for every }a,b,d.
\]

Taking a trace loses information. A trace-free matrix can still have nonzero action on every nonzero vector; the same distinction separates the vanishing Ricci contraction from a kernel condition on the curvature.

For an explicit example within the manuscript, choose \(H=z^2\). Then \(\operatorname{Ric}=0\) and \(R_{uzuz}=-1\). If \(V=\partial_u\), its components satisfy \(V^u=1\) and the others vanish, so

\[
\sum_c V^cR_{uzcz}=R_{uzuz}=-1\ne0.
\]

The Ricci-flatness does not contradict this: for instance \(\operatorname{Ric}_{zz}=g^{uu}R_{uzuz}=0\), since this metric has \(g^{uu}=0\). Thus Ricci-flatness does not permit arbitrary direction-dependent motion of the chart. Its actual motion along \(\partial_v,\partial_w\) is essential.

Calling the nullity condition “stronger” requires qualification. For a single specified vector \(V\), curvature nullity implies \(\operatorname{Ric}(V,\cdot)=0\), but need not imply the entire Ricci tensor vanishes. In this discussion it is an additional condition within the already Ricci-flat class, not a global logical ordering of the two conditions on arbitrary metrics.

For the wave family, \(x_\zeta\) has only \(v,w\) components, whereas \(R^S=(H_{zz}/2)dz\wedge du\,N\). The condition holds exactly. Define the common curvature kernel at a source point by

\[
\mathcal K_x=\{t\in T_xM:R^S_x(t,\xi)=0\text{ for every }\xi\in T_xM\},
\]

where \(T_xM\) is the source tangent space. If \(\mathcal K_x=\{0\}\) throughout an open region, literal full-connection descent forces \(x_\zeta=0\). An alpha-plane-preserving generalized chart then covers a local spacetime map which preserves an open family of alpha planes, hence the conformal null cone. It would make the source conformally flat. For a nonflat Ricci-flat metric this is a contradiction.

This conditional obstruction is a direct deduction from curvature horizontality, rather than a theorem asserted in the current manuscript. It applies to the strong requirement of full connection pullback up to bundle gauge. It does not prohibit a different flat Ward connection, transport restricted to alpha directions, or a construction retaining additional geometric data. These alternatives must not silently be identified with the stronger requirement.

The condition has a sharper algebraic consequence in Ricci-flat ASD geometry. Let \(S,S'\) be its two rank-two spin bundles, so \(TM\cong S\otimes S'\). Unprimed indices \(A,B,C,D\) take two values and label \(S\); primed indices \(A',B'\) label \(S'\). Write \(\epsilon_{A'B'}\) for the nondegenerate antisymmetric form on \(S'\), and \(\Psi_{ABCD}\) for the totally symmetric spinor encoding the potentially nonzero Weyl curvature. After lowering the endomorphism index with the spin symplectic form, the chiral spin curvature has the form

\[
R^S_{AA'BB'CD}=\epsilon_{A'B'}\Psi_{ABCD}
\]

up to a convention-dependent constant which does not affect its kernel. A nonzero vector \(t^{AA'}\) in \(\mathcal K_x\) has a nonzero column \(\lambda^A\) satisfying \(\lambda^A\Psi_{ABCD}=0\). In a spin basis with \(\lambda\) as one basis vector, total symmetry forces every component containing that vector's index to vanish. Therefore

\[
\Psi_{ABCD}=\psi\,o_Ao_Bo_Co_D
\]

for a scalar \(\psi\) and a nonzero covector \(o_A\), or else \(\Psi=0\). The first nonzero form is called Petrov type N; the zero form is type O. Other nonzero algebraic types have zero common curvature kernel. That zero-kernel condition is open, so the preceding conformal-flatness contradiction applies on a neighborhood of any such point.

Consequently, under the alpha-preserving local-biholomorphism and full-connection-pullback assumptions, type N or O is necessary throughout the image. Completeness of the direction sphere is not needed for this local obstruction. Type N is only necessary: it does not imply the parallel-null-frame hypothesis or prove that the construction succeeds for every type N metric.

This corrects the earlier suggestion that Eguchi–Hanson should simply test the unchanged full-pullback prescription. Its nonzero Weyl spinor is type D, with two distinct double principal factors, as displayed in [Luna, Monteiro, Nicholson and O'Connell, section 5](https://arxiv.org/html/1810.08183v3#S5). Thus the literal full-pullback requirement is obstructed there. Eguchi–Hanson remains a useful test for a modified transfer and already has established double copies; those statements do not require equality with the entire pulled-back Levi–Civita spin connection. The obstruction above is our calculation under the stated assumptions, not a theorem being attributed to that paper.

**The wave family sits explicitly inside the heavenly equation.** Let \(\Theta(u,v,z,w)\) be a scalar holomorphic potential and define

\[
g_\Theta=2du\,dv+2dz\,dw
+\Theta_{zz}du^2+\Theta_{vv}dw^2-2\Theta_{vz}du\,dw.
\]

With \(\Box_0=2(\partial_u\partial_v+\partial_z\partial_w)\), define the heavenly expression

\[
\mathcal E(\Theta)=\Box_0\Theta
-\Theta_{zz}\Theta_{vv}+(\Theta_{vz})^2.
\]

The equation \(\mathcal E(\Theta)=0\) gives Ricci-flat half-flat metrics in this potential gauge. These formulas follow from [Brown, Gowdy and Spence, equations (2.14)–(2.20)](https://arxiv.org/html/2307.11063v2#S2.SS2) by replacing their coordinates \(X,Y\) with \(z,-w\). Choose \(\Theta_0(u,z)\) such that \(\Theta_{0,zz}=H\). Then \(g_{\Theta_0}=g_H\), and the linear and quadratic terms of \(\mathcal E(\Theta_0)\) vanish separately.

The following perturbation calculation is a direct substitution. Let \(\epsilon\) be a formal small parameter and \(\chi(u,v,z,w)\) a general scalar perturbation. Then

\[
\mathcal E(\Theta_0+\epsilon\chi)
=\epsilon(\Box_0\chi-H\chi_{vv})
+\epsilon^2\big((\chi_{vz})^2-\chi_{zz}\chi_{vv}\big).
\]

Thus the missing quadratic term becomes visible as soon as sufficiently general dependence is admitted. A perturbation is a solution only if it satisfies the resulting equations; arbitrary \(\chi\) does not automatically give a vacuum metric.

More systematically, define \(\mathcal L_H=\Box_0-H\partial_v^2\) and expand

\[
\Theta=\Theta_0+\epsilon\chi_1+\epsilon^2\chi_2+\cdots.
\]

The first two equations are

\[
\mathcal L_H\chi_1=0,
\qquad
\mathcal L_H\chi_2
=\chi_{1,zz}\chi_{1,vv}-(\chi_{1,vz})^2.
\]

The operator \(\mathcal L_H\) is the scalar wave operator of the background metric \(g_H\). The first equation already includes coupling to the background. The second displays the perturbation's quadratic self-interaction. Testing the generalized chart and bundle construction through this order is more informative than changing \(H\) within the same wave family.

In these spacetime coordinates the familiar kinematic Poisson bracket is \(\{f,g\}_{\rm kin}=f_vg_z-f_zg_v\), distinct from the vertical twistor bracket defined earlier. The heavenly nonlinear term is \(-\{\Theta_v,\Theta_z\}_{\rm kin}\). The wave restriction \(\Theta_0=\Theta_0(u,z)\) kills it because \(\Theta_{0,v}=0\). An identification between this spacetime algebra and a twistor construction requires the appropriate twistor correspondence; the two brackets must not be equated just because both are Poisson brackets.

**The classical double copy survives abelian reductions, but the dictionary still matters.** Established Kerr–Schild examples use fixed-color Maxwell fields, including pp-waves. Thus abelianity does not make a classical double copy illegitimate. See [Monteiro, O'Connell and White, section 5.1](https://arxiv.org/html/1410.0239v2#S5.SS1). It means the present family cannot test the replacement of nonzero color brackets by nonzero kinematic brackets.

To compare the wave formulas, simply relabel auxiliary flat coordinates by \((U,V,Z,W)=(-b,c,a,d)\). This is a labeling on the flat side, not a claim that the generalized chart is a spacetime diffeomorphism. In this labeling,

\[
\mathcal A_{\rm KS}=H(U,Z)dU\,N,
\qquad
A_H=\frac12H_Z(U,Z)dU\,N
=\frac12\partial_Z\mathcal A_{\rm KS}.
\]

Here \(\mathcal A_{\rm KS}\) denotes the conventional Kerr–Schild single copy and \(\partial_Z\) differentiates coefficients in the fixed coordinate frame. These are related fields, not the same field. The relation is gauge- and coordinate-adapted; an invariant version would need accompanying frame and incidence data.

The construction is therefore special without being an isolated hand-picked example. It covers arbitrary holomorphic profiles \(H(u,z)\) and is characterized intrinsically by two independent parallel vector fields spanning a totally null plane. Its general twistor and Ward ingredients have much broader scope. Its unusually explicit bridge between curved and flat data relies on the stronger holonomy and shear restrictions.

A productive generalization should state which target it pursues: a wider class of auxiliary flat ASD bundles, a correspondence preserving alpha-direction transport, an inverse recovering gravity with extra incidence data, or literal full spin-connection pullback. The first three can reasonably be investigated using general Hamiltonian gluing and heavenly perturbations. The fourth has the curvature-kernel obstruction above and cannot simply be assumed to survive outside the special wave sector.
