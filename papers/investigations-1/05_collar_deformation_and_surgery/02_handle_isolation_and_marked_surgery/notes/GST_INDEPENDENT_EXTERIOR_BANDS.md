# Three reverse slides on the GST link using independent exterior paths

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E continuation of SUR-B04. Exact serving model and reasoning effort are unavailable. Intake HEAD 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. Working SHA-256 prefixes are 54a2185235bc365c for the [assessment](../../reviews/GST_NATIVE_REVERSE_SLIDES_20261126.md), e2f0489e842f2e0ce for the [marked diagram](GST_DUAL_WORD_AND_BAND_20261126.md), and 0a52b6973cb4b935f for the [carrier proof](../../reviews/GST_CARRIER_READER.md). The construction uses the actual smooth oriented reverse trace of \(L_{3,1}\), its integer framed attaching tubes and its fixed upper marking.

There is a three-slide sequence on the actual reverse diagram whose supports cannot all lie in any fixed regular neighborhood of the two original co-cores joined by one arc. The third slide produces a core with signed intersection \(-1\) with the original \(y\)-belt and at least three geometric intersections with it. Neither of the resulting cores permits a one-intersection cancellation in any complete belt system. After the prescribed first two slides, this cancellation obstruction also holds for every third band, in either direction.

## Band paths and their framed realization

