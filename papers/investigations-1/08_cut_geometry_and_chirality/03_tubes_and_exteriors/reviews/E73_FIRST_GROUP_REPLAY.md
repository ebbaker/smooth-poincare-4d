# E73 — Replay of the first prism group and the alternate odd slope

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Actual helper model and effort unavailable. Base checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Working SHA-256 prefixes are ade2987d8bf24aa9 for [E70](../notes/E70_EQUIVARIANT_SURGERY.md), 54e0ca829aea3eda for [E72](../notes/E72_ROTATION_PRESENTATION.md), 73ef2f3ea603703c for its [signed word generator](../numerics/e72_rotation_presentation.py), and 5591b1d3c6d16b81 for [E74](E74_ALL_SLOPES.md). The comparison uses the smooth oriented tangle models and the same marked integer fillings \(a+s\mu\), with order two on the old singular knot and trivial isotropy on the new core.

The \(s=0\) group is \(S_3\). The alternate odd slope \(s=-1\) surjects onto \(\operatorname{PSL}_2(\mathbb F_{29})\) of order \(12{,}180\) and has infinite group. Both calculations use the original marked equations. The second result excludes the last cyclic candidate for the odd normal framing in this circle-action recognition test.

## Signed crossing check and the first group

Use the E70 product and pillowcase marking. In the auxiliary projection onto \((X,v)\), the circles are \(F:X^2+v^2=4\) and \(L:(X-1)^2+v^2=9/4\), the old strands run upward at \(X=\pm1\), and the suppressed front coordinate is \(Y=v\) on \(F\), \(Y=-v\) on \(L\), and \(Y=0\) on the old strands. The oriented tangents of \(F,L\) are proportional to \((-v,X)\) and \((v,1-X)\). Their intersections occur at \(X=11/8\), \(v=\pm\sqrt{135}/8\), with \(F\) over at the upper point and \(L\) over at the lower. The determinant of the two tangents in over–under order is negative at both. The line \(X=+1\) meets both circles and \(X=-1\) meets only \(F\). At each of these six crossings, the height ordering just specified again makes the tangent determinant negative. Traversing in the stated orientations then gives over-meridian orders \(c,b,L\) on \(F\), \(b_1,F\) on \(L\), \(L,F\) on the old \(+\) strand and \(F\) on the old \(-\) strand. Thus the E70 crossing words agree with its projected geometry, in the handedness and front basing fixed there. The actual product chart, boundary longitude and endpoint labels are taken from E70. [E70, quotient projection and closure](../notes/E70_EQUIVARIANT_SURGERY.md)

Take \(b_1=LbL^{-1}\), \(b_{\rm top}=Fb_1F^{-1}\), \(c_{\rm top}=FcF^{-1}\), \(\lambda_F=c^{-1}b^{-1}L^{-1}\), and \(\lambda_L=b_1^{-1}F^{-1}\), with \(b^2=c^2=1\). The closures of the two surgery components impose \([F,\lambda_F]=[L,\lambda_L]=1\). The cone fill is \(F^3\lambda_F^{-2}=1\) and the marked native fill is \(L^{s-1}\lambda_L=1\). The outer relation is \(d^2f^{-3}=1\), with \(d=b\,b_{\rm top}\), \(f=c_{\rm top}b_{\rm top}\).

At \(s=0\), \(\lambda_L=L\) implies \(L=F^{-1}b\). Hence \(b_1=F^{-1}bF\), \(b_{\rm top}=b\) and \(\lambda_F=cF\). The \(F\) closure requires \(F\) to commute with \(c\), so \(F^3(cF)^{-2}=F=1\). The outer relation becomes \((cb)^3=1\). Conversely the formulas \(F=1,L=b,\lambda_F=c,\lambda_L=b,b_1=b,b_{\rm top}=b,c_{\rm top}=c\) satisfy the original relations under \(b^2=c^2=(cb)^3=1\). Hence the elimination gives an isomorphism with that two-generator presentation. Putting \(r=cb\) writes every element in one of the six forms \(r^j c^\epsilon\), \(0\le j<3\), \(0\le\epsilon<2\). The two distinct adjacent transpositions in \(S_3\) satisfy the relations and generate all six elements.

