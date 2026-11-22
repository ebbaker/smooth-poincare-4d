# Curvature and holonomy conditions for generalized isothermal coordinates

20 November 2026

The requested operator is

\[
\mathcal D_A(\pi)=\pi^{A'}\bigl(\partial_{AA'}+\Gamma_{AA'}(y)\bigr),
\]

with connection coefficients independent of the direction spinor. The central question is whether the transport induced by the generalized charts admits this form while retaining the original null geometry.

There is a precise curvature obstruction to one strengthened definition of the charts: a single holomorphic inverse over complete target direction fibers, contained in a curved coordinate neighborhood and preserving the twistor distribution, exists locally exactly in the conformally flat case. This does not classify the weaker construction using patchwise maps and bundle gluing. A calculation below gives a nonflat ASD Ricci-flat example whose transported auxiliary spin connection does descend and extend over the whole target direction sphere, while the geometric inverse does not. This establishes a positive example of the desired operator form, with a specific bundle identification; it does not establish regular identification with target tangent spinors or reconstruction of the entire geometry.

All statements are local. The main setting is a holomorphic conformal four-manifold, with spin bundles chosen locally and chirality fixed by \(\widetilde\Psi_{A'B'C'D'}=0\) in the ASD case. References to hyperkähler holonomy concern a Riemannian real slice; the complex holonomy statement is given separately.

## The formula and its geometric content

Every ordinary linear connection on a coordinate neighborhood has the form \(\nabla_\mu=\partial_\mu+\Gamma_\mu(y)\). Relabeling the four coordinates by \(AA'\) and contracting with an auxiliary \(\pi^{A'}\) gives the displayed expression on any manifold. Thus the expression by itself is not a curvature condition.

The additional content is that the directions represented by \(\pi^{A'}\partial_{AA'}\) must have the intended relationship to the original curved null directions and transported bundle. In an ordinary curved spin frame their derivative part is instead

\[
\pi^{A'} e_{AA'}{}^\mu(y)\partial_\mu,
\]

with a generally nonconstant tetrad \(e\). A change of frame in the transported vector bundle cannot alter this derivative part: it changes the matrix-valued connection terms. Replacing the curved tetrad by the fixed flat derivative part therefore requires a geometric construction in addition to a bundle gauge transformation.

## A precise obstruction for charts over complete target fibers

The following argument is a direct deduction for a specific definition of the generalized chart. It is not a classification theorem for all possible generalized coordinates.

**Proposition.** Let \(M_0\) lie in one holomorphic coordinate neighborhood of a complex conformal four-manifold. Let \(F_0=\mathbb P(V_-)|_{M_0}\). Suppose there is a holomorphic local biholomorphism

\[
\Psi:U\times\mathbb{CP}^1\longrightarrow F_0
\]

that carries the standard flat alpha distribution to the curved twistor distribution. Then the conformal structure is locally conformally flat on the projected image. Conversely, conformally flat geometry admits such maps locally after choosing conformal coordinates and their spin lift.

**Proof.** For fixed \(y\), each coordinate function of

\[
\mathbb{CP}^1\longrightarrow M_0,
\qquad [\pi]\longmapsto p_M\Psi(y,[\pi])
\]

is holomorphic on a compact projective line and hence constant. Consequently \(p_M\Psi=f\circ p_U\) for a holomorphic map \(f:U\to M_0\). Since \(\Psi\) is locally invertible, \(dp_M\circ d\Psi\) has rank four, so \(df\) is invertible. The restriction of \(\Psi\) to each projective fiber is a local biholomorphism of projective lines, hence a Möbius isomorphism. Distribution preservation then makes \(df\) carry every flat alpha plane to a curved alpha plane. Their union is the null cone, so \(f\) is conformal. Its domain is conformally flat, establishing the claim. The converse follows from ordinary local conformal coordinates. \(\square\)

The manifold condition for this precise chart requirement is therefore

\[
W=0,
\qquad\text{equivalently}\qquad
\Psi_{ABCD}=0=\widetilde\Psi_{A'B'C'D'}.
\]

Within Einstein metrics this means constant sectional curvature. Within Ricci-flat metrics it means full local flatness. In particular, nonflat hyperkähler geometry does not evade the obstruction. Conformal flatness itself need not reduce the Levi–Civita holonomy of a chosen conformal representative.

The requirement of a single holomorphic map \(\Psi\) is essential. A forward map whose range merely covers the target fibers need not have such an inverse. Multiple inverse patches avoid this argument only if they do not glue into one map of the stated kind. Gluing bundle data without gluing the geometric inverse is a different possibility. Allowing a projected compact fiber to leave every single curved coordinate neighborhood is another possibility, but changes the purely local formulation.

