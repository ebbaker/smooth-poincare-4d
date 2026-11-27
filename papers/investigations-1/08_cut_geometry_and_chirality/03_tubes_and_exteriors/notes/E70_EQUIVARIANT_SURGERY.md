# SP4-CUT-TUBE-E70 — The actual quotient tangle and its filled groups

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance at baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Actual helper model and effort are unavailable. Inputs are the [marked orbit construction](E39_PRISM_FILLINGS.md), the [lifted figure-eight](E62_FIGURE_EIGHT_LIFT.md), the [E64 surgery and cone markings](../reviews/E64_FIGURE_EIGHT_REPLAY.md), and the [E68](E68_CROSSING_ALEXANDER.md) and [E69](../reviews/E69_COVER_TORSION.md) independent invariants. All three-dimensional quotients and fillings are oriented. Meridians are positive in the normal orientation induced by the indicated oriented strand. \(D_{2p}\) denotes a dihedral group of order \(2p\).

For the original order-seventeen orbit orbifold, the actual slopes \(a\) and \(a+\mu\) give orbifold groups
\[
G_0\cong D_6\cong S_3,\qquad
G_1\cong C_4*_{C_2}D_{14}.
\]
Only the original order-two knot is singular in these orbifolds. The first group supplies the odd-dihedral circle-action recognition for its corresponding marked smooth four-dimensional filling. The second group is infinite and noncyclic. The alternate slope \(a-\mu\) for the same second framing parity has a nonabelian finite image. The smooth type of the other four-dimensional filling remains open.

## 1. Equivariant pair-of-pants section and crossing

Let \(M^+=S^3/(T^*\times C_{17})\). The odd deck involution \(\tau\) reflects the oriented Hopf base, exchanges the two order-three cones and reverses the right fibre angle. The order-two cone lies on the mirror. Remove small invariant disks about the cones, obtaining a pair of pants \(P\), and denote by \(d_2,d_+,d_-\) its section loops positively oriented about the removed disks. Keep the positive regular fibre \(f\). E64 determined the fractional local fibre turns as \(1/2,2/3,2/3\), and the integer corrections \(n_i\) satisfy \(n_2+n_++n_-=1\).

The fixed locus on \(P\) is one interval \(I\), with its endpoints on the circle about the order-two cone. The preimage of \(I\) has two fixed sections. Choose either one. In a collar of \(I\) it extends equivariantly, for instance by transport in the invariant horizontal distribution for the Hopf connection, which changes sign under \(\tau\). The half of \(P\) containing the positive cone boundary is an annulus. A section extends the specified collar section because the bundle is trivial there and the prescribed subinterval of the outer boundary is contractible. Multiplying by a circle-valued gauge that is one on the specified collar can change its winding around the positive cone by any integer. Such a gauge can have degree one around the annulus and restrict to a constant on a short prescribed arc of its outer boundary. Reflect this section onto the other half. Reflection reverses both the base loop and the fibre, so \(n_+=n_-\) in conjugate radial cone charts. Taking \(n_+=0\) gives \(n_-=0,n_2=1\). Thus in the resulting product angle \(\theta\), measured in turns, the action is \((x,v,\theta)\mapsto(-x,v,-\theta)\) on a symmetric planar model of the base away from the order-two disk.

The crossing in the E62 lift has height difference
\[
h_*=\frac{17}{\pi}\arccos(1/\sqrt3)-5,\qquad 0<h_*<1/4.
\]
The reflection interchanges its two preimages. Choose the section on \(I\) to take their short-arc midpoint at the crossing. The other fixed section differs by \(1/2\) there. The crossing heights are \(-h_*/2,h_*/2\), in the order that starts the negatively oriented positive-cone lobe. In this section the open positive-cone lobe has real height change \(+h_*\). Indeed its angular horizontal phase from E62 is \(+\vartheta\), and the local radial section correction subtracts \(5\) regular turns, giving \(\vartheta/(\pi/17)-5=h_*\). This is also the negative of the E64 section connection integral on the negatively oriented positive-cone lobe. The integer normalization \(n_+=0\) is what fixes the real change. Reflection gives the opposite return change, so the real lift of the height can be taken anti-periodic under the half-period exchange.

