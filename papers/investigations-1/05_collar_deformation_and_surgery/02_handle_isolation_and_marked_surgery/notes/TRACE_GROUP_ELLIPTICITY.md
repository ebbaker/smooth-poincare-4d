# The moving attaching class in the stationary filling

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution SUR-E02am. Selected GPT-6.2 Sol/ultra, with independent serving model and effort unavailable. Input HEAD `9c80575988ad`. The [issued packet](../../research-progress/handoffs/CAPPED_FACTORS_AND_FOUR_RETURNS_20261126.md) has SHA-256 prefix `eb30364191d85d18`. This is a conditional group-theoretic result for a smooth oriented integral surgery trace.

## Statement and trace homology

Write \(Y_j=\#_j(S^1\times S^2)\). Let \(Q\) be a knot in an interior ball of \(Y_1\). Perform its preferred zero-longitude surgery, so the stationary-filled inlet is
\[
Z=Y_1\# M,\qquad M=S^3_0(Q),\qquad G=\pi_1 M.
\]
Let \(K\) be a framed knot in \(Z\) whose single index-two handle trace \(\mathcal T\) has outgoing level \(Y_3\). For \(Q\) nontrivial, the ambient conjugacy class of \(K\) in \(\pi_1 Z=G*\langle t\rangle\) is represented by a nonidentity element of the stationary subgroup \([G,G]\). For \(Q\) the unknot, \(K\) is null-homotopic in \(Z\).

Van Kampen applied from \(Z\) and from the outgoing level gives
\[
 \Pi:=\pi_1\mathcal T
 \cong (G*\langle t\rangle)/\langle\!\langle K\rangle\!\rangle
 \cong F_3/\langle\!\langle d\rangle\!\rangle ,
\]
where \(d\) is the class of the actual surgery core in \(Y_3\). Reversing the trace exchanges the core and cocore of a four-dimensional index-two handle, so the reverse description again adds a single index-two handle. Changing the basepoint paths or the orientations of the circles changes the relators by conjugacy or inversion.

In zero surgery the meridian of the added solid torus kills the preferred longitude, which is zero in the abelianization of the knot exterior. The filling core gives the original meridional generator up to sign, so \(H_1(M;\mathbb Z)=\mathbb Z\). Abelianization of the two descriptions gives
\[
 \mathbb Z^2/\langle [K]_{\rm ab}\rangle
 \cong H_1(\mathcal T;\mathbb Z)
 \cong \mathbb Z^3/\langle [d]_{\rm ab}\rangle .
\]
The first presentation bounds the rank above by two and the second bounds it below by two. Thus \([K]_{\rm ab}=0\) and \(H_1(\mathcal T;\mathbb Z)=\mathbb Z^2\). It follows that \([d]_{\rm ab}\) is nonzero with relatively prime coordinates. In particular \(d\) is nonidentity and cannot be a proper power in \(F_3\). Primitivity here is in the abelianization.

Choose a cyclically reduced representative of \(d\). The one-vertex presentation complex \(X_d\) on three edges with one 2-cell attached along \(d\) is aspherical by the Lyndon–Cockcroft one-relator asphericity theorem. To see the passage from the identity theorem, put \(N_d=\langle\!\langle d\rangle\!\rangle\). The inverse image of the rose in the universal cover of \(X_d\) is the covering graph with group \(N_d\). The classes of the lifted attaching loops, indexed by \(F_3/N_d\), form a \(\mathbb Z\)-basis of \(H_1\) of that graph. This is the one-relator relation-module formula for a nonpower. Attaching the lifted disks therefore gives zero \(H_2\) by the relative homology sequence. The universal cover is simply connected and two-dimensional, so Hurewicz and Whitehead give contractibility. In particular
\[
 \operatorname{cd}_{\mathbb Z}\Pi\le 2,
 \qquad
 H_2(\Pi;\mathbb Z)=\ker\bigl(\mathbb Z
       \xrightarrow{1\mapsto[d]_{\rm ab}}\mathbb Z^3\bigr)=0 .
\]
These are statements about the classifying complex for the group. The two handle descriptions give no identification of \(X_d\) with the four-dimensional trace. [Antolín–Dicks–Linnell, Setting 6.3 and Corollary 6.5(i)](https://doi.org/10.1017/S0017089511000231) · [Louder–Wilton, §5.2, Theorem 5.4 and Corollary 5.6](https://api.repository.cam.ac.uk/server/api/core/bitstreams/33dc7366-5a5c-49ee-98a0-a1a18fa8ddb0/content)

## The nontrivial stationary knot

Gabai's Corollary 8.3 and Remarks 8.3\(^{\prime}\)(1) apply to zero surgery on a knot in \(S^3\). The remarks give irreducibility when the knot is nontrivial. The sphere theorem gives \(\pi_2(M)=0\), since \(M\) is oriented and every embedded sphere bounds a ball. The universal cover of \(M\) is noncompact because \(H_1(M;\mathbb Z)\) is infinite. It has zero \(H_3\) and zero homology in higher dimensions. Together with simple connectivity and \(\pi_2=0\), this gives contractibility by Hurewicz and Whitehead. Thus \(M\) is a closed oriented three-dimensional \(K(G,1)\) and \(H^3(G;\mathbb Z)=\mathbb Z\). In particular \(\operatorname{cd}_{\mathbb Z}G=3\). [Gabai, published text, pp. 525–526](https://www.scribd.com/document/1026013102/2-Gabai) · [Stallings, *Group Theory and Three-Dimensional Manifolds*, §1.B.1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/stallings1.pdf)

For local indicability consider any nontrivial finitely generated subgroup \(J\le G\). If \(J\) has finite index, its image under \(G\twoheadrightarrow \mathbb Z\) has finite index, hence gives an infinite cyclic quotient of \(J\). At infinite index the associated cover \(M_J\) is noncompact and irreducible. Scott's theorem gives a compact connected core \(C\subset M_J\) inducing an isomorphism on \(\pi_1\). Its boundary is nonempty. Each spherical boundary bounds a ball outside the core: if the ball lay on the core side, the connected core would be contained in it, contradicting the nontrivial injected \(\pi_1(C)\). Adjoin these balls to remove the spherical components, preserving \(\pi_1\) and retaining a nonempty boundary by noncompactness of \(M_J\). For the resulting compact oriented \(C\), the doubling formula gives \(2\chi(C)=\chi(\partial C)\le 0\), and \(b_3(C)=0\). Hence \(b_1(C)=1+b_2(C)-\chi(C)\ge1\), providing an infinite cyclic quotient of \(J\). This verifies local indicability for arbitrary \(Q\) in the stated class, including composite knots. [Meeks–Simon–Yau, Theorem 3, p. 647](https://www.math.unl.edu/~mbrittenham2/classwk/990s18/public/3-manifolds/meeks.simon.yau.1982.annals.-.embedded.minimal.surfaces.exotic.spheres.and.manifolds.with.positive.ricci.curvature.pdf) · [Scott, p. 246, compact core theorem](https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/jlms/s2-7.2.246) · [Rolfsen, Theorem 4.1.1 and Exercise 4.1.3, following Howie–Short](https://proceedings.centre-mersenne.org/item/10.5802/wbln.19.pdf)

Both \(G\) and \(\langle t\rangle\) are locally indicable. If \(K\) has cyclically reduced free-product length at least two, the locally indicable Freiheitssatz embeds \(G\) in \(\Pi\). The injection assertion holds even for a proper-power relator. Restricting a projective \(\mathbb Z\Pi\)-resolution of \(\mathbb Z\) to a subgroup preserves projectivity, since \(\mathbb Z\Pi\) is free over the subgroup ring. The embedding would therefore imply \(3=\operatorname{cd}_{\mathbb Z}G\le\operatorname{cd}_{\mathbb Z}\Pi\le2\). The identity class would leave \(G\) embedded as well. Any class conjugate into \(\langle t\rangle\) has representative \(t^m\), with \(m=0\) forced by \([K]_{\rm ab}=0\). The remaining possibility is a nonidentity representative \(g\in G\), whose abelianization in \(G\) vanishes because the abelianized free product splits as \(G_{\rm ab}\oplus\mathbb Z\). [Howie–Short, Theorem 2.1](https://doi.org/10.4171/ggd/725) · [Antolín–Dicks–Linnell, Theorem 4.3(i) and Corollary 4.4, pp. 646–647](https://doi.org/10.1017/S0017089511000231)

## The stationary unknot

Here \(M=S^1\times S^2\) and the filled inlet group is \(F_2\). In this case \([K]_{\rm ab}=0\) gives \(K\in[F_2,F_2]\). Suppose \(K\ne1\) and put \(N=\langle\!\langle K\rangle\!\rangle\) in \(F_2\). The Hopf formula gives
\[
 H_2(\Pi;\mathbb Z)
 \cong \frac{N\cap[F_2,F_2]}{[F_2,N]}
 =\frac{N}{[F_2,N]} .
\]
For any nonidentity word in a free group the relation-module formula identifies \(N/[N,N]\) with the permutation module \(\mathbb Z[\Pi/C]\), where \(C\) is the subgroup of \(\Pi\) generated by the image of a maximal root of \(K\). The formula covers both powers and nonpowers. Taking coinvariants gives \(N/[F_2,N]=\mathbb Z\), since \(\Pi\) acts transitively on \(\Pi/C\). This contradicts \(H_2(\Pi;\mathbb Z)=0\) computed from the dual presentation. Thus \(K=1\) in \(F_2\). In particular every projection of a lifted word to a stationary chamber is trivial. [Antolín–Dicks–Linnell, Setting 6.3 and Corollary 6.5(i), pp. 652–654](https://doi.org/10.1017/S0017089511000231)

There is also a geometric conclusion for this case from the known single-knot theorem. With \(Z=Y_2\) and surgery to \(Y_3\), the rank increases by one, and the integral handle slope is nonmeridional. Meier–Schirmer–Zupan's Theorem 5.1 identifies \(K\) as a disk-framed unknot in a ball in \(Z\). This theorem provides an ambient disk in \(Z\), with no position prescribed relative to the cut or stationary core. [Meier–Schirmer–Zupan, Theorem 5.1, inspected author version](https://arxiv.org/pdf/1507.06561#page=9)

## Consequences for the marked cut

For the marked sphere disjoint from \(Q\) giving the free-product splitting of \(Z\), send \(t\) to \(1\in\mathbb Z\) and \(G\) to zero. Since \([K]_{\rm ab}=0\), \(K\) has a closed lift. The kernel of this homomorphism identifies with \(*_{j\in\mathbb Z}G_j\) for \(G_j=t^jGt^{-j}\). This follows by van Kampen on the infinite chain of stationary-filled slabs with simply connected seams. If \(K=p g p^{-1}\), write \(p=n t^h\) with \(n\) in the kernel. Then the based word of the lift is \(n(t^h g t^{-h})n^{-1}\). Under the canonical retractions of the kernel to the separate \(G_j\), every projection vanishes except the one to \(G_h\), which is conjugate to \(g\) in \(G_h\). Thus for nontrivial \(Q\), precisely one chamber projection of the closed lift is nonidentity. Basepoint changes conjugate the projections, and moving the lift shifts all indices together.

For the mixed chamber order \(0,1,0,-1\) of the issue, each extreme chamber contains one return contribution. Its projection is the based class of that return closed on its capped face, up to conjugation and the chosen orientation. The two extreme projections cannot both be nonidentity. Chord changes in the punctured face become homotopies on the restored sphere, and wall meridians die when the moving tubes are restored. For the alternating order \(0,1,0,1\) each chamber instead receives the ordered product of two contributions. Its projection alone cannot test the individual returns. [Marked lower example and capped word](ONE_MOUTH_RETURN_WORD.md)

A geometrically usable bridge must be a proper embedded disk with the specified boundary pattern in the stationary-filled *drilled* exterior. Such a disk implies triviality of the associated return class after restoring the moving tubes and capping the faces. That map forgets the moving drills and the boundary pattern. A trivial class in the capped group supplies only an ambient null-homotopy. The argument gives no drilled disk, simultaneous disjointness, framing transport, or handle cancellation from that null-homotopy.

The rank-three free group used in the proof is the group of the **immediate** outgoing level of this same single-handle trace. An actual \(Y_3\) supplies that assumption. A level with only the integral homology of \(Y_3\), or a free closing attained after unspecified extra handles, supplies insufficient input for the dual presentation used here.

## Source inspection

Checked passages on 26 November 2026. Gabai's published text was inspected through the reproduction linked above. For the locally indicable Freiheitssatz, checked proofs and statements by Antolín–Dicks–Linnell (2011), with the exact free-product statement also read in the published Howie–Short paper. The original Howie 1981 paper, Theorem 4.3, was identified by DOI and its opening page inspected. For the Lyndon–Cockcroft asphericity input the proof used the relation-module statement and proof in Antolín–Dicks–Linnell, and §5.2 of the Louder–Wilton author manuscript. The original Lyndon 1950 article and the original Howie–Short 1985 Lemma 2 are attribution records here. Scott's compact core theorem and Meeks–Simon–Yau's covering theorem were checked in their published text. The local-indicability argument is written out above.
