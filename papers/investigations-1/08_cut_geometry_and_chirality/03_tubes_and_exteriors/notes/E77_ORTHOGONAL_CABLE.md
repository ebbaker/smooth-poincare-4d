# SP4-CUT-TUBE-E77 — The orthogonal cable and its companion filling

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance at baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Actual helper model and effort are unavailable. Inputs are the [E39 marked orbit bundle](E39_PRISM_FILLINGS.md), the [E54 and E58 underlying slope and core calculations](MARKED_LENS_CORE.md), the [E70 marked tangle group](E70_EQUIVARIANT_SURGERY.md), and the [E74 torsion test](../reviews/E74_ALL_SLOPES.md). The two finite representations are checked in [e77_cable_witness.py](../numerics/e77_cable_witness.py).

The winding-seven, meridional-two cable of the orthogonal projected core gives an invariant torus carrying a section isotopic to the actual marked surgery circle. Its distance-one filling with the positive meridian change is the companion filling \(49a+15\mu\) in the transported marking. The new orbifold group has abelianization \(C_8\) and surjects onto \(\mathrm{PSL}_2(\mathbb F_{31})\). Although the corresponding smooth branched cover is an integral homology sphere, the group fails both circle-action recognition hypotheses. This slope is the only cyclic candidate within the compatible genuine distance-one cables tested below.

## 1. Transported core and actual section class

In the quaternion coordinates of E39 let \(I(q)=qi\). This map preserves the orientation of \(S^3\). Right multiplication by \(i\) commutes with the right rotation \(z=e^{2\pi i/17}\) and sends \(j\) to \(-j\) under conjugation. Hence \(I\) normalizes \(\Gamma=Q_8\times C_{17}\) and the full group \(\Lambda=T^*\times_{\{\pm1\}}Q_{68}\). For \(J(q)=bqj^{-1}\), \(b=e^{n\pi/3}\), it satisfies
\[
IJI^{-1}(q)=bqj=J^7(q).
\]
This follows from \(b^6=1\) and \(j^4=1\). Since \(J^6=-\mathrm{id}\) belongs to \(\Gamma\), \(I\) also induces a diffeomorphism of the capped mapping torus with the same time coordinate. On the orbit orbifold it preserves the original singular knot setwise and sends the regular core \(\ell\) to the projection \(\ell^\perp\) of
\[
C^\perp=I(C)=\{q:qjq^{-1}=-n\}.
\]
These are distinct embedded regular knots. The equality-of-dot-products criterion of E39 for an intersection with a translate now compares the left values \(-1,1/3\) with the right values \(\cos(4\pi r/17)\). The right values never equal \(-1\) because \(17\) is odd, and cannot equal \(1/3\) because twice the cosine is an algebraic integer. Thus the two projected knots are disjoint. Use the transported longitude and meridian \((a_\perp,\mu_\perp)=I_*(a,\mu)\) on \(\ell^\perp\). The positive longitude has deck word \(J^{-7}\).

Inside its regular solid torus choose the oriented cable \(\kappa\) of winding \(7\) and meridional coefficient \(2\), with torus slope \(7a_\perp+2\mu_\perp\). It is embedded since these integers are coprime. Its spatial deck word is \(J^{-49}=J^{-1}\). For the mapping torus convention \((t+1,q)\sim(t,Jq)\), the deck representation of its universal cover \(S^3\times\mathbb R\) into \(\mathbb Z\times\Lambda\) records time shift and the spatial deck map, and is injective. The image of the original oriented \(\gamma\) is \((1,J^{-1})\) in a lift based along the reference circle. The principal suspension orbit has image \((6,1)\).

The preimage of \(\kappa\) is a principal torus. A section exists because the circle bundle is trivial over this regular loop. In the same based conventions any section over the positively oriented \(\kappa\) has the spatial part \(J^{-1}\) and time degree \(1\) modulo \(6\). Changing the fibre winding changes the time degree by \(6\), so it can be chosen to have degree exactly \(1\). Basepoint choices along connecting paths give the same free homotopy class. The resulting embedded circle therefore represents the actual oriented section class. Free homotopy of embedded circles in a smooth four-manifold gives ambient isotopy: at equal time the double-point problem has dimension three against four, and a generic homotopy can be made through immersions and then embeddings, with the ends fixed. This changes the marked invariant torus while identifying the unframed surgery circle and transporting its pair of framings.