Choose symmetric oriented base coordinates with the order-two disk at infinity. The two labelled lobes, each enclosing exactly its own cone, are carried to the model projection
\[
x(u)=2\sin u,\qquad v(u)=\sin2u.
\]
This can be done on one half-disk by matching the oriented crossing tangents near the mirror and extending over the embedded lobe disk and its complement relative to the cone label. Reflect to the other half. The positive-cone lobe is clockwise, and the two tangent vectors at the crossing have positive determinant in their order along the lifted knot. The knot is then isotopic through sections of this immersed curve to
\[
K(u)=(2\sin u,\sin2u,-H\cos u),\qquad u\in\mathbb R/2\pi\mathbb Z,\quad 0<H<1/4 .
\]
Use linear interpolation of the real anti-periodic height to the displayed height with its same crossing order. Throughout, the two crossing heights differ by a number strictly between \(0\) and \(1/2\), and neither is a fixed fibre height. There are no other double points of the base curve and no other meetings with the mirror. This gives an equivariant isotopy in the complement of the old fixed set and of the cone tori. The positive fibre vector gives a transverse push throughout. The involution on the curve is \(u\mapsto u+\pi\).

## 2. The marked quotient three-ball and the three attachments

Choose the complement of the order-two base disk as a rounded rectangle, with \(x\) the coordinate reversed at the mirror and \(v\) along it. Before replacing the pair of order-three cone tori, regard them as product solid tori. The quotient of this product region by \((x,\theta)\sim(-x,-\theta)\) at each \(v\) is a disk, with convenient coordinate
\[
w=X+iY=\cosh(c x+2\pi i\theta),\qquad c>0 .
\]
It maps the boundary of the annular double cover to an ellipse. The two fixed strands are \(X=\pm1,Y=0\), parametrized by \(v\). The \(+\) strand has \(\theta=0\) on the mirror and the \(-\) strand has \(\theta=1/2\). The quotient region is a ball. The two swapped cone tori project to a single ordinary surgery component \(F\), which before filling is the ellipse at some \(0<x=a_F<2,\ v=0\). Its longitude is the positive product fibre and its meridian \(d_+\). Thus the ordinary filling relation is \(\mu_F^3\lambda_F^{-2}=1\).

The regular quotient knot \(L=K/\tau\) is the closed curve
\[
w(u)=\cosh(2c\sin u-2\pi iH\cos u),\quad
v(u)=\sin2u,\qquad 0\le u\le\pi .
\]
Its projection to the \(w\)-disk is embedded with endpoints identified, winds around \(+1\) and misses \(-1\). Indeed in \(c x+2\pi i\theta\) it is the quotient of the ellipse by \(Z\sim-Z\) in the strip \(|\operatorname{Im}Z|<\pi/2\), and the only branch value there is \(+1\). In that disk projection \(L\) and \(F\) cross twice, where \(x=a_F\), with opposite signs of their relative heights. The vector \(\partial_v\) along \(L\) is the zero ball framing, since one can flatten \(L\) alone in its embedded disk projection.

Compare this zero longitude with the equations for the actual native slope. Along the covering knot choose the oriented normal framing \(F_1=\partial_\theta\), \(F_2=(v',-x',0)/g\), where \(g=(x'^2+v'^2)^{1/2}\). The orientation is base then fibre in coordinates \((x,v,\theta)\). Modulo the tangent to \(K\), the vector \(\partial_v\) has complex normal coordinates
\[
-v'\theta'/g^2-i x'/g .
\]
This has winding \(+1\) over \(0\le u\le2\pi\). Its imaginary part vanishes only at \(u=\pi/2,3\pi/2\), where its real part is respectively positive and negative. Thus the lifted zero ball longitude is \(\lambda_{\rm H}+\mu=2a+2\mu\), using the E62 Hopf push-off \(\lambda_{\rm H}=2a+\mu\). The ball longitude downstairs is therefore \(a+\mu\). The two meridians of the attached ordinary solid torus are \(-\mu_L+\lambda_L\) at \(s=0\) and \(\lambda_L\) at \(s=1\). They carry no new singular isotropy.

