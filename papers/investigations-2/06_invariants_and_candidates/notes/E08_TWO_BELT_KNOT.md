# INV-E08 · The positive two-twisted trefoil double

27 November 2026 (America/New_York), 28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution under the [two-cap request R1](../../07_counterexample_tests/research-progress/handoffs/REQUEST_TWO_CAPS_R1.md), SHA-256 `fab10d9daf5a3eee44bdf87591e9b2bc461bc99eb1041d9fdb84d9226eadfc39`, checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Dispatch class GPT-6.2 Sol/ultra. Actual serving variant and effort unavailable. Evidence consists of checked primary passages, an exact finite correction-term calculation and the working branched-cover argument below. This packet treats the knot specified by the request. Comparison to an actual geometric boundary requires its signed identification with that knot.

For \(J=D_+(T_{2,3},2)\) in Hedden–Ording's Figure 1 convention,

\[
s_{\mathbb Q}(J)=2,\qquad \tau(J)=0,\qquad g_4(J)=1.
\]

The oriented double branched cover is positive \(9/2\)-surgery on the right-hand trefoil summed with its orientation reverse. Tange's classification excludes a smooth rational homology ball filling of this cover. A smooth proper disk for \(J\) in an integral homology ball would produce such a filling, so its minimum genus in every marked integral homology ball with boundary \(S^3\) is one. The same genus statement holds for the mirror by reversing the orientation of the ball.

## Knot, genus and cover identification

Use the positive clasp and two full right-handed twists of Figure 1 of Hedden–Ording, with the right-handed trefoil as companion. Hedden's Figure 1 and its adjacent satellite definition specify the pattern in a solid torus, the number of full twists there and passage to the companion by its Seifert longitude. Thus the integer refers to pattern twists relative to the Seifert framing. Any compensation for diagram writhe is part of realizing that framing. Hedden–Ording Theorem 1.1 (arXiv v1, p. 2) gives both signed values in the displayed formula for this exact knot. The Whitehead pattern has the usual genus-one Seifert surface. It can be built by plumbing the clasp Hopf band to the twisted annulus following the companion under the Seifert framing. The two annuli meet in the plumbing square, so the connected surface has Euler characteristic \(-1\) and a single boundary. Hedden's §6 uses this genus-one Seifert surface for \(D_+(K,t)\). Pushing its interior into a collared \(S^3=\partial B^4\), leaving its boundary fixed, gives \(g_4(J)\leq1\). Rasmussen's Theorem 1 gives \(g_4(J)\geq |s_{\mathbb Q}(J)|/2=1\). The same collar push gives a genus-one upper bound in any specified smooth filling. [Hedden–Ording, Theorem 1.1 and Figure 1, arXiv:math/0512348v1, AJM **130** (2008), 441–453](https://arxiv.org/pdf/math/0512348) · [Hedden, Figure 1 and §6, GT **11** (2007), 2277–2338](https://msp.org/gt/2007/11-4/gt-v11-n4-p08-s.pdf) · [Rasmussen, Theorem 1 and §4.4, arXiv:math/0402131v1](https://arxiv.org/pdf/math/0402131)

Tange defines \(T_{r,s}\) to be the positive torus knot and \(D_+(K,n)\) to be the \(n\)-twisted positive-clasp Whitehead double. His §1.1 and Figure 2 use the right-handed trefoil as companion and the same positive-clasp pattern with the indicated twist box. He uses Hedden's convention explicitly in Theorem 1 and places the known non-slice \(D_+(T_{2,3},2)\) in Table 1. The sign check in §1.1 is \(\Delta_{D_+(K,n)}(t)=-nt+(2n+1)-nt^{-1}\), giving \(5-2(t+t^{-1})\) and determinant 9 at \(n=+2\). In §3, Proposition 2 identifies the double branched cover of this twisted pattern by the Montesinos trick, in the stated surgery orientation,

