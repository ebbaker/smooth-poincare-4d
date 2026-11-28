# WIN-E16 · Volume-centered pencils and the standard spectral control

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [frozen request][request] specifies GPT-6.2 Sol / ultra.
Actual serving variant and effort were unavailable. Inputs are checkout
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`, the [sole register][register]
and the [round kernel-map calculation][round]. This is a working proof
on the closed, connected, oriented standard smooth \(S^4\), with a smooth
positive-definite metric, its unique spin structure and its right
quaternionic positive half-spin line.

Every smooth metric on this fixed smooth sphere has a generating pencil
with a volume-centered diffeomorphic kernel map to unit round
\(\mathbb{HP}^1\). This includes metrics of any fixed positive volume
with arbitrarily large first positive function eigenvalue. The centered
maps in those metrics necessarily have large Dirichlet energy, whereas
the unit round isometric control attains the spectral lower bound.

## Primary theorem and normalization

Bruno Colbois and Józef Dodziuk, *Riemannian Metrics with Large
\(\lambda_1\)*, Proc. Amer. Math. Soc. **122** (3) (November 1994),
905–906, [DOI 10.1090/S0002-9939-1994-1213857-9][doi], Theorem 1,
p. 905. The paper starts with a compact connected Riemannian manifold
and defines \(\lambda_1(g)\) as the smallest positive eigenvalue of the
Laplacian on functions. In the closed smooth setting of this packet,
the theorem gives, for every \(A>0\), a smooth metric of volume one
on every such manifold of dimension at least three with
\(\lambda_1(g)>A\). The first paragraph of the proof on p. 905 cites
the sphere examples as inputs to the general theorem. The smooth
metric construction and final rescaling to volume one appear on
p. 906. Here we use the theorem only on the standard \(S^4\).
[Published two-page scan uploaded by Dodziuk][primary]

Inspection on 28 November UTC included the page images of pp. 905–906,
the opening definition, Theorem 1 and its proof through the last
rescaling. This is a checked primary passage. The proofs of the
paper's cited spectral convergence results and sphere examples were
outside this packet.

On \(S^4\), scaling \(g\) to \(c g\), \(c>0\), multiplies the volume by
\(c^2\) and the eigenvalues of the nonnegative function Laplacian
\(d^*d\) by \(c^{-1}\). Thus for every prescribed \(V>0\) and \(A>0\)
one can first request a unit-volume metric with
\(\lambda_1>A\sqrt V\) and then multiply it by \(\sqrt V\).
The resulting metric has volume \(V\) and \(\lambda_1>A\).

## Centering a diffeomorphic kernel map

Identify the target \(P=\mathbb{HP}^1\) with the unit round sphere in
\(\mathbb R^5\) by
\[
 [(u,v)]\longmapsto (2u\bar v,\ |u|^2-|v|^2),\qquad |u|^2+|v|^2=1.
\]
Use the fixed ordered two-generator coordinates in \(\mathbb H^2\).
A pencil means a smooth surjective right quaternionic bundle map
\(F:\underline{\mathbb H}^2\to S_g^+\), with associated kernel map
\(f(x)=\ker F_x\in P\). Centering means \(\int_{S^4} f\,dV_g=0\) in
\(\mathbb R^5\).

For the round reference metric the two coefficient spinors from
[E10][round] give a generating pencil with kernel \(f_0\), expressed
as \([-x:1]\) in the oriented finite stereographic chart. It extends
as a diffeomorphism to \(P\). Transfer the two sections to \(S_g^+\) by
the smooth spin identification between metrics. More explicitly, the
positive symmetric inverse square root of the metric comparison
operator maps oriented orthonormal frames of the reference metric to
those of \(g\). The straight path of positive metrics from the
reference to \(g\) lifts this family of frame identifications starting
at the identity in the fixed spin structure. The resulting
quaternionic isomorphism preserves fibre generation and leaves
\(f_0\) unchanged. Denote the transferred sections by \(s_0,s_1\).

Let \(\mu=(f_0)_*(dV_g/V)\), a nonatomic probability on the target.
For \(a\) in the open unit five-ball and \(p\in P\), set
\[
 T_a(p)=a+\frac{(1-|a|^2)(p+a)}{|p+a|^2}.
\]
Expansion of the squared norm gives \(|T_a(p)|=1\). The formula is a
composition of translations, an inversion and a positive dilation
in the ambient space, so its restriction is conformal. The inverse
on the sphere is \(T_{-a}\), as follows by substituting the formula;
\(T_0\) is the identity. Thus \(T_{ta}\), \(0\le t\le1\), is a smooth
isotopy of conformal diffeomorphisms.

Define \(b(a)=\int_P T_a(p)\,d\mu(p)\). As \(a\to v\in\partial B^5\)
from inside, \(T_a(p)\to v\) for each \(p\ne-v\). The measure has no
atom at \(-v\) and the integrands have norm one. Dominated convergence
extends \(b\) continuously by \(b(v)=v\) on the boundary. If \(b\) had
no zero, its normalization by its norm would retract the closed
five-ball onto its boundary. This is impossible since the inclusion
of the boundary induces the zero map on \(H_4(-;\mathbb Z)\) while
the composite with the proposed retraction induces the identity on
\(\mathbb Z\). Hence some interior \(a\) gives \(b(a)=0\), and
\(f=T_a\circ f_0\) is a volume-centered diffeomorphism.

To realize \(f\) while keeping \(g\) fixed, set
\(\phi_t=f_0^{-1}\circ T_{ta}\circ f_0\) on the source. For each \(x\)
let \(U_x:(S_g^+)_x\to(S_g^+)_{\phi_1(x)}\) be spin parallel transport
along \(t\mapsto\phi_t(x)\). This depends smoothly on \(x\) and is
right quaternionic and unitary. The pair
\[
 s'_j(x)=U_x^{-1}s_j(\phi_1(x)),\qquad j=0,1,
\]
generates every fibre and has kernel \(f_0(\phi_1(x))=f(x)\).
The choice of transport supplies the bundle identification needed to
realize the postcomposition.

An orthonormal pair for the quaternionic \(L^2(g)\) product is possible
with this same kernel map. Write \(m^2=|s'_0|^2+|s'_1|^2\) and divide
both fields by \(m\). Their pointwise Gram operator becomes
\(I-P_{f(x)}\), where \(P_{f(x)}\) is the orthogonal projector onto the
kernel line. In the unit target coordinates \((q,t)\), that projector
is
\[
 P_{f(x)}=\tfrac12
 \begin{pmatrix}1+t&q\\\bar q&1-t\end{pmatrix}.
\]
Centering gives \(\int_{S^4}P_{f(x)}\,dV_g=(V/2)I\). Multiplying the
two divided fields by \(\sqrt{2/V}\) therefore makes their global
Gram matrix the identity without changing their kernels.

## Round and large-eigenvalue controls

For a centered \(f=(f_1,\ldots,f_5)\), each real coordinate function
has mean zero. The Rayleigh inequality for \(\lambda_1(g)\) and
\(\sum_i f_i^2=1\) give
\[
 \lambda_1(g)V\le\sum_{i=1}^5\int_{S^4}|df_i|_g^2\,dV_g
   =\int_{S^4}|df|_{g,\mathrm{rd}}^2\,dV_g .
\]
Here the energy uses the Hilbert–Schmidt differential norm with no
factor \(1/2\). Cauchy–Schwarz also bounds the critical differential
integral below by \(\int |df|^4\,dV_g\ge\lambda_1(g)^2 V\).

On the unit round control, the target coordinates of \(f_0\) are
\((-2x/(1+|x|^2), (|x|^2-1)/(1+|x|^2))\). The round stereographic
metric shows that this is an isometry. Its pushforward volume is
uniform, hence it is already centered. Its coordinate functions have
Hessian \(-f_i g_{\mathrm{rd}}\), by the second fundamental form of the
unit sphere, and satisfy \(d^*d f_i=4f_i\). For every nonconstant
eigenfunction the integrated Bochner identity, \(\mathrm{Ric}=3g_{\rm rd}\)
and \(|\nabla^2 h|^2\ge (\Delta h)^2/4\) give \(\lambda\ge4\).
This shows \(\lambda_1=4\), and \(|df_0|^2=4\) gives equality in both
bounds. The same equalities hold upon rescaling the source to the
prescribed volume.

On every Colbois–Dodziuk standard control of volume \(V\), the
centering and pencil realization still apply. Along the metrics
above, as the lower threshold \(A\) grows, every centered kernel
map has \(\int|df|^2\,dV_g>AV\) and \(\int|df|^4\,dV_g>A^2V\).
Thus the algebraic centering condition exhibits no obstruction to
existence even in the large-eigenvalue regime, and it supplies no
upper differential-energy bound uniform over metrics of fixed
volume. This packet only examines smooth generating pairs and the
standard smooth sphere. The direct construction awaits an
independent replay and Lean verification.

[request]: ../research-progress/handoffs/REQUEST_BALANCED_R1.md
[register]: ../research-progress/REGISTER.md
[round]: E10_ROUND_INSERTION.md
[doi]: https://doi.org/10.1090/S0002-9939-1994-1213857-9
[primary]: https://www.researchgate.net/profile/Jozef-Dodziuk/publication/265433300_Riemannian_Metrics_with_Large_l_1/links/54e5f64e0cf2cd2e028b542e/Riemannian-Metrics-with-Large-l-1.pdf