It remains to put back the order-two cone disk. Write its boundary base angle \(x_0\) in turns, with \(x_0=0\) at the upper mirror endpoint and \(x_0=1/2\) at the lower one. The positive \(d_2\) runs clockwise about the deleted disk as seen in the planar rectangle, hence through the right half from upper to lower. The diagonal cone model is \((z,\phi)\sim(-z,\phi+1/2)\), with the involution \((z,\phi)\mapsto(\bar z,-\phi)\). One obtains the latter local form at the lift of the base axis \(i\) by left and right multiplication by \(j\), and chooses the phase zero to agree with the selected fixed section at \(x_0=0\). In this cone chart an equivariant lift of the section on the boundary satisfies \(\phi(x_0+1)=\phi(x_0)+3/2\) by \(n_2=1\) and \(\phi(-x_0)=-\phi(x_0)\) by its fixed value. In particular \(\phi(1/2)=3/4\). An equivariant boundary homotopy gives \(\phi(x_0)=(3/2)x_0\) with these endpoints fixed. The smooth solid-torus angles of \((z e^{2\pi i\phi},e^{4\pi i\phi})\) are
\[
(2x_0+\theta,\ 3x_0+2\theta).
\]
They transform by conjugation in both components. Their fixed arcs join the two labels \(\theta=0,1/2\) at each of \(x_0=0,1/2\) separately: at the first end the second solid-torus angle is zero, and at the second it is \(1/2\). The meridian kills translation \(2d_2-3f\) on its boundary pillowcase. This fixes the outer rational tangle with all four endpoint labels.

## 3. An eight-crossing projection and its group

For reproducibility deform the two projected \(w\)-plane loops to circles centered at \(0\) and \(+1\) of radii \(2,3/2\), respectively. This deformation preserves the real line, the labels \(\pm1\), and the two intersections. Along the real line the order is \(F_{\rm left},-1,L_{\rm left},+1,F_{\rm right},L_{\rm right}\), and in each open half-plane there is one transverse intersection. The complementary planar regions give an ambient deformation with this order. On \(L\) the sign of its original \(v\)-height is opposite to \(Y\), so deform it to \(v=-Y\). Deform \(F\) to \(v=Y\). The relative crossing heights keep their signs. The two singular strands remain vertical. Take the projection onto \((X,v)\) viewed from \(+Y\). In this projection \(F\) is counterclockwise, \(L\) clockwise, and both local old strands can be oriented upwards. The positive ambient basis is \((X,v,Y)\). It agrees with \((x,v,\theta)\) by the holomorphic \(w\)-coordinate. The over-strands at positive \(v\) are \(F\) whenever it crosses, and the old \(+\) strand at its upper crossing with \(L\). At negative \(v\) they are \(L\) whenever it crosses, and the old strands when crossing \(F\). The two \(F,L\) intersections have \(X=11/8\), \(v=\pm\sqrt{135}/8\).

Let \(F,L\) also denote the positive meridians of the arcs starting immediately after the lower \(F,L\) crossing on \(F\) and the upper such crossing on \(L\). Let \(b,c\) be the bottom meridians of the \(+,-\) old strands, respectively. In the orbifold tangle \(b^2=c^2=1\). At an oriented crossing put \(\epsilon=\operatorname{sgn}\det(\text{over tangent},\text{under tangent})\) in the displayed plane. The under-arc meridian changes by conjugation by the inverse of the over-meridian raised to \(\epsilon\), and the longitudinal transport records the over-meridian to power \(\epsilon\). For example with over tangent to the right and under tangent up, a front-basepoint path passing under the over-strand from lower to upper winds positively about its right-hand meridian. In the displayed diagram \(\epsilon=-1\) at all eight crossings. The following list includes every undercrossing in its order on the indicated strand:

| Strand traversed | Over-meridians in order | Result |
| --- | --- | --- |
| \(F\) from its chosen arc | \(c,b,L\) | \(F=Lbc\,F\,c^{-1}b^{-1}L^{-1}\), \(\lambda_F=c^{-1}b^{-1}L^{-1}\) |
| \(L\) from its chosen arc | \(b_1,F\) | \(L=Fb_1 L b_1^{-1}F^{-1}\), \(\lambda_L=b_1^{-1}F^{-1}\) |
| Old \(+\) from bottom | \(L,F\) | \(b_1=LbL^{-1},\ b_{\rm top}=Fb_1F^{-1}\) |
| Old \(-\) from bottom | \(F\) | \(c_{\rm top}=FcF^{-1}\) |

