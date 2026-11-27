# E84 · Odd intermediate, its smooth fibre and its actual reverse section

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. [Frozen E84 request](../research-progress/handoffs/E84_REQUEST_R1.md), baseline 72068cef1973d23aee808fe66476c44ed4b99cc5. The request specifies bounded Sol/ultra. Actual serving settings are unavailable. Inputs are the [marked two-stage local surgery](../reviews/E76_RECOGNITION_TRANSFER.md), the [signed E70 presentation at \(a+\mu\)](E70_EQUIVARIANT_SURGERY.md#4-eliminations), and the [actual lift of the old branch knot](MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts). Manifolds and actions are smooth and oriented. In this note \(W_1\) is the closed four-dimensional intermediate, \(Q_1\) is its three-dimensional orbit orbifold, and \(\Sigma_1\) is the original odd framed homotopy four-sphere.

The intermediate \(W_1\) is a smooth mapping torus of \(X=\Sigma_2(K_1)\), the branched double cover of the single lifted old knot in \(S^3\). The unpointed return map has order four and \(X\) is a connected sum of two lens spaces with cyclic group of order seven. The actual reverse circle can be made a section of this fibration with its supplied product normal framing. Its pointed automorphism has infinite order, which precludes a periodic representative fixing the point and realizing this section. Its image in the orbit amalgam has translation length two.

## 1. Peripheral marking and groups

Use the positive Wirtinger meridian of the E70 regular surgery component \(L\), up to conjugation from the common choice of path to the replacement tube. E70 identifies the filled slope \(a+\mu\) with the diagram's zero longitude of \(L\). The meridian \(\mu\) from the original solid torus remains a longitude of the replacement, since its intersection with the new meridian \(a+\mu\) has magnitude one. In the chart of the second surgery the reverse circle is the \(S^1_\mu\) core of the inserted \(S^1_\mu\times D^3\). Projection to the orbit orbifold kills the \(S^1_f\) factor and sends that core to the core of the regular replacement solid torus. Thus the oriented class of the reverse circle projects to \(L\) or \(L^{-1}\), according to the comparison of the two meridian orientations, up to conjugation. Orient \(\delta\) so the image is \(L\) and fix a compatible basepoint path. Geometrically this identifies the inverse-surgery circle, beyond the fact that it is primitive in total-space homology. [E70, the regular slope and the tangle meridian](E70_EQUIVARIANT_SURGERY.md#2-the-marked-quotient-three-ball-and-the-three-attachments) · [E76, local reverse circle](../reviews/E76_RECOGNITION_TRANSFER.md#actual-geometric-hypotheses-and-reverse-circle)

In the E70 notation,
\[
 G_1=\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle
     =C_4*_{C_2}D_{14},\qquad L=qc .
\]
Here \(D_{14}\) has order fourteen and the edge group is \(\langle q^2\rangle\). The letter \(q\) belongs to the first vertex group outside the edge group, and \(c\) belongs to the second vertex group outside that edge group. Thus \(L\) is cyclically reduced of syllable length two. In the Bass–Serre tree with edges of length one it translates by two, as can also be seen by concatenating the reduced paths for the powers \(L^k\). Its inverse and any conjugate have the same translation length. All circle-action orbits project to elements represented by the trivial or order-two local orbit subgroup. The image of \(\delta\) has infinite order, so \(\delta\) cannot be isotoped, or even freely homotoped, to an orbit of this action.

The surgery relation gives \(H_1(W_1)=\mathbb Z\) with \(\delta\) primitive. Indeed, its complement is also the complement of the framed compressed sphere in the homotopy sphere \(\Sigma_1\). Excision and the Thom isomorphism make the meridian generate the first homology of that complement. Reattaching \(D^3\times S^1\) identifies the meridian with its core \(\delta\) and keeps this homology group. Write \(\Pi=\pi_1(W_1)\) and \(\nu:\Pi\to\mathbb Z\) for abelianization with \(\nu(\delta)=1\). Let \(h\) be the class of a principal action orbit. Its class is central and the orbit orbifold quotient of \(\Pi\) is \(G_1=\Pi/\langle h\rangle\), by the homotopy sequence of the orbifold circle bundle. This sequence uses the actual retained slice isotropy. Abelianizing the quotient yields \(\mathbb Z/\nu(h)\mathbb Z\simeq G_1^{\rm ab}=C_4\). Choose the orientation of the action parameter so \(\nu(h)=4\). In particular \(h\) has infinite order. [E76, central orbit exact sequence](../reviews/E76_RECOGNITION_TRANSFER.md#total-space-group-and-the-degree-of-a-principal-orbit)

In \(G_1^{\rm ab}\) the relations are \(4[q]=2[c]=0\) and \(7([c]+2[q])=0\), whence \([c]=2[q]\). Because \([L]\) is the reduction of \(\nu(\delta)=1\), the required quotient is
\[
 \alpha:G_1\to\mathbb Z/4,\qquad
 \alpha(q)=-1,\quad \alpha(c)=2,\quad \alpha(L)=1 .
\]
The map \(x\mapsto(\bar x,\nu(x))\) is the isomorphism
\[
 \Pi \simeq G_1\times_{\mathbb Z/4}\mathbb Z .
\]
It is injective since an element trivial in \(G_1\) is a power of \(h\) and its degree is four times that power. Given a compatible pair, any lift of its first component has degree congruent to the second, so a power of \(h\) corrects it. In this model \(\delta=(L,1)\) and \(h=(1,4)\).

Define \(r=cq^2\) and \(r_1=qrq^{-1}\). The presentation for \(G_1\) becomes
\[
 G_1=\langle q,r\mid q^4=r^7=1,\ q^2r q^{-2}=r^{-1}\rangle
   =(\langle r\rangle*\langle r_1\rangle)\rtimes_{\theta}\langle q\rangle ,
 \qquad \theta(r)=r_1,\quad \theta(r_1)=r^{-1}.
\]
For the last equality, add \(r_1=qrq^{-1}\) and write the second conjugation relation as \(qr_1q^{-1}=r^{-1}\). The displayed automorphism has order four and gives the semidirect product with precisely these relations. Thus
\[
 [\Pi,\Pi]=\ker\nu \simeq [G_1,G_1]=\ker\alpha
   =\langle r\rangle*\langle r_1\rangle \cong C_7*C_7 .
\]

## 2. A smooth fibration with the actual reverse circle as section

Choose a smooth closed one-form \(\omega_0\) with integral periods representing \(\nu\). Average it over the given circle action to obtain a closed invariant \(\omega\) in the same cohomology class, since every rotation is isotopic to the identity. For the infinitesimal generator \(V\) with period one, Cartan's formula gives \(d(\omega(V))=0\). Evaluation on a principal orbit makes this constant \(4\). Integration modulo \(\mathbb Z\) therefore gives a smooth submersion \(F:W_1\to\mathbb R/\mathbb Z\),
\[
  F(\rho(t)x)=F(x)+4t\pmod{\mathbb Z},\qquad t\in\mathbb R/\mathbb Z ,
\]
where \(\rho\) denotes the original action. The level \(X=F^{-1}(0)\) is closed and smooth. The action parametrizes the fibration explicitly by \((t,x)\mapsto\rho(t/4)x\), with \((t+1,x)\sim(t,Dx)\) for \(D=\rho(1/4)|_X\). Surjectivity of \(\nu\) and the connectedness of the total space imply that the fibre is connected, by the component sequence of this bundle.

The orbit map restricted to \(X\) is the connected degree-four cyclic orbifold cover of \(Q_1\). Every regular orbit meets the level in four points, with \(D\) acting transitively, and local slices identify the map over the old order-two locus with the smooth transverse branched charts. In particular the action of \(D\) on \(X\) has order four, with the old slice half-turn given by \(D^2\). This directly identifies the cover in the geometry of \(W_1\). Its group is \(\ker\alpha\). The mod-two reduction of \(\alpha\) kills the local meridian \(c\) and is the nontrivial ordinary character of \(|Q_1|=\mathbb{RP}^3\). The degree-two ordinary cover has underlying \(S^3\) and contains the single lifted order-two knot \(K_1\), since the old knot has odd winding in the marked solid torus. The remaining degree-two cover is the branched double cover along \(K_1\), because on this knot orbifold the order-two character is specified by the meridian and is unique. The regular dual core carries no branching. [Marked lens filling and the single-knot lift](MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts)

The averaged form may be arranged so that the actual \(\delta\) is a section. In the regular replacement \(S^1_\mu\times D^2_{a+\mu}\times S^1_f\), take positively parametrized \(\mu,f\) of period one with the choices in §1. There \(\omega=4\,df+\eta\), where invariance and the given contraction make \(\eta\) a basic closed one-form on \(S^1_\mu\times D^2_{a+\mu}\). Since \(\int_\delta\omega=1\), it has \(\eta=d\mu+d\psi\) for a real smooth \(\psi\) on this solid torus. Subtract \(d(\chi\psi)\) using a base cutoff \(\chi\) supported inside the replacement and equal to one near its core. This preserves invariance, the period class and \(\omega(V)=4\) on the entire manifold. Now \(F=\mu+4f+\text{constant}\) near \(\delta\), which holds at fixed \(f\) on the disk center, so \(F|_\delta\) is a diffeomorphism. In the reverse product tube, use transverse coordinates consisting of the two disk coordinates and a real fibre interval \(v\) about the fixed \(f\). The change from \(\mu\) to \(\mu+4v\) is a triangular shear. The two disk vectors are unchanged and the fibre vector changes by a multiple of the tangent to \(\delta\) when viewed in the fibre tangent spaces. Thus the given reverse normal framing identifies with a fibrewise product normal framing, with no additional twist. Taking a small fibrewise ball about this section gives the punctured-fibre bundle for the actual surgery exterior. Its prescribed \(D^2\times S^2\) attachment recovers \(\Sigma_1\).

## 3. Prime factors and the marked pointed return

The closed fibre \(X\) has fundamental group \(C_7*C_7\). Kneser–Milnor and uniqueness of the Grushko free product decomposition give two nontrivial primes with group \(C_7\) and no free factor. Each is a lens space by elliptization and the orthogonal realization of a free cyclic action on \(S^3\). Simply connected prime factors are \(S^3\). The unpointed monodromy exchanges the conjugacy classes of the two finite factors and its square sends each generator to its inverse up to conjugacy, by the action of \(\theta\) or its inverse. The calculation does not determine the oriented lens parameters. [Milnor, *A Unique Decomposition Theorem for 3-Manifolds*](https://www.jstor.org/stable/2372800) · [Grushko theorem stated in Diao–Feighn, Theorem 1.1](https://msp.org/gt/2005/9-4/gt-v9-n4-p02-p.pdf) · [Perelman, *Finite extinction time*, §1](https://arxiv.org/pdf/math/0307245)

Under the group convention that positive meridian action is \(x\mapsto\delta x\delta^{-1}\), the pointed action on \(C_7*C_7\) is specified more closely. Since \(c=rq^2\), one has \(L=r_1q^{-1}\). Consequently the action is
\[
 \operatorname{Ad}_{r_1}\theta^{-1}:\qquad
   r\longmapsto r_1^{-1},\qquad
   r_1\longmapsto r_1 r r_1^{-1}.
\]
Using the inverse convention for the based return replaces this automorphism by its inverse. Its fourth power is conjugation by
\[
 L^4=r_1r r_1^{-1}r^{-1}.
\]
This is a nontrivial reduced word, and all its nonzero powers are nontrivial. The center of a free product of the two nontrivial cyclic groups is trivial by normal form. Thus the based action has infinite order. Changes of based fibre identification conjugate the automorphism, preserving its order. There cannot be a finite-order diffeomorphism fixing a point and inducing the based action of this section. This excludes replacing the marked return by a periodic pointed map even though the unpointed return in §2 is periodic. Together with the orbit obstruction in §1, it limits the extent to which the even exceptional-orbit surgery argument transfers to this intermediate. The mapping torus and its marked group do not determine the smooth type of the resulting odd homotopy sphere.