I also enumerated the cosets of the trivial subgroup for the independently generated original E72 words. After initially sorting the relators by length, successive single-occurrence eliminations removed \(9,1,2,3,4,5,7,16,8,10,12,13,14,11,15\). In each step the chosen relation \(P g^\epsilon Q=1\) gives \(g^\epsilon=P^{-1}Q^{-1}\), which is substituted in every remaining relator. I applied the shortest reduced relators first. The enumeration created 170 rows, made 260,201 relator scans with 53 direct relator updates and forced 164 coincidences. It completed the following table with the trivial subgroup's row numbered zero.

| Row | \(g_6\) | \(g_6^{-1}\) | \(g_{17}\) | \(g_{17}^{-1}\) | \(g_{18}\) | \(g_{18}^{-1}\) |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 0 | 1 | 2 | 3 | 3 | 3 | 3 |
| 1 | 2 | 0 | 4 | 4 | 4 | 4 |
| 2 | 0 | 1 | 5 | 5 | 5 | 5 |
| 3 | 5 | 4 | 0 | 0 | 0 | 0 |
| 4 | 3 | 5 | 1 | 1 | 1 | 1 |
| 5 | 4 | 3 | 2 | 2 | 2 | 2 |

The operations were generator-edge definitions, relator scans from a row in both directions to force a missing edge, and coincidences forced by a completed relator or conflicting forward or inverse edges. Thus every identified row represents the same element in the presented group. Totality proves an upper bound of six, and the transitive action verified on the original signed relators proves the lower bound. The fixed images of all eighteen original generators are verified separately by the companion checker. [Todd–Coxeter, original coset enumeration method](https://doi.org/10.1017/S0013091500008221) · [E72 original words and companion check](../numerics/e73_group_replay.py)

## Exact quotient at the alternate odd slope

At \(s=-1\), \(\lambda_L=L^2\) implies \(b=LFL\), so \(\lambda_F=cLF\). Let \(t=cL\). The \(F\) closure gives \([F,t]=1\), and \(F^3(tF)^{-2}=1\) then gives \(F=t^2\) and \(\lambda_F=t^3\). Thus the formulas from which to evaluate the original words are \(L=ct\), \(F=t^2\), \(b=LFL\), \(b_1=L b L^{-1}\), \(b_{\rm top}=F b_1 F^{-1}\), and \(c_{\rm top}=F c F^{-1}\). The outer words are \(d=bFL^2\) and \(f=FcL^2=t^3ct\). This yields the two-generator relations \(c^2=b^2=d^2f^{-3}=1\). The realization below also checks the original longitude commutators and both filling words directly.

The lead's determinant-one lifts are
\[
 t=\begin{pmatrix}3&7\\7&7\end{pmatrix},\qquad
 c=\begin{pmatrix}10&19\\13&19\end{pmatrix}\pmod{29}.
\]
The table gives flattened row entries up to multiplication by \(-I\), choosing the lexicographically smaller representative. It is calculated from the original words.

| Element | Entries |
| --- | --- |
| \(F\) | \(0,12,12,11\) |
| \(L\) | \(11,0,2,8\) |
| \(b\) | \(3,12,4,26\) |
| \(b_1\) | \(0,2,14,0\) |
| \(b_{\rm top}\) | \(8,15,15,21\) |
| \(c_{\rm top}\) | \(5,16,2,24\) |
| \(\lambda_F\) | \(3,3,3,13\) |
| \(\lambda_L\) | \(5,0,9,6\) |
| \(d\) | \(1,7,16,26\) |
| \(f\) | \(10,24,1,17\) |

In the projective group the four old strand meridians above have square one. The two longitude commutators, \(F^3\lambda_F^{-2}\) and \(L^{-2}\lambda_L\), are identity. For the outer pillowcase the images satisfy \([d,f]=1\), \(df b_{\rm top}=c\), and \(d^2=f^3=(3,14,3,24)\). In particular the lift check includes the four endpoint meridians as well as the filled translation. The commutator \([t,c]\) has entries \(8,2,2,26\), distinct from the identity. The orders of \(t,c,L,F,b,d,f\) are \(14,2,14,7,2,29,29\).

The finite closure under right multiplication by \(t,c\) has \(12{,}180=29(29^2-1)/2\) elements. This is the entire \(\operatorname{PSL}_2(\mathbb F_{29})\), since a determinant-one matrix admits \(29^2-1\) nonzero first columns with exactly \(29\) second columns for each, and the projective projection divides by two. There is no random or numerical test in this count. In the E72 18-generator presentation, a differently obtained witness starts with \(g_3=(0,12,12,2)\), \(g_{17}=(13,11,7,6)\), \(g_{18}=(0,28,1,0)\) after its own single-occurrence eliminations. I independently evaluated the expanded images on all original E72 words and obtained the same surjective image order. The [checker](../numerics/e73_group_replay.py) reproduces both full word verifications and the finite image closures.

## Infinitude and recognition scope

E74 identifies an index-eight normal subgroup \(H=\pi_1(\Sigma_2(K_{-1}))\) of \(G_{-1}\), with cyclic quotient \(C_8\), and computes \(H^{\rm ab}=0\). In the displayed surjection the image of \(H\) is normal and the quotient by that image is cyclic. The target is perfect. Indeed conjugation by \(\operatorname{diag}(2,15)\) scales upper and lower unipotent parameters by \(4\) and \(15^2\), respectively, and both scale differences from \(1\) are invertible modulo \(29\). Thus all such unipotents are commutators. Elementary elimination shows they generate the determinant-one group, and hence also its projective quotient. A cyclic quotient of this perfect group is trivial. It follows that \(H\) itself surjects onto the same group of order \(12{,}180\). [E74, actual deep cover and its homology](E74_ALL_SLOPES.md#group-consequences-and-the-alternate-slope)

If \(H\) were finite, the smooth closed oriented three-manifold \(\Sigma_2(K_{-1})\) would be elliptic. Equivalently its simply connected finite cover is \(S^3\) by three-dimensional Poincaré and elliptic linearization makes its deck group a subgroup of \(SO(4)\). The map \(SO(4)\to SO(3)\times SO(3)\) from the two quaternion factors has kernel of order two, and the two projections of a finite perfect \(H\) are perfect. A nontrivial finite perfect rotation group of \(S^2\) has order at most \(60\). To see the bound, its quotient sphere has at most three cone points by positive orbifold Euler characteristic. At most two points give cyclic groups. For three points, signature \((2,2,n)\) gives a dihedral group. The remaining possibilities are \((2,3,3),(2,3,4),(2,3,5)\) by the sum of reciprocal orders, with rotation group orders \(12,24,60\). Consequently \(|H|\le 2\cdot60^2=7200\), contradicting the surjection. Thus \(H\) and \(G_{-1}\) are infinite. [Dinkelbach–Leeb, Theorem E on smooth finite actions on elliptic three-manifolds](https://msp.org/gt/2009/13-2/gt-v13-n2-p15-p.pdf)

E74's determinant condition leaves \(s=-1\) as the sole possible cyclic input and \(s=0\) as the sole possible odd-dihedral input among the marked integer slopes. The first \(S_3\) result is the dihedral input used by E70 for the even four-dimensional framing. The alternate odd slope has the same four-dimensional normal framing as \(s=1\). Combining the \(s=-1\) infinitude with E74 gives infinite group at every marked odd slope. The cyclic or odd-dihedral recognition criterion therefore gives no smooth recognition for the odd framing. Its smooth type remains open.
