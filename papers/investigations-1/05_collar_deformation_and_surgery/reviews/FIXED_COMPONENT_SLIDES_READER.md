# Independent reading of the GST fixed-component slide obstruction

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort are unavailable. Bounded E review at repository input 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. The inputs are the native reverse diagram of Gompf–Scharlemann–Thompson (GST), the two quotient tests, and the signed rank-two primitive-word classification. The reading checks free homotopy classes and a necessary group condition for geometric cancellation.

## Native reverse pair and slide invariant

Use the two dotted handles of the left side of GST Figure 9 for the marking of \(Y_2=\#_2(S^1\times S^2)\). Its boundary inclusion into the four-dimensional 1-handlebody induces an isomorphism on fundamental groups. Write \(F_2=F(x,y)\), \(X=x^{-1}\), \(Y=y^{-1}\). The Figure 9 relators for \(k=1\) are \(y=w^{-1}xw\), \(w=yx\), and \(x^{n+1}=y^n\). Choosing orientations and cyclic starting points gives the two classes

\[
r=yxyXYX,\qquad s_n=x^{n+1}Y^n.
\]

In fact \(y w^{-1}Xw=yXYXyx\), a cyclic rotation of \(r\). The right side of Figure 9 introduces the two surgery-dual meridians. GST performs the reductions through Figures 10–13 by permitting moves over the bracketed surgery components and prohibiting the bracketed components from sliding over the two introduced components. The latter are carried to the components of the native forward link \(L_{n,1}\) in Figure 1. Thus the Figure 9 reverse presentation concerns the actual dual pair, up to the simultaneous marking and the choices of orientations and based paths. The calculation treats both stationary labels, so its conclusion is independent of the naming order of the two forward components. [GST, §7, Figures 1 and 9–13 and Question Two](https://arxiv.org/pdf/1103.1601#page=19)

Choose orientations for the two cores. In the fixed group, sliding the moving core \(u\) over a framed push-off of the stationary core \(v\) gives, up to conjugation, \(u g v^\epsilon g^{-1}\) for some \(g\in F_2\) and \(\epsilon=\pm1\). This follows by traversing the two sides of the band and the push-off. The push-off is homotopic to the core in its tubular neighborhood for every framing. Isotopy changes only the based representative, and orientation choices can be tracked separately. After any finite sequence of such slides the moving class has abelianization \([u]+j[v]\) for some \(j\in\mathbb Z\), and its image in every quotient that kills \(v\) is conjugate to the original image. Treating the final knot as unoriented also allows comparison with the inverse. GST Lemma 2.1 reverses the slide direction when passing between forward and dual descriptions. [GST, §2, Lemma 2.1 and Figures 3–4](https://arxiv.org/pdf/1103.1601#page=3)

One transverse intersection with any belt sphere of a 1-handle in a marked handlebody would make the attaching class primitive. Cutting along that sphere gives a free product marking with one stable generator \(t\), and the loop has cyclic representative \(t^{\pm1}a\), with \(a\) in the complementary free factor. Replacing \(t\) by \(t^{\pm1}a\) gives another basis. Primitivity is invariant under automorphisms, so the test applies in every belt basis, including a basis produced by 1-handle slides with the mark transported.

## Primitive classes and the two stationary choices

An oriented primitive class in \(F_2\) is determined up to conjugacy by its coprime abelianization. For a vector \((a,-b)\) with \(a,b>0\), the Christoffel representative uses only \(x,Y\). It can be written as \(b\) consecutive blocks \(x^{m_i}Y\), where \(m_i=\lceil ia/b\rceil-\lceil(i-1)a/b\rceil\) for \(i=1,\ldots,b\). At height \(i-1\) the lower lattice path travels until the smallest horizontal coordinate allowing a step to height \(i\) below the line of slope \(b/a\). For \(1<a/b<2\) the blocks have \(m_i=1\) or \(2\). For \(a=b+1\), \(b\ge1\), there is precisely one block of size two and all other blocks have size one. An axis class with unit coordinate has a single-letter primitive representative. [Kassel–Reutenauer, §3, formula (3.1), Theorem 3.2 and Corollary 3.3](https://arxiv.org/pdf/math/0507219#page=14)

**Keep \(r\) stationary.** The moving vector is \((n+1-j,-n+j)=(k+1,-k)\). For \(k\ge0\) the primitive representative is \(x(xY)^k\). For \(k=-m-1<0\) it is \(y(yX)^m\). This includes both axis cases. In \(C_2*C_3=\langle d,e\mid d^2=e^3=1\rangle\) put \(x=de\), \(y=ed\). Then \(xyx=d=yxy\), so the map kills \(r\). The image of \(s_n\) is

\[
(de)^{n+1}(de^{-1})^n .
\]

This word is cyclically reduced in the free product. Its cyclic list of \(C_3\)-syllables contains a run of \(n+1\) successive \(e\)'s. For the primitive candidates each \(x,Y\) maps to \(de,de^{-1}\) and each \(y,X\) maps to \(ed,e^{-1}d\). Their images are cyclically reduced too. The \(C_3\)-syllables alternate apart from one possible run of size two. The axis cases have just one \(C_3\)-syllable. The free-product conjugacy criterion for cyclically reduced words of syllable length at least two allows only cyclic permutations. Inversion reverses the cyclic order and flips all signs, preserving the longest run of either sign. Since \(n+1\ge3\) when \(n\ge2\), no candidate matches the image of \(s_n\).

For \(n=3\) an independent matrix check gives the same result. Set

\[
A=\begin{pmatrix}1&1\\0&1\end{pmatrix},\qquad
B=\begin{pmatrix}1&0\\-1&1\end{pmatrix}.
\]

Here \(ABA=BAB\), and \(A^4 B^{-3}=\begin{pmatrix}13&4\\3&1\end{pmatrix}\) has trace \(14\). The images of \(x(xY)^m\), \(m\ge0\), have traces \(T_m\) with \(T_0=2\), \(T_1=4\) and \(T_{m+2}=3T_{m+1}-T_m\) by Cayley–Hamilton for \(AB^{-1}\). The next two values are \(10,26\), and the recurrence gives a strictly increasing sequence. The swapped classes have the same trace since conjugation by \(\begin{pmatrix}0&1\\-1&0\end{pmatrix}\) interchanges \(A,B\). Trace is unchanged by inversion in \(\mathrm{SL}_2(\mathbb Z)\).

**Keep \(s_n\) stationary.** For the moving class the vector is \((-1+(n+1)j,1-nj)\). For \(j\ne0\), orient it to give \((a,-b)\) with \(a,b>0\). For \(j>0\) one has \(a-b=j\) and \(b=nj-1>j\), using \(n\ge3\). For \(j<0\) one has \(a-b=-j\) and \(b=1-nj>-j\). Hence \(1<a/b<2\). Its coordinates are coprime, since in the original orientation the two coordinates sum to \(j\) and \(1-nj\) is coprime to \(j\). For \(j=0\) a primitive unoriented representative is \(xY\).

Map to \(C_{n+1}*C_n\) by sending \(x,y\) to factor generators. This kills \(s_n\). Each possible primitive representative projects to a cyclically reduced word with \(x\)-syllables \(x\) or \(x^2\) and only \(Y\)-syllables in the other factor. Its inverse has only \(y\)-syllables in that factor. The image of \(r\) has six surviving syllables, and the \(C_n\)-syllables comprise two \(y\)'s and one \(Y\). In both \(r\) and \(r^{-1}\) these two types are distinguishable since \(n\ge3\). No cyclic permutation of either can give the cyclically reduced image of a primitive candidate. This also handles \(j=0\), where there is additionally a syllable length mismatch.

The initial \(r\) itself is nonprimitive. Its cyclically reduced word has both signs of \(x\) and both signs of \(y\), while a cyclically reduced primitive representative has a single sign for each generator. The initial \(s_n\) is nonprimitive for \(n\ge2\) by the \(r\)-stationary calculation with \(j=0\). Thus both initial handles and every endpoint of a fixed-component sequence fail the group condition for a reverse \(1/2\) cancellation.

## First switch and range

Suppose the sequence starts by moving only \(b\) over \(a\), so the old moving curve \(b'\) has abelianization \([b]+j[a]\) and image conjugate to \(b\) in the quotient used for \(a\) stationary. At the first switch, one slide replaces \(a\) by \(a'\), whose abelianization is \([a]+\epsilon([b]+j[a])\) and whose quotient image is conjugate to \(b^\epsilon\), with \(\epsilon=\pm1\). Orient \(a'\) so its abelianization is \([b]+(j+\epsilon)[a]\). Both \(a'\) and \(b'\) are then excluded by the same quotient and slope test as \(b'\) before the switch. This gives a lower bound of three 2-handle slides for a first reverse \(1/2\) cancellation in the native rank-two presentation, if one is reached using slides and isotopies. The first such cancellation must come after both moving directions have been used and after the first switch. The argument applies in either initial direction.

For each native reverse \(L_{n,1}\) in \(Y_2\), \(n\ge3\), the obstruction allows every band, isotopy, rebasing, core orientation and transported 1-handle basis in the tested sequences. It concerns necessity of primitivity for the actual framed tubes. The tests end immediately after the first switch. GST §10 supplies a stabilized simplification of the family. [GST, Proposition 10.1 and §10](https://arxiv.org/pdf/1103.1601#page=28)

A split rank-three realization adds a free factor \(\langle z\rangle\) to the local \(F_2\). The same obstruction follows for slides carried in the original punctured \(Y_2\) summand, or whenever the endpoint attaching class is known to be conjugate into this \(F_2\) and has the slide invariant above after projection. A primitive element \(p\) of \(F_3\) lying in \(F_2\) is primitive in \(F_2\). For \(F_3=\langle p\rangle*H\), the Kurosh subgroup theorem applied to \(F_2<F_3\) gives \(\langle p\rangle\) as a free factor. A band through the split summand can introduce \(z\) into a moving word even though its \(z\)-exponent is zero. The retraction argument has a precise limitation. Write \([u,v]=uvu^{-1}v^{-1}\). The word \(x[y,zx^2]\) is primitive in \(F_3\) by applying the basis changes \(x\mapsto x[y,z]\) and then \(z\mapsto zx^2\). It has zero \(z\)-exponent but its retraction \(x[y,x^2]\) cyclically reduces to \(yx^2YX\), which has exponent vector \((1,0)\) and is nonprimitive in \(F_2\).

If the forward link is inserted in a ball disjoint from a split lower zero handle, its two forward native cuts are \(Y_1\# S^3_0(Q)\) and \(Y_1\# S^3_0(V_n)\), respectively. Both are reducible, since an \(S^2\) fiber in the split \(Y_1\) summand remains nonseparating. The split lower handle has its own cancellation under the separate localization argument. The GST calculation addresses the local rank-two alternative. [Parent localization assessment](REDUCIBLE_CUTS_AND_RETURN_COST_20261126.md)