This sharpens the previous project summary: full target-fiber coverage and explicit fiber preservation are different requirements, but a single-valued holomorphic inverse with the stated local domain makes fiber preservation automatic.

## Curvature conditions for the proposed transport

The following conditions concern the construction of transport on the curved side. They are not sufficient conditions for the complete generalized-coordinate theorem.

| Required structure | Condition on the original geometry | What it establishes |
| --- | --- | --- |
| Alpha surfaces through all chiral null two-planes | \(\widetilde\Psi=0\), or ASD conformal geometry | Integrability of the twistor distribution |
| Unprimed Levi–Civita spin transport flat on all alpha surfaces | In addition, the selected metric is Einstein | A rank-two connection with the required surface flatness |
| Entire primed Levi–Civita spin connection locally removable | ASD and Ricci-flat | One flat spin connection and one potentially curved spin connection |
| Rank-four local-twistor transport flat on alpha surfaces | ASD conformal geometry; no Einstein condition | A conformally natural alternative to the rank-two transport |
| A single inverse chart satisfying the preceding proposition | \(W=0\) | The strict chart construction itself |

The first row is the standard twistor integrability criterion. A formulation with explicit conventions is in [Dunajski and West, Theorem 1](https://arxiv.org/pdf/math/0610280).

For the second row, the unprimed spin curvature decomposes schematically as

\[
R^S_{AA'BB'}=\epsilon_{A'B'}X_{AB}+\epsilon_{AB}\Phi_{A'B'},
\]

where the entries are endomorphisms of the unprimed spin bundle, \(X\) contains the unprimed Weyl and scalar curvature, and \(\Phi\) is trace-free Ricci curvature. Evaluating on an alpha plane gives

\[
\pi^{A'}\pi^{B'}R^S_{AA'BB'}
=\epsilon_{AB}\pi^{A'}\pi^{B'}\Phi_{A'B'}.
\]

This vanishes for every \(\pi\) precisely when \(\Phi=0\). Therefore the chosen metric must be Einstein; a nonzero cosmological constant is allowed. This is the curvature calculation underlying [Atiyah–Hitchin–Singer, Proposition 2.2, PDF p. 9 / journal p. 432](../../../../references/Atiyah.pdf). Einstein geometry is not generally a special Levi–Civita holonomy class.

If the conformal scale is free, the relevant condition becomes existence of an Einstein representative. There is an exact conformal-holonomy formulation: a parallel standard tractor with nowhere-vanishing scale component, as in [Gover and Nurowski, Theorem 3.1](https://arxiv.org/pdf/math/0405304). This characterizes the Einstein-scale issue, not the subsequent descent problem.

Making the full primed spin connection flat additionally removes its scalar-curvature contribution. In the ASD setting this requires \(\Phi=0\) and \(\Lambda=0\), hence Ricci-flatness. Locally the restricted complex spin holonomy lies in one \(SL(2,\mathbb C)\) factor. On a Riemannian real slice the resulting geometry is locally hyperkähler, with restricted holonomy contained in \(SU(2)\). See [Dunajski and West, §3.1.4](https://arxiv.org/pdf/math/0610280). A flat primed connection does not make the curved tetrad a coordinate tetrad.

The rank-four alternative incorporates the Ricci terms into the connection rather than requiring them to vanish. [Dunajski and Tod, Proposition 4.2(2), equation (4.25)](https://arxiv.org/pdf/1304.7772) prove that the local dual-twistor connection has ASD curvature for an ASD conformal structure. It is consequently flat along alpha surfaces. This supports the local-twistor suggestion on page 6 of [the curved draft](../../../../references/unfinished_notes/Curved_morphisms.pdf). The resulting connection acts on four-component local twistors; an additional reduction would be needed to obtain the intended two-component chiral object.

## An explicit nonflat example with connection descent

A simple holomorphic metric on a coordinate neighborhood in \(\mathbb C^4\) is

\[
g=2\,du\,dv+2\,dz\,dw+z^2\,du^2.
\]

The products in this expression are the usual symmetric metric products, so \(g_{uv}=g_{zw}=1\). Its determinant is one. Its only nonzero Christoffel symbols are

\[
\Gamma^v{}_{uz}=\Gamma^v{}_{zu}=z,
\qquad \Gamma^w{}_{uu}=-z.
\]

With \(R^a{}_{bcd}=\partial_c\Gamma^a{}_{db}-\partial_d\Gamma^a{}_{cb}+\Gamma^a{}_{ce}\Gamma^e{}_{db}-\Gamma^a{}_{de}\Gamma^e{}_{cb}\), its curvature has

\[
R_{uzuz}=-1,
\]

and the components required by the curvature symmetries. Direct contraction gives \(\mathrm{Ric}=0\). With orientation \(du\wedge dv\wedge dz\wedge dw\), the curvature is anti-self-dual on its first index pair. Thus this is a nonflat ASD Ricci-flat example after matching the spinor convention. These component identities were checked by exact algebra.

This metric has the local complex holonomy reduction discussed above, but the strict inverse-chart proposition excludes it because its Weyl tensor is nonzero. It is therefore a useful test for any weaker definition: a successful construction on this example must avoid at least one hypothesis of that proposition.

Related half-flat plane-wave metrics appear in [Brown, Gowdy and Spence, §5](https://arxiv.org/pdf/2307.11063). The component calculation here uses the displayed metric and the explicitly stated curvature convention.

Choose the spin coframe

\[
(\theta^{AA'})=
\begin{pmatrix}
du&dz\\
-dw&dv+\tfrac12z^2du
\end{pmatrix},
\qquad
N=\begin{pmatrix}0&0\\1&0\end{pmatrix}.
\]

The unprimed Levi–Civita spin connection is \(\Gamma=z\,du\,N\), and the primed connection vanishes. These satisfy the torsion equations \(d\theta+\Gamma\wedge\theta=0\); in particular \(d\theta^{11'}=z\,dz\wedge du\) is canceled by \(z\,du\wedge dz\).

On the affine direction chart with coordinate \(\zeta\), the alpha distribution is generated by

\[
L_0=\partial_u-\tfrac12z^2\partial_v+\zeta\partial_z,
\qquad
L_1=-\partial_w+\zeta\partial_v.
\]

They commute. Three first integrals, furnishing a local twistor chart, are

\[
\zeta,\qquad
p=z-\zeta u,\qquad
q=v+\zeta w+\tfrac12uz^2-\tfrac12\zeta u^2z+\tfrac16\zeta^2u^3.
\]

Both \(L_A\) annihilate all three. Identify \((p,q)\) with flat twistor coordinates \(\omega^A\), and use incidence \(\omega^A=y^{A0'}+\zeta y^{A1'}\), absorbing the conventional factor of \(i\) into the coordinates. The tangent-line/Shaw construction gives \(y^{A0'}=\omega^A-\zeta\dot\omega^A\), \(y^{A1'}=\dot\omega^A\), where the derivative is along the original spacetime point's twistor curve. Thus, writing \((y^{AA'})=\begin{pmatrix}a&b\\c&d\end{pmatrix}\),

\[
a=z,\qquad b=-u,\qquad
c=v+\tfrac12uz^2-\tfrac16u^3\zeta^2,\qquad
d=w-\tfrac12u^2z+\tfrac13u^3\zeta.
\]

This is invertible for every finite \(\zeta\): first recover \(u=-b,z=a\), and then solve the last two expressions for \(v,w\). The inverse has poles at \(\zeta=\infty\) for generic \(u\), as required by the obstruction proposition.

The target flat metric is \(2(da\,dd-db\,dc)\). Its alpha distribution is generated by

\[
K_0=\partial_b-\zeta\partial_a,\qquad
K_1=\partial_d-\zeta\partial_c.
\]

If \(h=-uz+\tfrac12u^2\zeta\), direct differentiation gives \(f_*L_0=-K_0+hK_1\) and \(f_*L_1=-K_1\), verifying preservation of the distributions on this affine chart.

Now use the original spin frame to identify the transported bundle fibers. Since \(u=-b\) and \(z=a\) are independent of direction, the pullback of the spin connection by the inverse map is

\[
\boxed{A=-a\,db\,N.}
\]

This is an ordinary connection on the flat coordinate domain, with no \(\zeta\)-dependence. Its alpha operators are

\[
\mathcal D_0=\partial_b-\zeta\partial_a-aN,
\qquad
\mathcal D_1=\partial_d-\zeta\partial_c.
\]

Taking the homogeneous target direction to be \(\pi^{A'}=(-\zeta,1)\), these are exactly of the requested form. Their connection coefficients extend over the complete projective direction sphere. Moreover,

\[
F_A=-da\wedge db\,N\ne0,
\qquad F_A(K_0,K_1)=0.
\]

Thus the extended connection is nonflat and ASD relative to the flat target conformal structure. The success occurs because the original connection depends only on \(u,z\), which the map recovers independently of direction; its dependence on the direction-varying coordinates \(v,w\) is absent.

There is an essential qualification. Identifying source spinors with target tangent spinors using the differential of the map involves the matrix

\[
T=-I+hN.
\]

It depends on direction and has a pole at infinity. In this tangent frame the transformed connection is \((z\,du+dh)N\); its restriction to both transported alpha directions vanishes because \(L_0h=-z\) and \(L_1h=0\). This does not contradict the nonzero curvature of the extended connection: \(T\) is not a globally regular change of frame over the projective direction sphere, and the transformed full connection also has a direction component. The positive result is descent on an explicitly chosen auxiliary spin bundle. A regular identification with the flat tangent spin bundle, together with a recovery theorem, remains unproved.

This distinction is a concrete feature of the example, rather than an abstract splitting warning. The geometry and the bundle connection need not extend across the missing direction in the same way.

### Explicit gluing over both direction patches

For this example the regular bundle extension can also be obtained from twistor transition data. Put \(\mu=1/\zeta\), and define a second curved twistor chart by

\[
P=p/\zeta,\qquad
Q=q/\zeta+p^3/(6\zeta^2).
\]

On the original twistor lines these become

\[
P=\mu z-u,\qquad Q=w+\mu v+\tfrac16\mu^2z^3,
\]

which are regular at \(\mu=0\). The vertical tangent Jacobian of the chart transition is

\[
\frac{\partial(P,Q)}{\partial(p,q)}
=\zeta^{-1}\left(I+\frac{p^2}{2\zeta}N\right).
\]

After twisting the vertical tangent bundle by \(\mathcal O(-1)\), its transition matrix is

\[
g(\zeta,p)=I+\frac{p^2}{2\zeta}N.
\]

This depends only on the coordinates of the intermediate surface \(B=\operatorname{Tot}\mathcal O(1)\), with transition \(P=p/\zeta\). Both the curved twistor space and flat twistor space project to \(B\). Thus \(g\) defines a bundle on \(B\) that can be pulled back to either twistor space. This supplies a precise bundle transfer for this presentation without requiring a global map from curved to flat twistor space.

On a flat twistor line \(p=a+\zeta b\), set

\[
h_0=ab+\tfrac12\zeta b^2,
\qquad h_\infty=-\tfrac12\mu a^2.
\]

Then

\[
g=(I+h_0N)(I+h_\infty N)^{-1},
\]

since \(h_0-h_\infty=p^2/(2\zeta)\) and \(N^2=0\). Each factor is holomorphic and invertible on its complete direction patch. Also \(K_0h_0=K_0h_\infty=a\) and \(K_1h_0=K_1h_\infty=0\), so these factors are local parallel frames for the connection \(A=-a\,db\,N\). This verifies the required holomorphic splitting over complete target fibers for this example. Its compatibility with a globally regular tangent-spinor identification is a separate question, as the preceding singular frame calculation shows.

For the component convention \(s_\infty=g s_0\), the common spacetime components are \(s=(I+h_0N)s_0=(I+h_\infty N)s_\infty\). Equivalently the component evaluation matrices are \(I-h_iN\), whose logarithmic derivatives yield the stated sign of \(A\).

### Extension of the local calculation to a wave family

The same connection calculation applies to

\[
g_H=2\,du\,dv+2\,dz\,dw+H(u,z)\,du^2
\]

for holomorphic \(H\). Its spin connections in the analogous coframe are \(\Gamma=\tfrac12H_z\,du\,N\) and \(\Gamma'=0\); hence it is ASD Ricci-flat and is nonflat where \(H_{zz}\ne0\). Its restricted spin holonomy is contained in the unipotent subgroup \(\{I+tN\}\subset SL(2,\mathbb C)\). This is smaller than generic complex hyperkähler holonomy. Taking all coordinates and \(H\) real gives neutral signature, not a Riemannian hyperkähler example.

Locally solve \((\partial_u+\zeta\partial_z)J=H/2\), for instance by

\[
J(u,z,\zeta)=\frac12\int_0^u H(t,z-\zeta(u-t))\,dt
\]

on a domain where the integral is holomorphic. Twistor first integrals are \(\zeta,p=z-\zeta u,q=v+\zeta w+J\). The Shaw construction again yields \(a=z,b=-u\), while \(c=v+J-\zeta J_\zeta\) and \(d=w+J_\zeta\). These relations are locally invertible because the last two are affine in \(v,w\). Consequently the transported auxiliary connection is

\[
A_H=-\tfrac12H_z(-b,a)\,db\,N,
\qquad
F_{A_H}=-\tfrac12H_{zz}(-b,a)\,da\wedge db\,N.
\]

It is independent of direction and defines an extension over the whole target direction sphere wherever \(H_z(-b,a)\) is holomorphic. The explicit two-patch twistor factorization above was computed for \(H=z^2\); the formula for \(A_H\) establishes the local connection-transfer mechanism for the wider family. It does not classify all metrics with the same holonomy.

Within this fixed coordinate ansatz and bundle gauge, \(A_H\) determines \(H_z\), so integration in \(z\) recovers \(H\) up to a function of \(u\). Adding such a function \(f(u)\) to \(H\) is absorbed by a change \(v\mapsto v+\tfrac12\int f(u)\,du\). This gives recovery within the prescribed wave family; it is not a coordinate-independent reconstruction from an arbitrary gauge-equivalence class of connections.

## The remaining descent problem

Let \(p:U\times\mathbb{CP}^1\to U\), and suppose a candidate holomorphic bundle \(E\) and holomorphic partial connection along the standard flat alpha distribution have been obtained. If, after accounting for prescribed spinor weights, \(E\) is holomorphically trivial on every direction sphere, then locally after shrinking \(U\), evaluation identifies it with \(p^*E_0\), where

\[
(E_0)_y=H^0(\mathbb{CP}^1,E|_{\{y\}\times\mathbb{CP}^1}).
\]

In a frame descending from \(E_0\), the difference between the partial connection and the standard derivative operator is an endomorphism-valued section of \(\mathcal O(1)\) in each component \(A\). Global holomorphicity then forces

\[
B_A(y,\pi)=\pi^{A'}\Gamma_{AA'}(y).
\]

Thus a properly defined global partial connection with the correct flat derivative part and trivial fiber bundle gives the desired linearity. Flatness of that partial connection is an additional condition implying ASD curvature; it is not required just to obtain an ordinary connection.

The open issue is producing these data from the curved charts. The fiber splitting depends on the transported bundle and the chosen construction. An arbitrary patchwise failure is not automatically a manifold invariant. A classification must address existence of suitable charts and identifications, rather than failure of one choice. No equivalence with “ASD Einstein,” “hyperkähler,” or “all ASD” has been established for this remaining step.

The example supplies one such regular auxiliary-bundle extension explicitly. The next problem is to characterize when this extension is intrinsic to the geometric construction and compatible with its tangent-spinor interpretation. Testing a less symmetric ASD Ricci-flat metric would distinguish a general holonomy mechanism from the special fact that the present connection ignores the direction-varying source coordinates. The rank-four local-twistor connection offers a parallel test for ASD geometries without an Einstein representative. Recovery of the original conformal geometry remains a further requirement.

## Routes toward arbitrary conformal manifolds

Arbitrary conformal geometry already has a connection formulation through the normal conformal Cartan connection. In a chosen scale its matrix includes the coframe, metric connection, and Schouten tensor. The coframe identifies abstract tangent directions with spacetime directions, so this formulation retains the information missing when one replaces a curved tetrad by fixed flat derivatives. See [Korzyński and Lewandowski, §2](https://arxiv.org/pdf/gr-qc/0301096). It is a broader structure than an unrestricted rank-two gauge connection.

There is also a genuine general gravitational ambitwistor correspondence. LeBrun's *Spaces of Complex Null Geodesics in Complex-Riemannian Geometry* (1983) reconstructs local holomorphic conformal geometry in dimension at least four using the space of null geodesics and a family of quadrics. It does not require ASD or special holonomy. The primary entry points are [the paper](https://doi.org/10.1090/S0002-9947-1983-0697071-9) and [LeBrun's thesis and abstract](https://ora.ox.ac.uk/objects/uuid%3Ae29dd99c-0437-4956-8280-89dda76fa3f8). This supports the general ambition without proving the proposed flat-side normal form.

A related local description of ASD geometry uses pairs of second-order ODEs whose generalized Wilczynski invariants vanish. [Casey, Dunajski and Tod, Theorem 2.1 and §4](https://arxiv.org/pdf/1203.4158) give a way to reconstruct the equations from an ASD conformal structure. This may provide calculable coordinates for testing the proposed Shaw construction. Their separate criterion for the twistor curves to be geodesics of a projective connection concerns a connection on the three-dimensional twistor space, and must not be identified with the connection on four-dimensional flat spacetime sought here.

The present research conclusion is therefore limited but definite: the strict full-fiber inverse formulation is classified by conformal flatness; an explicit nonflat ASD Ricci-flat example admits the desired ordinary connection on an auxiliary bundle; and the general geometric interpretation and classification of the weaker construction remain research questions.