Use the co-cores \(K=V_3^*\) and \(L=Q^*\) in \(Y=\#_2(S^1\times S^2)\) from GST Figure 9 left, with the individual tube identifications to Figure 1 carried through Figures 9–13. The two dotted handles specify \(B_x,B_y\) and an identification \(\alpha:\partial H\to Y\) for \(H=\natural_2(S^1\times D^3)\). Put \(X=x^{-1}\), \(Z=y^{-1}\). Orient and base \(K,L\) so their exact words in \(F(x,y)\) are
\[
r=yxyXZX,\qquad s=x^4Z^3.
\]
Here \(K\) and \(L\) are the thin minus-one and zero components respectively in the Figure 9 convention. Section 2 gives the framed band-sum and dual-slide conventions. The equation following Question 2 gives the relators in this dotted marking. [GST, published Geometry & Topology 14 (2010), §§2 and 7, Figures 1 and 9–13](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf) · [Marked word and slope identification](GST_DUAL_WORD_AND_BAND_20261126.md)

Fix contacts \(p\in K,q\in L\) and paths \(\eta_p:o\to p,\eta_q:o\to q\) giving the exact based words above. Such paths exist since the oriented free homotopy classes are \([r],[s]\). Take an embedded joining arc \(a:p\to q\) in the relative class of \(\eta_p^{-1}\eta_q\). One can choose the basing paths with disjoint interiors and normal endpoint germs and round their join at \(o\) to obtain \(a\). Let \(N_0\) be a regular neighborhood of \(K\cup a\cup L\). Keep a small interval about each contact unchanged in every slide, with room for additional attachment slots on the original strands just upstream in the respective orientations.

The following convention specifies relative classes for actual bands. At the sliding component's slot, replace an oriented short interval by the two sides of the band and the oriented framed parallel of the other core with its contact interval removed. From the retained base contact on the sliding component, traverse its old course around to the slot, then the detour, then a short surviving path back to the contact. Extend the band spine back to this source contact along the short path with reversed orientation. Extend it at its other end to the stationary contact along the framed normal fiber and the short stationary arc. Call the extended spine \(b\), oriented from source contact to target contact. If the old words are \(U,V\) in the \(\eta\) paths, the new word at the source contact is \(U g V^\epsilon g^{-1}\), where \(g=[\eta_{\rm source} b\eta_{\rm target}^{-1}]\) and \(\epsilon=\pm1\) is set by the attachment of the band. This formula follows by inserting the detour before the short return path and traversing the two long edges of the band in opposite directions. A small displacement within the product collars allows those extensions to be used with the actual stationary framed pushoff.

For any prescribed class, first specify the route with its short contact extensions. Perturb the interior relative to the endpoint germs to obtain a smooth embedded spine missing all the other core strands and the protected contacts. The relevant double-point incidence has two curve parameters and codimension three, so this perturbation preserves the relative path class. The same argument works within the interior of \(N_0\) when the route lies there. Take a sufficiently thin ribbon with its edge intervals on the source and the prescribed framed parallel. The normal plane along an interval admits an interpolation between the endpoint directions that gives the indicated oriented sum, with zero additional full twists once this interpolation is fixed. Use the standard framed slide along this ribbon, carrying the pushoff and the new framing as a framed band sum. Include the short contact strips and the annulus to the stationary pushoff in the local support. This construction fixes all three signs and path classes. The conclusions apply to any of these smooth thin-ribbon realizations.

| Slide | Source and added parallel | Source-to-target class with the contact extensions | Based word of the source afterward |
| --- | --- | --- | --- |
| 1 | \(K\) over \(L\) with sign \(+\) | \(p\to q\) along \(a\), so \(g=1\) | \(R=rs\) |
| 2 | \(L\) over the new \(K\) with sign \(-\) | \(q\to p\) along \(a^{-1}\), so \(g=1\) | \(S=sR^{-1}=r^{-1}\) |
| 3 | the new \(K\) over the new \(L\) with sign \(-\) | \(p\to q\) along \(\eta_p^{-1}\ell_y\eta_q\), where \([\ell_y]=y\) at \(o\) | \(T=R y S^{-1} Z=rs\,y r Z\) |

The loop \(\ell_y\) is the marked positive passage through the dotted \(y\) handle completed in the two-belt cut exterior. The first two strips and their parallels may be taken in \(N_0\). For the second strip the source contact is still on the original \(L\) and the target contact is on the retained strand of \(K\). In the third strip both contacts still sit on the original strands. In all three cases the based words use those same two retained contacts.

## Why every single joining-arc neighborhood is excluded

Let \(b_1,b_3\) be the contact-extended spines of slides 1 and 3. They have the same original endpoints \(p,q\). The closed path \(b_3 b_1^{-1}\) at \(p\) represents \(y\) after transport by \(\eta_p\). Suppose that one regular neighborhood of the original \(K,L\) and a single joining arc contained all the slide supports. The extended spines would both be in it, as their contact paths lie in the supports and on the retained original strands. Its ambient fundamental-group image would contain the primitive element represented by this closed path. The image of any such neighborhood is conjugate to \(\langle r,u s u^{-1}\rangle\) for some \(u\in F(x,y)\), and the all-\(u\) carrier proof excludes every primitive element from this image. This contradiction uses conjugacy and primitivity, so the conclusion is independent of the root and the choice of a competing original joining arc. It concerns the three supports in the common original \(Y\). A simultaneous ambient isotopy carrying the original cores, the contact data and the three supports carries the same obstruction. [All-arc carrier proof](../../reviews/GST_CARRIER_READER.md)

## Word and belt tests

The two signed exponent rows start at \((-1,1),(4,-3)\). In order the three pairs are
\[
((3,-2),(4,-3)),\qquad
((3,-2),(1,-1)),\qquad
((2,-1),(1,-1)).
\]
The reductions of \(T\) start with \(R=yxyXZx^3 Z^3\) and give
\[
T=yxyXZx^3ZxyXZXZ\ \sim_{\mathrm{cyc}}\ XZx^3ZxyX .
\]
The first simplification cancels the two \(Zy\) pairs in \(r s\,y r Z\) after the \(Xx\) cancellation between \(r,s\). The cyclic simplification deletes three inverse end pairs. The reduced cyclic word contains six \(x^{\pm1}\)-letters and three \(y^{\pm1}\)-letters. These are geometric lower bounds against the original \(B_x,B_y\), since an arbitrary transverse representative reads one letter per belt crossing and the reductions can only decrease those counts. In particular the signed unit on \(B_y\) leaves a geometric minimum of at least three. The unchanged word \(S=r^{-1}\) has cyclic counts \((3,3)\).

Draw a Whitehead edge from \(u\) to \(v^{-1}\) for each cyclic adjacency \(uv\). The graph of \(T\) contains the spanning cycle \(X,Z,x,y,X\). The graph of \(S\) is the graph of \(r\), since cyclic inversion preserves the undirected edges. The graph of \(r\) has the spanning cycle \(y,x,Z,X,y\). Both graphs are connected without a cut vertex, which rules out primitivity. A single meeting with a sphere in a complete belt system would give a word \(t^{\pm1}w\) in its basis, with \(w\) a word in the complementary generator, and is therefore primitive. This proves the cancellation obstruction in any complete belt system on these geometric outputs. The cyclic counts give lower bounds. Sharp intersection minima for the new embedded knots were not determined. [Whitehead cut-vertex lemma and the starting test](GST_DUAL_WORD_AND_BAND_20261126.md#cyclic-and-whitehead-tests-on-the-original-two-components)

## Arbitrary third bands after the prescribed prefix

Project \(F(x,y)\) to \(C_2*C_3\) with \(d^2=e^3=1\) by \(x=de,\ y=ed\). The relator \(r\) maps to the identity, since \(yxy=xyx=d\) in this quotient. Thus \(R\) maps to \(\bar s=(de)^4(de^{-1})^3\), and \(S\) maps to \(1\). A third slide of \(R\) over \(S\) keeps the image \(\bar s\); its signed row is \((4,-3)\) or \((2,-1)\). A third slide of \(S\) over \(R\) gives an image conjugate to \(\bar s\) or \(\bar s^{-1}\); its signed row is \((4,-3)\) or \((-2,1)\), with the sign agreeing with the power of \(\bar s\). In both directions this holds for every relative conjugator in \(F(x,y)\) and every geometric framing of an allowed slide band.

There is one primitive conjugacy class per primitive signed exponent vector in \(F_2\), by the rank-two Christoffel classification. At \((2,-1)\) its representative is \(x^2 Z\), primitive by changing \(y\) by a power of \(x\), up to inversion. Its quotient image has at most six syllables. The inverse representative at \((-2,1)\) has the same bound. At \((4,-3)\) the representative is \(x(xZ)^3\), primitive by using the free basis \((x,xZ)\). The order-three signs of its cyclically reduced image are \(++-+-+-\), while those of \(\bar s\) are \(++++---\). The longest cyclic constant run has length two in the first and four in the second. Cyclically reduced words of syllable length at least two in a free product are conjugate exactly when their syllable lists are cyclic permutations. The second has 14 syllables, so neither a shorter list nor the different sign list can yield the required conjugacy. The stationary component in either third-slide direction is already nonprimitive. For \(R\), its class in this quotient is \(\bar s\) but the primitive candidate \(x(xZ)^2\) at \((3,-2)\) has quotient syllable length at most ten. For \(S\), use \(S=r^{-1}\). The all-third-band conclusion requires this first-two-slide prefix. [Kassel–Reutenauer, arXiv:math/0507219v1, Corollary 3.3(b), p. 17](https://arxiv.org/pdf/math/0507219#page=17)

## Relative trace and handle count

Write \(W_i:Y\to A_i\) for the two-handle reverse cobordism after slide \(i\), with \(A_0\cong S^3\) the original outgoing boundary. The framed slide gives a diffeomorphism \(\Phi_i:W_{i-1}\to W_i\) fixed on the incoming collar. Its inverse is the inverse framed slide with the induced boundary comparison. Let
\[
P_i=(\Phi_i\circ\cdots\circ\Phi_1)|_{A_0}:A_0\to A_i .
\]
The old lower cap attachment \(j_0:\partial D^4\to A_0\) becomes \(P_i j_0\) with inverse \(j_0^{-1}P_i^{-1}\). The actual upper gluing \(\gamma=\alpha^{-1}\) at \(Y\) and its inverse are identical in this comparison because the moves fix the incoming collar in reverse. The spectator tube is fixed at each slide, with the old original subarcs retained as specified, and the forward dual slide is the opposite component slide under the boundary identification of GST Lemma 2.1. The capped trace comparison follows by extending the relative diffeomorphisms by the identity on both caps using these attachments. Forward counts \((n_1,n_2,n_3)=(0,2,2)\) occur at every stage, with no births or cancellations. [GST, §2 and Lemma 2.1](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

## A three-slide core outside every original one-arc neighborhood

26 November 2026. Independently recomputed from the proposed two-arc construction and the same marked GST intake. Exact serving model and reasoning effort are unavailable. The final moved core of this sequence cannot even be freely homotoped into any regular neighborhood of \(K,L\) joined by a single original arc.

Keep the original contacts \(p,q\), basing paths and arc \(a:p\to q\). Set \(z=xyx\) and fix a second embedded joining arc \(b:p\to q\) in the class \(\eta_p^{-1}\ell_z\eta_q\), with \([\ell_z]=z\). Choose its interior disjoint from \(a,K,L\) and distinct endpoint germs for the two joining arcs. The relative general-position argument above realizes these conditions with the required homotopy class. The based loop \(ba^{-1}\) transports to \(z\). Let \(N\) be a smooth regular neighborhood of the connected graph \(K\cup L\cup a\cup b\). It is a genus-three handlebody. Its graph retract has one cycle from each native core and one from the two arcs, with ambient group image \(\langle r,s,z\rangle\) after transport by \(\eta_p\).

Inside \(N\), protect intervals at both contacts and use narrow ribbons with the framed parallel of the current stationary component, using the same short contact extensions and slot convention as above. A chosen relative path in \(N\) can be perturbed in its interior away from the current strands before choosing the ribbon width. At each step the new frame is the framed slide sum and the stationary tube keeps its frame. The endpoints of the extended spines remain on the same original intervals, including when the current stationary component has already been slid.

| Slide | Source and added parallel | Extended route | Exact word at the retained source contact |
| --- | --- | --- | --- |
| 1 | \(L\) over \(K\) with sign \(+\) | \(a^{-1}\) | \(u=sr\) |
| 2 | \(K\) over the new \(L\) with sign \(+\) | \(b\) | \(v=r z u z^{-1}\) |
| 3 | the new \(L\) over the new \(K\) with sign \(-\) | \(a^{-1}\) | \(h=u v^{-1}\) |

Write \([\,\cdot\,]_{\rm ab}\) for abelianization. The rows at the end are \([v]_{\rm ab}=(2,-1)\) and \([h]_{\rm ab}=-[r]_{\rm ab}=(1,-1)\). Project again to \(C_2*C_3\) with \(x=de,\ y=ed\), and let \(A=(de)^4(de^{-1})^3\). The images of \(r,s,z\) are \(1,A,d\). Thus \(u,v,h\) map to \(A,dAd,A d A^{-1}d\), respectively. Write \(A=dD\), where the reduced 13-syllable word \(D\) starts and ends in the order-three factor. Then
\[
 A d A^{-1}d=dD d D^{-1}.
\]
This is a cyclically reduced 28-syllable word, so the image of \(h\) is nontrivial.

For any original joining arc, the corresponding ambient subgroup is conjugate to \(\langle r,g s g^{-1}\rangle\) for some \(g\in F(x,y)\), by the retraction onto the two original circles and that arc. The homology rows of \(r\) and \(s\) form a \(\mathbb Z\)-basis. In a word in those subgroup generators with abelianization \(-[r]_{\rm ab}\), the total exponent of \(g s g^{-1}\) is therefore zero. In \(C_2*C_3\), the first generator vanishes and the second is one fixed conjugate of \(A\), so the whole word vanishes. Conjugation in \(F(x,y)\) preserves both abelianization and whether the quotient image vanishes. This proves that the free homotopy class of \(h\) is absent from all the original one-arc neighborhoods. The same conclusion holds for the inverse orientation. The argument detects the output core itself even after an arbitrary free homotopy in \(Y\). [Neighborhood image calculation](../../reviews/GST_CARRIER_READER.md#exact-basings-and-the-regular-neighborhood)

For the geometric belt test, the words at the end freely reduce to
\[
\begin{aligned}
 v&=yxy\,x^4Z^2xyXZX^2ZX,\\
 h&=x^4Z^2xyxyxZXy^2X^4ZXZ .
\end{aligned}
\]
Both are cyclically reduced. The counts against \(B_x,B_y\) are bounded below by \((10,7)\) for \(v\) and \((13,9)\) for \(h\). The Whitehead graph of each word has all six edges on the four vertices \(x,X,y,Z\), so neither word is primitive. In particular neither embedded core yields a single geometric intersection with any sphere in a complete belt system. These counts are lower bounds and do not determine the exact geometric minima.

For each of these three slides use the smooth framed trace comparison \(\Psi_i\) from the preceding reverse trace to the next, fixed on its incoming \(Y\)-collar. Let \(D_i=(\Psi_i\circ\cdots\circ\Psi_1)|_{A_0}\) be the resulting outgoing map from the original \(S^3\) to the \(i\)th outgoing boundary. From old to new, the lower cap is attached by \(j_i=D_i j_0\), and the upper cap is attached by the original \(\gamma\). From new to old the inverse maps recover \(D_i^{-1}j_i=j_0\) and leave \(\gamma\) fixed. Equivalently the two attachment inverses at stage \(i\) are \(j_0^{-1}D_i^{-1}\) and the original \(\alpha\). Reading forward through these comparisons changes which component slides by GST Lemma 2.1. The inverse framed moves recover the original tubes with the original attachments. This is a comparison on the same capped trace, with forward counts \((0,2,2)\) and zero births or cancellations. [GST, §2 and Lemma 2.1](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)
