# SP4-CERT-E03 · Four fillings of the marked prism section

27 November 2026, for Edward B. Baker III with OpenAI Codex assistance. The launcher recorded GPT-6.2 Sol with ultra reasoning effort. Serving settings beyond that record are unavailable. Scope is the specified projected quaternionic section at \(d=11,17\) and the ordered slopes \(s=0,1\). Input generation 6a422ce7814f. [Request](../research-progress/handoffs/REQUEST_CERT_E03_20261127.md) · [B01 decision](../brainstorm/notes/B01_MARKED_SWEEP.md) · [E02 marked derivation](E02_PRISM17_MARKED_EXTERIOR.md) · [E07 marked review](../reviews/E07_MARKED_FAMILY.md)

## Marked input and gate-3 table

**Inherited working geometry.** For \(k=(d-8)/3\), fix
\[
\begin{gathered}
b_1=LbL^{-1},\qquad b_{\mathrm{top}}=Fb_1F^{-1},
 \qquad c_{\mathrm{top}}=FcF^{-1},\\
\lambda_L=b_1^{-1}F^{-1},\qquad
\lambda_F=c^{-1}b^{-1}L^{-1},\\
G_s(d)=\left\langle F,L,b,c\ \middle|\
b^2=c^2=1,\quad [F,\lambda_F]=[L,\lambda_L]=1,\quad
F^3=\lambda_F^2,\quad
(b b_{\mathrm{top}})^2(c_{\mathrm{top}}b_{\mathrm{top}})^{-k}=1,\quad
L^{s-1}\lambda_L=1\right\rangle .
\end{gathered}
\]
Here the two old singular meridians have order at most two, the regular filling adds no cone relation, and \(\mu=L,\ a=\lambda_LL^{-1}\) in the marked peripheral group. The geometry is E02's order-seventeen computation. At order eleven its specialization relies on E07's independent check of the marked extension, including the Hopf longitude, ordinary \(S^3\) filling and corner exponent. The algebra below takes exactly these words as input at each order. [E02, §§3–4](E02_PRISM17_MARKED_EXTERIOR.md#3-push-off-and-marked-outer-face)

**Certificate and working reductions.** \(D_{2m}\) denotes the dihedral group of order \(2m\). “Ordinary group” is the quotient by both old singular meridians.

| \(d\) | \(s\) | \(k\) | Group | Order | Abelianization | Ordinary group | Marked geometry used |
| ---: | ---: | ---: | --- | ---: | --- | --- | --- |
| 11 | 0 | 1 | \(C_2\) | 2 | \(C_2\) | \(1\) | E02 method and E07 extension |
| 11 | 1 | 1 | \(C_4*_{C_2}D_{10}\) | infinite | \(C_4\) | \(C_2\) | E02 method and E07 extension |
| 17 | 0 | 3 | \(D_6\cong S_3\) | 6 | \(C_2\) | \(1\) | E02 |
| 17 | 1 | 3 | \(C_4*_{C_2}D_{14}\) | infinite | \(C_4\) | \(C_2\) | E02 |

The B01 trial of a group of order six at both ordinary \(S^3\) slopes fails at \(d=11\) under the marked input. The table supplies group data for gate 3. A smooth standardness comparison requires its own geometric argument. [B01 decision](../brainstorm/notes/B01_MARKED_SWEEP.md)

## The finite cases, in both directions

**Project theorem, working with checked word consequences.** When \(s=0\), the filling gives \(L=\lambda_L=Lb^{-1}L^{-1}F^{-1}\). Cancel \(L\) and use \(b^2=1\) to obtain \(L=F^{-1}b\). This gives
\[
b_1=F^{-1}bF,\qquad b_{\mathrm{top}}=b,\qquad \lambda_F=cF.
\]
Indeed \(L^{-1}=bF\) so \(c^{-1}b^{-1}L^{-1}=cF\). Then \([F,cF]=1\) implies \(Fc=cF\), and \(F^3=(cF)^2=F^2\) gives \(F=1\). Consequently \(L=b\) and \(c_{\mathrm{top}}=c\). The corner relation reduces to \((cb)^k=1\). Conversely set \(F=1,L=b\) in the original presentation with \(b^2=c^2=(cb)^k=1\). Then \(b_1=b_{\mathrm{top}}=b,\ c_{\mathrm{top}}=c,\ \lambda_F=c,\ \lambda_L=b\). The peripheral commutators, two filling equations and corner relation all hold. The two substitutions are inverse on generators. Thus
\[
G_0(d)=\langle b,c\mid b^2=c^2=(cb)^k=1\rangle .
\]

**Upper bound in the actual presentation.** Set \(r=cb\). The relations above imply \(b=cr\), \(c r c=r^{-1}\) and \(r^k=1\). Moving \(c\) through powers of \(r\) gives a representative \(r^j c^e\) with \(0\le j<k,\ e\in\{0,1\}\) for every word in \(F,L,b,c\) and their inverses. There are at most \(2k\) elements.

**Lower action and signed table.** On the \(2k\) rows with labels \((j,e)\), use the right permutations
\[
F\colon(j,e)\mapsto(j,e),\qquad L=b\colon(j,e)\mapsto(j+2e-1\bmod k,1-e),\qquad
c\colon(j,e)\mapsto(j,1-e).
\]
Each inverse column repeats the corresponding positive column. The row label is \(2j+e\), with root zero, and the word \((cb)^j c^e\) reaches row \(2j+e\) from the root. All original relators hold at every row. The action exhibits \(2k\) distinct images of the root. The two tables, encoded on all eight original signed columns, therefore certify exact orders 2 and 6. For \(k=1\), \(r=1\) and \(b=c\) generate \(C_2\). For \(k=3\), sending \(b,c\) to the transpositions \((0\,1),(1\,2)\) gives \(S_3\) by the same order bound. In the abelianization \(2b=2c=0\) and the odd relation \(k(b+c)=0\) implies \(c=b\). Killing both original singular meridians gives the trivial ordinary group. [Signed table data](../numerics/e03_cases.json)

## The positive neighbour and its infinite action

**Project theorem, working with checked word consequences.** For \(s=1\), the filling is \(\lambda_L=1\), giving \(F=b_1^{-1}=b_1\) and \(F^2=1\). Write \(q=\lambda_F\); the cone relation gives \(F=q^2\), hence \(q^4=1\). Since \(F=LbL^{-1}\), we have \(b=L^{-1}FL\); substituting into \(q=\lambda_F\) gives \(q=cL^{-1}F^{-1}\). Thus \(L=F^{-1}q^{-1}c=qc\), and \(b=cq^2c\). It follows that
\[
b_{\mathrm{top}}=q^2,\qquad c_{\mathrm{top}}=q^2cq^2,\qquad
b b_{\mathrm{top}}=(c q^2)^2,\qquad c_{\mathrm{top}}b_{\mathrm{top}}=(c q^2)^{-1}.
\]
Writing \(m=4+k\), the corner gives \((cq^2)^m=1\).

For the reverse direction, take \(q,c\) with \(q^4=c^2=(cq^2)^m=1\). Substitute \(F=q^2,\ L=qc,\ b=cq^2c,\ c=c\). Then \(b^2=1\), \(b_1=q^2\), \(\lambda_L=1\), and \(\lambda_F=c(cq^2c)(cq^{-1})=q\). Thus \([F,\lambda_F]=[L,\lambda_L]=1\) and \(F^3=q^6=q^2=\lambda_F^2\). The two translations become the displayed powers of \(cq^2\), so the corner is precisely the last relation of the reduced group. Both composites are the identity on generators. Therefore
\[
G_1(d)=\left\langle q,c\ \middle|\ q^4=c^2=(c q^2)^m=1\right\rangle .
\]
With \(v=q^2\), this presentation is the pushout of \(C_4=\langle q\rangle\) and \(\langle v,c\mid v^2=c^2=(cv)^m=1\rangle=D_{2m}\) over the order-two subgroup given by \(v\). The second group's dihedral presentation also has the elementary bound \(2m\) by the same normal forms as above. The action below realizes both factors faithfully in the pushout. In the abelianization \(q\) has relation \(4q=0\), \(2c=0\), and \(m(c+2q)=0\). Since \(m\) is odd and \(2(c+2q)=0\), one has \(c=-2q\) and the abelianization is \(C_4\). For the ordinary quotient, imposing \(c=1\) gives \(q^2=1\) by oddness of \(m\), and then \(b=1\) as well. The resulting ordinary group is \(C_2\).

**Certificate and infinity proof.** Use the set \(\mathcal S=\mathbb Z\times(\mathbb Z/m)\times\{0,1\}\), with the residue \(j\) represented in \(\{0,\ldots,m-1\}\). With ordinary function composition from right to left, take
\[
\begin{aligned}
c(n,j,e)&=(n,j+1-2e\bmod m,1-e),\\
q(n,1,e)&=(n+1,0,1-e),\\
q(n,0,e)&=(n-1,1,e),\\
q(n,j,e)&=
\begin{cases}
(n+1,j,e)&j\ge2,\ n\ \mathrm{even},\\
(n-1,j,1-e)&j\ge2,\ n\ \mathrm{odd}.
\end{cases}
\end{aligned}
\]
Directly \(c^2=1\) and \(q^2=v\) flips \(e\) while fixing \((n,j)\). Therefore \(q\) has order four. The composition \(cv\) fixes \((n,e)\) and shifts \(j\) by \(-1+2e\), hence has order \(m\). Its \(m\) powers have distinct images of \((0,0,0)\), and their compositions with \(c\) give another \(m\) images with \(e=1\). This proves that the dihedral factor survives with order \(2m\). The word \(q c\) sends \((n,0,0)\) to \((n+1,0,0)\) for every \(n\). Its iterates are all distinct, so each \(G_1(d)\) is infinite.

The checker exhausts only \(n\bmod2\), \(j\bmod m\), and \(e\) to verify these identities and the reverse substituted E02 relators. The permutations commute with \(n\mapsto n+2\), so equality on both residue classes of \(n\), with the output integer checked exactly, proves the equality on \(\mathcal S\).

## Verification scope

**Certificate.** The standalone verifier reads the signed tables on \(F,L,b,c,F^{-1},L^{-1},b^{-1},c^{-1}\). It checks inverse edges, reachability, the original relators on every row, and consistency with the \(2k\) upper-bound forms. To verify the upper reduction, it treats \(b_1,b_{\mathrm{top}},c_{\mathrm{top}},\lambda_L,\lambda_F\) as temporary letters with explicit definitions. For each word equality in the proof chain it compares the cyclically reduced difference word to a cyclic permutation of a previously justified relation or its inverse. Each link therefore holds in the presented group. The only coset tables used are the two explicit finite actions. No enumeration or link search ran. The infinity proof uses the action above and the finite check on its residue classes. No recognition or Lean proof is supplied by the calculation. [Verifier](../numerics/e03_check.py)
