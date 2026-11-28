# SP4-CERT-E04 · The marked order-seventeen even closing

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E packet. The launch configuration is GPT-6.2 Sol / ultra. Independent backend model and effort metadata are unavailable. Checkout `6a422ce7814fe1ad278d6904970e3b19b05a9890`. The [packet return](../research-progress/handoffs/RETURN_CERT_E04_20261127.md) records the inspected file versions and retrieval bounds.

## 1. Marked presentation at $d=17, s=0$

Work throughout with smooth oriented manifolds and oriented three-orbifold fillings. Let $Y=S^3/(Q_8\times C_{17})$, with $(u,z^r)q=uqz^{-r}$, $z=e^{2\pi i/17}$. The period-six monodromy of $Y$ is induced by $J(q)=Bqj^{-1}$, $B=(1+i+j+k)/2$. Use the mapping torus $N=(Y\times[0,1])/((y,1)\sim(Jy,0))$, with its period-six suspension circle action. Take $p_0jp_0^{-1}=(i+j+k)/\sqrt3$ and the actual section $\gamma(t)=[p_0e^{j\pi t/6},t]$. Let $O=Y/\langle J\rangle$ and $\ell$ be the projected section in its regular stratum. Use the positive normal meridian $\mu$ of $\ell$. The E39 longitude $a$ follows $C=p_0e^{j\mathbb R}$ by $+\pi/6$ while rotating its Euclidean normal frame by $-5\pi/6$. This fixes $s=0$ and the name even for surgery on $\gamma$ in the resulting normal three-framing. [First master, even prism section](../../../master/manuscript/claude/even_prism_closing.tex) · [E39, canonical suspension and marking](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E39_PRISM_FILLINGS.md#the-canonical-suspension-and-the-actual-marked-torus)

In E70 the positive meridians of the two ordinary surgery components are $F,L$, and $b,c$ are the positive bottom meridians of the old order-two strands. The ball longitude of $L$ is $a+\mu$, so its killing slope for $a$ is $-\mu_L+\lambda_L$. Below $f_P$ is the outer pillowcase word, and $S^1_f$ will denote the suspension orbit direction in the four-manifold. Use $[u,v]=uvu^{-1}v^{-1}$ and compose permutation products rightmost first.

Define in the free group on $F,L,b,c$

\[
\begin{gathered}
b_1=LbL^{-1},\qquad b_T=Fb_1F^{-1},\qquad c_T=FcF^{-1},\\
\lambda_F=c^{-1}b^{-1}L^{-1},\qquad \lambda_L=b_1^{-1}F^{-1},\qquad
d_P=bb_T,\qquad f_P=c_Tb_T.
\end{gathered}
\]

Let $P_0$ be the group on these four generators with the seven relators

\[
 b^2,\quad c^2,\quad [F,\lambda_F],\quad [L,\lambda_L],\quad
 d_P^2f_P^{-3},\quad F^3\lambda_F^{-2},\quad L^{-1}\lambda_L .
\]

This is a transcription of the conditional presentation $\pi_1^{\rm orb}(O(a))\cong P_0$, with the old singular knot retained and the new dual core regular. The equality identifying the marked orbifold with this presentation is a working geometric premise. [E70 §§2–4, tangle, signed peripheral words and eliminations](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E70_EQUIVARIANT_SURGERY.md) · [E73, signed crossing replay](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E73_FIRST_GROUP_REPLAY.md#signed-crossing-check-and-the-first-group) · [check_05, typed words and prior order-six check](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_05_prism_groups.py)

## 2. Reversible word certificate

In the following calculation an equation for a relator means that the relator equals $1$.

1. In the free group $L^{-1}\lambda_L=b^{-1}L^{-1}F^{-1}=(FLb)^{-1}$. With $b^2=1$, the $L$-filling relator is equivalent to $FL=b$, or $L=F^{-1}b$. The $L$-longitude commutation follows from $\lambda_L=L$.
2. Substitution gives $L^{-1}=bF$, $b_1=F^{-1}bF$, $b_T=b$ and $\lambda_F=c^{-1}F=cF$.
3. The equality $[F,cF]=[F,c]$ holds in the free group on $F,c$. With that relator and $c^2=1$, $F^3(cF)^{-2}=F^3F^{-2}c^{-2}=F$. Thus imposing the $F$-filling relator is equivalent to $F=1$ in this step.
4. Now $L=b, b_1=b_T=b, c_T=c, \lambda_L=b, \lambda_F=c$, so $d_P=1$ and $f_P=cb$. The outer relator equals $(cb)^{-3}$.

Conversely in $D=\langle b,c\mid b^2,c^2,(cb)^3\rangle$, take $F=1,L=b$. The dependent words have the values in step 4, the two longitude commutators are $[1,c]$ and $[b,b]$, the $F$-filling is $c^{-2}=1$, and the $L$-filling is $b^{-1}b=1$. The outer relator is $(cb)^{-3}=1$. The generator maps $D\to P_0$ and $P_0\to D$ fix $b,c$. On $F,L$, their composite agrees with the identities $F=1,L=b$ in $P_0$. These maps are inverse.

**Upper order witness.** Set $r=cb$, so $r^3=1$, $b=cr$ and $crc=r^{-1}$. Every word is a product of $b,c$ since they are involutions. Starting at $1$, the following right multiplications keep the six forms $r^j c^\epsilon$ with $j\in\mathbb Z/3$ and $\epsilon\in\{0,1\}$.

| Form | Multiply by $b$ | Multiply by $c$ |
| --- | --- | --- |
| $r^j$ | $r^{j-1}c$ | $r^jc$ |
| $r^jc$ | $r^{j+1}$ | $r^j$ |

**Lower order witness.** In $S_3$, use $F\mapsto 1, L\mapsto (12), b\mapsto (12), c\mapsto (23)$. The dependent words above give the images of all seven relators as identity. The image of $r$ is $(132)$, whose three powers are distinct and even, and their products with $(23)$ are distinct and odd. These are the six permutations, so the map is surjective and $P_0\cong S_3$. [Exact finite-model checker](../numerics/e04_prism_certificate.py)

**Evidence.** The word identities and normal-form bound constitute a working project theorem for the transcribed presentation, with prior replays in E73 and E79. The six permutation images constitute the finite lower-bound certificate. The checker confirms those images, all seven relators and the transition table in the six-element model. The upper bound in the abstract presentation follows from the word identities.

## 3. Central extension and degree-one conjugacy

**Working project theorem.** Let $\Pi$ be a group with abelianization identified with $\mathbb Z$, let $\deg\colon\Pi\to\mathbb Z$ be that map, and let $h$ be central. Suppose $\Pi/\langle h\rangle\cong S_3$. Then

\[
 |\deg h|=2,\qquad [\Pi,\Pi]\cong C_3,\qquad
 \Pi\cong C_3\rtimes_{\rm inv}\mathbb Z
\]

as a group over $\mathbb Z$, and all degree-one elements are conjugate by elements of $C_3$.

Indeed the abelianization of the quotient is $\mathbb Z/\langle\deg h\rangle\cong C_2$, so $h$ has infinite order and $\deg h=\pm2$. Under the quotient map the commutator subgroup maps onto $A_3$. Its kernel is its intersection with $\langle h\rangle$, which is trivial because powers $h^m$ have degree $m\deg h$. Choose $t$ of degree one. The homomorphism $n\mapsto t^n$ splits the degree map. The image of $t$ is odd, hence a transposition, and conjugation by $t$ acts by inversion on the commutator subgroup. For a generator $v$ of that $C_3$, $v^k t v^{-k}=v^{2k}t$. In the pair model with product $(i,n)(j,m)=(i+(-1)^n j,n+m)$, a conjugator sending $(i,1)$ to $(j,1)$ is $(2(j-i),0)$, with the first coordinate modulo three.

If an element $e$ satisfies $e^2=h^{\pm1}$, then $|\deg e|=1$. Choose its orientation so $\deg e=1$. It is conjugate to any given degree-one $\delta$. This conclusion applies to fundamental-group classes using one basepoint and paths to the loops. In the geometric setting these paths may be changed by conjugation.

## 4. Marked smooth implication for the formal side

**Working project theorem, conditional on the listed geometry and import.** Take the order-seventeen suspension and its actual section and longitude of §1. Suppose the marked geometry below holds and $\pi_1^{\rm orb}(O(a))\cong P_0$ via that marking. Then the $a$-framed surgery on $\gamma$ produces an oriented smooth four-manifold $\Sigma_{\rm ev}(17)\cong S^4$.

The geometric inputs and the proof steps to formalize are as follows.

| Input or step | Marked statement and role |
| --- | --- |
| Suspension and first surgery | The period-six action is smooth and effective. The actual $\gamma$ projects diffeomorphically onto the embedded regular loop $\ell$, disjoint from the old order-two locus. The stable letter of $\pi_1 N=(Q_8\times C_{17})\rtimes\mathbb Z$ is $\gamma$, with the cycle $i,j,k$ and inversion on $C_{17}$, up to simultaneous reversal of the stable letter and monodromy. The first circle surgery kills the stable letter. The cycle identifies $i=j=k$, so $ij=k$ kills all three. Inversion kills the odd-order cyclic factor. The Euler characteristic rises from $0$ to $2$. Orientable duality and Hurewicz–Whitehead then give the homotopy-sphere condition. [E39](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E39_PRISM_FILLINGS.md#the-canonical-suspension-and-the-actual-marked-torus) |
| Relative torus replacement | In the chart $S^1_a\times D^2_\mu\times S^1_f$ with the actual section at constant fibre coordinate, the first surgery compresses $S^1_a\times\{0\}\times S^1_f$ to an embedded sphere $S_T$ with product normal disk. Surgery on $S_T$ gives $W_0$ with replacement $S^1_\mu\times D^2_a\times S^1_f$, relative to the outer torus and orbit action. The actual reverse attachment is the circle $\delta$ of the inserted $S^1_\mu\times D^3$ with its product framing. The resulting action on $W_0$ is effective and locally free, has quotient $O(a)$, retains the old $C_2$ exceptional orbit and is free over the new dual core. [E76, relative model](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E76_RECOGNITION_TRANSFER.md#actual-geometric-hypotheses-and-reverse-circle) · [E79, replay](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md#the-regular-tube-and-its-relative-replacement) |
| Marked orbifold presentation | Verify E70's quotient tangle and front-face basing, the outer meridian $2d_2-3f$, the $F$-fill $3\mu_F-2\lambda_F$, and $\lambda_L=a+\mu$. With the old $C_2$ isotropy and a regular new dual core these give precisely the words in §1. E73 checks the signed crossings and takes the underlying chart, longitude and endpoint correspondence from E70. This geometric identification is the residual diagram premise. [E70 §§1–3](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E70_EQUIVARIANT_SURGERY.md) · [E73, replay scope](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E73_FIRST_GROUP_REPLAY.md#signed-crossing-check-and-the-first-group) |
| Degree and quotient | Write $V=\Sigma_{\rm ev}(17)\setminus\operatorname{int}\nu S_T$. Excision, the Thom isomorphism and $H_2(\Sigma_{\rm ev}(17))=H_1(\Sigma_{\rm ev}(17))=0$ make the sphere meridian generate $H_1(V)=\mathbb Z$. The reattachment $S^1\times D^3$ sends that boundary generator to $[\delta]$, giving $H_1(W_0)=\mathbb Z$ with $\deg\delta=1$. The action cylinder makes the principal orbit $h$ central. The Borel classifying space $ES^1\times_{S^1}W_0$ models the orbit orbifold, so the principal bundle $S^1\to ES^1\times W_0\to ES^1\times_{S^1}W_0$ gives $\pi_1(W_0)/\langle h\rangle\cong\pi_1^{\rm orb}(O(a))$. Near the retained order-two orbit $e$, a principal orbit retracts to the double traverse of $e$, giving $e^2=h^{\pm1}$ with consistent basing. Apply §3, including orientation of $e$, to get the free homotopy from $\delta$ to $e$. [E76](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E76_RECOGNITION_TRANSFER.md#total-space-group-and-the-degree-of-a-principal-orbit) · [E79](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md#the-actual-group-and-the-retained-order-two-orbit) |
| Framed transfer and extension | Free homotopy through oriented loop maps gives a smooth ambient isotopy by parametric transversality and isotopy extension. The equal-time distinct-point domain is three-dimensional and the target diagonal has codimension four. The vanishing-tangent locus has codimension four on the two-dimensional parameter domain. Thus one can perturb relative to endpoint collars to a smooth family of embeddings and transport the actual normal framing. In an oriented product model of the $C_2$-slice, the action is $u\cdot(z,y)=(u^m z,R_{k\arg u}y)$, with $\lvert m\rvert=2$, odd $k$ and a fixed rotation axis. The two classes of oriented normal three-framings differ by one axial rotation as $z$ traverses the orbit, changing $k$ by $\pm m$. Choose one of these representatives for the transported framing class, using invariance of framed surgery under homotopy of the framing. In either class the cap action on $D^2\times S^2$ is $(w,x)\mapsto(u^mw,R_{k\arg u}x)$, with invariant radial collars matching the boundary action. A principal orbit survives in the complement and gives effectivity. This constructs the action on $\Sigma_{\rm ev}(17)$ recovered by the actual reverse attachment. [E79, framing and slice](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md#actual-reverse-framing-and-published-recognition) |

The two framing classes in the last row concern the **inverse surgery circle in $W_0$**. The initial circle $\gamma\subset N$ and its normal framing belong to the first surgery. The delivered recognition statement is solely for the initial framing represented by $a$. If the master’s characterization of $a$ by the underlying $S^3$ filling is used in the formal statement, include its agreement with the E39 marked longitude. In the E70 model, killing $b,c$ makes the ordinary quotient group trivial by §2.

**Published classification import for the ledger.** Galaz-García and Searle, *Nonnegatively curved 5-manifolds with almost maximal symmetry rank*, Geom. Topol. 18 (2014), §3.2, Theorem 3.2, p. 1404, give an equivariant diffeomorphism from a closed simply connected smooth four-manifold with a smooth circle action to a connected sum with factors $S^4,\ \pm\mathbb{CP}^2,\ S^2\times S^2$. Its hypotheses are closedness, simple connectivity, smoothness and the smooth action. For the action just constructed, $b_2=0$ and additivity of $b_2$ excludes all factors with positive second Betti number. Connected sum with standard $S^4$ gives standard $S^4$ here. A reflection of $S^4$ adjusts the orientation of a chosen diffeomorphism if needed. The publisher PDF theorem passage and its attribution were inspected. [Galaz-García–Searle, printed p. 1404](https://msp.org/gt/2014/18-3/gt-v18-n3-p05-s.pdf#page=8)

The named historical source dependencies are Fintushel, *Locally smooth circle actions on homotopy 4-spheres*, Duke Math. J. 43 (1976), pp. 63–70, and Pao, *Non-linear circle actions on the 4-sphere and twisting spun knots*, Topology 17 (1978), pp. 291–296. The Fintushel bibliographic record and the indexed Pao publisher abstract were available. The original theorem passages remain unverified in this packet. The smooth implication uses the published Theorem 3.2 statement, which attributes its result to Fintushel, Pao and the three-dimensional Poincaré theorem. [Fintushel DOI](https://doi.org/10.1215/S0012-7094-76-04306-4) · [Pao DOI](https://doi.org/10.1016/0040-9383(78)90033-2)

For a Lean proof, the geometric identifications and gluing statements in the table must be formalized or supplied with ledger premises. The usual infrastructure needed is smooth tubular neighbourhoods and isotopy extension, van Kampen and homology for surgery, duality and Hurewicz–Whitehead, the Thom isomorphism, the slice and Borel descriptions for the locally free action, and the connected-sum homology and standard $S^4$ identity. Those are separate from the finite certificate. The frozen packet provides the statement and proof obligations, with the group argument at working and replayed evidence levels.