There are no self crossings of the two surgery components, so the indicated diagram longitudes have zero framing. The two equality rows for \(F,L\) express precisely the commutators with their displayed longitudes. The other intermediate generators have been eliminated by the listed conjugations.

For the outer closure use the common front-face paths to the four branch endpoints. On the affine universal orbifold cover of the pillowcase let \(r_{ij}\) be the half-turn based by a path into the same open rectangle \(0<x_0<1/2,0<\theta<1/2\), about \((i/2,j/2)\). This open rectangle projects to the front region \(Y>0\) of the boundary sphere, since \(x\ge0\) there and \(\sin(2\pi\theta)>0\). The same front paths used for Wirtinger meridians can connect to its interior without passing behind any strand. Hence the endpoint half-turns \(r_{00},r_{01},r_{10},r_{11}\) map to \(b_{\rm top},c_{\rm top},b,c\), respectively. Composing half-turns using the deck convention gives translations
\[
d_2=r_{10}r_{00},\qquad f=r_{01}r_{00}.
\]
The rational-tangle group is generated by the two fixed-arc meridians with square one. On the pillowcase, passing to the attached solid-torus double cover kills only its primitive meridian translation, and the half-turns extend. Thus the boundary group surjects onto the attaching tangle group and its kernel is the normal closure of \(d_2^2f^{-3}\). Equivalently, after killing the meridian, the boundary translation group is \(\mathbb Z\) with inversion by a half-turn, which is the group of this quotient solid torus with its two fixed arcs. This gives the single outer relation
\[
(b\,b_{\rm top})^2(c_{\rm top}b_{\rm top})^{-3}=1.
\]
The front path choice is essential to this formula. The two square relations, the table, this outer relation and the two ordinary surgery relations now present the actual filled orbifold group.