\[
Y=\Sigma_2(J)=S^3_{(4n+1)/2}(T_{2,3}\# T_{2,3}^{r})\big|_{n=2}
=S^3_{+9/2}(T_{2,3}\# T_{2,3}^{r}).
\]

The superscript \(r\) reverses the knot orientation. Both summands retain the right-handed chirality. In particular \(H^2(Y;\mathbb Z)\cong\mathbb Z/9\). The conclusion about smooth rational homology balls is invariant under reversing the orientation of \(Y\). [Tange, arXiv:1504.08202v3, 29 June 2015, pp. 2–3 and Proposition 2, p. 12](https://arxiv.org/pdf/1504.08202) · [Journal record, Adv. Math. **320** (2017), 475–499](https://doi.org/10.1016/j.aim.2017.08.013)

## Filling obstruction and exact check

Tange Theorem 10 and Corollary 3, p. 6 of the inspected v3, apply to the covers of \(D_+(T_{s,sp+1},n)\) with \(s=2,3\), \(p\) positive integral and \(n\) nonnegative integral. For \(s=2\), the only filling pairs \((p,n)\) in the corollary are \((1,6)\) and \((3,12)\), so \((1,2)\) is excluded. The determinant-square condition from Proposition 2 is satisfied since \(n=1(1+1)\), and Theorem 8 gives \(\delta(J)=0\) since \(n=2p\). The obstruction uses correction terms away from the spin class. [Tange, Theorems 8 and 10 and Corollary 3, p. 6, and §§3–3.1](https://arxiv.org/pdf/1504.08202)

For the exact check, use the positive surgery labeling \(i\in\mathbb Z/9\) in Ni–Wu Proposition 1.6 and Remark 2.10. For the companion sum, Tange's \(s=2\) table on p. 14 gives \(V_0=V_1=1\), \(V_k=0\) for \(k\geq2\). Put \(j_i=\min(\lfloor i/2\rfloor,\lfloor(10-i)/2\rfloor)\). The surgery formula gives \(d(Y,i)=d(L(9,2),i)-2V_{j_i}\). In the same labels Tange's lens formula (4), p. 16, has \(d(L(9,2),i)=(i-5)^2/18\) for odd \(i\), with \(1/2\) subtracted for even \(i\). Thus direct rational arithmetic gives

| \(i\) | \(j_i\) | \(d(L(9,2),i)\) | \(d(Y,i)\) |
| ---: | ---: | ---: | ---: |
| 0 | 0 | \(8/9\) | \(-10/9\) |
| 1 | 0 | \(8/9\) | \(-10/9\) |
| 2 | 1 | \(0\) | \(-2\) |
| 3 | 1 | \(2/9\) | \(-16/9\) |
| 4 | 2 | \(-4/9\) | \(-4/9\) |
| 5 | 2 | \(0\) | \(0\) |
| 6 | 2 | \(-4/9\) | \(-4/9\) |
| 7 | 1 | \(2/9\) | \(-16/9\) |
| 8 | 1 | \(0\) | \(-2\) |

Tange specifies the spin label \(i_0=(9+2-1)/2=5\) in §3, and the entries respect conjugation \(i\mapsto10-i\pmod9\). Owens–Strle, Lemma 2.1 and Proposition 4.1, say that for a smooth rational homology ball filling the extending Spin\(^c\) classes lie in one coset of the image of \(H^2\) of the filling, of order \(\sqrt{9}=3\), and all of its correction terms vanish. Since the boundary group has odd order, the coset can be based at its unique spin class. The coset is \(\{2,5,8\}\), giving \((-2,0,-2)\). The two other cosets \(\{0,3,6\}\) and \(\{1,4,7\}\) also fail the vanishing test. The strongest check here is that only one of the nine correction terms vanishes. [Ni–Wu, *Cosmetic surgeries on knots in* \(S^3\), Proposition 1.6 and Remark 2.10, J. Reine Angew. Math. **706** (2015), 1–17](https://www.its.caltech.edu/~yini/Published/Cosmetic.pdf) · [Tange, arXiv v3, §3](https://arxiv.org/pdf/1504.08202) · [Owens–Strle, Lemma 2.1 and Proposition 4.1, Adv. Math. **200** (2006), 196–216](https://www.maths.ed.ac.uk/~v1ranick/papers/owens.pdf)

## Why the obstruction applies to a puncture

Let \(W\) be a smooth compact oriented integral homology four-ball, with its oriented boundary marked as \(S^3\). Suppose \(D\subset W\) is a smooth proper disk with boundary the marked \(J\). A normal disk bundle of \(D\) is trivial. Mayer–Vietoris for this bundle and its exterior, with common face \(D^2\times S^1\), identifies \(H_1\) of the exterior with \(\mathbb Z\) generated by a meridian, using \(H_2(W)=H_1(W)=0\). The associated meridian-modulo-2 cover extends across the disk bundle by the smooth local branch model \(z\mapsto z^2\) in the normal disk. Its oriented boundary is exactly \(Y=\Sigma_2(J)\).

With \(\mathbb F_2\) coefficients the branched double cover \(\widetilde W\) has the chain sequence

\[
0\longrightarrow C_*(W,D)\xrightarrow{\operatorname{tr}} C_*(\widetilde W)
\xrightarrow{\pi_*} C_*(W)\longrightarrow0.
\]

In a compatible cellular subdivision with branch locus a subcomplex, transfer sums the two lifts of each off-branch cell. Their fixed faces cancel mod 2. At a branch cell the single lift maps to that cell. This gives exactness cell by cell, including along the boundary. Since \(D\to W\) is an \(\mathbb F_2\)-homology equivalence, the relative complex is acyclic and \(\widetilde W\) is a mod-2 homology ball. Its smooth compactness and the universal coefficient theorem then imply that it is a rational homology ball. The computed correction terms contradict that necessary filling property. The argument needs only the homology of \(W\) and proper smooth disk geometry. It applies to every coordinate puncture of a smooth homotopy four-sphere by excision. [Earlier chart and puncture control](../../07_counterexample_tests/02_invariants/notes/E01_GENUS_CONTROL.md)

On the exact proposed boundary, the comparison is therefore genus one on the standard side and genus one in each puncture. A verified genus-one boundary sum using this \(J\) would match the standard upper bound. A genus-zero return for the identical signed boundary would contradict the branched-cover obstruction. These statements concern this knot and hold independently of any choice of embedded surface through the two belts.
