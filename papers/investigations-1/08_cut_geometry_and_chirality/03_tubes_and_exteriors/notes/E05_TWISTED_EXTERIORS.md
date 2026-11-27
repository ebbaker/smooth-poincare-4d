# E05 · Short-circle collapse of marked spherical exteriors

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. This is the bounded E05 execution packet. The requested model and effort were `gpt-6.2-sol`/ultra. Actual runtime model and effort are unavailable. Inputs are [E05 request R1](../research-progress/handoffs/E05_REQUEST_R1.md), [B01](../brainstorm/notes/B01_EXTERIOR_ROUTES.md), and Sections 5–6 of the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) at `bc2c1bb`, SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`. The [original checks and output](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/README.md) concern conformally flat exteriors with different boundary data. Their floating cap costs do not enter the arguments below.

**Result.** Smooth exteriors with rational circle homology and a totally geodesic \(S^1\times S^2\) boundary can have positive doubles and arbitrarily small strictly positive exterior Weyl energy. Even among exteriors admitting homotopy-sphere fillings, small energy does not force the topology of a double in Gursky's equality case. All fillings in the periodic **punctured** monodromy class that are homotopy spheres are standard. A fixed adiabatic metric path gives a scalar-curvature obstruction for nonperiodic marked monodromy and a Yamabe-sign obstruction when the monodromy preserves a volume density. No qualifying filling of unknown smooth type is constructed.

## A positive collar and its Weyl energy

Let \(Q=S^3/\Gamma\) be a round, oriented spherical space form of sectional curvature \(+1\), and let an orientation-preserving isometry \(\varphi\) of \(Q\) fix \(p\). Remove an invariant geodesic ball about \(p\). The punctured manifold \(P\) admits a smooth \(\varphi\)-invariant metric \(h\) with \(R_h>0\), round outside the coordinate neighborhood of \(p\), and \(ds^2+a^2g_{S^2}\) on a full boundary collar. Here is a construction that stays within the injectivity radius of \(p\).

Choose \(0<2b<1\) with \(\arcsin(2b)<\operatorname{inj}_{Q}(p)\). Take a smooth nonincreasing \(\chi\) equal to \(1\) below \(b\) and \(0\) above \(2b\), with \(|\chi'|\le C/b\) for a fixed \(C>0\). Choose \(0<a<b/4\) and \(aC<b^3\). Define

\[
y(v)=(1-v^2)\left(1-\frac{a\chi(v)}v\right),\qquad a\le v\le 2b.
\]

Put \(f(s)=a\) for \(s\le0\), and for \(s>0\) define \(f\) by \(f'^2=y(f)\) on the increasing branch, starting at \(f(0)=a\). The simple zero \(y(a)=0\), \(y'(a)=(1-a^2)/a>0\) makes the inverse of \(s=\int_a^f y(v)^{-1/2}dv\) smooth up to \(s=0\) from the right, with \(f'(0+)=0\). Extend the increasing branch to the round profile where \(y=1-v^2\). For \(ds^2+f^2g_{S^2}\), the radial and tangential sectional curvatures are \(k_r=-f''/f\) and \(k_s=(1-f'^2)/f^2\). In the increasing region, \(R_h=4k_r+2k_s\), so

\[
R_h=\frac{2(1-y-vy')}{v^2}
    =6-\frac{4a\chi(v)}v+\frac{2a(1-v^2)\chi'(v)}{v^2}.
\]

This is at least \(2\) on \(a\le v\le b\) and greater than \(3\) on the cut-off region \(b\le v\le 2b\), by the choices of \(a,b,C\). It is \(2/a^2\) on the product segment. To smooth the sole joint at \(s=0\), use \(f''\le (1-a^2)/(2a)\) on a small two-sided neighborhood in the weak sense. On the right this follows from \(y''(v)=-2-2a/v^3<0\) where \(\chi=1\). Choose the neighborhood small enough that the upper bounds for \(f\) and \(|f'|\), together with this upper bound on \(f''\), imply \(2ff''+f'^2<1\) with a strict margin. Nonnegative convolution preserves the three separate bounds on a smaller neighborhood. Paste the convolution to the original profile with a cutoff supported in the neighborhood. On the cutoff transition the unsmoothed \(f\) is smooth, so the pasted function converges there in \(C^2\) as the convolution scale shrinks. Thus strict positivity persists, with an unchanged product interval at the chosen boundary. The angular action throughout the patched chart is the rotation \(d\varphi_p\) on directions. The rest of \(Q\) has its original smooth metric, including at the cut locus. This constructs the desired metric on the punctured space form, using a radial coordinate change on the construction interval.

For \(\ell>0\), set

\[
X_\ell=(\mathbb R\times P)/((t+\ell,x)\sim(t,\varphi(x))),
\qquad g_\ell=dt^2+h.
\]

The metric is locally a product. Its collar is a product in the normal direction even when the \(S^2\) factor has rotation holonomy in \(t\). Its oriented boundary has \(B=0\) and is diffeomorphic to \(S^1\times S^2\), since the angular rotation is isotopic to the identity. Reflection gives the smooth double with the same expression and with \(h\) replaced by its smooth double \(h_D\). Both \(R_{g_\ell}=R_h\) and \(R_{Dg_\ell}=R_{h_D}\) are strictly positive. The latter gives a positive Yamabe constant by compactness and the Sobolev inequality.

Use \(T=4\pi^2\) and \(e_X=(E_++E_-)/2\) in the parent Hilbert–Schmidt convention. In a vertical Ricci eigenframe, set \(z_i=\rho_i-R_h/3\). The Weyl eigenvalue on each \(e^0\wedge e^i\) and its complementary vertical bivector is \(-z_i/2\), by subtracting the four-dimensional Schouten term from the mixed and vertical sectional curvatures. Thus \(W^+\) and \(W^-\) have identical squared norms \(\tfrac14\sum_i z_i^2\), for either ambient orientation, and

\[
e_X=E_+(X_\ell)=E_-(X_\ell)=\frac{\ell}{4}\int_P|\operatorname{Ric}_h^\circ|^2\,dV_h.
\]

In the radial region \(\sum_i z_i^2=\tfrac23(k_r-k_s)^2\), which equals \(2/(3a^4)\) on the exact product collar. It vanishes outside the modified radial region. The integral is fixed, finite and positive. In particular \(0<e_X<\tfrac23T\) for all sufficiently small \(\ell\), and \(e_D=2e_X\). The constant test function yields

\[
0<Y(DX_\ell,[Dg_\ell])\le \sqrt{\ell}\,
\frac{\int_{DP}R_{h_D}\,dV_{h_D}}{\sqrt{\operatorname{Vol}(DP,h_D)}}.
\]

The energy limit is a collapsing limit with no uniform lower bound for the Yamabe constant. It excludes topology control by an absolute small-energy assumption and mere Yamabe positivity. A stability theorem with additional scale-invariant noncollapse hypotheses would need a separate test.

## The marked meridian and the two closings

The puncture has \(H_*(P;\mathbb Q)=H_*(\mathrm{pt};\mathbb Q)\) and \(\pi_1(P)=\Gamma\). These follow by removing a ball from the rational homology sphere \(Q\), using transfer for \(S^3\to Q\). The mapping torus therefore has rational circle homology. Choose a fixed point on the boundary rotation axis, use its suspension to mark the meridian \(t_0\), and let \(\alpha\in\operatorname{Aut}(\Gamma)\) be the resulting based action, with the suspension convention fixed by \(t_0\gamma t_0^{-1}=\alpha(\gamma)\). Inverting that convention has no effect on the quotient. Van Kampen gives

\[
\pi_1(X)=\Gamma\rtimes_\alpha\mathbb Z,
\qquad
\pi_1(X\cup S^2\times D^2)
=\pi_1(X)/\langle\!\langle t_0\rangle\!\rangle
=\Gamma/\langle\!\langle \alpha(\gamma)\gamma^{-1}:\gamma\in\Gamma\rangle\!\rangle.
\]

More generally a boundary marking of an orientation-preserving punctured mapping torus fixes a stable letter up to conjugacy and inversion. In the filled mapping torus the corresponding section may be represented by \(\gamma_0t_0\) relative to an unmarked choice \(t_0\), and then the quotient uses \(\operatorname{Inn}(\gamma_0)\alpha\). An unpointed conjugacy class of monodromy does not by itself record which loop is killed.

For any boundary gluing, \(\pi_1(S^1\times S^2)\) is sent to the same normal subgroup because its generators differ by sign. The cap is simply connected and each closing has \(\chi=0+2-0=2\). For a closed connected oriented smooth four-manifold of this Euler characteristic, simple connectivity is equivalent to being a homotopy sphere. Indeed integral duality and the universal coefficient theorem make \(H_2\) torsion-free and \(H_3=0\). Then \(\chi=2\) gives \(H_2=0\), and Hurewicz and the homology Whitehead theorem give the homotopy equivalence. Triviality of the meridian quotient is thus necessary and sufficient here, for either framing.

| Model with \(Q=L(m,1)\), \(m>1\) odd | Action on \(C_m\) | Meridian quotient | Conclusion |
| --- | --- | --- | --- |
| Identity monodromy | Identity | \(C_m\) | The filling is not a homotopy sphere. This refutes the literal exterior statement formulated without the homotopy-sphere hypothesis. |
| Complex conjugation on both coordinates of \(S^3\subset\mathbb C^2\) | Inversion | \(C_m/\langle g^2\rangle=1\) | Both framings give homotopy spheres, standard by the argument below. |

For the second row, the deck group acts by scalar multiplication. Conjugation normalizes that action, preserves the orientation of the ambient real four-space, fixes the class of \((1,0)\), and acts by a half-turn on its tangent three-space. Its based action is computed by lifting at that fixed point. In either row, the double fibers over the circle with fibre \(DP=Q\#\overline Q\). The induced monodromy on it is periodic, so \(\pi_1(DX)\) contains \((\Gamma*\Gamma)\times\mathbb Z\) at finite index. For \(\Gamma\ne1\), a product of one nontrivial element from each factor has infinite order by the free product normal form. This supplies a subgroup \(\mathbb Z^2\), while a compact quotient of \(S^3\times\mathbb R\) by a free properly discontinuous group of product isometries has virtually cyclic fundamental group. In the latter case discreteness and compactness of the sphere isometry group give finite kernel and discrete image in \(\operatorname{Isom}(\mathbb R)\). Thus even the homotopy-closing examples lie outside the topology of Gursky's cylinder-quotient equality class for every \(\ell>0\), while their energy tends to zero. Their exteriors themselves are not \(S^1\times B^3\), since their groups contain \(C_m\). The Gursky comparison concerns the smooth \(Y>0\), \(b_1>0\) equality class. Here \(\chi=\tau=0\), so zero Weyl energy would give \(\int Q_g\,dV_g=0\) by Chern–Gauss–Bonnet in the conventions of Chang's survey. [Gursky 1998, bibliographic record](https://annals.math.princeton.edu/articles/12993) · [Sun-Yung A. Chang, On a Fourth Order PDE in Conformal Geometry, Theorem 4.4(ii)](https://web.math.princeton.edu/~chang/cald-010200.pdf).

## Periodic punctured monodromy

Suppose instead that \(\varphi:P\to P\) is any actual finite-order smooth orientation-preserving diffeomorphism, of order \(d\). An invariant metric obtained by finite averaging provides an invariant normal collar. The boundary action is smoothly conjugate to an axial rotation \(A_{2\pi k/d}\). To see this, uniformize the conformal class of the averaged boundary metric and conjugate its finite-order Möbius transformation to a rotation, with \(k=0\) for the identity. The averaging collar makes the product normal extension equivariant. If the action is given on a closed spherical manifold with a marked fixed point, the same metric construction as above applies after taking an invariant round metric from Dinkelbach–Leeb, Theorem E and Corollary 5.4(i). Those statements concern genuine smooth finite group actions on closed elliptic three-manifolds. They do not realize a finite-order mapping class by a marked periodic diffeomorphism. [Dinkelbach–Leeb, author version, 9 January 2009](https://www.mathematik.uni-muenchen.de/~leeb/pub/act3mfs.pdf).

In the product boundary coordinate \(u=A_{2\pi k t/(d\ell)}x\), \(\psi=2\pi t/\ell\) for the convention \((t+\ell,x)\sim(t,\varphi(x))\), the translation \(t\mapsto t+d\ell\theta/(2\pi)\) acts by

\[
(e^{i\psi},u)\longmapsto(e^{i(\psi+d\theta)},A_{k\theta}u).
\]

It is an effective \(S^1\)-action on the exterior since \(d\) is the order of the diffeomorphism on \(P\). Composing the boundary identification with the \(j\)-fold rotating twist changes the second weight to \(k+jd\). The corresponding action on the cap is

\[
(z,u)\longmapsto(e^{id\theta}z,A_{(k+jd)\theta}u),
\qquad z\in D^2.
\]

This is smooth through \(z=0\), and the collars identify it smoothly with the exterior action. There are only two relevant boundary isotopy classes modulo maps extending over the cap. Hatcher's smooth homotopy-type description gives the two independent factor signs and \(\pi_1(SO(3))=\mathbb Z/2\), represented by \(j=0,1\). The factor signs extend over \(S^2\times D^2\). For an oriented gluing one fixes the required product orientation convention and uses signs of compatible combined parity. Hence up to diffeomorphism all these smooth closings have the asserted action. The construction uses no cap metric. [Hatcher, *On the Diffeomorphism Group of \(S^1\times S^2\)*, revised December 2003, p. 1](https://www.maths.gla.ac.uk/~mpowell/Hatcher-newDiffS1xS2.pdf).

For trivial meridian quotient the filled manifold is closed, smooth, simply connected and a homotopy four-sphere. The smooth effective circle action qualifies for smooth standardness by the circle-action classification of Fintushel and Pao with three-dimensional Poincaré. Parent Proposition 6.2(2) uses the same classification. The boundary extension above was derived independently and applies to arbitrary smooth gluing diffeomorphisms. [Fintushel, 1976](https://doi.org/10.1215/S0012-7094-76-04306-4) · [Pao, 1978](https://doi.org/10.1016/0040-9383(78)90033-2) · [Plotnick 1986, Proposition 6.1, primary corroboration for periodic exterior monodromy](https://community.ams.org/journals/tran/1986-296-02/S0002-9947-1986-0846597-6/S0002-9947-1986-0846597-6.pdf). Pao's publisher abstract and Plotnick's full-text Proposition 6.1 were inspected here. The smooth form of the classification is also stated in [Galaz-García and Searle 2014, Theorem 3.2](https://msp.org/gt/2014/18-3/gt-v18-n3-p05-s.pdf). The original smooth recognition proofs were inaccessible in this packet. The E04 audit also had only the publisher abstract for Pao and encountered the provider challenge for Fintushel 1976. All web passages cited in this note were accessed on 27 November 2026.

## What the same collapse would require for a general monodromy

Replacing periodicity on \(P\) by finite order of \(\alpha\) in \(\operatorname{Aut}(\Gamma)\) does not suffice. In fact \(\alpha\) has finite order for every \(\Gamma\) here. Plotnick–Suciu exhibit the distinction in the type II case of §5, pp. 523–524. For \(\Gamma=Q_8\times C_m\), \(m>1\) odd, the distinguished order-six automorphism acts by an order-three permutation of quaternion generators after choosing their signs, and by inversion on \(C_m\). In cyclically permuted generators \(i,j,k=ij\), killing the meridian identifies \(i=j=k\). The relation \(ij=k\) forces their common image to be trivial. The relation \(g=g^{-1}\) simultaneously kills \(C_m\), since \(m\) is odd. Plotnick–Suciu give realizability by diffeomorphism and an obstruction to periodic realization of this marked action. A finite-order representative of the **closed unpointed** monodromy may act freely at the marking and offer no invariant ball about that section. Jabłonowski's preprint arXiv:2609.29839, in the rendered text dated 24 September 2026, gives the distinction in Remark 2.4 and reports in Theorem 8.1 that both \(m=7\) surgeries are standard by a different argument. These sources do not supply a qualifying small-energy exterior for a nonperiodic marked monodromy. Their historical lists of unknown smooth cases cannot be used as a current classification. [Plotnick–Suciu, *Fibered Knots and Spherical Space Forms*, 1987, §5](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/135209/jlms0514.pdf?sequence=1) · [Jabłonowski, *Fibred realizations of the prism quandle \(P_7\) in the standard four-sphere*, arXiv:2609.29839, checked passages](https://arxiv.org/abs/2609.29839).

Here is the obstruction for the immediate replacement of \(h\) by a fixed smooth path \(h_t\), \(0\le t\le1\), with jets matched by \(h_{t+1}=\varphi^*h_t\). Use \(g_\ell=\ell^2dt^2+h_t\), and denote \(K=\tfrac12\partial_t h_t\) and \(H=\operatorname{tr}_{h_t}K\), the second fundamental form and mean curvature with our coordinate \(t\) before normalizing by \(\ell\). The Gauss and normal curvature identities give

\[
R_{g_\ell}=R_{h_t}-\ell^{-2}(2\partial_tH+H^2+|K|^2).
\]

If \(R_{g_\ell}\ge0\) along a sequence \(\ell\to0\), the fixed path must satisfy \(2\partial_tH+H^2+|K|^2\le0\). Along an entire suspension line at a fixed \(x\) on the mapping-torus cover, \(H\) is a bounded smooth function on \(\mathbb R\). The scalar inequality \(2H'\le-H^2\) forces \(H=0\). The reciprocal inequality would give finite-time divergence in the forward direction from a negative value and in the backward direction from a positive value. Then \(K=0\) as well, so the path is constant and \(\varphi\) preserves that metric.

There is also an obstruction for positive Yamabe type itself in this ansatz. Suppose the path is product near the puncture so that it has a smooth reflected double, and the doubled fibre admits a smooth positive \(\varphi\)-invariant density \(\nu\). For the notation below use the doubled \(h_t\) and integrals over the doubled fibre. Write \(q_t=dV_{h_t}/d\nu\) and test the Yamabe numerator on the positive function \(u=q_t^{-1/3}\), which descends by the endpoint condition and invariance of \(\nu\). Its derivative is \(u'=-Hu/3\) since \(q_t'=Hq_t\). For a smooth descending test function \(w\), integration by parts in \(t\), with endpoint cancellation, gives the exact numerator

\[
\int (6|\nabla w|_{g_\ell}^2+R_{g_\ell}w^2)\,dV_{g_\ell}
=\ell\int (6|\nabla^{h_t}w|^2+R_{h_t}w^2)\,dV_{h_t}\,dt
 +\ell^{-1}\int\Big(6(w'+Hw/3)^2-|K^\circ|^2w^2\Big)\,dV_{h_t}\,dt.
\]

If \(K^\circ\) is nonzero somewhere, the numerator at \(u\) is strictly negative for all sufficiently small \(\ell\). If \(K^\circ=0\), then \(q_t^{-2/3}h_t\) is independent of \(t\) and \(\varphi\) preserves it. Restricting back to \(P\), the compact closure of its powers in the isometry group is abelian. Each component of a compact abelian Lie group contains a finite-order element, by using a root in its identity torus to cancel a power, so \(\varphi\) is isotopic through boundary-preserving isometries to a periodic map. Such an isotopy gives a diffeomorphism of mapping tori that takes the boundary to the boundary and hence carries the two fillings to the two fillings. Therefore a truly nonperiodic marked class cannot yield a positive double by this fixed-path, constant-lapse, zero-shift collapse with invariant fibre density. The raw scalar argument did not need a density. This Yamabe-sign calculation gives no restriction on \(\ell\)-dependent paths with degenerating fibre geometry or on arbitrary collapse geometries outside the displayed ansatz.

When \(\varphi\) is the identity near the puncture, the invariant-density hypothesis can always be arranged for a representative of the same marked class. Choose an oriented volume form \(\nu\) that is a product near the boundary. The difference \(\varphi^*\nu-\nu\) vanishes in that collar and has total integral zero, so compactly supported Poincaré duality on the interior gives a compactly supported primitive. Applying Moser's path argument to \((1-s)\nu+s\varphi^*\nu\) gives an isotopy \(\xi_s\), fixed near the puncture, with \(\xi_1^*\varphi^*\nu=\nu\). The monodromy \(\varphi\circ\xi_1\) preserves \(\nu\) and its reflected extension preserves the doubled density. This explains why interpolating a fixed path for a volume-preserving representative does not extend the collapse to a nonperiodic class.

## Evidence and routing

- **Analytical and exact.** The collar, scalar signs, chirality and energy identities, collapse estimates, meridian quotient and action extension are direct arguments. Smooth recognition of a homotopy sphere with a circle action is an imported theorem. The equality comparison uses Gursky's equality classification as stated in the cited author survey because the original article text was inaccessible here. The construction of the collapsing family and its meridian quotient do not depend on that classification.
- **Certified numerical evidence.** None required or generated. The scalar and energy bounds above are analytic.
- **Floating evidence.** Parent Remark 6.3 and the original `check_02` output use another exterior gauge and other matching data. No run, cap-energy transfer or assembled subcritical class is claimed here.
- **Boundary of this packet.** A positive-energy topology gap for the double and the unconstrained closing statement fail. The gap for a marked homotopy-sphere closing is unresolved by this packet. A continuation based on a genuinely nonperiodic marked example would need a new mechanism for producing an umbilic positive double with \(e_X<\tfrac23T\), separately from identifying both filled smooth types.