The unfilled marking gives an independent sign check. Restore the regular tube by imposing \(L=1\), put \(r=cb\), and write \(F'=bFb\). Then \(F,F'\) commute with \(r\), \(F^3=r^2\), \(F'^3=r^{-2}\), and the outer relation is \((F'F^{-1})^2=r^3\). The even subgroup is generated by \(F,F',r\), with these relations. The matrix of its abelian relations has determinant of absolute value \(51\), matching \(H_1(M^+)\) from E64. Reversing just one of the two outer translation signs would instead give determinant of absolute value \(3\).

## 4. Eliminations

In both cases take \(b^2=c^2=1\), \([F,\lambda_F]=[L,\lambda_L]=1\), and \(F^3\lambda_F^{-2}=1\).

For \(s=0\), \(L=\lambda_L=b_1^{-1}F^{-1}\). Substitution of \(b_1=LbL^{-1}\) gives
\[
L=F^{-1}b,\quad b_1=F^{-1}bF,\quad
\lambda_F=cF,\quad b_{\rm top}=b .
\]
Thus \([F,c]=1\), and \(F^3(cF)^{-2}=F=1\). In particular \(c_{\rm top}=c\). The only outer relation left is \((cb)^3=1\). All the eliminated relations are satisfied, so \(G_0=\langle b,c\mid b^2=c^2=(cb)^3=1\rangle\).

For \(s=1\), \(\lambda_L=1\) gives \(F=b_1\) and \(F^2=1\). Put \(q=\lambda_F\). The \(F\)-surgery gives \(F=q^2\) and \(q^4=1\). Direct substitutions give
\[
L=qc,\quad b=cq^2c,\quad b_{\rm top}=q^2,\quad
c_{\rm top}=q^2cq^2.
\]
The outer translations are now \(d_2=(cq^2)^2,\ f=(cq^2)^{-1}\), so their primitive relation is \((cq^2)^7=1\). Conversely these substitutions satisfy all the displayed tangle relations, proving
\[
G_1=\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle.
\]
Introduce \(v=q^2\) to identify this as the amalgam of \(C_4=\langle q\rangle\) and \(D_{14}=\langle v,c\mid v^2=c^2=(cv)^7=1\rangle\) along \(\langle v\rangle\). Its underlying manifold group is \(C_2\), obtained by killing \(c\) and hence \(v\). The index-two orbifold cover over the ordinary universal cover of \(\mathbb{RP}^3\) has group \(D_{14}*_{C_2}D_{14}\), by the index-two subgroup decomposition or by rewriting using \(q\). Its double branched cover along the lifted singular knot has group \(C_7*C_7\), the kernel of the common meridian character. Its abelianization \(C_7\oplus C_7\) agrees with E68–69. The determinant at \(s=0\) also agrees with E68, since the single-knot double branched cover has cyclic group of order three.

For \(s=0\), the E39 equivariant torus construction keeps the old order-two exceptional orbits and has an inverse framed circle surgery giving the actual homotopy four-sphere. The group just computed is dihedral of order \(2\cdot3\). These are the hypotheses of Jabłonowski's Proposition 8.8, including the actual old exceptional orbit. The proposition uses the quotient by a principal-orbit central subgroup to make all degree-one surgery circles freely homotopic to an exceptional orbit, followed by the smooth circle-action recognition. Thus it applies to the framing associated to \(a\), without identifying its label in an earlier external frame convention. For \(s=1\) neither the cyclic nor odd-dihedral hypothesis holds. [Jabłonowski, arXiv:2609.29839, Propositions 8.4 and 8.8](https://arxiv.org/abs/2609.29839) · [Smooth circle-action classification cited in E25](../reviews/E25_HOMOGENEOUS_REPLAY.md#4-smooth-recognition-and-limits).

## 5. The alternate slope \(s=-1\) has a nonabelian image

The same ball longitude gives \(L^{s-1}\lambda_L=1\) for all integer \(s\). For \(s=-1\) this reads \(\lambda_L=L^2\). Hence \(b_1=L^2F\), \(b=LFL\), and
\[
\lambda_F=c\,b\,L^{-1}=cLF=tF,\qquad t=cL.
\]
The commutator \([F,\lambda_F]=1\) gives \([F,t]=1\), so the \(F\)-surgery relation reduces to \(F=t^2\). The commutator \([L,\lambda_L]=1\) is already automatic. Conversely after eliminating,
\[
c^2=1,\quad L=ct,\quad F=t^2,\quad (L^2F)^2=1,\quad d_2^2=f^3,
\]
where \(b=LFL,\ b_{\rm top}=FL^2,\ c_{\rm top}=FcF^{-1}\),
\(d_2=bFL^2\), and \(f=FcL^2=t^3ct\). The square on \(L^2F\) imposes \(b_1^2=b^2=1\). These relations recover both commutators and all the original substitutions.

The lead supplied a candidate noncommuting pair in \(\mathrm{PSL}_2(\mathbb F_{29})\). The following direct check uses determinant-one representatives by rows, with entries modulo \(29\).

| Element | First row | Second row |
| --- | --- | --- |
| \(t\) | \(3,7\) | \(7,7\) |
| \(c\) | \(10,19\) | \(13,19\) |
| \(L\) | \(18,0\) | \(27,21\) |
| \(F\) | \(0,12\) | \(12,11\) |
| \(b\) | \(3,12\) | \(4,26\) |
| \(b_1\) | \(0,2\) | \(14,0\) |
| \(b_{\rm top}\) | \(21,14\) | \(14,8\) |
| \(c_{\rm top}\) | \(24,13\) | \(27,5\) |
| \(\lambda_F\) | \(3,3\) | \(3,13\) |
| \(\lambda_L\) | \(24,0\) | \(20,23\) |
| \(d_2\) | \(28,22\) | \(13,3\) |
| \(f\) | \(19,5\) | \(28,12\) |

Using the original §3 words, \(b^2,c^2,L^{-2}\lambda_L=-I\). The two longitude commutators, the \(F\)-surgery word \(F^3\lambda_F^{-2}\), and \(d_2^2 f^{-3}\) are \(+I\). The four pillowcase meridians also satisfy \(b_{\rm top}c_{\rm top}cb=+I\). In contrast
\[
[t,c]=\begin{pmatrix}21&27\\27&3\end{pmatrix}\notin\{I,-I\}.
\]
Thus the original orbifold group maps to a nonabelian subgroup of \(\mathrm{PSL}_2(\mathbb F_{29})\). Its abelianization is \(C_8\) from E48, so this slope also meets neither recognition hypothesis.