## 2. Exact distance-one replacement

Let \(V=S^1_{a_\perp}\times D^2\) be the regular solid torus, and use general coprime cable data \(w,q\) with positive winding \(w\). Write \(\mu_\kappa\) for the positive cable meridian and \(\gamma_\kappa\) for the push-off on its torus. The latter joins by an annulus in the cable space \(W=V\setminus\operatorname{int}\nu\kappa\) to \(w a_\perp+q\mu_\perp\) on the outer boundary. In \(H_1(W)=\mathbb Z[a_\perp]\oplus\mathbb Z[\mu_\kappa]\), the outer meridian is \(w\mu_\kappa\), by intersecting the cable with a positive meridian disk of \(V\). Thus
\[
[\gamma_\kappa]=w[a_\perp]+wq[\mu_\kappa],\qquad
[\gamma_\kappa+\epsilon\mu_\kappa]=w[a_\perp]+(wq+\epsilon)[\mu_\kappa],
\quad \epsilon=\pm1 .
\]
Since \(\gamma_\kappa\) is the regular Seifert fibre of the cable space, filling at \(\gamma_\kappa+\epsilon\mu_\kappa\) has fibre distance one. The Seifert base changes from an annulus with one cone to a disk with one cone and the filled \(W\) is a solid torus. Its outer meridian is determined by the kernel of \(H_1(\partial V)\) into the filled group \(H_1\). With \(r=wq+\epsilon\) it is \(w^2 a_\perp+r\mu_\perp\), which is primitive since \(\gcd(w,r)=1\). This gives the signed companion formula in the transported framing. Equivalently the inner longitude with class \(w[a_\perp]\) differs from \(\gamma_\kappa\) by \(-wq\mu_\kappa\), so the inner coefficient read in that longitude is \(wq+\epsilon\). [Meier, *Small Seifert fibered surgery on hyperbolic pretzel knots*, §2.2, cable annulus and distance-one solid-torus filling](https://msp.org/agt/2014/14-1/agt-v14-n1-p16-p.pdf).

For \(w=7,q=2,\epsilon=+1\), this gives \(49a_\perp+15\mu_\perp\). The replacement is entirely in the regular part. Transporting by \(I^{-1}\) gives exactly \(49a+15\mu\) on the E70 diagram, with the old order-two knot carried along. In the dual unknot basis \((a,\lambda_U)\), \(\mu=-3a-\lambda_U\), so the slope is \(4a-15\lambda_U\), or \(-4/15\) surgery with the usual unoriented slope convention. Its underlying manifold is a lens space of order four. Its orbifold abelianization is the cokernel of the relations \(6a+2\mu=0,\ 49a+15\mu=0\), hence \(C_8\). In the diagram longitude \(\lambda_L=a+\mu\), with \(L=\mu\), the new relation is precisely
\[
L^{-34}\lambda_L^{49}=1.
\]
The slope on \(\kappa\) meets its meridian once and hence is an allowed longitude for the E39 two-stage construction on this new torus.

## 3. Finite nonabelian image of the actual group

Use the E70 presentation with \(F,L\) meridians for its ordinary components, and \(b,c\) the bottom old-strand meridians. Keep
\[
b_1=LbL^{-1},\quad b_{\rm top}=Fb_1F^{-1},\quad c_{\rm top}=FcF^{-1},
\quad \lambda_F=c^{-1}b^{-1}L^{-1},\quad \lambda_L=b_1^{-1}F^{-1},
\quad d_2=bb_{\rm top},\quad f=c_{\rm top}b_{\rm top}.
\]
The two old meridians square to one. The longitude commutators, \(F^3\lambda_F^{-2}\), \(L^{-34}\lambda_L^{49}\), and \(d_2^2 f^{-3}\) are trivial.

The lead supplied the following determinant-one matrices, with entries modulo \(31\) and read by rows:
\[
F=\begin{pmatrix}4&6\\8&20\end{pmatrix},\quad
L=\begin{pmatrix}13&27\\30&29\end{pmatrix},\quad
b=\begin{pmatrix}14&17\\3&17\end{pmatrix},\quad
c=\begin{pmatrix}0&1\\30&0\end{pmatrix}.
\]
In their original E70 words,
\[
\begin{array}{c|c@{\qquad}c|c}
b_1&(30,3;\,20,1)&b_{\rm top}&(6,27;\,17,25)\\
c_{\rm top}&(3,21;\,1,28)&\lambda_F&(11,16;\,11,2)\\
\lambda_L&(13,13;\,11,23)&d_2&(1,28;\,28,10)\\
f&(3,17;\,17,14)&&
\end{array}
\]
The square words \(b^2,c^2\), the two surgery words \(F^3\lambda_F^{-2}\), \(L^{-34}\lambda_L^{49}\) all give \(-I\). Both longitude commutators, \(d_2^2 f^{-3}\) and the pillowcase product \(b_{\rm top}c_{\rm top}cb\) give \(+I\). The commutator \([F,L]=(21,28;\,28,30)\) is noncentral. A direct traversal of the generated projective subgroup gives all \(31(31^2-1)/2=14880\) elements, so the image is the full \(\mathrm{PSL}_2(\mathbb F_{31})\). An independent search over trace classes of \(t=\lambda_F F^{-1}\) and involutions \(b,c\), stopping at the first successful prime \(31\), gave a second set of generators
\[
(F,L,b,c)=((30,28;\,3,8),(28,23;\,1,23),(8,19;\,8,23),(1,3;\,20,30)).
\]
The checker verifies both directly against the original words and traverses only the bounded projective group. Either noncentral commutator alone proves noncyclicity. Combined with abelianization \(C_8\), it excludes both the cyclic and odd-dihedral criteria for this specific changed torus and slope.

## 4. Uniqueness within the tested distance-one cable class

Consider positive winding \(w\ge2\), integer \(q\) coprime to \(w\), and the two distance-one slopes from §2 on an orthogonal cable compatible with the original unframed section. Matching time degree \(+1\) or \(-1\) already forces \(w\) odd and prime to \(3\): the spatial word must match the projection of \(J^{\mp1}\) in the order-six quotient \(\Lambda/\Gamma\). For positive time degree and the based \(J^{-1}\) matching, the sufficient congruence is \(w\equiv7\bmod12\). Write \(r=wq+\epsilon\) and \(n=3r-w^2\), so the companion slope is \(n a+r\lambda_U\) up to sign. The integer \(n\) is nonzero and coprime to \(3\) and \(r\). The underlying lens space has order \(m=|n|\) and the singular knot lifts to one component in its ordinary universal cover \(S^3\), by the E54 and E58 core marking. Orbifold abelianization is \(C_{2m}\) by E48 and primitivity of the companion slope.

The E74 sign-torsion calculation applies verbatim to this rational filling, since it uses only the primitive slope \((n,r)\), linking number three, and the complementary-slope Bezout equation. More explicitly, a character taking the singular meridian to \(-1\) extends over the filling precisely when \(y^m=(-1)^r\), where \(y\) is its value on \(a\). The \(m\) characters give every \(m\)-th root of \(-1\) as the core value in the torsion gluing, since \(nv-ru=\pm1\) for a complementary slope \(u a+v\lambda_U\). The same cancellation gives the determinant of the smooth double cover branched along the lifted singular knot as
\[
\prod_{y^m=(-1)^r}|7-5(y+y^{-1})|.
\]
If \(m\) is odd this product is divisible by \(3\) when \(r\) is even and by \(17\) when \(r\) is odd, using \(y=1\) or \(-1\) and the Galois-stable remaining factor. If \(m\) is even, then \(r\) is odd and this is the same root set as the even-\(m\) calculation in E74. That calculation gives determinant one only for \(m=4\). A cyclic orbifold group would have order \(2m\), making the smooth double branched covering group trivial, so determinant one is necessary.

For a cyclic possibility \(3wq+3\epsilon-w^2=\pm4\). Reducing modulo \(w\) forces \(w\) to divide \(1\) or \(7\), hence \(w=7\). The sign \(\epsilon=+1\) then gives \(q=2\), and \(\epsilon=-1\) gives the nonintegral value \(q=8/3\). This singles out exactly the obstruction in §3 within the tested cable class. An odd-dihedral possibility would require abelianization of order two, hence \(m=1\). Modulo \(w\) this would force \(w\) to divide \(2\) or \(4\), incompatible with odd winding and \(w\ge2\).

This excludes the indicated class of distance-one changed cable tori. It makes no assertion about slopes of greater fibre distance, different projected cores, or any other marked surgery construction. No relative framing label was assigned by the unframed isotopy, since the tested three-dimensional group cannot recognize either label through this route.
