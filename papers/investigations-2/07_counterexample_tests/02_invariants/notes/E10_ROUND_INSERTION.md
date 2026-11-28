# WIN-E10 · Point evaluation on the round twistor family

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The frozen E route specifies GPT-6.2 Sol / ultra. The actual
serving variant and effort were unavailable to this worker. Inputs were
checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`, the [R1 request][r1],
the [sole register][register] and the [Astra assignment][assignment]. This
is a working calculation on two fixed smooth metrics on the same closed,
oriented, Riemannian standard sphere. The spin structure is unique and
the branch convention is \(c_2(S^+)[S^4]=-1\).

For the unit round metric the unit \(L^2\) fields form \(S^7\) and the
constant-right \(\mathrm{Sp}(1)\) quotient is \(B=\mathbb{HP}^1\). Point
evaluation on the quotient is a section of a real oriented four-plane
bundle. On the outward-oriented Hopf target its Euler pairing is \(+1\),
while the tautological complex rank-two line has Chern pairing \(-1\).
The pullback of the fixed spin bundle has zero point insertion. The
specified nonround control has an empty normalized exact-solution family.

## Solutions, normalization and the two stereographic charts

Use oriented Euclidean coordinates \((1,i,j,k)\) on \(\mathbb H\) and the
Clifford action \(c(X)(s_+,s_-)=(Xs_-,-\bar X s_+)\). Self-dual two-forms
act on the first summand. The spin action on a positive or negative
fiber is by left quaternion multiplication, and both half-spin bundles
are right \(\mathbb H\)-modules. With complex multiplication by right
\(i\), the complex fiber orientation is \((1,i,j,-k)\), the negative of
the displayed coordinate orientation. [Quaternionic conventions][e06]

Write \(P_X\psi=\nabla_X\psi+\tfrac14c(X)D\psi\). In the \(x\)-chart the
unit round metric is \(\Omega(x)^2\delta\), where
\(\Omega(x)=2/(1+|x|^2)\). The conformal spin identification preserves
chirality and transports a flat solution with weight \(\Omega^{1/2}\).
Flat solutions are \(u+xv\), with constant \(u,v\in\mathbb H\), where \(v\)
is negative-chiral before multiplying by \(x\). For example, in a flat
parallel frame \(\partial_i\psi=c_i\eta\) with \(\eta=-D\psi/4\). Commuting
flat derivatives and taking a Clifford trace gives
\(2\partial_i\eta=c_iD\eta\), so \(6D\eta=0\) and \(\eta\) is constant.
The conformal weight and flat model also appear in Friedrich, equation
(1.1) and the paragraph spanning pp. 59–60, and Example 2, pp. 62–63.
[Friedrich, published PDF][friedrich] · [Off-kernel conformal calculation][e07]

Choose the oriented complementary chart with \(x=-y^{-1}\) and \(y=0\)
at infinity. This is inversion followed by reflection across the
hyperplane perpendicular to \(1\). With unit \(\widehat y=y/|y|\), the
change of round orthonormal coordinate frames is
\(R_1R_{\widehat y}\), with spin lift \(c(1)c(\widehat y)\). The inverse
lift acts on the positive components by left multiplication by
\(-\widehat y\). Since \(\Omega(x)=|y|^2\Omega(y)\), the displays in the
two round spin frames, with compatible signs, are

\[
 \psi_{u,v}(x)=\Omega(x)^{1/2}(u+xv),\qquad
 \psi_{u,v}(y)=\Omega(y)^{1/2}(v-yu).
\]

The second formula extends smoothly through \(y=0\), and the equation
holds there by continuity. The two formulas give the entire round
solution space \(K\cong\mathbb H^2\), since restriction to the first
chart is injective and the flat conformal equation gave all its possible
restrictions. If \(v\ne0\), the unique zero is \(x=-uv^{-1}\). If \(v=0\)
and \(u\ne0\), the unique zero is infinity. At a zero the derivative is a
positive multiple of \(X\mapsto Xv\) or \(Y\mapsto -Yu\), respectively.
These maps are invertible and preserve the coordinate quaternionic orientation.
Thus each local index is \(-1\) with the complex target orientation,
including at infinity. [Stereographic spin transition for the constant mode][e11]

With \(V=\operatorname{Vol}(S^4,g_{\mathrm{rd}})=8\pi^2/3\),
\(\|\psi_{u,v}\|_2^2=V(|u|^2+|v|^2)\). The mixed term is odd in \(x\).
The integrals of \(\Omega\) and \(\Omega|x|^2\) against round volume agree
by inversion, and their sum is \(2V\). Positive scalar normalization
\((u,v)\mapsto \sqrt V(u,v)\) identifies the unit \(L^2\) space \(P\) with
the unit sphere of \(\mathbb H^2\), equivariantly for right multiplication.

## The marked evaluation and its descent

For every marked \(m\in S^4\), \(\operatorname{ev}_m:K\to S_m^+\) is
surjective and right \(\mathbb H\)-linear. Its kernel is the line
\(\kappa(m)=[-x:1]\) in the finite chart and \([1:y]\) in the other.
These coordinates identify \(\kappa:S^4\to B\) as a diffeomorphism.
The restriction to \(P\) has image the closed ball of radius
\(\sqrt{2/V}\) in \(S_m^+\). Indeed, the squared norms of the two row
coefficients in the local formula sum to 2 in either chart. The
orthogonal complement of the kernel is therefore mapped onto the
target by an isometry times \(\sqrt{2/V}\) in the \(L^2\) norm. Over an
interior point of the ball the fiber is a three-sphere in an affine
translate of \(\ker\operatorname{ev}_m\). Over a boundary point it is
a singleton.

The constant-right action on \(P\) is free everywhere, including on
the unit vectors in \(\kappa(m)\). It is also free on every nonzero field
before normalization. The evaluation obeys
\(\operatorname{ev}_m(\psi b)=\operatorname{ev}_m(\psi)b\). On the target
the stabilizer is all of \(\mathrm{Sp}(1)\) at zero and trivial at every
nonzero value. On the projective open set where evaluation is nonzero,
a fixed unit direction in \(S_m^+\) selects a unique representative in
each orbit with that normalized evaluation. This yields a section of
\(P\to B\) off the missing point \(\kappa(m)\). In a spin frame the
combined left spin action and the right action, written as a left group
action, is \((a,b)\cdot w=a w b^{-1}\). Its representation kernel is
\(\{(1,1),(-1,-1)\}\), its stabilizer at \(w\ne0\) is
\(\{(wbw^{-1},b):b\in\mathrm{Sp}(1)\}\), and at zero the entire group
fixes the value. For the right factor alone, \(-1\) acts as \(-I\).
That right factor acts by real isometries and does not preserve the
fixed complex structure \(w\mapsto wi\) except when \(b\) commutes
with \(i\).

There are three bundles in the calculation.

1. On the framed product \(S^4\times P\), evaluation is a section of
   the pullback of \(S^+\) from \(S^4\). Its restriction as a bundle to
   \(\{m\}\times P\) is trivial. Taking the quotient with a trivial
   action on the target fiber still gives a pullback of \(S^+\), with
   zero point Chern class. Evaluation changes by \(b\) and does not
   descend to a section for that action.
2. The tautological line \(L\to B\) has fiber \(\ell\subset K\) and
   principal bundle of unit frames \(P\). It is right quaternionic and
   has a complex rank-two structure via right \(i\). It records the
   choice of representative of a solution class.
3. For evaluation, the equivariant quotient instead identifies
   \((\psi,w)\sim(\psi b,wb)\) on the pullback over \(S^4\times P\).
   Its bundle over \(S^4\times B\) is
   \(E=\operatorname{Hom}_{\mathbb H}(\operatorname{pr}_B^*L,
   \operatorname{pr}_{S^4}^*S^+)\). Send a representative \((\psi,w)\)
   to the map \(\psi h\mapsto wh\) to check this identification.
   As a rank-four real bundle its two independent structure factors
   act by \(h\mapsto a h b^{-1}\), which preserve a real orientation
   and have no invariant complex structure. Evaluation descends as
   \(s(m,\ell)=\operatorname{ev}_m|_\ell\). The bundle of all real-linear
   maps between these real four-planes would have rank 16 and its Euler
   group on \(S^4\times B\) would be zero.

## Orientation, Chern and Euler pairings, and the Hopf number

Orient \(B\) by the outward sphere in \(\mathbb H\oplus\mathbb R\) with
ambient coordinate order \((1,i,j,k,t)\), using the Hopf coordinates
\((q,t)=(2u\bar v,|u|^2-|v|^2)\) for unit \((u,v)\). In the chart
\(z=u v^{-1}\), the center is the south pole and \(q=2z/(1+|z|^2)\).
The outward normal at that center is \(-\partial_t\), so the \(z\)-chart
orientation is the negative of the standard orientation of \(\mathbb H\).
Projecting the constant vector \((1,0)\) onto \(L\) gives a section
with a unique zero at the south pole. In the local unit frame
\((z,1)/\sqrt{1+|z|^2}\) its coefficient is
\(\bar z/\sqrt{1+|z|^2}\). Conjugation reverses orientation, and both
the domain chart and the complex fiber have the negative quaternionic
orientation. This gives \(e(L_{\mathbb R})[B]=c_2(L)[B]=-1\).
Also \(\kappa\) is \(z=-x\) on the finite chart and hence has degree
\(-1\) in this orientation. [Hopf coordinates and curvature sign check][e22]

Orient \(E\) by giving a coefficient \(h\), defined by
\(f(\ell_0)=\sigma h\) for unit frames \(\ell_0,\sigma\), the orientation
\((1,i,j,-k)\). This agrees with the complex target orientation after
choosing a frame of the source line, and left and right transitions
preserve it. Over \(S^4\times\{\ell\}\), \(E\) then identifies as an
oriented real bundle with \(S^+_{\mathbb R}\). Over \(\{m\}\times B\),
fix \(\sigma\). A source frame change by \(b\) changes the coefficient
to \(hb\), so \(h\mapsto\bar h\) identifies the slice with \(L\) as
real bundles and reverses the stated orientations. The two restrictions
determine the class because \(H^4(S^4\times B;\mathbb Z)\) is the direct
sum of the groups from the factors. Thus

\[
 e(E)=\operatorname{pr}_{S^4}^*c_2(S^+)
      -\operatorname{pr}_B^*c_2(L),\qquad
 \langle e(E|_{\{m\}\times B}),[B]\rangle=+1.
\]

The opposite orientation of \(E\) negates the formula. The slice at
\(m\) has a complex structure after choosing a target frame, by left
\(i\) on its coefficient \(h\). Its complex orientation
\((1,i,j,k)\) is opposite to the orientation used for \(e(E)\), so its
second Chern class in that complex structure equals \(c_2(L)\).
The slice evaluation has one transverse zero at \(\kappa(m)\). In the
finite \(z\)-chart its coefficient is a positive factor times \(z+x\).
At infinity, use \(w=v u^{-1}\) near the north pole and the coefficient
is a positive factor times \(w\). The latter chart also has negative
quaternionic orientation since \(q=2\bar w/(1+|w|^2)\) there. Thus the
local evaluation indices as a section over \(B\) are \(+1\) in both
charts. If \(B\) is oriented instead by the zero-location identification
with the spatial sphere, both parameter pairings change sign. The
spatial pairing of \(c_2(S^+)\) remains \(-1\).

For the signed Hopf invariant, orient \(P=S^7\) by the outward boundary
of the unit ball of \(\mathbb H^2\), with each factor ordered
\((1,i,j,k)\). The north and south fibers are the two coordinate
three-spheres. With their coordinate boundary orientations they link
with sign \(+1\): in the complement of the first sphere the map
\((u,v)\mapsto v/|v|\) has degree \(+1\) on a positive normal meridian
and on the second sphere. The Hopf-induced fiber orientations reverse
both coordinate orientations. At \((1,0)\) the normal derivative in
the second component is \(v\mapsto 2\bar v\) into the positive north
tangent chart. At \((0,1)\) the normal derivative in the first component
is \(u\mapsto2u\) into the negative south tangent chart. Linking is
therefore still \(+1\), the signed Hopf number in this total-space
orientation. This is distinct from the Chern number \(-1\) of the
right quaternionic line over the outward-oriented quotient.

## The nonround control on the same smooth sphere

Fix one small nonzero \(\epsilon\) in the [E33 control][e33]. In its
stereographic chart near the center \(g_\epsilon=\delta+\epsilon
(y^1)^2((dy^2)^2-(dy^3)^2)\) and the curvature operator has
\(R_{1212}=-\epsilon\), \(R_{1313}=\epsilon\) as its only independent
entries at zero. The scalar curvature is zero there and
\(W^+=\operatorname{diag}(-\epsilon/2,\epsilon/2,0)\) in the positive
orthonormal wedge basis, giving an open neighborhood with \(W^+\ne0\).
Take \(0<|\epsilon|\,\|k\|_{g_0,\infty}<1/2\), where \(g_0\) and \(k\)
are the background and the compactly supported tensor in E33, to
guarantee a smooth positive metric on the entire sphere.

For a positive twistor solution the [projected curvature identity][e12]
gives \(c(W^+\omega)\psi=0\) for every real self-dual \(\omega\). This
follows by projecting the exterior derivative of \(P\psi=0\) to the
Clifford-traceless part of \(\Lambda^+\otimes S^+\): the scalar and
\(D^2\) terms are Clifford-trace terms, while the symmetric trace-free
\(W^+\) term lies in the kernel of contraction. For every nonzero real
self-dual \(\nu\), \(c(\nu)^*c(\nu)=2|\nu|^2 I\) on \(S^+\), so \(\psi=0\)
where \(W^+\ne0\). The spin curvature formula used in the projection is
Bär, §2, eq. (3), p. 71, with the round sign checked by eqs. (4)–(5).
[Bär, published PDF][bar]

To propagate the open vanishing, set \(\eta=-D\psi/4\) and, in an
orthonormal frame, \(T_i=\sum_jc_jR^S(e_i,e_j)\psi\). Differentiating
\(\nabla_i\psi=c_i\eta\), commuting derivatives, and taking Clifford
traces gives \(T_i=-2\nabla_i\eta+c_iD\eta\) and
\(\sum_i c_iT_i=-6D\eta\). Hence \(\nabla\eta\) is linear in \(\psi\)
with smooth curvature coefficients. Together with \(\nabla\psi=c\eta\)
this is a homogeneous linear system along paths. Both entries vanish on
the open set and uniqueness on the connected sphere makes them vanish
globally. Thus the unnormalized kernel is just zero and both the unit
solution space and its quotient are empty. The spin bundle still has
its fixed closed Chern number. The round pairing is a characteristic
number of the round solution parameter space, and this experiment
supplies no four-dimensional continuation cycle on the nonround control.

The primary source inspection used Friedrich's 1990 DML-CZ published
copy at §1 pp. 59–60 and Example 2 pp. 62–63, and Bär's 1996 J-STAGE
published copy at §2 p. 71, on 28 November UTC. The primary citations
are already catalogued in the project [Friedrich][friedrich-record] and
[Bär][e12] source records. The signs, descent and two controls above
are direct calculations. Independent replay and Lean verification are
pending.

[r1]: ../research-progress/handoffs/REQUEST_TWISTOR_R1.md
[register]: ../research-progress/REGISTER.md
[assignment]: ../continuation-notes/SMOOTH_INVARIANTS_ASTRA_20261127.md
[e06]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md
[e07]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md
[e11]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E11_20261124.md
[e12]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E12_20261124.md
[e22]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E22_20261124.md
[e33]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md
[friedrich-record]: ../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026
[friedrich]: https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf
[bar]: https://www.jstage.jst.go.jp/article/jmath1948/48/1/48_1_69/_pdf#page=3
