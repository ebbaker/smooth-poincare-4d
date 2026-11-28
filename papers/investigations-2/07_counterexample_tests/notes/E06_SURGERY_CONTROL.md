# WIT-E06 · Correction terms of the positive nine-halves surgery

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Frozen request R1](../research-progress/handoffs/REQUEST_TWO_CAPS_R1.md), SHA-256 prefix `fab10d9daf5a3eee`, at checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b` with the dated first-activation closings. Bounded E execution; actual serving variant and effort unavailable.

**Disposition.** Let \(T\) be the right-handed trefoil, \(K=T\#T\), and \(Y=S^3_{+9/2}(K)\), oriented as positive surgery on the standard oriented \(S^3\). The nine correction terms below rule out a smooth mod-two homology-ball filling of \(Y\) or \(-Y\). The only possible extension set for such a filling is \(\{2,5,8\}\) in the specified surgery labels. The test applies to the candidate Whitehead satellite \(J\) if its double branched cover is identified with one of these oriented manifolds. That identification is a separate premise.

## Floer normalization and computation of the exponents

Work over \(\mathbb F_2\). Hedden–Levine give the filtered complex of the right-handed trefoil, including the two arrows from the middle generator. After rescaling by powers of \(U\), the three generators are \(a,c,b\) with filtration levels \((0,1),(1,0),(1,1)\), Maslov degrees \(0,0,1\), and \(\partial b=a+c\), \(\partial a=\partial c=0\). This follows directly from their generators \(a_0,b_0,c_0\) by taking \(a=c_0,c=U^{-1}a_0,b=U^{-1}b_0\). Ozsváth–Szabó's filtered connected-sum theorem gives the tensor complex of two copies with additive filtrations and Maslov degrees. [Hedden–Levine, *A surgery formula for knot Floer homology*, Quantum Topol. 15 (2024), 229–336, §3.1, pp. 260–261 and Fig. 3(a)](https://ems.press/content/serial-article-files/47318#page=32) · [Ozsváth–Szabó, *Holomorphic disks and knot invariants*, Adv. Math. 186 (2004), 58–116, arXiv:math/0209056v4 Theorem 7.1, p. 43](https://arxiv.org/pdf/math/0209056#page=43)

In the tensor product every degree-zero cycle is a combination of \(a\otimes a,a\otimes c,c\otimes a,c\otimes c\). The only other possible degree-zero basis term is \(U(b\otimes b)\), whose differential has four distinct nonzero terms and so cannot occur in a cycle with the four closed generators. Each of the four cycles represents the unfiltered degree-zero homology generator. Their support levels are \((0,2),(1,1),(1,1),(2,0)\). A sum of distinct basis terms lies in a filtration rectangle exactly when each term does.

For an integer \(s\ge0\), use \(A_s^+=C/C\{i<0,j<s\}\) and \(B^+=C/C\{i<0\}\) in the notation of Ni–Wu, with \((i,j)\) here denoting filtrations. A degree-zero homology generator with support at \((x,y)\) has its first \(U^k\)-translate in \(C\{i<0,j<s\}\) at \(k=1+\max(x,y-s)\). Taking the least such \(k\) over the generator cycles gives the least power appearing in the image in the unfiltered tower. The vertical truncation \(C\{i<0\}\) has least power \(1\). In the two plus quotients the towers induced by the unfiltered homology consequently have bottom representatives \(U^{k-1}\) and \(1\). The map of towers induced by projection is multiplication by \(U^{k-1}\) in their bottom-normalized coordinates. Thus
\[
 V_s=\min_{(x,y)\in\{(0,2),(1,1),(2,0)\}}\max(x,y-s),
 \qquad V_0=1,\quad V_1=1,\quad V_s=0\ (s\ge2).
\]
This computation uses the explicit tensor cycles and the tower definition of \(V_s\). [Ni–Wu, *Cosmetic surgeries on knots in \(S^3\)*, J. Reine Angew. Math. 706 (2015), 1–17, published §2.1–2.2, pp. 3–6](https://www.its.caltech.edu/~yini/Published/Cosmetic.pdf#page=3)

## Nine correction terms

Ni–Wu Proposition 1.6 and Remark 2.10, for relatively prime \(p,q>0\), give
\[
 d(S^3_{p/q}(K),i)=d(L(p,q),i)-2\max\left\{V_{\lfloor i/q\rfloor},V_{\lfloor (p+q-1-i)/q\rfloor}\right\},
 \qquad 0\le i<p.
\]
Here \(L(p,q)=S^3_{p/q}(\text{unknot})\) in the same positive-surgery orientation and the same rational surgery labeling. Ozsváth–Szabó Proposition 4.8, Eq. (12), is printed for \(-L(p,q)\). Reversing orientation by Proposition 4.2 yields the positive-orientation recursion
\[
 d(L(p,q),i)=\frac{(2i+1-p-q)^2-pq}{4pq}-d(L(q,p\bmod q),i\bmod q).
\]
The initial value on \(S^3=L(1,0)\) is zero. In particular \(d(L(2,1),0)=1/4\), \(d(L(2,1),1)=-1/4\), and the first term of the recursion for \(L(9,2)\) is \(((2i-10)^2-18)/72\). [Ni–Wu, pp. 3, 5, 8](https://www.its.caltech.edu/~yini/Published/Cosmetic.pdf) · [Ozsváth–Szabó, *Absolutely graded Floer homologies and intersection forms for four-manifolds with boundary*, Adv. Math. 173 (2003), 179–261, arXiv:math/0110170v2 §§4–4.1, pp. 21, 25–26](https://arxiv.org/pdf/math/0110170#page=21)

| Surgery label \(i\) | \(\lfloor i/2\rfloor\) | \(\lfloor(10-i)/2\rfloor\) | \(\max V\) | \(d(L(9,2),i)\) | \(d(Y,i)\) |
|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 5 | 1 | \(8/9\) | \(-10/9\) |
| 1 | 0 | 4 | 1 | \(8/9\) | \(-10/9\) |
| 2 | 1 | 4 | 1 | \(0\) | \(-2\) |
| 3 | 1 | 3 | 1 | \(2/9\) | \(-16/9\) |
| 4 | 2 | 3 | 0 | \(-4/9\) | \(-4/9\) |
| 5 | 2 | 2 | 0 | \(0\) | \(0\) |
| 6 | 3 | 2 | 0 | \(-4/9\) | \(-4/9\) |
| 7 | 3 | 1 | 1 | \(2/9\) | \(-16/9\) |
| 8 | 4 | 1 | 1 | \(0\) | \(-2\) |

The arithmetic was also recomputed with Python's exact rational `Fraction`, using the filtration vertices and the lens recursion directly. The only zero occurs at \(i=5\). Conjugation preserves \(d\) by Ozsváth–Szabó Proposition 4.2, so this singleton is fixed under conjugation. Because \(H_1(Y;\mathbb Z)=\mathbb Z/9\) by the meridional surgery relation, there is one spin structure on \(Y\) and exactly one self-conjugate Spin\(^c\) class. This independently identifies label 5 as spin. The rational-surgery cobordism description gives the same index: the mapping cone label \(i\) satisfies the characteristic evaluation congruence \(2i\equiv \langle c_1,[\widetilde S]\rangle+p+q-1\) modulo \(2p\) on the extending cobordism structure. Conjugating reverses the Chern evaluation, so it acts by \(i\mapsto p+q-1-i\pmod p\), whose fixed label is 5 here. [Ozsváth–Szabó, Proposition 4.2](https://arxiv.org/pdf/math/0110170#page=21) · [Mark–Tosun, *Naturality of Heegaard Floer invariants under positive rational contact surgery*, J. Differential Geom. 110 (2018), 281–344, arXiv:1509.01511 Corollary 5.9, p. 61](https://arxiv.org/pdf/1509.01511#page=61)

## Extension set and filling obstruction

Suppose \(W\) is a compact smooth mod-two homology ball with boundary \(Y\). The integral homology groups in positive degrees are finitely generated and have zero free rank by the mod-two universal coefficient sequence. Hence \(W\) is a rational homology ball. As \(H^1(W;\mathbb F_2)=H^2(W;\mathbb F_2)=0\), it is orientable and spin, and its spin structure is unique. With its boundary orientation fixed, the spin structure restricts to the unique one on \(Y\). Its induced Spin\(^c\) structure provides a basepoint for the extension set. Spin\(^c\) structures form torsors over integral second cohomology and restriction is affine, so the extension set is the translate of \(M=\operatorname{im}(H^2(W;\mathbb Z)\to H^2(Y;\mathbb Z))\) by the spin label.

To determine the order of \(M\), let \(A=H_1(W;\mathbb Z)\), \(B=H_2(W;\mathbb Z)\), both finite. In the pair cohomology sequence the segment
\[
0\to H^2(W,Y)\to H^2(W)\to H^2(Y)\to H^3(W,Y)\to H^3(W)\to 0
\]
is exact. At the left \(H^1(Y;\mathbb Z)=0\), and at the right the map from finite \(H^3(W)\) to \(H^3(Y)=\mathbb Z\) is zero. Poincaré–Lefschetz duality identifies the relative groups with \(B\) and \(A\). By universal coefficients, \(H^2(W)\) and \(H^3(W)\) have orders \(|A|\), \(|B|\). Thus \(|M|=|A|/|B|\), and \(|H^2(Y)/M|=|A|/|B|\) as well. This gives \(|M|=3\), including when the filling has torsion \(H_2(W;\mathbb Z)\). The unique order-three subgroup in \(\mathbb Z/9\) is \(\{0,3,6\}\); it is independent of the unit choice for the affine surgery index. The cosets are

| Coset | Its three \(d\) values |
|---|---|
| \(\{0,3,6\}\) | \((-10/9,-16/9,-4/9)\) |
| \(\{1,4,7\}\) | \((-10/9,-4/9,-16/9)\) |
| \(\{2,5,8\}\) | \((-2,0,-2)\) |

For a mod-two homology ball the spin restriction selects exactly the last row. Ozsváth–Szabó Proposition 9.9 forces every extending Spin\(^c\) class over a smooth rational homology ball to have correction term zero. The two values \(-2\) contradict this condition. The other rows show the same obstruction for any rational homology ball admitting a Spin\(^c\) structure, even for an unspecified origin of the extension coset. Reversing the boundary orientation negates the terms and retains the obstruction. [Ozsváth–Szabó, arXiv v2 Proposition 9.9, p. 67](https://arxiv.org/pdf/math/0110170#page=67) · [Jabuka–Naik, *Order in the concordance group and Heegaard Floer homology*, Geom. Topol. 11 (2007), 979–994, Theorem 2.3](https://msp.org/gt/2007/11-2/gt-v11-n2-p09-s.pdf#page=8)

If \(J\) bounds a smooth proper disk \(D\) in a smooth integral homology ball \(V\) with marked boundary \(S^3\), the disk exterior has first homology generated by a meridian by the Thom isomorphism and the long exact sequence of its pair in \(V\). The meridian mod-two homomorphism defines the connected double cover, which extends by the normal-disk map \(z\mapsto z^2\) along \(D\). Its boundary is the double branched cover of the specified knot. With \(\mathbb F_2\) coefficients the cell chains of the cover fit in the exact sequence from relative transfer and projection
\[
0\to C_*(V,D)\to C_*(\widetilde V)\to C_*(V)\to0.
\]
In a cell structure adapted to \(D\), each off-branch open cell has two lifts, whose sum spans the kernel in that fibre, and each branch cell has just one lift. This gives the relative transfer, since lifted fixed faces cancel in pairs. Because \(V\) and \(D\) are connected and mod-two acyclic, this sequence makes \(\widetilde V\) a mod-two homology ball. Thus a cover identification with \(Y\) or \(-Y\) would exclude the disk for \(J\) in every such \(V\). The arithmetic fixes the positive surgery on the two right-handed summands and also applies to the orientation reversal of its result. Reversing the surgery coefficient while keeping the same summands is a separate surgery. [Jabuka–Naik, §3, p. 986, disk-cover interface](https://msp.org/gt/2007/11-2/gt-v11-n2-p09-s.pdf#page=8)
