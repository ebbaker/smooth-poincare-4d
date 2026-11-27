# SP4-CUT-TUBE-E39 — The marked order-seventeen prism fillings

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E39_REQUEST_R1](../research-progress/handoffs/E39_REQUEST_R1.md), baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The requested setting was gpt-6.2-sol/ultra. Actual model and effort are unavailable. The marked inputs are [MARKED_PRISM_17](MARKED_PRISM_17.md) and [E28](../reviews/E28_PRISM_REPLAY.md). The smooth homogeneous-fibre recognition used below is [E25](../reviews/E25_HOMOGENEOUS_REPLAY.md).

Both framed surgeries on the actual marked section are smooth homotopy four-spheres. The exact marking admits a two-stage local equivariant construction and permits a smooth computation of two branched covers. The literature consulted and the computations below leave the smooth types downstairs open.

## Source comparison

| Primary source and passage | What applies to the order-seventeen surgery |
| --- | --- |
| Plotnick–Suciu, *Fibered knots and spherical space forms*, §5, Proposition 5.1, pp. 522–524 and table on p. 525 | Their type-II construction for odd cyclic order \(m>1\) uses \(Q_8\times C_m\), cyclic permutation of the quaternion generators on the abelianization, and inversion on \(C_m\). It provides a fibred knot in a smooth homotopy four-sphere described as homeomorphic to \(S^4\). The passage gives this scope for \(m=17\). Its periodicity discussion concerns punctured monodromy, so it is compatible with a periodic unpointed capped representative. [Published scan](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/135209/jlms0514.pdf?sequence=1) |
| Teragaito, *Twisting symmetry-spins of 2-bridge knots*, introduction and theorem, pp. 117–118, and doctoral thesis, Chapter I, Theorem 3.5, p. 22 | The former supplies \(d=5,11,13,19\) in standard \(S^4\). The latter explicitly constructs standard-\(S^4\) fibred examples for \(d=3,5,11,13,19,21,27\) from specified spinning data. Neither list contains \(17\). The thesis introduction, p. 7, describes Morichi's punctured-prism Seifert-surface result and leaves fibredness of that construction open. [1989 article](https://da.lib.kobe-u.ac.jp/da/kernel/E0003707/E0003707.pdf) · [Thesis](https://da.lib.kobe-u.ac.jp/da/kernel/D1000984/D1000984.pdf) |
| Jabłonowski, *Fibred realizations of the prism quandle \(P_7\) in the standard four-sphere*, Theorem 8.1, §§7–8 | The preprint identifies both framed surgeries for cyclic order \(7\) as standard. Its marked Whitehead-link filling argument is parameter-specific. Lemma 8.3 and Proposition 8.4 give a local equivariant construction to test here. Proposition 7.8 distinguishes the two mirror choices of the Whitehead model, as detailed below. The passages were checked in the indexed full text. [arXiv:2609.29839](https://arxiv.org/abs/2609.29839) |
| Ballinger–Hsu–Mackey–Ni–Ochse–Vafaee, *The prism manifold realization problem*, introduction, Question 1.1 | The realization problem studied here is integral surgery on a knot in \(S^3\) producing a closed spherical three-manifold. The surgery and its domain differ from the four-dimensional marked circle surgeries. The audit found no four-dimensional recognition theorem under Mackey's name. [Published article](https://www.its.caltech.edu/~yini/Published/Prism1.pdf) |

## The canonical suspension and the actual marked torus

Use \(Y=S^3/\Gamma\), \(\Gamma=Q_8\times C_{17}\), acting by \(q\mapsto u q z^{-r}\), \(z=e^{2\pi i/17}\). Let \(n=(i+j+k)/\sqrt3\), \(b=e^{n\pi/3}\), and \(J(q)=bqj^{-1}\). The induced capped monodromy \(h\) has period six. Write \(N=M_h\) in the convention \((t+1,q)\sim(t,h(q))\) and choose \(p_0jp_0^{-1}=n\). The real section, carried from the given puncture as in E28, is represented by
\[
\gamma(t)=[t,p_0e^{j\pi t/6}].
\]
Indeed \(Jp_0=p_0e^{-j\pi/6}\). The marked normal framings are the two homotopy classes of oriented three-frames along this circle. A choice of longitude in the construction below may exchange their labels.

Write \(\alpha\) for the action of \(h\) on \(\Gamma\). For an appropriate base generator, \(\pi_1N=\Gamma\rtimes_\alpha\langle t\rangle\) with \(t=[\gamma]\), up to simultaneous inversion of \(t\) and \(\alpha\). Killing \(t\) identifies \(i,j,k\), which hence all equal the identity by \(ij=k\), and identifies \(z\) with \(z^{-1}\), which kills \(C_{17}\). Both framed fillings are simply connected. They have Euler characteristic two since \(\chi N=0\) and the circle cap contributes two. Oriented duality and Hurewicz–Whitehead give the homotopy-sphere assertion.

The suspension circle \(\mathbb R/6\mathbb Z\) has orbit orbifold
\[
 O=S^3/\Lambda,\qquad
 \Lambda=T^*\times_{\{\pm1\}}Q_{68},
\]
where \(T^*=\langle Q_8,b\rangle\) is binary tetrahedral and \(Q_{68}=\langle z,j\rangle\) is binary dihedral of order 68. The central product acts by \((A,B)q=AqB^{-1}\). The extension \(\langle\Gamma,J\rangle\) has order \(6\cdot136=816\), equal to the central product order, so the inclusion is equality. The parity-even subgroup \(\Lambda^+=T^*\times C_{17}\), of index two, acts freely. A fixed point requires the left and right factors to have equal real part. An odd right factor has real part zero. Odd powers \(1,5\) of \(J\) have left real part \(\pm1/2\) after multiplication by \(Q_8\). Fixed points therefore project to \(h^3\) in \(\Lambda/\Gamma\), and every nontrivial point stabilizer has order two. A suspension orbit has base degree six or three. The marked section has base degree one, so it cannot be moved by isotopy to a suspension orbit.

The section does project to a smooth embedded loop in the regular part of \(O\). Its full trajectory belongs to the great circle
\[
C=\{q:qjq^{-1}=n\}=p_0e^{j\mathbb R}.
\]
At a point common to \(C\) and its translate by \((A,B)\), conjugation preserves inner products, giving
\[
j\cdot\operatorname{Ad}_B j=n\cdot\operatorname{Ad}_A n.
\]
The left side is \(\cos(4\pi r/17)\) for \(B=z^r j^c\). The right side is \(1\) or \(-1/3\), by the action on the four tetrahedral vertices. Twice the cosine is an algebraic integer, which excludes \(-2/3\). Equality at \(1\) requires \(A\in\langle b\rangle\), \(B\in\langle j\rangle\). Conversely these elements preserve \(C\), with shifts \(a\pi/3-c\pi/2\). The resulting setwise stabilizer has order twelve and acts freely, generated by the shift \(J\) of \(-\pi/6\). Thus the 68 translates are pairwise disjoint, \(\ell=C/\langle J\rangle\) is embedded and regular, and \(\gamma\) projects diffeomorphically onto \(\ell\). In particular \(\pi^{-1}\ell\) is a principal torus for the actual suspension action with the actual section.

In the coordinates \(q=p_0 u\) the stabilizer generator \(J\) acts on \(u\) by left multiplication by \(e^{j\pi/3}\) and right multiplication by \(e^{-j\pi/2}\). Its angles on \(\langle 1,j\rangle\) and \(\langle i,k\rangle\) are \(-\pi/6\) and \(5\pi/6\), respectively, with positive normal rotation given by left multiplication by \(e^{j\theta}\). Let \(a\) be the quotient longitude lifted by moving along \(C\) by \(+\pi/6\) while rotating its constant Euclidean normal frame by \(-5\pi/6\). Let \(\mu\) be the positive normal meridian. On every chosen reference lift of this boundary torus, the slope \(a+s\mu\) lifts after twelve traversals as
\[
\lambda_C+(12s-5)\mu_C .
\]
Here the longitude \(\lambda_C\) has constant normal direction on \(S^3\). The complete construction has 68 boundary tori upstairs, each with the corresponding translated marking. The longitude holonomy has order twelve, so a filling upstairs with these slopes gives a branched completion over the dual curve downstairs.

This torus satisfies the geometric hypothesis of the local construction in Jabłonowski, Lemma 8.3 and Proposition 8.4. In a product \(S^1_f\times S^1_a\times D^2\) around the torus, a full change of twist of the normal disc coordinate along \(S^1_a\) changes the section's normal three-framing by the nonzero element of \(\pi_1SO(3)=\mathbb Z/2\). The two parities may therefore be tested using consecutive integer slopes \(a+s\mu\) in the two-stage construction. After section surgery and then surgery on the compressed torus, the construction gives a circle action with base \(O(a+s\mu)\). Its use for recognition through Propositions 8.7–8.8 requires the fundamental group of the filled orbifold, with its actual meridian relation. The calculation of \(\Lambda\) describes the closed unfilled \(O\). The relevant presentation would be that of \(\pi_1^{\rm orb}(O\setminus\nu\ell)\), with \(a+s\mu\) killed.

The specific order-seven Whitehead models cannot serve as this unfilled marked orbifold. The unique index-two subgroup of \(\Lambda\) is \(\Lambda^+\), since \(\Lambda^{\rm ab}\cong C_3\times C_2\). This follows by abelianizing the central product, using \((T^*)^{\rm ab}=C_3\) and \((Q_{68})^{\rm ab}=C_4\), and identifying the shared central involutions. The corresponding double cover branched over the order-two singular set has first homology of order \(51\). In the two fixed \(+3\) Whitehead mirror models of Proposition 7.8 the corresponding homology orders are \(21\) and \(3\). Thus those models cannot supply either slope computation at \(m=17\). This comparison leaves open a different link description of \((O,\ell)\).

## Branched fillings from the two prism covers

There is an epimorphism
\[
\Gamma\rtimes_\alpha\langle t\rangle
\longrightarrow D_{34}=C_{17}\rtimes C_2
\]
with \(Q_8\) killed, \(z\) a rotation, and \(t\) a reflection. In the nonregular cover of degree \(17\) from a reflection subgroup, the permutation of points above the actual section is \(r\mapsto-r\) in \(\mathbb Z/17\mathbb Z\). Thus the full preimage of \(\gamma\) has one degree-one lift and eight degree-two lifts. The cover is the mapping torus over the original base with fibre \(Q_8\backslash S^3\). The kernel gives a regular cover of degree \(34\), which is the mapping torus with this same fibre over the degree-two base. In it there are seventeen degree-two lifts, each projecting once onto the new base. Its mapping-torus group is \(Q_8\rtimes_{\alpha^2}2\mathbb Z\).

In each cover select one lift that projects once onto its base, taking the degree-one lift in the degree-\(17\) cover. Its stable action on \(Q_8/[Q_8,Q_8]\) permutes the three nonzero classes, and a change by an inner automorphism has the same effect. Consequently killing it kills the abelianization of the residual quotient of \(Q_8\). A solvable perfect quotient is trivial, so either surgery yields a homotopy sphere. Each is standard by E25 applied to the actual section-puncture mapping torus with homogeneous \(Q_8\) fibre, and with either normal framing.

To complete the full covering, pull back the chosen normal framing at every component. On a lift of degree \(d=1,2\) the boundary covering is \((u,y)\mapsto(u^d,y)\) on \(S^1\times S^2\), because the tubular framing is pulled back. Fill with the smooth branched map \((w,y)\mapsto(w^d,y)\) on \(D^2\times S^2\), choosing radial collar coordinates to match the boundary covering smoothly. This completes a branched covering map, and extends the deck action in the regular case. It cannot be an ordinary finite covering of a simply connected closed filling, and for the degree-two lifted boundaries the branch model displays the concrete failure.

The smooth types of these two completed covers follow from the framing parities. The oriented three-manifold \(Y\) is spin. Its spin structures form a torsor over \(H^1(Y;\mathbb F_2)=\mathbb F_2^2\). The affine monodromy has a unique fixed point because its linear part has no nonzero fixed vector. Hence \(N\) is spin with two spin structures, differing by the base degree modulo two. A framed circle inherits a spin structure by splitting off its trivially framed normal bundle, and the spin structure extends over the cap precisely when the inherited spin on the circle is bounding. Pullback by a degree-two map of circles sends either spin structure to the nonbounding one, since the \(\mathbb Z/2\) monodromy squares to \(1\). This applies directly to every degree-two lift using the pulled-back frame.

For the nonregular cover choose the spin structure downstairs whose pullback is bounding on the degree-one framed lift. After surgery there, it gives the unique spin structure on the resulting \(S^4\). All eight remaining circles still have nonbounding induced spin. In the regular cover change the pulled-back spin structure by the mod-two class of its new base. This changes the spin on all seventeen circles to bounding. After the selected surgery, this again gives the unique spin structure on \(S^4\), and all sixteen remaining surgeries extend it.

The remaining link of circles in \(S^4\) is smoothly isotopic to an unlink. Indeed choose disjoint small round circles as targets and generic simultaneous homotopies. The dimension of the coincidence domain at equal time is three, less than four, and generic homotopies also avoid vanishing derivatives along the circles. Thus this is an isotopy through embeddings of the disjoint union, which extends ambiently. Surgery on each unknotted framed circle replaces its neighborhood to give a connected sum with a sphere bundle over \(S^2\). The complement of the unknot is \(D^2\times S^2\), so the two bundles are obtained by identity and odd-rotation clutching. The extending framing yields \(S^2\times S^2\), while the other yields the nontrivial sphere bundle with odd intersection form. Writing \(S^2\widetilde{\times}S^2\) for the latter, the completed covers are
\[
\begin{array}{c|c|c}
\text{degree} & \text{local degrees above the branch sphere} & \text{smooth total space}\\
17 & 1,\ \underbrace{2,\dots,2}_{8} & \#_8(S^2\widetilde{\times}S^2)\\
34 & \underbrace{2,\dots,2}_{17} & \#_{16}(S^2\times S^2).
\end{array}
\]
These statements hold for either downstairs framing. They identify the total spaces of the covers. Recovering the downstairs smooth type by the regular cover would additionally require a smooth equivariant identification of the action and its fixed spheres.

The evaluated routes leave two concrete tasks: compute the marked orbifold filling groups of \((O,\ell)\) in the actual slopes, or recognize the smooth quotient of the computed regular branched cover together with its action. The order-seven model and a single homogeneous lifted surgery do not complete either task.
